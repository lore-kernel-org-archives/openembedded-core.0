Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q7Vmb-0008Sy-9G
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 18:41:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id 1FC8155F4;
	Wed,  6 Apr 2011 18:38:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RvShQ2-vshB5; Wed,  6 Apr 2011 18:38:17 +0200 (CEST)
Received: from eha (0x55532124.adsl.cybercity.dk [85.83.33.36])
	(Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id 36F1551A5;
	Wed,  6 Apr 2011 18:38:17 +0200 (CEST)
Received: by eha (Postfix, from userid 1000)
	id 9B558A51C3; Wed,  6 Apr 2011 18:38:16 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk>
	<1302091554.22904.18.camel@rex>
	<87pqoz4lsp.fsf@eha.doredevelopment.dk>
	<1302095185.22904.31.camel@rex>
	<87lizn4is9.fsf@eha.doredevelopment.dk>
	<1302099589.22904.63.camel@rex>
Date: Wed, 06 Apr 2011 18:38:16 +0200
In-Reply-To: <1302099589.22904.63.camel@rex> (Richard Purdie's message of
	"Wed, 06 Apr 2011 07:19:49 -0700")
Message-ID: <87d3kz8hdz.fsf@eha.doredevelopment.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 16:41:06 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2011-04-06 at 15:21 +0200, Esben Haabendal wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> 
>> > On Wed, 2011-04-06 at 14:16 +0200, Esben Haabendal wrote:
>> > I actually believe the core in OE is well suited to multilib support and
>> > using it will show off some of the power in the OE architecture as I
>> > think we can do it better than anyone else before!
>> 
>> The one thing that in my experience pushes most people in other
>> directiosn than OE is the complexity.  Unless OE made simpler, I think
>> it will be quite hard to reach the goal of significantly reducing the
>> number of build systems.
>>
>> I am uncertain to what effect multilib in OE will have (positive and
>> negative), but it is clearly not making OE simpler.
>>
>> I just kind of makes things a bit ehmm... hopeless that the requests I
>> (and others with similar customers) hear from companies are considered
>> out of line for OE evolution, whereas the requests you and others hear
>> can be used as valid arguments for which directions to take.
>> 
>> It is not that I think it will add considerable burden, but is just yet
>> another brick to the wall to pass for developers trying to understand
>> OE.
>
> Nobody is saying requests for simplicity or ease of use are out of line,
> far from it. Its something that is being worked on by Yocto quite
> heavily. What does differ is the approach though, yours is to rip out
> anything you personally don't need,

That's not fair.  While I do "rip out" (to use your choice of colorful
term) stuff in OE-lite, I do and did not proppose to rip out any
features from OE.  I did comment that sstate as a pice of code might not
be give as much value if some of the concepts from OE-lite were
implemented.

> Yocto is taking a more reasoned approach to this and asking questions
> like:

Sorry, but I must take offence on that remark.  I do not feel that your
approach is anymore reasoned than mine.  It is different, and you
clearly prefer your approach, I don't question that.

> "What can we do to make things easier for new users?"
> "Can we make error messages more user friendly?"
> "What code do we have that is needlessly complex and can be simplified?"
> "If we are going to add a new feature, how was we reuse existing
> established concepts?"
> "If something is complex and hard to understand but required, how can we
> document or better explain the concepts to people?"
>
> I'd go as far as to say that things are getting more understandable and
> easier too. Yocto ran an alpha test programme where we took a selection
> of people, some with experience and some with no experience of
> embeddded, pointed them at the quick start guide and asked them to build
> an image, boot it and experiment. The results of this programme with
> Yocto 1.0 are orders of magnitude better than 0.9. This at least shows
> the new user experience is better than it was. Its not the only area
> that needs improvement and there is a long way to go but its a very
> positive start IMO.

Yes, that is measuring Yocto "user" usability.

I am at least as much concerned with long-time developer usability.
Given the amount of long-time developers normally available in OE, I
find it disappointing that at any time, almost noone (at most a very
small handful) dares to comment on RFC's touch core parts, such as
BitBake and gcc/glibc recipes.  I am firmly convinced that "we" (whoever
that might be) can do better than that.  I also believe that this is one
of the biggest reasons that there are so many embedded Linux
buildsystems.  Most people agrees that OE is among (if not the) most
advanced embedded Linux build system, but many of them end up using some
of the simpler tools.  With careful design, and constant refactoring, I
believe that you can lead in both features and simplicity, but you have
to accept that code and design concepts will be discarded when something
better turns up.

/Esben



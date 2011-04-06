Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7Tcj-0001dE-Tm for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 16:22:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36EK7Ww019121;
	Wed, 6 Apr 2011 15:20:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18646-06; Wed,  6 Apr 2011 15:20:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36EJs2Z019101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Apr 2011 15:19:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Esben Haabendal <eha@dev.doredevelopment.dk>
In-Reply-To: <87lizn4is9.fsf@eha.doredevelopment.dk>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk> <1302091554.22904.18.camel@rex>
	<87pqoz4lsp.fsf@eha.doredevelopment.dk> <1302095185.22904.31.camel@rex>
	<87lizn4is9.fsf@eha.doredevelopment.dk>
Date: Wed, 06 Apr 2011 07:19:49 -0700
Message-ID: <1302099589.22904.63.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky <poky@yoctoproject.org>, Patches,
	layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 Apr 2011 14:22:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 15:21 +0200, Esben Haabendal wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> > On Wed, 2011-04-06 at 14:16 +0200, Esben Haabendal wrote:
> > I actually believe the core in OE is well suited to multilib support and
> > using it will show off some of the power in the OE architecture as I
> > think we can do it better than anyone else before!
> 
> The one thing that in my experience pushes most people in other
> directiosn than OE is the complexity.  Unless OE made simpler, I think
> it will be quite hard to reach the goal of significantly reducing the
> number of build systems.
>
> I am uncertain to what effect multilib in OE will have (positive and
> negative), but it is clearly not making OE simpler.
>
> I just kind of makes things a bit ehmm... hopeless that the requests I
> (and others with similar customers) hear from companies are considered
> out of line for OE evolution, whereas the requests you and others hear
> can be used as valid arguments for which directions to take.
> 
> It is not that I think it will add considerable burden, but is just yet
> another brick to the wall to pass for developers trying to understand
> OE.

Nobody is saying requests for simplicity or ease of use are out of line,
far from it. Its something that is being worked on by Yocto quite
heavily. What does differ is the approach though, yours is to rip out
anything you personally don't need, Yocto is taking a more reasoned
approach to this and asking questions like:

"What can we do to make things easier for new users?"
"Can we make error messages more user friendly?"
"What code do we have that is needlessly complex and can be simplified?"
"If we are going to add a new feature, how was we reuse existing
established concepts?"
"If something is complex and hard to understand but required, how can we
document or better explain the concepts to people?"

I'd go as far as to say that things are getting more understandable and
easier too. Yocto ran an alpha test programme where we took a selection
of people, some with experience and some with no experience of
embeddded, pointed them at the quick start guide and asked them to build
an image, boot it and experiment. The results of this programme with
Yocto 1.0 are orders of magnitude better than 0.9. This at least shows
the new user experience is better than it was. Its not the only area
that needs improvement and there is a long way to go but its a very
positive start IMO.

Cheers,

Richard




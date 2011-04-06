Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q7SiD-0001fI-9v
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 15:23:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id 97ED155F4;
	Wed,  6 Apr 2011 15:21:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0B1Ye5uEwiAx; Wed,  6 Apr 2011 15:21:43 +0200 (CEST)
Received: from eha (unknown [192.168.18.101]) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id 25B3251A5;
	Wed,  6 Apr 2011 15:21:42 +0200 (CEST)
Received: by eha (Postfix, from userid 1000)
	id 9E2B5A520B; Wed,  6 Apr 2011 15:21:42 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk>
	<1302091554.22904.18.camel@rex>
	<87pqoz4lsp.fsf@eha.doredevelopment.dk>
	<1302095185.22904.31.camel@rex>
Date: Wed, 06 Apr 2011 15:21:42 +0200
In-Reply-To: <1302095185.22904.31.camel@rex> (Richard Purdie's message of
	"Wed, 06 Apr 2011 06:06:25 -0700")
Message-ID: <87lizn4is9.fsf@eha.doredevelopment.dk>
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
X-List-Received-Date: Wed, 06 Apr 2011 13:23:57 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2011-04-06 at 14:16 +0200, Esben Haabendal wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> 
>> > On Wed, 2011-04-06 at 09:08 +0200, Esben Haabendal wrote:
>> >> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> >> 
>> >> > One of the items on our post 1.0 schedule is multilib and we need a plan
>> >> > of implementation. I've been thinking about this for a while and at
>> >> > least have some ideas how some of the issues can be handled.
>> >> > ....
>> >> > Does this make sense to everyone, are there any questions/ objections/
>> >> > concerns/ things I've missed?
>> >> 
>> >> Which actual OE use-cases justify this kind of addition to OE?
>> >
>> > Several people wanting to use OECore have a requirement of multilib
>> > support.
>> 
>> Just out of curiosity, could you come with some examples of such
>> people or projects?
>
> Well, you've seen Koen's reaction to the prospect of multilib support,
> there is one example. I've given x32 as another at the start of this
> thread. Its an issue I keep hearing about from companies too.
>
> Fundamentally, multilib is one of the biggest remaining weaknesses of
> the OE architecture.
>
> One of Yoctos objectives is to reduce the number of
> build systems out there and to do this, we need to make one good fully
> featured one. Until OE has multilib support there is a functionality
> gap. I don't see any technical reason OE can't support mulitlibs and I
> don't believe the complexity is high either, we just need to tweak some
> things. 
>
> I actually believe the core in OE is well suited to multilib support and
> using it will show off some of the power in the OE architecture as I
> think we can do it better than anyone else before!

The one thing that in my experience pushes most people in other
directiosn than OE is the complexity.  Unless OE made simpler, I think
it will be quite hard to reach the goal of significantly reducing the
number of build systems.

I am uncertain to what effect multilib in OE will have (positive and
negative), but it is clearly not making OE simpler.

I just kind of makes things a bit ehmm... hopeless that the requests I
(and others with similar customers) hear from companies are considered
out of line for OE evolution, whereas the requests you and others hear
can be used as valid arguments for which directions to take.

It is not that I think it will add considerable burden, but is just yet
another brick to the wall to pass for developers trying to understand
OE.

Anyways, you asked and I raised my concern.

/Esben



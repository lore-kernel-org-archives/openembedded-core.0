Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q7RhH-0006dh-AQ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 14:18:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id B238455F4;
	Wed,  6 Apr 2011 14:16:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 454TYtRUr3Zl; Wed,  6 Apr 2011 14:16:38 +0200 (CEST)
Received: from eha (unknown [192.168.18.101]) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id 9167C2CC8;
	Wed,  6 Apr 2011 14:16:38 +0200 (CEST)
Received: by eha (Postfix, from userid 1000)
	id 46F21A51D4; Wed,  6 Apr 2011 14:16:38 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk>
	<1302091554.22904.18.camel@rex>
Date: Wed, 06 Apr 2011 14:16:38 +0200
In-Reply-To: <1302091554.22904.18.camel@rex> (Richard Purdie's message of
	"Wed, 06 Apr 2011 05:05:54 -0700")
Message-ID: <87pqoz4lsp.fsf@eha.doredevelopment.dk>
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
X-List-Received-Date: Wed, 06 Apr 2011 12:18:55 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2011-04-06 at 09:08 +0200, Esben Haabendal wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> 
>> > One of the items on our post 1.0 schedule is multilib and we need a plan
>> > of implementation. I've been thinking about this for a while and at
>> > least have some ideas how some of the issues can be handled.
>> > ....
>> > Does this make sense to everyone, are there any questions/ objections/
>> > concerns/ things I've missed?
>> 
>> Which actual OE use-cases justify this kind of addition to OE?
>
> Several people wanting to use OECore have a requirement of multilib
> support.

Just out of curiosity, could you come with some examples of such
people or projects?

> The typical embedded use case is where you have one main
> application which you might want to run in some kind of large memory
> mode or with some special optimisation (think a database engine) whilst
> the rest of the system is "standard". This requires the ability to mix
> different libraries.
>
>> I know it is on the Yocto post 1.0 schedule, but is it actually a good
>> thing for OE?  Maintaining OE recipes is clearly not going to get any
>> easier with multilibs support.
>
> As detailed in the proposal you will see that the complexity added is
> minimal. It requires a simple enhancement to BBCLASSEXTEND which is
> likely desirable for other reasons too and that is the only real bitbake
> change required. For the metadata, individual recipes remain unaffected
> and also the core conf files are unchanged too.

I thought that all recipes (fx. library recipes) involved in a multilib
build must have the appropriate multilib parts put in BBCLASSEXTEND, and
after that, anybody touch that recipe is suddenly faced with having to
take care not to break multilib builds (which most developers probably
will not really care for).

> The toolchain dependency changes will be the only change affecting
> users at the recipe level and most of the class/machine configuration
> will be opt in by anyone using multilib. The only other invasive
> change is the package manager integration. For rpm, it has good
> support for multilib already and we're just enabling that. For opkg,
> we still need to determine the best approach but the simplistic
> approach I mentioned will probably suffice and anyone wanting true
> support at the package manager level can use rpm.
>
> For day to day recipe maintenance I don't see much direct impact.

I guess time will show...

/Esben



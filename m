Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q7Mya-0007w5-GM
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 09:16:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id 334E364F0;
	Wed,  6 Apr 2011 09:08:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id imSjWXmEPrq2; Wed,  6 Apr 2011 09:08:32 +0200 (CEST)
Received: from eha (unknown [192.168.18.101]) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id 505BE2CC8;
	Wed,  6 Apr 2011 09:08:32 +0200 (CEST)
Received: by eha (Postfix, from userid 1000)
	id ECD6CA51B0; Wed,  6 Apr 2011 09:08:31 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1302001365.24596.459.camel@rex>
Date: Wed, 06 Apr 2011 09:08:31 +0200
In-Reply-To: <1302001365.24596.459.camel@rex> (Richard Purdie's message of
	"Tue, 05 Apr 2011 12:02:45 +0100")
Message-ID: <87y63n5028.fsf@eha.doredevelopment.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Cc: poky <poky@yoctoproject.org>
Subject: Re: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 07:16:28 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> One of the items on our post 1.0 schedule is multilib and we need a plan
> of implementation. I've been thinking about this for a while and at
> least have some ideas how some of the issues can be handled.
> ....
> Does this make sense to everyone, are there any questions/ objections/
> concerns/ things I've missed?

Which actual OE use-cases justify this kind of addition to OE?

I know it is on the Yocto post 1.0 schedule, but is it actually a good
thing for OE?  Maintaining OE recipes is clearly not going to get any
easier with multilibs support.

/Esben



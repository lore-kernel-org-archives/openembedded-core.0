Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjY2Z-00076a-46 for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:46:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEgHvs023620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:42:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22788-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:42:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEg910023614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:42:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CACW_hTb=t9hMoVc-3F538xn1kTwrGT7-wk7DW8FTmi6=Txmvpg@mail.gmail.com>
References: <1311154909.30326.51.camel@phil-desktop>
	<CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>
	<4E26D87A.5020808@gmail.com>
	<CACW_hTb=t9hMoVc-3F538xn1kTwrGT7-wk7DW8FTmi6=Txmvpg@mail.gmail.com>
Date: Wed, 20 Jul 2011 15:42:06 +0100
Message-ID: <1311172926.2344.49.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 14:46:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 16:26 +0200, Frans Meulenbroeks wrote
>         there is already patch sent to fix it.
>         http://patches.openembedded.org/patch/7933/
>         libiconv is not default provider of virtual/libiconv on
>         eglibc/glibc based systems and sometimes that can trip you
>         over. It happens and as long as we find it and fix it quickly
>         I don't see a problem. Do you ? 
> Some people seem to think differently about this. I still recall the
> pile of shit Koen dumped upon me about a year ago when I accidentally
> removed a version of openssh or so that was still used. Even though
> the problem was fixed very quickly after it was brought to my
> attention. Ah well. As Orwell already said "all animals are equal but
> some animals are more equal than others".
> 
>         
>         IMO we should not get so pedantic that people start getting
>         scared of making changes
> 
> It was by no means my intention to be pedantic.
> 
> Then again I *do* think it is good practice if someone creates a new
> recipe that (s)he tests it before submitting it.
> 
> And my impression was that one of the goals of YP and oe-core was to
> increase the quality level.
> One of the ways to increase quality is to do a build after pulling
> changes and before committing them.
> (at least I feel that is one of the ways to increase quality, and yes
> there are other ways too).
> 
> And where people work, mistakes happen. One can accept that, but one
> can also see if there are ways to improve and avoid that a problem
> re-occurs.

I think its fair to ask how this happened and it appears to be due to
PREFERRED_VERSION and/or PROVIDER confusion. Its unfortunate but I think
the people involved will not do it again :).

I don't think its entirely fair to immediately bring into question the
overall quality goals as we are continuing to work towards those and
this is an exception, not the norm.

Cheers,

Richard




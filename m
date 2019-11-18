Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2300C7F523
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 21:05:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47H1gR5LBQz9n;
	Mon, 18 Nov 2019 22:05:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574111108;
	bh=Ash/Je3WvKmUXQSj9R19XHWgu6PTruVcTcSsZfbC5XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIBErDLetNKCVpo39++pRleXVDHs8S+G++V31gAncyxZQUjhl/XaCReojeZ2+JohU
	Gd7z8NdOC/ZsX3vfyhlMf52+0o3FRFb6gCZsaLxr0M41PKd9Wmp0ePsOYhwVGMeBH3
	9GHSV9LfYmFduViWOI8yKoxeq1Dh756K67W96ovSoyU4Q6FPzpt7oCaWFstYW3pPG/
	opBepveHeZSE5GaGK4NiNj+fGcMwspIRbAyD1mD8wt4ehzNnVU/MEvkKxFz21y48hZ
	HMQ+P38zNrmvAXIMKps8QwzamgKqZFBMM1DbHhRzhewTJoOpfG/oQUYqJfOQ1aYRWO
	oCIoeuR9fS7v6OTF4hZtsMNkJLjMsiYH3dmQQwnQjoNTPlVzgsPKgUV8PaT46w/u20
	4huRL4pjiJilEyNmNznFQTbISMaD7CrBl4TC1xMhiWOEsDYIzFHCLBeV9OsGgd+n8Z
	9bBMeqWhoZhdZkMTxrUBXm7DGtPAn9rMT19khUjGT4vZey7wDMPr+w8UNHGPBhHL+R
	sHBOcaLJaDrLJESm4yyIQHsdbI6hnF3Wf80EbB1yQEi+NxYem4FzMCvM7sGBtX0CHX
	81DyQ3bIEyLB5KoDRL4MJsj21Wwixgwyi4KYHpI4XL+sYf6NYf3DmYPmt7Cd28rEkv
	+8kukOWToFRCVZ7uCpMri6+Y=
Date: Mon, 18 Nov 2019 23:05:00 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191118210500.GA4741@localhost>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 21:05:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Drop backports, rebase a couple of patches.
> >
> > This is the second last release of py 2.x; upstream support ends on
> > 1 January 2020, there will be one final 2.x afterwards.
> >
> > Note that the only thing that still needs python 2.x in oe-core is
> > u-boot; when the next u-boot update arrives, we should find out
> > where the py3 migration is for that component before merging the
> > update.
> 
> I guess u-boot need it during build, in that case defer it to user to
> have python2 on build host
> could be possible.
>...

That's a non-option since it could mean
"Yocto 3.1 cannot be built on Ubuntu 20.04".

Ubuntu 20.04 might end up still shipping Python2,[1]
but you cannot rely on future distributions shipping it.

cu
Adrian

[1] it is not clear whether the Python2 removal in Ubuntu
    will be finished in time for 20.04


Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1770.1615853552642106800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 17:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A4E240C1C;
	Tue, 16 Mar 2021 00:12:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Km-XPhpUjC_k; Tue, 16 Mar 2021 00:12:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D86BE40A47;
	Tue, 16 Mar 2021 00:12:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9B174174543; Mon, 15 Mar 2021 20:12:29 -0400 (EDT)
Date: Mon, 15 Mar 2021 20:12:29 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
Message-ID: <20210316001229.GT4892@denix.org>
References: <a8c3bbca-1b5c-5353-9a0a-c7ecebc2fc32@broadcom.com>
 <CAMKF1spkj4K91vNUhu5+vEaujZ+odAyMYEkyWqnvSCct2Grung@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spkj4K91vNUhu5+vEaujZ+odAyMYEkyWqnvSCct2Grung@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 04:49:34PM -0700, Khem Raj wrote:
> On Mon, Mar 15, 2021 at 4:40 PM Scott Branden via
> lists.openembedded.org
> <scott.branden=broadcom.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > There seems to be a problem when a kernel module is added to an initramfs 
> > image.
> >
> > As soon as I add a recipe which installs an external kernel module into an 
> > initramfs image it automatically installs the linux kernel image in a 
> > /boot directory.
> >
> > This is really bad as it increases the size of the initramfs image.
> >
> > /boot/Image should not be installed in the image when an external kernel 
> > module is added to an image.
> >
> > Can someone suggest a fix to this issue?
> >
> 
> try
> 
> IMAGE_INSTALL_remove = "kernel-image-${KERNEL_IMAGETYPE}"

Kernel image won't be in IMAGE_INSTALL list, but rather in rdeps chain.


> or set
> 
> KERNEL_IMAGE = ""

No such variable.


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

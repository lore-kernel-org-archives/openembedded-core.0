Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 32F7061A06
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 16:56:18 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m25so7630352edq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 08:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5JXWHh/J64gCoAEQb5FaRlv15MJHBPcliBFpT0uTCeo=;
	b=gfPO9Wqzp60VsPaqJHp7oWdKDVLeF7P9bTuvWblUuIIqQFdyPm1XsrMe3M3BEQzh8v
	Rs/CBXdWoR2mNbw+4NtG1XLxDpPfr3Vh7PGSfjh5A5rKwI2lm0Hm7amJWpTEULBzg5V/
	fVdbV9ZolIprmh8L8iOwGPmEvkfSSs+YJLLKkQb+Lp4p2NAQ1XRLmICY4jTNKI5d94Fp
	eGO6E99Qs04IYyPGJ9IhKki3xp9FCPTmJOVCKMtQnvILs3mnGJ02QnxV6+kJHLA4Yojx
	hvji5GYO4ntck1Ivqu//ZczFSWsylmXwM36qyUSMaIe7Ok5tozmB8b4hh9MQCECyr9kg
	hxIw==
X-Gm-Message-State: ANhLgQ1pRgfA5gWOfcE5iy5Bm8gfszgPHb3PRYrl6wm0UwT51aSwC+nG
	YgPpVXp9ez030egeCLEl8as=
X-Google-Smtp-Source: ADFU+vsJePzIBBI2KxV/xG8IfiqEabydMRyCKRXMBJlcD99ejRWg6ZcfqQi0XuqOFKemwULSwEWtLQ==
X-Received: by 2002:a50:fb8f:: with SMTP id e15mr9553272edq.239.1583427378779; 
	Thu, 05 Mar 2020 08:56:18 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	d16sm2105704eds.18.2020.03.05.08.56.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 08:56:18 -0800 (PST)
Message-ID: <bb5bac4f73c97d4056aa89464fe97cd021c87f05.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 05 Mar 2020 16:56:17 +0000
In-Reply-To: <CANNYZj_-om40Ejv2e8TpajUW=yhsedkyjPEJWi=BaY-qMvcw-Q@mail.gmail.com>
References: <20200304101307.31198-1-alex.kanavin@gmail.com>
	<e4bb4e709193acf371cf4c5afce4e6a8d1936a52.camel@andred.net>
	<CANNYZj_-om40Ejv2e8TpajUW=yhsedkyjPEJWi=BaY-qMvcw-Q@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: use 'make install' for installation
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
X-List-Received-Date: Thu, 05 Mar 2020 16:56:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-03-05 at 17:44 +0100, Alexander Kanavin wrote:
> Right I think this should be easy to fix, we need to copy LICENSE.* manually. I'll get to it soon.
> 

Keep in mind there's different spelling, and two more files :-)
This works for me:

+        cp -r GPL-2 LICENCE.* LICENSE.* WHENCE ${D}${nonarch_base_libdir}/firmware/


Cheers,
A.

> Alex
> 
> On Thu, 5 Mar 2020 at 17:20, André Draszik <git@andred.net> wrote:
> > On Wed, 2020-03-04 at 11:13 +0100, Alexander Kanavin wrote:
> > > Copying the source tree over was missing important symlinks
> > > that since recent updates can only be created with make install.
> > 
> > Thanks for the quick fix Alex, but unfortunately now all the -license packages
> > are non-existent and image creation fails, because their install: target
> > doesn't copy the license files.
> > 
> > Cheers,
> > Andre'
> > 
> > > 
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  .../linux-firmware/linux-firmware_20200122.bb | 22 +------------------
> > >  1 file changed, 1 insertion(+), 21 deletions(-)
> > > 
> > > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-
> > firmware/linux-
> > > firmware_20200122.bb
> > > index 0d1422cfca..f7198cb56a 100644
> > > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> > > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> > > @@ -208,27 +208,7 @@ do_compile() {
> > >  }
> > >  
> > >  do_install() {
> > > -     install -d  ${D}${nonarch_base_libdir}/firmware/
> > > -     cp -r * ${D}${nonarch_base_libdir}/firmware/
> > > -
> > > -     # Avoid Makefile to be deployed
> > > -     rm ${D}${nonarch_base_libdir}/firmware/Makefile
> > > -
> > > -     # Remove unbuild firmware which needs cmake and bash
> > > -     rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
> > > -
> > > -     # Remove pointless bash script
> > > -     rm ${D}${nonarch_base_libdir}/firmware/configure
> > > -
> > > -     # Remove python script used to check the WHENCE file
> > > -     rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
> > > -
> > > -     # Libertas sd8686
> > > -     ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_libdir}/firmware/sd8686.bin
> > > -     ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
> > > -
> > > -     # fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
> > > -     ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
> > > +        oe_runmake 'DESTDIR=${D}' install
> > >  }
> > >  
> > >  
> > > -- 
> > > 2.25.1
> > > 
> > 



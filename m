Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E657F7CE63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:53:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u10so2570653wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=cczXXo5PPyNK+zfAmDP711q3oomEapu4p7KXxTM5sPk=;
	b=UbcYl2x0HeS/A6yQuA0ukJHHkbm/tC7UCafDuFsNpEw6GoQqzkwjvhoRZNRRSt28me
	QKug+3TpuQXJldHXtyoO5Zw16kawSh4GK59UsX52cUxQkkWRf0ETXRaOKo2a39MbiKa5
	Yi9WAT1+WLkYJLUjXGASkTF7w5Ts0djKSCPvrpi//4y11uSQ9Uy2U5a5eWQVR9SJID/O
	b1l/CStHuZYd5m8YL6Bk7mS4F0BTGbkYzhPVrIX1TrEcdLTlWuxb5TDdsnBF5nwL963Y
	cLcudGaviyAXEA+yM2bMloIsz+/Z+f3R6bEeurSbwneSYmDyiSrD1mf4PZHbCfteHuIS
	32FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cczXXo5PPyNK+zfAmDP711q3oomEapu4p7KXxTM5sPk=;
	b=EtnbpjJsrQz+OkIewI3AN5f4zyvbu2KaQnOx6Bjfyn/O1JYWXpG975wZzOD4gEpnYV
	8X9jaTcnUVhLuPv2NpTynDNTbvHXS5KrLxZoJ/sZ30dY5VQ7Qc2/ulqcTQyLZa6yKN2y
	1JNjFeGdj+N0VqWduiWvXsnjj36yaNEZSUHQc8kwxOfUtbG9GS+E4drpiN6ag004cmRw
	SelG9JV3GSp7Tu01q9mAP+AxMDxOhmOY1BvbWA6otudPoA5JOdtb7bMIIOu7PcpAzKYX
	Eoa8kEjlLf8sI2f2OyZxQ/vdZ/yBKQ/JLQKXsA1zMMwbjNQgo1wlUweD1HqjOG12L7Ve
	jSHg==
X-Gm-Message-State: APjAAAX39l6S3hm5N7K/ERg85kNW3lqr0ebp6PqXiKuKo3uTbnw/Q6Yq
	972Fl/AvUZ0Kwp39ToC80fs=
X-Google-Smtp-Source: APXvYqwCrXLQXLcGLBhvF8WZukEGokepq9u/PinHB11vON87bb+vzT3/TW/UGK0boDcXeBzQXHKGQQ==
X-Received: by 2002:a1c:be13:: with SMTP id o19mr2382894wmf.19.1553172788366; 
	Thu, 21 Mar 2019 05:53:08 -0700 (PDT)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id
	j184sm8938183wma.47.2019.03.21.05.53.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Mar 2019 05:53:07 -0700 (PDT)
Message-ID: <2f676258e8152eef29f41ef1fa94acb7677ebf36.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:53:06 +0000
In-Reply-To: <6b2ad2e463f5ba0f3513e6d9755aa755828686e4.camel@linuxfoundation.org>
References: <20190319181544.314-1-luca.boccassi@gmail.com>
	<6b2ad2e463f5ba0f3513e6d9755aa755828686e4.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Thu, 21 Mar 2019 12:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-21 at 11:44 +0000, Richard Purdie wrote:
> On Tue, 2019-03-19 at 18:15 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Dumpimage and fit_check_sign can be used to extract kernel and
> > ramdisk from
> > a FIT file, verify them and kexec for a faster reboot.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > index ff26e32482..c487849bb2 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > @@ -45,6 +45,14 @@ do_install () {
> >  	# mkenvimage
> >  	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> >  	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> > +
> > +	# dumpimage
> > +	install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
> > +	ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
> > +
> > +	# fit_check_sign
> > +	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-
> > fit_check_sign
> > +	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
> >  }
> >  
> >  ALLOW_EMPTY_${PN} = "1"
> 
> Fails on musl:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/420
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/421
> no-x11:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/419
> qemux86-world:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/412
> 
> so basically it looks like any world build fails with this.
> 
> Cheers,
> 
> Richard

Hi,

Sorry about that, this recipe has changed a bit since sumo - it seems
the files need to be also listed individually in FILES_${PN}:

ERROR: u-boot-tools-1_2019.01-r0 do_package: QA Issue: u-boot-tools:
Files/directories were installed but not shipped in any package:
  /usr/bin/uboot-dumpimage
  /usr/bin/fit_check_sign
  /usr/bin/dumpimage
  /usr/bin/uboot-fit_check_sign
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.

eg:

-FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage"
+FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage {bindir}/uboot-dumpimage ${bindir}/dumpimage {bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"

Is this the right solution? Or should it be a new package?

-- 
Kind regards,
Luca Boccassi



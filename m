Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5587CF9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 19:49:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f3so4067236wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rHFxG/LfDpPg3HzGSPIFE6ZgN+0PxDFlJVRPVSiDpKk=;
	b=B+mPOI+Cid0FJoI7koDUxqSMdAJ4Sa15T7k6H3cBQa5qvLIiXd7TDZmd/TkXXomCzx
	iQGg9OElLdv/1zM9cRRyZE/EnDapu4ZIABdsDDXtG88q4p5zpQ38E7hA7UY2mEIzr0j6
	Zeo13BquB8zEMtdOGVer94KM7lZCr18beQ+F4o6fRz+kNqkFEsFQ9oBKYEv4+OOKm0mC
	64gM0IlBb/h0nCY+FvENnUC6eiL8hx0siyq7eMmEehT3zx5mrQhmKbZqsPKno/wwJqiT
	CrZAxLaTSMXhfxhkgm5qL/c9pITiTzSKLo4o22B5QZULtBLUM08kUUrldBe+YO358ptw
	Tu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rHFxG/LfDpPg3HzGSPIFE6ZgN+0PxDFlJVRPVSiDpKk=;
	b=nO+h2R+z8PtlkvxUoCDOfgroEjC8FbRtUxs4XonXkX1KO11gEqGzhoy2ddwLzuLiFU
	8jV4MXs2whQqOQ7qV3v8c11G4p9orLgXv+0La+/0HvCUV5QU+HRJdd1GpTOla2GZUYzr
	LDb4Sw9RvPLgAYe5LHRHZ18XMG+u7rKIlCpsj9XPltgoZKUFpB4tyQ43bqJ8H+V50k/0
	k5lvHjQ6EEdkTy3Kn4hceKNT7+kpyuj0KFHlZh650BuuTYct/fNM8zdBgabmnkMNpLVF
	Ezmx+e04QwCP56qxmgwN7W2rL7uElWw8ACGedpqrZO3rNcuw4EdwZ8E4+jxjSpYnNq/n
	uxcw==
X-Gm-Message-State: APjAAAWCxb6uEdTNcw0o9dfhRChMwul8yv5FOm4J1Tan8eo17pILCCXd
	u09XHyI9UwQFhSGsWOadER4=
X-Google-Smtp-Source: APXvYqzfuTMrUavSMRqF70+5tkpXO1PmiKefg65/R+dUZc8bcottffI2iITgG7qtBbY/TmJZQb9hPg==
X-Received: by 2002:a05:600c:2143:: with SMTP id
	v3mr619604wml.14.1553197772020; 
	Thu, 21 Mar 2019 12:49:32 -0700 (PDT)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:b00c:66c8:99df:336])
	by smtp.gmail.com with ESMTPSA id f9sm7194444wmb.36.2019.03.21.12.49.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Mar 2019 12:49:30 -0700 (PDT)
Message-ID: <d4ddb7e8c130bab720ff3266701930f8616122b9.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 21 Mar 2019 19:49:30 +0000
In-Reply-To: <CAO5Uq5Q8APL0y3+VPt6Z2b=02ZdNkjUi9oG6gh-XS7gQOr_r0g@mail.gmail.com>
References: <20190319181544.314-1-luca.boccassi@gmail.com>
	<20190321183541.31260-1-luca.boccassi@gmail.com>
	<CAO5Uq5Q8APL0y3+VPt6Z2b=02ZdNkjUi9oG6gh-XS7gQOr_r0g@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Thu, 21 Mar 2019 19:49:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-21 at 19:30 +0000, Alex Kiernan wrote:
> On Thu, Mar 21, 2019 at 6:36 PM <luca.boccassi@gmail.com> wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Dumpimage and fit_check_sign can be used to extract kernel and
> > ramdisk from
> > a FIT file, verify them and kexec for a faster reboot.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > v2: add dumpimage and fit_check_sign to FILES_${PN}-mkimage to fix
> > build.
> >     Not sure if it's preferable to do this or to add a new package,
> > please
> >     advise if the other is better.
> > 
> >  meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > index ff26e32482..b72033a566 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> > @@ -45,11 +45,19 @@ do_install () {
> >         # mkenvimage
> >         install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-
> > mkenvimage
> >         ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> > +
> > +       # dumpimage
> > +       install -m 0755 tools/dumpimage ${D}${bindir}/uboot-
> > dumpimage
> > +       ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
> > +
> > +       # fit_check_sign
> > +       install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-
> > fit_check_sign
> > +       ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
> >  }
> > 
> >  ALLOW_EMPTY_${PN} = "1"
> >  FILES_${PN} = ""
> > -FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage"
> > +FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage
> > {bindir}/uboot-dumpimage ${bindir}/dumpimage
> 
> There's no $ here
> 
> > {bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"
> 
> or here
> 
> >  FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage
> > ${bindir}/mkenvimage"
> > 
> >  RDEPENDS_${PN}-mkimage += "dtc"

D'oh, copypasta! Thanks, fixed in v3

-- 
Kind regards,
Luca Boccassi



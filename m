Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0F96B11A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 14:29:25 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id u12so2037945iop.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=gySmE1d4vtnIqWav7fBdWpSEkNCucph6i8Y+PMeuK9c=;
	b=WuawxxS8LXpRpiPQUjHB2TLS+XFz3PIlAa9wIgyEkI2KHBihvV2eRn0KKwiz+gdAhd
	35iwbpF1wFKWrug2OXMwbCXt/jKHdmOUNB04UFQVBlIw+6mr2Wj4TdqsD2vxB/ZAKebX
	okRUEDJwF8wsO4gdd5vEiHoWXBNq0au7rBDIuF5XDliKOEBdvTgXr9VNwKKen0mQd2XD
	GdNFTjc9SnpkXG6ms82RExaJL8wrZLgygsjNCGb4dKu5xGFL//Rep8nhr+0n3ae6wWHO
	Dsmc1dyXngBsh5fJsJXYJwpMGDLpZg+zkH/Spea6ZPqyp8ATQk+88gws9XfqqdD43eEt
	KHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gySmE1d4vtnIqWav7fBdWpSEkNCucph6i8Y+PMeuK9c=;
	b=PAtHduuKNBv6AJZlYcAoRaT5FcSaN1K6jC4vY5GCQDIzwyQHTl8EGva1Z6j2UAD4rN
	7tmAYxP7VI1QVQqJFdwiq1ygoXDLnAVC2raay7MuLi2s7K2IJfuCPU5xQlcoZZwBXCa+
	V6kqSm2KJpjKvuFzYzW77Bkt77GXSNHmoOfx6sCXjiYUVaAL7WiWHydQCCI31VcLEFl/
	zQIlCcH/wu/ZsCwwaN0AuwPdmX2qpcHGHTRqCiylXG32J5ghyJs8EIXd1mreHYfBMIAp
	X76wudu+raHVriRavR7Q6nDjDYsQ1bPvgLMwkn4GAjr3MiuIgLL7qWG7X3Y66Z0uYddv
	Olpg==
X-Gm-Message-State: APjAAAU7ne0OXSOm8OFNUuXbDlwyMMFepkccZXQ1nv3Ju45Q9fdvUFfN
	rGhjb2Wy1g1L4pRb64YDSvPMTKIeue4=
X-Google-Smtp-Source: APXvYqz861aXzVJOGdsKzOitqeKeyL7V2RHeWwX1MFAcgXjNhr18zi/WEInIRwtYFGKhgfNcR9cmOg==
X-Received: by 2002:a6b:8b50:: with SMTP id n77mr35539038iod.222.1555597767045;
	Thu, 18 Apr 2019 07:29:27 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	p1sm1042877itp.19.2019.04.18.07.29.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Apr 2019 07:29:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <307926a6c77f2ab0af46fa2f668b73bf4ddf0731.camel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alistair Francis
	<alistair@alistair23.me>
Date: Thu, 18 Apr 2019 09:29:25 -0500
In-Reply-To: <CANNYZj_nwJpa_Yj-8_YYnu194c_3GSdb1iCg5EkDhXOCjh_ZzQ@mail.gmail.com>
References: <SL2P216MB028292C44E997FA682A1C8DADD260@SL2P216MB0282.KORP216.PROD.OUTLOOK.COM>
	<CANNYZj_nwJpa_Yj-8_YYnu194c_3GSdb1iCg5EkDhXOCjh_ZzQ@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Thu, 18 Apr 2019 14:29:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-18 at 14:16 +0200, Alexander Kanavin wrote:
> Can we take this opportunity to teach u-boot to use Python 3.x
> instead? oe-core is trying to eliminate Python 2.x dependencies
> everywhere.

It looks like the libfdt code in u-boot currently requires Python 2, so
it would be an unstream change to convert it to Python 3. It also
appears to be compiling a C module to work with Python 2 so its
probably not as simple as "convert the script".


> 
> Alex
> 
> On Thu, 18 Apr 2019 at 13:38, Alistair Francis <
> alistair@alistair23.me> wrote:
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-
> > bsp/u-boot/u-boot.inc
> > index 96c1f94011..9a754fd09b 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -13,7 +13,7 @@ DEPENDS += "swig-native python-native"
> > 
> >  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX}
> > CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
> >  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}
> > ${BUILD_LDFLAGS}"'
> > -EXTRA_OEMAKE += 'PYTHON=nativepython
> > STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> > STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> > +EXTRA_OEMAKE += 'PYTHON2=nativepython
> > STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> > STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> > 
> >  PACKAGECONFIG ??= "openssl"
> >  # u-boot will compile its own tools during the build, with
> > specific
> > --
> > 2.20.1
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
-- 
Joshua Watt <JPEWhacker@gmail.com>



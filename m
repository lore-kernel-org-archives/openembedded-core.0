Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4368D77D88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 20:15:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so6238191wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AW39u4DL76vJvCmc8dh0Wr8TJtb7t6vngoM0TRyutoc=;
	b=aM38QpzNou4y94r4OUerl5G/UNk6hBZJ+s1/14eQW9+TaBmHDMIzv45omZqJsAS4CU
	NnyHSO9+/mRUOblHXNP0b43gHZSIE3d9LcewZNOiMfbdj+lbMvvJyZ5uCRrIrthHh8Un
	KJkmYVuRfn2V/JoIvxWhdjZ//aWkXeKiN3d76+qiuxPr84CJlQhI00y/e6W7or/lca6z
	wy33NE3TsHItDsHzIam/MQNUvWPk0M0ETKpPja2M84Tq7Yzo7YxqCprBos27+iXVG7Ym
	49p2OTC/yO8WPXFbBY5Xg7jc9tm7trS7J/L+6bwXk3qR0rNpLAdpMD228uFxJrd000X6
	C9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AW39u4DL76vJvCmc8dh0Wr8TJtb7t6vngoM0TRyutoc=;
	b=koUNJEMjoKRbrUEU4h16d9edgosEzzOAL1XVgziZyHDMMQ+frw55TN7VVwTjVgMsbG
	ruXSY+8dyRRWW9NdFN12mFu2bZBemyKcFQZkh4N394IixveT4CO+PYYsU+Awbn6d4s+W
	DncUjvvl5g5nyz6+HBvqdoLHgYpAR1yv2H9ocZOS9CAASxNy7lnm4SJoKGMfW1nJQwt8
	Q4ifoS4XtCacNLnqMwCJSf1MQcIuho8qfI1GzNIFO20TUT2hl7cbtdStvghkMtKToG8r
	fhL8uViy9MK9Qsm2Dtc5U0Egb16H6TeJioPNoB0S+dwp5adptX1XUzoe8dCcYT+t1kx1
	yBZg==
X-Gm-Message-State: AODbwcBfQT2gVdyElNWo/g0Yw4q+Z8Ys8w0WNzdCc5nCoqG9F5WePmCK
	HBZJqDIkGb4hlA==
X-Received: by 10.80.194.138 with SMTP id o10mr386321edf.94.1495052133159;
	Wed, 17 May 2017 13:15:33 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	t57sm1761132edb.28.2017.05.17.13.15.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 13:15:32 -0700 (PDT)
Message-ID: <1495052131.7502.1.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, poky@yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 22:15:31 +0200
In-Reply-To: <CAJ+vNU02n6DavkhuwM8gU7daWLyyd4QHgd0N5topHJQiO2_6RA@mail.gmail.com>
References: <CAJ+vNU02n6DavkhuwM8gU7daWLyyd4QHgd0N5topHJQiO2_6RA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: populate sdk broken for u-boot-mkimage
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
X-List-Received-Date: Wed, 17 May 2017 20:15:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Tim

Just sent a patch which may fix what you see.

Regards
Max

Am Mittwoch, den 17.05.2017, 12:36 -0700 schrieb Tim Harvey:
> Greetings,
> 
> I'm running into the following build error when trying to create an
> SDK for an image that includes u-boot-mkimage-native.
> 
> The nativesdk-u-boot-mkimage do_package task fails with:
> ERROR: nativesdk-u-boot-mkimage: chrpath command failed with exit code 7:
> b'/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot
> -mkimage/1_2017.01-r0/package/opt/fslc-x11/2.3/sysroots/x86_64-fslcsdk-linux/usr/bin/uboot
> -mkimage:
> RPATH=/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u
> -boot-mkimage/1_2017.01-r0/recipe-sysroot-native/usr/lib:/usr/src/ventana/yocto/pyro
> -2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe
> -sysroot-native/lib\n'b"new
> rpath '$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk
> -fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot
> -native/usr/lib:$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64
> -nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot-native/lib'
> too large; maximum length 287\n"
> DEBUG: Python function perform_packagecopy finished
> DEBUG: Python function do_package finished
> ERROR: Function failed: perform_packagecopy
> 
> I'm guessing this has something to do with the long list of args in
> EXTRA_OEMAKE_class-nativesdk from
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> 
> Any ideas?
> 
> Regards,
> 
> Tim


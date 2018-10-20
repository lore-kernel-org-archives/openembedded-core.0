Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9E160069
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 07:11:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o17-v6so4846951wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y5znOzq/vXwTTgGDe7UUhzu0gxFEdKo8LSeEjAjbHsA=;
	b=fFeDtn8uKs77ca3IpBoDi3I4BkY9Sz8E1mRiBvnwdvdarOySl9pwdOiIBT1ZrX9249
	y59RdRMufimR6GdCyK+Y7Js5vTbmAcIAwm7D4DAMlo4ZFCm7iaiz7nUy2MJ/ZcZBiFey
	F1i+oY8wGZqrjJXO8f9Yt/rj/sj5UnRUHeDCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y5znOzq/vXwTTgGDe7UUhzu0gxFEdKo8LSeEjAjbHsA=;
	b=Z/HLRDr3QdeN5mqXgl4mZWsb0bGEWGQfx97V/VnG2E++c4BeHjPUMScaYEeAsbCXUH
	hUKF0nfiBBOJ4Z8cZAszWP3pOMVz719XwykRPgPGR8mon/zRPoR2EO7DgxyZRDUtZvXk
	c2kvhnsti5Wdg3vU3xNBOqjH1hQLostNLmmmG3dWBl+KmejQ716NgoJ11GyihZMwnVUv
	VzESGkBzgITOre4a5NOSBtWXfcoPXoguLzhwZCH/j1WSXOOzz9LEeiAIHstKcL433jAI
	56t4kI2XzuV4dWTT33a6EomzqAqpXq7Naun7J234EanSNaupC2Rgla4WapuSqdnq988x
	mzJA==
X-Gm-Message-State: ABuFfoiKhtoJGJYiEg/Hy5Dh56J/j9bSURtyVUuaREy6ZnD2min3x/9H
	N5C39O928Eq/qqrPtySDJpBBEQ==
X-Google-Smtp-Source: ACcGV61XQWxFimeqYKNpJ3SSUPbEKb214FtE3f7dzzmKnqPfFN5FUa58UPyYPd2v4BF39rrrGLgNSA==
X-Received: by 2002:a1c:3383:: with SMTP id
	z125-v6mr7806044wmz.56.1540019481599; 
	Sat, 20 Oct 2018 00:11:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l4-v6sm29280466wrb.92.2018.10.20.00.11.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 20 Oct 2018 00:11:20 -0700 (PDT)
Message-ID: <6b883ed64458a2153437d7519adefb513556864c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2018 08:11:19 +0100
In-Reply-To: <20181016232143.5016-1-anibal.limon@linaro.org>
References: <20181016232143.5016-1-anibal.limon@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
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
X-List-Received-Date: Sat, 20 Oct 2018 07:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-10-16 at 18:21 -0500, Aníbal Limón wrote:
> When use simpleremote target the flash/boot process is executed
> manually, the IMAGE_FSTYPES validation is only needed when execute
> testimage against qemu.
> 
> The supported_fstypes comes from oeqa.core.target.qemu module.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>  meta/classes/testimage.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 2642a722e7..734cb7caae 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -194,12 +194,13 @@ def testimage_main(d):
>      machine = d.getVar("MACHINE")
>  
>      # Get rootfs
> -    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
> -                  if fs in supported_fstypes]
> -    if not fstypes:
> -        bb.fatal('Unsupported image type built. Add a comptible image to '
> -                 'IMAGE_FSTYPES. Supported types: %s' %
> -                 ', '.join(supported_fstypes))
> +    fstypes = d.getVar('IMAGE_FSTYPES')
> +    if d.getVar("TEST_TARGET") == "qemu":
> +        fstypes = [fs for fs in fstypes if fs in supported_fstypes]
> +        if not fstypes:
> +            bb.fatal('Unsupported image type built. Add a comptible image to '
> +                     'IMAGE_FSTYPES. Supported types: %s' %
> +                     ', '.join(supported_fstypes))
>      rootfs = '%s.%s' % (image_name, fstypes[0])
>  
>      # Get tmpdir (not really used, just for compatibility)

This causes the autobuilder to break and there is a bug in the logic
above:

https://autobuilder.yoctoproject.org/typhoon/#/builders/32/builds/128/steps/7/logs/step1c

(one of many failures as everything broke)

Cheers,

Richard




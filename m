Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADC6608C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 08:55:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so15922989wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 00:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2qhDZ5GTHhZqm84fjSyjmFAsryM7sxVRc0QMvKodUB8=;
	b=MsI2iRDHHPqWNhgsF9f8sNvI3LmAWxJnIKATRXkYfvLMQ2kupXkwMraG5cQaJ9giYI
	z+kmphVvSKTv07jqH3KqIRnIjEltj4v/8uLTfUhh9ELlmc1EXHQooy9HNX2nh+quS2jS
	qLLPsTYafOMwT0sFZpUTWsuE6DdRt3gIg1YIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2qhDZ5GTHhZqm84fjSyjmFAsryM7sxVRc0QMvKodUB8=;
	b=SiccN0Y+7xmNnnGCZSdG+KeOdH3OkPVsm6Ez7eW8QxcK1lK64uyRvE3G8GYFXxg7lw
	+KCQ0obK1GNk6n9C+uIQBTzQlV6RXNpyimMkoSXHpvy65CGaNtaS+y3sN+XhGhmM5Whj
	0JMVAelYGjj15uxW39zTi8Y4xj9cUVW3Wp3cASd9og2CqiHsU3vtSj7GnC24UxlpQtpQ
	+DxtP2Q1JXaRi2XPMdf31fvIixh/l+qO04lnc2goLP5nNmNE13XVrvM88xfuPYaAYrb8
	olGGco1HR6zi37dNx8BOisEzEvOaApnzh0wP3Tm9KmT/vqyh2NG5wqAmKDni1SBMKajK
	VxAw==
X-Gm-Message-State: APjAAAW2OL1TetD25bxsMTca5KLQ19T8nUecGJzX2QInzxW8sqcUzBl6
	o5T/iMqkZQ15meLOf95QxX2JGG/+b4o=
X-Google-Smtp-Source: APXvYqyZVsigp2utxR3o4UY9PplvCevDxCzirXh/i6lDFFP5brpQvuFEc11RgVT3qnuyRzWCsv4CXA==
X-Received: by 2002:a1c:de55:: with SMTP id v82mr27382060wmg.48.1580720126728; 
	Mon, 03 Feb 2020 00:55:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c17sm23735917wrr.87.2020.02.03.00.55.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 00:55:25 -0800 (PST)
Message-ID: <d60571d81371e3727c70d4cde9e1ff4854563a4c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2020 08:55:24 +0000
In-Reply-To: <20200129090738.1398-22-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
	<20200129090738.1398-22-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 22/24] xserver-xorg: upgrade 1.20.6 -> 1.20.7
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
X-List-Received-Date: Mon, 03 Feb 2020 08:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-29 at 10:07 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../{xserver-xorg_1.20.6.bb => xserver-xorg_1.20.7.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.6.bb => xserver-xorg_1.20.7.bb} (88%)
> 
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
> similarity index 88%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
> index a1cd490394f..2bd10adf078 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
> @@ -5,8 +5,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
>              file://0001-test-xtest-Initialize-array-with-braces.patch \
>              file://sdksyms-no-build-path.patch \
>              "
> -SRC_URI[md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
> -SRC_URI[sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
> +SRC_URI[md5sum] = "d2e96355ad47244c675bce38db2b48a9"
> +SRC_URI[sha256sum] = "bd5986f010f34f5b3d6bc99fe395ecb1e0dead15a26807e0c832701809a06ea1"
>  
>  CFLAGS += "-fcommon"

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1534

nodistro build so probably GL distro features related:

../../../../../xorg-server-1.20.7/hw/xfree86/drivers/modesetting/drmmode_display.c: In function 'drmmode_crtc_set_mode':
../../../../../xorg-server-1.20.7/hw/xfree86/drivers/modesetting/drmmode_display.c:757:15: warning: unused variable 'screen' [-Wunused-variable]
  757 |     ScreenPtr screen = crtc->scrn->pScreen;
      |               ^~~~~~
../../../../../xorg-server-1.20.7/hw/xfree86/drivers/modesetting/drmmode_display.c: In function 'drmmode_clear_pixmap':
../../../../../xorg-server-1.20.7/hw/xfree86/drivers/modesetting/drmmode_display.c:1806:9: error: implicit declaration of function 'miClearDrawable'; did you mean 'drmCreateDrawable'? [-Werror=implicit-function-declaration]
 1806 |         miClearDrawable(&pixmap->drawable, gc);
      |         ^~~~~~~~~~~~~~~
      |         drmCreateDrawable
../../../../../xorg-server-1.20.7/hw/xfree86/drivers/modesetting/drmmode_display.c:1806:9: warning: nested extern declaration of 'miClearDrawable' [-Wnested-externs]
cc1: some warnings being treated as errors
make[5]: *** [Makefile:789: drmmode_display.lo] Error 1

Cheers,

Richard



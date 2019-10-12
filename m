Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 889287F633
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 12:46:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y19so14670732wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=P8FcevJnzpeOjnlAf7/7Eu8ZwcNvrmHUydCiq2Ccg+U=;
	b=A0XSAbH9k3o2UWek7HfxZGneYQsnRF5EouJnYSrkDG1TdQeLE14QuK8n69Y4uqKLr1
	QI3pcTfaKCcA6q+gYyN7k9CIXp29nDmDaN09DVhRtNXIKmWA1CtBWUah3hvKijGvsVIa
	TAIXGZ2eJKGvbRxc0VVo6Jsq3J+VMIkBBtdRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=P8FcevJnzpeOjnlAf7/7Eu8ZwcNvrmHUydCiq2Ccg+U=;
	b=shZSJ6IEdq+SYK/QT0Srf2J6geAp/2oRiVPlnDX80DAYCS/VeY3Z17r82VqQ4yJfWm
	S+6uoNeVNU7zuJ96y5/QaV+yTWR0StrRoL3MGKVtHKWzppC7Y3tX9lzRYqYL4FsCOth5
	fxC1CKbC/2IUQSpkUGvi8V0JyJuVT2aY+LiAhxNag4bIUfKS7LGd+hX9V8aBpGSS1tMj
	2p3GwnF5V/JAY1Q9e5R7LafJtsT/X95PoV0SAceUBFfonl22WPbddaMYxNQ+7wHcxB0u
	cGda5uaXr9rGVLZAuBiqDpK42z97gsxm4zVdFHyV2A0JII3+RsfL1VRKAvWoOVVtRnL1
	JMRA==
X-Gm-Message-State: APjAAAX1Y444gzzEU50M0osuicG7/YrdLM4XNERVU/KY2RN7TzE/CUEB
	K19NbIGDpGwmOhAxeEpCX6kT/8oLaC0=
X-Google-Smtp-Source: APXvYqxHlaDC+FQZBxkI2iEJ2BLQTc2q2S3n2BoXRLitUceMp92h5kJxQeplFCuJ3bFA5TD/Fn/q+Q==
X-Received: by 2002:a5d:4901:: with SMTP id x1mr9065983wrq.28.1570884393217;
	Sat, 12 Oct 2019 05:46:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o18sm25544086wrw.90.2019.10.12.05.46.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 05:46:32 -0700 (PDT)
Message-ID: <c0095591e0db0cb188df6d163bcc1cce9b40969d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 13:46:31 +0100
In-Reply-To: <20191007060041.18153-1-zangrc.fnst@cn.fujitsu.com>
References: <20191007060041.18153-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] libxvmc:upgrade 1.0.11 -> 1.0.12
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
X-List-Received-Date: Sat, 12 Oct 2019 12:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-10-07 at 14:00 +0800, Zang Ruochen wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../xorg-lib/{libxvmc_1.0.11.bb =>
> libxvmc_1.0.12.bb}                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.11.bb =>
> libxvmc_1.0.12.bb} (76%)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.11.bb
> b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.12.bb
> similarity index 76%
> rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.11.bb
> rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.12.bb
> index d95f809..29ed0c4 100644
> --- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.11.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.12.bb
> @@ -15,5 +15,5 @@ PE = "1"
>  
>  XORG_PN = "libXvMC"
>  
> -SRC_URI[md5sum] = "707175185a2e0490b8173686c657324f"
> -SRC_URI[sha256sum] =
> "4a2e34d444a683a7c010b01b23cefe2b8043a063ce4dc6a9b855836b5262622d"
> +SRC_URI[md5sum] = "3569ff7f3e26864d986d6a21147eaa58"
> +SRC_URI[sha256sum] =
> "6b3da7977b3f7eaf4f0ac6470ab1e562298d82c4e79077765787963ab7966dcd"

NOTE: recipe xf86-video-intel-2_2.99.917+gitAUTOINC+33ee0c3b21-r0: task do_prepare_recipe_sysroot: Started
ERROR: xf86-video-intel-2_2.99.917+gitAUTOINC+33ee0c3b21-r0 do_prepare_recipe_sysroot: The file /usr/include/X11/extensions/vldXvMC.h is installed by both xorgproto and libxvmc, aborting
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/xf86-video-intel/2_2.99.917+gitAUTOINC+33ee0c3b21-r0/temp/log.do_prepare_recipe_sysroot.44681
NOTE: recipe xf86-video-intel-2_2.99.917+gitAUTOINC+33ee0c3b21-r0: task do_prepare_recipe_sysroot: Failed
ERROR: Task (/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb:do_prepare_recipe_sysroot) failed with exit code '1'

I think this may need an upgrade of xorgproto at the same time.

Cheers,

Richard



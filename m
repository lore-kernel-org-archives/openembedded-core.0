Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id EAAE5606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:32:02 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b186so2190859vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rlOUp6UNYlbb9JRyXTOhQkNhHcZevAWmFbMxincJ2AY=;
	b=mQ60GXP8lfq9yQ/yhQzKb/YUsiNUxS2mnirl00sN02wA4+De56IiQPcizIea4Jex4y
	aV4PBCBq4g+1SLgIemVzPBTTQYqDTVG4LMnOpVVRLS199CyWERVYlK1rSBqrr/KIulXx
	8+iDz6Dhpzu5NnZLsN7O+7LTUfRfweRM81DXXzWqLLULQixMZKJ3pwIkTDjSZyzj7tj6
	OawJq9wEc+bHYs1x3lt24fkAB+Xynpuj6SSnEFjsxEBY+RjsHjnIighYNHlWCrwzEF7g
	rl2GpElYFLzZBDEvhfQaujKGhtmj29gwwHRvVFfHpwlfG+bn5f0eJ6Mfd7f5kA9/m8la
	HHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rlOUp6UNYlbb9JRyXTOhQkNhHcZevAWmFbMxincJ2AY=;
	b=RfUHxfMfrlR0C91vQUtTYObg4xGd2rSLXGE+zFGY4TCQ5azL5/C2BuspPs5767ZBr/
	bmeaqy0rToynJy7+zUPz3zqudja1UPNRw/uIPWb3b5Akfeqa6u/iB77dtKFcQBVWYJza
	ZEipfRMpWji2enmddxRtMcj/5+Zd8Abkues2Dghd7fw8DEKRkkANKnrV/LumVwf6Ex+c
	lzfhq6/ME+baAye5kBW8wpLI87zl8h+8EctfX1mD5pkqCVSBv3mYy5Mb9K8ojSvtk/Gf
	D4D0cWXQT6Utr/Qzch4puqaBBmQ1o/rEg9feTuiQAwc7SABuOX7FFFzKbcwhoDUMrNa6
	orBw==
X-Gm-Message-State: AA6/9RkB4tcWQovqu/oqxCNjgFQctZqMzEt8Bd8tlL1+nTlCnOJteASbR06zFa5MIgHA8xRMLkwCH1JZSnkEJg==
X-Received: by 10.31.15.65 with SMTP id 62mr7628257vkp.93.1476934323871; Wed,
	19 Oct 2016 20:32:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 19 Oct 2016 20:31:33 -0700 (PDT)
In-Reply-To: <611275eed029517e303645fb2cd5dd2c32c03d75.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<611275eed029517e303645fb2cd5dd2c32c03d75.1476888929.git.alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2016 20:31:33 -0700
Message-ID: <CAMKF1sqLMT=-2Cj+0haPGc+rPv7ZCMCjhBXzy8t+2W1F67t-rQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/19] epiphany: update to 3.22.1
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
X-List-Received-Date: Thu, 20 Oct 2016 03:32:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 19, 2016 at 8:06 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../epiphany/{epiphany_3.20.3.bb => epiphany_3.22.1.bb}             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_3.20.3.bb => epiphany_3.22.1.bb} (77%)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
> similarity index 77%
> rename from meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
> rename to meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
> index eba480b..57784ae 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.22.1.bb
> @@ -10,10 +10,10 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
> -SRC_URI[archive.md5sum] = "31822b6b199f724f212ae9200bc055f1"
> -SRC_URI[archive.sha256sum] = "4d9de1bdb44c14adf25aa6dc02ea3de60925cff5eb01fe89545e6032c9b424a2"
> +SRC_URI[archive.md5sum] = "9b9b73601a32f5b11c02411952cec27a"
> +SRC_URI[archive.sha256sum] = "aab162ede54d71e583e382ab5e3567f28d81e0cd42719a11cad8008b56c5cc0e"
>
> -EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
> +EXTRA_OECONF += " --with-distributor-name=${DISTRO}"

why is nss not disabled explicitly anymore ?
>
>  do_configure_prepend() {
>      sed -i -e s:help::g ${S}/Makefile.am
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


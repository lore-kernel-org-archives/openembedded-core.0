Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 749DD7F362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:18:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d73so9404430wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1UmwU5r/t8S5LZNo+V1R/6RxaNMrY8lAVc6GveJpOcQ=;
	b=VPo61e1mIX7F2uU68Z1YdTwGig2paVWLlD6SZ5IaBFAXG4oCUQoxuX5ygXUNHAClCW
	1fbkJGcn1EMFIEAKFCF1MYSyUukKVWpWle/1BM9mrVrKhWfs3ta/e842TQDCdX6Az4S9
	tUErVy4JeD+5O0/ReBCQbMAT+mFp38mp7r2RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1UmwU5r/t8S5LZNo+V1R/6RxaNMrY8lAVc6GveJpOcQ=;
	b=BrD9lAkSdG2IDE0vxUX6nScLcLRil4oUlEHecuyPKt01xy0xc+LweyXw4ax5CJ8qHY
	Qsq47DEmkQa+gfQO1bnSuttgcXJdKRVaEtL/lbG6GrhFWuxIG6t6yKY/eKAsucvQJBje
	DIYXW7LPMDJLai7bJpf3K/iwr5ISLpLHdg3GENEy++hYWC3YipYGdXmBi7+mSHbxi1P3
	0DKsTTDFD69T4vm77Xn6EBcDroZGfKxKvDOJFNgKUMfnywfNMgWswoenLcKRI77uh/bX
	isQZEh8Z7xz4Aet1B8RNyAj32MVXfv3PuFnYFsSL9gBOPRU+taqGUbvPdoMBfJMz86mM
	8jfw==
X-Gm-Message-State: APjAAAXLayvwL4vIHjeMtu4FBt96AOshMGcrOud5okpt978LJrxaVM52
	KdR3jCbuQuCbVWKzdUe1fwWyT2eb6l4=
X-Google-Smtp-Source: APXvYqxkMLI4BbC63GYPUlZ4YQ9MnzX3NQ4WEJhldpNyLoh9bAAt/x7UzrTwvj7/ql6fsklkfMofaw==
X-Received: by 2002:a1c:5444:: with SMTP id p4mr19536665wmi.33.1578917914512; 
	Mon, 13 Jan 2020 04:18:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u24sm14333066wml.10.2020.01.13.04.18.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 04:18:33 -0800 (PST)
Message-ID: <725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <crg7475@mailbox.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 12:18:32 +0000
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Mon, 13 Jan 2020 12:18:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-01-12 at 14:59 +0100, Carlos Rafael Giani wrote:
> * gstreamer1.0-plugins-common.inc
>   The old gstreamer1.0-plugins.inc file, adapted for meson
> * gstreamer1.0-plugins-packaging.inc
>   The old gst-plugins-package.inc file, adapted for meson
> * gstreamer1.0-ptest.inc
>   Common code for meson based PTest support; autogenerates the run-ptest
>   file and is designed to use the gnome-desktop-testing suite runner
>   (which is why the .inc files inherits from ptest-gnome)
> 
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>  .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
>  .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc

Thanks for this, I know its not an easy patch set to sort out!

I ran it on the autobuilder for testing since there was bandwidth
available and there was one issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1455

which was in a plain OE-Core + bitbake build (no poky, so nodistro).

Any idea what is wrong there?

Cheers,

Richard



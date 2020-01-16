Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDDF26007A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 22:42:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so5564520wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=kfYuP9x47b7hfZsgvht3Wss1bid0Pl85OUbuyDGnjLc=;
	b=Fb8ijdMc5oguGnaoXc8dTmFCLLZAtvfzldk7ACBlgFUpefwNVbN4N6p6EHm7874nzB
	owFe2ZlJqhXze6CfIlOfNfXBEZRya18CcSNDA5iI2yMd58z5OxFz7dwtdKfDSbnR1MOd
	shG3UPynVYTxJv1dPUPCRHFXfs3p2Doc9w4nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kfYuP9x47b7hfZsgvht3Wss1bid0Pl85OUbuyDGnjLc=;
	b=LPR+UeZfMDSj6pPGNferej5IUhkcPyEjsJTPfm+5z7+DyaWFUpV2h1v1SofYZpkHn6
	cTS4Rskqav/0+r1Cch+MrezQU2aM6YuZsCMI82ZiAFTTiOTw9DhAqoOWVbu5wsMAXGPp
	XyVBPgBzU+71D/ML6eWEuRNBuLLoKQEzOjh6yCQJO7mgQUm4nKdo59ty7XI8PGznFPdV
	Vqkzuc19/xDtBYs4ghnuqxU8DWSX+RYzHn2JWHyIIxuu328HWmBz9K64elZC5xwoO9C6
	KYw4Testtpw1N/7xBQrrBioJ7t81u7STz/2RNwdrKsQKcZI37cdYFZGwDI73qmwvl2v1
	cqZw==
X-Gm-Message-State: APjAAAWnQys9yIExGObRJh59npMdmxBABKR4oF6RSCnOkDkpbfyolZoW
	oGQKLHiFSXMrQXlNq+M6giHgGw==
X-Google-Smtp-Source: APXvYqzVaC673DvvRYO49+QDgF6YyIIt88heDnSNZkzssczX7dP5Jr5fp/RbIMAt5NkfPCSC+nGMkw==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
	r4mr1270809wmg.140.1579214526503; 
	Thu, 16 Jan 2020 14:42:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l6sm6725843wmf.21.2020.01.16.14.42.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 14:42:05 -0800 (PST)
Message-ID: <7a370eb9a6c5bb8c7ec25c5e57f273a2174de167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <crg7475@mailbox.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2020 22:42:04 +0000
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
X-List-Received-Date: Thu, 16 Jan 2020 22:42:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-01-12 at 14:59 +0100, Carlos Rafael Giani wrote:
> * gstreamer1.0-plugins-common.inc
>   The old gstreamer1.0-plugins.inc file, adapted for meson
> * gstreamer1.0-plugins-packaging.inc
>   The old gst-plugins-package.inc file, adapted for meson
> * gstreamer1.0-ptest.inc
>   Common code for meson based PTest support; autogenerates the run-
> ptest
>   file and is designed to use the gnome-desktop-testing suite runner
>   (which is why the .inc files inherits from ptest-gnome)
> 
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>  .../gstreamer1.0-plugins-packaging.inc        | 70
> +++++++++++++++++++
>  .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-common.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-packaging.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> ptest.inc

FWIW I've merged this series with some of the fixes that were also
sent. I've done this on the basis that its the correct direction we're
going and whilst there are some gremlins to sort out such as the issue
Ross mentions, some of the comments/options and so on, we may as well
move forward and we can fix those things as follow ups.

Thanks again for working on this, I know its not a simple change!

Cheers,

Richard



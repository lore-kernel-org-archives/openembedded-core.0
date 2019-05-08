Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 13BCA7DDBA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 12:32:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d12so6515232wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+WIt3BncwGqf2x2Bj/c1eEeOdORvkMcvWX5rJgSvQhE=;
	b=YJ0m5hXAt3CX3DFMzhngrzcKX1IDV3BaHuejzC0bGSkEGfRFQiJ3IDr5u2EQFWAx2g
	aC77Fsg/7fz8PaIjMnC6pFI9tfelEZ8yPA2smvC2lPxLCoN/FH3W1H2slJlm8HSwvXwi
	E/yqHxgIHBHUWk2AeNvURuOc/lEZEVteDI0bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+WIt3BncwGqf2x2Bj/c1eEeOdORvkMcvWX5rJgSvQhE=;
	b=TMfMrprEDuYelMm+LCBqsf9QcXQoiv/Qg7AXrtfzX9/CVREcjKFx7cw+0R6Arj+dXj
	tn29kEoJ4lgW/UIqlxF7KIJuFgQIJC7hpVSeOSqIKSFYj3lO/aCUzZxcNe0/vnXEKREu
	q/rMb29w7ybT7ObDfMYGfYE3H3w6gcxmi62bLrL88KAPNnrkU4hFKIOTdOfnQc2+/UND
	8Kb8DP6j4G2g7cwLTWS0ApvEh0iASY3D5pWIrEwIHP5ahlIROxoM+uwh/t6jGuaICLaW
	p82jMe+cgt2DKXt1D3jrhxLOl/T97fIw8FQrBM56sJ0WBgm+fz89BoOKiNIY7+ozgZej
	kNzg==
X-Gm-Message-State: APjAAAW/UcCzVUnVpGuIUi1AX/QjQW5SxWrRGS1yYBRup28/byHfQvMx
	KEFwFqC+QV72fBThbSzgTuFCFUf9eRs=
X-Google-Smtp-Source: APXvYqypjCphV7SU6iHOaOaEs1bKlluDJBlAiDNKVMGRgxZtKL3OVp0gRZigYfOyNu46ZLvW3HYZCg==
X-Received: by 2002:adf:b446:: with SMTP id v6mr11260591wrd.30.1557318766971; 
	Wed, 08 May 2019 05:32:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v192sm2515935wme.24.2019.05.08.05.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 05:32:45 -0700 (PDT)
Message-ID: <ac92e6664c5856848367f40fddbdc53391f0388a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Wed, 08 May 2019 13:32:44 +0100
In-Reply-To: <20190507131151.31070-3-bunk@stusta.de>
References: <20190507131151.31070-3-bunk@stusta.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Wed, 08 May 2019 12:32:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> Remove patch applied upstream.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../ofono/ofono/use-python3.patch             | 27 ---------------
> ----
>  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
>  meta/recipes-connectivity/ofono/ofono_1.29.bb |  8 ++++++
>  3 files changed, 8 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-
> python3.patch
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
>  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb

A local build of this failed with what looks like a race:

| ln -s /media/build1/poky/build/tmp/work/core2-64-poky-linux/ofono/1.29-r0/build/../ofono-1.29/include/netmon.h include/ofono/netmon.h
| /media/build1/poky/build/tmp/hosttools/mkdir -p ell
| echo -n > ell/ell.h
| ln -s /media/build1/poky/build/tmp/work/core2-64-poky-linux/ofono/1.29-r0/build/../ofono-1.29/include/lte.h include/ofono/lte.h
| ../ofono-1.29/src/genbuiltin udevng rildev ril infineon ril_intel rilmodem isimodem isiusb n900 u8500 qmimodem gobi mbimmodem mbim atmodem nwmodem swmodem ztemodem iceramodem huaweimodem calypsomodem mbmmodem telitmodem hsomodem ifxmodem stemodem dunmodem hfpmodem speedupmodem ubloxmodem gemaltomodem xmm7modem phonesim cdmamodem g1 wavecom calypso mbm hso zte huawei sierra novatel palmpre ifx ste stemgr caif cinterion gemalto nokia nokiacdma linktop icera alcatel speedup speedupcdma samsung sim900 sim7100 connman telit quectel ublox xmm7xxx  hfp_bluez5 dun_gw_bluez5  bluez5 hfp_ag_bluez5 upower provision cdma_provision file_provision  smart_messaging push_notification allowed_apns > src/builtin.h
| ln -s /media/build1/poky/build/tmp/work/core2-64-poky-linux/ofono/1.29-r0/build/../ofono-1.29/include/ims.h include/ofono/ims.h
| ln -s /media/build1/poky/build/tmp/work/core2-64-poky-linux/ofono/1.29-r0/build/include/version.h include/ofono/version.h
| /bin/bash: ell/ell.h: No such file or directory
| ln -s /media/build1/poky/build/tmp/work/core2-64-poky-linux/ofono/1.29-r0/build/../ofono-1.29/include/storage.h include/ofono/storage.h
| Makefile:5722: recipe for target 'ell/ell.h' failed
| make: *** [ell/ell.h] Error 1
| make: *** Waiting for unfinished jobs....

Cheers,

Richard



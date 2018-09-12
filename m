Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 148B27969F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:30:16 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so2601368oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O9VSdrYqnkdESRP8Yx/rDnv7FIne9XaDb6oXoCJvZRQ=;
	b=n6B/qOVMNbryiLwQVo1JHbRyytfaeHFfWDU+gRALqrO6wcOfCqCwBg80CR1+oyXvLj
	qnwFt7IGXo5T7WFWJs/hn4rSfhZvpKD+nXesIT6chkecl5f0ueTx+wv/pBXv+v/vLWD8
	yKw71V+vAocZR4z9II8iS6K5TjaYivd+EnSPNJVK2lnC+QIqhCLORNw+K6iqGeWmU0Pt
	hwUts74zvR6rAszpev3/BwQrO/uGWmA24BLiSe6kktGkv4NGMM/prcYVdxgnRoTpFwnB
	YSd4HhLoU2kpHOTNzYDRRpubAJB70TKR1C2goZpjFoyDMORSF2z3tprs/rQinunSrdnd
	Vemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O9VSdrYqnkdESRP8Yx/rDnv7FIne9XaDb6oXoCJvZRQ=;
	b=NM3yAC9FBZrcqCDtmiXHBGfNrGMuFRfFPnnsmtQdHzFuBoFg6wLhqogwZ32Nz7wpKI
	y0VO9b9mpsUVpkJ59n8INexlzz7TTY+LEwsa2ByoUwf4RbW7m82em/ENtLPR7LVQHp3R
	NtfhM8kEwOIXDJND8Jqdy/UF3oT/UVJ6YuJNM9oFiMab8d+hNm2SDxZTY6fKw8Ec4sWj
	Ajt3DCMvy+dqE6dBpP2V7gT/Kh2qnFN8CuWKHeQwOKF073xALCfFiPOXE5C4AFlj3GKV
	zEvixNl6qT012KdZoXZDkAT+UQOb3q14I+lLyVVtskNlcSRHidarki966QbAJ6RnfYUo
	1ZLA==
X-Gm-Message-State: APzg51B1QZbHKynk9Apr4uU5KoX3I6jK19TLK4+kBWHwylxsw1sZubDG
	Y2fnp2lkvKZAPuqTHzJZB6ZLlhVXCYGOiT6RNjY=
X-Google-Smtp-Source: ANB0VdZvNXTGmhkJ/VAa/Cq9LehQ1fAJg5Xjk4xyX7aLEEl4BFwB+jRtCw/dH1ba0wJ/HH2waVzd2d9SUqDf3lTOaYs=
X-Received: by 2002:aca:4aca:: with SMTP id
	x193-v6mr1287374oia.211.1536748216772; 
	Wed, 12 Sep 2018 03:30:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 03:30:15
	-0700 (PDT)
In-Reply-To: <0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
	<CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
	<0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Sep 2018 12:30:15 +0200
Message-ID: <CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Wed, 12 Sep 2018 10:30:17 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-12 11:59 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
> It's a long term target, we should try to push upstream to accept
> openssl 1.1, such as split one patch to multiple sub patches step
> by step, make it more reviewable,  not only openssh, ideally any
> recipe depends on 1.0 should be turned to 1.1

The pull request has been open for two years now:
https://github.com/openssh/openssh-portable/pull/48

I don't think you'll get far with the pushing the upstream. They are
happy using libressl on *BSD, and don't particularly care about Linux
or openssl.

> Currently, use openssl10 as the standalone recipe to provide openssl,
> everything works well in oe-core + oe.

openssl10 upstream support ends at the end of 2019. We can no longer
afford to do nothing about the situation.

> As I mention before, there is still a issue at run time image. Even though
> openssh depends on `openssl10',  but the `openssl' is installed at do_rootfs
>
> It breaks DEPEND/RDEPENDS principle
>
> [local.conf]
> IMAGE_INSTALL_append = " openssh"
> [local.conf]
>
> $ bitbake core-image-minimal
>
> [log.do_rootfs]
>   Installing       : openssl-1.1.1~pre9-r0.core2_64
> [log.do_rootfs]
>
> The recipe depends on openssl10, but openssl10 will not be installed.

There is a library package split, so you should be seeing libcrypto10
or libssl10 installed as well. Can you provide the full log please?

> BTW, Is pre9 1.1.1 openssl a stable release?

Final 1.1.1 has been released yesterday, so I'll send a patch in a moment.

Alex


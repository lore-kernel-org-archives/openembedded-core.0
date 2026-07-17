Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E9FC44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 22:54:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.366.1784328867407087635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 15:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uTisPxB3;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955158f26aso388875e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784328865; x=1784933665; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILNGCLwRIExuCohJvIgo+6h71emKyscH7/swr72ZX2w=;
        b=uTisPxB3Bvx72Jqu7rr5U5jCl/3WnRLy/UomLKNrgAA0NXmU90J3nluU1YFuFwaGvh
         Idws+61I7WyLem7CXsN3ZTVBM36m5l37HupkyjyPYQ7wXPSxwlXoORxzL2Pca1lnnxZ9
         oFUOmK/Vx4Is4XivgfHDyMIdq2nciussyK9vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784328865; x=1784933665;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILNGCLwRIExuCohJvIgo+6h71emKyscH7/swr72ZX2w=;
        b=qmXbfyBuvU5fjwnziKmk0lAKqPNoLAVelCy+vFpl/YGROcPn6sZuHfjp5diOWp96kQ
         jt8j0XPYMDI8riu2YXHCLa9JkDv/R3dtu5Ok46/wR6exQP5Xx1K27cERDurF6BjItzky
         7oDGN7Jo57qpoZxszrsXJLBW/9HS9JQxbFrnMFTe3eS/FgaRuNGkZ39jr5iy50J/9++R
         69aAWmqCpw0hxvvYJw6KHRiqNzpdGqZjDk1qKdTiIVUkGEPBSg3o/aQG47v7hAdsxTOL
         6mCtQd93LO8OKM0JZpepd5Mu0JpNO1r1L52zrVhDMZQBBrhvnNd24OiSMsvaGi4wIP+B
         BMug==
X-Forwarded-Encrypted: i=1; AHgh+RpIL1wOZcP/JBNXhjRgwNSj9d0iZiKQu/X/QkxTbUS8u0O69ylL/a70goPmduXpPt9Bt9ykIEvEtrJfZ7hU1Ch5Sg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy95uZ1KhCDb2sEB0LGwkpB2x16rPjL+E0kHWHc3TMBiqzTlq2L
	HXPKQT1hZZdrqOvzf/EP2uGtWYkAtRuXyrXwQdw6/EfNWrWr5ugLlU4TlS4fD1Ps8Nrmzre3iYj
	0NDdNswo=
X-Gm-Gg: AfdE7clBv2VOOVYT+cIOu460uqwtMY/rUIxj5s6e4CjWUrsGlHZI9wZLPEsiSYzUz0W
	b2+9j/tSqrzcGA5Qd7UVTBleSzr6VWQuqWYR6fuIgQ1QvTbgqjImkO8QPIgKNmXNTln6AU2VYxW
	B87iRQVQgtdKDEaamzEMBdZqWZAZaE+gn1+g8TIuuGAMgEAtlzYxbaGADU+PPbCuojy/RWEdBhe
	vPMdD1TqnUtbWE08Mjpy8nRiTtjRSkytr2V127nE8XimL/xHjBHi10F9aDqA1A1hjcN9OghP4oo
	hIVpEZBs7Dm4K4/qJ+sb9FxUyjd92Qv7rMyKRZOdLXOvZ+nNAIt8ZEAxUt5nZU69MBIIRAM8pAx
	R4PC5pr7o1OV7Ag5biNozFs2PJ8eMubS5s0gVHon9UxmYHF5qXeKuvRL2z2x0Z9H2cIw/aaPp5/
	D8lf554m7w2mzbExlzrmvHt1QvbDmiB2i73XxbbVWqKmsWcEuzx1aMei4yhwn5VCni1hLd+7ZLj
	F8mJg==
X-Received: by 2002:a05:600c:c84:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4954a3ed4bamr49829345e9.13.1784328865278;
        Fri, 17 Jul 2026 15:54:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47de7sm80836425e9.7.2026.07.17.15.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 15:54:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 00:54:24 +0200
Message-Id: <DK17SK64QHVC.3AMHZ6WBZEDVG@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] screen: upgrade 5.0.1 -> 5.0.2
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260713071950.39540-1-sdoshi@mvista.com>
In-Reply-To: <20260713071950.39540-1-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 22:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241226

On Mon Jul 13, 2026 at 9:19 AM CEST, Siddharth Doshi via lists.openembedded=
.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> For detailed information, see the link below:
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=3Dv.5.0.2&id=
=3De9206eff9c9c97bdae4809c97c801e221fcf641c

Hello,

That link point to this changelog:
| Version 5.0.2 (12/07/26):
|   * Add %* escape to output caret character literal ("^")
|   * Add portable PAM conversation callback prototype (for Solaris)
|=20
|   * Fixes:
|         - [...]

The two "Add" lines are feature addition and not acceptable by stable
policy.

CVE fixes on screen will have to be done via individual backports.

Regards,
--=20
Yoann Congal
Smile ECS



Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id ABBE677207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 20:29:29 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id q63so38505973pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=PX1gk+f4wRXhjL8gRUIalnlFcsc43UL8gF5j2Z+pB8s=;
	b=Y6VelEhzFlsGc4BSybDMlayypkiqClNaXaI3udXVyGDpNfkBHLs7DosxLff+kOrOc9
	AU9b2P+K1FKb4uHvTNGQv83keClTVNA2KQq34c6yp2CDbO+xK8v5QN/FZyOBBn6shWOM
	KCeUkKaLRXaujgkBx1pWmaL/MA8Mv55wlhLhU5HVrDJYGaWnp6RHoh4QT44yVrouc1sU
	BDr3Nzskoh95Ud/z3eXvC+5wlpeNmDA9xeoiNiG4xPtlDMoaYtBxEjb602ARWsKiPhu/
	EqSv/2uIRLkBxE5SgNSxxVe5/AVZ4ACMSF84M4oIR0FU835tGZTp8R6z7dVFNfOdVraV
	Uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=PX1gk+f4wRXhjL8gRUIalnlFcsc43UL8gF5j2Z+pB8s=;
	b=T2uQeQNFGQkLUyxzfEGkgRr/Egg83Szk9ySeFbslaGeqbGLD7vIm7w6m6MF1BvmnG/
	3xcqvIq2ktor4Vda1XE6XwMOxv8arPGbC1OYbAojAyNn4PMVSWnBzYvG/BQZEnvVB1kq
	0ervMBM2myqHtzP9DtEgnn4PXhnj8jKpwDYwTeT0BPv2FHHDPEr+amz75RQdb+JSvNhv
	iNoPKDSvY33bLaYEMFiGA6crDpYVPJpa/Q+IZLa6Ok9V+MO72ADWg099nkBluZe9dt7y
	L+Dymdb1x/xPrXtf2qwvWKv/rpvBkHruFQFBJK8SCX0H0H6h8BibBeMFNxIn2B4/3QzF
	dutw==
X-Gm-Message-State: AG10YOQrrnSdSICU+zDueQSYfxXkqaNBBKzgTG+rDDuYGUfew6NWxhQRDOTUJV+2etAofQ==
X-Received: by 10.98.70.28 with SMTP id t28mr65567497pfa.110.1456432170557;
	Thu, 25 Feb 2016 12:29:30 -0800 (PST)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	a21sm14149710pfj.40.2016.02.25.12.29.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 12:29:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f47.google.com with SMTP id ho8so38837538pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:29:28 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.228.201 with SMTP id sk9mr65587801pac.1.1456432168669;
	Thu, 25 Feb 2016 12:29:28 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Thu, 25 Feb 2016 12:29:28 -0800 (PST)
In-Reply-To: <1456430535-11781-1-git-send-email-armccurdy@gmail.com>
References: <1456430535-11781-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 25 Feb 2016 17:29:28 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrr+b8a-de8+kU967tcqQTgYh3OF6Rq+yJqUuBu7HT_xQ@mail.gmail.com>
Message-ID: <CAP9ODKrr+b8a-de8+kU967tcqQTgYh3OF6Rq+yJqUuBu7HT_xQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-XXX: control orc PACKAGECONFIG via GSTREAMER_ORC
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
X-List-Received-Date: Thu, 25 Feb 2016 20:29:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 5:02 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Orc enables runtime JIT compilation of data processing routines from
> Orc bytecode to SIMD instructions for various architectures (currently
> SSE, MMX, MIPS, Altivec and NEON are supported).
>
>   https://cgit.freedesktop.org/gstreamer/orc/tree/README
>
> Provide a convenient way to globally control the orc PACKAGECONFIG
> option for all four gstreamer-1.0-plugins-XXX recipes.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

Cool! :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 546126D458
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 13:33:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u16so5480883wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=FszEOqU9KDXCA4jSwoTy9DirLHFk99wU3tWRc+MT/X0=;
	b=fPuDU7o3n2esqLuLz/DX10TGPwh/K4X7YPYCSaJd1DDkYkpVi2EKRZ9p2eVMcDKa3y
	mmHzOUttjjt8nMi4r1suAuE1Rw4QQXHsyEUIisAsZZJ/8/nVaMRjzL4CZBloij0f85xK
	XVipKxcaq4kg9De0gnXoO2abuThJeo19QYqC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FszEOqU9KDXCA4jSwoTy9DirLHFk99wU3tWRc+MT/X0=;
	b=FgpDpEqNS+Na5Wn0uTWQxcGmUrFf5N5yze0KBvXy/zJ+BiM3ao47/f471JNBPi+IE8
	QfFN8nHfemqO/Y0Bf9ww+dUrAEhk+rOQYSBZimifOb4R2r0jeVnw/Arc4y205v9qOy4V
	D+d0pY3cW0Z9hWyy+7oJPr6IMC2N9T/TmjzATo2siE3yzaNO8RjPns1yoElxJ+nKaWxM
	24tQidb8o7ZC4/gJngQG4z1NLL3NMDZX52nEKnfWcZXgEPBhzqHGTVBiaD9cqk10Xawj
	lALFDVKvEzEDrCZLWh0T/20X20uGSuGRlscUGOyU3b/juGFP6vnVjBoGwYJJJJPmTHKI
	vLew==
X-Gm-Message-State: APjAAAVfgH7d6lyl0MdsbH2kiX55rllRWz2Cl2dS134mSEFzlotIS2TM
	9cW0u0J7SlXigVBubMCALOp8Xw==
X-Google-Smtp-Source: APXvYqwQ/tpp2cSeCjGkvXd85qwbn/WvFaZsDBL4FrB8xCMvYzxND5YLaOmp8nZiSeyK9zaBQNrpzA==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr888677wrw.3.1566480832132;
	Thu, 22 Aug 2019 06:33:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20539867wrv.55.2019.08.22.06.33.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 06:33:51 -0700 (PDT)
Message-ID: <182613b04a933f2ff2183ff9c4b2b183f15ac156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2019 14:33:50 +0100
In-Reply-To: <20190820153219.62435-4-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
	<20190820153219.62435-4-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 04/12] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Thu, 22 Aug 2019 13:33:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-20 at 17:32 +0200, Alexander Kanavin wrote:
> Rebase files/0001-Don-t-search-usr-and-so-on-for-libraries-by-
> default-.patch
> 
> License-Update: clarified license for
> numpy/core/src/multiarray/dragon4.c (it is MIT)
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-and-so-on-for-libraries-by-default-.patch | 47 ++++++++---------
> --
>  ...up.py-remove-the-detection-of-x86-ta.patch | 32 +++++++++++++
>  .../python-numpy/python-numpy.inc             |  9 ++--
>  ...umpy_1.16.3.bb => python3-numpy_1.17.0.bb} |  0
>  4 files changed, 57 insertions(+), 31 deletions(-)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/0001-
> numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
>  rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.3.bb
> => python3-numpy_1.17.0.bb} (100%)

The -native version doesn't build on centos7:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/941

Cheers,

Richard



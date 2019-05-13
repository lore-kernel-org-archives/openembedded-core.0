Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7777DFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 16:07:47 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id z4so10496264iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pCYo8p5JGgETNHWzXs1s4Na5uQUnsDI4ZXoZUIVzj8k=;
	b=yzuy1O6VN8fD846rxffuSn9+xS73VA6S78gL9esRj1lu+MCinJrqEMGD+/GNwd5wc9
	Nhf9XWF3pvSmHNMdgFS4fXxQV3LVQs5hcwXQ7kLUHds/i+kD2zUgPLHQAf+FFdDFRCVZ
	GQhpEkKV3hOzL9j6Glg+h1t4O3T+D4JnPdTSYccQ/7+Dh2bbBAlxByJY3TqSTKWCIEue
	6gmV8S6nnzoBBUFnyoWpOZrJImZDLgmIv3E7YIROcyuMjEjwOS+/AlUy6DeBk25D+PxY
	o4BUE2ZaYAV8i7ZKLZLMyWuc5MIY2hZd0tc4SgblwkFjx27AJh4mchof7F4KKzzJn6J0
	OsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pCYo8p5JGgETNHWzXs1s4Na5uQUnsDI4ZXoZUIVzj8k=;
	b=EVxLWcxcriNcwXjuJ/Gpew1RVXg5cmqIKLBoNs/+UZ3rJEH9c1Vb0YFr4dA3FUY5dQ
	yja/lZNo1AJYdtiXuun/uODYXQ3RhE1J1PTkHS6x8ekSsCmi4B8z9D5Rp6cmyaBigwl0
	Xhr0Rtg7ryzFTMFIl2j8jdg9DE3+SPz/NKG4KFcnkrlgoebvJDcvDXQoIKw42F7WUJXf
	nQf8HtnaMbVELbyr8PlY6gwXLx5E+yfIRfku6/MMTGu+IgO71imbuuEr0adqLmKZY7pE
	AXM9Rbm+SPR8//LcYXuOJD/wkl/FdlhKAMkj4HxFvE1tch/xvznZp9LwWpBJxA+UJsso
	6qmw==
X-Gm-Message-State: APjAAAVOnpecQH25souZRE10Lql5AbwKqhOVcILncb1SMMcqb9PRmaL0
	1PpYc5cNxJizvsoRynWNVYPW11mAZ7m5STK0nvfeIw==
X-Google-Smtp-Source: APXvYqy686uxS+AhbUr0xZANIClJPzuqQh//ogyqlNEPsx8YoH7udcbl/gC5zCIemLBrnCkyiVa6LtEUs/PJ7TpStTs=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr13132182ion.20.1557763668676; 
	Mon, 13 May 2019 09:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
	<CAJTo0LZ=yDqyaZYv0PEOokt=6prPMa_gA=hnsYuNRA1oqw9TUQ@mail.gmail.com>
	<CAMKF1sorBuvDn0kmuPfn24t=vnM3QT_rT358REmcZkmZZS1T-A@mail.gmail.com>
In-Reply-To: <CAMKF1sorBuvDn0kmuPfn24t=vnM3QT_rT358REmcZkmZZS1T-A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 09:07:37 -0700
Message-ID: <CAJTo0LZybS8p_CgDjoo5aCCqm8+Yi7hFxP2TEivWWuMrw13fxw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 16:07:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 13 May 2019 at 09:02, Khem Raj <raj.khem@gmail.com> wrote:
> If intel bsp folks are okay with this then let=E2=80=99s go for it

Putting my Intel hat on, we don't use these BSPs.  meta-intel ships
its own 32-bit and 64-bit machines.

Ross


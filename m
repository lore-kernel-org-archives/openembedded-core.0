Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 652C679EAD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 13:49:15 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q18-v6so14616098iod.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 05:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oppvFqdSjdpSu3JCRbRg43/G14tvNk3dUw6MDf5/7KA=;
	b=b+ZOoEpLcuaZnK2TtxOa35+an1cXRDeLPKcs52H9TFHJla5wdl82K4fA0H7lAHMU2Z
	K6k7zV6/K5wnxtOJpyG5mEsng9diY/LU4CYo7k/X9dn0nHTFwEjWLZOAUZeRLi/h7ceW
	UBi3zYUFZhWNbjCjq1WSSFr0u2awETB9PAwMzWDVm1oKHf8h25f9nER/5azC1G3PhICL
	PNaJJhGANjfYv0V4983QXbybdSsV7RtAMVxGntdIj/65sFPABRasijhCsCSZVKCrMalb
	xGI5diuLaT5Jiwmva4F/9IQYXAIJ/IlLgLnVOE/GeaE3jrdT857zF66AHN7cv+rt4cTX
	E+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oppvFqdSjdpSu3JCRbRg43/G14tvNk3dUw6MDf5/7KA=;
	b=jWh1HqmEO8xTRQWLlyMtl1iI5q54DQUdyPZlgdr+h/haDp34kjTavf0SgKCGJnhacG
	GM31pgAkMLt0YJiVin0HBeupUuHzUu8ceXkTd/rTJCbpsqljeumq25Bc40N/3kkmKtHu
	E8G+4mLHrjk6amQAuT8LRBvY7dFVqfFP4hGCwThsevtFcqZq2ZZ8neOqDFBHW0aUqVa5
	RFuAd5Lts0U2hiQYpwA44hoflZ9Wy2fh8G201aN6flAQUf3FCe8zE1cbEKnjFdgbKyEE
	hstrEfMYNAgr8bdObmTVIyuSe/aKlKCrBSh0U+5rhWUElkmcnbQu97CGEUVjfCxTe6qW
	yObg==
X-Gm-Message-State: AGRZ1gJc6WnC1Kz/+Nv5BTOlWXYBFvN02xNfScMCglT8YrVjh7NK9svQ
	Cn6XxqijZ3JyBmxkdUujh61pSTn29Im417l+7WQ0AQ==
X-Google-Smtp-Source: AJdET5eM0uBy6sGvbV/9aUICCu2+gl8WMFqydybpTcR4UHdh6cySBZ28F28bMUFHnCl/lbptgJYhr2t7ETlvH2f9+Uw=
X-Received: by 2002:a6b:1602:: with SMTP id 2-v6mr3469246iow.201.1541684956501;
	Thu, 08 Nov 2018 05:49:16 -0800 (PST)
MIME-Version: 1.0
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Nov 2018 13:49:04 +0000
Message-ID: <CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Thu, 08 Nov 2018 13:49:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 06:09, <mingli.yu@windriver.com> wrote:
> +            if "tkinter" in pypackage and "tk" in pkgconfig:
> +                d.appendVar('FILES_' + pypackage, ' ' + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so")
> +            if "tkinter" in pypackage and "tk" in pkgconfig:
> +                d.appendVar('RDEPENDS_' + pypackage, ' ' + 'tk')

Why is this here and not in the manifest?

Ross


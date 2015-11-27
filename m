Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 30A156012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:13:23 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so112668293pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=bjVHs7MzJ7aqZ2PvbpkDCzK1OWpKL7Bz08qr7bjj/z0=;
	b=SMyqIdEotZvhJKRSBqbS9s0XRaYjrPidumLP5yyYxMjzadjOIlMyI76BdhirTgHAFX
	U9ORY3ivEgqqH15sxOZId+srOQxuVEoRmusYPLu8L0Is2iLnVp9pUhElXgXMFDitdVVF
	8crz6EpMtP6SwNsu9UN4Pt7/DUAKDqnSLWuo3oVgsndzNglOtALTRcqZbinInN1/SSN3
	sBki5I5CZB5K2kUgl8F9A5L2zkeZfyb3nBNqH477iqydVvd4fSiSEYm4BYC71KzwzFhZ
	LRN4oa1eUpVIV3FS5Y89mBX4z1yNCpvkgXPcsOKSl5cxH2HHWRmP/G4SoDfbtGipY1pl
	ofAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=bjVHs7MzJ7aqZ2PvbpkDCzK1OWpKL7Bz08qr7bjj/z0=;
	b=C1JQ+gcBN1cPK0rtNWvY1ZW/t7MPSX34tq8mI6jspj1CIMSDvKlDhNGcNo+ZaJIdDf
	LknN/T/ftfH8wHLjMnzZLlyxNXydYaNGvgEU6qOj5DfmKGmLcu3ZFykZmR3A/kaV/4i6
	CnxMW6SnTAcrjoLgWhmZfqLyfn+xWjX3oyghUX5KP6/zVhOjqVPZN1RQ1jX3uC3pnYLR
	hl+961mQaqENRqLDGhJwPF3OgN3sOevx2o32mQfsNK1AFGix3bXqtNXPctUWuxs7R1e5
	diIMwMkO/f3aONIO9ZdLeQ4kmtbUOJ0XRM1evtjrryhZu25z27E8tQfV8mB5sNZ1UNIN
	ZuMA==
X-Gm-Message-State: ALoCoQl1MTWxZEeaySmSCUC0lSVS+EORhDFuKurlGYVhAeBoYGfkv+dytDouNFZq/hiwJLyeyi2I
X-Received: by 10.66.235.231 with SMTP id up7mr67256114pac.87.1448622804062;
	Fri, 27 Nov 2015 03:13:24 -0800 (PST)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	tm4sm32279078pab.3.2015.11.27.03.13.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 03:13:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacej9 with SMTP id ej9so112667529pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:13:22 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.68.201 with SMTP id m70mr47331965pfi.101.1448622802153;
	Fri, 27 Nov 2015 03:13:22 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Fri, 27 Nov 2015 03:13:22 -0800 (PST)
In-Reply-To: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
Date: Fri, 27 Nov 2015 09:13:22 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
Message-ID: <CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Use libjpeg-turbo in place of libjpeg
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
X-List-Received-Date: Fri, 27 Nov 2015 11:13:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 27, 2015 at 9:04 AM, Maxin B. John <maxin.john@intel.com> wrote:
> This patch set provides libjpeg-turbo as a drop-in replacement for libjpeg.
>
> libjpeg-turbo is a fork of the original libjpeg project.Most of the major Linux
> distros (Fedora, Debian, OpenSUSE) moved from libjpeg to libjpeg-turbo recently.
> lbjpeg-turbo provides better JPEG compression/decompression(at least 25% faster)
> while maintaining same API/ABI as libjpeg.
>
> Once we reach an agreement on this, based on the decision, we can move the
> libjpeg package to meta-oe for applications which may depend on API version 9.

I support this change, due:

 - agreement with major Linux distros
 - performance improvement

I also think moving libjpeg (API version 9) for meta-oe is fine as
well. I am not aware of any application which requires it, though.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


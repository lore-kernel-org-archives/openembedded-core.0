Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC42D785E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:04:55 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id v5so7887526oth.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 08:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=4sHoorR0geMhcdMw0TEIyIwmvquTVnxAqhnghwYhsec=;
	b=xP6EDoXQlAg3sv26AHdyfUdNbM6N85G5CCRfl+GJUy9OCfxNmQPbLWcroJU53K0rlP
	lJOpeI8k/OPL56jNMn+9sYBw+hzJ9qfBOLnDnf16LDmE3NkSBJqMVcs34XZjqpUSkukR
	2PqeLeYrjvpoeaJA2J1+LrE+jZa1njyr393ag80K650/4jnjnQXPTKFEkSMpyTKCNztW
	PpvMETlAswnaD3AG/ZxdPovmSu/hAOEqqJMNfUN01OG+w7YVJmct3gt0Gx3q8jxTPI85
	3BN+eM43UV4xhtb3Bmn+1DSDyedSIIJdfpkDyNnMm2XgD6Vu5uZ3pn/LDarA3kz1aEOQ
	in8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=4sHoorR0geMhcdMw0TEIyIwmvquTVnxAqhnghwYhsec=;
	b=cg300arSnpB6PDUVcjEt8nSrK/yRicK1YZB4YUIZl5vfBJ2DAJEI2YAQ+8lCnGhSDp
	7iejzjDkhrXwcBHVO8XkfIq8iOLUVjG4Fjp1R0Jyh07IZoiDVabWTSxm42QtUXBg6SYL
	uIMDCOfEoDVpaUEuUUA+JhCbWUjQLnwMd7AIiqfKi9NVcYBMDqTRRkVq8Panv6IKIIQR
	b1wBFQTiD3TxbK8VSUW10buR2WrBbsx1858UDQwSlM7fZAoO6C4X1Ge7dnbgEmyJDVrP
	dHpcMoTl6KBfoOuCyyWnHkLCIg7HLShV63fsTenHVOW+Q8i477eKu1QGRxMHjUvgCeGV
	RRyw==
X-Gm-Message-State: AKwxyteWWWZUC4cXYHuW1Kco2+ubGu15wxURh+oJu08ePlQBgUKsUBB5
	saCDqMvuOjxwXPEWfC1ep9O+z5/I
X-Google-Smtp-Source: AH8x226cnLImVE9jp4gYV7vAiLoqPiXr2GAzo3lzmEetKRUVdBFGifrAo1ERkbITt5E9Qld3lDXe5A==
X-Received: by 10.157.37.74 with SMTP id j10mr4266263otd.184.1516637096290;
	Mon, 22 Jan 2018 08:04:56 -0800 (PST)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	w140sm229055oiw.35.2018.01.22.08.04.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 08:04:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id t16so6253647oif.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 08:04:54 -0800 (PST)
X-Received: by 10.202.71.17 with SMTP id u17mr3783048oia.288.1516637093555;
	Mon, 22 Jan 2018 08:04:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.92.130 with HTTP; Mon, 22 Jan 2018 08:04:52 -0800 (PST)
In-Reply-To: <20180117160330.30173-1-otavio@ossystems.com.br>
References: <20180117160330.30173-1-otavio@ossystems.com.br>
Date: Mon, 22 Jan 2018 14:04:52 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqi_TL9_LVCxiiW2iXfc+=jF7OYdm-rA2puudZojYtvTA@mail.gmail.com>
Message-ID: <CAP9ODKqi_TL9_LVCxiiW2iXfc+=jF7OYdm-rA2puudZojYtvTA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "Burton,
	Ross" <ross.burton@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Mon, 22 Jan 2018 16:04:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 2:03 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The 3.10.1 version has been in Dec 13, 2017, and has a great set of
> features and improvements since the last upgrade.
>
> The release notes of 3.10 release is available at:
>
> https://cmake.org/cmake/help/v3.10/release/3.10.html
>
> Patches updates:
>
>  - cmake-Prevent-the-detection-of-Qt5.patch: so it replaces the sed
>    command calls inside the cmake.inc
>
>  - 0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch:
>    merged upstream, so it has been removed.
>
>  - support-oe-qt4-tools-names.patch: rebased.
>
> License-checksum-change: added new contributors
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Is there any reason why it didn't make master yet?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


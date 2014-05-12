Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f46.google.com (unknown [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id AC133601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:12:29 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id n12so6748340wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=By75hQO2pL2r4i1EpptRRQeBgt5XVHFrW+YrDBqNI/c=;
	b=fH7QYrKgU7PTw8w773I9HARhz0E1l6+9r8qSHtk1W4gUFeBJxh3sZl3xj3SJ+s+eMK
	2ZYs4A6/0UfFy47x47nZFfufcbAdoT8UVN01W33vAQXTqLaRwPWiAAjnPybISNW2IoJ7
	yyFvQyuLPIpSlOwXwnpRZyPlm32tEOW7OYeXflKzzCVvbCl4ajHKTs4FWm3J3AbcoGNF
	ufWMak5lX2uMrjyxZK4uatr4VZhv0CieBxdsaM/eRrBxL7+RiiWnRg+xMirGqfBJdzQL
	9U7YxNWYBmwLYCr6XfopIgVZpHPEEt5Ja1RhmfuXMopFHblCNFAUuh02Svt71NO9iAVm
	6c2Q==
X-Gm-Message-State: ALoCoQnjk8OyPnNyB0Lvo/t8EbdzOP2cQsYzgkZ74uwznnjVFQEA+6W450Ar4Dk5mccAXcnTnJWo
X-Received: by 10.180.97.10 with SMTP id dw10mr15212097wib.38.1399893150523;
	Mon, 12 May 2014 04:12:30 -0700 (PDT)
Received: from ?IPv6:2001:610:612::488e:2c:13e4:3dbf?
	([2001:610:612:0:488e:2c:13e4:3dbf]) by mx.google.com with ESMTPSA id
	gd5sm17486504wjb.40.2014.05.12.04.12.29 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 04:12:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <1399889066.31891.126.camel@ted>
Date: Mon, 12 May 2014 13:12:29 +0200
Message-Id: <63638016-ECD5-400D-93B3-D28D80F850CF@linaro.org>
References: <1399889066.31891.126.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: Fix various makefile flags
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
X-List-Received-Date: Mon, 12 May 2014 11:12:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mei 2014, om 12:04 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> We need to pass CFLAGS and LDFLAGS to the makefile correctly so we
> need to list them as part of EXTRA_OEMAKE.
>=20
> We also have a problem where git hardlinks binaries in bindir with
> those in its libexecdir. If we change the RPATH in one of them, it
> breaks the other. We therefore set the no cross dir hardlinking flag
> git already has for this kind of issue. This ensures the RPATHS for
> the git-core binaries works correctly. Its pure luck this has
> sometimes worked so far.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes the libcrypto errors I was seeing, so:

Tested-by: Koen Kooi <koen.kooi@linaro.org>

--
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs





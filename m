Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0606978A95
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 21:36:50 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id v26-v6so8316169iog.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/9YM+zliVqyiht8gBt8fAU7c7NU8NuxGWTlOPkMwmFM=;
	b=Uu7l9y41dwBzHi61Zed+RIbupaBT3INrXLsiV/2eenI9Egb+QS4fkRgXrubEZiu+oC
	UXzLce4c/Rf3szB3EKts+FG+uVTndmc31lgS3eFXWXrQK42Os3NDnzIbc6j8VpY/Qgid
	bt1cwMWioOk4Zabnk2sBrMgSuli6NcKaSoV7ZuN4KbKIxSiLvJYAl9b+nqqadQFJb6AK
	XIAlGiZrga5ILCc6W/gUl3DINppsHpwcD2YTRGTmY/niNl7bvVzlPskHRs4VxFauS5OO
	BQ0wW2Jspc3l8XU7eJYTm2okYAgUxcdCIo4YvzHi1Cz0nZ9RKMH4QFXQMjd/M69/0i2A
	eCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/9YM+zliVqyiht8gBt8fAU7c7NU8NuxGWTlOPkMwmFM=;
	b=qVFbqqgsU5qhFB/KMHimCrbqs6D0n2C3px9BVhWOHHSLPCEurjY+5p3mCZXj+NxK8u
	lHWh03MPg209vE46zNojopWJEFxlZdCjOAAVzhCWGqdTJGiZM58LE/Zoop9kF6gm44R1
	ndcuQpjNjxUfdDIA2/y7qKiRtPmn+OiEBrXLVP73xRyHeBxCE4bfLMxPXCuniU6gI4+j
	v2s+U+yeAcec9Aspr0IF8MvepIx11AGpcoFhIOEDvSp3kFjj6HpSeDctbJ/OvesolK9n
	WXI+aSDsNfoTG0otp2OS/njCCzgSek0AmzCkufrPDN7N2jzG5WcAJb1elBC5Kjv4hm3P
	Osfg==
X-Gm-Message-State: AOUpUlG6DlG149B8ohq1ExFwBCD61pk2xm+vQByEFMSLgHtPikdTVfRH
	4waHfMmCsNp2PqlKmlH200A=
X-Google-Smtp-Source: AAOMgpcN3soL7XX+PR4O6AJXifX3toIuAY9J3rrQeSGMKz0ZEzmFlqBIHU5YSJUszd5O49hJ4niAFA==
X-Received: by 2002:a6b:a382:: with SMTP id
	m124-v6mr10101845ioe.188.1532036211749; 
	Thu, 19 Jul 2018 14:36:51 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	d12-v6sm233013itf.44.2018.07.19.14.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 14:36:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1850d1e3aba2151c44800c7b29b79f273607f0c1.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 16:36:50 -0500
In-Reply-To: <CAJTo0LaZRbRZgd9Usy7PPE4JDxaGUO0gO5kxrm5=K2LvE95hkw@mail.gmail.com>
References: <20180719163102.15234-1-JPEWhacker@gmail.com>
	<CAJTo0LaZRbRZgd9Usy7PPE4JDxaGUO0gO5kxrm5=K2LvE95hkw@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Fix pylibfdt generation
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
X-List-Received-Date: Thu, 19 Jul 2018 21:36:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-19 at 21:10 +0100, Burton, Ross wrote:
> On 19 July 2018 at 17:31, Joshua Watt <jpewhacker@gmail.com> wrote:
> > +EXTRA_OEMAKE += 'PYTHON=nativepython
> > STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> > STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> > +DEPENDS += "bc-native dtc-native swig-native python-native"
> 
> Instead of setting PYTHON and DEPENDS, you can just inherit
> pythonnative.

I tried that, but pythonnative.bbclass appears to export the wrong
variables for this case:
 export STAGING_INCDIR
 export STAGING_LIBDIR

u-boot actually needs:

 STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
 STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}

I'm not sure where the disconnect is there?

> 
> Or ideally, if it can use Python 3, inherit python3native.
> 
> Ross


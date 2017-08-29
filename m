Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id AEC086067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 08:20:17 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id d17so10583471lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=opVhA3ibMxV8aJ2i9BOa4V0Cca3d9sdkDOaNYGKhews=;
	b=HfReICmXryZ1hgmDQW7rYqTKVHbSAOyiF/RZD6lQNmZyDyseQQBP868c+vVUQx5UTK
	aa/fJ4fRnmaGJzwk8lrAhlxNNvlHFr7+dJA70LuychjkM1fpGdM/w31U4vyQC9p5lupf
	tnU/au1khLH+bYbK+TPwNwF2Nimo2MSfOsWwkJcqvVEbBEd2+N49nwYmAMc96/dyvcCc
	f0Zj5bLebrnKm365gn1BiNHghOdJablxWpvmUA1G8OmDaldU1amPrEd3SU421s/ZYywh
	oMrMr7sYyoi472w1tXldnsHDvlJouGPouhNNiuz2hDUwuLr/b5tH77VMaMwByf/I7Thv
	p+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=opVhA3ibMxV8aJ2i9BOa4V0Cca3d9sdkDOaNYGKhews=;
	b=KooMsIeZ5DOq8ChNdO28Mv/l90eS4e/8b/Jl/8x8PrCNyMuwLcMM65D7Hs6dDNt1xk
	t4txtwrqV4yexyObZMsz6i23KykdRIIYYnOWkEgCW/TK4xwSpnwqbXmbRIeWtNYJAjJL
	jZ53iFqXMegA9S5z0IrwUln5FgQ37i9xaE3zd/+zOWprSzCvAThGVRVZIKqrt9W0tR4t
	Y92cq/wR2U8+11+wolxYMHmRIhlPSExRoFDi8Ru7l35BkU2aFcgIWaoWzOj8yrEQrfCp
	ZdsUMpyub7GfSt9dRxiiThnFQbkz4IWZfumgwO0FWRhX5cKbN/95T4yN8/cv9FfRyZOz
	M/Fg==
X-Gm-Message-State: AHYfb5hJWgicZHtb13R2fT+L/37fO60W7F/WHw/YMJhvhlZlG2hZ2PUj
	TqGNnHL8QZlHon8c
X-Received: by 10.46.8.26 with SMTP id 26mr1487662lji.27.1503994818216;
	Tue, 29 Aug 2017 01:20:18 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id e82sm494254lji.83.2017.08.29.01.20.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Aug 2017 01:20:17 -0700 (PDT)
Date: Tue, 29 Aug 2017 10:20:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Message-ID: <20170829082014.ncc3tkyjrlurnkbm@ad.chargestorm.se>
Mail-Followup-To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1503946921-111882-1-git-send-email-ee.peng.yeoh@intel.com>
MIME-Version: 1.0
In-Reply-To: <1503946921-111882-1-git-send-email-ee.peng.yeoh@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170609 (1.8.3)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: add qa check for uppercase recipe name
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
X-List-Received-Date: Tue, 29 Aug 2017 08:20:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Yeoh Ee Peng <ee.peng.yeoh@intel.com> [170829 04:11]:

> Since we disabled uppercase characters in overrides a few releases
> ago, uppercase characters in recipe names (and for that matter, distro
> and machine names) cannot be supported due to their reliance upon
> overrides including the name.

> QA check will produce an warning message when it verify that recipe
> name is uppercase.

> [YOCTO# 11592]

Could you add QA checks also for uppercase in machine and distro names?

When giving an on-site training last winter (using Morty), I helped the
customer solve quite a few issues stemming from the fact that they had a
machine name with uppercase letters in.

I know that the bug in question specifically talks about recipe name,
though adding checks for them all would be even better, IMHO.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB


Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1671F60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:47:48 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q107so4460591qgd.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kPWVPB0sJP3mppaTuqidOTPGYbjgg7lWlhy1cUSKEKE=;
	b=RBrGBQhyzj/ygR/aVCR418khszSskbZRGSWzJdj6NxMMyXX1ko73eyJXLTvTG96aUh
	vXAT8CjXze6Tk+b/t1MEm5qnnQTdbU/5+/d2I8bjesa+GpRh/MzmH8+9HzFxqXWHIjUS
	/YzAaofOIrRKfhrc5vfRZsQOMEvRC6B8KysFmIGe9MEaJUf3EIPgaYUeFJ2u51o6b1hG
	pJZqhndBedJUAQm1pUiDKRdCCupYO9xeGFWaKqbH8/daQhRLocvacUJPiHppzf8PZLTU
	qRj6fl0kUoH8f5P+yO/y1YlETqf0SyH6s8qh041DXsBohEfyBC/wTwvmdoxr4HFQ0q71
	HeCA==
X-Gm-Message-State: ALoCoQmN2dv04URNDMw/zBGmSaFEBBiJvv73Ln0LT8zeR47OU+gsjme8Jk4uQdGqzCpDlzdUZMCM
X-Received: by 10.229.74.136 with SMTP id u8mr166039qcj.5.1411483667953; Tue,
	23 Sep 2014 07:47:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 07:47:26 -0700 (PDT)
In-Reply-To: <b5499b7e326e64e196dd73e7229ad9c483b72ff8.1411473883.git.hongxu.jia@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<b5499b7e326e64e196dd73e7229ad9c483b72ff8.1411473883.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 15:47:26 +0100
Message-ID: <CAJTo0LZcTFqhyWKTcYiWDHUCP-zKsYucnjPx9J1yjA3Zi66rvg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: enable CONFIG_BZIP2/CONFIG_XZ/CONFIG_UNXZ by default
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
X-List-Received-Date: Tue, 23 Sep 2014 14:47:50 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 15:19, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> It was required by info/man command to compress/decompress
> doc pages with xz/bz2 compression.

When changing busybox configuration, it's helpful to list the size change.

So for anyone else curious, buildhistory reports the package size (not
the binary size) as:

-PKGSIZE = 573632
+PKGSIZE = 585144

Ross


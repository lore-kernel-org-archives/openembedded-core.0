Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 34B6A76FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 04:48:11 +0000 (UTC)
Received: by lbbes7 with SMTP id es7so6124908lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=WaMPaLcyRT2tSf6ndXHNwS6XCQzfUAY7TizZOinAGBM=;
	b=NiGsQmuRhvn2N/HvjcfS4pVzCPykt/ujvSAOGs9cNPHvsOB1V3nq1eM1V4jInzbCce
	Wuov5XCbHPKRDjQMDu2MDmcmyac5cGvbp+49AhJuDrtF/JEM6BZ4bSMjU4Ug0CX7heFT
	qlKtvbmluMCO7drlbYyhk8/5KifqCcHY8evjNUcRvZOVw1jw/LoSfQ2U3a9w+HJNlpnU
	s9BCfO4MPQJG3vDqZJMrUsFdLNmUDUTVsCbqZQYt6NZDb/+hRajua8on7WvYLSp0ZFXS
	bkGq7Pw0WNfOcONklzfoXxFF6c1N/80jPHvqkpHx2MyOIJokuWyqNyXHV/yBCN2TBV+/
	37uA==
X-Gm-Message-State: ALoCoQnhm71SpHIyXzQ3AVOjr84hSFU3NtBO8XhKU5buzMagUMQcbysNgQJjIpu2LRELiBHE+SHa
X-Received: by 10.112.136.39 with SMTP id px7mr504611lbb.77.1445316490668;
	Mon, 19 Oct 2015 21:48:10 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id 78sm181466lfs.35.2015.10.19.21.48.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 21:48:10 -0700 (PDT)
Date: Tue, 20 Oct 2015 06:48:08 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151020044808.GA7776@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1445010543.git.joshua.lock@collabora.co.uk>
	<013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
	<20151019125722.GC16160@ad.chargestorm.se>
	<56254A15.20701@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <56254A15.20701@collabora.co.uk>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/6] systemd: build with compatibility libraries
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
X-List-Received-Date: Tue, 20 Oct 2015 04:48:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Joshua Lock <joshua.lock@collabora.co.uk> [151019 21:53]:

> On 19/10/15 13:57, Anders Darander wrote:
> >* Joshua Lock <joshua.lock@collabora.co.uk> [151016 17:52]:

> >>There are recipes in the Core metadata that have optional systemd
> >>support but expect the old, separate, libsystemd-foo pkg-config files
> >>(not the newer unified libsystemd).

> >Any size impact? Just wondering as you're changing the default.
> >(Assuming that it was off by default previously?)

> The compat-libs (libsystemd-daemon libsystemd-login libsystemd-journal
> libsystemd-id128) are packaged separately, so you only see an increase in
> image size if something pulls them in to your image.

Thanks!

> The -dev, -dbg and -ptest package sizes all increase slightly:

Ok. I'm personally less worried about those.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


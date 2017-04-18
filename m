Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6B55671AD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 09:05:54 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c80so26926102lfh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=FmR7juI7AIjtaiUEZm64XQldCg1C+GQVkpOzeYW2wFI=;
	b=LWEnYjSYC+A8+LvJks9Kk2NGXMHQhljWT/nhL2QkPITGXD3iSM4kkHRJdgRSuaL4o/
	Hek/ZeoBuvKYXOTfZxoXGe8vArtGz2CHbbU4jt3DesiTMSy419XLVsRtVkSlsvTYnDgy
	KrvIuHLBVcZXmzC2gxEiyTmEvvLnmVDir83nuWzwOsTe65N97hb7dHc5izlQYmetRd5d
	WozDSNX3FBl/BPlXEBMkFq3ZeoWN7ZYEzEjnfT9goXwlPTUd9OfHPfh+6p2+O0OpvZzo
	p3Rvjf/mQ17KG6NNiHXVHv08YTkj3EepX7jbIC3x5WKgEW66Zijr2SXfwIoIJ44Ajz9F
	z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=FmR7juI7AIjtaiUEZm64XQldCg1C+GQVkpOzeYW2wFI=;
	b=by/dbt923+TOhyPeumBtpCDbZ2IQ3/JjwlRQ9KnpSmmWKghIgeq0FJ+wTCXvBwrMwq
	+5cUrqHE9IK8uqm5lZGJt6oxl1byn/PDkmksdwfZIdEUzK62HMpesltbATkpiUaKPwGf
	Gu8wTVeajbqsxogYJt16V8uDmhxk98UnStAaRocH1lmphhv+2UxyFwjWlnOXV+lBpzv6
	Yw7dntGbZ20IizD1TU+eDD7hmJmMJ6dII7OPTwr9mdsbEgjDrK9cV5XsnqT8Rbh+Sf9U
	9hL4vh0FLP5U2W8s+iJj6LWGWYALmDD8p5Wt4ChRNqrBv348twiFf1QiKKul5x0VUQwN
	8p+Q==
X-Gm-Message-State: AN3rC/4NlVhPohg68W5XjskYtfNxoX1d6jxl079L10ZCfdVcLw+AMGlJ
	eGpxHuDB4mNvXA==
X-Received: by 10.25.204.67 with SMTP id c64mr4138759lfg.107.1492506355681;
	Tue, 18 Apr 2017 02:05:55 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	u194sm2419939lff.48.2017.04.18.02.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Apr 2017 02:05:54 -0700 (PDT)
Date: Tue, 18 Apr 2017 11:05:53 +0200
From: Anders Darander <anders@chargestorm.se>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20170418090553.djkvtl7kqrqjcnmd@ad.chargestorm.se>
Mail-Followup-To: Robert Yang <liezhi.yang@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170417075428.31171-1-liezhi.yang@windriver.com>
	<20170417080155.6649.98000@do.openembedded.org>
	<f714e4d3-5554-0db0-9198-217a5c2faaa6@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f714e4d3-5554-0db0-9198-217a5c2faaa6@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxheWVyLmNvbmY6IGFkZCBkbCBsYXllciB0byBMQVlFUlJFQ09NTUVORFM=?=
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
X-List-Received-Date: Tue, 18 Apr 2017 09:05:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

* Robert Yang <liezhi.yang@windriver.com> [170417 10:14]:
> Where should we send meta-gplv2's patch, please ?

According to
http://git.yoctoproject.org/cgit/cgit.cgi/meta-gplv2/tree/README,
patches should be sent to yocto@lists.yoctoproject.org.

Cheers,
Anders

> On 04/17/2017 04:01 PM, Patchwork wrote:
> > == Series Details ==

> > Series: layer.conf: add dl layer to LAYERRECOMMENDS
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/6384/
> > State : failure

> > == Summary ==


> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:



> > * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at ba2884f6ad)

> > * Issue             Series sent to the wrong mailing list [test_target_mailing_list]
> >   Suggested fix    Send the series again to the correct mailing list (ML)
> >   Suggested ML     bitbake-devel@lists.openembedded.org [http://git.openembedded.org/bitbake/]



> > If you believe any of these test results are incorrect, please reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a new
> > version of the patchset if applicable. Please ensure you add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > [PATCH v3] -> ...).

> > ---
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB


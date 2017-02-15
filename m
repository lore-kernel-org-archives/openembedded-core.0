Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id ACD427724C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:10:28 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x1so77983616lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=53mvRPkHzzI/h6MQjVZKfayWRb+38gJOkvujgcuMsTg=;
	b=0oEr/aIm3koAi9X/dOyjDGnZ1ZOdXAI20fzDPdrI7cmxdN3EC70qTf8N5AitwXtr0j
	MhS+0b2w8bYGK0TvJIp6njCDqNlqkvXmPyYgrSFMUqSQtc9dnYoOJRyKgBSNfL3qoyex
	savrUnAlCtsCqpgoUHdJTNMes4Kajo3rWpFFXV2Px7rTwTmiIs1DqDIjxrAAUSXYWfMC
	uaTN5g2Te4csB2F1w0ZfOYTnfrKg+SxDD/Ss89HDoJ6998guqsMLi2x1Hha4BbjFkZL6
	ZyXUlQWyGlIr78ivfRPItdijOhh7xKS9yVyjMQTdyWcqTo1ZYEfmbaeQTapQva/rNS9f
	3mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=53mvRPkHzzI/h6MQjVZKfayWRb+38gJOkvujgcuMsTg=;
	b=bwos1uTMyhoMy3iIIYLA/Fg/z1tohmkXG3GY/njDqrS1HHTOdLV4kUj9WmADYLeGJv
	lPdtTvtBZ2EzK2uiVR6rwOG21InW/1W3uZeZr01Qli6l8AD/TkchPg1yoIqRimPwiUzL
	Z6ZoNTp0wbgbevetZADyEsYxyDyUoW/TnwY5MlNHvNWETLugpYiPaymAdQVkJ2c5brIv
	/l6beQwlKJkkNsLIrzUjXuF1hvIR6NlthUmYgJyIxINHF1dmhGZZdFkUMj8M96A+ckw8
	iTG/ZAzfAykwH2TPYaXVmnK+iGzTe3s1ZrUDqC6LrgDzrrR/mUvSHlnZvIA1m+l7hJzF
	b0xQ==
X-Gm-Message-State: AMke39k1UgtHFly0f2gNuCVO4cxtCCvT7e0xuEDSkX7QC/EnmsAXXo/NKgO9wWhAeh3iwg==
X-Received: by 10.25.203.87 with SMTP id b84mr10133090lfg.158.1487149828176;
	Wed, 15 Feb 2017 01:10:28 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id x3sm770592lfa.7.2017.02.15.01.10.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Feb 2017 01:10:27 -0800 (PST)
Date: Wed, 15 Feb 2017 10:10:25 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170215091025.4s2wzpagchlssqgh@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<e1b1c67d691fd317bf6c11d570ef5d261029f38b.1486997986.git.alexander.kanavin@linux.intel.com>
	<20170215081731.lf5vtdcbong4xsyq@ad.chargestorm.se>
	<fd9dca04-e3ef-077f-e67d-3b3bedbe7dc4@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <fd9dca04-e3ef-077f-e67d-3b3bedbe7dc4@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH 22/36] package.bbclass: add support for pkg_postinst_ontarget()
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
X-List-Received-Date: Wed, 15 Feb 2017 09:10:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Alexander Kanavin <alexander.kanavin@linux.intel.com> [170215 10:01]:

> On 02/15/2017 10:17 AM, Anders Darander wrote:
> > How will this be handled when using ro-rootfs?

> Same as it's handled now: by halting bitbake. See the email I just wrote to
> the oe-arch list for details.

> > We don't need to make it easier to write on-first-boot only post_install
> > scripts, rather, the goal has to be to be able to run all post_install
> > scripts during rootfs creation...

> This is not always possible. Some things do have to run on target: because
> qemu emulation doesn't work for the target machine on the build host, or

Well, if the qemu emulation isn't working for a particular target, but
might work for another target, the post_install script can't be moved to
pkg_postinst_ontarget_${PN} anyway, it'll break ro-rootfs for the 2nd
machine as well..

> because the post_install has to interact with target hardware.

Sure, but this is really the minority of cases. In this case
pkg_postinst_ontarget_${PN} might be OK, but I'm worried the it'll be
used a lot more often, because it's simpler to deal with...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB


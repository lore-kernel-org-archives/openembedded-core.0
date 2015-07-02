Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id AA5FF75C49
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 11:30:50 +0000 (UTC)
Received: by lbnk3 with SMTP id k3so30065761lbn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 04:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=swY/AMB9Pi0DRGBMQMoBst01Dx7Q/IFs8NNSXPJe4nE=;
	b=iEI6ZwnyQ3x9qAFTkuhoZumpXB2x7ObroXew8eGm2tgAnnn/Bg67VddXvu90Fbf+XP
	ekJf+9hL6eHJsHH39KLu78YpeN/hwFmPh1VhKgjny+9tlzQgl84DAGkL+24FAB3N+T91
	09y4Or5Bm8xFHWcDBebgihD0jrTHu0HGdsVTxLJNQQVU1pI8L/t2tUV6VQlF83QQQSJZ
	gbw3AELU9bKdfvsJlccBJNBWAEg8XX1gaTI4Vr2pQDvlSeblVKS11WHFCJG1g+o8+3Nw
	p93oQuJFWTrX8cfcISoyH7sGKOoHng+Fdbi2XFRni5ki5WLKh0LV+Z0QgvrycUc6vGh8
	8UIQ==
X-Gm-Message-State: ALoCoQmDF8v3IZYO00Kk6hipoPwDJ370qVGx2c5WBJpRQAjw0lMAye7MRczKVD44jGQoqN3ps/Ea
X-Received: by 10.112.30.176 with SMTP id t16mr26549158lbh.30.1435836649330;
	Thu, 02 Jul 2015 04:30:49 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by mx.google.com with ESMTPSA id s10sm1319246lae.47.2015.07.02.04.30.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 04:30:48 -0700 (PDT)
Date: Thu, 2 Jul 2015 13:30:46 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150702113046.GB9269@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Thu, 02 Jul 2015 11:30:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Burton, Ross <ross.burton@intel.com> [150702 00:43]:

> On 28 June 2015 at 14:18, Armin Kuster <akuster808@gmail.com> wrote:

> > this requires the gnutls 3.4.1  update or the current gnutils build will
> > break.

> This appears to brake our partial support for building core-image-base
> without GPLv3:

> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/372/steps/BuildImages/logs/stdio

> Either we trim down what we consider buildable without v3, disable gnutls
> in iputils, or include the older versions in oe-core.

Without looking too much at this specific issue, I'd say that we should
keep the older version in oe-core. Just as we normally try to do when it
comes to GPLv2 / GPLv3 upgrades.

In my opinion, having as much as possible build in a non-GPLv3 build is
a desirable goal.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


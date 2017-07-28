Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB857852B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 18:43:14 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 125so114359618pgi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=OPJfUzaceqhjIdxmBE1jD90vShvBGmD6BzZbOWqhk6U=;
	b=jvq7iVTBFWmvTWClroyY+mIpFpRr7B1FvUGVzu55iPScNkGjNXmfC400JedPzcNAXg
	rKDrBpWA+xhkNk/kZ2WHpBdaPue14FKcQzmh1YFKHtidi9Llw4CBgsRyG3J+EUzB8nEH
	tK8KAlL/Wf/SCmnNt/xnBpFF/4dbU+KFKehRRKpVHo/Lg0nDIKD1yr4tejzHqiMIWd3a
	7Xcqb1NBIdCDJRKZ39oVmVsYPnK5eFetT49deOEILpCTi5Z0r5y4cjbqAQzb+J3IoVZr
	BgeBo034FTJaHzDp0l85Db/6e/7705OrxCJPlQk7fGgURFfJrjHa+r//qQ7Y3//iWb98
	nMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=OPJfUzaceqhjIdxmBE1jD90vShvBGmD6BzZbOWqhk6U=;
	b=o5DjKEEjVcXIOdClO15X9cKVBYOp7LnVo8hIaiJAqrUuNfUm6MuypEpTlLPMBBsGvs
	ZiLKehJq0mTR6njxDfJjKyqsyt8xUDk1W2i4zyGlhjIPJApNkpaOKr6lWol5l/dOPudC
	AeyCGaQCmst2R2ztgb4jhL1+pGl535B1Cf9Pj6JtHq48IGx1gJ8ZUuvT1Ba0JZIfQpEh
	3ZbAqlFQK1VzNfNgozluau1H81TAU9voUq8ZhRJDO5hxSxRXJxuIQebXriyoIbqn3hlz
	zI8RkUNLbAaE8sroXg+Wb1QC8kLMZx0hH4z0icbcDGc4ulN2wCeSJsjJmH4GyKXH1DKL
	No1A==
X-Gm-Message-State: AIVw1137pePoj2p4yo9OMNIlIUI73w3J2ZxL6v1fm5iSVRy4/nYtNlm7
	XYDRk4+gXcnlBVrP
X-Received: by 10.84.241.13 with SMTP id a13mr8636170pll.307.1501267395738;
	Fri, 28 Jul 2017 11:43:15 -0700 (PDT)
Received: from pohly-mobl1 (p57A5633D.dip0.t-ipconnect.de. [87.165.99.61])
	by smtp.gmail.com with ESMTPSA id
	w24sm16308461pfk.183.2017.07.28.11.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 11:43:14 -0700 (PDT)
Message-ID: <1501267389.18875.14.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 20:43:09 +0200
In-Reply-To: <CAMKF1sq12PyVfGStOaeuSBHx0c96chYuD7jM27pfpcm9zNurhg@mail.gmail.com>
References: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
	<97b966925eaaf20263e0f8938806b6e015fc6c70.1501253351.git-series.patrick.ohly@intel.com>
	<CAMKF1sq12PyVfGStOaeuSBHx0c96chYuD7jM27pfpcm9zNurhg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] autoconf-archive: simplify and fix recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 18:43:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-07-28 at 09:44 -0700, Khem Raj wrote:
> On Fri, Jul 28, 2017 at 7:49 AM, Patrick Ohly <patrick.ohly@intel.com
> > +LICENSE = "GPLv3"
> 
> Perhaps  GPL-3.0-with-autoconf-exception would be more accurate here.

I wasn't sure whether such a thing existed already, but yes, as it does
it could be used here, with COPYING.EXCEPTION added as second
LIC_FILES_CHKSUM entry. I didn't want to be that fancy, but I can also
do a v3 with that change.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




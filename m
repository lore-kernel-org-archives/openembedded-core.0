Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 899BA77CE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:28:43 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id r16so11633221ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=jc+Hbm4G7lSoPXEEqrnbMDQ252OsiR8VIeSfQr2hFeQ=;
	b=kSK2SMyoEJ17YQ8Y6Om/+9qRf75/o82dBjpP1WiO2Foo6dNnr0x2xKj7L2u5sSxR7s
	R6Law7BJHXI92ilP4NKcACLS5EMRoOzSfsFTdzzQkqN3Hb/jKRlnRFPfHGo+IGvnkBlS
	VI+a7vX3jiTykxLIX6u/hRgtASpPk1QuduQzvwnB4ycCMOUqde+Vj4dFu6vROJ7/HDnw
	1j5hoq1ptwA0Tsaj5TQwM4ruCmTNuLl0dWGT2dn8p63UKP7Tsw7419WWyvf2RCPBNZPe
	gL6WTeiyXB6NS8R/XL1kVYO8/ga9kPj3snHQ95dxSQpVqIYudlm/bVeMiU9DaAHgEBVX
	ldeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=jc+Hbm4G7lSoPXEEqrnbMDQ252OsiR8VIeSfQr2hFeQ=;
	b=FTQpYrCrbg86Tf1j2ffUiJfwOS6qXYAfyN+IY4Lh0u1gbOJk5HIqpNaNi6gkXsmQEo
	sZYZnt3YOfYyF4K8UZoQwr/JD0jFXOt//a+ooBHDGMUOHXJTsdhFZgDV4S89zZh/YOdK
	gSxiN6Mxc6cS8QMPq1vLhvdz5VTrHJgR6MZputpnon1hQd9YIPPmoRHrBj93Bq3Gkhq6
	Em3Gan4x/gVRotIxiho+JTelRZZhx3/kACHo0W0+b7aChYxyo+qgvhqWiRM4gq4IYZYg
	9f3KfRZ7VYxasS2a2NMTERu+5tDaJb+tnE4tN3yfqwqowYgR/0LbA54LG84Fj5cuhOLx
	avcg==
X-Gm-Message-State: AN3rC/4pm0tnb5Wg32t8bDfSTl1eGpw0A9GHtZJiZC2SIOrQzkj24jyKwbFn+ImFUPMFOqK4
X-Received: by 10.36.12.65 with SMTP id 62mr10120866itn.16.1491935325432;
	Tue, 11 Apr 2017 11:28:45 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D3A2.dip0.t-ipconnect.de. [93.232.211.162])
	by smtp.gmail.com with ESMTPSA id
	m133sm1947983ioe.61.2017.04.11.11.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 11:28:43 -0700 (PDT)
Message-ID: <1491935320.10884.209.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Apr 2017 20:28:40 +0200
In-Reply-To: <1491935153.12091.37.camel@linuxfoundation.org>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<c647b8b4229e8862b8066f52aaefee133a65e6ee.1491922350.git-series.patrick.ohly@intel.com>
	<1491935153.12091.37.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/8] -cross recipes: ignore TARGET_ARCH sstate hash
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
X-List-Received-Date: Tue, 11 Apr 2017 18:28:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-11 at 19:25 +0100, Richard Purdie wrote:
> I'd tweak the subject line to recipes/*-cross:
> 
> On Tue, 2017-04-11 at 16:56 +0200, Patrick Ohly wrote:
> > "yocto-compat-layer.py --machines" showed that shared packages like
> > gcc-cross-powerpc64 have a sstate signature that depends on
> > TUNEFLAGS. As a result, there are unnecessary rebuilds and potential
> > conflicts in a multiconfig.
> > 
> > That's due to the way how TARGET_ARCH is set. Richard Purdie
> > suggested
> > setting TARGET_ARCH[vardepvalue] as fix, which works. It would be
> > shorter to do that in cross.inc instead of repeating the relevant
> > line
> > in different recipes, but Richard was concerned about potential
> > side-effects in other usages of cross.inc.
> 
> s/cross.inc/cross.bbclass/g

Okay, will do both as part of V4.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





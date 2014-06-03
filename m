Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5E80A60167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 10:38:45 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 63so13027341qgz.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 03:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jy1nZGOsW39jARNAC8661KLJO3vRkQIdXLMHRCPOVYE=;
	b=eLVudBh2U3f1Qst9ECkhTBbmGRxq8KPCfN8fMDTOAyE4TrSSEqVOgbdCAsLZHsluLO
	QvMABjuwrN68DojHdkd27LJMhZ8g7r02Jg9ul0ZLE0SJBzCss+GKiymKic1zmwCfdzJY
	dAslwOeovW2zZucweY8fGvt8klPDI2V/iI+85qMg9Gms/1iFGA/p6xPA6PjmLvaKDmvl
	/JVc4OAsxPglcZKBUKn0Obd2BUpJdDUI02fq45Ci+JVrfsTiRjrbVLavLYQX+vYfZiZd
	Vsi183RAAA8HFtR2n5vn884hmRGnP1zbyzoqLWDZZzgopLjsBlImQlzdOr0VCfcDGwHP
	RpyQ==
X-Gm-Message-State: ALoCoQkAbynLmNgXEbbFnoI4Pho5TG0lbYABKtmI5x50qhaG6Uk+UdMrQ10htWkLdDwT2op6/2eG
X-Received: by 10.140.109.70 with SMTP id k64mr55176402qgf.92.1401791926597;
	Tue, 03 Jun 2014 03:38:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 3 Jun 2014 03:38:26 -0700 (PDT)
In-Reply-To: <538DA04D.2080900@windriver.com>
References: <1400774540-4405-1-git-send-email-ticotimo@gmail.com>
	<1400774540-4405-2-git-send-email-ticotimo@gmail.com>
	<538D5448.2040308@windriver.com> <538DA04D.2080900@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Jun 2014 11:38:26 +0100
Message-ID: <CAJTo0LYee-8rcwjqHnWcgKu_6+HycpnyPumUrgucO+W6rRhzOQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC/RFT 1/2] wayland: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 03 Jun 2014 10:38:47 -0000
Content-Type: text/plain; charset=UTF-8

On 3 June 2014 11:15, Robert Yang <liezhi.yang@windriver.com> wrote:
> Subject: [PATCH] Makefile.am: just scanner for native

These patches are getting quite intrusive.  I wonder if upstream would
be happy to move all the scanner parts to a single directory so we can
make all ; make install inside there.

Ross


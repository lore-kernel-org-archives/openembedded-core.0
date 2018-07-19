Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBBA5789E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:00:55 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id j185-v6so10905910ite.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ILAb5ylVjG/8WtZa1BiinnWkixTHlbzg8oCeFW4Xr7g=;
	b=Vgweo87O+tEtV/9qYQ9PGxlTUWJcD58S+RFQH+ia/WTm9TjBunmMehlJyH47B1tcvI
	vSJjVYvy5z1yMEknYX02jV98f5pu2FMRhZ8hWK34FDeJ61ZaiG0nDZ+23HEi5xhtKZT9
	6sIxi7C7i6qQEf2Dw/ObodFQa2CluUQG+TGkkHKZDj/ZnOQvI4lKBOQq5kQ+pSkLfrjM
	8eUypJvX55W5srqqlcWyjyBInLu87PmAfk8ExMndUXdACQKiyvFrCw5bD/wxSw7NHFNx
	plx1DFxg28eHCR7AbwRVi9KBHFTLEdk0lLC0hodIiQECp/N70E5gv0TdDeFivfGVba5x
	8Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ILAb5ylVjG/8WtZa1BiinnWkixTHlbzg8oCeFW4Xr7g=;
	b=mRr9J+9FbfYeJqMzdHLnZZ07aMLk+walmZ5ZKQan5+3BRHI+iPzCcBm/GUpSjKYlFh
	pBoWVo60jlZ3bVLDcY9Alw2v1guIeNjAegB2AI7C43Sn6/P9Qxbt+flrgEwreTEU/Xb6
	ztiqrGIQjjT0xXC6Y7hH1gSNmM1K/5MkNpO1h+u4HKoE8FPVB8MtchrAO3gwwPq5XCTz
	tZGmWEPdHnmBS0wC0hI8QePj8x1zmDsBqJFTaF8M1pyj5KhPod73zjgKebgPKWM7WZlc
	xhvHlLQnASxMsgtC+dga0tvySwnM3P57d8V2DvWViSUh5khZ2QoReLTKavOvm39IRaOP
	ImPw==
X-Gm-Message-State: AOUpUlHm6fe2iYT5XdBTtOHKWsDhngj5zUki4/7TVVEdunVc0Bxol/FL
	Ka37lQZHrkHT+mWmBltiEaM=
X-Google-Smtp-Source: AAOMgpcUb9I8SZuH+qY3YNVMLPiKM+3+kI4u0pMCuhW99rqVY7tK61UXHBuJ0Uo34lV+52Tu3sGTJg==
X-Received: by 2002:a02:98dc:: with SMTP id
	c28-v6mr10122916jak.47.1532019656692; 
	Thu, 19 Jul 2018 10:00:56 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	189-v6sm1503itl.10.2018.07.19.10.00.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 10:00:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <17eec68ff43fcf0259a4e89233e66a02907d0153.camel@gmail.com>
To: Marek Vasut <marex@denx.de>, "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 12:00:55 -0500
In-Reply-To: <95864f6b-fae7-eb3a-ac2c-0e4efb18f88a@denx.de>
References: <20180711150308.30275-1-marex@denx.de>
	<CAJTo0Latp_c1LVzzObR+FPYosVDuohbRwnGfOGruxaoHLSr8Uw@mail.gmail.com>
	<95864f6b-fae7-eb3a-ac2c-0e4efb18f88a@denx.de>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Thu, 19 Jul 2018 17:00:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-07-11 at 20:56 +0200, Marek Vasut wrote:
> On 07/11/2018 06:10 PM, Burton, Ross wrote:
> > On 11 July 2018 at 16:03, Marek Vasut <marex@denx.de> wrote:
> > > The U-Boot build, in particular the pylibfdt, depends on swig-
> > > native.
> > > Add the missing dependency.
> > 
> > If pylibfdt isn't usually needed (which it cant be, if swig is an
> > optional build dependency which isn't on my machines, or the
> > autobuilders, right?) can we just disable the building of pylibfdt
> > instead?
> 
> Why do you think libpyfdt isn't usually needed ?
> 
> Why do you think swig is optional dependency ?

I encountered this same issue and was able to track it down. The
problem is that u-boot is building pylibfdt using the host Python
instead of using python-native provided by bitbake. pylibfdt is a non-
optional dependency for several u-boot configurations, in my case qemu-
x86 and qemu-x84_64.

I pushed a patch to the mailing list that I think fixes this: http://li
sts.openembedded.org/pipermail/openembedded-core/2018-July/153115.html

> 
> > Ross
> > 
> 
> 
> -- 
> Best regards,
> Marek Vasut


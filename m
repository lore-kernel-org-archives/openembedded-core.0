Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5633370F28
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 20:11:03 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id c9so1368153qcz.39
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 13:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AUzEsT1KhiPnFckK5fX0bE6WxQLviYUbvbCTwkkMBqo=;
	b=m+NbqxmSv3gRcjehQWaKfaZNZsA9JEcWutkebVZSKI1IfEGkXsRDXhUjZ8RVAHLGaX
	RZY88YHzvCOUNJA8tjkYC1zH2L5R3kNGOIcF0DRpv9bWJ1zKMGjLFXlEpS7X+Td+Fs5S
	qYqSeDUZUmAdettooE/ODzYRDsATMR9waiMmgdQ26Lvrh7f37aZCkH4EwwhYPU0XTkFb
	Dm5F3W//RkIXNCMCX8QO1AFwg7Ao8jEDbCMxdGjfnyZ0XQ0A6bT3t8QUGrY+gIhh6oKi
	AN1VcVnIQzf71QD/oyj/mu+wVf7Vn/hDiKH6bqBVKkDQKBz/oJycbM7vFPygbocCpzXQ
	WHJg==
X-Gm-Message-State: ALoCoQmav1mSmNP6hfjzhBi1nIEG/rF1nuD7zNx2L7HXgQaszHUSvWCptH1JbKrr++2+oRFWL4hv
X-Received: by 10.224.166.195 with SMTP id n3mr1975922qay.22.1409256591124;
	Thu, 28 Aug 2014 13:09:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 28 Aug 2014 13:09:31 -0700 (PDT)
In-Reply-To: <e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Aug 2014 21:09:31 +0100
Message-ID: <CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
To: Nitin A Kamble <nitin.a.kamble@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>,
	Darren Hart <darren.hart@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 20:11:07 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2014 19:47,  <nitin.a.kamble@intel.com> wrote:
> +PE = "1"

No need for an epoch.

> +PACKAGE_ARCH = "${MACHINE_ARCH}"

Wouldn't it be simpler to have this as normal architecture, and depend
on a machine-specific data package?

Ross


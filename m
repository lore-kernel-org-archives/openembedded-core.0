Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 61EDB70F06
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 20:34:14 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id i17so1398369qcy.40
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 13:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JmEswy+vcyafk7k6LMprqGsVDZvYbD9Y1wMDJIdlcP0=;
	b=AqWW47z0p1PgJAxkzkuhAdUW65EEFHwOy4mAaQvHb66jSABo0GLPVmxHaOnDh95OAU
	3tD6SvZ/Ys+cM8gNJ1VVlJ38AyDhPI9Wdnm2ej+NqXHT7Q26gBEhaDXXno4aHscz6wxi
	y6GGgWzHhwr5h8mWaxOgC+ENYSMnGXTDn40MsKr69Fsrzfnyh8gefukxTdZr1kKhgF3S
	IDJQ/fab/SM7wXteP6cwUqCGQS4pZ3er1IWuKejqSK7JEL95VqOO660aW7OKuW7YEG3d
	pmfHmDo5geUJKyV1vZZrwlD52gAWwR66B281WViWmuRHVefbT9+qEtG51FTGvlH1iDKy
	AvRA==
X-Gm-Message-State: ALoCoQmnqJvpXA7h1XVw5tlMxknBiVd36ss0JTwnl5CMqI70daa6fCpFA+0FKgqS5RG1CfEEv5N+
X-Received: by 10.224.103.65 with SMTP id j1mr10630451qao.17.1409258053167;
	Thu, 28 Aug 2014 13:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 28 Aug 2014 13:33:53 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Aug 2014 21:33:53 +0100
Message-ID: <CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>, "Hart,
	Darren" <darren.hart@intel.com>, "Wold, Saul" <saul.wold@intel.com>
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
X-List-Received-Date: Thu, 28 Aug 2014 20:34:19 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2014 21:14, Kamble, Nitin A <nitin.a.kamble@intel.com> wrote:
>> Wouldn't it be simpler to have this as normal architecture, and depend on a
>> machine-specific data package?
>
> This really need to be machine specific. For every BSP different files will be packaged.

Sure, I was proposing an imageconfigurator that is not
machine-specific, and then imageconfigurator-data packages that are
per-BSP.

Ross


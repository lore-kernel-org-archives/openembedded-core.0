Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 797E771633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 22:48:03 +0000 (UTC)
Received: by wesu56 with SMTP id u56so58957wes.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=UfPprTkceTJup2AovesQyBzRASUgUOTEUp1tFHscVoA=;
	b=sR/BA5/JVi+eVoAHjRVWtJLeVvpmVsRew0PC3OcFCri1kOGrZ0HFbBDc0DCKtesbH9
	0OZ7Uxw2yXwovwe8vC35qK7YP9lsfC2aHG1GYcKs4EBjQGH8dhDAu5ZwciCPf2bTouxW
	1l9/URx7y+BEyhL00KKApVXDThlU4xsF5HwLOSKs/pAWbqTdyuQAM6KlZnLeCTl4NnNt
	E8fygxEu3ixHJRvkuvuylMo+QSsgK316yoJKdtYFFo3c5kVcBEYNu2jzHIlWtWnMCPYY
	qcXAVarcf8svltIfUJT3B4JcpBBRPS4T96iWyQSUILiR2ERp4LJQDhSr9t+SDI4jjapj
	+bCA==
X-Received: by 10.180.189.35 with SMTP id gf3mr843706wic.5.1424818084370;
	Tue, 24 Feb 2015 14:48:04 -0800 (PST)
Received: from [192.168.100.51] (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249]) by mx.google.com with ESMTPSA id
	e18sm62140173wjz.27.2015.02.24.14.48.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Feb 2015 14:48:03 -0800 (PST)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJTo0LZwHCVZYsEMZX4scP8vLg-XHZ3rmzeYDJeLJqS=_0P_wA@mail.gmail.com>
References: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
	<1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
	<CAJTo0LZwHCVZYsEMZX4scP8vLg-XHZ3rmzeYDJeLJqS=_0P_wA@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Feb 2015 23:47:55 +0100
To: "Burton, Ross" <ross.burton@intel.com>,Khem Raj <raj.khem@gmail.com>
Message-ID: <67811BD2-95FF-4952-A33B-05B549258694@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Tue, 24 Feb 2015 22:48:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On February 24, 2015 9:51:51 PM GMT+01:00, "Burton, Ross" <ross.burton@intel.com> wrote:
>On 24 February 2015 at 20:48, Khem Raj <raj.khem@gmail.com> wrote:
>
>> I feel we are going out of way here since now on systemd based
>systemd you
>> have to undo this change
>> partly via re-introducing service files in some fashion
>> how about just building and packaging uuidd and fstrim separately ?
>>
>
>Well the question is how popular is uuidd and fstrim?  I can totally


I think fstrim is very popular these days.

The busybox version of fstrim is about 800b with all the fancy stuff turned on, IIRC.

Thanks,

>see
>that installing the service files if systemd is enabled is the obvious
>half-way and upstream supporting this would be good but I've no idea if
>they'd accept this.
>
>We are *very* close to M3 cut-off and landing the new systemd depends
>on
>something fixing the circular dependency.  I believe this patch is the
>path
>with the least impact that can be fixed post-M3 to install service
>files
>where appropriate without causing a circular build dependency.
>
>Ross
>
>
>------------------------------------------------------------------------




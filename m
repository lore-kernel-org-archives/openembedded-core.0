Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id D243165DEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:23:01 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id v10so6104043qac.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 01:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0HU7cm3Ds/C5S2p/yfziD9ILAlDoDtYn7MTA/4qDXks=;
	b=hGyft6H4PdeG6Ue93kb1sZqNY0JHOJNjBGRwXbUK+/EGyoPmpiMKGOgwKlaSHU877U
	LtGg7AZsQux0weH0/FeLYWPmtGNbis6yXgWa5t4R7EjgJbU3J7waWzJZcOCM3268z5B/
	cEfk1PovPHaValVywJRKHtkJJS4KoVwOfLRsI2LpMNXPbGBT9li4xCBlr3zIDYGmkqZ+
	FJgsF1T6Ly/iNcrxvfyHlrAqKw6vXuO21nEUS2IjzyCPSnzN1YdbZjmioa4RAVdv2XLp
	uvtzH57Eab6OpU8qlK35+TBpg5BaA+iRCGRMwLQlE4gZlRG4aSOMlvay+Y9ltYDBjEdG
	RpfA==
X-Gm-Message-State: ALoCoQlMO19RpQs7Ew4VccMTfpn62oNSCUog6ybZtlAQzDGkotWXpqrtiDLrmPNRvVy6Kquz1Laf
X-Received: by 10.224.43.77 with SMTP id v13mr51565449qae.34.1406017382054;
	Tue, 22 Jul 2014 01:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 22 Jul 2014 01:22:41 -0700 (PDT)
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Jul 2014 09:22:41 +0100
Message-ID: <CAJTo0LZCtnBuZrWBuBmxdO8Z5SYRFbO1tYR2_GUCp4TNet9Ugg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16 v2] merge 16 CVE patches
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
X-List-Received-Date: Tue, 22 Jul 2014 08:23:08 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2014 08:46,  <rongqing.li@windriver.com> wrote:
> Yue Tao (16):
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0866
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0875
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0860
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3934
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3946
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7023
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7009
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-4351
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0848
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3944
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7010
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3941
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0846
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6618
>   gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6617

As there's no benefit in being able to bisect this, I think it would
be neater if these were squashed into a single commit.

Ross


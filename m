Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id F36DD6E666
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:58:32 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 184so45269359pff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=w+bUgROeV4O9LVktbSNdSa5K16fzmgtfKFcRcPEfnZE=;
	b=DsYaRhb1LEy7JXZFhOkHvOMrvlzZAp5/e4Sz02pyIoInp0wZH0FtTnX826H9kP5QKx
	2jer4WvSQY4xHvGRBGIToRPBehaNUOlFCv2tgOqxc7gJ5Y/fBtvktStCjJcAl1uxZ0lA
	9CTecqafjd01L7mRo4MV++43h7jg7EYwgX+KhhU2wWaLszmGEfGAzt0vPEVWtiV0PBrR
	Cca70PaAUNxC3WP00Ks+94nEcF13upB9oish8Nqfcyb1Xj5PqBdGQ2tTWEo+OarZsUkm
	iSWiKQmMDdUSqy96PkssgoU6fyrYzAIWk47nTuhPLFSzj3WM3D+NskaKH+d8IVfjbTJV
	hMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=w+bUgROeV4O9LVktbSNdSa5K16fzmgtfKFcRcPEfnZE=;
	b=ceDcd9jYNZDil5ENR6tGMR24CocJnZ7Z45Sh+xzxPFnxMFD2GD2954TEudBaWPiVvn
	1PLA/Wl9OKv10ggj/tXskhb36BPfoFKzRRF9v6PWgHegVrCrww4GYqSSfwTbud+m3GEJ
	aXbNWJSwBImRxr/rm8G1cIIExpddI4wi8igOrc60wlO+lipbZuKiQtRvL4AnGXx1Rx/j
	E9N2iXnqhGEdtKnpa1WY04RJfAzp3F4ET3akV6pcCwEI4fZyP4jrPGHUODzo0sp2BcGX
	pYyEd4grYXrgCqmqg1bERyCIza6r+CUKgJESIk0yDqfW0/QstmAvNxASE6+WPmZJbab7
	ol2Q==
X-Gm-Message-State: AD7BkJKph5QNa0Bt8oa7Nhs82OOfgPl+X/zAfsfNY3uiTh8SpxUvswXL5V+0q3cfhOt6LA==
X-Received: by 10.98.64.79 with SMTP id n76mr21037489pfa.149.1459778313468;
	Mon, 04 Apr 2016 06:58:33 -0700 (PDT)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	v9sm39884426pfi.50.2016.04.04.06.58.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 06:58:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id 184so45268817pff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:58:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.67.139 with SMTP id l11mr20996551pfi.112.1459778311586;
	Mon, 04 Apr 2016 06:58:31 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 4 Apr 2016 06:58:31 -0700 (PDT)
In-Reply-To: <cover.1459776943.git.patrick.ohly@intel.com>
References: <cover.1459776943.git.patrick.ohly@intel.com>
Date: Mon, 4 Apr 2016 10:58:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoDAitpGfH_uZ1Er_Fov8st0sB7gXXSNm9ok=1aBVvLYw@mail.gmail.com>
Message-ID: <CAP9ODKoDAitpGfH_uZ1Er_Fov8st0sB7gXXSNm9ok=1aBVvLYw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] misc enhancements
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
X-List-Received-Date: Mon, 04 Apr 2016 13:58:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 10:41 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> I've worked on making Ostro OS support Toybox and "stateless"
> configuration, i.e. running with empty /etc and reserving that
> for local configuration changes.
>
> That work depends on several enhancements in
> OE-core. "package_manager.py: better error handling in opkg's package
> listing" is not needed anymore, but helped debug a packaging problem.
>
> Please pick whatever you deem suitable for OE-core at this time, I'll
> keep maintaining the rest and can re-submit again later.

I looked at all patches and all looks sane and generic for OE-Core acceptance.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


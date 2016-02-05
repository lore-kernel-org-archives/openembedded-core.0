Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4D02077277
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:50:53 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g73so143264360ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DShM1XsT2hkRWtNjBGE05dBIvvFbUVWvYhojctmDRTs=;
	b=VfmMF2rpZWpCHjm+pGt2oR9v6N8w4fZOHb82D/bvC0p/RocRtvRktBVJ8NaibDjij4
	r8/D6ilMCFxhfs20H/M3z9GNsDsEP5COtgJ2tnKQOO1adp+M2SFyarpoTigLnkC1fQqs
	mAirVvPcPjacW/8vxLWOS0b9/uuse+C/FYiFn3gQ9x3AkcWIEsVJ3n7aLZeYcHM5+5Lt
	aGtNjuyIvixr/78v65nGc65t2hC8NP2VOnPfMOr97+C2ZAM/fWRNuRQO/JZ5zSR46p7v
	4BzRsbJ0NJo6YgAlR4kuZCRc+uwDReespf75kupTmTEnrDmOgd2xiI+NrvMvA6gvukSV
	cX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=DShM1XsT2hkRWtNjBGE05dBIvvFbUVWvYhojctmDRTs=;
	b=e+4OViaxXJgjpVZ7wS5uvH6KAEX606jM7ZNyOP5Cy/8BM9Q4ffu8SZoCeB6wO5nluO
	li+kqVYQ1Fk+8GJAJU8Xbj9axJDYKdrANluHw7L3qM+RV16I1/Gs9V6rSWx9757DgcBa
	74MBLpWm5H5+plxtdozjDsEQsSIoFZC9yH0Ae97RqPIqcMTuKma0iGo5ebt8vLIivL3R
	3fgDxclgrBTjH/zKovE8gt7206yGHpiLZeTkKUtsgVZQsnpiowzQtIr5mcnn0PEEhpk/
	FQMjOfZVHcXvTFErSEPdN009rpg9K6u3D7+9kdnp2llQOv9wWw+y/BgVZzw8SE7fJgpE
	wpaA==
X-Gm-Message-State: AG10YOQq4zGLR3TG83FIeBZCvWmugbO1MDAfy6Y9GRErUhrcAz3HIZSt4LIotmBd3qa4Xih2Xu48AWUWXEIDSg==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr15688815ioe.148.1454709054284; 
	Fri, 05 Feb 2016 13:50:54 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 5 Feb 2016 13:50:54 -0800 (PST)
In-Reply-To: <CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
References: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
	<CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
Date: Fri, 5 Feb 2016 22:50:54 +0100
Message-ID: <CALbNGRSrjQQW5Zc+ORqSSmc9SUXJG-jQwhrVDwuOp3G-o2kUnA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] cross-localedef-native: add ABI breaking glibc patch
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
X-List-Received-Date: Fri, 05 Feb 2016 21:50:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 3:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 5 February 2016 at 10:25, Jens Rehsack <rehsack@gmail.com> wrote:
>>
>> Add patch from commit 96b1b5c127e9e0e637aaf7948cf3330a94a5cd57 to
>> cross-localedef-native
>> to avoid broken images built with ENABLE_BINARY_LOCALE_GENERATION set to
>> 1:
>
>
> This impacts master too, so I've merged this into ross/mut and endorse it
> for Jethro.
>
> I've also a filed a bug against QA so we notice this breaking on the
> autobuilder...
>
> Ross
>
Meanwhile I've build an image and tested: GTK's i18n is back - thanks
very much Jens!!

Andreas


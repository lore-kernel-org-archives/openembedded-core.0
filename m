Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 309F973F7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:35:19 +0000 (UTC)
Received: by padev16 with SMTP id ev16so60701655pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1J6JHvk/xCfu/W9hfQcCAMnOyd7qvChOqWpfLmh6w60=;
	b=quow09iXNGbdmubY2vo+1BETG7a4YYFNBVoLcMqGVPYt4su0CQDoEtIvJYA4bfqb3n
	3QO4Unx8VnsvV84sky68W6PL0pQHIg/4K+eoYo6eMIZraLEX42LlcFDPeTGgYiIqATox
	PdM9i4Xr28eBUf8Iro6e/aFUttj5MGh46flExiGfa/Ae3BFLUSYnAsepOizWTjxlDWB1
	EtUbqVGEwMLzYbm8lvPmTcPlFae79wtszl6ifm5NioHgu23nUkSIBpUFAGlWo2YOX2vW
	MXzcJ53nisj453ej4EPCfl9QMBqEWmOtxphEQCv53lSeooNykGAYEwcIPn1WGV961tbD
	UYnA==
MIME-Version: 1.0
X-Received: by 10.70.127.140 with SMTP id ng12mr21060595pdb.94.1434630920770; 
	Thu, 18 Jun 2015 05:35:20 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Thu, 18 Jun 2015 05:35:20 -0700 (PDT)
In-Reply-To: <5582AA4A.9000202@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
	<CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>
	<5582AA4A.9000202@linux.intel.com>
Date: Thu, 18 Jun 2015 14:35:20 +0200
Message-ID: <CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Thu, 18 Jun 2015 12:35:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 18, 2015 at 1:23 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/17/2015 05:59 PM, Jussi Kukkonen wrote:
>>
>> 0.6 is the last release that supports GTK+2 and changing this might
>> annoy people who are avoiding GTK+3 and are using some of the recipes
>> in meta-oe that depend on libnotify.
>>
>> I believe the GTK dependency is only there for tests: Modifying the
>> build so it doesn't build tests and doesn't depend on GTK should not
>> be difficult.
>
>
> There is no way to switch off tests building in libnotify, so dropping the
> gtk3 dependency means developing a custom source patch. I'd rather do that
> only if there are specific complaints.
>
I think gtk3 is not the problem here it is the API change libnotify
0.6 -> 0.7 which cannot (or only by ugly hacks) be installed parallel.
Do we know what happens to meta-gnome/meta-xfce?

Andreas


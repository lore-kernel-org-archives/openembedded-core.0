Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B50173212
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:02:56 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id uo6so253317195pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=MWjAAcZ0TcBUqentmpYB0uF9dOw30LWO3euLOLCVfik=;
	b=Ohg60gJvn5PntqdFS4ChPNYqZueX9qmSd14CRQmRe0J1za4AVkUr+ouqp+G0W70tFb
	rku6q67140ZbkoZEXWTo4oqp210Y2k+a4lV/b/AU3Qfy+vl6D5pD+3MREkzXM6K27KgJ
	9AEWNzKIFG9plFI8T+XkrPXMoxDG0ALV8jXaPMy8nR3K7nfE7E3xxrxinOfDf+Hwxkcd
	c1Sgr3vFVsJ7IDEyweAZ/wB40AZubBsyy15Pln9nr8BZJqABkjNJal76KkSR8b7+QRTF
	32Kc0W4XKzVHX2zfE/03+UCc3xgDdj1hUu+WguvSLrBunpdVYulH8rZ/iI/fG5j0kgMb
	iYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=MWjAAcZ0TcBUqentmpYB0uF9dOw30LWO3euLOLCVfik=;
	b=Lv7evhHRISw5L7JTV1D3Y2BTNMlKARJleQ5+uHWIQtmN6jP8xmT9M4xr88jxWYNpGZ
	Tf09TWuGmy8JxJ/OR7ocwd2GodruewUnrlfQJzygBRmZGuFN3HHpr6pAcJeXIAZR4Fnz
	1BoXIEsgv2ZoH+YajzNuwuMkuNocLhvrz7lTlADmMNiX1R/5XKHJ0mqtwwXotnToIX1Y
	K7Wf7UDa1tf5aAbSWtY54HE2FrGUwOYUemOVTKOU1Tt2prb0hIfH8bVXsxO7a0lhRYRX
	3Q+E6SAVesenN6DH8Qva9vZHfuIlV1Vypazjvf4A+h4zybyYOOWv/yRF+snxBJ82LBfd
	FJsw==
X-Gm-Message-State: ALoCoQkVV21rOXEEWj/UWuIVNvE4T7eDI04txvI557sppyxTf4wwrj8FC/J32ZL/O/gOyfGdfjIZ8K/WlbQ7eUZZpYSgMRNQbw==
X-Received: by 10.66.129.232 with SMTP id nz8mr117341187pab.102.1452211377623; 
	Thu, 07 Jan 2016 16:02:57 -0800 (PST)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47])
	by smtp.gmail.com with ESMTPSA id a18sm195684pfj.40.2016.01.07.16.02.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 16:02:56 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f47.google.com with SMTP id ho8so10795576pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:02:56 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.232.74 with SMTP id tm10mr100228134pac.128.1452211375722; 
	Thu, 07 Jan 2016 16:02:55 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 7 Jan 2016 16:02:55 -0800 (PST)
In-Reply-To: <CAJTo0LZwhxNv47sKdHn4fEd550X6+sdodD53+0WKRvUtqhy4PA@mail.gmail.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
	<CAJTo0LZwhxNv47sKdHn4fEd550X6+sdodD53+0WKRvUtqhy4PA@mail.gmail.com>
Date: Thu, 7 Jan 2016 22:02:55 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoxURCGscRRdHcAi5S4zy7zo9Ub7moX4CJKsHC40UkZPw@mail.gmail.com>
Message-ID: <CAP9ODKoxURCGscRRdHcAi5S4zy7zo9Ub7moX4CJKsHC40UkZPw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 3/4] packagegroup-core-x11-base: Remove matchbox for XWayland case.
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
X-List-Received-Date: Fri, 08 Jan 2016 00:02:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 7, 2016 at 7:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 December 2015 at 22:04, Tom Hochstein <tom.hochstein@freescale.com>
> wrote:
>>
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '',
>> 'matchbox-terminal matchbox-wm', d)} \
>
>
> No, this is broken.
>
> Poky (and others) build with wayland and x11 DISTRO_FEATURES, the presence
> of wayland DISTRO_FEATURE doesn't mean that XWayland is being used.  If
> you're using XWayland then you'll either have to create your own package
> groups, use appends to remove matchbox, or just live with matchbox being
> installed.

We may need an xwayland image or DISTRO_FEATURE so we avoid those
hacks on BSP and distro layers.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


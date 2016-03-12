Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 496EE731E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 11:58:12 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id t4so119274604qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 03:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wst4QRG9uoSpSEed5NknPyd2HPHR87wVMLavgC7FUYQ=;
	b=A7/lgAi/G8WQUepJ1Rm3+kHJIka0CqY/S5ZJLXapDAGMUqi/zW/+eHZuIFOE3lGW3Q
	iInBxKzmm0zKudlTuwOETjtDPLKPbKc3beORgvCh30XiuTlzYfDU5GYSSi8gm1Fx0dZP
	ls/Bf5q7G6QHy9xaJVOzYmEUHOz2L0tJ5F2PK7HysN4wFm+O0c787Uc4EP5CcgXgKqW7
	e6UarPWjvpdlQk8Wb2K8mnvzZ0NpDGedvUpbNGkiTMTRR293RDAHIF4noePuxMGXiYVO
	uM6fE8qgNgcEw5bb6UnLMGZNxrlSKlrWBSu/5/KvZ0fmU9YRi8SPWBbqq45KbianqGw1
	RGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wst4QRG9uoSpSEed5NknPyd2HPHR87wVMLavgC7FUYQ=;
	b=eSqKiqF0BsDlB+K6LGOVcboE4jhjiBrf0Dd60iaWpxo+VZ06j7gH/P8jEpMfSEeENj
	bqHGct0MU5sJKwg73X2wGqCG+rgYVCvk545w/vGfZF6cdO46sTT/LgMzO3q2LEr5ukfg
	cSaAFbXuAR/fv5su6wW/xuq8plVXuhwcqN/WmhdE8+dJTDWIkgk0WTFKc3eltoOVJhHR
	hsny+LxUAA36juUcJckcnhim61EZcXEdhrSYNq9sii2C1//XK4pH7xXp5NVdmFNRj3Ii
	pRszF2rlMbcqtMHZTKMHFvdsHeKdIawylKO0Oo7WbLFPKO7/f4S9y6oJRCFNnFvdYCAu
	TE1A==
X-Gm-Message-State: AD7BkJJ0L0Od9+7XBUrKea6mn4ErqshAJooox3V6deWSbyU+g3qRNtHU7BO4dc4VRBktAXI8S13FJ9lmcywf8w==
X-Received: by 10.140.98.170 with SMTP id o39mr18193686qge.44.1457783892571;
	Sat, 12 Mar 2016 03:58:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 12 Mar 2016 03:57:43 -0800 (PST)
In-Reply-To: <CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
	<CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Mar 2016 19:57:43 +0800
Message-ID: <CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][master] arch-armv8a.inc: Add tune for 32-bit ARMv8a
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
X-List-Received-Date: Sat, 12 Mar 2016 11:58:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 7:41 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>>
>>> This patch adds tunes for 32-bit armv8a platforms. The user can select
>>> little or big endian, hard or soft float, the vector floating-point
>>> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
>>> extensions.
>>
>> This does not feel right to me. Look at how thunderX looks like
>> ARMv8 is the time to fix this tune explodes on arm, this patch is not helping
>> it.
>>
>> Do we need the hf/neon/vfp/thumb2 variants?
>
> Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone and
> just have optional features in and out?

something like that yes. Just aarch64 and aarch32 make it simple as that

>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


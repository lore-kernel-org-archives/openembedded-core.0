Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1C72B731AF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 13:24:05 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id t4so120261895qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 05:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vJczx66MuOV//rlmzJ3L5qHMyu4krs/7f/eOlOXb0ec=;
	b=qmVrnijUGd65grXviD1klxjGRW/N6HyZz2B4Epd4EsRQOA6dBueLU1no0momRykkkv
	wKq6Cp1M4wWuwavdwfHBfwXvph6OTvkVkXet7tsZoQGIT4pDO6c5LbGarakg7DASz76v
	VmjfMsPuz1G5yb5CtUW6UKucTeNnHALPsZyvPVSUmmi86HYn9UtNOT7u0mo2Qxhie8rL
	llKoxgQHSVpy0qqVNO83S7PaXBYRU7yDX8zqp/nYgUhagRc8AiI518w/cUTIjIpn29uu
	GIloPBOaswPQ4Z1JLB29Dpt2Qb2Q2yJEjxZjftNe2GPM98K7zdZKccYthcnEyuMqAo31
	DKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vJczx66MuOV//rlmzJ3L5qHMyu4krs/7f/eOlOXb0ec=;
	b=G8OoBU7HaRiC6TVWgrNh6rGl2KjHljhngw8sTpTK+1CHKTbKCaH46Jk5jlsfwlZHkH
	oKAyaHIJrmbPrBEuGLZo31ZQZ1v2KPlmj7tsc4EaGN8yiqnKBUY/PO/KKoiJimeFjs2Q
	b3sMdoPsxlBxSS+QUILoJ6lveoThGEJLez55DCdV/zOHcaVGvA4s6pYn7gkxkoMR9+uE
	TtZIThtTrFjyhFwRyqLZ69HU36MlOAb0vK2BTtUsO+/lyEmBRrv1WGm4/z0YCFmZEPuQ
	Ke0adDTznY2e2YeSRg67fy+xgl4df0HRr5XRcRKdDYUcRqGQTiyJA6whA/6poM2L+qP+
	Be7w==
X-Gm-Message-State: AD7BkJIW3QQ0F6d/zgz6EaIBQB2BO79bmvByKYbMpdmNttWL0XCel09pyyj1L4MCUg+ygtcQaHGHUhgYeaplfA==
X-Received: by 10.140.81.231 with SMTP id f94mr17981829qgd.25.1457789046161;
	Sat, 12 Mar 2016 05:24:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 12 Mar 2016 05:23:36 -0800 (PST)
In-Reply-To: <CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
	<CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
	<CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
	<CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Mar 2016 21:23:36 +0800
Message-ID: <CAMKF1sqi9yut+7LXkVWvVCEoVSu=U3yYKOo7wPHOsL=+rb-RJA@mail.gmail.com>
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
X-List-Received-Date: Sat, 12 Mar 2016 13:24:06 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 8:02 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sat, Mar 12, 2016 at 8:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Mar 12, 2016 at 7:41 PM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>>>>
>>>>> This patch adds tunes for 32-bit armv8a platforms. The user can select
>>>>> little or big endian, hard or soft float, the vector floating-point
>>>>> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
>>>>> extensions.
>>>>
>>>> This does not feel right to me. Look at how thunderX looks like
>>>> ARMv8 is the time to fix this tune explodes on arm, this patch is not helping
>>>> it.
>>>>
>>>> Do we need the hf/neon/vfp/thumb2 variants?
>>>
>>> Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone and
>>> just have optional features in and out?
>>
>> something like that yes. Just aarch64 and aarch32 make it simple as that
>
> ARMv8.1a has different semantics, how does we handle this?

question is do we need to handle this with tunes at all ?
what advantages are we looking for.


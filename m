Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 65374605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 12:02:44 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id tt10so120611436pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 04:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=15sUW1iIHHkS1c/avwaRUYV5ZIhePbPqZEXT0ynoWK0=;
	b=vUYDr38KaQ9NnxOxGnr/ifpkiYtHEC2gpWfoPCjDK70MC/vp1WR4Pho6wI/VALu6ll
	4Rl+sYj5U4Au1nDM+WXvD8uq3TSxtmOMwI4FhQYvKpB9qaFQeoOKB9Hrco+u2FgA8k8b
	SBOtk2S1gXUP2cTsfMZtr5yidg7BYDu3K+m/i1ELCJe8J9zLB6E4rBEoqVNuR60txsdu
	p5A6NTJ/p30YkZBKxKnjyCM/6ozjf+7MNeji1U288se4smNvD9ivshJRAxsu8dPnLxwh
	hhJmNI3NlgxX6qv4q3G6uKIjuGIIay6ZbJVU9CkOJo4EydoKyDBfwLYAdyZ2Z2q230Gv
	nnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=15sUW1iIHHkS1c/avwaRUYV5ZIhePbPqZEXT0ynoWK0=;
	b=Vv6Or8NnA8RTzw3eK5KjeHSZFApx3Cdc/f8B3SmlRkGXdoQAEkHwT5ZLQpSI3AH/1L
	jz7KIpgGUxZfcTDEJgSlLEYDoxvoacHeRbw6tiXLLK433Mh6x8hUqIG56TIMYcGxiH16
	9OCfCMqqakXuLsAy/4OM5RikeqJbERyF01RcdlrYKEFhby8z5COSomBwnga5jXoX+qBH
	cPQm+tyqVEGJPplSpyxgIn4uvVBJ0Vry5xbrot+nUqcH+yxX3Oke3LgG7llo07R6ZFj8
	j3oABV217bJ3EYcfToKC/HhD7aXu3UkJgS54fRv7vxKWQwK9r3ejGFcNcbRw1o6eZqw8
	2ppg==
X-Gm-Message-State: AD7BkJJTuvBOEp5w1cnT+FGuvidliPTduAJJ2/3shnK7kiT3/P18ik2RxPUWMe3XNj/63A==
X-Received: by 10.66.147.164 with SMTP id tl4mr22661837pab.40.1457784164855;
	Sat, 12 Mar 2016 04:02:44 -0800 (PST)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	w20sm19473888pfi.31.2016.03.12.04.02.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Mar 2016 04:02:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f54.google.com with SMTP id fl4so119823001pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 04:02:43 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.147.74 with SMTP id ti10mr23390112pab.128.1457784162885; 
	Sat, 12 Mar 2016 04:02:42 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Sat, 12 Mar 2016 04:02:42 -0800 (PST)
In-Reply-To: <CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
	<CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
	<CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
Date: Sat, 12 Mar 2016 09:02:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
Message-ID: <CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 12 Mar 2016 12:02:44 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 8:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Mar 12, 2016 at 7:41 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>>>
>>>> This patch adds tunes for 32-bit armv8a platforms. The user can select
>>>> little or big endian, hard or soft float, the vector floating-point
>>>> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
>>>> extensions.
>>>
>>> This does not feel right to me. Look at how thunderX looks like
>>> ARMv8 is the time to fix this tune explodes on arm, this patch is not helping
>>> it.
>>>
>>> Do we need the hf/neon/vfp/thumb2 variants?
>>
>> Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone and
>> just have optional features in and out?
>
> something like that yes. Just aarch64 and aarch32 make it simple as that

ARMv8.1a has different semantics, how does we handle this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id D2C1270179
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 11:41:54 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 124so102224743pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 03:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=L8h+qfv9YtlbcHxGw9KEpfZovhZGpB60VQNhroW57lM=;
	b=tm32KZ4eEbZ4176OA/CTjXCHtKD4xHphXNtspq8VU7lp8UmfT5nHaZHHD+rzlxyWUq
	RgNM3BL/KaXzmBO01/fMFv8bHnr63DUOqDwtEy6QWvB1szVPKRuXibZtMacn+2C4OCon
	2A8/O0njsmi5e3tq/+zvreWbZ3qdEZeFqt7T+aJr7I1PAhCmV7iz6KKCrm3lL/gs6AE1
	LqLGdhuVsqkByPfQEqZoxGgcc+Up7zVWchx0io8U1xN325Jz9UkIpDHQNfeV9RedGLV/
	ydWrVi8wy+xPp5EeI3AB1/C2vFtqyJgBTD/NqYXeMMUUH/TvlWVsiGgDkcKKbJ3bKrdE
	diJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=L8h+qfv9YtlbcHxGw9KEpfZovhZGpB60VQNhroW57lM=;
	b=YFJu6M/YQfGX9asg7H0S/iWWVZRXMiAfebQ5WL0ljoiAnFBOO9qN3p4ssgnToIBXv+
	VoPNIC9pSw42Aq06oN1GJJrRhLxCnqUP4pOoHHUOCaAH2N5G/dDkb0V9sTbxQCf7ZDOd
	N/Gaz5g47zHLIG0IYA+bgSWvOhq/zrLRt2ZbHvmMQAiW0x8Qiq2jx6XaOZZFtOxcDgRp
	dDCpBVRvhcrj1uiuTYbCqQl0xP+taSg8l1YBnD5y3NYD8iw8/dLCukaHA3YG+/E+KwPF
	6DUQIXDt/yHy1Q0AEcpOZuUUyO1tVzLCob138fQu7vDUFfeMyMUqIZHcO1Vc+OFgQ4PD
	Th2A==
X-Gm-Message-State: AD7BkJLoACB100EuvHkHR6BPJn1eKRMn8IZG1rtHWPbQK8UWnU2v1sZRObi0GQNjslUPTA==
X-Received: by 10.98.80.22 with SMTP id e22mr14970142pfb.15.1457782915725;
	Sat, 12 Mar 2016 03:41:55 -0800 (PST)
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com.
	[209.85.192.179]) by smtp.gmail.com with ESMTPSA id
	xs10sm19386724pab.4.2016.03.12.03.41.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Mar 2016 03:41:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f179.google.com with SMTP id u190so72364120pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 03:41:53 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.200 with SMTP id c69mr14963563pfj.129.1457782913337;
	Sat, 12 Mar 2016 03:41:53 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Sat, 12 Mar 2016 03:41:53 -0800 (PST)
In-Reply-To: <249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
Date: Sat, 12 Mar 2016 08:41:53 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
Message-ID: <CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
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
X-List-Received-Date: Sat, 12 Mar 2016 11:41:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>
>> This patch adds tunes for 32-bit armv8a platforms. The user can select
>> little or big endian, hard or soft float, the vector floating-point
>> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
>> extensions.
>
> This does not feel right to me. Look at how thunderX looks like
> ARMv8 is the time to fix this tune explodes on arm, this patch is not helping
> it.
>
> Do we need the hf/neon/vfp/thumb2 variants?

Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone and
just have optional features in and out?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


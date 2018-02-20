Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACD777780A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:29:16 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l131so7445278pga.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RwO60WyHE6VBwTYXKd0QwksP0a0ZuDNQyyVr7gjWI60=;
	b=UV/XGTEsW7Hktrzgy4ovLa0BN+IRW7Uc5vIOi/c9Ey0Uuwie1hr+/JozAh3Ld93CKD
	QjnGOIvXVSVf3JuBKLfV2zYAk+no7epACycI+2lrmlxiOwdlW2VR9CBv43nNx9BbDBxb
	1A+hpPf4OH+exLhmCVXPuc2v8i/ncUd9NMMQcagTxbCfiKoGjDlKPr3iJ645Dm56Pife
	x+dbNV1ALLPqgimmeH+3bIzI3uI7x3NRsww7WZDeggblR244W9KXBDBnnzr3YRS1OD0C
	dLUAfM6wVcZkayry64B/xtYZfV3NPXrZF4/a3qMOD7dlp4cp3ut5GSHLDrADNRkbKBOO
	wagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RwO60WyHE6VBwTYXKd0QwksP0a0ZuDNQyyVr7gjWI60=;
	b=dlCpS7dxDZHoD5aNtdYmpvEvEjlSPRkferjkEdGf7f956Q3eh0RkYIAnTAqMRc1rQQ
	skI83EecFnZCW9vZRFxD1X4H/wCBvMvh8+H/EZTHjQGSqKmbIghxC84EQIngWwj9ASmd
	MKKXFw+DPF6u1ohc+pN7lpVpi7d+DFEnnAZzNL/gJfUj0gUUGudW9RJwPb0GejgaU8xF
	dva7gX50Qf4ljGkhyB+WGss6hAOFeRFjl4xYShEiET2SBs08ZyMbNVVnaI/W0A39R95P
	JAFa/Q+x1IK3VE++ytdqsyarkE75Hdor8ZrHP3OI2YVS86DFZMlyNoji2siFoa6NOgqD
	iTaQ==
X-Gm-Message-State: APf1xPBDsQafctI8dt3w7sjZKxATgKE1VS+YBI25tDdf24sEN80CB7Ic
	L7z+bkXXtKrXQnX6HqenWo6CUE7pJ2ocrUiz2/Y=
X-Google-Smtp-Source: AH8x225jjlJVHkLPJ8AefblNs+PPJaZDNfx5E/0/aC/Od/VuSPQercJ5yLq/nDXLqiUaBjKkqPQcl7R5th0GrnBK9i4=
X-Received: by 10.98.229.21 with SMTP id n21mr523369pff.158.1519151357551;
	Tue, 20 Feb 2018 10:29:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.221.21 with HTTP; Tue, 20 Feb 2018 10:28:47 -0800 (PST)
In-Reply-To: <20180220161752.GA2786@denix.org>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
	<8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
	<CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
	<CA+chaQdzUAxeE-hKceogmgSjBCXvkT7-BKzDrqFV1EvpTD=oXA@mail.gmail.com>
	<CAMKF1sobCVLrT0J2ig3OP3CpJ6Rja3oE2DZTTWNypFEmrZETMA@mail.gmail.com>
	<20180220161752.GA2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2018 10:28:47 -0800
Message-ID: <CAMKF1soq1h+EgCz0C4HeRpggTctGiL=0OqQwD9tK0eTZ7K=HQg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 18:29:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 8:17 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Feb 20, 2018 at 04:08:06PM +0000, Khem Raj wrote:
>> On Tue, Feb 20, 2018 at 7:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> > I'm OK with adding bison-native for all versions.
>>
>> As long we know that there are no side effects of this dep in kernel builds
>
> You do realize that when you build with oe-core toolchain, every package gets
> bison-native dependency automatically? Regardless whether it was requested or
> not. If there were side effects, we would have seen it long time ago...

Yes I see it seems to be pulled in by toolchain regardless, so for this
patch we might just be adding to determinism. but I think it raises question
on why toolchain is adding this everywhere, I think we should remove it
from toolchain default deps. It will make metadata more consistent
across internal/external toolchains


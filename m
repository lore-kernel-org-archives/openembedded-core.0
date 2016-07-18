Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B11B2607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 14:50:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j37so7119007qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kOLze9IPjeWjpTylgH+rJiI89KFSJe8usBiypbjDs4A=;
	b=cH20eG9oeDyR6nIJKyjZifDRaCnkO9XbtD8rEyx+ckVMrMApN90xm1kIqL3Hmru+Po
	fENm96Zjb+N1R2SbETrd7U+vyVO5qvSIhEKIicO3bdK1zx3Tp61XbrV6mVyCByXRYJrW
	MoEmBTWrGL16/L8v5U8d9vF0RRYG6nMDBbKm3kQzXRhZRWdfuhNA608j2ATnpJ4ebIlO
	FYhr+eiq9Nn/jjMknlRKJZHbHFP0RaMJdVJm+WpmEEFQ9wizAkGi6cuGNBzzlWyjdLQ0
	2zsqYqOvIqMUqUyXPl7moly6jdhXx+k7FOmZno0QN0fs8p7leJc0sEYZgCKxMvi+oJH5
	yEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kOLze9IPjeWjpTylgH+rJiI89KFSJe8usBiypbjDs4A=;
	b=IrIO9DEH/uqmUCZu434C1gKYRcraaBHjaufyghgZ1+AgK6x2D2wwHjQi8c2dat0lnL
	HpOyUYsKFEqERSh6+vQcXhmjKk/YeWeK5QgwSfcLQYRNzAvVeebQFwo6Yhuk4o6tSPG4
	c6p+PCPEX8TkILIw7ZTM0XP/DeodslcvAZFU9Eu8ob/7GvbNSOCK+N5Q4W9+aaQiMJNz
	Gsyxa+EEUqmBUE/rgfjizd8D8BFt/kyCpcgpEccJPqv5onTG03DEVrnYMoEK8vosgtAo
	rb4lACdqddMStSWVjYud4HW5F/pNUBye+565N0+hsUqayOrQ2Mj2giTOfjbgYiI+d/R6
	8zVw==
X-Gm-Message-State: ALyK8tLCL1QPQxE1vVwNrasQeFK5OY0UoFIACQ3ZP+b5vd3Qyf8r3SnuMJWcycTYdR4h2YzvTGZT1zqDneZJoQ==
X-Received: by 10.200.53.103 with SMTP id z36mr51415537qtb.5.1468853432957;
	Mon, 18 Jul 2016 07:50:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 18 Jul 2016 07:50:03 -0700 (PDT)
In-Reply-To: <CAHiDW_Fm0eATYFU+iCNOfO4ZmRWVMuRyxaEMRV6ZUsz8bap-Bg@mail.gmail.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<25b3f922c187722bc62a57610516064651cf2e1a.1468578590.git.jussi.kukkonen@intel.com>
	<CAJTo0La03=kJ14FYFFpNYzbpmUnC5vzy4R+XKzm3naqycAEZ7A@mail.gmail.com>
	<FC49D134-1826-4C0E-9D00-B0C63A0EFCAD@gmail.com>
	<CAHiDW_Fm0eATYFU+iCNOfO4ZmRWVMuRyxaEMRV6ZUsz8bap-Bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jul 2016 07:50:03 -0700
Message-ID: <CAMKF1songUu89myJT6L6F52gEvWuUsQm0D1WciQvE+sPUVoc+A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] wayland: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Mon, 18 Jul 2016 14:50:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 6:30 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 16 July 2016 at 02:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Jul 15, 2016, at 3:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>>
>> On 15 July 2016 at 11:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>>
>>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>>
>> This breaks with musl:
>>
>> | ../wayland-1.11.0/src/scanner.c: In function 'find_enumeration':
>> | ../wayland-1.11.0/src/scanner.c:811:2: error: unknown type name 'uint'
>> |   uint idx = 0, j;
>>
>>
>> Fixed with
>> https://patchwork.freedesktop.org/patch/98992/
>>
>> Please back port and test
>>
>
> Thanks Khem,
>
> I've added one more small fix to weston, and things build on musl now.
> Unfortunately at boot time I get the same versioned symbol relocation
> problem that vte has:
>   gbm: failed to open any driver (search paths /usr/lib/dri)
>   gbm: last dlopen error: Error relocating /lib/libgcc_s.so.1:
> __cpu_indicator_init: symbol not found
>   failed to load driver: i965

this was reported earlier too. I havent had a chance to look and root
causing it. Can you trying adding ASNEEDED=""
to recipe and see if that helps

>
> This is with mesa 12.0.1 from this same patchset. I'll resend the set in a
> minute.
>
> Jussi


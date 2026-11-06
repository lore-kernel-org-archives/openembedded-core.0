Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4523.1793966321708188652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 03:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IELYF4rA;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso237969f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 03:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793966320; x=1794571120; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZbHkpSKr6Hr8XvTV3pxYoFBOFG0oWspxzk5ULVYu4xc=;
        b=IELYF4rAmWDxOCh8y30Ku5sGQYuOcS4wjO2UaFHzC/FmEeNPDeRlzhuGeqfPSS/0Ez
         A9Qe5X2wHuLZUvtjGukUO7CwMxg3zsz3TRuBTrGGaxJVAKo8Ml+KnDSj/6z7GnDzeMml
         ZzrCeJYzQ7Hro+X73reNXoWxBo8upoMSZQYnkG7aB/U9hPKdXwoZ1m+B5Sc2CelnHtgj
         JYIdVjpufQACPJs/u++4u1c8GRH209/c8uvmEQ/z/FGMNcfD/Y5U9qZPTBT/ELgUqBlM
         Ui4pq7h+NdXseyVMSjAvvks7MrYy2XHdtJvNrcyQI6KoVX5QNA03xQfcfvpfZzcdqr9E
         UJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966320; x=1794571120;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbHkpSKr6Hr8XvTV3pxYoFBOFG0oWspxzk5ULVYu4xc=;
        b=wXrOsQzJPjPleQokG3wVO2PNqbnPbxEkEGsmgwHDtXDzJUN+uM7GsHmyxHupEpAYCi
         dsV+2+o9EFGZMgkdquNxUPMnPHB9+CEQf1oGk8LrRLqUgQOrPxSMHp2AgC2oyPhfGmf2
         zvyGZ4fgyC5Y8qUSzhpEoJYinBNmnwA3lwlkcOIqX0NHSHfjmdF0e2oytv8wgJRgRG6P
         pBOED9zp/YdeJv3BHt+u+hjGknIg1quudOO9/lxKJpCTrorBJb+3afB6GFLnK2itJgCB
         ZPyHerOpKNQgrQMdhYUtZLqj1yJLu3qvPonwCWrwNg0GA0pnLNBvhQIpQamWSbeuB5+A
         uRMw==
X-Gm-Message-State: APuU4Z+uOanzroYH6LodikGHSSombDvZZXO9ANt/DPAIbip+wDEBkEB/
	VMeO1YKsX/ri6qhTXDHIJS/5esrJkasG9yWoeH6gBLCGiyCGxbB3IkhJ+rMZwo87wZg=
X-Gm-Gg: AYBFou0S/YA5qO03nB3WF16S56f8GuH40fIxH4lau+qr8iEnGOe5qzW1lVpip2V9Ovs
	13Kp7iKHnZ1C38h68k+NgS4HPrWiG/pyuAlsau6gyn0yi0w1YPRbi+5w9YgEiPb+pr3cDq23Uzp
	lnjNpd053b+WaDdKr7jy1rWWcRQ23bVQUCsIqpgMCywCytoXJO4aHWA/OhmQV7OluaMD1Or8KBC
	AFGGIfB8S9eRjsDEk6wIj1MZNBAf169uDxzlw5N1fquWYomqQ3gC0sUSUNfxXorUHBbikytUpeu
	c4oj8ha8qdPraobemir5OZr/aVKZ81Zww9T77GCEkjTtZ+vpepb6osPhQarFrKLr4JyHwB+6Iof
	AFUUT5FSUGIgfZxUVxIg8xVaukXmaF4lS7IVkNxZne+TRgDqrdsMGZ3byuEaR2rb531+TW/DNi5
	APRWfKvyrg9Bv/mmKyOlKVIl/vmZyMwfb/9zYvqz0bXKbS5BDz2OiJEg6ELyGbyGIwJ1RZq+6lh
	7Lj+0PgTezN2ZhSqkOTPKSNnxvPtGCX7T2gT6jUBnfqBWLrgDAT68gZsUyy28Aay6d6AfHzulEv
	m2r7qcwyZMTtdXHzRwnhWCjSz9/wsHWLu1ahLMAubV4Uj9hDmYO6sjbtr7LVQjDUdjXLKuzgTzX
	5YhNOp4imQtTYvAGv
X-Received: by 2002:adf:e014:0:10b0:490:658d:995d with SMTP id ffacd0b85a97d-49278ee87dbmr3426399f8f.57.1793966319825;
        Fri, 06 Nov 2026 03:58:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d60e94sm3627632f8f.2.2026.11.06.03.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:58:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 12:58:38 +0100
Message-Id: <DMO3ZHLGJ8R1.3BSNRF1WEBFZ3@smile.fr>
Subject: Re: [OE-core] [PATCH] musl: Keep clang from raising spurious FP
 exceptions
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Patches and discussions about the oe-core layer"
 <openembedded-core@lists.openembedded.org>, "Khem Raj"
 <khem.raj@oss.qualcomm.com>
To: "Khem Raj" <raj.khem@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261028051959.2975770-1-khem.raj@oss.qualcomm.com>
 <DMMQO5OTJXPD.WW6MQOZ8JTK2@smile.fr>
 <CAMKF1sqsO6Dbjdh9LHiZ1zrG9AMM6m0tbjA1BZnE9XLd8CUjag@mail.gmail.com>
In-Reply-To: <CAMKF1sqsO6Dbjdh9LHiZ1zrG9AMM6m0tbjA1BZnE9XLd8CUjag@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 11:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249636

On Wed Nov 4, 2026 at 11:28 PM CET, Khem Raj wrote:
> I am going to post v2 soon perhaps by end of this week and whatever lands
> upstream I will update oe master. I would suggest to hold any stable bran=
ch
> backport of this patch until then

Sounds good.

Thanks Khem :)

>
> On Wed, Nov 4, 2026, 1:19=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
>> On Wed Oct 28, 2026 at 6:19 AM CET, Khem Raj via lists.openembedded.org
>> wrote:
>> > With clang built musl's math code assumes
>> > floating point exceptions are never inspected and speculates FP
>> > operations across branches. expm1() then evaluates both scaling
>> > multiplies and selects one, raising a spurious OVERFLOW, and libc-test
>> > math/expm1, expm1f, hypot, hypotf and sinh fail on qemuarm64.
>> >
>> > Pass -ffp-exception-behavior=3Dmaytrap from musl's configure when the
>> > compiler accepts it. GCC does not accept it, so GCC builds are
>> > unchanged.
>> >
>> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>> > ---
>> >  ...p-exception-behavior-maytrap-when-su.patch | 46 ++++++++++++++++++=
+
>> >  meta/recipes-core/musl/musl_git.bb            |  1 +
>> >  2 files changed, 47 insertions(+)
>> >  create mode 100644
>> meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-ma=
ytrap-when-su.patch
>> >
>> > diff --git
>> a/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-=
maytrap-when-su.patch
>> b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-=
maytrap-when-su.patch
>> > new file mode 100644
>> > index 0000000000..dfff81299b
>> > --- /dev/null
>> > +++
>> b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-=
maytrap-when-su.patch
>> > @@ -0,0 +1,46 @@
>> > +From fe310a5e2fe6be3c28f800bde383d7df5aac4b49 Mon Sep 17 00:00:00 200=
1
>> > +From: Khem Raj <khem.raj@oss.qualcomm.com>
>> > +Date: Sun, 25 Oct 2026 21:54:26 -0700
>> > +Subject: [PATCH] configure: use -ffp-exception-behavior=3Dmaytrap whe=
n
>> supported
>> > +
>> > +The math library relies on floating point exception flags being raise=
d
>> > +exactly as the C code would raise them. GCC keeps that by default
>> > +(-ftrapping-math), but clang assumes floating point exceptions are ne=
ver
>> > +inspected unless told otherwise, and may then evaluate both arms of a
>> > +branch and select the result. Built with clang 23 for aarch64, expm1(=
)
>> > +computes both y*2.0*0x1p1023 and y*twopk for the k < 0 || k > 56 case
>> > +and picks one with fcsel, so the unused multiply raises a spurious
>> > +OVERFLOW. libc-test's math/expm1, expm1f, hypot, hypotf and sinh fail
>> > +because of that.
>> > +
>> > +-ffp-exception-behavior=3Dmaytrap tells clang to avoid transformation=
s
>> > +that raise exceptions the original code would not raise. GCC does not
>> > +accept the option, so tryflag leaves GCC builds unchanged.
>> > +
>> > +Upstream-Status: Submitted [
>> https://www.openwall.com/lists/musl/2026/10/28/1]
>> > +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>> > +---
>> > + configure | 10 ++++++++++
>> > + 1 file changed, 10 insertions(+)
>>
>> Hello Khem,
>>
>> I think this patch (now merged on master) is a good candidate for stable
>> inclusion. But upstream seems to have rejected the patch[0]. Any advice
>> on what to do regarding blacksail?
>> Merge like this or wait for a fix that is accepted by upstream?
>>
>> Thanks!
>>
>> [0]: https://www.openwall.com/lists/musl/2026/10/28/2
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


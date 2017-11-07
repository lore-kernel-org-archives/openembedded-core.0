Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F35D6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 23:00:28 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r68so14643164wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 15:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zEHkpB0QO7edK1lsjEiXNLBuVFadc9Q1WNw8hoga+E0=;
	b=EcUtdCJYdpTHbgpU7bq/A0pkl/X/7I9S/9XKkHMq79LR9e6L3HO8K9i2X025x43QLY
	ydaYYYp0IKCHg1NBCk274PxllpKknyJdrgibRBuDGCXO+zpIRVLNm5a4PPRcibz6fES7
	Fd8MxUvdP/WHw21HTKB5p10NYDdRWF0VAtnuM/64zNOMoSE7lVzZbDluicFpKQzmzXyP
	n1u4YLdWyvceacPYYIAjuq2nTvK5n8quaoVfBfugbPWg/zIBlq9rlnpBkrukhwMebOF3
	wH30dN5YPLSlXnfHSax+MZ5b+fFny7qslJJnDAA8QqoVUYlG9IyEZEEiQFP7mRI9BiSQ
	RA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zEHkpB0QO7edK1lsjEiXNLBuVFadc9Q1WNw8hoga+E0=;
	b=Eet8k92EnP+5YtJ1dR9qPGiZkyz8PXKYlGRAeB2WVcI4PtJS3O7yMhrGSecDCP9o4A
	GA4FzTMLrrqPZbAr+0nWhT31MZsOQFsRx+8Zkw/GnN+eQ4uY4z3tqK+6e31r5mPIGWYq
	+RqlE0qfvAAk9opVIY1wC/S1ABEqWOb/lMqzQUQTIwc3jAUy2itUhXaXOSVZXMWjLnVL
	knB71Rya7HAJ0CKkUtljY0NOVrY6KsUpReo5LrwqqWR/pjhRLUbJNr2KJOt+AcLsqkxO
	5ejOxdogkH6vchZDm+xnGWArsEDl7KNn2rj0rdTQuuLjA6U8MZQkJK0hw2QEB4so7NI5
	2D3w==
X-Gm-Message-State: AJaThX4tXlQB6KjC5QJ10fNCy3Vi5Wa3xSNP//T92J7A7ruGD+2DrLTT
	SnOEbuNGadUk2EI9jTEXFzrlL1XE2/KQSyEcIYA=
X-Google-Smtp-Source: ABhQp+SHqUx8MZUo3T78ERJLnUg82EdBH1X8NFok737xrqk1zGQYO3TR1RXTMOZhMmGEV1DuJ6Z6OQfiuetwcnyUR6Y=
X-Received: by 10.80.161.134 with SMTP id 6mr854001edk.197.1510095629119; Tue,
	07 Nov 2017 15:00:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.204.200 with HTTP; Tue, 7 Nov 2017 15:00:28 -0800 (PST)
In-Reply-To: <d47497dc-619f-1f66-814a-bf93cc1d0227@gmail.com>
References: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
	<d47497dc-619f-1f66-814a-bf93cc1d0227@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 8 Nov 2017 00:00:28 +0100
Message-ID: <CAAQYJAvNHrTGn=vD_eF_=rx_cNJFNSKfHdMa5vFvaYJ_6zq-fg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Backport gcc7 fixes for armv5e [ARM] PR 82445
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
X-List-Received-Date: Tue, 07 Nov 2017 23:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 4:10 PM, akuster808 <akuster808@gmail.com> wrote:
> Andrea,
>
>
> On 11/02/2017 01:46 AM, Andrea Adami wrote:
>> Hello,
>>
>> the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
>> Bug was fixed recently, apparently in revision 253892 [2]
> If you have  a test case ie qemu settings, I can open a bug and handle
> it that way too
>

Armin,

once I saw the kernel was not booting on real device I wondered about
gcc and did a build for qemuarm/arm926js.
This one was booting fine on qemu.

I then beated OE's qemu to run for my spitz device (spitz is supported
by qemu but lacks some variables needed by the script) and with my
surprise it was booting...

So no, qemu is not a valid testbench for this specific issue :)

Cheers
Andrea


> thanks for finding upstream patches.
>
> - Armin
>>
>> Khem, please take care of this, thanks.
>>
>> Cheers
>> Andrea
>>
>> [1] https://www.spinics.net/lists/arm-kernel/msg594654.html
>> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445
>


Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 78E496FF3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 11:05:19 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x201so164841719oif.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+NYul9JXdsmwU7fgir1Ub0m+r9EC3rqof9AKpvWdBz0=;
	b=jm+QzVLTy65a9VKRo14SuRmLzoY3UMJCvrkIINdSs0bENSbJF7dTNBZeCcwrNF6w6b
	Wys/4Q2q1ISGffxAt3lzWm8BI28Ja1voueDHkLnECYOBnMMlEzjbvKGDR3SkwyDfJmO2
	6QhkZo8EAVfFC4h2k+AdrcUUFufNjBmMdN12G0nAPE5usGCrULKBjOZx+UgrxqhTtZPY
	Me5oiQnRrSLIKrfVgkMZoNlbhi+vQui8dEWa7dH+Yggdgi3Au0hhsvdXlPLDzpLzzn+3
	aMC3WHt4Qteg9VQVNipEU9av9bSQPA+gFWzoyLm2yxZm1PFxd09pvhlmATZ68Do03fd+
	V3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+NYul9JXdsmwU7fgir1Ub0m+r9EC3rqof9AKpvWdBz0=;
	b=QoMYr58XjIVowfiljBhcVCU/G8Petf6DLfQNzhMglCOq1dbG98gtrRlFDkx3d1kOEO
	Ricwb3VZe22ibwo4oi66s7GL95gwfP5tltJSVAqY7Jlhczn5EbxtqaDoJrJtY//pjsOE
	0u1raPxqHBeJb33RD7Gnk7z9kUm3wroxpsvnwbOfWUPxUX1btqCffpaKCwInYYIwx//W
	sUNJQmBzcaf4X/Qt2/7srb/OStyn4rluTdXYd0qZetut1iz45AUgLCkchoSKD2Tgk28C
	ItMJH5r761qimMqgKexPJ+OUbfaByck2nQXIZJEXKvLGb7gAnwCdGZZIRYBTm5Ju4XeQ
	Lpug==
X-Gm-Message-State: AOPr4FUQiMuUcrYSdNqB6jvV/tGlO/IT0XPh8Yj0TxGDQXvC+846qSbcra3xh774qVSgUICnorrdHk9IPgPUZSNP
X-Received: by 10.202.197.70 with SMTP id v67mr7208797oif.63.1463137519856;
	Fri, 13 May 2016 04:05:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 13 May 2016 04:04:50 -0700 (PDT)
In-Reply-To: <CAJTo0LZdjMyR=zH2jzAoo4JF8vpL1iUQZdn16E4ghw64iS664w@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<421b6ddea183b6e3260a8383574a23d078f93132.1463035854.git.jussi.kukkonen@intel.com>
	<CAJTo0LZdjMyR=zH2jzAoo4JF8vpL1iUQZdn16E4ghw64iS664w@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 13 May 2016 14:04:50 +0300
Message-ID: <CAHiDW_EkruCtZK4vQFHh9oSpyZaMs8hBEBT+m8tX1WqHGSUbuQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/13] wayland-protocols: Add recipe
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
X-List-Received-Date: Fri, 13 May 2016 11:05:20 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2016 at 12:15, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 12 May 2016 at 08:20, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> wayland-protocols is a collection of Wayland protocols split
>> out from weston. It is a build dependency for Weston 1.10.
>
>
> * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> weston-dev:
>
>  * wayland-protocols (= 1.3-r0) *
>
>  * opkg_install: Cannot install package weston-dev.

Thanks. So having a lonely -dev package does require some tricks: I
think I'll just avoid doing that in V2.

RP also pointed out a problem with multilib weston: the logic for
finding the protocol directory in weston configure.ac doesn't work
(because the allarch wayland-protocols ends up in the non-multilib
sysroot).

As I said, feel free to drop wayland & weston upgrades for now if you
want to move on.

Jussi


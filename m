Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id C75E06006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:47:52 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id r136so60695732vke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=cyg7ehGkkw7S5d6Jot0cQk6dvTn4++P3ZcMS24ZDH9w=;
	b=BLx1im45jzun7VZNSp5lDTooAMwq8pJ+Bt/e33ied5ayq2GpHThlVByMpabRl32Qpl
	gQrdI0L2ABEAqT6WQVQoSR4bm5iabibDDR8Cqv17nBya+MgLD7Ksnfvh0SJAolXuCeUQ
	xv5DX3ssKddOD9oa5zMK2pXJaYkYCLcv8ZEzXpprrude1WyLEQs/gtrvXfLx46w6zRjp
	OYjiQZbxGVnFiYHl9wCSreyr8mA9z4KdnfzCYk2EX4AIvV9mGSKju/DOnHRNI1vUkCtb
	fi9FAuJLWc+e1qYVtz7mMPXuRsYud6dLAsceGHli4cUg81pfZ5a68dEBr7GYoL+YVkRD
	Ru4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=cyg7ehGkkw7S5d6Jot0cQk6dvTn4++P3ZcMS24ZDH9w=;
	b=BXmW9ZgZA+cEtFmftUEo44oUmunDbu/1yVc6NdWd+yY1B5i5Ha1n7/6R25YXB/uuLg
	CejBmR26YKFhJ3xjxMpW1V/D4EwBnI8sFkBTOTFD38mAnRES7mynp5Jc46a0kk9uYT+Q
	NTie7w2r9NutpYAPuouffKRXkcSZqq842VFUBIhqRj8+Xi8q6fhxwLrS+iA4SZ4htLus
	+4jbkp/hxC8eSVkNW9MUDa2EbvzBkE6JulboET4BHBiNqTPOjvGXSNdZFRRkfCJ2uywK
	UsQq9K1a9XVzWEy2jxS3yrgmReEvoGzUTuAvxxO7/T0Vvq1C2cxjWVqpAjP6nkC/Z4xf
	jgXg==
X-Gm-Message-State: AMke39nm7JZpLHu7L7a6NTeDZ3ltu48YfliEbZUgTniOzzTkrQDU5tRShqPGLQJl2uUz3s9MUEWEiSjJlBv1Pw==
X-Received: by 10.31.212.135 with SMTP id l129mr9551167vkg.134.1486993672327; 
	Mon, 13 Feb 2017 05:47:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 13 Feb 2017 05:47:51 -0800 (PST)
In-Reply-To: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 14:47:51 +0100
Message-ID: <CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 13:47:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 1:26 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi
>
> I try to get meta-qt5-extra fit for latest oe-core (RSS). One thing
> that causes my attention is that many recipes's configure can be fixed
> by adding gettext-native. This seems odd to me because all of these
> recipes depend upon kdoctools which depends on gettext-native.
> For instance for kconfigwidgets depending on kdoctools:
>
> * in kdoctool'sworkdir/recipe-sysroot-native/usr/bin there is a gettext b=
inary
> * but in kconfigwidgets'sworkdir/recipe-sysroot-native/usr/bin there
> isn't a gettext binary
>
> Is it possible that recipe specific sysroot broke native dependency chain=
?
>
> One note which might be important for this issue: In meta-qt5-extra I
> chose a the following design decision: If there is a pair of
> native/cross recipes
> * each cross recipe depends on native recipe
> * all other recipes depend on cross recipes
>
> This reduced maintenance efforts (I don't have to care if a recipe
> depends on cross libs or native executables) and avoids race trouble
> with cmake's toolchain path sequence 1. cross 2. native
>
> So what goes wrong here - or where am I mistaken?
>
Another more common examples:

* in meta-qt5-extra I could fix many recipes by depending on
qtbase-native although they already depended on qtbase (qtbase depends
on qtbase-native)
* right after recipe specific sysroot a dependency on qtbase-native
was added in cmake_qt5.bbclass although it depended on qtbase already
and qtbase depends on qtbase-native

Before we carry on adding dozens of dependencies and blacklisting
world: Are missing native dependencies a bug or a feature - or where
am I going wrong? What scares me most is that my way of depending
always on cross recipes in meta-qt5-extra will not work anymore
(mentioned in my previous mail) and turn into a unmaintainable burden.

Andreas


Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A08EA73218
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:18:55 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g203so191913393iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hwLW8KBj/UV4l+kPu0nUQGJWnjw6+cisR3lS9rZVFwk=;
	b=YKVxd+P40bcU2MF6wAdj00tLqv0PXyEWnLlGPCjbBgMiJC2yQTKwcoTgwCtE0BSf1o
	fdm0Tgukz0J83ivI01haBUI2CT7RtllytKypwbgyahDlgBKVTXjvEEGudrQGg4doVeZu
	vauRRfjxs9SJzv2MxnYH4vHd8KyhGzBR6Uo2JqzCViSgXOWkCtVStkgoTA4QiohZ5Ko7
	3Rfa4aiQ6Vq8Xjw3x9x1OUALYLxmoUNoAmdyjb5m6dG+0SS0qvok5Y3kVE7AdBnquULU
	/FEvTtnPAwtiYj/hl8CEOBlUOSm729HHcABsieAXgxyVS9qAbhvg+mhZ0YpitpaAEXcA
	xx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=hwLW8KBj/UV4l+kPu0nUQGJWnjw6+cisR3lS9rZVFwk=;
	b=jPo8OY/1LrqwQJZDzyh/VU0BalunhF/nN0hcSOdoVj0nuPTWqU9UtMTo1rsBWJ5VQT
	O3FKD7J0T59Hit6lYYiDimNb2gvKBnQjp3ZIKz0MP11t8/MLZ6eGlJeQzES1v2g3OpxY
	6t7j8s0JxzdFjUZ1IOP25wXt6WOIXAKVN4FvhXtxXjdzE9B+FYpRz09VLm+aLD02JGGE
	+DDwcwINOcw/TiYAqK10hDiz29Zd/P1Dp4sYz4OhGgxJpzc9wR/Nhg/uDShBeR/7Df5C
	5UA13oBuGivdu53X3AAwElohyNhb5aycmTiZrP1Lenao1OpNT9rgYkAB/BwZ9Q5Xrwls
	5z0g==
X-Gm-Message-State: AG10YOTEVeaUEHZTVKcqrEiAF30IgJRezKgcy1aL5A3GiWu/vYrt1M0KE0biByslYujD6W9Xro98veYY3Xx0nw==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr27832099ioe.148.1456175936391; 
	Mon, 22 Feb 2016 13:18:56 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 22 Feb 2016 13:18:56 -0800 (PST)
In-Reply-To: <CAJTo0LaZajepL6zERZe792uJZzV2O=RO4J7X2WOAUhPDOASXgQ@mail.gmail.com>
References: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
	<CAJTo0LaZajepL6zERZe792uJZzV2O=RO4J7X2WOAUhPDOASXgQ@mail.gmail.com>
Date: Mon, 22 Feb 2016 22:18:56 +0100
Message-ID: <CALbNGRSqfZdWsUYwDeoyFv020ppDpMnatT9AcT8jHYU8K7_kjA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetcher broken?
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
X-List-Received-Date: Mon, 22 Feb 2016 21:18:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 10:13 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 22 February 2016 at 21:06, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> after all these scary changes in master oe-core I wanted to see what's
>> left over working since jethro for my images.
>>
>> On thing noticed immediately: I see
>>
>> WARNING: flex-native-2.6.0-r0 do_fetch: Checksum failure encountered
>> with download of
>> http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2 - will
>> attempt other sources if available
>> WARNING: flex-native-2.6.0-r0 do_fetch: Renaming
>> /home/superandy/data/download/flex-2.6.0.tar.bz2 to
>>
>> /home/superandy/data/download/flex-2.6.0.tar.bz2_bad-checksum_0103b909e1=
9ca9c6497a7ae696c16480
>
>
> Well jethro only has flex 2.5.39, so where is this flex-2.6.0 recipe comi=
ng
> from?
>
Sorry - I was unprecise: I set all layers/bitbake (except meta-qt5) to
master to give it a try.

Andreas


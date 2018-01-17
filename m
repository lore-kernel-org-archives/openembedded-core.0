Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id AF16978766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 21:43:56 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id a204so15587897lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=iPYwjUvukJ5zZcf8VVWhEOufi81NVhIFkwI3w+cycpE=;
	b=q9rIGE23IUc7UJF9nUFMqRAsftwhgMOYQYd5r2iDsPd6hplEPjmYjAxbIhol+aELUX
	JcPJoLZDfnC3WKJmY4hSMTDeMIwh/70IFnQOd79YQCP7CxUJvK4ugQ788ndsHBou77ul
	6R22BNtl2k6Dsh7T3agXSKe2c/RVaQRD/tH4ZaBDc+N2wLLghubBiMS4YH8fGUqWyXQD
	/HwNLEjXRlnLQV0EsVis31WmqOalgPkLuMbQSlhchkAkpTNyTxXNUqQUFSHuMoKuPpQB
	ioUG6JYwAbKL4fMXCwseAP5pRpHuRm+z2k9ZPs27Z53F7b5wh/pZhF+joNclvnNiCJSz
	cRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=iPYwjUvukJ5zZcf8VVWhEOufi81NVhIFkwI3w+cycpE=;
	b=ub4DOxCW37hcBNDC2Q7x51B3+W/L4np7LGspc/xiI5ERYroSUQ5R4VJoQ6PvaoMK78
	CE4f+XkZzdkhSjlTNQhU1lNjS0F9GXt+1N0ysjgt6GLG8uWORr3AItbeaF1oah2cmJEz
	gEWNOsobyxhdpdkTm42ABJehlumG1duQ6hRLp9fs5ToeRTl09QtFu4cLh/G3/ixPjIQl
	wMa5CS25odTT+KeujRQJInlprI629dIAKt9AYD12XcqpumBIVvdiqbCCyFp1p05l8Dep
	hTClYb6/2MeugBqbMHYotbbgucSwEqheVifKJAOwt9Sdsvu+AjqqrAJM6wg5IoYmu2th
	1rtw==
X-Gm-Message-State: AKwxytfEAYmzET5vHi6nwjcz2GmK5VXJYDjm+PyQE4t4NF4OZQwiRinQ
	4FARYKqckUVcbb8UBqsm71Jzgf45y0LwJYlFVOq4kya1
X-Google-Smtp-Source: ACJfBotSwi8rjOTJzP5OZsqXvtHez+3VMVaR1UNdQT3b05EFpepkOzRdc7SlYBc14duYgU67QEGN2HoA0rp32xcod9M=
X-Received: by 10.25.150.147 with SMTP id y141mr1912699lfd.33.1516225436815;
	Wed, 17 Jan 2018 13:43:56 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.46.0.86 with HTTP; Wed, 17 Jan 2018 13:43:26 -0800 (PST)
In-Reply-To: <20180117210527.2785.57400@do.openembedded.org>
References: <20180117204136.21647-1-alistair.francis@xilinx.com>
	<20180117210527.2785.57400@do.openembedded.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 17 Jan 2018 13:43:26 -0800
X-Google-Sender-Auth: ZIeq_tSj2V-U_qSQkayvauLyZXU
Message-ID: <CAKmqyKOQWUSmiwVgPYq1Z47agJ1CRpZ5ptPLeXVw=x-jfxAxjw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHJlY2VpcGVzLWRldnRvb2xzOiBRRU1VOiBCdW1wIHRvIHZlcnNpb24gMi4xMS4wIChyZXY1KQ==?=
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
X-List-Received-Date: Wed, 17 Jan 2018 21:43:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 1:05 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: receipes-devtools: QEMU: Bump to version 2.11.0 (rev5)
> Revision: 5
> URL   : https://patchwork.openembedded.org/series/10286/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format]
>   Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

My mistake, fixed in v6 (this is the last one).

Alistair

>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


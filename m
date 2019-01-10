Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC927C0A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 22:09:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id v5so9436167lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 14:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8O7bSChYf208DZ/UBlM45qPyiKwl+kGq/hZSKQgQ+QQ=;
	b=LfIwhm7ae8+qCMbN5od3MdSG8bOT2bwWaDhF6sSalJZWWsfshB79Krw00cy0LiooqX
	uXsx5IpSzYr2N+8AmFNeT6jT1yCUVL68T/ayy0yPRJUwsPf7EMIdZDGpL1BaCAx8KRkK
	Puf72JXN48Z6u0i8JXq2F5NeSAY1a3EgcwHtKiZR1EIiAfT4mV4noTWd6fXJEsUYj/5c
	GbjdnkEC/RhriyY3a7ereA10ii6ffxdq66vq+ZjDciDZdXcDcPDNvyU5+dqF9lPxfDxI
	Gu+wTHu5xmufQgvvdYkrNeROSY5/nFF/57ZZNAaLCpe8+p8FjvgnutMS9IWR9Hbpb0sU
	QR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8O7bSChYf208DZ/UBlM45qPyiKwl+kGq/hZSKQgQ+QQ=;
	b=sEz12ZBpM/qvB27zcCI5BmGef00atttKz8bOAUAkl4ubwJwlVcDp4qoohSfScvB1Jo
	DiOCYQ+tcIKP1ywK6rcwU/fSfXQBmPzMXToScoHATT5zx5gctgPJJDqIYwCJ49R5KYjD
	bJ+99/GZMABUOoxMWcqoPko+/6mcZxr9/eLW0shweA7DBb/Uwt22gm2P0TGw/0uZM9S4
	BQ1D0vcn3cKeOnjD606KnxnCQ3S4OJjeem62z6sQEk8WfNt4ayvZ5z3kWYVw/55gKVst
	xxsHJaMHtHDKW5FF4avKoV/C/iSVTObBejukmIGoo+wzVzjJ8Rp1G3x346lKM4YJ8l2Z
	qqzQ==
X-Gm-Message-State: AJcUukfCp6ww2+EwNi+Us7JrKalhjdmB3Npr2jtxlyMPQL+cARo90kwx
	dunHeyPpY4Bx6y2V7e2WTdh0iLIazWIIAUq3iefLHA==
X-Google-Smtp-Source: ALg8bN6AfEsSSc+mR7GR9D0Qe2FFEutowq49XIq29m6Bct1h2r+Gm/omApMwWCndizZ2CYJYB1eifAhRrGiLS96qnZE=
X-Received: by 2002:a19:8fce:: with SMTP id s75mr6592612lfk.151.1547158188460; 
	Thu, 10 Jan 2019 14:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20190110200045.14152-1-alistair.francis@wdc.com>
	<20190110203314.2331.87567@do>
In-Reply-To: <20190110203314.2331.87567@do>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Jan 2019 14:09:21 -0800
Message-ID: <CAKmqyKNbv0eWAkmsqTe=FnmSDEJuvUVcu=qfuxz1M=gsNaYcvQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdzdHJlYW1lcjogQWRkIFJJU0MtViBzdXBwb3J0IChyZXYzKQ==?=
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
X-List-Received-Date: Thu, 10 Jan 2019 22:09:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 10, 2019 at 12:33 PM Patchwork
<patchwork@patchwork.openembedded.org> wrote:
>
> == Series Details ==
>
> Series: gstreamer: Add RISC-V support (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/15576/
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
> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file (meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch)

This patch is straight from the gstreamer source code, I think this
error should be ignored.

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


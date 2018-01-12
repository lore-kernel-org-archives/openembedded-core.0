Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A8204787F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 21:04:45 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 81so4005349wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 13:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=2RqPXguiFXkp1W2sp47uSle7K3AFTDkRw7ph6j70+NE=;
	b=anT2k1FYgt4rHRH4ccwdS8Nw6qmO1imbP3KjKV0RBQbCTXG4UkxXrBAo01PexqQI7b
	mUr1LqS8d7e2ZQa7JNu+MZAB9goUEzuEYk2PIWBtrFgYCJ3HHYAafb8Cvo38ZzzwvwbR
	uXkdmO6Z5Et+EETdwdYZJjfS1wUQUtEg7PL+21c8h6/z0i3+fPnIpDwNmdhH7vUa5Wtr
	hmREEMoM65ACx4N5bmkBAfbBqv/T8ilY6KxNBkbCyx3hrHDBZqNxDWXTvDGLAxWsY5qf
	XGYmlzc0RX+b9bI9ZcQCFk37gHahsQfM/ZwoEXSXkI2MpA/t1rnr223pegQTR6bZX0TA
	DT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=2RqPXguiFXkp1W2sp47uSle7K3AFTDkRw7ph6j70+NE=;
	b=AXhXKn+l7RuS7oZbuhyiIEkD9B7GbwiyrgtiSd7Ej8DfBassRx+QRlpykh3VeyBm/p
	F8jPZH9IhyaA9zZ21spT61M4Ycon2gWdJD9+JhF1S+RsOC+4MpjlkyrrkdnqeR5NaU7v
	Sy3IkMvMAi//LEm3XK3mO2BPnobZ2Z3Um/jHmJ2ItHwOMDPLTFWV9NVhuM6Vqqzd92RB
	44b50TiV10kD6cygyuk2KBuFJKdwbqzqHaWPTXg20m5HrnENWcU+IA2VI+gftt6jLzcx
	X7FxxS4MBXVFVZiMML1uK0c5PB3udEZnJYMd7ehrG9tEVqoauVQ3WM+U0BQYdjyXT0+H
	FF9g==
X-Gm-Message-State: AKwxytfLotoz5QHeC8Ak2H5XZbYA1aDH/PLO1vqHJhzaDkvMphlAl7fN
	oifXDM227SY9DGsflR2GtXRr2yMihkt/EJEiriJwhQ==
X-Google-Smtp-Source: ACJfBoutglrdL4urawW3T44djVV58mLqzj2f2Q3oycj25cdWcGRbuxHtiYROHUeYEhKcsY44GbvQE6rLoDXl5257moo=
X-Received: by 10.28.105.214 with SMTP id z83mr5323150wmh.77.1515791086128;
	Fri, 12 Jan 2018 13:04:46 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 13:04:15 -0800 (PST)
In-Reply-To: <20180112210255.2787.68057@do.openembedded.org>
References: <20180112203457.5838-1-alistair.francis@xilinx.com>
	<20180112210255.2787.68057@do.openembedded.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 13:04:15 -0800
X-Google-Sender-Auth: LT9JnwWaHI0gUF7iMwEzbrf1wYs
Message-ID: <CAKmqyKPB_x5LkwKsXRXeGphRJfbbz6sr4mVBoNB4P1S2utwwUw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHJlY2VpcGVzLWRldnRvb2xzOiBRRU1VOiBCdW1wIHRvIHZlcnNpb24gMi4xMS4wIChyZXYyKQ==?=
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
X-List-Received-Date: Fri, 12 Jan 2018 21:04:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 12, 2018 at 1:02 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: receipes-devtools: QEMU: Bump to version 2.11.0 (rev2)
> Revision: 2
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
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 4facc57238)
>
> * Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format]
>   Suggested fix    Fix Upstream-Status format in Revert-linux-user-Tidy-and-enforce-reserved_va-initi.patch
>   Current          Upstream-status: In discussion
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

This is awesome!

I'll fix both of these in v3.

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


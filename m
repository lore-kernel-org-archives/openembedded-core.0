Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id A819978711
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 22:37:22 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id e41so6218408wre.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 14:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=2LJPBTiAdqUyMefx0fwtLSnsCvryOnyckarminOC2f0=;
	b=UaMbxwh4I6FJ6mAKBki8ATx5whLnv8691LUUgnREE6Oa0ZUl/pdb6KhppUwczYDmjY
	1nnFELriKjLn+eMbBskE55FtIs2UlK/X93UjwiXFI2jqm6L0yNj5bS1I1TC8Idve3Fu8
	YSIvuRAp89NEwCnuX2EVRxl8jk5S+VJ5QTEjcu2jFwKKFEjviF6e0oWxhaiZEmORO5xH
	0oZw45R6ft9csD36ZK0Eq1GnG3eX5acgUfm/td2VxkG+vQaSzKZvlsDTMSSZa9pwflro
	nHVxAJz0Xr+GULlvDhaxMmbWBpQBCf6yCTV2MCcl/FyqgLcsQOXP19V7up0g0UmIaaHY
	1P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=2LJPBTiAdqUyMefx0fwtLSnsCvryOnyckarminOC2f0=;
	b=KNGcNek/ZtS2jYWGtrunTLTnMMC975mdLQcC/MDNxdKwo2V7JWpyXpvRo2dTOBVv92
	/DS4U9ekitv/oZlnsmE6pBwGE7qQ7Xy1E8FFbfayS5dDZorlRjvHHeJSZiI9qOL7nhgV
	/BYGhuhqMZTuNEoSD7/NcmaRCvhkBIgAOXnfYvAqqLwPr12mG/1CCWeS04PEDjh56qoy
	ccqVl1qum6tZ579h6OFDerGAXgk4g7PzWl4j1kR2EHUUA6utBrX6ePjQF+Kl7Nsap+TR
	W4CChQJPYbDY6/frpVPxFi0XX6zoswbC5RItQd3S2j7P9brBYvtM/5+z95dPF+ScWCcz
	K4mA==
X-Gm-Message-State: AKGB3mLwZ51Nn5PrfBGBXdRY0dwBrl3vdBIxhSyIKU0QY1KfcwFerwKA
	4maQaxKaTZbb84IsM7E1J1o/nIAnjpLiy0l/zgpGWRx7
X-Google-Smtp-Source: ACJfBosdZhN4fskgsbhoT83n+PCd1WOrWfH8i5w/RHJ159AQ3h5kZJVhZwYzalHzjau0cKWcUOkXru3eL6sm5Irv1DU=
X-Received: by 10.223.158.144 with SMTP id a16mr26257142wrf.83.1515796643103; 
	Fri, 12 Jan 2018 14:37:23 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 14:36:52 -0800 (PST)
In-Reply-To: <20180112223256.2787.91128@do.openembedded.org>
References: <20180112220906.27915-1-alistair.francis@xilinx.com>
	<20180112223256.2787.91128@do.openembedded.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 14:36:52 -0800
X-Google-Sender-Auth: yp5WPlD2TgKRcHOA1NfL9h9KQ-w
Message-ID: <CAKmqyKNwNFRJtTt77oc1wkRWHz24A3Pv98jmEi97fak-gaXi9g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHJlY2VpcGVzLWRldnRvb2xzOiBRRU1VOiBCdW1wIHRvIHZlcnNpb24gMi4xMS4wIChyZXYzKQ==?=
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
X-List-Received-Date: Fri, 12 Jan 2018 22:37:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 12, 2018 at 2:32 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: receipes-devtools: QEMU: Bump to version 2.11.0 (rev3)
> Revision: 3
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

This is weird, it's based on this commit:

commit 2fe1d126a6d439c29cc71a19173d6d477765a078 (HEAD -> alistair/qemu-2.11)
Author: Alistair Francis <alistair.francis@xilinx.com>
Date:   Fri Jan 12 12:33:22 2018 -0800

    receipes-devtools: QEMU: Bump to version 2.11.0

    Use the latest QEMU release 2.11. Remove all patches that are no longer
    required as they have been merged into the 2.11 releaese. One patch had
    to be updated to apply to thet 2.11 tree.

    This also reverts a linux user patch to avoid webkitgtk build hangs.

    Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

commit 4facc572380daf5b7e6294b388a657fa0a44a6f2 (origin/master,
origin/HEAD, master)
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Wed Jan 10 15:31:29 2018 -0200

    linux-firmware: Bump revision to 65b1c68c

    The bump includes following changes:

>
> * Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format]
>   Suggested fix    Fix Upstream-Status format in Revert-linux-user-Tidy-and-enforce-reserved_va-initi.patch
>   Current          Upstream-status: Pending
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

Missed the capital 'S'.

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


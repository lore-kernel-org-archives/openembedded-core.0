Return-Path: <wbourque@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 59CD37F143
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:15:36 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id z23so19651757ote.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=uBcG2F4NGHTtfAHMoEXQcqfa4WoTg/ny07aID3TGEfM=;
	b=V/nVChabfI1iNohe1AJmM5JOjcdVuJJtQb56H/XoE/qNxqyYa5L3pKkbMu+UXADbWC
	mxCg5hxiBeYaTmlWvUpJ4kC3dBXqVIpGOPLLtQN6hU9MdR+jlHovDjxg4EMiXFLYwxd+
	qFbH4fKyhR0lpONppGvRyEv69Aqm5MLG3Kywq8bKJqbn+H5aTx+9FpfD5x2SdMVOC+nx
	s5DvSCkOEs5Tz0+zJRg29B4eOOC+iA/NpESMnCqG+iknkNU4OMgjRlS+s5SMRh6sZ7ij
	pylkfkJ8f70GQd7XaywlPQrcjkvck2R3X1R/dWznsbhRufPKcbdPol1zjtQihm3LqfA2
	QqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=uBcG2F4NGHTtfAHMoEXQcqfa4WoTg/ny07aID3TGEfM=;
	b=e12m2rKZUBhFrg75pZWrt1udfJAJ6Hw8eCebUBVMJCoA8+BA/QLyfLjfbwztXeTtO/
	3R8P1kDp/dzOBQPz1h89DQ2c4qkyCrh97OJvl3DhgUuXDinQMELothuK/WlYA+KiwGB1
	gL0/dPaml5c7t9byK1dzBiydlR10Fk0Vl8InUWxAhS39d2CYzHK0AEA2z5GAZBiQLDIm
	zeGhwevUyLn+af/8S4nr8TSZ04tiOyeVET113o54ZUaEH/v1MjklwIOwa7vVBupfBU58
	PD9PLiF9k5KZ0W7Auwg0hY4hMzEz10CGeAn7fK+6OmD2zBp8mLT5ugXHDUE/EDxI8soe
	VN/A==
X-Gm-Message-State: APjAAAVSX/nucQDeP/BqPqmEfuzQ5/CHLGsn2bVAoP7RIfK7FaywBhPc
	uZHu1ePphpsl0vK1EGl2M1oBS1lE59/DRYfbsDXGTw==
X-Google-Smtp-Source: APXvYqzJR5pulsFd709Uv6+Xo9r0xTKfM2CXulVqsD/N6btgY37m92skj7CI3D6ZNqzEjSwpdNgR/TZTf+HcEFIX7ho=
X-Received: by 2002:a9d:76d3:: with SMTP id p19mr25117529otl.18.1563977737097; 
	Wed, 24 Jul 2019 07:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190724133205.31296-1-wbourque@gmail.com>
	<20190724140138.2329.44072@do>
In-Reply-To: <20190724140138.2329.44072@do>
From: William Bourque <wbourque@gmail.com>
Date: Wed, 24 Jul 2019 10:15:25 -0400
Message-ID: <CANBSh+N4r8nxAtora_sMJEYOK1=Z4LNKgLDgXu+6Y_Dh9DdYvA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbVjRdIHdpYy9wbHVnaW5zOiBTb3VyY2UgdGhhdCAuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Wed, 24 Jul 2019 14:15:36 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry about that, I didn't notice V3 was already merged (I was
expecting to see it in the series).
My bad!

I will re-submit this as a new patchset.

On Wed, Jul 24, 2019 at 10:01 AM Patchwork
<patchwork@patchwork.openembedded.org> wrote:
>
> == Series Details ==
>
> Series: "[V4] wic/plugins: Source that ..." and 1 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/18869/
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
>   Targeted branch  master (currently at e0c3436241)
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


Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4333478674
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:46:39 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id x63so21066795wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J8l+dPUoN3zj9qTV/EpHyLr0G33iKBPbzhCg0EUZQ2c=;
	b=pS7LGev+mgee8MhL0affNsFjNSAu2txZMc3aTSc/wY6Ow8ueH6m26FRB06M7RCM+Ic
	M4HV4Y37zy6RmmyKX8v+4Zcyui66EI9Evrd1m7Vh7TcF4OBWNlhafRPRiqfHWB/Z2l4w
	WJz2zyDFzO5P68w5J52Dsen10ITH/TDjlRSTpf+vkXFTQ83T+Jfz3pxv6aWM/uhpwesE
	TV7lRab03HyES1mpe8HGnmIRFDGUVki3znyvIUdMYIdZPr54K2fQkTsmXRz5Hcy1XtsU
	ifa1Rm466TpjcSzFMkcyUUW/rESGPE7K3Ieh58XWJXIU2XRTir5gFnU3+N01YXpDQete
	pD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J8l+dPUoN3zj9qTV/EpHyLr0G33iKBPbzhCg0EUZQ2c=;
	b=Eoc4MHpT6JAtx15/7hDFqDHCIdr+p22UGJypoaO1XvCjqUu14OWFgpYB3vzIywQDuG
	BJRxP2wlde0pBYs8NiHs7zI2Uh0qkU+ZGQUvQwIU53gR4UHh/AYm73M/ece3uljVP/wo
	Ks+HnXFQUupnSfsIUmlWqkUIi8/JHxgzomMns1jsJrcGRx65mGXCl4gV+D+URS2eKmqb
	FfTa6BB/zWFtieN+KaysC1XJhZ7qS+tZ9NULVYBcdoD4NhChs8S/m84ttrLLi9McLH3Z
	uSdeq8u4A/leWqhqQ6ZqTdFcSvmnb3LR2fHEaq1UGQnp3MHvkOsjEvcnKwy4ezovDm+3
	fiSQ==
X-Gm-Message-State: AJaThX7l/NIjZXIo2pRnwCOk1QwBa3oc7qlcxnwYz6sKlnCNEbpj5fBu
	RFT1M1OTKOsDrmmdrawMHd6GN/plBcH38s0UcDM=
X-Google-Smtp-Source: AGs4zMaFiLQn7dDi22wcFGckBtRba85XDyYjN09E4ryiskJyj5kAkIyJkSFpq3aWFNYuQ2NDJAiMqeRw1KwSDaet9GU=
X-Received: by 10.28.56.67 with SMTP id f64mr44985wma.35.1511207200687; Mon,
	20 Nov 2017 11:46:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Mon, 20 Nov 2017 11:46:40 -0800 (PST)
In-Reply-To: <20171120190530.2785.4319@do.openembedded.org>
References: <1511203084-3492-1-git-send-email-armccurdy@gmail.com>
	<20171120190530.2785.4319@do.openembedded.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Nov 2017 11:46:40 -0800
Message-ID: <CAJ86T=XjKS1eS58m94r7BoW0d0-Ps6WqXh-CjOh68qcoLvtarg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYi9vZS90ZXJtaW5hbC5weTogdXNlIGFuIGFic29sdXRlIHBhdGggdG8gZXhlY3V0ZSBvZS1nbm9tZS10ZXJtaW5hbC1waG9uZWhvbWUgKHJldjUp?=
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
X-List-Received-Date: Mon, 20 Nov 2017 19:46:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 20, 2017 at 11:05 AM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome (rev5)
> Revision: 5
> URL   : https://patchwork.openembedded.org/series/1745/
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
>   Targeted branch  master (currently at a17f3ec910)

This is a backport request so target branch is morty, not master.
Isn't that detected from the subject line?

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


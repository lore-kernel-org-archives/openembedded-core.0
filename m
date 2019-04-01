Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 248C37D085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:57:56 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v10so7511736oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FAlPcFn1OVFgBj1ndlVALra1M07XJptEV6QIZ7+3U6M=;
	b=diMh097mO5dxcYV+XlAztbyFgg9EtgpCkP1Qx/8FHtf75Et2i/4YPWp+POuO26/LpM
	iRlZ1SOaZlXe02cvf5XvEdeonylIYfLM8MSdbhid8mq7w7v/ITsbjYwF/Pz+5u8PRY/K
	k/kKJwSa6uG8mT04izncIq0b6c+ovEz1Bsy7EaFnYVm395vpoWndjnnsdLYSYSKR5Emg
	zfc5nCP9WRN2aH11HR7Ng/YxchBHIwXFKMrMEGt+Q93F3DrA4gu80oxFTCnduV5BJ9Sd
	ywH2gIKOdjCnefoK2fMDIctNmXnruKrqUiNiSO8hVCC87cQZELJyKhYSupFq/dFC6s59
	9FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FAlPcFn1OVFgBj1ndlVALra1M07XJptEV6QIZ7+3U6M=;
	b=rSpgqXpkVOhhrnTsWqHRGqcrfZNN8G23opwYe+JUlUVgbqQ3omWaYuPpAm4SIRNhKH
	/quEvR2RxrmpOpGN6H7TNJbjipjvsSrCJ49LxmS/k7/7F1bmtj5gud7mkuKF/6rHirL5
	aFw6uyZQhHZuXLNGZl5weByzzK8P0rlTbmRjI7mtIqppnRoa9MfQjBux5sZAWIj1JDXk
	WwJiuGfRXfnddzL+Dat+l6uiG3BxPXRDNxJGilZy4o6cUhd3CaLQPVT5ZTfY0VBsxCfR
	Gbb7moHOoCxtaXxjdWFrSHW9t+fGHsADxDRXADdnWaeRWnjndPI3a2yE/1yMqVmVge6L
	gdHg==
X-Gm-Message-State: APjAAAVbIqjcmogAZSiVLd1v3Y2BV1ziLmFWjopnVTLbmAi3OXnSSxBw
	qaMLIa51TSLRD7Xv/GIQQXlcOA0tOMWdkBA+fwDRm8SU
X-Google-Smtp-Source: APXvYqwRmak+q5SFn5J8mq+omDz62IXAJfcB3nozUbNGEB51lOtENRQ6h8maQVoGXUPAlGk3Fvj/XiIlcYv3GgZDVAc=
X-Received: by 2002:aca:5809:: with SMTP id m9mr13426652oib.88.1554130678082; 
	Mon, 01 Apr 2019 07:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190331161757.12888-1-open.source@oleksandr-kravchuk.com>
	<a23f92e9535e3c674a0fd8e7e5563302c222ea0d.camel@linuxfoundation.org>
In-Reply-To: <a23f92e9535e3c674a0fd8e7e5563302c222ea0d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 16:57:46 +0200
Message-ID: <CANNYZj9uVJb93OYvNA1UW+y3Xt_Ox3Upi2uB586RA+=JFcN4nQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] quote: update to 4.05
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
X-List-Received-Date: Mon, 01 Apr 2019 14:57:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 16:17, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Typo in the shortlog (quote -> quota) and also:
>
> WARNING: quota-4.05-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch fcntl.patch
> patching file quota.h
> Hunk #1 succeeded at 182 (offset 17 lines).
> patching file quotacheck.c
> patching file quotaio.c
> patching file dqblk_v2.h
> Hunk #1 succeeded at 7 with fuzz 2.
> patching file rquota_client.c
>
> Now at patch fcntl.patch

Just to remind Oleksandr once more, 'devtool upgrade' handles the
necessary patch refreshing gracefully and automatically.

Alex


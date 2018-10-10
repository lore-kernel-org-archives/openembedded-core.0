Return-Path: <nirbheek.chauhan@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1537970D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:33:05 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l41-v6so7310113qtl.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=29wyUBroXBwZhIfD8MmRwZJfwbmAMoMMBUTW3hyaTEY=;
	b=D0FKBncdf4+wxv7Cbvnky14XJgUQ0njUyooRsSGfxN/E7n5VteoWx5cgKoNnm5Yem+
	MWaGCJ7lLbjjm8dF0KJetN9tq2z66955WQ8PrXzaplTci8E3+7w2/u+aGgaJ/PAWQCUC
	szZ/TVaSiAyhVN9M8sxcPaTEUxMfH2Z1gctd7SB16+mLVNpxtL0vRE5YFHU/wIrjUOrh
	0L5fNRYNbrISwnXCs4SiS4P46j8mI/tvH89j0yAOVPSobPgbTTTmdNwHlLxa5TcWMx7a
	y1/IwBmerEo/QEKJZkvEt9kpWdQWF9FdB4RFlzrbGsbMB1Ai8Czq9V2+Zwxj1aIqXOes
	5Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=29wyUBroXBwZhIfD8MmRwZJfwbmAMoMMBUTW3hyaTEY=;
	b=K/STi77m1IeNz5HynL2pTy/NiEbjghGBEhR7L/C4eGMGSzU9Pz7sDNmJ95St5C4Rcj
	CmwOcF9ncUMB/xHPPQxEKRNR/vGK3r+otFCE8mqWjbe2SJFpxXrYQRhC3psFjeo5jRBi
	OmIFMV4S/d4fX4pkiY5SjRVLt/1vDypULY2WLWgp3b11eM6Z9mFzLuiXeClngG/LivMA
	0gtAA2Z0xuonXMWL2DTGDBQaHLpO1rspmYKV9WmMtFWFw8d/7vlnVOKSdRBL/RenJRAV
	viXTnyBJf0MbpFsxOulEo808M5semZmsi+hWS3z/hkI3s0NGqlLG51rHadCfuUMJWFf1
	TJfg==
X-Gm-Message-State: ABuFfojw1MMTrU5NtW8tY+Xil8PgolZQKX0h01pM797CS2k3NLQm7Hgc
	m97eyMQxhj6q6qfO5JUJIzNTZjrm7vWSqvgCXbs=
X-Google-Smtp-Source: ACcGV60jdSAWUENJ+l3LaKUiNA4mnfsaGqoAskkULQj/53er6xauWDUzwSs/LjI4Cv8Nek4rBhqk+yxhEiore5nxvB8=
X-Received: by 2002:ac8:6045:: with SMTP id
	k5-v6mr5786989qtm.364.1539203586225; 
	Wed, 10 Oct 2018 13:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <1539200144-19028-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1soH-xPSv2mrkALN94z=6xow28YZ5JqYELmS+N9k6Et9Rg@mail.gmail.com>
	<4478883.5euKKaLx1P@yow-masselst-lx1>
In-Reply-To: <4478883.5euKKaLx1P@yow-masselst-lx1>
From: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Thu, 11 Oct 2018 02:02:56 +0530
Message-ID: <CADqQcK4Mn1zSSh_du4=_aOcaiL2oy37m3mcWZTwZVK45UcTjWw@mail.gmail.com>
To: mark.asselstine@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: Fix build issues with /tmp mounted with noexec
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
X-List-Received-Date: Wed, 10 Oct 2018 20:33:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 11, 2018 at 1:50 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Definitely a bug in that it doesn't propogate as an error.

Note that compiler checks currently never raise an exception, and -1
is the all-inclusive "error condition" for when the size of a variable
could not be determined. Perhaps we should add a kwarg to sizeof()
that forces it to error out if the size could not be determined, or if
an unexpected error occurs.

> On the need to
> always use meson-private, I am 50/50 on that. Since meson respects TMPDIR/TMP/
> TEMP does it really need to handle this directly?
>

The main advantage of using tmpfs for temporary files is obvious,
which is why we try to avoid writing that to meson-private inside the
builddir. As I just commented on the issue, `XDG_RUNTIME_DIR` might be
a good candidate for an exec tmpfs location.


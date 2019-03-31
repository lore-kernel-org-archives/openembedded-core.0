Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 633847CFE1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:46:44 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id i21so5336729oib.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bq8dvWPynd3BOR9SEQIGQ9FdMUrNUvlRZBzpD7Jcfyc=;
	b=Q2OOvGJ1UtpatDrhvxLpBv2zwIhYucW5CUVXTSquQ6m454Y10rpASB9msVcxd8WTAH
	OfpisOcQCovt4l1jNra6iA/YPGKIc2NPcON5yTFl7AtdoUQDbu5uoEENdhzLgp7wdmvu
	yILAZP6s/9vI/27+5lojwN53zPEKw3MV1ND6uJgD7TL/FL9RHictQCT4Os3R4mI2sju/
	CetOAfkM7bZf71Hb/cn5F8KF7OlNy4T2yhSMOCehxLPYDXyv9V6E0urOcVjhyoy+ZV4G
	YNJo1US5Cu4vgACXcYIffiWAuYB2FyFgiKrYMvxnHHPjjRuxs/LKb32l4Al66qCmz+eU
	WwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bq8dvWPynd3BOR9SEQIGQ9FdMUrNUvlRZBzpD7Jcfyc=;
	b=QSooNL8s4/3+EyaVCuQRKRkIEvlA+OzxY/KXw6dcICHL/2WAtJSjJjXjYPX8idc9nA
	uTxuHU1/tXkiB2lKHcl++K2va3e+LDSgueRRCWSyDRTVZwPGJTWlv/C4qnUHKxIFOr9f
	R/2XBJDvB/WAIWmCUsaLmFEndA+B75L46NH1K1rpwO8+p/W09rnFg0gEQla2QlcvDGmn
	+uVblrCQgifsqve6iuWunnK6+PsGcoTtRzIxXgCSrom4gthDJ8HvJVSRHsb59MCMk3aH
	GFM+56QYHpZkYijOFZYGGjDUXV3GSofY4P+LQSUdE2GXksoh30O4W0UPoXwsN+bXMocU
	7oJQ==
X-Gm-Message-State: APjAAAXRfih6QdTFg92vYrex3Mas2EgGDdbSdIyfLX5Du8v7S6wq3Iij
	0/Exm0M7VSTAOoRSqgE2td3ErBLOAEZf2Gpvv+Ka6w==
X-Google-Smtp-Source: APXvYqynPXAwJyY5OYt9Q+sx1ywuJD5LopRG2x7GpoDNBWL0BsiBRjoO0thoQ4Mk/m053rWFo0skXZsoxEsMzi73pKM=
X-Received: by 2002:aca:cc86:: with SMTP id c128mr9772994oig.119.1554050805318;
	Sun, 31 Mar 2019 09:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190331154158.19019-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190331154158.19019-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Mar 2019 18:46:34 +0200
Message-ID: <CANNYZj-JWSZ_oe6qK1xq0nRpwZh+BuOkS8CfX9u1cgj_8oJ7XA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: update to 5.0.0
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
X-List-Received-Date: Sun, 31 Mar 2019 16:46:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Mar 2019 at 17:42, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> -According to Kevin Tian:
> -Upstream-Status: Pending
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> -Signed-off-by: Shane Wang <shane.wang@intel.com>

These lines were lost from the new patch. Which can happen if the
original patch is malformed :( Can you edit them in please (as the
commit msg body).

Alex


Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 914B57C583
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 15:58:38 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id t5so6646982otk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 07:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n4SlPwMJkd07oh5jeFXLnMuTH/IyPI2iQVNSrLTQqjc=;
	b=NMxJH1LkrE0MiCmXDZl2eG8M83dg9C9+B8SjirROBiSo3FXiwlFIQXZzXTmmJzQJTG
	DQ1a+sP63k07iVb1D8OfysQBz6lJO9MhA4nnHPYsiRTsR8zE1FcrGIexmSwv5KOuGcWX
	wZAxTVIedkRLBPQSrgrT17iFJfrpNO6p1mYHr8d20fcmKBGxMfhp71fUb7cwVs35qR94
	R6OnSczs8zjxqH7Ppsewj8jDlsHnrcr2pPQj9+JQqhOsWa76z5RNjUDsdbLljofQ3fbl
	IcBdqm6xfRP49C4F8BaQNU7BrEOCfJk+kxNqhjmoQt1cBkTwhQTQVJAoVZX8LXOAlK6G
	9e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n4SlPwMJkd07oh5jeFXLnMuTH/IyPI2iQVNSrLTQqjc=;
	b=tvIPwpswK8Slly0NGjgf1kh/HDWKmdjtin5ReM9LQCqu6y1ZkRAtGROWtgb94zZ0wJ
	NuJAyCcpXTljxL4x8AA7SF56ptAy+gYT3ix9i1JiUSKfvl5BDJLAEpCUuv8SBq7e3yTc
	uGLFKtrH8bre1l5Mbe6ufUEdIfvgoWaitkD6olzEmPa93yYNxZk+VoSqGhDl7+gxv7HJ
	zei4JvXk7FClhFBbgUkcSNDqSxdH+Yy3oEsGmejho8loRgDVbflMctr/d7HIsLlu4+4z
	d/Eqc6CFGlnAuBBfEpgjl7g4w/9qUVwbFiqZY1M+ysUtbGWus9ed0WGCKE9ArPMtESeG
	r/dw==
X-Gm-Message-State: AHQUAuZC+QgkL+LErvdekLGZrJrmtttpQvBdPCx2/h4Bte/IwUaBsbM2
	OlCDIBdquhXAfA1IoVHvkWtwnswCGMGx5UXcP5o=
X-Google-Smtp-Source: AHgI3Iaa16XRgsGr6Lx3MgfFYRaFObLBSHI5N594+FyyTHRgHB2ca2kHdhnVeVDj8X2w1+LBqqGYo03VK4Z7OFqkhSo=
X-Received: by 2002:a9d:640d:: with SMTP id h13mr13796867otl.153.1549641519739;
	Fri, 08 Feb 2019 07:58:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<a85aa0f19d694bd828ddde75c92d96bd7bbf4778.1549637121.git.alex.kanavin@gmail.com>
	<c7c7fd8c-6e73-ab1e-44bb-7df106c20c62@windriver.com>
	<CANNYZj9_cnyn92RBOQC+cs4iWitwvTGgKWFOF9DjgpW7zkbrSg@mail.gmail.com>
	<97a2de37-cc7b-3731-2933-b59aeae92446@windriver.com>
In-Reply-To: <97a2de37-cc7b-3731-2933-b59aeae92446@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Feb 2019 16:58:26 +0100
Message-ID: <CANNYZj8-44W5RyA+VF_7QPWxdouh=GbHtKwutWKeVwpjTgP_ng@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Fri, 08 Feb 2019 15:58:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Feb 2019 at 16:56, Mark Hatle <mark.hatle@windriver.com> wrote:
> > Patch 3 changes things in meta-poky/, and patch 4 changes things in
> > meta/, so they cannot be combined unfortunately. I can however swap
> > their order, so that there is less confusion.
>
> Swap the order and add a copy of the commit message (from 4 to 3) then.  That
> should lesson anyone's questions if they need to figure out why it changed in
> the future.

Currently the commits are:

commit 341ab87cf326dc1f1d7a3b83d624cde04047f43e
Author: Alexander Kanavin <alex.kanavin@gmail.com>
Date:   Thu Dec 27 15:17:26 2018 +0100

    local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl

    Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

commit 1170d353029dfb3f1a5ed9bab567e353bd034dfa
Author: Alexander Kanavin <alex.kanavin@gmail.com>
Date:   Thu Dec 27 15:33:27 2018 +0100

    qemu: build target variant with gtk+, and nativesdk variant without sdl

    As sdl is deprecated in favor of gtk+, it should not be the default.

    Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

I'm confused, what should go where?

Alex


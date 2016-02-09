Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63AB86010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:51:38 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id y8so51137199igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 03:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VKbvglVB1ruxwbo6/rphYi7PQkGTrOOEnWILtWAFv1s=;
	b=jCyzchyxPCYZXJDVq5A1kSWPrj1G75eIEBspngOiY7iVz2DPO8+YX2kEA0Uy/oldxG
	uIJ56Z0nNpwIYDfpF/rmql4rfEAXGczniZALeUlLOyi3MtFHJjrU54SfPtPpU+UzN7lC
	Mih5aygctRqO553HghsOl5M+fsFxYoTccu1/49WFv/g9pSaHt0n8Yrz1ZfhUjJylkHgB
	ouHHydUECyI0MJJEu04OdYMbdJXTfHpg9GI+AkWuftG6B/X0FeYOQbaVFnsena4kPSiA
	Htt19y0q4Xmy1MQYZ/H6iumbuXRROlR56D+NM23K2oFO5Q4MFWRXsDGV+hbyzLHYLiMl
	BVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VKbvglVB1ruxwbo6/rphYi7PQkGTrOOEnWILtWAFv1s=;
	b=PwGFRtArfieG8jmoqrF7RrlnlF2duH3/HwED6fY1Q8UcOMnh00xzYldVs+s7w3+V1X
	tSjEQkllGUtCw8xjzj/ZAHN6uh1Aq4J+AyncPE3ABQ1ruL36OQWTMDqlUYQN24eXzdNk
	4+x83Smet2Uu061EfZPqE18cUJC9LLiWnXE8qeXaj8TruEfwhRN77WHbKsIEcaM1KrQu
	FpYsrShAVyg/6BMy4CSw6M48CxswlrR/WfiGzUbP5cEGR8L4ikcXiqTdeen5L5xsXO3b
	BHBMmxc5MWvBXFoff0bXR5wm3MXXEOkvx5fM4VgjalphXs8n+agQq02la6VjyCsJMDvI
	IXww==
X-Gm-Message-State: AG10YORdkjR9L6ypiVVTJ4SfqhTEg7Gx82+k8WoMYC0FEwVaUmwOdcpTuQXfhxKSPNBBW09V3meZ23ov644RPTlf
X-Received: by 10.50.111.111 with SMTP id ih15mr4101351igb.78.1455018699219;
	Tue, 09 Feb 2016 03:51:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 03:51:19 -0800 (PST)
In-Reply-To: <1455017471-6682-1-git-send-email-marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 11:51:19 +0000
Message-ID: <CAJTo0LYBm6L==cxBAJv4Dz6EKBa26YeHuzT58X2KCxMd+PwPqQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] strace: Fix build for arc, metag, nios2, or1k, tile
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
X-List-Received-Date: Tue, 09 Feb 2016 11:51:40 -0000
Content-Type: multipart/alternative; boundary=089e0149be34b58098052b54f034

--089e0149be34b58098052b54f034
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:

> +From dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin" <ldv@altlinux.org>
> +Date: Thu, 24 Dec 2015 15:40:55 +0000
> +Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build
> +
> +Fix build regression introduced by commit
> +34683e3926d8c2daa368afb805da422ee7043396.
> +
> +* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.
> +* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.
> +* linux/nios2/syscallent.h: Likewise.
> +* linux/or1k/syscallent.h: Likewise.
> +* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and
> sys_mmap_4koff.
> +* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.
> +* NEWS: Mention this build fix.
> +
> +Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> +Upstream-Status: Backport
>

This needs your signed-off-by tag too.

Ross

--089e0149be34b58098052b54f034
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 11:31, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":ep" class=3D"a3s" style=3D"ov=
erflow:hidden">+From dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b Mon Sep 17 00=
:00:00 2001<br>
+From: &quot;Dmitry V. Levin&quot; &lt;<a href=3D"mailto:ldv@altlinux.org">=
ldv@altlinux.org</a>&gt;<br>
+Date: Thu, 24 Dec 2015 15:40:55 +0000<br>
+Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build<br>
+<br>
+Fix build regression introduced by commit<br>
+34683e3926d8c2daa368afb805da422ee7043396.<br>
+<br>
+* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.<br>
+* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.<br>
+* linux/nios2/syscallent.h: Likewise.<br>
+* linux/or1k/syscallent.h: Likewise.<br>
+* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and sys_mmap_4kof=
f.<br>
+* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.<br>
+* NEWS: Mention this build fix.<br>
+<br>
+Reported-by: Alexey Brodkin &lt;<a href=3D"mailto:Alexey.Brodkin@synopsys.=
com">Alexey.Brodkin@synopsys.com</a>&gt;<br>
+Upstream-Status: Backport</div></blockquote></div><br>This needs your sign=
ed-off-by tag too.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--089e0149be34b58098052b54f034--

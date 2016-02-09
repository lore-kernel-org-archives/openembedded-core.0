Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id EDAE960667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:57:34 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hb3so75956924igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 03:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k8oGhOcoDwbNKC/JoPaJOToKKhmhzmMhcBSxb5dDY7I=;
	b=UDuxjknF7WD9Zk7YXI3wKNeMkPyZ0Zp7EOxf356jppzvstzN8pRFT4UsiTTW11cJ0N
	CUmVqdGoTZYlR4nr5CE14mV5jTojvB9pPByQaOzf4VVNbZ45J1eSoQYFYrvjpXUt692O
	5wkazkmEgiPjPEFqwLmX60Yl+O3PgzZiGz/uEQXSC23ldPB0GMlLswKE/JUVNB/Zus4i
	gK+VtwVU8gBQhbexTf7Y+iP0Hshi2VpWuaOXI85mx76+FVgThmw4DAF0iQ3u5JI6BLwN
	5C/Y0Pyl+ly7rCkqXMGJJooVApXtTRQ3Dx++9cFI3BGC+DQ6gwjvlRSkjbJ+b3vdRhEa
	TqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k8oGhOcoDwbNKC/JoPaJOToKKhmhzmMhcBSxb5dDY7I=;
	b=ZjI3rOHcskXk1kVK8rw5WmQvxb+faSp5/GNf8/f8MoMrtHj3G61M4FrQ10jNCAnn4O
	tGUQkqbZUDgVCbETs0rpYR10/+srGZlKezY6Qv4RTdEbxw0+R6G+TfYmyk+0cuigwJyt
	yOcQrxLQL0Yupv96SWiv2yLFvVhxUTI7UR1a7O0dqhK6KvF5bUPvq7TuwKmeUkYQv50B
	pR+S4rlvsH3Dk4GDYOXSzkZPzwWlnVANJv3AYDJirgS/xb43toIH4VA8oCi/yY72UhuE
	D2sszzcTIA1ACe06n1QC3lsyoa1pErYo1T+4zQAYv1AOrPeSu/RLrLDfVIAeu8x9rC1S
	R81g==
X-Gm-Message-State: AG10YOTmkaof8TkGTLM/VTaFUsXU7VAqm/cl4IDNv9GMD1wEUtfL8K1fCJSVY6bD/NtKLyxQrTx4zaiaiNbZUvL1
X-Received: by 10.50.160.7 with SMTP id xg7mr3746484igb.64.1455019055775; Tue,
	09 Feb 2016 03:57:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 03:57:16 -0800 (PST)
In-Reply-To: <1455017471-6682-2-git-send-email-marex@denx.de>
References: <1455017471-6682-1-git-send-email-marex@denx.de>
	<1455017471-6682-2-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 11:57:16 +0000
Message-ID: <CAJTo0LaVKp15F13EpAvBa47qmJoWcZ+P6kip45jgy-6xSWxsFA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] binutils: Repair nios2 PLT and GP handling
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
X-List-Received-Date: Tue, 09 Feb 2016 11:57:39 -0000
Content-Type: multipart/alternative; boundary=001a11339de8f61d14052b550512

--001a11339de8f61d14052b550512
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 11:31, Marek Vasut <marex@denx.de> wrote:

> +From 33d4099fc891760ea1f080746dee4dcfc36c757c Mon Sep 17 00:00:00 2001
> +From: Sandra Loosemore <sandra@codesourcery.com>
> +Date: Wed, 9 Dec 2015 16:13:58 -0800
> +Subject: [PATCH] Fix GOT address computations in initial PLT entries for
> + nios2.
> +
> +2015-12-09  Sandra Loosemore  <sandra@codesourcery.com>
> +
> +       bfd/
> +       * elf32-nios2.c (nios2_elf32_finish_dynamic_sections): Correct
> +       %hiadj/%lo computations for _GLOBAL_OFFSET_TABLE_ in initial
> +       PLT entries.  Assert alignment requirements.
> +
> +Upstream-Status: Backport
>

These patches need your Signed-off-by.

Ross

--001a11339de8f61d14052b550512
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 11:31, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":cp" class=3D"a3s" style=3D"ov=
erflow:hidden">+From 33d4099fc891760ea1f080746dee4dcfc36c757c Mon Sep 17 00=
:00:00 2001<br>
+From: Sandra Loosemore &lt;<a href=3D"mailto:sandra@codesourcery.com">sand=
ra@codesourcery.com</a>&gt;<br>
+Date: Wed, 9 Dec 2015 16:13:58 -0800<br>
+Subject: [PATCH] Fix GOT address computations in initial PLT entries for<b=
r>
+ nios2.<br>
+<br>
+2015-12-09=C2=A0 Sandra Loosemore=C2=A0 &lt;<a href=3D"mailto:sandra@codes=
ourcery.com">sandra@codesourcery.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bfd/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf32-nios2.c (nios2_elf32_finish_dynamic_sec=
tions): Correct<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0%hiadj/%lo computations for _GLOBAL_OFFSET_TABL=
E_ in initial<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PLT entries.=C2=A0 Assert alignment requirement=
s.<br>
+<br>
+Upstream-Status: Backport</div></blockquote></div><br>These patches need y=
our Signed-off-by.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a11339de8f61d14052b550512--

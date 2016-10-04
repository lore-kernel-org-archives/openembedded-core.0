Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A283A719DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 14:27:36 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id h186so9569031oia.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=iPePG09fYUUdv+QbAcKD8+bUg4v3vMeRcolRYTSiCJ0=;
	b=u7b9EVTXgZulkrTsqa5VNTJhGQfDu99JXWcq1NORt4/7u7dF//WvX0PaWaWIqWOwLg
	lnYkI5WMp6EV+57421GdhUtkHQTa2t2wIdUc5AMn1JhiAOndBZu8OkVOSXcIbivnep/V
	fTSQGZzFduvOUomECsQ28YRt8S6Z2nbbiMqvvmhFhEzd5zuq+QkgBggEMV7j2KGRUD60
	8Gihn/Sbl4X1GiOkoPNqUrt/zmEQvFKP68vWSocovnnvW/pMdOLFHDTNB2qCFnAhkRiF
	3W1MTNo+FuJ2kXFYc98LSK57YaxCNMGaQ5FXc3FuHnCD5C8bLVIewMPTqPb9B2N88/Lz
	C/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=iPePG09fYUUdv+QbAcKD8+bUg4v3vMeRcolRYTSiCJ0=;
	b=aoEIrKfax/v1QM7ldtsM2xe1ZIZmKBrw6Fxx5c3Sl/qHoCz4xIKXS5OxkhaHx4SdET
	JR3lJ22KS2/wBr5Xfqh8BEqcyvweL6U+CeGdTcsq5suqyzOwQEjsoObm0K/h3bmQv7Ic
	VSNF/hKyCQ37lrqoWmJGLGgh0SFkUr+13AQbfoPK7xS2Mk2cKCC3nVOtwX2T40TkwXLw
	cH2RGCqfwIu84AtQaqic9XjGke+7kxg89ajDMf/d5xJZdc+MnawSRNT4Dw0JGx5Di8gn
	Z+scyLmA4ZHATHUAtg3KF1JlmCf2e9peZihqBF73iCbrsr4WgVt6FGb05qMVgu00cFXX
	5dTA==
X-Gm-Message-State: AA6/9Rkjw58BI7v0I/E9VEGh453tfSwCk+lT/o17aPnq4CW5c/LpK8o9MJ+wjquo1PGoMzjCWsa9uFH3hMPLJA==
X-Received: by 10.157.1.205 with SMTP id e71mr2338099ote.237.1475591258470;
	Tue, 04 Oct 2016 07:27:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Tue, 4 Oct 2016 07:27:18 -0700 (PDT)
In-Reply-To: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
References: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 4 Oct 2016 07:27:18 -0700
X-Google-Sender-Auth: DfJ96BY6uhRweHiHMzJSkhPsmEA
Message-ID: <CABcZANnNaQrd9x4=vZuBjkogUDGU81Ft08bJ+AJAVpH+Qh-RjQ@mail.gmail.com>
To: Sujith H <sujith.h@gmail.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure
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
X-List-Received-Date: Tue, 04 Oct 2016 14:27:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c03d0d0cb7ce0053e0adc88

--94eb2c03d0d0cb7ce0053e0adc88
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2016 at 2:41 AM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>
> When built on minnowmax ( machine name: intel-corei7-64),
> an error is noticed during the do_compile:
>
>  /home/sujith/codebench-linux-install-2015.12-133-i686-pc-li
> nux-gnu/codebench/bin/i686-pc-linux-gnu-ld:
> Relocatable linking with relocations from format elf64-x86-64
> (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_
> corei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o)
> to format elf32-i386 (/home/sujith/MEL/dogwood/buil
> d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-
> r9/perf-1.0/fd/libapi-in.o)
> is not supported
>
> This change help fix the issue.
>
> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> ---
>

What=E2=80=99s with the redundant submission? You submitted the fix from
meta-mentor for this last week, and it was merged.
http://git.openembedded.org/openembedded-core/commit/?id=3D0ce06611068e74e6=
ea2e226e3f967aaa91fecd25
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c03d0d0cb7ce0053e0adc88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 4, 2016 at 2:41 AM, Sujith H <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D"gmail-m_-227703748311286951:2vu" c=
lass=3D"gmail-m_-227703748311286951a3s gmail-m_-227703748311286951aXjCH gma=
il-m_-227703748311286951m1578f11f932cc27a">From: Sujith Haridasan &lt;<a hr=
ef=3D"mailto:Sujith_Haridasan@mentor.com" target=3D"_blank">Sujith_Haridasa=
n@mentor.com</a>&gt;<br>
<br>
When built on minnowmax ( machine name: intel-corei7-64),<br>
an error is noticed during the do_compile:<br>
<br>
=C2=A0/home/sujith/codebench-linux-<wbr>install-2015.12-133-i686-pc-li<wbr>=
nux-gnu/codebench/bin/i686-pc-<wbr>linux-gnu-ld:<br>
Relocatable linking with relocations from format elf64-x86-64<br>
(/home/sujith/MEL/dogwood/buil<wbr>d-minnowmax/tmp/work/intel_<wbr>corei7_6=
4-mel-linux/perf/1.0-<wbr>r9/perf-1.0/fd/array.o)<br>
to format elf32-i386 (/home/sujith/MEL/dogwood/buil<wbr>d-minnowmax/tmp/wor=
k/intel_<wbr>corei7_64-mel-linux/perf/1.0-<wbr>r9/perf-1.0/fd/libapi-in.o)<=
br>
is not supported<br>
<br>
This change help fix the issue.<br>
<br>
Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@ment=
or.com" target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
---</div></blockquote></div><br>What=E2=80=99s with the redundant submissio=
n? You submitted the fix from meta-mentor for this last week, and it was me=
rged.=C2=A0<a href=3D"http://git.openembedded.org/openembedded-core/commit/=
?id=3D0ce06611068e74e6ea2e226e3f967aaa91fecd25">http://git.openembedded.org=
/openembedded-core/commit/?id=3D0ce06611068e74e6ea2e226e3f967aaa91fecd25</a=
><br>-- <br><div class=3D"gmail-m_-227703748311286951gmail_signature">Chris=
topher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbed=
ded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor G=
raphics</div>
</div></div>

--94eb2c03d0d0cb7ce0053e0adc88--

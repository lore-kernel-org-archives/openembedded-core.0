Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B940BCA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 22:22:19 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.60614.1754950934642780263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HYkdRbX8;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31ecd40352fso4297359a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754950934; x=1755555734; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jFsHogUX9rCzp9tVDaoj4H5Al1FXu+zP3tquC04/6VA=;
        b=HYkdRbX8PWwttSHXg0kDuaACYfJLhJMwxhJssmmMTwyCZ6WldjwMhGTYUvww/nVrC2
         +0Bcklw9gyiInbQO76oWmGtHShJfkYjyiZknRJ8Z6JCzNv6DZdtDUr8CxaH8JqYVyjbQ
         3hb3QCbvJpMyGDT/LUKuvykbkWgeOpT4dSLfClOyftuiPQZ0FEWLSI2wPomF6BUGCzTD
         0QuY9yWUWFu//e3PWNh5EdYdC7N6juzDH+TocELS4e9sKdfiF1zS8fTShsvjStNd6y4/
         FZmBj2pP3DHVeMUVdM4Swk3e3o8juIT0vR4yshpcyJvB0Tx9UJJHagns9UNLqJRkVWC0
         ghOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754950934; x=1755555734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFsHogUX9rCzp9tVDaoj4H5Al1FXu+zP3tquC04/6VA=;
        b=piw5Fge+wK2I2hW8ajhbmlfr0PMUSeNX25/hPH/I8/Vp79K8BZyNpXeeRBzfNyY4vo
         MEpTX2FKWDU2oojYMwMLxeOF1Kbm/TKppFCPoBDElnH2wes3LH3HOZvL1s1rxB13dRwc
         hkuUcMNG+N4UA6AaFanAotSHXY9ceRnk3R2HeDezTun7nPYapoBtlgBGmlKHC5OJ/DsV
         eCblOGYXAAWxJeX0xxbbLPLSS7Z/B21T+INE7G3uT1lCZvid/guV8Kz0Y8lKQwBCtjuj
         pE00YnJct+P3lY4dPsKOor48N9ASNHVTr4suhHJqUls6wYO/5AVaGZLLK2Tb4G+ARlqw
         aW4w==
X-Gm-Message-State: AOJu0YyPIOlfyi98uPwp9woCLDduW5+KFFydjh5k+3CmXTtMfDIcJec+
	4tLk/ZEikHMYgHvTPF70QXm6dm0dN1Q92bR5QVEtRcW3dNhKDAJ3LtjT7smYHIqPp4uwt6+9Rcd
	Sq3DtLCJ5pNgLtx9pkyfegPD3+B5ReD0=
X-Gm-Gg: ASbGncu2SfLwpym+pemP/o5rcOUy1YfL3EmNPvTFYI4Fw5rZwTBAJrsch2luyEmSO9b
	J2r0g5g1hCDD2/421iSOy3GhxrgVzMYPp8t2UoizbF4EwEfmx4fQuHNot32UYgx6dDQsCyIQzxT
	O61svrI0tHFg1G8DuMWNyntNjFcsesE6q6yh5QxOwrgdAOe86VLxh/ZZjrtdM/fR6+jSzrp8nZ4
	UhlYLJlxFjRatvS3e8AohjzZ1P3Rsp7Alsto9c=
X-Google-Smtp-Source: AGHT+IERkUrua9irzjft8NwDl8Knw8aTqG/uJv+JvC6XrdPE+d4BPeXFzJJpOrXhgDT9CuqJEV0PJLRgsDpuJDSBd/s=
X-Received: by 2002:a17:90b:4fc5:b0:311:9c9a:58d7 with SMTP id
 98e67ed59e1d1-321c0a83035mr1632417a91.19.1754950933695; Mon, 11 Aug 2025
 15:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8_EA6U=o8fR98TA6upx9AzmSh+bf11bKfAuXJhY2G9xQ@mail.gmail.com>
 <14837.1754686511622096879@lists.openembedded.org> <CANNYZj88MnY2QDEuK6cZtQt1xyBMeCB6LPp2xqLQzd0OgwB4Cg@mail.gmail.com>
In-Reply-To: <CANNYZj88MnY2QDEuK6cZtQt1xyBMeCB6LPp2xqLQzd0OgwB4Cg@mail.gmail.com>
From: Osama Ahmed <osama.abdelkader@gmail.com>
Date: Tue, 12 Aug 2025 00:22:02 +0200
X-Gm-Features: Ac12FXzFfIxKsXmQO3CLdXyn7Zv-qBq9cdNHyAx493cOVEOZptMleN-C2f5oSYo
Message-ID: <CAEWn9yvzWa+bruBTrM62QuMDosecDrYviY6mbTsE3uR294Y+hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go-cross-canadian: fix binaries install and GOARCH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000052a2063c1e5b9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 22:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221750

--0000000000000052a2063c1e5b9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you set MACHINE to qemuriscv64 it will be go-cross-canadian-riscv64, the
bugs were reported for arm/arm64 not riscv64

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15204
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15775

Also, the majority of Yocto SDK users run on *x86_64* workstations, so
SDKMACHINE=3Dx86_64 is the primary supported path
and go-cross-canadian-aarch64 is supposed to work for any supported
SDKMACHINE, as long as the host architecture is valid.

Currently, if SDKMACHINE=3Dx86_64 (the default for x86 PCs) building
go-cross-canadian-aarch64 fails,
with this patch build pass for both SDKMACHINE=3Dx86_64 or aarch64.

Osama

On Mon, Aug 11, 2025 at 10:47=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> You need to show what you did, and what didn't work. I am unable to
> commit time to come up with exact steps that I verified myself. But I
> can correct your steps if you show them.
>
> Alex
>
> On Fri, 8 Aug 2025 at 22:55, Osama Abdelkader via
> lists.openembedded.org
> <osama.abdelkader=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > setting SDKMACHINE and MACHINE didn't work for me.
> > If it did work for you, can you type the exact command(s) to try?
> >
> > Osama
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#221668):
> https://lists.openembedded.org/g/openembedded-core/message/221668
> > Mute This Topic: https://lists.openembedded.org/mt/114603001/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000000052a2063c1e5b9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div>If you set MACHINE to qemuriscv64 it will be go-cr=
oss-canadian-riscv64, the bugs were reported for arm/arm64 not riscv64</div=
><div><br></div><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D15204" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15204</a></div><div><a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D15775" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D15775</a></div><div><br></div><div>Also, the majority =
of Yocto SDK users run on <strong>x86_64</strong> workstations, so SDKMACHI=
NE=3Dx86_64=C2=A0is the primary supported path</div><div><code>and go-cross=
-canadian-aarch64</code> is supposed to work for any=C2=A0supported SDKMACH=
INE, as long as the host architecture is valid.</div><div><br></div><div>Cu=
rrently, if SDKMACHINE=3Dx86_64 (the default for x86 PCs) building go-cross=
-canadian-aarch64 fails,</div><div>with this patch build pass for both SDKM=
ACHINE=3Dx86_64 or aarch64.</div><div><br></div><div>Osama</div></div></div=
></div></div></div></div></div></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 11, 2025 at 10:47=E2=
=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">You need to show what you did, and wh=
at didn&#39;t work. I am unable to<br>
commit time to come up with exact steps that I verified myself. But I<br>
can correct your steps if you show them.<br>
<br>
Alex<br>
<br>
On Fri, 8 Aug 2025 at 22:55, Osama Abdelkader via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;osama.abdelkader=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; setting SDKMACHINE and MACHINE didn&#39;t work for me.<br>
&gt; If it did work for you, can you type the exact command(s) to try?<br>
&gt;<br>
&gt; Osama<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#221668): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/221668" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/221668</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11460300=
1/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/114603001/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000000052a2063c1e5b9e--


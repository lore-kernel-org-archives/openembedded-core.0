Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.7832.1620830097524034263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pdZWLkLP;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id h4so6095032uap.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KqCgqEFQUP4v1fITK9bkLNiYs4SrQMhu6kDs3E2sijg=;
        b=pdZWLkLPAQ0NDmqeSjiOkp6ZddLq/EwYkj/l9XvsMl/5DhbwhBDmlLanAQys1x/D0A
         gbb6uG4BfUC81xY5muYJCFiO1+kU38Zg+OHU4RIRShc3EzbVRgWIzlo/TZ3Bny7QTdGo
         DH2qEj/CNXtvh3z52bRxRjeKLAgje2p/bE/jrzeIld6nF1TUIUj/AkiSBbL1giNRqhz8
         qzC2BZCA+jaLUzFEM+rxPjTyvJJXlt9QBiPJah7GIQO4jRATz9WE/kKBmTO0BvYxjH0J
         nl0vwlWQnA4szKgZ6p/QI1z/Mkhddpuip0IFRIgbGoZOQYP/F/MCmca4a9q+/qa/kLSg
         Fm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqCgqEFQUP4v1fITK9bkLNiYs4SrQMhu6kDs3E2sijg=;
        b=BYhHKP9h2Y69IymZV/NezrQmBR8MCvu7DKYimnG6I/0iD4L6FgrdfsvdbBwFsLNuOA
         /wn7AcgJyTDPQREs5ypsiyEw4yzwToVa85btqV3oomBLrD/i9jWhhYyNQyB572HEfY/w
         8Ysrl5CYahY4iO/qPfii8Co4mTxO/jhvyE29+huyFRjElDO6E17X5ZCnd7s9c6BzUerz
         644IDearpOj69TFFC+IWdaU8adLDeZiL2PHKd9Xg0/a4Hu8hwwvon23rS9PAMxuMBt2z
         Y9Eu+LhpXSi38kLsfLhOSJ4YDvgTdLzf8cOkD8JYD4Bhvx8f40ked9qsjb0P3B3OAIVf
         dCGQ==
X-Gm-Message-State: AOAM530GR5/n17Ubj0dbeYJ/lKjlq1BahL7FkJp4H9e2xDWfhSV48gM+
	gbD39US77NUxyMDTQNRc0IJOfZ6kjr2MfrqSgnY=
X-Google-Smtp-Source: ABdhPJwVBPInmXgzmNSjsI3kg2FDxm6Ut9XSfy/g5qYrPH3ab6YpkCGO2ZRLIItEpEqE/SPM9gYipWhTP4EGryChgK4=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr2412896uan.93.1620830096756;
 Wed, 12 May 2021 07:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210512124221.61985-1-Martin.Jansa@gmail.com>
 <CANNYZj-wzHbziSLMPVh40qpnHntcRyqxpTa+g+p9JtqSeZv42g@mail.gmail.com> <20210512133630.aqqp7ocfbz4wgh2e@jama>
In-Reply-To: <20210512133630.aqqp7ocfbz4wgh2e@jama>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 12 May 2021 16:34:45 +0200
Message-ID: <CANNYZj-kAt77FZVPQBAkUA=TNp0KjzgUjHKufwRDzOwxzzpU+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: backport DWARF-5 support
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000028944b05c222ea44"

--00000000000028944b05c222ea44
Content-Type: text/plain; charset="UTF-8"

Your patch is titled "binutils: backport dwarf-5 support" and the message
talks about dwarf-5 in general across the gnu toolchain. But this is not
what it's about: it's only about adding dwarf-5 to gold.

Alex

On Wed, 12 May 2021 at 15:36, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, May 12, 2021 at 03:21:53PM +0200, Alexander Kanavin wrote:
> > The patch backports dwarf-5 support to gold linker (presumably from an
> > upcoming version of binutils?), which does not quite match the title or
> > description?
>
> gold linker is part of binutils, so what doesn't match with title or
> description?
>
> And yes it's backport from newer binutils as the Upstream-Status shows:
>
> Upstream-Status: Backport [5cde809b7b9 Add DWARF 5 support in gold.]
>
> And you can easily find it here:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5cde809b7b9
>

--00000000000028944b05c222ea44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Your patch is titled &quot;binutils: backport dwarf-5=
 support&quot; and the message talks about dwarf-5 in general across the gn=
u toolchain. But this is not what it&#39;s about: it&#39;s only about addin=
g dwarf-5 to gold.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 May 20=
21 at 15:36, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mar=
tin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Wed, May 12, 2021 at 03:21:53PM +0200, Alexander Kana=
vin wrote:<br>
&gt; The patch backports dwarf-5 support to gold linker (presumably from an=
<br>
&gt; upcoming version of binutils?), which does not quite match the title o=
r<br>
&gt; description?<br>
<br>
gold linker is part of binutils, so what doesn&#39;t match with title or<br=
>
description?<br>
<br>
And yes it&#39;s backport from newer binutils as the Upstream-Status shows:=
<br>
<br>
Upstream-Status: Backport [5cde809b7b9 Add DWARF 5 support in gold.]<br>
<br>
And you can easily find it here:<br>
<a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
5cde809b7b9" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/gi=
t/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D5cde809b7b9</a><br>
</blockquote></div>

--00000000000028944b05c222ea44--

Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D12C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 14:25:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.99415.1723645534354828588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 07:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kg//QNw0;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ff67158052so44020685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723645534; x=1724250334; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bxeTdBtOC6N4f6Ri82VEl+3gwa4ngiZC02DDkcoZhtI=;
        b=Kg//QNw07M8DU876dLB7sYNNYGCjW7LS6q5iWmGXsoxjZe2thEoT5b5YwYFPKCjvge
         W4i5fpa6D/rqd7XkyJ9ieb5p11cFvfDgXf9zN/rHVKINqQFtLP8iIDCz8IaxRUsOwqdl
         QhT7sj9bNoj1blaWJtv0YDeRvYEEbVi/g7XaHMJBa4UO7T2NWiyw0oPNr1A0iA4hNYQW
         7Up5dY+hbYNRAYniDObsijpPpgewrYAnhDSq9k8rBgI1MOpt01Sd4mZ+05Fy4y8Tt7af
         N1M7TUy68+oOK9CHz9j6BcncB/H+wTb8tmFXRnOathCP07UBqgsTCT3UQvJgOocoAATV
         mi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723645534; x=1724250334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxeTdBtOC6N4f6Ri82VEl+3gwa4ngiZC02DDkcoZhtI=;
        b=WPcfwkKNW/g/mhSNVsO7S+4Ckv6ae699hgYa+bbxz6nIbbbJAiflVv3NyKfbjpQyvL
         PmNt1P0xN+dE/iiYBMVzF8SE+hNiuVt0m9+Vy0+T1DiPC/vxumnPbo7khAxiEmtT6hz3
         hlUUgxNjwbfckgrj+U5v/WUteNsp7WDj37G6dWHjkKL97YmSAKthI/GG4/X6efPGDK/o
         PDMnOVS+uJSs5EXP61K+HoCMKO0YIjRnqtzy3WQA0klbvsKjC3EZj6AGteZAgMXXT7gk
         hC6HFtqW2qWS1xqwquFOYouiZeY//aOcQfl+jZCR2v6IlCDQFLBTsZiOst5xB9cifpn+
         //3A==
X-Gm-Message-State: AOJu0YyNILL87w0WzY5iR3N0g1uPvpb+pUvYJ+lZubb6h2oI3dMobElG
	g9FvsrWSeqylqEY5BKaoDfH1n8GoKF+BzPc/pFPQX/ctwDAXddoc3vbZ96KpgljqbePzygTx/OZ
	40PoBAWyD4MT5UlxipZHDDgigdNw=
X-Google-Smtp-Source: AGHT+IHN8D1lkT+Lo9RXY82gKbDYqQXSxKR03NaK18UR1vEIHYRA88X+63njvHWGp6WmpsvUH0v1q9qhYBfp0O1slmU=
X-Received: by 2002:a17:902:dac5:b0:1fc:568d:5f05 with SMTP id
 d9443c01a7336-201d63c5063mr38064545ad.8.1723645533431; Wed, 14 Aug 2024
 07:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723636705.git.steve@sakoman.com> <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
In-Reply-To: <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 14 Aug 2024 16:25:21 +0200
Message-ID: <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bd30ef061fa57fca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203322

--000000000000bd30ef061fa57fca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 2:02=E2=80=AFPM Steve Sakoman via lists.openembedde=
d.org
<steve=3Dsakoman.com@lists.openembedded.org> wrote:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Rtaher than trying to use a sqlite database over NFS from DL_DIR, work fr=
om
> a local copy in STAGING DIR after fetching.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 03596904392d257572a905a182b92c780d636744)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>


This patch is changing the ABI (well... variables). I think we should come
back to the old naming
for the downloaded copy before backporting.

Regards,
Marta

--000000000000bd30ef061fa57fca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 14, 2024 at 2:02=E2=80=AF=
PM Steve Sakoman via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.openembedded=
.org">sakoman.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Richard Purdie &lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdi=
e@linuxfoundation.org</a>&gt;<br>
<br>
Rtaher than trying to use a sqlite database over NFS from DL_DIR, work from=
<br>
a local copy in STAGING DIR after fetching.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 03596904392d257572a905a182b92c780d636744)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br></blockquote><div><br></div><div>=
<br></div><div>This patch is changing the ABI (well... variables). I think =
we should come back to the old naming</div><div>for the downloaded copy bef=
ore backporting.</div><div><br></div><div>Regards,</div><div>Marta <br></di=
v></div></div>

--000000000000bd30ef061fa57fca--


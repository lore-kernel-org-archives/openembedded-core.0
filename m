Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7016E650
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 02:15:23 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id v105so34206064wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Aug 2017 19:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O429oVGTTpf3PlPo+eS2RN8asLLsifJ06WyVDyoCAyw=;
	b=by0RBBcqSToiBlQ4oP1/0RXqXQuH9BZdcU4rdLRcmEBIbSovoPF319Xt8mB87dUdXs
	mpEYUsG7F9QmXnyI0Aa8qwAUNMeSVDeaikSkKuFyi3FLi+1nxZkPNRGe4qlt+TzOXQMB
	31iFKzgYMnLnITFj2obJnqcCSRuIv95Dn3gyw9aFDp61gmG3Iwrhykl9blWTdtTr7+JZ
	dbQOz66TdLqSMaExZTwUM0DapgmHXOuA21Z8FG+KIU3w+anki9P8HRMLOX1fa3TOp5Tx
	xESM2W05ISez6T25u2CCHH0L0UD4l+8WueHeZGMaLpQASglVjKAVkql48U4/xfhx0RtE
	znQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O429oVGTTpf3PlPo+eS2RN8asLLsifJ06WyVDyoCAyw=;
	b=fX5mu/yM9zSFTYpNO99un5yjIgBwpVeaZYAPCzTEyK0Ej8aEhQK9MeaC8zhXJcZ5F6
	KA9Z42svD7NFqoQSwfvBb7qW4XMi+T5OmukFYPrXW3je2+9h03PSaUEb2uoIYgNaKp8T
	mSggIROEf6XJKRhNe3NOu/y0XFofQ8yNlG98ObYGDrtXRlk3alvW3V9ThxqoCcWIJNbG
	u+QRPF/gPleuu9uP6KhGb9cPhi94rUv/h4KcQlSCvIzA9LlVg61AsKe6vM55heEVI9Ze
	wWci+1S5bfGNYq3wue5bVnz8ITKLifhN0vw0T6uqgXJxI8NOCQv39ErfKIE6aB67vbr7
	2lBg==
X-Gm-Message-State: AIVw113U0gOgPgghD0g9ChAo/6yxAPWZ7vluMgiUUmJRb8vB1K/0vDFZ
	HdrXCwphFLZqkb7PnficFICh4bwUxw==
X-Received: by 10.223.166.36 with SMTP id k33mr6361903wrc.282.1502072124841;
	Sun, 06 Aug 2017 19:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.15.130 with HTTP; Sun, 6 Aug 2017 19:15:24 -0700 (PDT)
Received: by 10.28.15.130 with HTTP; Sun, 6 Aug 2017 19:15:24 -0700 (PDT)
In-Reply-To: <CABcZANnmwq6BKEYwxHf4NgnHBXUPLZOKGOegOEf5qRLdjYEFsw@mail.gmail.com>
References: <20170805220752.2047-1-JPEWhacker@gmail.com>
	<CABcZANnmwq6BKEYwxHf4NgnHBXUPLZOKGOegOEf5qRLdjYEFsw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 6 Aug 2017 21:15:24 -0500
Message-ID: <CAJdd5GYNXM+QYNd-EBNbRY1HorhC5LR-o3huc4QaFf7ynCv=+g@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Mon, 07 Aug 2017 02:15:24 -0000
Content-Type: multipart/alternative; boundary="f403045cf74a6da4c30556206b7c"

--f403045cf74a6da4c30556206b7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Aug 5, 2017 18:37, "Christopher Larson" <kergoth@gmail.com> wrote:

On Sat, Aug 5, 2017 at 3:07 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> If EXTERNALSRC points to a git submodule, the .git entry will not be a
> directory, but rather a file that points to the actual .git location (in
> the parent repository). If this still can't be resolved to a directory,
> ignore it and fall back to the non-git method for hashing.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>

We shouldn=E2=80=99t be assuming knowledge of how .git works, IMO we should=
 call
out to git rev-parse to query the info we need.


Ya that makes sense. I'll fix it.

--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--f403045cf74a6da4c30556206b7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Aug 5, 2017 18:37, &quot;Christopher Larson&quot; &lt;<a href=
=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br type=3D"a=
ttribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"quoted-=
text">On Sat, Aug 5, 2017 at 3:07 PM, Joshua Watt <span dir=3D"ltr">&lt;<a =
href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com=
</a>&gt;</span> wrote:<br></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><div class=3D"quoted-text"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">If EXT=
ERNALSRC points to a git submodule, the .git entry will not be a<br>
directory, but rather a file that points to the actual .git location (in<br=
>
the parent repository). If this still can&#39;t be resolved to a directory,=
<br>
ignore it and fall back to the non-git method for hashing.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br></blockquote><div><br></div><=
/div><div>We shouldn=E2=80=99t be assuming knowledge of how .git works, IMO=
 we should call out to git rev-parse to query the info we need.</div></div>=
</div></div></blockquote></div></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Ya that makes sense. I&#39;ll fix it.</div><div dir=3D"auto">=
<div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><font color=3D"#888888">-- =
<br><div class=3D"m_2106994194228303955gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<b=
r>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</font></div></div>
</blockquote></div><br></div></div></div>

--f403045cf74a6da4c30556206b7c--

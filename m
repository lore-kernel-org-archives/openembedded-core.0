Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA10613B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:22:14 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id p6so9800430vsj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 00:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KeyNsavy+N4/RtKIiblW1PgK3BdlEmz1mQcqYlxhM1o=;
	b=vCUNSeeQ1739YI8VujlKAaIT6QG/YVeD83WoYc+Wtan39BHVFyz7lAO0AmITRaL4es
	uWdt7RRL7fgpEg49oQ4agWys6SVIq63G7IrnE1Fkk9skEd2V34rStLHLFKGT+HYPUVFO
	4eMg91WzPUr8A7nljvCVu/AuKG9DLDEWgc7u3juBBWW7ku/x9vt5QT5meLIQUKg5tS38
	Fr80Js5naA2l+f89pPC1RUyyjQhEOB/sZok1lqAZQOiOWermTpxbOlqMsRcBdKsM/R/X
	KiEYEvU/SgSeGDAUuyb0ckHCMUjV06AVrUVb/sJ3tdLqhqKMYCbwVouWZc4OwhKjpEus
	csXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KeyNsavy+N4/RtKIiblW1PgK3BdlEmz1mQcqYlxhM1o=;
	b=AUWHv3PIWD+cJVm/w9WtyhITQNbTX8+Bqr/O3Xh9Zz0RD+L1G9GXq11KfDj/s8ZOL6
	izoXhnyRYjqZZqh0qx3Lwzo98R3D3ocDRc1DENpqpyzZZpdIu4WEpxxvgoYunhUiZVmr
	3Xnu2u09EbBgwDk96MsL55leEcZsHcqmNXmOwYouSRhjxn3eMJNfzpr/HhbJTlFRzMvf
	z4jWmkzlhrEyKMYoDjS0TpRSurTrAT4rNlewyL6FrRrKkgjQpZscteblt1EAXzJcQamW
	BIPOoN56TMN8qQfkXwD1W1ZJ40FROx8c3bLl4oR0sfaKb5bcF1OCAF+LYqSVTVsh7ty4
	sbxA==
X-Gm-Message-State: APjAAAVixp4EVoD39HpkZwgAF7K4nQD0F57y6eU3/ncjkaUO9Yk2+7VF
	DjBflMj2KxGCFSutL9J7kRbFEm8znq7JJx2k93g=
X-Google-Smtp-Source: APXvYqwL50svEuCbYt1mYyhawLInlRR5Of/44zOEQgcQghECsd7TRjGTxqS3g1C132qxzxBPsAZL7Oxq6JLiI+FtJek=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr7612453vsq.94.1581927735431; 
	Mon, 17 Feb 2020 00:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
In-Reply-To: <CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 09:22:04 +0100
Message-ID: <CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Mon, 17 Feb 2020 08:22:14 -0000
Content-Type: multipart/alternative; boundary="000000000000bb135b059ec14092"

--000000000000bb135b059ec14092
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon 17. Feb 2020 at 3.30, Khem Raj <raj.khem@gmail.com> wrote:

>
> > Sure, but the testing should be done by people who need those other
> machines to be able to boot weston; I would want to draw the line at what
> is currently covered by the autobuilder (which is just qemux86_64).
> >
>
> perhaps then make this chage such thst it only affects the
> architecture you have tested.


Fbdev backend is not documented, and there is no guarantee by upstream that
it will work. You wouldn=E2=80=99t want to use it on actual targets either =
as it
has no hw acceleration support. I think the change should apply to all, we
should test standard drm/kms code paths everywhere and fix/report issues as
needed.

Alex

--000000000000bb135b059ec14092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon 17. Feb 2020 at 3.30, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
&gt; Sure, but the testing should be done by people who need those other ma=
chines to be able to boot weston; I would want to draw the line at what is =
currently covered by the autobuilder (which is just qemux86_64).<br>
&gt;<br>
<br>
perhaps then make this chage such thst it only affects the<br>
architecture you have tested.</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Fbdev backend is not documented, and there is no guarantee by =
upstream that it will work. You wouldn=E2=80=99t want to use it on actual t=
argets either as it has no hw acceleration support. I think the change shou=
ld apply to all, we should test standard drm/kms code paths everywhere and =
fix/report issues as needed.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Alex</div></div></div>

--000000000000bb135b059ec14092--

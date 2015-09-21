Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id D4DB4756C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:39:12 +0000 (UTC)
Received: by qgez77 with SMTP id z77so87585238qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yNoIrDh0UVsTkUO1ejBbRrVQygBrIepQmUIPt4bhAeY=;
	b=bIepb8gOuCaPCEDZGxNXXh0l3jD3SQaP7OTBxturw3rJp4G1nwG8ATIc7Uf0ZFPm4Z
	XRwhh9mXCpdqKnrIZYaGZ9ShtgDteBklQlDZGiztHApQXjz1eti67PDRNJ6JUZaBT1XI
	OkJ7CUQaOtVlCt6gOcQ9C8ecdcjPfm4ONruVb7RN35tk2mSHLauZ5pBwBlJGLnzzkTrK
	r4eRZXugtnTrH0scdS2Saj9o2QuYXhD8OwJ9gqWkm+r9MvsmMSMLkUobg5mdF9xSMLpv
	KgvJGp8TwfRj9fN6if6C5cWqPC7hUylDR9oQ7f+JRi+6soZg+MDkL1h2nLrLkaXohQgs
	ZKxw==
X-Gm-Message-State: ALoCoQniHQHsJA7a2CGwGG0NQPY1H/IZ+nLSidhYz/1Wp0FDmYdlDLD3AiODGz6A2YSqvpkhpj9z
X-Received: by 10.140.132.71 with SMTP id 68mr23487481qhe.64.1442839152161;
	Mon, 21 Sep 2015 05:39:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 21 Sep 2015 05:38:52 -0700 (PDT)
In-Reply-To: <201509211249.34740.marex@denx.de>
References: <1442702597-5619-1-git-send-email-marex@denx.de>
	<1442702597-5619-6-git-send-email-marex@denx.de>
	<CAJTo0LZhfftBwPohVS7FkxerUu5TvfeXEXJAU5i6Ry8i=DUyYQ@mail.gmail.com>
	<201509211249.34740.marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Sep 2015 13:38:52 +0100
Message-ID: <CAJTo0LbcO+Wz8=GwYKbM+6WiVaeOVqZo6iPo+gpErg1V0NH_LQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] openssl: Add nios2 configuration
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
X-List-Received-Date: Mon, 21 Sep 2015 12:39:13 -0000
Content-Type: multipart/alternative; boundary=001a113510d42214660520412ba9

--001a113510d42214660520412ba9
Content-Type: text/plain; charset=UTF-8

On 21 September 2015 at 11:49, Marek Vasut <marex@denx.de> wrote:

> This approach [1] is applicable to nios2 just fine, so I'll go with the
> same. Can the rest of the patches here be applied, so I don't have to
> repost them please ?
>

Absolutely, the rest of the series is queued in ross/mut already.

Ross

--001a113510d42214660520412ba9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2015 at 11:49, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D=
"mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":4e2" class=3D"a3s" style=3D=
"overflow:hidden">This approach [1] is applicable to nios2 just fine, so I&=
#39;ll go with the<br>
same. Can the rest of the patches here be applied, so I don&#39;t have to<b=
r>
repost them please ?<br></div></blockquote></div><br>Absolutely, the rest o=
f the series is queued in ross/mut already.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113510d42214660520412ba9--

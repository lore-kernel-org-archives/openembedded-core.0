Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id C94737ED76
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 15:54:47 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id w25so8328760vso.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2019 08:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mgmcvwRXli09a0sSGMihK7gei4EHzGNdlBUgqKlZS34=;
	b=bQY+R/NhetJ62N9AhvSQS8nFXBVh/rdTAbMlI2ghBTZNAJMed8Am1woMJN0M3pyad4
	qQb7VzP7LZWo8JQjukjfZ0NnzGKUVMiJcsNGPOM+EiSqkGDlhr2EqngFsRCTT27kkTyh
	QfuAZxK8zQHcdntCP4JlaLRu/JVVpCGUHUO3Fd4CYk+WdSgcA2MNJUBVR2kQiv18ib6t
	ZybWy3CGLxhRlby3SxLgo3znhASqERPu2fXNHRoK34de3EHt63SzGgYg2ep4bN8xkAVY
	trHhw0EFn7l3+PtydtxBNr+PUIaS4ssUe3myWXRCaSc8Nhgi173J2xBXceILQkRjRZLq
	8EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mgmcvwRXli09a0sSGMihK7gei4EHzGNdlBUgqKlZS34=;
	b=gFZ1FNyO7Ymhi4zGRbrbiABP4Q+Iqj7a1OGt4Y4X7+zfJi8hqniMdwHVZ5dRWB+Wg9
	8Yf4PhBrriy28lJ1yzCAgYrTG+L/a5Mkn3v2GWTbxkScZqrc8QyOblt2aH6Db8Pk4UpJ
	61WiSeH7iC8hcC02bi9qZO8uAmiVJ7/zQ9TWMugdRPYh9POn6NY0ioSh29a1a2Gs9U1O
	kHtgSeAs+CPIrQF+hLiALXs/+68iI0Uy1jROhR62PLnO3ZoISGMi6Dp65DJKCYv0tSTq
	kxOPPW69LNzp0U1eQOYDeMQ3S4DHv8R8dKvytls7Enq7NEjr/iGDjggQj1+7I/z1jLSU
	GLRg==
X-Gm-Message-State: APjAAAVBQA0S6RrbkCM806vBgWsjaZ1xY+Gkf86z0CWAOrX2yt3qJQ0t
	hDFSs2pvBCS54AmGf0jS3Bqrp9brGEkMd5BR1ig=
X-Google-Smtp-Source: APXvYqym7Dw3j+AB2WtmcJexIDFLGT440NAfCkNUZegNZy2CI/yYxefY2He5vbgRYJCGxFddml6Iv0FZZZkaKdfNB1M=
X-Received: by 2002:a67:ad0e:: with SMTP id t14mr8764812vsl.35.1572710088975; 
	Sat, 02 Nov 2019 08:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
	<20191101201225.GA1826@localhost>
	<CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
	<20191102153021.GA31590@localhost>
In-Reply-To: <20191102153021.GA31590@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Nov 2019 16:54:37 +0100
Message-ID: <CANNYZj9aCEVwuPqvk=Uz4Jabjwtueo6fd=ksY24PmmK8FvT8aw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Sat, 02 Nov 2019 15:54:49 -0000
Content-Type: multipart/alternative; boundary="000000000000302af305965f1a59"

--000000000000302af305965f1a59
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Nov 2019 at 16:30, Adrian Bunk <bunk@stusta.de> wrote:

> The easiest way to get long-term security support in such a situation
> is often to take the required parts from the BSP layer, and use them
> to build the product on top of Ubuntu LTS (or Debian).
>

There is an alternative: engineer the product in such a way that it can be
updated from one Yocto release to a newer Yocto release.
This is what I will be pushing for where I work (Daimler).


> The core question should really be how to increase the time of upstream
> support that is usually left when a Yocto-based distibution reaches the
> user, not just how to tell users that they are screwed.
>

I'd say information about YP support windows should be more widely known,
both because it is useful in itself, and because maybe the users will talk
with their company management and with the project, and figure out ways to
improve the situation.

Alex

--000000000000302af305965f1a59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 2 Nov 2019 at 16:30, Adrian Bunk =
&lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
The easiest way to get long-term security support in such a situation<br>
is often to take the required parts from the BSP layer, and use them<br>
to build the product on top of Ubuntu LTS (or Debian).<br></blockquote><div=
><br></div><div>There is an alternative: engineer the product in such a way=
 that it can be updated from one Yocto release to a newer Yocto release.</d=
iv><div>This is what I will be pushing for where I work (Daimler).<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The core question should really be how to increase the time of upstream <br=
>
support that is usually left when a Yocto-based distibution reaches the <br=
>
user, not just how to tell users that they are screwed.<br></blockquote><di=
v><br></div><div>I&#39;d say information about YP support windows should be=
 more widely known, both because it is useful in itself, and because maybe =
the users will talk with their company management and with the project, and=
 figure out ways to improve the situation.</div><div><br></div><div>Alex<br=
></div></div></div>

--000000000000302af305965f1a59--

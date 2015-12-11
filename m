Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id BCCE7607AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:48:27 +0000 (UTC)
Received: by igcto18 with SMTP id to18so33785677igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 00:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qC0IG1yXeFVgXh7RvMmYWyFG2SnX0DwDDo4+mmtSecY=;
	b=DlXzLBvzU+/1MGpM8DWTwBPSrraawTf3zv4+5ACLJji0NlRy9lFCkpz2rIdmMbRMFN
	+asmfC6yfUVURbfTSRiTwE1Lbni9PXNTX62AgkONpG97W1Iz/DSNwk7b+dCAe8fAf8yG
	oH0YcStqhV3nqL6xih8Q1voawSPwJZap8a6mzT+w80ffLMIJfi/A3YdF8Zbvn3LGXbMO
	YiSsr8DFp9XgxTVwJbSvpp6BuB0Set3kr+LyZVe6cEovyiYkmNSvO3USuIXe5kIB7fq4
	Yy8fYHIN9CbD6KTIlqZwjnjidQuPGU/5EP72E9yGiEj/jPIFsTmtqab/PHtMwIzGHj2H
	i4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qC0IG1yXeFVgXh7RvMmYWyFG2SnX0DwDDo4+mmtSecY=;
	b=JKVL2AUmqBdZiNDDfvhqcnB1Id9KbJJjNr8SHIE42ORQTIIeABzsJfA16MiJhN6/34
	5C6yjDJxrHeIZC/9EyTFPIOYsNDCodI2wtgwVzPdOCX7abHPGGJp5UcWqOU3BxJlioMq
	ohl51n3JhP2PnCrs51kVDGJ4qxngnningqhI3lxblc7VRdBrXJWsq1/mYnPJcYHjuRG5
	s+oruTmsatKkhzyd9naDJYjij/qRhuGMAaB/8CCtBg3011wyl+jboUkv/vgc+mi7VZPr
	u3AlLWsguLamLPHPAzOm5vlhTnXP4Fn80hCC3dgbdc+L49hdn5J9dmevdnrHc3NkuLH7
	Dp0Q==
X-Gm-Message-State: ALoCoQnxRfLugJVtQq+/cdhEkklJCfcYkJqPADuSptT94TxhrFboi0xN+6XfQ+rPhiKgI2zYSxS4fvvfVxTwN8DQdaf51/EmWr6cxxAQHYzpGoNG8nTeCYA=
X-Received: by 10.50.30.69 with SMTP id q5mr3719789igh.78.1449823707824; Fri,
	11 Dec 2015 00:48:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 11 Dec 2015 00:48:08 -0800 (PST)
In-Reply-To: <CA+chaQfNL8XPqxgLkBq=ZP98TMLqjo3Zq9Va0-eqCv0raOUCyg@mail.gmail.com>
References: <1449702069-11889-1-git-send-email-alejandro.delcastillo@ni.com>
	<1449782540-4416-1-git-send-email-alejandro.delcastillo@ni.com>
	<CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
	<CAJTo0LaabSzVjvsSsQ7Gudunb7YOiuX8Zc=b27J+6_LNFwAT5w@mail.gmail.com>
	<CA+chaQfNL8XPqxgLkBq=ZP98TMLqjo3Zq9Va0-eqCv0raOUCyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Dec 2015 08:48:08 +0000
Message-ID: <CAJTo0LZKZn+xQu-jyuv9cOxJ1WjHhLizLLGUC7tfF12vjVw58Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsolv: add new recipe
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
X-List-Received-Date: Fri, 11 Dec 2015 08:48:28 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c17a58005269b6350

--047d7bdc1c0c17a58005269b6350
Content-Type: text/plain; charset=UTF-8

On 11 December 2015 at 00:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> I was hit by this regeneration again last month so it's still happening.
>

That's very interesting, as I was assured by GitHub engineering that it
wouldn't. :)  Can you recall what the archive was, and the before/after
md5sums?

Ross

--047d7bdc1c0c17a58005269b6350
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 December 2015 at 00:15, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I wa=
s hit by this regeneration again last month so it&#39;s still happening.</d=
iv></blockquote><div><br></div><div>That&#39;s very interesting, as I was a=
ssured by GitHub engineering that it wouldn&#39;t. :) =C2=A0Can you recall =
what the archive was, and the before/after md5sums?</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--047d7bdc1c0c17a58005269b6350--

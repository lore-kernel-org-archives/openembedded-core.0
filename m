Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6006C782EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:44:01 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id c10so179651312qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zzMWL0Cc06cyMnbzkF0ojOJKOZzRA7nUk7CrdikdWOk=;
	b=lui54s1sRvfx8V2nX7K4JP3Z8kslN7Og8rcP7FLoxoaAQtoeeIzIo9O1z07bzcslJr
	5WHxiaS5kxTqkhb8ZH7qfh3MH0xm+B4emHrvPKy60yntHhBpmduzPwqic1TpenboYnQq
	J0rOa5JCeTi0pGCNcFdYTYWQwTM2UxSEkhdtDOpCTCk5f3FlsgxVJL+TQ8Ha31tsTwUw
	tU1G6gZVNgVpX9agQtzvNdFTsNCWoqbYwuhE177YBYfIG3RCka96FMY8bwiQrbeOR3XR
	P7x4JN8HTEF0Is6dkcXR3gjc1oBwtDuL+yJYiTPfIl/FZ3aitu7ib13HEBuV/zE3tukZ
	GpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zzMWL0Cc06cyMnbzkF0ojOJKOZzRA7nUk7CrdikdWOk=;
	b=JVTtauM44PVQNnmlWzaFNY67fSWck84ONEl8ua7bh3cc1hX14zKqRAtsmqKi+3WThj
	S28ltxPhEsOH90siUSpTEb5PjWCfkd8ceWgckCz90yBys11B+JR6OwfjF4XeQLSDWgB2
	oN/c/lkOg0WSPYAV+gM61lk+PBZmTSszrClXp2mzSzaAV2gARIUTTk5gE188s7uKFeMQ
	Qck6uAb1BXpEj0sVCgsTh9Prn6dKmuX6/5ErV8lo0pLPt6emJuapTBb03G3auidV8rIJ
	4jMZRiDHrx+0wdSQJoauVy/fAbLQnwJuKME6n7FW6qLT3OlzGQvFPXg6CyMK7AMSKGrs
	Lwdg==
X-Gm-Message-State: AKS2vOzbmCPYIQn29oa/f3Bsxari+mA+ciBgUVPOXUzzaKILtJnuwJOF
	RJuAv9IrvMGVR/7ScIfT56kDEqo5vi9+
X-Received: by 10.237.59.147 with SMTP id r19mr1090109qte.47.1497372243305;
	Tue, 13 Jun 2017 09:44:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 09:43:42 -0700 (PDT)
In-Reply-To: <a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
	<a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 17:43:42 +0100
Message-ID: <CAJTo0LbO4-dU4-=JTc2akzCQ_PqKzB7fTUtwPmA2-P+CaVyxEw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] ovmf: Update to latest
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
X-List-Received-Date: Tue, 13 Jun 2017 16:44:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c1923c8a8ba930551da2426"

--94eb2c1923c8a8ba930551da2426
Content-Type: text/plain; charset="UTF-8"

On 12 June 2017 at 15:59, Khem Raj <raj.khem@gmail.com> wrote:

> Fix build with gcc7
>
> clang can not compile it therefore mark it gcc only recipe
>

This doesn't apply to master, can you rebase?

Ross

--94eb2c1923c8a8ba930551da2426
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2017 at 15:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":24k" class=3D"a3s aXjCH m=
15c9cd1c9fd5dcb2">Fix build with gcc7<br>
<br>
clang can not compile it therefore mark it gcc only recipe<br></div></block=
quote></div><br>This doesn&#39;t apply to master, can you rebase?</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--94eb2c1923c8a8ba930551da2426--

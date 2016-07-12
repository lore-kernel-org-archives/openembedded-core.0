Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DFDA760589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:48:42 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m101so9285942ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V713puTxiDRiFdIzR7InB67ct8JzbKGsxrRD3vtkIMI=;
	b=vTOG7mwbnDHBYh3eg3+waQt2p2HML6QtmDWqFe5ke7pJMLzwlskuq7IWg90eJ+PVm+
	T9m84qYBkh1hsbgjlMuzTLOMUZ7+9VgKKRhV9o5UZxB4KlL9sBVtrrQFwkNwFvh3JPho
	1vGwvMa71gi5ngwaGMMTu6mdaexQSQBO3UV8SK8hHKFZalAHbrwVCrQy3dJHrEMn2UO+
	J/tmuBpNisTfpMqbefDSbjjNhU+2r9bbWIZaeHMdHiO+4fY1sHycZmQOLFQNKEO9Te3j
	JBxgtnfGZ1irEwaAeREMwECZM1AoCuZB2S0KZe7dRiefBDtz9N8+/zuYvdIMSscMnzWa
	a25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V713puTxiDRiFdIzR7InB67ct8JzbKGsxrRD3vtkIMI=;
	b=WBfLhMfkRy1aNOeb9/3KLFg/bTBmEhpMrwCnrCQrpAU6JrQ6hZUtGn1LLuu+YMOT6s
	KFTo24xzMJ8ElSg8Lc4Cil+GsYCJi0T9tWAn6YMhb2MQgwE2If4YtKChg9LfyXfBH5wD
	htoCbSpJK29STrMsVnPjyMY0a8bPPsi32ZTphhgQDMjK73OxDvn6L1cT7NaSdL+QfxKa
	83XfseW/Lxkrng5MDd+ClfKO0FnEMnTZELLagq1FYcboif77/vXaMhGhfLp2U12xBUvB
	GU1uZZmaXwd9B2wcbC2ORK/wD+8Cn8oDiN4PGpBAc92e8uojauTwS2e3A6N8E2+DwJoP
	KExA==
X-Gm-Message-State: ALyK8tIdCaAzhiGHnUABUbDTFEWH9n2UY5nyZormxaMHfifaceZA/jIqoNTno47+Ff/slaoDU9FEQnvqnx1hy18F
X-Received: by 10.107.154.210 with SMTP id c201mr1225031ioe.99.1468309722815; 
	Tue, 12 Jul 2016 00:48:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 12 Jul 2016 00:48:23 -0700 (PDT)
In-Reply-To: <CAMKF1sqMyAKWu1Hos94LsmrEr=mHHqxC6ybZy558erPJKrtHjw@mail.gmail.com>
References: <1468271236-6781-1-git-send-email-ross.burton@intel.com>
	<CAMKF1sqMyAKWu1Hos94LsmrEr=mHHqxC6ybZy558erPJKrtHjw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jul 2016 08:48:23 +0100
Message-ID: <CAJTo0LZvENFmQiDn=6WdCjrRPq=O26oCpsg8PgQr6W7ikPmU4A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add more Imagination Meta relocation to elf.h
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
X-List-Received-Date: Tue, 12 Jul 2016 07:48:43 -0000
Content-Type: multipart/alternative; boundary=001a1140fab672f59905376b7fae

--001a1140fab672f59905376b7fae
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 02:24, Khem Raj <raj.khem@gmail.com> wrote:

> 1. Move them after BPF declarations.
>

Sure.


> 2. Write a ChangeLog entry, something like
>

<blinks>.  Really?! :)

Ross

--001a1140fab672f59905376b7fae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 02:24, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":2c3" class=3D"a3s aXjCH m=
155dcb533a0a6625">1. Move them after BPF declarations.<br></div></blockquot=
e><div><br></div><div>Sure.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":2c3" class=3D"a3s aXjCH m155dcb533a0a6625">
2. Write a ChangeLog entry, something like</div></blockquote></div><br>&lt;=
blinks&gt;.=C2=A0 Really?! :)</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a1140fab672f59905376b7fae--

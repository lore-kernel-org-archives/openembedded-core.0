Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id AA7B86072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 13:25:00 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m101so99209463ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XmKS+SeY5rieWQqjxQc/Bp7mUCKjNCl3OQj4BTYYR08=;
	b=JUaTyywvvEyQ4aikkUIlunjcF6wS5EokLqXyv2J22bWFCiWVb6Tkk/CbciK3qhmNzE
	Ui+aLk44R9FDlI7bAZ3XuBw6bRGsV+OWWo2tEJIHsMu1Sfvz1SajCuUyQYHp8zdTG/E5
	bXSGOFJMLFJnoblq0fvmMAIjHGA90N/Eb8vDtUneNYyVLF/G/TZtFplwvtQ4zQOgYfn7
	LKUOrMM+O/oeekrRQ6Wkm25qV1lhecsrq2MjG7R8tw1nvyVa8shPBBTibj4JwNgyHQGx
	KVnp0ynQMyxFYBBfPP5VG3L9+mW3ZQsRWEX7d5cn/t5cRW+l1DduI6FoYZpEaXL6IJoh
	RpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XmKS+SeY5rieWQqjxQc/Bp7mUCKjNCl3OQj4BTYYR08=;
	b=hZ7ICN7UWmDzBpfwfykBwb6yz0C1/C08ysq2lF0kM9YCsLZl7bYySV3hVdiBxu/hoj
	FmexBGFENqA66UlvXjx/2JGg7CvoJ8cTbTz4lYm2p0e+d8q7j/UDV1XN35tuFs9QocEd
	P12a5r2LnzC+14KuzK2+Syl7fppYNFBg+XXHEPjnRU7FPiZd4E1QyN8Q9XDiBgRHIGqk
	P3be7QpzX0d7CjHRNWtCkxtiN/Ht+DmZCmMlgfg4OXAjfs/PqyC9D9FEuvfyUIxONpWX
	sXHimtIKKkKrs59NNT0oXCIalM2dvYxdBpFgqvz4oKSQFGDsudcyrEbVUjDqPfZVw/r3
	AiNA==
X-Gm-Message-State: AEkoouuqA7kBg1mEN2Bl1nozt58ubr6CM8jgXgTgBQdgiloXhGByYbvAvCL3ZN1QXiL/4jMFKW9szGulhyLsOlID
X-Received: by 10.107.138.212 with SMTP id c81mr37139615ioj.148.1469712301068; 
	Thu, 28 Jul 2016 06:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 28 Jul 2016 06:24:41 -0700 (PDT)
In-Reply-To: <20160728132014.GH5926@bill-the-cat>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
	<20160728132014.GH5926@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jul 2016 14:24:41 +0100
Message-ID: <CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Thu, 28 Jul 2016 13:25:00 -0000
Content-Type: multipart/alternative; boundary=001a113ed932a116f10538b20f47

--001a113ed932a116f10538b20f47
Content-Type: text/plain; charset=UTF-8

On 28 July 2016 at 14:20, Tom Rini <trini@konsulko.com> wrote:

> So ARCH and a bunch of other stuff isn't set and things blow up.  Just
> how large of a -j value are you using here as I would have sworn we had
> gotten this problem fixed.
>

20.  Before applying the patch I did a build to verify that the patch
introduced no changes, and that worked fine.

Ross

--001a113ed932a116f10538b20f47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2016 at 14:20, Tom Rini <span dir=3D"ltr">&lt;<a href=3D"mailto:=
trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":2mc" class=3D"a3s aXjCH m=
15631a9be06a0705">So ARCH and a bunch of other stuff isn&#39;t set and thin=
gs blow up.=C2=A0 Just<br>
how large of a -j value are you using here as I would have sworn we had<br>
gotten this problem fixed.</div></blockquote></div><br>20.=C2=A0 Before app=
lying the patch I did a build to verify that the patch introduced no change=
s, and that worked fine.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a113ed932a116f10538b20f47--

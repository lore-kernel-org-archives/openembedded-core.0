Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 343B660248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 20:50:03 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id z76so160328500iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0BOcB3MrDlGFzB8qYGj8SLUUlGbHThU7taA7prg6mG4=;
	b=qqtHwObGR5TTJrGy3sVUqSRPLrA/2guSGrho6JgpA9s5TUlgCP14vIbUSpcuVlVOqg
	ChVBI1aNwHLOahwtG+CmReeB+ZbWEAcgGFFGkAhTWBi64UK64ukLMxRExlavJwvkDbtp
	l8OjNRV1Wg2zvDYdHjFQ+h4uIPkitfrCTljDnkgWTCJWnLXdjZw4xqajl74OzgUw2775
	wY93IiuCiEGhRF2Uq5lNVm0abp1DP+OiItsZVWSJJczWBj8zeQnBcc3ewk1K5CpEgUZA
	pQ53MQtg7FzIjAIs15qyfT7B9Gaud0vvVsmOQPDv2VZsaQUYFaFKDmRcaoOOFecctFxG
	peHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0BOcB3MrDlGFzB8qYGj8SLUUlGbHThU7taA7prg6mG4=;
	b=NL2AB9laeDq92jdjDMCQOae7Eh2BtNikB9K74dKJaCQ0p7iiASVnUVOQeZgwdZR2Sb
	z6Dkz1Hk1evpTjjKDMKKNJLldD4HqNczAycGdaGbl2rs+vvEaAiEe1o/tFCQzJIa5nuV
	14rgetma7khmIgpK+6dha3JHKvLvzxf7qxz8wdLP95lLUisaXfanbFsm9WeNcHZrpwNv
	mgHjMDFxyP5dFanRR+ZmX0PdLnPWoKVOp98qaSfu93ge348LG4KZPO6KW4ciYTW+c+SK
	3yGvpNedGfbfe3z7eIOiEsHyNOHNXVFvMKYLt7Ye900dJ+8auyhV7q5fERUP5arNkV2t
	naCA==
X-Gm-Message-State: AD7BkJIExAxzeJYe8Ti4CNTDsDjahAMDksoeCg8xEY3nmIIPNiSgQZszYAhFi1QHS7m8/fmGrkvoqQzSUeNEKbzK
X-Received: by 10.107.16.19 with SMTP id y19mr12024105ioi.148.1457729404469;
	Fri, 11 Mar 2016 12:50:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 12:49:45 -0800 (PST)
In-Reply-To: <56E32888.2000301@gmail.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
	<56E32888.2000301@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 20:49:45 +0000
Message-ID: <CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Fri, 11 Mar 2016 20:50:05 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea551cc4052dcc13cb

--001a113fd1ea551cc4052dcc13cb
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 20:20, Trevor Woerner <twoerner@gmail.com> wrote:

> ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but
> virtual:nativesdk:/z/dragon410c-repo/dragon410c-tw-jethro/layers/openembedded-core/meta/recipes-graphics/libsdl/
> libsdl_1.2.15.bb DEPENDS on or otherwise requires it). Close matches:
>

That's an awesome comment.  Clearly my testing wasn't optimal, there's
another patch required.

Can you verify that cherry-picking 55ca1fb8f0e81ff739b3c46897e43356d1f760c3
solves this?

Ross

--001a113fd1ea551cc4052dcc13cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 20:20, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":1cz" class=3D"" style=3D"overflo=
w:hidden">ERROR: Nothing PROVIDES &#39;virtual/nativesdk-nativesdk-libx11&#=
39; (but virtual:nativesdk:/z/dragon410c-repo/dragon410c-tw-jethro/layers/o=
penembedded-core/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.=
15.bb" rel=3D"noreferrer" target=3D"_blank">libsdl_1.2.15.bb</a> DEPENDS on=
 or otherwise requires it). Close matches:<br></div></blockquote></div><br>=
That&#39;s an awesome comment.=C2=A0 Clearly my testing wasn&#39;t optimal,=
 there&#39;s another patch required.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Can you verify that cherry-picking=C2=A055ca=
1fb8f0e81ff739b3c46897e43356d1f760c3 solves this?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113fd1ea551cc4052dcc13cb--

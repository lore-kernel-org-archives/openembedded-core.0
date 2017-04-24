Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5A077AA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 19:15:46 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id y63so97039268qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4JifzCGxE+8Q6ZohpPNp3pWmu6O1liY1eSxcE7tqXng=;
	b=aK1RUQJftg/3i8zOpSiKWfexqZe6eiYQVALWBBAMcmSgdHbG1aJTQWqn4NjfGY8yIJ
	o839vIIaTiII2rZvdbxUyjoFoDJtvITzvq6jwJBIfPbu5LPunLzgtSvgDF8GXuNLSdcv
	b1E1arzZwIwD3p9q66zne+ODz1UlX3eNy1KZd07lL93rcdOTJfSjFS8LDzR0ZTLCcZDt
	iVwhIKkal5bbmG4mt4V65hT4fIsoJYmo3mjFk4O4G5SydY8lJGJ+2Er+5k13pg4J2syV
	CIVuu0PZ8bLPodZJASqN1cY/AlAIlSIMlmoejiuEcVvpsTXZYHroL0lzjkAjDHPiwaHN
	gqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4JifzCGxE+8Q6ZohpPNp3pWmu6O1liY1eSxcE7tqXng=;
	b=ezLY5ow68hMjBFaRtw1olORGYJ7CQafSgYMUVNXiV6BNijMC/M3cqiyB9IFdA1hoPA
	bdc/9Lylk1sorvzffduom8I4bXo6vrmG/HDONHty3suNfDk5Rn6cn7EDqKAvKo7ULF9p
	q2oKlD2p6aECu4Y4i60P20tPy83mtMyOrULCNGjio9yftgGk+gp+d7ICwZy4Tjb6Vl4m
	puxV0ZHw14oS35UGZKTDSFIWN7/oLWleW2L11MLHoJ6KHmqAlm0dRgaGMD6oJh68VhqU
	+Pihy7cKYKOB+RR2VurE00y2UiMOjzDx8ZG+uWeSy9OqSQA/4KZisGKg3vWANvtDlJFi
	o2VA==
X-Gm-Message-State: AN3rC/6HcNTTNhl6f5ELSnpfQ9C6fE6h1P4cn4ID7oNcac6Ewg35zuQi
	J98ijsjrbQxxhopXeczqXN189neBO0/R
X-Received: by 10.55.115.65 with SMTP id o62mr26095676qkc.26.1493061348027;
	Mon, 24 Apr 2017 12:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 12:15:27 -0700 (PDT)
In-Reply-To: <CAMKF1spRYm9yYhOVzOcA+5BPjATW_gLZfKmBCkZgj0MKZX=YmA@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
	<CAJTo0LZJSZ-UJc7zTyYNf3YYKFD3mu=-zprQroZwxB1SZBQ+Bg@mail.gmail.com>
	<CAMKF1spRYm9yYhOVzOcA+5BPjATW_gLZfKmBCkZgj0MKZX=YmA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 20:15:27 +0100
Message-ID: <CAJTo0LbEu_PZ0WRTMK__8gjF-JVULoAA_qfLQXLCwSJpMksbPg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 19:15:47 -0000
Content-Type: multipart/alternative; boundary=001a114fdea24710c8054dee6fb3

--001a114fdea24710c8054dee6fb3
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 17:10, Khem Raj <raj.khem@gmail.com> wrote:

> thanks, yes I haven't been testing SDK yet, whats the gcc version on
> your build host ?
>

It's failing across the autobuilder so I'd suggest it's not specific to a
gcc version.

It also breaks on my personal machine, which is Debian Jessie(ish) with gcc
4.9.2

Ross

--001a114fdea24710c8054dee6fb3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 17:10, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1t6" class=3D"a3s aXjCH =
m15ba0bb0313210b5">thanks, yes I haven&#39;t been testing SDK yet, whats th=
e gcc version on<br>
your build host ?<br></div></blockquote></div><br>It&#39;s failing across t=
he autobuilder so I&#39;d suggest it&#39;s not specific to a gcc version.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It also=
 breaks on my personal machine, which is Debian Jessie(ish) with gcc 4.9.2<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a114fdea24710c8054dee6fb3--

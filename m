Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 26F9878049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 11:22:48 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id u12so107968090qth.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cwiZUh9sq5z/yD2Uft8rheSJRGgcwGA8jBOzBwENVRg=;
	b=D992yPe5yaStBw77kLERhu7BPBUTxunrS1JUIuy6CRUSg1Lz9KlqrMQN6Ezcq7Df6x
	QcFaRt5ToLYrUfXvH6r4AwSALS6HtD1SUTzrNjEu5wi0Ix0V6fvczGUmI6XidtHD9JtX
	l/IoieAa3TMIL37imMeAQ9i+m1RBcKK3RC0X8DyfLrEwdOVZoCdOUyeYGG6pfTzwb+Ao
	Il98DJCTniAKFXZ0pBoZTD2+kQz1ygeaQk6onuwk+dqcU3CxInPcjdZG5dK5JhHym6Y9
	hajlDnewN3KNYlp4f+oogY5sfQqda/gWqPLIfAy8drLQK3i4HR4RuxMgA1baFcr6T2ap
	TMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cwiZUh9sq5z/yD2Uft8rheSJRGgcwGA8jBOzBwENVRg=;
	b=PKviZbpXhGlZyxTsxZVuNFALtk76/lRcx32m0/+0bqf0O/BtNXb5gl+8pQs7srX7fK
	sLf66fABxVMOy3g2fNXtUgp6UmNoOSz5LCW/UKuhCNRBbPZ62GkFLNzoK7DKiNK/wNQi
	+vuHqTbrt506ohi9BKpha4gzIUcGrA8IsJexUZAS9b77+ALPf05m/nvy+NHnQN9ujEoH
	28HhjL6hRbl9deLeiyV30zO5Y2TnYEhZw/ocehWkjmueN8EWRtfpjlEX8qkqo93kTnMd
	Tk1wS9t5V/jp5lmvl/yseLX3ZVzT7Pj4mqC7kDhEyQSqjt9mrTK57w4Rya/CMqTGnmkp
	mQgg==
X-Gm-Message-State: AKS2vOwtA4CZgF0quQvwl3BchQyQGI1ZxBQ1BxUYIaDK7BdGNSZNVwaX
	zSeott+MpkTVkRiOeGZWRf0RrlOdRpAA
X-Received: by 10.200.58.38 with SMTP id w35mr25640438qte.93.1497871370127;
	Mon, 19 Jun 2017 04:22:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 19 Jun 2017 04:22:29 -0700 (PDT)
In-Reply-To: <20170619102050.32072-1-git@andred.net>
References: <20170619102050.32072-1-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Jun 2017 12:22:29 +0100
Message-ID: <CAJTo0Lavp4EiwoY0WJh8Gc9qEsMokfUzjAqFpTnYO0K-c=1F3Q@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: fix gdbserver not working in musl/mips context
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
X-List-Received-Date: Mon, 19 Jun 2017 11:22:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10cef9e2605524e5a1e"

--94eb2c0ca10cef9e2605524e5a1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 19 June 2017 at 11:20, Andr=C3=A9 Draszik <git@andred.net> wrote:

> +Upstream-Status: Inappropriate [cherry-picked from LEDE
> https://bugs.lede-project.org/index.php?do=3Ddetails&task_id=3D
> 637&openedfrom=3D-1%2Bweek]
>

Doesn't sound inappropriate to me...  Pending if nobody else has submitted
the bug upstream.

Ross

--94eb2c0ca10cef9e2605524e5a1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 June 2017 at 11:20, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":7z1" class=3D"a3s aXjC=
H m15cbfdeea22302ff">+Upstream-Status: Inappropriate [cherry-picked from LE=
DE <a href=3D"https://bugs.lede-project.org/index.php?do=3Ddetails&amp;task=
_id=3D637&amp;openedfrom=3D-1%2Bweek" rel=3D"noreferrer" target=3D"_blank">=
https://bugs.lede-project.org/<wbr>index.php?do=3Ddetails&amp;task_id=3D<wb=
r>637&amp;openedfrom=3D-1%2Bweek</a>]<br></div></blockquote></div><br>Doesn=
&#39;t sound inappropriate to me...=C2=A0 Pending if nobody else has submit=
ted the bug upstream.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c0ca10cef9e2605524e5a1e--

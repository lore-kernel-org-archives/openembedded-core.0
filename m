Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id E681D606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 21:07:10 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so10272517pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 13:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Hyc1DF4M8pLmdaGgAnkeqLLGyLoTDo3lVtf1yUjvlk4=;
	b=Sl33bLj2ZicA4c6vJQA/XDP6zSfRY6e3cpIFgeTys2RLl92lNyY/BIf+AbTNL6O+x6
	GN00l1qmyQi1iD2uPSoULBeX1VnBhWLbF2nzyCaTimHw7HeKNZzpEhvG1RrFjXM85RnK
	HzWe3OJPGiSGWJJjB2HKnF7UUE/28EtAiOLjSPhIxI/QsIh9FxBz7VjDWGaF8wcMcVu/
	WRrvkzeIzQuabx+KHgtl9leLEa9Iobvsd0Um845KgVKs/ioAUy+U4xvlVh2ZzyFMWk/J
	JuQPZuriy7bsbR3XqihcisbjWGIsy1BYgTUwTj5r2KTr7d04eE1cdhkS8sCf3Rsf6NJp
	3qDQ==
X-Received: by 10.66.65.195 with SMTP id z3mr20152220pas.104.1424466431424;
	Fri, 20 Feb 2015 13:07:11 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:40e:ad5a:d630:8cb2?
	([2601:9:3580:84c:40e:ad5a:d630:8cb2])
	by mx.google.com with ESMTPSA id
	hd4sm27697397pbc.86.2015.02.20.13.07.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Feb 2015 13:07:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1424436945.11836.46.camel@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:07:09 -0800
Message-Id: <A1665D99-DDB0-4315-948E-064D6286ED45@gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
	<f2524b85ea338525d78147b4bd90d2a1f3f3790d.1424405852.git.raj.khem@gmail.com>
	<1424436945.11836.46.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] util-linux, util-linux-libs: Build and package util-linux libs separately
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
X-List-Received-Date: Fri, 20 Feb 2015 21:07:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 20, 2015, at 4:55 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2015-02-20 at 04:24 +0000, Khem Raj wrote:
>> We have a catch-22 where systemd->libmount(util-linux) ->
>> libssytemd(systemd)
>>=20
>> This patch breaks the dependency loop by building and packaging =
libraries from
>> util-linux package in a separate package.
>=20
> Every time we're tried to split a piece of software into two like this
> it has been a world  of pain. Are we sure there is no alternative to
> this?
>=20
> I'm *very* nervous about this :(

I don=E2=80=99t think there is another solution. unless we have a =
different package providing libmount.so and then we could disable
it in util-linux, I have taken most care during split, thanks to =
testlab/buildhistory to make sure that exact content is divided
into 2. What sort of issues do you expect ?=


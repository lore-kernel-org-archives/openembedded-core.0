Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 66B097858F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:09:50 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 68so17434858ite.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M52aOw4S/ZkR6Qp8YRFqQxtsO64lUoXZlin/Ns3tBe8=;
	b=aw4Ok9x3KT5Jxj85VoyysmVJvBwhkFYBKRQ1goHFznM6bpDD7HYtvQFkbFRvTnyjRJ
	gCeF9xZPFWG/3tzAzjA3+F+D+HMp/ZB8xfLf+kchUafrAM3mVpkhPqbfxECQPEoG8cmz
	qbPpoMECK80em6mOg40wghn1GGS5j1CGvlpIEN5lEvKI1w7pLcYrDs1qKuJlr2i73ulI
	l7WYocy4quVl0BNfcdKj3979lH7fPHAxTmBjlRbJsTr63lMai3zuSXy32Te8occ+5f+3
	sEsqFV8JbM1uv4UlJWyrGglmePeBhw2uhIuJ7Be6bN0WWLhkkrebb3y+slgxCeg5bpOx
	zjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M52aOw4S/ZkR6Qp8YRFqQxtsO64lUoXZlin/Ns3tBe8=;
	b=Hj3r/keRBRlOu8hDK4pdghvrtP7xAVDpooW/P7CUqLoHo/tDQNkCH5y7BmbHMTYodE
	KQ6Qr7K6kzgj/c0XkZxMpLxiPjfBJ0KHPJOlGicIPD5x4qBs1w8ouX+Yd6DtaGyrug3b
	Rsu4V11w55RF8aRVoC+9xzl2JxI4KyR75FQPwYHRWyX0kGc8aXM22/xXq9D3s3eNKHjX
	7YeyrLwxIVi/AUPwZpTIPIl2ualWPB+PAQWd/IODhZO6U/VCplht1Q5F6GcJA8kRtr4i
	MUZE6hIcnkbq1GjXQmwpN/3ir8jwueyKlVlx4PL1D7kh6Giz4OAeMLcwb1LA3h0oL4Im
	SS/w==
X-Gm-Message-State: AKGB3mKNCBtWNy8HtR5+WU22/AVJ+C6XO5ctqv1nMqPX3JYwNxlH6vUT
	TYm/5o2zagZ3WFTTuM8JidWGbhnku0IhBoJYXqHl0A==
X-Google-Smtp-Source: ACJfBosoUyS4KauH2Bwtf215ht6jo96gn/nz9gJegvIj3ksikjbSVxNIfkRz1kXdcHPQgG21PXjEkIE5TvE9YfxvS3s=
X-Received: by 10.107.146.195 with SMTP id u186mr1457102iod.37.1513012192322; 
	Mon, 11 Dec 2017 09:09:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Mon, 11 Dec 2017 09:09:31 -0800 (PST)
In-Reply-To: <1513006625.9676.9.camel@gmail.com>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
	<CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
	<1513006338.9676.5.camel@gmail.com> <1513006625.9676.9.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Dec 2017 17:09:31 +0000
Message-ID: <CAJTo0LbVUE-Z84U59edVmmHu34kvNTZv+urwJAHpgBrXA96p=w@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Mon, 11 Dec 2017 17:09:51 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b243eb8a0560139a67"

--94eb2c0553b243eb8a0560139a67
Content-Type: text/plain; charset="UTF-8"

On 11 December 2017 at 15:37, Joshua Watt <jpewhacker@gmail.com> wrote:

> Vanilla waf only supports --prefix, --libdir, and --bindir. Anything else
> is a result of loading the gnu_dirs tool, which not all projects are
> required to do.
>
>
> Sorry, hit send too soo: waf (at least version 2.0) also errors out on
> unknown options. I think the three I listed are the only ones we can do
> generically. There might be some way to easily adding the rest if you know
> waf is loading gnu_dirs
>

One option would be for waf.bbclass to check if WAF_USES_GNU_DIRS is set
(defaulting to 0) and pass the full set of path options automatically.

Ross

--94eb2c0553b243eb8a0560139a67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 December 2017 at 15:37, Joshua Watt <span dir=3D"ltr=
">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@=
gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div><div><div class=3D"h5"><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf =
solid;padding-left:1ex"><div>Vanilla waf only supports --prefix, --libdir, =
and --bindir. Anything else is a result of loading the gnu_dirs tool, which=
 not all projects are required to do.</div></blockquote><div><br></div></di=
v></div><div>Sorry, hit send too soo: waf (at least version 2.0) also error=
s out on unknown options. I think the three I listed are the only ones we c=
an do generically. There might be some way to easily adding the rest if you=
 know waf is loading gnu_dirs</div></div></blockquote><div><br></div><div>O=
ne option would be for waf.bbclass to check if WAF_USES_GNU_DIRS is set (de=
faulting to 0) and pass the full set of path options automatically.</div><d=
iv><br></div><div>Ross</div></div></div></div>

--94eb2c0553b243eb8a0560139a67--

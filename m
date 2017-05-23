Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 23ECA77E8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:44:28 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id a72so131676750qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6M7v6gIH0QyhMCrDTA2yS9HfTJxLXiqM/4uKYY6nGvg=;
	b=TfxSGq2QELSIdlm6HFywcJC6Hae35RyBpOZVUHvYQj3iEqCZJNDkU1R3WSk37xaraQ
	WwUNHVylrkJirjhIw7nV9vmWmMFfR3NP8wBgePBcEGdQyH1BALHlM8KSGjIACeaddn8f
	W8zuVF1/P4skreyshtzmrd9Cw0kmCtGEyaV2qcrjDBJ2ZeXQJjmc6bB2wcKOSLAvBQCr
	ctZ9kPolHEhrlKrEy9vARWGQUM0ufyDhiiRWcukCPdYbMFIsagGDnIaki1BqZquKUiqI
	HCwh5DVnHOu2njSTYIBxB2sdvK1DA/lqHXKaU0BDq9FSeDeVyMqP4XNc2deAqw2QXmyw
	1G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6M7v6gIH0QyhMCrDTA2yS9HfTJxLXiqM/4uKYY6nGvg=;
	b=Ur/7NZcIeRlLtqlAHGP2igOudyuqt+2XMn7Yg7L6hvjTWjQBuvGS6RXtc5m4AgGv4C
	tweU6Mmjdx7hzxz1d9A31/u1qD5x/eJd30W/d4s0+xH+YSVPLlJKxnfc6pXyJK5zkW0E
	lJgbgg0VQ0WGzkGf7XaTv8KQiSUhLzUgYiok8U8dlaUfVHCrt1cNtqQaINNJrBpTjiC1
	6zsiV/huZzyTCwBWo4B64I3BPHM5THH+y8Bf+C2aolnVkPyhpQ79RPybpT00wAYvV/mu
	yzhhotTgCfh2bzZpsWwK+HwjUbM1OWAJPE22Dka1vIvSp7SuysWzg/vc/IObG70aA85J
	DMZA==
X-Gm-Message-State: AODbwcCbBXwyY476KMdSgbmUh6nbTBX2iE/PRr82VoQILMjED5NJb6xq
	MOcy89o3FvK9EJtXJdYlaDg1ds2bduG2
X-Received: by 10.55.170.79 with SMTP id t76mr28933393qke.54.1495550670159;
	Tue, 23 May 2017 07:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 07:44:09 -0700 (PDT)
In-Reply-To: <CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
	<CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
	<CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 15:44:09 +0100
Message-ID: <CAJTo0Lbig6eUAOHX_UCLU7VM8QUG-Cj2JZoBzsfwbd7vpLKRdA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/15] db: Add --tag=CC to cross libtool invocation
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
X-List-Received-Date: Tue, 23 May 2017 14:44:29 -0000
Content-Type: multipart/alternative; boundary="001a114d5f6e704f6505503206b4"

--001a114d5f6e704f6505503206b4
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 15:32, Khem Raj <raj.khem@gmail.com> wrote:

> I think you are right we have c++ here can you try with --tag=CXX
>
>>
packages/corei7-64-poky-linux/db/db: RDEPENDS: added "libgcc (['>= 6.3.0'])
libstdc++ (['>= 6.3.0'])"

That's worse! :)

Ross

--001a114d5f6e704f6505503206b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 15:32, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><div>I think you are right we have c++ here can you =
try with --tag=3DCXX</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_extra">=
</div></div><div><div class=3D"gmail_extra"></div></div></blockquote></bloc=
kquote></div><br>packages/corei7-64-poky-linux/db/db: RDEPENDS: added &quot=
;libgcc ([&#39;&gt;=3D 6.3.0&#39;]) libstdc++ ([&#39;&gt;=3D 6.3.0&#39;])&q=
uot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">That&#39;s worse! :)</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a114d5f6e704f6505503206b4--

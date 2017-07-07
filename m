Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0250671C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 19:39:53 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id d78so35693999qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 12:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Avh24GpcstQd4ODilJtb/G6F/POFTmphkhvlgAO2pBA=;
	b=ixUv2+s+vqVYYCoRLBQDwqe5tGWjKU4HhO0+wCi0gbuguM0q34y0RhL0htSqUVBUix
	w4lIxl3Vu6eYuwDIDIoxFYDCCHJUxd53JstkPLXS57YXm3W4gOf3aBYvVlZcqg9E5pWx
	Oab6dFLDIH1lEkSCPzrKJ/0yZGdn25snXXo/ejHo/6LXyxZymaxjQKyP5zL/FQ/1BaZ3
	6uoqIKvnyJymkK9rAl0uzRSWQTRGbQ56HyxncUOjf9heJY5h7oGSl6DZkhh8YZCkJzGM
	oI+15jx4DXhR7QDXCvJNmK0ubxaYCM4Sbp50vmKTrU5GZWXrWZkHhjsU8XGGnlox4ZtX
	AjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Avh24GpcstQd4ODilJtb/G6F/POFTmphkhvlgAO2pBA=;
	b=F3esmScZezQK6O8f6rxB3OyxGHNoSJzURw9C+mzvO0xq3G1yw2K6IfywLi29eklJWb
	jAGzQ6iaPa/l8GEUc5BuZRIx6pBgtWqieOzjqKM2sLF9d2yYxhefh0it1jUKR48QC6Up
	f927mFRPA+3LyWDoAjwdfEmG8FT5IkbIUT0bkc+Mj5GnOwyYKmihQMug3XKZZjpYSCD0
	noYe4iuwDRDk/E4SQuUzm5XbzfVStvKyTpsDI2nkpGvsq3mYPaP5bG3rwjNJB2gnCZQV
	j7W9fg4F9Of340zCrjc7fGwFFGPtoCPKGdNG4e/JSRc11VIxVVQ61qppcidKLLLoeqxs
	e9OA==
X-Gm-Message-State: AKS2vOwQ5dlmW5lM3cpIF9wn2IW8K/Abn2e2SAUv5i32VVzODtgWAIuG
	5f7j+6+Lsk09DiOatWmueu6WSX5QU2nm
X-Received: by 10.55.102.84 with SMTP id a81mr65981548qkc.154.1499456394809;
	Fri, 07 Jul 2017 12:39:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Fri, 7 Jul 2017 12:39:34 -0700 (PDT)
In-Reply-To: <CAJTo0LaYn6HQnasedd=btX0niZwWvewhvt-WCwdwMg++uyeD2A@mail.gmail.com>
References: <cover.1499327365.git.jussi.kukkonen@intel.com>
	<ff1fb73f38635b968a5fd5291d3ffa1f3998a4a1.1499327365.git.jussi.kukkonen@intel.com>
	<CAJTo0LaYn6HQnasedd=btX0niZwWvewhvt-WCwdwMg++uyeD2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jul 2017 20:39:34 +0100
Message-ID: <CAJTo0LZ0DAHPKUXeURQSC4-WiAPiM830jW002NA9qoe1zCQ6Zg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/6] vulkan-demos: Add recipe
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
X-List-Received-Date: Fri, 07 Jul 2017 19:39:54 -0000
Content-Type: multipart/alternative; boundary="94eb2c05760ec4e9bb0553bf65cb"

--94eb2c05760ec4e9bb0553bf65cb
Content-Type: text/plain; charset="UTF-8"

On 7 July 2017 at 15:37, Burton, Ross <ross.burton@intel.com> wrote:

> vulkan-demos doesn't seem to like musl:
>

No, it's not just musl.

http://errors.yoctoproject.org/Errors/Latest/?filter=567c4c106e39202990a822c053a0265ebc8f459b&type=commit

They're all qemux86?

Ross

--94eb2c05760ec4e9bb0553bf65cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2017 at 15:37, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-il">vulkan</span>-dem=
os doesn&#39;t seem to like musl:<br></blockquote></div><br>No, it&#39;s no=
t just musl.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra"><a href=3D"http://errors.yoctoproject.org/Errors/Latest/?filter=3D56=
7c4c106e39202990a822c053a0265ebc8f459b&amp;type=3Dcommit">http://errors.yoc=
toproject.org/Errors/Latest/?filter=3D567c4c106e39202990a822c053a0265ebc8f4=
59b&amp;type=3Dcommit</a><br></div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">They&#39;re all qemux86?</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05760ec4e9bb0553bf65cb--

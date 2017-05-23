Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5178677E94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 15:02:48 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id k74so132585205qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9qOIu923F49RmC7Bn2yzaZasrqWt67dQpwSOYdIbRIM=;
	b=JItp6gRz/xUkh+Ylen1HMtEZLXlkZ8DglIMl1mZ8p0nQw53Q/Gcv4C/Vmk5YCk+nrc
	GcnMgflA0qDk9jAGkEpReLiikA8CdwaNLentK0PMHKXtOoxekMuIx5h7WZ6hIzVN1pGe
	J8xleOjvnHS3ugn92W95XpszgdGl4lBNoRweDym/0AFxZxVkVGJBYbGtgTuF3Q6M+1WM
	XiylnaFNt5uE+vS2u/XkT75sWmG+VW7qLi22PquZqIlIyhsuAYxD/PR6w1AVp5h6THwg
	gypgjuM5veXQKatjx3w2qlgsFv5/erRGpP/SbkgDPv3kfMOYvjxWN5f/BVE2DRyBUDQ+
	j2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9qOIu923F49RmC7Bn2yzaZasrqWt67dQpwSOYdIbRIM=;
	b=eNsZqCmmxdbnAZjSjlk6vi+chq2r9LZhikXFWoFX4n6FTpSGP1v1nS+K4kua79+hTX
	0n8vUEl+ys7OjrsqqsDg1wesoy+WWLlkJ3t61lzRF7eKpz45ZQHhXnYWkhA3iRyKjCqG
	q+BuAD5KVpsmcegBLIsqFBr7UucjCA/zwZ1Eu45bhD1lIxgUyYBgKtYCtSBAmGJSqDKQ
	9izG9V8V73XirCooaAhqKgy5AIqTtcqQFf6+Ye6pl1Hi0XjerFpzFfqr+eB3DYvnnUzD
	qVfCpAMg5vKGlqTmZFrYtnoNX2/+QZIJAtXLReEIo6l43sYxcpgLUdtknCw57Or2nHjE
	i51w==
X-Gm-Message-State: AODbwcBHMejuXp9ZZYtnwvMqV00SUvWcbJyeTjQIAFhf71/vSuTntcyR
	5i8iR1fH4UwPx3tTZuH2ToBPfJRd8Gtc
X-Received: by 10.55.116.133 with SMTP id p127mr24364520qkc.154.1495551769942; 
	Tue, 23 May 2017 08:02:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 08:02:29 -0700 (PDT)
In-Reply-To: <CAMKF1sp01SVCaG=g4=UKRM23OwYC1LpQSBmwde7j0GugV3R6Fg@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
	<CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
	<CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
	<CAJTo0Lbig6eUAOHX_UCLU7VM8QUG-Cj2JZoBzsfwbd7vpLKRdA@mail.gmail.com>
	<CAMKF1sp01SVCaG=g4=UKRM23OwYC1LpQSBmwde7j0GugV3R6Fg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 16:02:29 +0100
Message-ID: <CAJTo0LY8kj9EKXdZ5Lummhm1w=UKV4h3sfcHy+sY6+4qZFswxQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 May 2017 15:02:50 -0000
Content-Type: multipart/alternative; boundary="001a114fde72fdfc29055032476c"

--001a114fde72fdfc29055032476c
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 15:48, Khem Raj <raj.khem@gmail.com> wrote:

> no its better, it reintroduced the deps and this time also on libgcc
> which probably was latent. it worked because someone else pulled
> libgcc into image. can you check readelf -d | grep DT_NEEDED output
> from bins/solibs in db package. ?
>

Using --tag=CC:

$ readelf -d libdb.so |grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
$ readelf -d libdb_cxx.so |grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

Using --tag=CXX:

$ readelf -d libdb.so |grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
$ readelf -d libdb_cxx.so |grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

Ross

--001a114fde72fdfc29055032476c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 15:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><div id=3D"gmail-:18o" class=3D"gmail-a3s gmail-aXjC=
H gmail-m15c35c87f3aa027d">no its better, it reintroduced the deps and this=
 time also on libgcc<br>
which probably was latent. it worked because someone else pulled<br>
libgcc into image. can you check readelf -d | grep DT_NEEDED output<br>
from bins/solibs in db package. ?</div></blockquote></div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Using --tag=3DCC:</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_extra">$ readelf -d libdb.so |grep NEEDED</div><div class=3D"gmail_extr=
a">=C2=A00x0000000000000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Shared library: [libpthread.so.0]</div><div class=3D"gmail_extra">=C2=
=A00x0000000000000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sh=
ared library: [libc.so.6]</div><div class=3D"gmail_extra">$ readelf -d libd=
b_cxx.so |grep NEEDED<br></div><div class=3D"gmail_extra">=C2=A00x000000000=
0000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: =
[libpthread.so.0]</div><div class=3D"gmail_extra">=C2=A00x0000000000000001 =
(NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libgcc_=
s.so.1]</div><div class=3D"gmail_extra">=C2=A00x0000000000000001 (NEEDED) =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libc.so.6]</div>=
<div class=3D"gmail_extra"><br></div></div>Using --tag=3DCXX:</div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_extra">$ readelf -d libdb.so |gr=
ep NEEDED<br></div><div class=3D"gmail_extra">=C2=A00x0000000000000001 (NEE=
DED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libpthread.=
so.0]</div><div class=3D"gmail_extra">=C2=A00x0000000000000001 (NEEDED) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libstdc++.so.6]</di=
v><div class=3D"gmail_extra">=C2=A00x0000000000000001 (NEEDED) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libgcc_s.so.1]</div><div c=
lass=3D"gmail_extra">=C2=A00x0000000000000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Shared library: [libc.so.6]</div><div class=3D"gmail_=
extra">$ readelf -d libdb_cxx.so |grep NEEDED</div><div class=3D"gmail_extr=
a">=C2=A00x0000000000000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Shared library: [libpthread.so.0]</div><div class=3D"gmail_extra">=C2=
=A00x0000000000000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sh=
ared library: [libstdc++.so.6]</div><div class=3D"gmail_extra">=C2=A00x0000=
000000000001 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared libr=
ary: [libgcc_s.so.1]</div><div class=3D"gmail_extra">=C2=A00x00000000000000=
01 (NEEDED) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shared library: [libc=
.so.6]</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div></div>

--001a114fde72fdfc29055032476c--

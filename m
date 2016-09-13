Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id CAEAA771E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 19:33:20 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id r192so11740645ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 12:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6V3VxER8iiR95/8H+Hmv5PFgQhacrzOEFWnoGvNlBkg=;
	b=dtB6ILBfya84eEBk/UVYqY9JDCATg9sNPBOlYvlrPoI4gKp6BlcBpO2kZGzTu2pB7P
	IKuRmcZ9wUSJGl1ec5hrtP5IhcbxG587Cr+xZvn7kcMeSTWAHDu44mBQhRqpbfyLdcDP
	h40A4acsHzA1noghDNERMaeZ7wuGcLEbSy6ibTy4JNMEW8C0xXJv4CyMvxYlEVYPvI4F
	f70paQHgFBw69MeNb6mTSeO+WW7SvDv703glHx92/BQdRcaVN2MRpNmcbKvSgjnrQIQ5
	0cv9qMC1brkhkuPYFTKNa5uFlsCUCL0QluceDO1ruW7k7vrGOb7M/jisqpVUKTd5orJb
	5oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6V3VxER8iiR95/8H+Hmv5PFgQhacrzOEFWnoGvNlBkg=;
	b=VGNFdARTC+IIJKvrPNsdyuJJfiqqQPI7ick7Q9Vph085QwqInqSkobGA+N6FIaEVUf
	BoIw0QKSzAZ7POnk6vRDV9XLyr80/sXWFXX1Apbw7dc5/6SKdkgkhfZv4Frd0Uyi1Z3X
	9ioF2KNTYHJv5tjXViCEbEANAOzBPCZ6FWM5i0fnJYpgqR5IQkZC0YDjIzO3xa4xDlel
	roZLdcLU26hbpy0q/yf5224BMxGiVYzD6NP7O72ZEX0eqamEQdU6YiIWtujvGs/0Y+N0
	zm61E/NsNMXwa9hQtArwUmgLRdlAEatilZhJIwnyvImnySYBHirRF/baZ1Pb+Pi5C26U
	ZvxA==
X-Gm-Message-State: AE9vXwNzPa9Kun+Ew+hDdGXKRpInoVOTGiEqUqN3vnmGrLJoVtAaOp7DR+WmH81476hpjZvGm+HDJ37y6LzjECLs
X-Received: by 10.107.181.211 with SMTP id e202mr4254274iof.99.1473795200928; 
	Tue, 13 Sep 2016 12:33:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Tue, 13 Sep 2016 12:32:59 -0700 (PDT)
In-Reply-To: <20160912170546.14212-1-Martin.Jansa@gmail.com>
References: <20160912170546.14212-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Sep 2016 20:32:59 +0100
Message-ID: <CAJTo0LZyZEsJuuLahrkT3VcQP0=UfXeJk9cX2hZLuwRpWBJpNQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@lge.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking][PATCH] cmake-native: add dependency on openssl-native libidn-native
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
X-List-Received-Date: Tue, 13 Sep 2016 19:33:24 -0000
Content-Type: multipart/alternative; boundary=001a11443fb06c67b9053c68afe5

--001a11443fb06c67b9053c68afe5
Content-Type: text/plain; charset=UTF-8

On 12 September 2016 at 18:05, Martin Jansa <martin.jansa@gmail.com> wrote:

> +DEPENDS += "bzip2-native zlib-native openssl-native libidn-native"
>

So this is coming from the embedded fork of curl inside cmake, which is
optional and likely has more dependencies that we didn't yet notice.  How
about adding a dependency on curl-native instead?

I've a few changes that end up adding curl-native to cmake-native.  Using
Markus's magic buildstats-diff script which he totally should submit to
oe-core:

  PKG                      TASK                 ABSDIFF    RELDIFF
CPUTIME1    CPUTIME2
  cmake-native             do_compile            -19.4s      -3.8%
510.6s -> 491.3s
  cmake-native             do_configure          -18.1s     -11.7%
155.3s -> 137.2s
  xz-native                do_configure           -3.6s     -20.6%
 17.6s -> 14.0s
  m4-native                do_configure           -1.5s      -7.3%
 20.5s -> 19.0s
++openssl-native           do_configure           +3.3s      +inf%
0.0s -> 3.3s
  cmake-native             do_unpack              +3.4s    +118.8%
2.8s -> 6.2s
++openssl-native           do_unpack              +3.6s      +inf%
0.0s -> 3.6s
++bzip2-native             do_configure           +4.9s      +inf%
0.0s -> 4.9s
++curl-native              do_unpack              +4.9s      +inf%
0.0s -> 4.9s
++makedepend-native        do_configure           +7.3s      +inf%
0.0s -> 7.3s
++xproto-native            do_configure           +7.6s      +inf%
0.0s -> 7.6s
++curl-native              do_compile            +20.2s      +inf%
0.0s -> 20.2s
++pkgconfig-native         do_compile            +20.5s      +inf%
0.0s -> 20.5s
++pkgconfig-native         do_configure          +32.3s      +inf%
0.0s -> 32.3s
++openssl-native           do_install            +38.0s      +inf%
0.0s -> 38.0s
++curl-native              do_configure          +48.8s      +inf%
0.0s -> 48.8s
++openssl-native           do_compile           +121.9s      +inf%
0.0s -> 121.9s

Cumulative Time
769.3s -> 1065.4s

cmake builds faster because it is using more libraries from the sysroot,
but we now need to build more pieces to get cmake-native building.   Your
patch is slightly faster (total time of 1023 seconds) but with less
determinism, which is an acceptable tradeoff as far as I'm concerned.

Ross

--001a11443fb06c67b9053c68afe5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 September 2016 at 18:05, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div>+DEPENDS +=3D &quot;bzip2-n=
ative zlib-native openssl-native libidn-native&quot;<br></div></blockquote>=
</div><br>So this is coming from the embedded fork of curl inside cmake, wh=
ich is optional and likely has more dependencies that we didn&#39;t yet not=
ice.=C2=A0 How about adding a dependency on curl-native instead?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ve a few c=
hanges that end up adding curl-native to cmake-native.=C2=A0 Using Markus&#=
39;s magic buildstats-diff script which he totally should submit to oe-core=
:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div=
 class=3D"gmail_extra">=C2=A0 PKG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ABSDIFF =C2=A0 =C2=A0RELDIFF =C2=A0 CPUTIME1 =C2=A0 =
=C2=A0CPUTIME2</div><div class=3D"gmail_extra">=C2=A0 cmake-native =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_compile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-19.4s =C2=A0 =C2=A0 =C2=A0-3.8% =C2=A0 =C2=A0 510.6s -&gt; 49=
1.3s</div><div class=3D"gmail_extra">=C2=A0 cmake-native =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 do_configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-18=
.1s =C2=A0 =C2=A0 -11.7% =C2=A0 =C2=A0 155.3s -&gt; 137.2s</div><div class=
=3D"gmail_extra">=C2=A0 xz-native =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0do_configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -3.6s =C2=A0 =
=C2=A0 -20.6% =C2=A0 =C2=A0 =C2=A017.6s -&gt; 14.0s</div><div class=3D"gmai=
l_extra">=C2=A0 m4-native =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0do_configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1.5s =C2=A0 =C2=A0 =
=C2=A0-7.3% =C2=A0 =C2=A0 =C2=A020.5s -&gt; 19.0s</div><div class=3D"gmail_=
extra">++openssl-native =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_configure =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +3.3s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=
=A0 =C2=A0 0.0s -&gt; 3.3s</div><div class=3D"gmail_extra">=C2=A0 cmake-nat=
ive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_unpack =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+3.4s =C2=A0 =C2=A0+118.8% =C2=A0 =C2=A0 =C2=
=A0 2.8s -&gt; 6.2s</div><div class=3D"gmail_extra">++openssl-native =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_unpack =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+3.6s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt=
; 3.6s</div><div class=3D"gmail_extra">++bzip2-native =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 do_configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +4.9s =
=C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt; 4.9s</div><div cl=
ass=3D"gmail_extra">++curl-native =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0do_unpack =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+4.9s =C2=
=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt; 4.9s</div><div class=
=3D"gmail_extra">++makedepend-native =C2=A0 =C2=A0 =C2=A0 =C2=A0do_configur=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +7.3s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0=
 =C2=A0 =C2=A0 0.0s -&gt; 7.3s</div><div class=3D"gmail_extra">++xproto-nat=
ive =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_configure =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +7.6s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s=
 -&gt; 7.6s</div><div class=3D"gmail_extra">++curl-native =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_compile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+20.2s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt; =
20.2s</div><div class=3D"gmail_extra">++pkgconfig-native =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 do_compile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+20.5s =C2=
=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt; 20.5s</div><div clas=
s=3D"gmail_extra">++pkgconfig-native =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_configu=
re =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+32.3s =C2=A0 =C2=A0 =C2=A0+inf% =C2=
=A0 =C2=A0 =C2=A0 0.0s -&gt; 32.3s</div><div class=3D"gmail_extra">++openss=
l-native =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_install =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0+38.0s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 =
0.0s -&gt; 38.0s</div><div class=3D"gmail_extra">++curl-native =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_configure =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+48.8s =C2=A0 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt; =
48.8s</div><div class=3D"gmail_extra">++openssl-native =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 do_compile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +121.9s =C2=A0=
 =C2=A0 =C2=A0+inf% =C2=A0 =C2=A0 =C2=A0 0.0s -&gt; 121.9s</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cumulative Time</div>=
<div class=3D"gmail_extra">769.3s -&gt; 1065.4s</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">cmake builds faster because it is=
 using more libraries from the sysroot, but we now need to build more piece=
s to get cmake-native building. =C2=A0 Your patch is slightly faster (total=
 time of 1023 seconds) but with less determinism, which is an acceptable tr=
adeoff as far as I&#39;m concerned.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div></div>

--001a11443fb06c67b9053c68afe5--

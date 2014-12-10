Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0785F7163F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 12:27:24 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id f51so1960404qge.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 04:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nzpXJbaeG6k36gkQ+PidfIwlnY0BDr0DMVl1PJfVSgs=;
	b=B8bc8ZVSOg515QVj9CWK41umESzeIOcyOEIW/IPCvf94k4Sp8Bg7877eaAg8azb9x3
	aX4hZFCCbvkymICmvCw00NIuSUeDqxWvNH1eRJ28EJjdpn6oOiHPcCKe8jDzi8Le9OSP
	bEF+uKHysMnhMK7s9sN55yFuCCD0zsehA71ZzFSD+k4/MN7hfxT1P/oMKwKaauGTFq4P
	W2xuYkpFVWqQBS7NXZdxn3r5Q0OUS0uItgxJKaMF2UPa0X+e2WyLZO/KMASxt8jpnbV9
	GWWvVUdekwE1a7sYzVF99nXaR8ke6CJhizqICCxovo8+6NT+m0HlWa+Y4q36HBnwTHkt
	rxnQ==
X-Gm-Message-State: ALoCoQmdMRjCBLlcJUcp/mk0lWv2LK+N/5Jse9lW6azpgo/Tfb7R+nFETENxhSYJiGT264ECmUt4
X-Received: by 10.229.190.71 with SMTP id dh7mr7939722qcb.5.1418214445289;
	Wed, 10 Dec 2014 04:27:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 10 Dec 2014 04:27:05 -0800 (PST)
In-Reply-To: <5487A463.4000100@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
	<CAJTo0LZUZLN5BoMcPGhdE4+bzOmcW5U6HEfJC0iM9i=kq4vUOQ@mail.gmail.com>
	<548654DF.1010301@windriver.com>
	<CAJTo0LYU0nsiL1dhNYfreEXhAkedL_wCHAH3uaWOMwmtfmpUkw@mail.gmail.com>
	<5487A463.4000100@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Dec 2014 12:27:05 +0000
Message-ID: <CAJTo0LYvZmjnoHuQVvZyypiNEmb0ZwDwAK3Zk8=ccbZp6Ti0nQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] packagegroup-core-tools-profile: remove sysprof for aarch64
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
X-List-Received-Date: Wed, 10 Dec 2014 12:27:30 -0000
Content-Type: multipart/alternative; boundary=001a11336ab63a5a0e0509dbc879

--001a11336ab63a5a0e0509dbc879
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 01:39, Kang Kai <Kai.Kang@windriver.com> wrote:

> I think I misunderstood you. Do you mean update like this:
>
> SYSPROF = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '',
> d)}"
> SYSPROF_aarch64 = ""
>
> RRECOMMENDS_${PN} = "\
>       ... \
>      ${SYSPROF} \
>
> "
>
> I'll update it.
>

Yep, that's it.

Ross

--001a11336ab63a5a0e0509dbc879
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 01:39, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2nj" class=3D=
"a3s" style=3D"overflow:hidden">I think I misunderstood you. Do you mean up=
date like this:<br>
<br>
SYSPROF =3D &quot;${@bb.utils.contains(&#39;DISTRO_<u></u>FEATURES&#39;, &#=
39;x11&#39;, &#39;sysprof&#39;, &#39;&#39;, d)}&quot;<br>
SYSPROF_aarch64 =3D &quot;&quot;<br>
<br>
RRECOMMENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 ... \<br>
=C2=A0 =C2=A0 =C2=A0${SYSPROF} \<br>
<br>
&quot;<br>
<br>
I&#39;ll update it.<br></div></blockquote></div><br>Yep, that&#39;s it.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11336ab63a5a0e0509dbc879--

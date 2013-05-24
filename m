Return-Path: <cazfi74@gmail.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id DF99160974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 22:17:22 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id 12so3448381vbf.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oFH1F5+0nQInPEermNevD5OrOQnBN1xezeQYlrZTkaw=;
	b=z6lwr9Zxx2smAvPpNRhRJkcdm5iupEVxdcPn8iABiCqORt5b5q8L4nAYFUoSwKc16Y
	Xx4zE1X2PY4uYy1ceiSXCuoS+pGDrjf7IN3ezb2FSpYzxWy6vjLIqH12oaHbj1XmpImD
	vUfy98MrVXWcZFyhB6bfbcKUPL/YzBfN5h8KE6++/mmh/zTG/+klYvu6G0H+cX+Fd751
	pc3hepMPtTdUF6wQnig/h0ewhY+9TBwTT8fBMX4Up1pYpVuAX4n75kez8tq1qXWJp1Ng
	XW/StsA/KMRVhizvYQ3/7zK1QV7VDrgFj6BgwFmOjIfbfOA3u87vo0uyWBryurjBTnjC
	LlkQ==
MIME-Version: 1.0
X-Received: by 10.59.12.106 with SMTP id ep10mr7130992ved.47.1369433843056;
	Fri, 24 May 2013 15:17:23 -0700 (PDT)
Received: by 10.58.207.138 with HTTP; Fri, 24 May 2013 15:17:23 -0700 (PDT)
In-Reply-To: <CAJTo0LZqh=GWQCQDEMGYm2HVzguoUoJVvLsAtiBLKkB64O6zkA@mail.gmail.com>
References: <cover.1369381416.git.cazfi74@gmail.com>
	<CAJTo0LZqh=GWQCQDEMGYm2HVzguoUoJVvLsAtiBLKkB64O6zkA@mail.gmail.com>
Date: Sat, 25 May 2013 01:17:23 +0300
Message-ID: <CAF6bG8c=b8+AXZgr70R9ZrWowDq_A8htBXgywPCuEP7EOY22GA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Low-hanging updates
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
X-List-Received-Date: Fri, 24 May 2013 22:17:23 -0000
Content-Type: multipart/alternative; boundary=047d7bd75540c24b7004dd7e2999

--047d7bd75540c24b7004dd7e2999
Content-Type: text/plain; charset=UTF-8

On 24 May 2013 15:42, Burton, Ross <ross.burton@intel.com> wrote:

> On 24 May 2013 08:58, Marko Lindqvist <cazfi74@gmail.com> wrote:
> >   freetype: update to upstream version 2.4.12
> >   harfbuzz: update to upstream version 0.9.17
> >   gtk+: update to upstream version 2.24.18
> >   curl: update to upstream version 7.30.0
> >   zlib: update to upstream version 1.2.8
>
> I'd prefer to see zlib using .xz instead of .gz for size/speed, but
> apart from that:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>.
>
> Ross


 Right. I had missed that it's available with several compressions. I'll
make updated version of that patch to next set.


 - ML

--047d7bd75540c24b7004dd7e2999
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 May 2013 15:42, Burton, Ross <span dir=3D"ltr">&lt;<=
a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 24 May 2013 08:58, Mark=
o Lindqvist &lt;<a href=3D"mailto:cazfi74@gmail.com">cazfi74@gmail.com</a>&=
gt; wrote:<br>

&gt; =C2=A0 freetype: update to upstream version 2.4.12<br>
&gt; =C2=A0 harfbuzz: update to upstream version 0.9.17<br>
&gt; =C2=A0 gtk+: update to upstream version 2.24.18<br>
&gt; =C2=A0 curl: update to upstream version 7.30.0<br>
&gt; =C2=A0 zlib: update to upstream version 1.2.8<br>
<br>
</div>I&#39;d prefer to see zlib using .xz instead of .gz for size/speed, b=
ut<br>
apart from that:<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross</font></span></blockquote></div><br></div><div class=3D"gmail_extra">=
=C2=A0Right. I had missed that it&#39;s available with several compressions=
. I&#39;ll make updated version of that patch to next set.<br><br><br></div=
><div class=3D"gmail_extra">
=C2=A0- ML<br><br></div></div>

--047d7bd75540c24b7004dd7e2999--

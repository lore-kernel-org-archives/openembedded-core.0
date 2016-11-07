Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2068A6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 09:21:34 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id w33so83199167qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 01:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oSKn0Ck6Z7jmSmpJhsJ6HvuujeGfLowc9yRnWNymwpE=;
	b=Twg3MVDaaUxj3SzDavlu8MqpD73kq9Q8uUpExqbrPnbOyUr/kf/ZtYfSU+WKKhcVy2
	EZAM+2pwNh/Oo3zqxfo19aoul627WA6k6EerQQfFAryfreChvL5G58e1wyDtb/5tfjqi
	iekEci/DfixJM0EDMfjs3Pql5ChK70fVwi9GUgvpPXaUhM0WTnQ66vpfTsz3S2IbxcdB
	zNpjL248SBitJifaHwKd9E/f4dj1ofiNHWuQnF2Gc5DFFQ4K13NY2C+/c9jgpgOM5v0S
	nHJ2wLzkAzsCMXdwU7pF76itrTNqns7jmyd+vlvT6V5pXDYUhdlpWwrNF520PwVSROQR
	gScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oSKn0Ck6Z7jmSmpJhsJ6HvuujeGfLowc9yRnWNymwpE=;
	b=jU3FjTDdrgeuE8iURA7HIp01zLWWKo6FQRer+5NhHMnm93gDDKlvt6258O3BsyR5Ow
	KvjM55AQh8N0OnksSvr5UfBArNKsWI/qyOb/tqqzwWWh+Mz/262PLE9Yt7QDoAKnPPe5
	ALtDc32Xo6hI6rj1QB/qoYq11SXAP+3QAYiTBbUSUEvlzVW1aHt7l0B0xd+jrtkbC27u
	hh9PKRGVe8pvmTENYgsGrwxuyDjo0pUfYxm/aSLsa+NNb7z6Kz1v3Lds+zvDOJUoiH4e
	XGWId6BM0lhpI4ILijdYmvIv4oO8WX81dL/QTWiVeF2UkG0a4bqgWz6Qii3ZGqQFf/Mr
	j6Yg==
X-Gm-Message-State: ABUngvc2hNDbdlpsA8zotJbsV9/MH+3T8t6emWyoQPSM1G+aSeHURqQiB2ZgTcxCpDgzYNra37g9t9a+pkFrzveD
X-Received: by 10.237.37.60 with SMTP id v57mr5800963qtc.135.1478510495968;
	Mon, 07 Nov 2016 01:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 01:21:15 -0800 (PST)
In-Reply-To: <d0e0e5d4c0fb820f9917735e384e55eac602b587.1478323482.git.dengke.du@windriver.com>
References: <cover.1478323482.git.dengke.du@windriver.com>
	<d0e0e5d4c0fb820f9917735e384e55eac602b587.1478323482.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 09:21:15 +0000
Message-ID: <CAJTo0LZBTSZjPQyTK67=3Oe2YAZnFRKBWZiqywutoF7cv=rs8A@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] trace-cmd: fix QA warning
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
X-List-Received-Date: Mon, 07 Nov 2016 09:21:35 -0000
Content-Type: multipart/alternative; boundary=001a114125e0e8c57c0540b28ca9

--001a114125e0e8c57c0540b28ca9
Content-Type: text/plain; charset=UTF-8

On 5 November 2016 at 05:29, Dengke Du <dengke.du@windriver.com> wrote:

> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[audit] = ",,audit"
> +
>  EXTRA_OEMAKE = "\
>      'prefix=${prefix}' \
>      'bindir=${bindir}' \
> @@ -20,6 +23,7 @@ EXTRA_OEMAKE = "\
>      'libdir=${@oe.path.relative(prefix, libdir)}' \
>      \
>      NO_PYTHON=1 \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'audit', '', 'NO_AUDIT=1', d)}
> \
>  "
>

A neater way of doing this would be:

PACKAGECONFIG ??= ""
PACKAGECONFIG[audit] = ',NO_AUDIT=1,audit'
EXTRA_OECMAKE = ".... ${PACKAGECONFIG_CONFARGS}"

This works as the PACKAGECONFIG expansion adds the active expressions to
PACKAGECONFIG_CONFARGS, so you can add that directly to EXTRA_OEMAKE.

Ross

--001a114125e0e8c57c0540b28ca9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2016 at 05:29, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1sg" class=3D"gmail=
-a3s gmail-aXjCH gmail-m158330fcb48b8c32">+PACKAGECONFIG ??=3D &quot;&quot;=
<br>
+PACKAGECONFIG[audit] =3D &quot;,,audit&quot;<br>
+<br>
=C2=A0EXTRA_OEMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&#39;prefix=3D${prefix}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&#39;bindir=3D${bindir}&#39; \<br>
@@ -20,6 +23,7 @@ EXTRA_OEMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&#39;libdir=3D${@oe.path.relative(<wbr>prefix, libdir)}=
&#39; \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0NO_PYTHON=3D1 \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;audi=
t&#39;, &#39;&#39;, &#39;NO_AUDIT=3D1&#39;, d)} \<br>
=C2=A0&quot;</div></blockquote></div><br>A neater way of doing this would b=
e:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">PAC=
KAGECONFIG ??=3D &quot;&quot;</div><div class=3D"gmail_extra">PACKAGECONFIG=
[audit] =3D &#39;,NO_AUDIT=3D1,audit&#39;</div><div class=3D"gmail_extra">E=
XTRA_OECMAKE =3D &quot;.... ${PACKAGECONFIG_CONFARGS}&quot;</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This works as the PAC=
KAGECONFIG expansion adds the active expressions to PACKAGECONFIG_CONFARGS,=
 so you can add that directly to EXTRA_OEMAKE.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114125e0e8c57c0540b28ca9--

Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3B12C65C9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:28:44 +0000 (UTC)
Received: by qkfe185 with SMTP id e185so7608866qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uyTp/mlmJdEYMefTWdJc41p3MeIXKGVE0nYBKJIxtkE=;
	b=NwK/wHu7tGSGF3SiuJSY08WaoBEO7zPNUltT+JUqFSThtbZaxH3zVFL4Y+JppmVSxy
	rCnfATmbAZ3ASvpLm7sTTD/E4c2r0dtfdGwMW/W+bJaucysxAQ6HqjcqmzQgwHY4gtv8
	l3ONzX1N9aSMYXZEx7ZECOmjj/KkpMIsqgpvajP+6O23m0mIwLLVDOXBYfRzvw/SWGEw
	0V4JeBOKVKZmccBFQyNJyOCOZ93WrsX52re2Gnz4W014ENa6UI+WxpCXPhw0p2E/Tvlq
	MaISP4kF5g/bfQHxwXDW21lhE+E++ZvnpDn5K1nTSCHxP+Tq730DYOEDyQHytdd2bE71
	XtCQ==
X-Gm-Message-State: ALoCoQmZ/kqIfovuUo+9o/Mt/Lcx22ii2gyK4uXs2GKRfhq4BSXF+ocgciVNPUxo5/zh4TkyMK7L
X-Received: by 10.55.23.218 with SMTP id 87mr37395107qkx.36.1435076925551;
	Tue, 23 Jun 2015 09:28:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 23 Jun 2015 09:28:26 -0700 (PDT)
In-Reply-To: <97b3f2e7b6b28d7540a1f69c65c319e4775e936f.1435022780.git.akuster808@gmail.com>
References: <cover.1435022780.git.akuster808@gmail.com>
	<97b3f2e7b6b28d7540a1f69c65c319e4775e936f.1435022780.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jun 2015 17:28:26 +0100
Message-ID: <CAJTo0LZGNuW-7PjXY5PubOsnok_J8suFD53sy9JY8E80KHyXuQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Tue, 23 Jun 2015 16:28:48 -0000
Content-Type: multipart/alternative; boundary=001a114694845f8d5a051931e229

--001a114694845f8d5a051931e229
Content-Type: text/plain; charset=UTF-8

On 23 June 2015 at 02:37, Armin Kuster <akuster808@gmail.com> wrote:

> +PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
>

Also add --disable-openssl-compatibility (and remove the redundant trailing
commas).

+PACKAGECONFIG[libind] = "--with-idn,--without-idn, libidn"
>

The flag name has a typo.

Ross

--001a114694845f8d5a051931e229
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 June 2015 at 02:37, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1a7" class=3D"a3s=
" style=3D"overflow:hidden">+PACKAGECONFIG[openssl_compat] =3D &quot;--enab=
le-openssl-compatibility,,&quot;<br></div></blockquote><div><br></div><div>=
Also add --disable-openssl-compatibility (and remove the redundant trailing=
 commas).</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1a=
7" class=3D"a3s" style=3D"overflow:hidden">
+PACKAGECONFIG[libind] =3D &quot;--with-idn,--without-idn, libidn&quot;</di=
v></blockquote><div><br></div><div>The flag name has a typo.</div><div><br>=
</div><div>Ross=C2=A0</div></div></div></div>

--001a114694845f8d5a051931e229--

Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id D1F68763F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 19:46:02 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so1924860qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 12:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nnxfPLc56LpmFNpEsccQUiPCgO0vKx3RixOFxrn/ouQ=;
	b=EU703me5XDYP6l1SE4JF6T9NVeLEfGdJ7OePBkYyHrSIvWo0JP7QoB0L3G878jNGI3
	ZS/f72g3AK62U0Dtsgr7lSXLVPFWwJTU5NXfMykS4Jcn3VAFRhR3h+WvYPMMrUkkbnXY
	fIzF1DZEwAPw3eX9Nv0x66lV2h5dcaTkEHdDAqVqqrod/dWF8NWI4Fk1fnaC2mpHKh1g
	THet9PIZRz8t8fCZde123TxWgN8j0ClIXlr4PGLGMVxa7radNVpq1iAa1UX6F9aRnQB2
	SQdN3FKIJOQ8puSeXmebKN2QCGWmbJhzVV0meKyzQPtpf7x/zxrF7/ciFmSx80VZ707e
	FY6A==
X-Gm-Message-State: ALoCoQk3RyBCk2G5YFGld27ldimYTLT6UWpOcMrhGEra+1N9gy3W3qdzgHmy2nZY7E8UsDnpaQt3
X-Received: by 10.55.43.95 with SMTP id r92mr51301386qkh.67.1438112762153;
	Tue, 28 Jul 2015 12:46:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 12:45:42 -0700 (PDT)
In-Reply-To: <1438110674-25138-1-git-send-email-jslater@windriver.com>
References: <1438110674-25138-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 20:45:42 +0100
Message-ID: <CAJTo0LYrj4yAgwUA6KX849S-kRsk-xZca4gvy8nS8VmM671ocw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss: advance to version 3.19.1
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
X-List-Received-Date: Tue, 28 Jul 2015 19:46:03 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dc55e57a051bf4b825

--001a1147b8dc55e57a051bf4b825
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 20:11, Joe Slater <jslater@windriver.com> wrote:

> +# override value in nss.inc
> +#
> +LIC_FILES_CHKSUM =
> "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
> +
> file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
> +
> file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
>

Having a separate inc file really helps with clear recipes doesn't it...
<gripe mode off>

According to the layer index there's only one recipe for NSS, so how about
we just ditch the nss.inc?

Ross

--001a1147b8dc55e57a051bf4b825
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 20:11, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jslater@windriver.com" target=3D"_blank">jslater@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2xj" class=3D"a3s=
" style=3D"overflow:hidden">+# override value in nss.inc<br>
+#<br>
+LIC_FILES_CHKSUM =3D &quot;file://nss/COPYING;md5=3D3b1e88e1b9c0b5a4b2881d=
46cce06a18 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://nss/lib/freebl/mpi/doc/LICENSE;md5=3D491f158d09d948466afce85d6f1fe18f \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=3D5d425c8f3157dbf212db2ec53d9e513=
2&quot;</div></blockquote></div><br>Having a separate inc file really helps=
 with clear recipes doesn&#39;t it...</div><div class=3D"gmail_extra">&lt;g=
ripe mode off&gt;</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">According to the layer index there&#39;s only one recipe for NS=
S, so how about we just ditch the nss.inc?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147b8dc55e57a051bf4b825--

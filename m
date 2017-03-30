Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id C200677CD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:59 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id p22so36862428qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 04:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GuNQ8Lc9C1sJUtor7BuKy9KlCIGHzTKSUueym7Z5mnE=;
	b=MPimFY6jaE4J3PjxafoKaBiWS/7dLQUFbPE4cEM9I7a8JWnlqljMDt16lCu9+g/kjU
	xWUISUHQd//xvAZ3mh2SBBs40+MANRwJGd6SmPyPIqUNJs/BFHxdeOHzslMchkSIb+pn
	5E6ABjHHSniBMiImtMtC7ewi99vXhOekjJ1ivLn0a/aOsBRbElJ8Z9OLeP0elHs5fMuz
	hQdvm47l/t5RjNueqCJ0AlwB8MXtTuHszFthyP0Ao+3p4ip6RlJnFbZO3c2PFhs2ZMq9
	/e/5q3EtgVh51XWIiJuwzreqrsdWMojnPf6Png9cXn59MauaX53H2JTLeSi+mUIaYsbP
	r2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GuNQ8Lc9C1sJUtor7BuKy9KlCIGHzTKSUueym7Z5mnE=;
	b=jQ73tR4TuL/seXIPLKxkwLtbtXEFCvwtX2HLQDcfNUvvekgscdFot6FgbflBDi1cMS
	jUmULONX/KaVlO1ycMDY8wWcg6PgkcSg9wRUXuIODID1+RctqBVHxjSMY4lUvrwK98Mn
	Ewtjts/ovbP++wMfwqGrpcxR6ScyjfcH8rOJtk75cKnJMx4xdhWoWsZXd0prWRKOc2w5
	N+W0Js6I+0vxTDdUzPXIV33RNPDgbBjhGoMqIlJezHBiuGbm8pWKcxi+sAEQ/CHmCEmJ
	4N4zwS9fkVU3p2vh5OpBYi4ONp/IGrMa0MT1VJ/fmnHBMq/u8HdOTxFEelmOC/RhIP01
	cOWw==
X-Gm-Message-State: AFeK/H33TEhCLBHdn4muCIYqnoe0MG033i+xIgKGL+0S2Q4uKiHBx6PDj6QNR0/Ol/kI+gpF7BZdHejcs+UNBSh1
X-Received: by 10.55.107.196 with SMTP id g187mr2753697qkc.77.1490874360871;
	Thu, 30 Mar 2017 04:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 30 Mar 2017 04:45:40 -0700 (PDT)
In-Reply-To: <20170330063921.31988-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170330063921.31988-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 12:45:40 +0100
Message-ID: <CAJTo0Lbb-TZYaZs+aKMSZEKUAhcN=8n6+bDrq5GjaTxo-Ws-cw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/pkgdata: support musl on unit tests
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
X-List-Received-Date: Thu, 30 Mar 2017 11:46:00 -0000
Content-Type: multipart/alternative; boundary=001a114fe396af561a054bf13c6e

--001a114fe396af561a054bf13c6e
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 07:39, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> +        # recipe-runtime-package relation for virtual/libc provider
> +        Libc = collections.namedtuple('Libc', ['recipe', 'runtime_pkg',
> 'libpath', 'staticdev', 'utils', 'rutils'])
> +        cls.libc = Libc('glibc', 'libc6', '/lib/libc.so.6',
> 'libc6-staticdev', 'glibc-utils', 'lib6-utils')
> +        if get_bb_var('TCLIBC') == 'musl':
> +            cls.libc = Libc('musl', 'musl', '/usr/lib/libc.so',
> 'musl-staticdev', None, None)
>

Instead of all of this, why not just change the tests to use a different
package?  The bulk of them were just using glibc as it's going to be built,
but we've built zlib too so the tests could use that instead.

Ross

--001a114fe396af561a054bf13c6e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2017 at 07:39,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonard=
o.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.go=
nzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":1ew" class=3D"a3s aXjCH m15b1c72b606c2146">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 # recipe-runtime-package relation for virtual/libc provider<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Libc =3D collections.namedtuple(&#39;Libc&#39;=
, [&#39;recipe&#39;, &#39;runtime_pkg&#39;, &#39;libpath&#39;, &#39;staticd=
ev&#39;, &#39;utils&#39;, &#39;rutils&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.libc =3D Libc(&#39;glibc&#39;, &#39;libc6&=
#39;, &#39;/lib/libc.so.6&#39;, &#39;libc6-staticdev&#39;, &#39;glibc-utils=
&#39;, &#39;lib6-utils&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if get_bb_var(&#39;TCLIBC&#39;) =3D=3D &#39;mu=
sl&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.libc =3D Libc(&#39;musl&#39;=
, &#39;musl&#39;, &#39;/usr/lib/libc.so&#39;, &#39;musl-staticdev&#39;, Non=
e, None)<br></div></blockquote></div><br>Instead of all of this, why not ju=
st change the tests to use a different package?=C2=A0 The bulk of them were=
 just using glibc as it&#39;s going to be built, but we&#39;ve built zlib t=
oo so the tests could use that instead.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a114fe396af561a054bf13c6e--

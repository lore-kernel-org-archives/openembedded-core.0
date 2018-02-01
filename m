Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 60E796FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 19:27:21 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id u62so5598126ita.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 11:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aRQHOqgj3naMFBvS4G8TghIRZ+HjJAgF2kylVHbYQf8=;
	b=NUqOPnIdIvMY3wIFg1uP+z3qT987kJDbgB3kMRWUMze4JNAh9CR78f1z4CyxNNN5R6
	DQ4DVMolFghqsM20MNkZ+RRe0UdZtKkE00DVHMSZZCa7oO6etjURaKsB49CuEP/TL+mv
	zU/c7ssmcq0+owFt/YdCsZDyuc7pY5Rds4qbzCAKPg8WcLM74E7alGYd5Yp26OnOZi09
	sOOmc4B5RjFYJs5ZN2Gk2y8aHLPxrWLWUSuS7EzVEDbvUPun2NPQ2sSu8H2vWXvonc9h
	Zgio0NkxZVFEUMMZGd/uQOBIB7QxGFz7sab9EzhvuEef1KIvgyvJvpqeGN7sPwO1pALE
	IR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aRQHOqgj3naMFBvS4G8TghIRZ+HjJAgF2kylVHbYQf8=;
	b=CT+KdAoDDhxnu3SFA478yir+wxfowoghjTjFJhOz1Fd2jnuH3gOcBVjBd5IgOiEgwR
	5zGUe/Yt1swANupyIYGrBh4cXv8zv/btckBv0ylDNvqHgLBJmEEBii2AXVa6tmH0Z31u
	m8yvteO7aHP8FDbbauJRoWYidSfXu67xoNoujsNqvJR9uTvRMfqnzeFSG8NN9ylQ3vE1
	ySG0b5gWlXTyWX+uoqzZo0K0XY0WBj7blQQWkFAynq8HDZN99B5IgwcHRSEs8MDqAcmP
	L7wO67hyrQ8iVpuRBOlDV0GFPwxSBRIb/31bAQWEgUwV8fCx9KpH4a8pxcytzchHCu6e
	AjqA==
X-Gm-Message-State: AKwxytdEE7kujHhbt4OfwYTbHlsTkEbJti408IvQtVWg5ZuBAHrulZKV
	3KuGxL5xuVR+ni6we8Yqzv1L8WdIO5TiSRJ2h1N4Ig==
X-Google-Smtp-Source: AH8x226R7YWuUN6xaO/l1poNoyIy9kEbxi/voSCnfVp2tFR+Pwj95BUe9HDtT+gcFVYokX2z64GkUHFUL47iOnZ4Lt0=
X-Received: by 10.36.215.69 with SMTP id y66mr41836911itg.10.1517513243199;
	Thu, 01 Feb 2018 11:27:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 11:27:02 -0800 (PST)
In-Reply-To: <df3d49ef2f1fa5243b2e8d430a7edfa956cc9f8d.1515744181.git.hongxu.jia@windriver.com>
References: <cover.1515744181.git.hongxu.jia@windriver.com>
	<df3d49ef2f1fa5243b2e8d430a7edfa956cc9f8d.1515744181.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 19:27:02 +0000
Message-ID: <CAJTo0LZ_Q0KGZFg1u-Noky+hhz1yDfU6axX9ZdA1Rj07fQW8ng@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] python3-core: improve reproducibility
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
X-List-Received-Date: Thu, 01 Feb 2018 19:27:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc44cda18505642b9526"

--94eb2c0afc44cda18505642b9526
Content-Type: text/plain; charset="UTF-8"

On 12 January 2018 at 08:11, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +       # Recompile _sysconfigdata after modifying it
> +       cd ${PKGD}
> +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
> +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py',
> optimize=1)"
> +       ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
> +            -c "from py_compile import compile;
> compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py',
> optimize=2)"
> +       cd -
>

Do we really need to generate optimise=1 and optimise=2 variants for a file
which is just data?

I'd suggest something like this would be neater:

rm -f ${PKGD}/${libdir}/python*/__pycache__/_sysconfigdata.*
nativepython -m py_compile ${PKGD}/${libdir}/python*/_sysconfigdata.py

Ross

--94eb2c0afc44cda18505642b9526
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 January 2018 at 08:11, Hongxu Jia <span dir=3D"ltr">=
&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.ji=
a@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Recompile _sysconfigdata after modifying it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${PKGD}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN}-nati=
ve/${PYTHON_PN} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${<wbr>PYTHON_MAJMIN}/_sysconfigdat=
a.<wbr>py&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN}-nati=
ve/${PYTHON_PN} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${<wbr>PYTHON_MAJMIN}/_sysconfigdat=
a.<wbr>py&#39;, optimize=3D1)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/${<wbr>PYTHON_PN}-nati=
ve/${PYTHON_PN} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;from py_compile import =
compile; compile(&#39;./${libdir}/python${<wbr>PYTHON_MAJMIN}/_sysconfigdat=
a.<wbr>py&#39;, optimize=3D2)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br></blockquote><div><br></div><div>Do we =
really need to generate optimise=3D1 and optimise=3D2 variants for a file w=
hich is just data?</div><div><br></div><div>I&#39;d suggest something like =
this would be neater:</div><div><br></div><div>rm -f ${PKGD}/${libdir}/pyth=
on*/__pycache__/_sysconfigdata.*</div><div>nativepython -m py_compile ${PKG=
D}/${libdir}/python*/_sysconfigdata.py</div><div><br></div><div>Ross</div><=
/div></div></div>

--94eb2c0afc44cda18505642b9526--

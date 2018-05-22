Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id C4734748A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 01:07:04 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id c41-v6so9804330plj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qJpqSADgt2k1ejOHFZqWDHJ1lX3KJ3F7HQBi7YRgDgo=;
	b=jXFk4iWOlf2Kkv+J5n/Vc75p6wtj6u2Vf5+Kq/eIU6yY5jZaRW4gjgeqskNCz2A6cc
	n5/thOFrvNvCJQ+bLRN7PGB3lTecJJKNN/GTQLrPGTWOUwCAnTqxgjSAdjGKdWVvrmvi
	WWCvDyXhil4s4k376w9KwgSPLn1wdaSoEM/ctH6KM3icTm1e/1CQohDuh2TdNpXbMEma
	WFvirNXTe0DyHgCb3YkM6dmgdFyEkZtHQ+cE/ZXyCldBp3VWBZckSdjnDSMUYsIfKqcF
	7Q4mKsV1++iLIjXKLhqQdpF5fUd2Vr0BM3gBkfdGmSPp4eMZU+Aou7ZRJX/SYf6o6JbM
	mB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qJpqSADgt2k1ejOHFZqWDHJ1lX3KJ3F7HQBi7YRgDgo=;
	b=Kf0XjzCJCdd2Gct1rdtTOb34LNmwnl4jyXIQZ6ExqeS0pA7h7PiRBBexCPy7cxY/Ey
	3+07ZwVi38aKi0QmkPpf0q43Wuz+nV/kwl4KnNzSw4eadeiDxpOR9shjKgBuTiIgpDuG
	25PjsUmzORYyMaBqtTxMzxq65C0jqWYWvl5dIqVTjY5tbgWHGTv4Y4A0H1Vj7JQCGBXs
	LvyQFuUo3BcRotVcNEcwe266jIivotxoQJE9JfIV25mZXMdZ+vrbp/6oCyUEzB46cYeK
	OBw873xShzFjZHEfH+BmY5Q989Px3QQLi3nPdBvTyTGhTBkledmEnQKpXPlggy//cKI3
	uCpA==
X-Gm-Message-State: ALKqPwcGB71aJxvW0kedbk4eq2Aj4rQxFAQDtfeDiWIjvqVJHmtalEG/
	LP3L93A+kF/9ZGfumVugWIHAdXWq3JaJApPZFhc=
X-Google-Smtp-Source: AB8JxZqTdNtijYb4mDDMuY2w6eCD0pPU2B3we+pFI4Aky1ZDkm0cmKmtrWehOqNfPo5ezxnfC3QWcAtekx2xHcOAtA4=
X-Received: by 2002:a17:902:b78a:: with SMTP id
	e10-v6mr22870226pls.260.1526951225412; 
	Mon, 21 May 2018 18:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 21:06:54 -0400
Message-ID: <CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bind update req. new pkg in core
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
X-List-Received-Date: Tue, 22 May 2018 01:07:04 -0000
Content-Type: multipart/alternative; boundary="0000000000006151c4056cc10993"

--0000000000006151c4056cc10993
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 3:44 PM Armin Kuster <akuster808@gmail.com> wrote:

> With this update, the python-ply package is required.
> I copied the one from meta-python to core. Once this hits master,
> I will send a patch to remove the same recipe from
> meta-python.


Can this be turned on/off using packageconfig ?
If so then it would be ideal

If not then please send the removal patches for meta-python regardless so
it can be tested together

>
>
> Armin Kuster (2):
>   bind: update to 9.12.1
>   python3-ply: add package needed by bind 9.12 update
>
>  ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48
> ----------------------
>  ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>  .../bind/bind/dont-test-on-host.patch              | 17 --------
>  .../use-python3-and-fix-install-lib-path.patch     | 36 ----------------
>  .../bind/{bind_9.10.6.bb => bind_9.12.1.bb}        | 21 ++++------
>  meta/recipes-devtools/python/python-ply.inc        | 18 ++++++++
>  meta/recipes-devtools/python/python-ply_3.11.bb    |  2 +
>  10 files changed, 49 insertions(+), 145 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>  delete mode 100644
> meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>  delete mode 100644
> meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.12.1.bb}
> (86%)
>  create mode 100644 meta/recipes-devtools/python/python-ply.inc
>  create mode 100644 meta/recipes-devtools/python/python-ply_3.11.bb
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006151c4056cc10993
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, May 21, 2018 =
at 3:44 PM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster=
808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">With t=
his update, the python-ply package is required.<br>
I copied the one from meta-python to core. Once this hits master,<br>
I will send a patch to remove the same recipe from<br>
meta-python.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can =
this be turned on/off using packageconfig ?</div><div dir=3D"auto">If so th=
en it would be ideal=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If not then please send the removal patches for meta-python regardless s=
o it can be tested together=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Armin Kuster (2):<br>
=C2=A0 bind: update to 9.12.1<br>
=C2=A0 python3-ply: add package needed by bind 9.12 update<br>
<br>
=C2=A0...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---<br>
=C2=A0...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---<br>
=C2=A0.../0001-lib-dns-gen.c-fix-too-long-error.patch=C2=A0 =C2=A0 | 13 +++=
---<br>
=C2=A0.../bind/bind/bind-confgen-build-unix.o-once.patch | 48 -------------=
---------<br>
=C2=A0...-searching-for-json-headers-searches-sysr.patch | 13 +++---<br>
=C2=A0.../bind/bind/dont-test-on-host.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 17 --------<br>
=C2=A0.../use-python3-and-fix-install-lib-path.patch=C2=A0 =C2=A0 =C2=A0| 3=
6 ----------------<br>
=C2=A0.../bind/{<a href=3D"http://bind_9.10.6.bb" rel=3D"noreferrer" target=
=3D"_blank">bind_9.10.6.bb</a> =3D&gt; <a href=3D"http://bind_9.12.1.bb" re=
l=3D"noreferrer" target=3D"_blank">bind_9.12.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 21 ++++------<br>
=C2=A0meta/recipes-devtools/python/python-ply.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 18 ++++++++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python-ply_3.11.bb" re=
l=3D"noreferrer" target=3D"_blank">python-ply_3.11.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 2 +<br>
=C2=A010 files changed, 49 insertions(+), 145 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-b=
uild-unix.o-once.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-h=
ost.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-an=
d-fix-install-lib-path.patch<br>
=C2=A0rename meta/recipes-connectivity/bind/{<a href=3D"http://bind_9.10.6.=
bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.6.bb</a> =3D&gt; <a href=
=3D"http://bind_9.12.1.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.12.1=
.bb</a>} (86%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python-ply.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon-ply_3.11.bb" rel=3D"noreferrer" target=3D"_blank">python-ply_3.11.bb</a=
><br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000006151c4056cc10993--

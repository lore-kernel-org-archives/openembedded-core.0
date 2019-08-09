Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail.openembedded.org (Postfix) with ESMTP id B94CE7F317
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 14:07:05 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id y16so65427608vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=RgkA1BYW/oBnugcQ/pKM4WYQQrtTtcV3oTDUKq/q6s0=;
	b=KkdUaPsGq/p4ZI3Vb1CQDpd1NuNp+oLMhJtyk3vnxOxdwJhtDP3tctyGjGRcpQs3jD
	/t+r12Fs9opd5rlrWu78znnWTrXSMhhdVNBvZFfViOtEjVyNQPT0zNth1065Pa+JM7dX
	qKNCu5vlFWWxKcUg+tWbvjIW5bbShxJNVvzVfu3sKfcoALrQ6gv+nYEg5tKSxEe5tkZn
	dTDX1I/b/ooZ8qTv+F5yb2HXPspFdZ01dkUW8Rj37T0O7T7XpEfF/Q0A2bqYKiPffuLI
	fgITGOuTRGHgwJIGHCoT3XY38jrkHFhsFD/2Dt4a+/GeErSoPlgvG+nMFxro30G55xeC
	RLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=RgkA1BYW/oBnugcQ/pKM4WYQQrtTtcV3oTDUKq/q6s0=;
	b=gyTeTXBbkoOcU4J7vWgpRENIiPx8MHYvKjkcpy5RYp6NRxPQNzW67IkhNjZ80kg9ek
	KUQA8T8CNRo8G80BaJVCmIEiZzPImRSw16Cni/HDlfSJrTAkHbCkItvb1MFIe1iCxQLc
	4Xr1GOyEBBi6fELXEHpJH7RV7wbxu2UawBrGPs1jposv6uC1WwhkeNbv1eJrW8M689Dg
	LbCHCiD+uhftot9YuOMUjLiEjqmLvgPArMIPP5z4kT3NX4WFW8Wjw9Gtk5rB322L53np
	lKIM8VvIjg5cmzEBN+nYgsURtVyC2J+5semi3ow9ekvq52NKuopmS1lzAPOS4vCx5WvE
	ZC3A==
X-Gm-Message-State: APjAAAUnVUhVbREWpQlriv7CTK8k3Ln8wx1nAu+ccsvy2VH09DYy7alw
	YG12MMIHnjEitZaudcMHdk/Da6I84Nro6B5UfIMcUP4f4aw=
X-Google-Smtp-Source: APXvYqwGyMPiz9jjxWCgFmydHki7wwitX3/Pb/R1PTCd+0PUwPZei38MRKQuj81r2zBISO+2UgJCeBgZHsQIFgoR7V4=
X-Received: by 2002:a67:8709:: with SMTP id j9mr12907525vsd.35.1565359626362; 
	Fri, 09 Aug 2019 07:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190809140528.64505-1-alex.kanavin@gmail.com>
In-Reply-To: <20190809140528.64505-1-alex.kanavin@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 16:06:55 +0200
Message-ID: <CANNYZj_jxL9+-c5hfAJNoMyZEma+VZpjrXMLKK4eBNua1C981w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-panads: remove the python 2.x version of the recipe
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
X-List-Received-Date: Fri, 09 Aug 2019 14:07:06 -0000
Content-Type: multipart/alternative; boundary="00000000000079a38e058fafb0e6"

--00000000000079a38e058fafb0e6
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list, will resend :)

Alex

On Fri, 9 Aug 2019 at 16:05, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> As it depends on pathon 2.x Numpy which has been removed from oe-core.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-python.bb | 2 +-
>  .../recipes-devtools/python/python-pandas_0.23.4.bb        | 7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python-pandas_0.23.4.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index e037abf53..42f416346 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -40,7 +40,7 @@ RDEPENDS_packagegroup-meta-python = "\
>      python-sh python-greenlet python-paho-mqtt python-traceback2
> python-gdata python-dbusmock \
>      python-whoosh python-lockfile python-isort python-wtforms
> python-feedparser python-flask-restful \
>      python-pysnmp python-flask-babel python-pytest-tempdir
> python-flask-nav python-pyzmq python-pyyaml \
> -    python-protobuf python-pluggy python-jsonschema python-msgpack
> python-pandas \
> +    python-protobuf python-pluggy python-jsonschema python-msgpack \
>      python-periphery python-pint python-pycryptodome python-yappi
> python-pycrypto python-pretend \
>      python-pyserial python-pyiface python-docutils python-grpcio-tools
> python-django-south \
>      python-backports-functools-lru-cache python-py python-click
> python-flask-migrate \
> diff --git a/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
> b/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
> deleted file mode 100644
> index b3bfab969..000000000
> --- a/meta-python/recipes-devtools/python/python-pandas_0.23.4.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -inherit setuptools
> -require python-pandas.inc
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-future \
> -    ${PYTHON_PN}-json \
> -"
> --
> 2.17.1
>
>

--00000000000079a38e058fafb0e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wrong mailing list, will resend :)</div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 9 Aug 2019 at 16:05, Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">As it depends =
on pathon 2.x Numpy which has been removed from oe-core.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-py=
thon.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</=
a> | 2 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-pandas_0.23.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python-pandas_0.23.4.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 7 -------<br>
=C2=A02 files changed, 1 insertion(+), 8 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python-pandas_0.23.4.bb" rel=3D"noreferrer" target=3D"_blank">python-pa=
ndas_0.23.4.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index e037abf53..42f416346 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -40,7 +40,7 @@ RDEPENDS_packagegroup-meta-python =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python-sh python-greenlet python-paho-mqtt python-trace=
back2 python-gdata python-dbusmock \<br>
=C2=A0 =C2=A0 =C2=A0python-whoosh python-lockfile python-isort python-wtfor=
ms python-feedparser python-flask-restful \<br>
=C2=A0 =C2=A0 =C2=A0python-pysnmp python-flask-babel python-pytest-tempdir =
python-flask-nav python-pyzmq python-pyyaml \<br>
-=C2=A0 =C2=A0 python-protobuf python-pluggy python-jsonschema python-msgpa=
ck python-pandas \<br>
+=C2=A0 =C2=A0 python-protobuf python-pluggy python-jsonschema python-msgpa=
ck \<br>
=C2=A0 =C2=A0 =C2=A0python-periphery python-pint python-pycryptodome python=
-yappi python-pycrypto python-pretend \<br>
=C2=A0 =C2=A0 =C2=A0python-pyserial python-pyiface python-docutils python-g=
rpcio-tools python-django-south \<br>
=C2=A0 =C2=A0 =C2=A0python-backports-functools-lru-cache python-py python-c=
lick python-flask-migrate \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python-p=
andas_0.23.4.bb" rel=3D"noreferrer" target=3D"_blank">python-pandas_0.23.4.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python-panda=
s_0.23.4.bb" rel=3D"noreferrer" target=3D"_blank">python-pandas_0.23.4.bb</=
a><br>
deleted file mode 100644<br>
index b3bfab969..000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python-pandas_0=
.23.4.bb" rel=3D"noreferrer" target=3D"_blank">python-pandas_0.23.4.bb</a><=
br>
+++ /dev/null<br>
@@ -1,7 +0,0 @@<br>
-inherit setuptools<br>
-require python-pandas.inc<br>
-<br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-future \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-json \<br>
-&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000079a38e058fafb0e6--

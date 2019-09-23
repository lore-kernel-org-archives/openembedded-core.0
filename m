Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 109597DE38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:06:21 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id z19so13552128ior.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qnc2fMX0wSMXo+z6TM2s+R3mjdHlsQUEqvqUhsg5yp0=;
	b=G8coXzRUGnLm/7JWkQfnoS4U1LBFUGJnfAqcZl0jJdRpBave4xHpKi9Q8wjfdpbR2U
	6ZZwxyStNoR/SlV/NRH0Xg3pYDWAn9HBALU+4Oc1GuTN1uYyKz4dv58XZhlgVRdjQCkK
	xlkCEBej1gJQt1ia2AQl9p+kzf45bGLfZcQu3OS8eFtBL4ZE+rIiYrlMIiKr0Hhaljde
	MoGBp6GiG7WGsfrf+flrT1q50ydqDf+MrSl73OdAqBBLgcJD/ehTN9df8AR0yVlXmOLU
	pHVkZcmcr6tGKeAWd6JYZ368mj4XQTDlgLXN97prTv8z+zTDgn3DbK60uTdoPjy/DGhY
	HD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qnc2fMX0wSMXo+z6TM2s+R3mjdHlsQUEqvqUhsg5yp0=;
	b=bGurWRaL6B4f+yXQ4RNlVQPuyUeVTsyV9akYHkx0/B+3CZWRfOjNyygI5c4G/jiEen
	fD7L/dr+A9E4jHFtLu7WwOuZWfZm71Ej0XzVJyTY4n2WHlMEs8FyP2cZK3P+4MVtIfnF
	ibMyI+2E7QhYIZK8Bfqy7YdjV6V1jIWVaIDACuaVJnhI0EhsGC1D+s4PJJ3Qjih8leBx
	Cag+gFUYkSMBkM3OO/BO+VTF00PaOJSD7+oa1vVI56AviCvm2IjNg55GYzTRYNBKFkTo
	V3/3MSOSV/Wdncpwwv/Df9YZ2yoNQR0fS+91SgOZseeILbDY37FmBxm3Y32+c53kCOiy
	j4tA==
X-Gm-Message-State: APjAAAVapkvQxNfNnP7rPxMDV5WOGmfFqgPQ9b3Zf1VVzriFk0rX9JDM
	i8Kfe+6PXEqldSsdvs2pyn0m4EGrFv6CfvTt6qA=
X-Google-Smtp-Source: APXvYqzxz8BMKJmhcq58YORhXV/BguFAgyGyQLVrjRMykZXJO6miwZiPTsT0jMf8VidQWsB1VLk8AGkGVvlUGxvcdOk=
X-Received: by 2002:a6b:d307:: with SMTP id s7mr659052iob.39.1569261982917;
	Mon, 23 Sep 2019 11:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155238.31958-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20190923155238.31958-1-Trevor.Gamblin@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 23 Sep 2019 11:06:12 -0700
Message-ID: <CANx9H-A2D-sAhKW7YaXnG0E1wg5odcOWubA=BbqwK85XD6nC7A@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3-subunit: ensure runtime dependencies are present
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
X-List-Received-Date: Mon, 23 Sep 2019 18:06:22 -0000
Content-Type: multipart/alternative; boundary="0000000000000d2a6805933c4736"

--0000000000000d2a6805933c4736
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 8:53 AM Trevor Gamblin <Trevor.Gamblin@windriver.com>
wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Without access to unittest, subunit cannot be imported in python3:
>
>     root@qemux86-64:~# python3
>     Python 3.7.4 (default, Sep 20 2019, 13:38:31)
>     [GCC 9.2.0] on linux
>     Type "help", "copyright", "credits" or "license" for more information.
>     >>> import subunit
>     Traceback (most recent call last):
>       File "<stdin>", line 1, in <module>
>       File "/usr/lib/python3.7/site-packages/subunit/__init__.py", line
> 123, in <module>
>         import unittest
>     ModuleNotFoundError: No module named 'unittest'
>     >>>
>
> Adding python3-testtools to python3-subunit's RDEPENDS fixes the
> issue. This also implicitly provides the functionality found in
> the python3-extras module.
>

If we literally only need unittest, then RDEPENDS on -testtools is
overkill. We only need the -unittest submodule:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158


> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  meta/recipes-devtools/python/python3-subunit_1.3.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
> b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
> index 2ece4451df..55066e2d0f 100644
> --- a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
> +++ b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
> @@ -1,2 +1,4 @@
>  inherit setuptools3
>  require python-subunit.inc
> +
> +RDEPENDS_${PN} = " python3-testtools"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000d2a6805933c4736
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Sep 23, 2019 at 8:53 AM Trevor Gamblin &lt;<a href=
=3D"mailto:Trevor.Gamblin@windriver.com">Trevor.Gamblin@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">From: Trevor Gamblin &lt;=
<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blank">trevor.ga=
mblin@windriver.com</a>&gt;<br>
<br>
Without access to unittest, subunit cannot be imported in python3:<br>
<br>
=C2=A0 =C2=A0 root@qemux86-64:~# python3<br>
=C2=A0 =C2=A0 Python 3.7.4 (default, Sep 20 2019, 13:38:31)<br>
=C2=A0 =C2=A0 [GCC 9.2.0] on linux<br>
=C2=A0 =C2=A0 Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&q=
uot; or &quot;license&quot; for more information.<br>
=C2=A0 =C2=A0 &gt;&gt;&gt; import subunit<br>
=C2=A0 =C2=A0 Traceback (most recent call last):<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 File &quot;/usr/lib/python3.7/site-packages/subunit/__=
init__.py&quot;, line 123, in &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 import unittest<br>
=C2=A0 =C2=A0 ModuleNotFoundError: No module named &#39;unittest&#39;<br>
=C2=A0 =C2=A0 &gt;&gt;&gt;<br>
<br>
Adding python3-testtools to python3-subunit&#39;s RDEPENDS fixes the<br>
issue. This also implicitly provides the functionality found in<br>
the python3-extras module.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If we literally =
only need unittest, then RDEPENDS on -testtools is overkill. We only need t=
he -unittest submodule:</div><div dir=3D"auto"><div><a href=3D"http://git.y=
octoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python=
3/python3-manifest.json#n1158">http://git.yoctoproject.org/cgit/cgit.cgi/po=
ky/tree/meta/recipes-devtools/python/python3/python3-manifest.json#n1158</a=
></div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-subunit_1.3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.bb</a> | 2 +=
+<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-subunit=
_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.bb</a=
> b/meta/recipes-devtools/python/<a href=3D"http://python3-subunit_1.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.bb</a><br>
index 2ece4451df..55066e2d0f 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-subunit_1.3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-subunit_1.3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.3.0.bb</a><br>
@@ -1,2 +1,4 @@<br>
=C2=A0inherit setuptools3<br>
=C2=A0require python-subunit.inc<br>
+<br>
+RDEPENDS_${PN} =3D &quot; python3-testtools&quot;<br>
-- <br>
2.21.0<br>
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

--0000000000000d2a6805933c4736--

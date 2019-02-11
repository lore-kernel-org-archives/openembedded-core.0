Return-Path: <leobsd@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75DF77C409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 23:57:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id b20so528945lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fl81yZgrOyUKPnicqLyyOr9KcAws/8LxwMonDar0b0Y=;
	b=jQj9ry/XB+7MEmMWyEASkv5B6v3yDuKd6SGd/mM2MXndUfJ0XIH88UHjUZp42mUV20
	O6J3HVdsVm37S8MsFhBGmb5rXTaLumJWp7ECj7ALi8K9CPdNn09PNQjbffvMTTEgF4hm
	xmAM4M33hCjEQG+s5LdsDXFrOKSCsQC46E1fKGGZKt6SD0CFHgKMDvz5QaRRCWXB57gr
	eqCHtHyUUUuUraTTuy+TBfmo51Y6GWjB2iGdHFduTax9JeDPEwsUcL2yQfzvcIhp1BTj
	ofpd6WgZUenIgUdw+YjAjNQkmrwYc+E2zuTt9N65ZYKWZW9HM+7VZWvmFcyEGwUzXHY3
	gQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fl81yZgrOyUKPnicqLyyOr9KcAws/8LxwMonDar0b0Y=;
	b=IiiLdo69qNbFr5AYN2z+I10p7mWjg9tWCWOAdX6VsGolNOVqxS7Qn1bv+5fB1dMedp
	94KnBNNnsPJEk8fLOk48IaOoFUloovRlz4fA4TXc1MhJ7qw+cZIMRt5Ek6J7QTZ/iNnb
	UuikSnF2kkzxnVtV6xhKNWyzyFo/SE4e9RZu/8iorHqA8Iw0QiLzPAJoFgGH4YL+47km
	9YaeMAAqESUOaMnMTFbt9ABmg03xLaoDIgr5nbLmiIwgRcHNihevvpmQvmIsu8buZ7NK
	HPdbCanDDuDam+kkmTLGt1ElwiP6nSpn+omxaRiAvuks+M8vBaiMomenwZjIM7h7HQB8
	oNuQ==
X-Gm-Message-State: AHQUAub5rjOZJ2Z0qqnWthCTNJLfmrR2rz9AOUJXrsz7xGxi8s+0wNuY
	n2lIxfktVfQUkex0ynkm4vxUiAHrK4PAMtWFU8Y=
X-Google-Smtp-Source: AHgI3IbLe/NB2Vj69eR146JGcnlTjrhodR3ZClYx4EhSzlXf1ZZLKQHfK1nPH3NGk7uD+8iZtkVfgmxrxhFYjo5Hnuc=
X-Received: by 2002:a19:ee13:: with SMTP id g19mr483553lfb.72.1549929439877;
	Mon, 11 Feb 2019 15:57:19 -0800 (PST)
MIME-Version: 1.0
References: <CANBSh+OySyKjCYzbOnuJXq4fV74E2QKx9ebAsWZOab_ceoevHw@mail.gmail.com>
In-Reply-To: <CANBSh+OySyKjCYzbOnuJXq4fV74E2QKx9ebAsWZOab_ceoevHw@mail.gmail.com>
From: Leonardo Rangel <leobsd@gmail.com>
Date: Mon, 11 Feb 2019 15:56:44 -0800
Message-ID: <CAN7MDW9xH8_PyFoVr6dAOi2LjA6wBrztiQBJ3_TmNt_weKMAgw@mail.gmail.com>
To: William Bourque <wbourque@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] wic/engine.py: Use printf instead of echo
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
X-List-Received-Date: Mon, 11 Feb 2019 23:57:19 -0000
Content-Type: multipart/alternative; boundary="000000000000b0df100581a711a4"

--000000000000b0df100581a711a4
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 11, 2019 at 12:01 PM William Bourque <wbourque@gmail.com> wrote:

> Some distributions default shell (ex: /bin/dash)
> does not support "-e" argument to echo.
> Hence, using "printf" is safer as it, unlike echo,
> always inteprets \n correctly.
>
>
That seems to be the same change I proposed a couple of days ago

http://lists.openembedded.org/pipermail/openembedded-core/2019-February/278840.html



> Signed-off-by: William Bourque <wbourque@gmail.com>
> ---
>  scripts/lib/wic/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 880e464..189253a 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -336,7 +336,7 @@ class Disk:
>      def copy(self, src, pnum, path):
>          """Copy partition image into wic image."""
>          if self.partitions[pnum].fstype.startswith('ext'):
> -            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
> +            cmd = "printf 'cd {}\nwrite {} {}' | {} -w {}".\
>                        format(path, src, os.path.basename(src),
>                               self.debugfs, self._get_part_image(pnum))
>          else: # fat
> --
> 2.7.4
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b0df100581a711a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Feb 11, 2019 at 12:01 PM William Bourque &lt;<a href=3D"mailto:wbour=
que@gmail.com">wbourque@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
Some distributions default shell (ex: /bin/dash)<br>
does not support &quot;-e&quot; argument to echo.<br>
Hence, using &quot;printf&quot; is safer as it, unlike echo,<br>
always inteprets \n correctly.<br>
<br></blockquote><div><br></div><div>That seems to be the same change I pro=
posed a couple of days ago<br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><div dir=3D"ltr"><a href=3D"http://lists.openembedded.org/pipermail/open=
embedded-core/2019-February/278840.html">http://lists.openembedded.org/pipe=
rmail/openembedded-core/2019-February/278840.html</a></div><div dir=3D"ltr"=
><br></div></div></div></div></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
Signed-off-by: William Bourque &lt;<a href=3D"mailto:wbourque@gmail.com" ta=
rget=3D"_blank">wbourque@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/engine.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py<br>
index 880e464..189253a 100644<br>
--- a/scripts/lib/wic/engine.py<br>
+++ b/scripts/lib/wic/engine.py<br>
@@ -336,7 +336,7 @@ class Disk:<br>
=C2=A0 =C2=A0 =C2=A0def copy(self, src, pnum, path):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Copy partition image in=
to wic image.&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.partitions[pnum].fstype.startswit=
h(&#39;ext&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;echo -e &#39;cd {}=
\nwrite {} {}&#39; | {} -w {}&quot;.\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;printf &#39;cd {}\=
nwrite {} {}&#39; | {} -w {}&quot;.\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0format(path, src, os.path.basename(src),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.debugfs, self._get_part_image(pnum))<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else: # fat<br>
-- <br>
2.7.4<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000b0df100581a711a4--

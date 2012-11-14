Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYbKr-00020U-Ji
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:40:50 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so212134pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Vd8c7562jYywlEyFnvMl0NpFvSnwN2oHgqqnhkEcEaw=;
	b=IE7NOdSJN0muozFLQBpRdm26RG43exars5atIh+zAgYl1MfJZWVUSfCQpP2bte7rr9
	vtUJu9rUercw7LGroLhs1RyNdHB620O5QQG4ry0goj32oujyHxK9G8jSSQBRRkJQG3tM
	stYLYXPl0OcO0poih03WYi4B1Jy6guC/QiXwwXauGg5LWJrM1PY7SgGVVs5fHAaOFcQy
	AsSQCPQfia4AnU6D8WWEgASjbzeDMb9hn2bFVfZZHhYQHKGvZPEhBz2EKk9Cl688lbyT
	Kp+1VymTRDxRn7YwR6GV2XSHFdRkOXtnLWOPOyf3FjI2PsdHyKXrXDt4SzS5a0yJEyXz
	phEA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr78491808pbc.24.1352892413547; Wed,
	14 Nov 2012 03:26:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 03:26:53 -0800 (PST)
In-Reply-To: <0c604e38ddcd6597371775a9c51625bf71c9f359.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<0c604e38ddcd6597371775a9c51625bf71c9f359.1352871028.git.sgw@linux.intel.com>
Date: Wed, 14 Nov 2012 09:26:53 -0200
X-Google-Sender-Auth: uQwM8CdvGDuNtgSbujrhdZz3E48
Message-ID: <CAP9ODKpOi5tf6Tgdwv7sm=YeXL21Q9i=7ATiDLjVtvvZ-UddVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] less: Update to 451
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 11:40:50 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c99cba948204ce72cf63

--e89a8ff1c99cba948204ce72cf63
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 3:32 AM, Saul Wold <sgw@linux.intel.com> wrote:

> LICENSE file was changed to match the BSD-2 Clause
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../less/{less_444.bb => less_451.bb}              |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-extended/less/{less_444.bb => less_451.bb} (82%)
>
> diff --git a/meta/recipes-extended/less/less_444.bbb/meta/recipes-extended/less/
> less_451.bb
> similarity index 82%
> rename from meta/recipes-extended/less/less_444.bb
> rename to meta/recipes-extended/less/less_451.bb
> index 1ce9d92..93e4bbf 100644
> --- a/meta/recipes-extended/less/less_444.bb
> +++ b/meta/recipes-extended/less/less_451.bb
> @@ -21,14 +21,14 @@ SECTION = "console/utils"
>
>  LICENSE = "GPLv3+ | BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
> +                    file://LICENSE;md5=866cc220f330b04ae4661fc3cdfedea7"
>  DEPENDS = "ncurses"
> -PR = "r3"
> +PR = "r0"
>

Please drop PR as r0 is the default.


>  SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "56f9f76ffe13f70155f47f6b3c87d421"
> -SRC_URI[sha256sum] =
> "be64ad3e22d6d4aa19fe7024d998563a1ce1671ee3625f8851d26b16dedcdeeb"
> +SRC_URI[md5sum] = "765f082658002b2b46b86af4a0da1842"
> +SRC_URI[sha256sum] =
> "9fe8287c647afeafb4149c5dedaeacfd20971ed7c26c7553794bb750536b5f57"
>
>  inherit autotools update-alternatives
>
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c99cba948204ce72cf63
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Nov 14, 2012 at 3:32 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
LICENSE file was changed to match the BSD-2 Clause<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=A0.../less/{<a href=3D"http://less_444.bb" target=3D"_blank">less_444.bb</=
a> =3D&gt; <a href=3D"http://less_451.bb" target=3D"_blank">less_451.bb</a>=
} =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A08 ++++----<br>
=A01 files changed, 4 insertions(+), 4 deletions(-)<br>
=A0rename meta/recipes-extended/less/{<a href=3D"http://less_444.bb" target=
=3D"_blank">less_444.bb</a> =3D&gt; <a href=3D"http://less_451.bb" target=
=3D"_blank">less_451.bb</a>} (82%)<br>
<br>
diff --git a/meta/recipes-extended/less/<a href=3D"http://less_444.bb" targ=
et=3D"_blank">less_444.bb</a> b/meta/recipes-extended/less/<a href=3D"http:=
//less_451.bb" target=3D"_blank">less_451.bb</a><br>
similarity index 82%<br>
rename from meta/recipes-extended/less/<a href=3D"http://less_444.bb" targe=
t=3D"_blank">less_444.bb</a><br>
rename to meta/recipes-extended/less/<a href=3D"http://less_451.bb" target=
=3D"_blank">less_451.bb</a><br>
index 1ce9d92..93e4bbf 100644<br>
--- a/meta/recipes-extended/less/<a href=3D"http://less_444.bb" target=3D"_=
blank">less_444.bb</a><br>
+++ b/meta/recipes-extended/less/<a href=3D"http://less_451.bb" target=3D"_=
blank">less_451.bb</a><br>
@@ -21,14 +21,14 @@ SECTION =3D &quot;console/utils&quot;<br>
<br>
=A0LICENSE =3D &quot;GPLv3+ | BSD-2-Clause&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d=
47fae504 \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://LICENSE;md5=3D1237c0f825bb3=
6122b0b2b486ffbe6be&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://LICENSE;md5=3D866cc220f330b=
04ae4661fc3cdfedea7&quot;<br>
=A0DEPENDS =3D &quot;ncurses&quot;<br>
-PR =3D &quot;r3&quot;<br>
+PR =3D &quot;r0&quot;<br></blockquote><div><br></div><div>Please drop PR a=
s r0 is the default.</div><div>=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=A0SRC_URI =3D &quot;<a href=3D"http://www.greenwoodsoftware.com/${BPN}/${B=
PN}-${PV}.tar.gz" target=3D"_blank">http://www.greenwoodsoftware.com/${BPN}=
/${BPN}-${PV}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;56f9f76ffe13f70155f47f6b3c87d421&quot;<br>
-SRC_URI[sha256sum] =3D &quot;be64ad3e22d6d4aa19fe7024d998563a1ce1671ee3625=
f8851d26b16dedcdeeb&quot;<br>
+SRC_URI[md5sum] =3D &quot;765f082658002b2b46b86af4a0da1842&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9fe8287c647afeafb4149c5dedaeacfd20971ed7c26c7=
553794bb750536b5f57&quot;<br>
<br>
=A0inherit autotools update-alternatives<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.7.6<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c99cba948204ce72cf63--

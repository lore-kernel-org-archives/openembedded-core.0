Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2395260173
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 04:04:16 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hr17so4312952lab.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 21:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=chEiknWq0GDEzvA98k1SVOJ6Kny1W17c3804DFv3Mws=;
	b=AdwyraTxI48OnrlnxqcfkS8/esX0B79kctaS0K7iu4vgjhJUlk6onm2uaXKJ+PAzKC
	KPPrmY0x7flHsBDpNKr1t1FR7wcnfEEiG3/W3q2r1Kn2xHDAVkmSigxdWkx+dxIv/30t
	6SkjtZw9kfy4cYTf2n2vy6mZEekmZzG4WNzm9p+ftkFr7wYczuBgXZ954gAejAoYMVQT
	QQdbR3bKNmyY8rVo0ExUpl/hoPLaH2J9oOittSh12uVmr+FCLQ6CMX/DITPOUcgILejJ
	5SiF/RjQZWvc+L62SxUojYLVUWUfEVIsHHdU4cJA6z5Zdp0sA8Qn7mNR1Rjkk9UjcwK9
	x7SA==
MIME-Version: 1.0
X-Received: by 10.152.29.8 with SMTP id f8mr10506140lah.11.1399262656810; Sun,
	04 May 2014 21:04:16 -0700 (PDT)
Received: by 10.112.36.164 with HTTP; Sun, 4 May 2014 21:04:16 -0700 (PDT)
In-Reply-To: <1399243070-25365-1-git-send-email-tylerwhall@gmail.com>
References: <1399243070-25365-1-git-send-email-tylerwhall@gmail.com>
Date: Mon, 5 May 2014 06:04:16 +0200
Message-ID: <CAPbeDC=J6mL0vfMYpZQsF4cEjcUq6ktZSBb1g4H8Qword8eXew@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Tyler Hall <tylerwhall@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Substitute correct python version in shebang
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
X-List-Received-Date: Mon, 05 May 2014 04:04:19 -0000
Content-Type: multipart/alternative; boundary=089e0158c1589b543704f89f395f

--089e0158c1589b543704f89f395f
Content-Type: text/plain; charset=UTF-8

On Mon, May 5, 2014 at 12:37 AM, Tyler Hall <tylerwhall@gmail.com> wrote:

> If python2 and python3 are both available, scripts that are subject to
> this substitution can possibly run with the wrong python version.
> python3-config is one such script.
>
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-native_3.3.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bbb/meta/recipes-devtools/python/
> python3-native_3.3.3.bb
> index 7238eaf..0fd7349 100644
> --- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
> @@ -71,6 +71,6 @@ do_install() {
>
>         # Make sure we use /usr/bin/env python
>

the comment above should perhaps be updated together with this change


>         for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python
> ${D}${bindir}/${PN}`; do
> -               sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
> +               sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>         done
>  }
>

--089e0158c1589b543704f89f395f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, May 5, 2014 at 12:37 AM, Tyler Hall <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:tylerwhall@gmail.com" target=3D"_blank">tylerwhall@gmail.com</a>&gt;</=
span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">If python2 and python3 are both available, s=
cripts that are subject to<br>
this substitution can possibly run with the wrong python version.<br>
python3-config is one such script.<br>
<br>
Signed-off-by: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail.com">tyler=
whall@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-native_3.3.3.b=
b" target=3D"_blank">python3-native_3.3.3.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-native_=
3.3.3.bb" target=3D"_blank">python3-native_3.3.3.bb</a> b/meta/recipes-devt=
ools/python/<a href=3D"http://python3-native_3.3.3.bb" target=3D"_blank">py=
thon3-native_3.3.3.bb</a><br>

index 7238eaf..0fd7349 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-native_3.3.3.b=
b" target=3D"_blank">python3-native_3.3.3.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-native_3.3.3.b=
b" target=3D"_blank">python3-native_3.3.3.bb</a><br>
@@ -71,6 +71,6 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make sure we use /usr/bin/env python<br></blo=
ckquote><div><br></div><div>the comment above should perhaps be updated tog=
ether with this change<br>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

=C2=A0 =C2=A0 =C2=A0 =C2=A0 for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/py=
thon ${D}${bindir}/${PN}`; do<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^#!.*|=
#!/usr/bin/env python|&#39; $PYTHSCRIPT<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^#!.*|=
#!/usr/bin/env python3|&#39; $PYTHSCRIPT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br></blockquote><br></div></div></div>

--089e0158c1589b543704f89f395f--

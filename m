Return-Path: <jatedev@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id C3705601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 15:41:09 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id dc16so2193024qab.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QKeeh8noL/pAtTd9oZqsk+kCMK4krcsayXe2+g+sF+w=;
	b=zOF3gsVX0AMAus/BbVGokOxhjkXnW9KIyUhoQHOLxn6NzVObZ+SpKnM1DleVt4VL15
	NnA72xdN94Wob5N1uGkoXxSJXEi60iPYqQsjmN9QqvrkO3Q/Wq7gTbBhgJp9DwE9RrMd
	4Ec2zTbQuiur4vm5OOm+a00V2oFKclIBUSFg3tyJFPOQ/+Yu1R/fMZcrOKSWQzdIj4kt
	UIj1miH3bRIlp92g6u/ReKTKSO4F9hZx+/4fmDyX70UuQGK97Gzo8yWGTdfXae+FPdj5
	xv1UfPAPpMHRAixMgmocLKFjqZAgEu3Q3TAyhZtYlnsTfb4iyZ8ijDJxI5x3C8jW/jiA
	/3zA==
MIME-Version: 1.0
X-Received: by 10.140.38.169 with SMTP id t38mr26983937qgt.3.1408117270088;
	Fri, 15 Aug 2014 08:41:10 -0700 (PDT)
Received: by 10.140.34.76 with HTTP; Fri, 15 Aug 2014 08:41:10 -0700 (PDT)
In-Reply-To: <1407704441-29326-1-git-send-email-jatedev@gmail.com>
References: <1407704441-29326-1-git-send-email-jatedev@gmail.com>
Date: Fri, 15 Aug 2014 11:41:10 -0400
Message-ID: <CAPphmga1t=kfqpAkSntSC4_MH3BXOpWWkQWim-9c38+Xt5GHAg@mail.gmail.com>
From: Jate Sujjavanich <jatedev@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] useradd: Add setscene dep on pseudo-native
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
X-List-Received-Date: Fri, 15 Aug 2014 15:41:15 -0000
Content-Type: multipart/alternative; boundary=001a11c12ce6b01a980500acd9c2

--001a11c12ce6b01a980500acd9c2
Content-Type: text/plain; charset=UTF-8

Ping


On Sun, Aug 10, 2014 at 5:00 PM, Jate Sujjavanich <jatedev@gmail.com> wrote:

> A recipe will sometimes be rebuilt unnecessarily if it adds users via
> useradd and the pseudo-native task has not been populated.
>
> This patch adds the correct dependency.
>
> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> ---
>  meta/classes/useradd.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index ea15dab..3b70e80 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -126,7 +126,7 @@ SYSROOTPOSTFUNC_class-cross = ""
>  SYSROOTPOSTFUNC_class-native = ""
>  SYSROOTPOSTFUNC_class-nativesdk = ""
>
> -USERADDSETSCENEDEPS =
> "${MLPREFIX}base-passwd:do_populate_sysroot_setscene
> shadow-native:do_populate_sysroot_setscene
> ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
> +USERADDSETSCENEDEPS =
> "${MLPREFIX}base-passwd:do_populate_sysroot_setscene
> pseudo-native:do_populate_sysroot_setscene
> shadow-native:do_populate_sysroot_setscene
> ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
>  USERADDSETSCENEDEPS_class-cross = ""
>  USERADDSETSCENEDEPS_class-native = ""
>  USERADDSETSCENEDEPS_class-nativesdk = ""
> --
> 1.7.9.5
>
>

--001a11c12ce6b01a980500acd9c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<br><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">On Sun, Aug 10, 2014 at 5:00 PM, Jate Sujjavanich <span dir=3D"=
ltr">&lt;<a href=3D"mailto:jatedev@gmail.com" target=3D"_blank">jatedev@gma=
il.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">A recipe will sometimes be rebuilt unnecessa=
rily if it adds users via<br>
useradd and the pseudo-native task has not been populated.<br>
<br>
This patch adds the correct dependency.<br>
<br>
Signed-off-by: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com">ja=
tedev@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/useradd.bbclass |=C2=A0 =C2=A0 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass<br=
>
index ea15dab..3b70e80 100644<br>
--- a/meta/classes/useradd.bbclass<br>
+++ b/meta/classes/useradd.bbclass<br>
@@ -126,7 +126,7 @@ SYSROOTPOSTFUNC_class-cross =3D &quot;&quot;<br>
=C2=A0SYSROOTPOSTFUNC_class-native =3D &quot;&quot;<br>
=C2=A0SYSROOTPOSTFUNC_class-nativesdk =3D &quot;&quot;<br>
<br>
-USERADDSETSCENEDEPS =3D &quot;${MLPREFIX}base-passwd:do_populate_sysroot_s=
etscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroo=
t:do_populate_sysroot_setscene&quot;<br>
+USERADDSETSCENEDEPS =3D &quot;${MLPREFIX}base-passwd:do_populate_sysroot_s=
etscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populat=
e_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene&q=
uot;<br>

=C2=A0USERADDSETSCENEDEPS_class-cross =3D &quot;&quot;<br>
=C2=A0USERADDSETSCENEDEPS_class-native =3D &quot;&quot;<br>
=C2=A0USERADDSETSCENEDEPS_class-nativesdk =3D &quot;&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c12ce6b01a980500acd9c2--

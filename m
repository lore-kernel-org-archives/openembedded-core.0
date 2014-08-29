Return-Path: <jatedev@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id C7ADF710C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:40:17 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x3so2516895qcv.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mqw6ileKaa8g5Vurd/HgjRZDTYdNS3p5+TBwQ0JypTs=;
	b=XY0SwC5j/sml9Qh8KnekkUg3wrhRBs7ojJNVzBwCTZXxnMuTbOFl+JsHotvZwRn8vh
	pkfO52MPa9ugwUBTZXs3w5ywEy5Ml7bc9owcd09XCoQyb/fKsIuJRb40UH0r51FKGmG9
	QCWRyOTUh4B94jN7qUcKHHaoW57ft8SNWK8t2dUhKQd+4wCfJplv914oYIk8ZQM48hV8
	S2FhzzRAgoq1gnWG+hCTkvVVkUXZuDpRSLyww8YPBbEhX/etEMa9c+96sct/ywiL1SZP
	+qUVzsTj+VoALGcWWJwtOAUVvfYO9o+LI/mUJ84kqLjXr9W0Y7Ewbs+iPnrBRxwfMZNg
	LpXg==
MIME-Version: 1.0
X-Received: by 10.140.98.7 with SMTP id n7mr17820512qge.83.1409326818617; Fri,
	29 Aug 2014 08:40:18 -0700 (PDT)
Received: by 10.140.34.76 with HTTP; Fri, 29 Aug 2014 08:40:18 -0700 (PDT)
In-Reply-To: <1407704441-29326-1-git-send-email-jatedev@gmail.com>
References: <1407704441-29326-1-git-send-email-jatedev@gmail.com>
Date: Fri, 29 Aug 2014 11:40:18 -0400
Message-ID: <CAPphmgb+9dgJTZ19p0dDOR3V5GQuQs5oZawQRnB9KQa2_Yt-Ag@mail.gmail.com>
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 29 Aug 2014 15:40:27 -0000
Content-Type: multipart/alternative; boundary=001a113ac3c66576180501c67874

--001a113ac3c66576180501c67874
Content-Type: text/plain; charset=UTF-8

There's a commit in poky's master-next with the message "bitbake: runqueue:
Fix setscene tasks not running".

Should it fix the problem fixed by my patch?


Thanks,

- Jate S.



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

--001a113ac3c66576180501c67874
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>There&#39;s a commit in poky&#39;s master-n=
ext with the message &quot;bitbake: runqueue: Fix setscene tasks not runnin=
g&quot;.<br><br></div>Should it fix the problem fixed by my patch?<br><br>
<br></div>Thanks,<br><br></div>- Jate S.<br><br></div><div class=3D"gmail_e=
xtra"><br><br><div class=3D"gmail_quote">On Sun, Aug 10, 2014 at 5:00 PM, J=
ate Sujjavanich <span dir=3D"ltr">&lt;<a href=3D"mailto:jatedev@gmail.com" =
target=3D"_blank">jatedev@gmail.com</a>&gt;</span> wrote:<br>
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
</font></span></blockquote></div><br></div>

--001a113ac3c66576180501c67874--

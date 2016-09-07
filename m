Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 954FC775D6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 10:29:30 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id g62so7501950lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eotYxdWP8/p/Jv16JQelzqSj4eGjj7QN35JCtOB6Mys=;
	b=beUQIbzUALNkCNJ6BZWQeBQKGHbzzMrL7Jslr546RWT0IEHrm2g56h7U3QL65K1yQG
	aDymr9c4lPDmppmS7K0IGZR+lzbx/XIvF7ZC+pCZa6zb5VSJhOjU+wJMxbwzftwKdl0i
	QlisDrJbhgGCneHUkeuMvhDlfQ6H8d/sWQ0oukq1DB1uudrbzf4GSe+DKbhyJUU1slRu
	frgta4OQ52kZggdfrtZfv6P44cbHZ9/kOkkklgv5P098kqXfFdRj5Rt1MvFXe1XyfyRg
	BYmlkYmLXvKxe0djit6iY3tDSZMJoAkYBK5phNsnhHiR/P+Wzj4hEI16BzDQAI+bgdoE
	GTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eotYxdWP8/p/Jv16JQelzqSj4eGjj7QN35JCtOB6Mys=;
	b=mZZQbWmGHcjGZe6mwy/yqzFyhmNiY7Eb3pPG583FYQ5pdxMLNPztdX/hAcoytNnpqP
	DHdag4WMI3+RAkm0SjNStkgLcThfVW/YrBmJKQ0LVAJ/bOlZ+vFAU2CuC1DooYKZOiZ6
	yuOEPHCWHmBVIExj3ULqFcOFJAlOyzi4LD8CXlz0CiXM2gmcWQlVpebv2rPA2/tKsSkI
	ng8JgHArdhRC0wA8twjD6qziBbxT7xifdF/T0sxaAObHYQ51sE918tYSQ+xfHWrWT3lq
	+fqkPIWawREntCwD9eIQegOzPjY5RhK2EteYuTn42eWCqRS/1JaOAoWO2kaP3pjvhqO+
	kzxQ==
X-Gm-Message-State: AE9vXwNbqjZQa2fZrmbPHicKo2RvDXhEjCU84Ycmv7yJvGNC7CT6KYXyPzlSZKsIBpKLRAvMsqq6jk06X/Mx1A==
X-Received: by 10.46.32.203 with SMTP id g72mr12395078lji.30.1473244170466;
	Wed, 07 Sep 2016 03:29:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.85.200 with HTTP; Wed, 7 Sep 2016 03:29:29 -0700 (PDT)
In-Reply-To: <72f9c03cf7bb25482acc9c40b775a4f294e772b6.1473240119.git.Qi.Chen@windriver.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<72f9c03cf7bb25482acc9c40b775a4f294e772b6.1473240119.git.Qi.Chen@windriver.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Wed, 7 Sep 2016 12:29:29 +0200
Message-ID: <CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] pulseaudio: fix to manage user services corretly
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
X-List-Received-Date: Wed, 07 Sep 2016 10:29:34 -0000
Content-Type: multipart/alternative; boundary=001a1142b65272bc48053be86355

--001a1142b65272bc48053be86355
Content-Type: text/plain; charset=UTF-8

Pau Espin Pedrol

2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com>:

> Make use of the new SYSTEMD_USER_SERVICE variable added in systemd.bbclass
> to manage user services in pulseaudio-server package.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 6ed79ef..f3754d7 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -124,8 +124,8 @@ FILES_${PN}-conf = "${sysconfdir}"
>  FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
>  FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-*
> ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules
> */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
>
> -#SYSTEMD_PACKAGES = "${PN}-server"
> -SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
> +SYSTEMD_PACKAGES = "${PN}-server"
> +SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.service
> pulseaudio.socket"
>
> I think specifying "pulseaudio.socket" for SYSTEMD_USER_SERVICE_${PN}-server
should be enough, systemd.bbclass is going to add the .service file afair.


>  FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142b65272bc48053be86355
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br clear=3D"all"><div><div=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Pau Espin Pedrol<br></div>=
</div></div></div>
<br><div class=3D"gmail_quote">2016-09-07 11:22 GMT+02:00 Chen Qi <span dir=
=3D"ltr">&lt;<a target=3D"_blank" href=3D"mailto:Qi.Chen@windriver.com">Qi.=
Chen@windriver.com</a>&gt;</span>:<br><blockquote style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"=
gmail_quote">Make use of the new SYSTEMD_USER_SERVICE variable added in sys=
temd.bbclass<br>
to manage user services in pulseaudio-server package.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc b/meta/=
recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc<br>
index 6ed79ef..f3754d7 100644<br>
--- a/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc<br>
@@ -124,8 +124,8 @@ FILES_${PN}-conf =3D &quot;${sysconfdir}&quot;<br>
=C2=A0FILES_${PN}-bin +=3D &quot;${sysconfdir}/default/<wbr>volatiles/volat=
iles.04_pulse&quot;<br>
=C2=A0FILES_${PN}-server =3D &quot;${bindir}/pulseaudio ${bindir}/start-* $=
{sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rule=
s ${systemd_user_unitdir}/*&quot;<br>
<br>
-#SYSTEMD_PACKAGES =3D &quot;${PN}-server&quot;<br>
-SYSTEMD_SERVICE_${PN}-server =3D &quot;pulseaudio.service&quot;<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}-server&quot;<br>
+SYSTEMD_USER_SERVICE_${PN}-<wbr>server =3D &quot;pulseaudio.service pulsea=
udio.socket&quot;<br>
<br></blockquote><div>I think specifying &quot;pulseaudio.socket&quot; for =
SYSTEMD_USER_SERVICE_${PN}-<wbr>server should be enough, systemd.bbclass is=
 going to add the .service file afair.<br></div><div>=C2=A0</div><blockquot=
e style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex" class=3D"gmail_quote">
=C2=A0FILES_${PN}-misc =3D &quot;${bindir}/* ${libdir}/pulseaudio/<wbr>libp=
ulsedsp.so&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a target=3D"_blank" rel=3D"noreferrer" href=3D"http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1142b65272bc48053be86355--

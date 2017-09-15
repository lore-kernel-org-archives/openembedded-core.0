Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C98078639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:04:57 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id s15so1122365uag.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h/UHjyRYsWH/O580P2ct/cwAzPrM2HDLfmd+7prFZ9E=;
	b=t1wkk8xxLFlWbq4z6eI0QU7KB8XRmFDmyutBX8P8rsRQH+7v+lrAn46FPg/RaIbl50
	bGQPvw+wNa76/hRZ/vRbleoFtKZzCE3LyKdcR4yHRsiWUP9n1TTs9oujslftoMg72+Gs
	++l+xvJFKs35pBFRmPNIakQ9QbmHZEctvM7Y/Ki+sH2jciPV7UPVG0ljtmE0/V1KpsCi
	mVoSvOFYTdDeIrBvemv5eAOyshfOptoIM5lk1i1aHP5LA3ywGIC6vO5xBQUzPCvyhw2L
	PCvOb7RybPSByT/38MOehQIo5i4+m8tejpswBMnoZee+FQbKaBZunP4r4+js1VWbCrZ2
	0J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h/UHjyRYsWH/O580P2ct/cwAzPrM2HDLfmd+7prFZ9E=;
	b=HAgXklTtwZ+VVa8CNa4OqDxYvZrzuIiJUNlPXcHAlQrWjgTC+OQN0aYMp/rtAaTtJ/
	gOc/qMZ5ffgSbokVfKr8WuA8i9kAHVeWHXglzXPGtmQcekTw6FyYW6bnrWFVXbLXFmhk
	I79uihw/z7RhmF32w8a/mPENiEUbL9dcSsTAflCRiBuRPcLxwp09bSfbA5R5VijXRz4x
	dtKZ1b2UWIFPjOKdQohPvg9IyLRJB/50vpFJSKW1hngcCmAbVcpEQJnNZc8iGa0mVXrZ
	Yr6Deyp0fzHT5QxkQh2jCNSmVrdqlIDE26rqWjPmZzFd3+5iNCB3NZ4Yu5lEb+gQfcyS
	cVTg==
X-Gm-Message-State: AHPjjUiGs1qViWyHwmUWfSH1b/SU9B1pwxQ0mYMORC8ovQK699ZnWl9A
	XoYR6sVbkgj/k4/ujgIQjrPBe6XmvsAJKhFTpZ8=
X-Google-Smtp-Source: AOwi7QDIUc7Rat8g4hnmUNs3h3e8Ai0vpOxUgX7C5RIGANHl0V7kWKKrAk3GQ7L/xPxH6SsNNsWiCrZbrOiQA/m6iz0=
X-Received: by 10.176.77.76 with SMTP id k12mr21334279uag.141.1505477099233;
	Fri, 15 Sep 2017 05:04:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Fri, 15 Sep 2017 05:04:58 -0700 (PDT)
In-Reply-To: <20170915115848.4939-1-ross.burton@intel.com>
References: <20170915115848.4939-1-ross.burton@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 15 Sep 2017 14:04:58 +0200
Message-ID: <CA+chaQcu0jP8y-N=DbqVC7rejtwyxOewsE6QGy0JiJmUNCGgzQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd: don't override pseudo environment
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
X-List-Received-Date: Fri, 15 Sep 2017 12:04:58 -0000
Content-Type: multipart/alternative; boundary="f403043c5dd0b7a89405593933c8"

--f403043c5dd0b7a89405593933c8
Content-Type: text/plain; charset="UTF-8"

nice

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Fri, Sep 15, 2017 at 1:58 PM, Ross Burton <ross.burton@intel.com> wrote:

> Back in the dark days before recipe-specific-sysroots the paths being
> passed in
> this manual construction of the pseudo environment made sense, but now
> they're
> incorrect and result in pseudo writing to two different databases during a
> single build.  The result is that pseudo doesn't follow changes to
> /etc/passwd
> in the sysroot, and warns in the logs.
>
> Remove the PSEUDO_LOCALSTATEDIR assignment and inherit the correct
> assignment in
> FAKEROOTENV.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/useradd.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 6017ded8601..0f51e5522b1 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -100,7 +100,7 @@ useradd_sysroot () {
>         # Pseudo may (do_prepare_recipe_sysroot) or may not
> (do_populate_sysroot_setscene) be running
>         # at this point so we're explicit about the environment so pseudo
> can load if
>         # not already present.
> -       export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${
> STAGING_DIR_TARGET}${localstatedir}/pseudo ${PSEUDO_SYSROOT}${bindir_
> native}/pseudo"
> +       export PSEUDO="${FAKEROOTENV} ${PSEUDO_SYSROOT}${bindir_
> native}/pseudo"
>
>         # Explicitly set $D since it isn't set to anything
>         # before do_prepare_recipe_sysroot
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403043c5dd0b7a89405593933c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">nice<div><br></div><div>Acked-by: Martin Jansa &lt;<a href=
=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Sep 15,=
 2017 at 1:58 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.=
burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Back in the dark days before recipe-=
specific-sysroots the paths being passed in<br>
this manual construction of the pseudo environment made sense, but now they=
&#39;re<br>
incorrect and result in pseudo writing to two different databases during a<=
br>
single build.=C2=A0 The result is that pseudo doesn&#39;t follow changes to=
 /etc/passwd<br>
in the sysroot, and warns in the logs.<br>
<br>
Remove the PSEUDO_LOCALSTATEDIR assignment and inherit the correct assignme=
nt in<br>
FAKEROOTENV.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/useradd.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass<br=
>
index 6017ded8601..0f51e5522b1 100644<br>
--- a/meta/classes/useradd.bbclass<br>
+++ b/meta/classes/useradd.bbclass<br>
@@ -100,7 +100,7 @@ useradd_sysroot () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pseudo may (do_prepare_recipe_sysroot) or may=
 not (do_populate_sysroot_setscene) be running<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # at this point so we&#39;re explicit about the=
 environment so pseudo can load if<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # not already present.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PSEUDO=3D&quot;${FAKEROOTENV} PSEUDO_LOC=
ALSTATEDIR=3D${<wbr>STAGING_DIR_TARGET}${<wbr>localstatedir}/pseudo ${PSEUD=
O_SYSROOT}${bindir_<wbr>native}/pseudo&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PSEUDO=3D&quot;${FAKEROOTENV} ${PSEUDO_S=
YSROOT}${bindir_<wbr>native}/pseudo&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Explicitly set $D since it isn&#39;t set to a=
nything<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # before do_prepare_recipe_sysroot<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403043c5dd0b7a89405593933c8--

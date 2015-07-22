Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id C360B73CF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:27:28 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so112616145qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jrd66LFsBMltdazcVQvq3R2APGbghtfi7KVqwYoed+w=;
	b=SDWkZxWR8jYwGUJPwToD70ukVtPnHwGCW/Eo7jv/WqGbAorgXML+m6FAsAz2VC4RCA
	fNcUrL5yye+G8bCseqIcqVuAcgQIglNPHcXyKUmGifH8xxIkeXO+QHh5E8VoaF03362P
	XBedOgWOdypbHlxb43MpzMRXERe0u4WAP182BTclsAJ5TrjPQRR9rqzrSH//SLoUQZh7
	CHpfy2JkS33fqB6TMQYpDMOTAMurGoaMYk3qq0o5OyIDtLtcM6JM5jABbkyvRowCSSae
	BL3ovEV4Wi2GC5RZ4DDu65gBi0Gv1VsIleo/FPLlIGOff6YQNdsVsAasQv51lNn2DlZF
	8ARg==
X-Gm-Message-State: ALoCoQljuOkExORxJRVDdruq7mIWw/Az1rISbTG9z7gI1vBd0fkqL+m1uE7fCx7On/Gn6e9AVA6f
X-Received: by 10.140.150.142 with SMTP id 136mr4769693qhw.17.1437578848313;
	Wed, 22 Jul 2015 08:27:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 22 Jul 2015 08:27:08 -0700 (PDT)
In-Reply-To: <1437551743-15104-1-git-send-email-amarnath.valluri@intel.com>
References: <1437551743-15104-1-git-send-email-amarnath.valluri@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jul 2015 16:27:08 +0100
Message-ID: <CAJTo0LYboRR3uSsgPy9ZYniFfXARciM7O-886dGE4ux-JX-+MA@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cronie: Upgrade v1.4.12 to v1.5.0
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
X-List-Received-Date: Wed, 22 Jul 2015 15:27:31 -0000
Content-Type: multipart/alternative; boundary=001a11357d4a973cd6051b78688c

--001a11357d4a973cd6051b78688c
Content-Type: text/plain; charset=UTF-8

I've pulled this into my staging branch, but can you please not add
[meta-oe] to the subject prefix for oe-core patches and it looks very
confusing...

Ross

On 22 July 2015 at 08:55, Amarnath Valluri <amarnath.valluri@intel.com>
wrote:

> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/recipes-extended/cronie/{cronie_1.4.12.bb => cronie_1.5.0.bb} | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/cronie/{cronie_1.4.12.bb => cronie_1.5.0.bb}
> (95%)
>
> diff --git a/meta/recipes-extended/cronie/cronie_1.4.12.bb
> b/meta/recipes-extended/cronie/cronie_1.5.0.bb
> similarity index 95%
> rename from meta/recipes-extended/cronie/cronie_1.4.12.bb
> rename to meta/recipes-extended/cronie/cronie_1.5.0.bb
> index 977332b..38bd593 100644
> --- a/meta/recipes-extended/cronie/cronie_1.4.12.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.5.0.bb
> @@ -23,8 +23,8 @@ SRC_URI = "
> https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
>  PAM_SRC_URI = "file://crond_pam_config.patch"
>  PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>
> -SRC_URI[md5sum] = "199db91e514a4d75e3222d69874b132f"
> -SRC_URI[sha256sum] =
> "0f5c9bf32f352599451c4ca0d6bc076d19e73ecfa5a90b34ecfe47c918c8bafd"
> +SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
> +SRC_URI[sha256sum] =
> "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
>
>  inherit autotools update-rc.d useradd systemd
>
> --
> 2.1.4
>
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11357d4a973cd6051b78688c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve pulled this into my staging branch, but can you p=
lease not add [meta-oe] to the subject prefix for oe-core patches and it lo=
oks very confusing...<div><br></div><div>Ross</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 22 July 2015 at 08:55, Amarnath =
Valluri <span dir=3D"ltr">&lt;<a href=3D"mailto:amarnath.valluri@intel.com"=
 target=3D"_blank">amarnath.valluri@intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Signed-off-by: Amarnath Valluri &lt;<a href=3D"m=
ailto:amarnath.valluri@intel.com">amarnath.valluri@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/cronie/{<a href=3D"http://cronie_1.4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">cronie_1.4.12.bb</a> =3D&gt; <a href=3D"h=
ttp://cronie_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">cronie_1.5.0.bb=
</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/cronie/{<a href=3D"http://cronie_1.4.12.=
bb" rel=3D"noreferrer" target=3D"_blank">cronie_1.4.12.bb</a> =3D&gt; <a hr=
ef=3D"http://cronie_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">cronie_1=
.5.0.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-extended/cronie/<a href=3D"http://cronie_1.4.12.b=
b" rel=3D"noreferrer" target=3D"_blank">cronie_1.4.12.bb</a> b/meta/recipes=
-extended/cronie/<a href=3D"http://cronie_1.5.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">cronie_1.5.0.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-extended/cronie/<a href=3D"http://cronie_1.4.12.bb=
" rel=3D"noreferrer" target=3D"_blank">cronie_1.4.12.bb</a><br>
rename to meta/recipes-extended/cronie/<a href=3D"http://cronie_1.5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cronie_1.5.0.bb</a><br>
index 977332b..38bd593 100644<br>
--- a/meta/recipes-extended/cronie/<a href=3D"http://cronie_1.4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">cronie_1.4.12.bb</a><br>
+++ b/meta/recipes-extended/cronie/<a href=3D"http://cronie_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">cronie_1.5.0.bb</a><br>
@@ -23,8 +23,8 @@ SRC_URI =3D &quot;<a href=3D"https://fedorahosted.org/rel=
eases/c/r/cronie/cronie-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz</a> \<br>
=C2=A0PAM_SRC_URI =3D &quot;file://crond_pam_config.patch&quot;<br>
=C2=A0PAM_DEPS =3D &quot;libpam libpam-runtime pam-plugin-access pam-plugin=
-loginuid&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;199db91e514a4d75e3222d69874b132f&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0f5c9bf32f352599451c4ca0d6bc076d19e73ecfa5a90=
b34ecfe47c918c8bafd&quot;<br>
+SRC_URI[md5sum] =3D &quot;9db75e1884d83a45e002d145c6c54d45&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112=
465f0f81f2c84ebfb3f&quot;<br>
<br>
=C2=A0inherit autotools update-rc.d useradd systemd<br>
<br>
--<br>
2.1.4<br>
<br>
---------------------------------------------------------------------<br>
Intel Finland Oy<br>
Registered Address: PL 281, 00181 Helsinki<br>
Business Identity Code: 0357606 - 4<br>
Domiciled in Helsinki<br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11357d4a973cd6051b78688c--

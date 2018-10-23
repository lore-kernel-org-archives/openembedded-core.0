Return-Path: <kergoth@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id C025771BF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 15:59:40 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l197-v6so1534002oib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SBBTIlo7yEeHkXNxwaHGtTNSwH2Gvx56SZKzLYXbtRs=;
	b=LW5KUmFZVVussE1uraZLViWB7Z/E7aby+naqrVcwVclD3j3oceBrM+alAVETFIwKvJ
	zgCW6Kl9329tBHck53b9UHpGydlA54Dt03SKxaM+e4sAWRr14d3ly1bjRcTbGxds8vdW
	N1JAySFA7maR/gTkja7vB52/ixnQvc4RQTmmMGBPMUapDa4b39m45Wd+CnVyNX0CRxL6
	sKENzLEeQRhfVL7S4ZlFQVkjJ3D3j8BPVgeY63jfo+a8XOYPZmDttQxPwk0CC9kVaLAi
	rw1VuZu/Oh0ZHhfZx+cBu2tzi1yb70EECw1R4hLd0jPEC4yRjjmDHktBpiLen8N/vkmK
	qdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SBBTIlo7yEeHkXNxwaHGtTNSwH2Gvx56SZKzLYXbtRs=;
	b=OTtp9fsjsvkBEfRMhvY5pGEWAAHIvmS4krY5qMO7Oal/H7Ln66o1NYr3Ncb9HM2VWF
	WCycaYYDBEzgZj62aad0eTn7txtiudyYK+BtopVRDyjm/B+/HCXJPWBGOcI9dPKqsefq
	jvoKal1pbXV/yOQYR4/qFkP2Szuexumywkdmz71KqSMJXRaVR4Hie0l9ucV0vh3ufXk1
	igHm4Eljt9vyaqaeLNqJqmY9jaf9z4/LuoUBNATILwqBk8aHY4cy/idUsD/L5/ZgYGJw
	VqCbV9658hrk7LV/bwu+V2+8WPSxowQZXSI2w4eUh/1VufnzBqChWOkdiUDRFJjWjHMl
	TxEg==
X-Gm-Message-State: ABuFfohIclrKaqZEYnfLG2kusC/AmTUswCSLelZAuJgoD1rj6swwz7Zb
	GzCtIf9q+7YcxB0E62XATh8ESpoDjgS8+7ZaDosI7w==
X-Google-Smtp-Source: ACcGV601f5+LJvZSFhtop2usO2HQzO/a/OwRXmVIUIYGS76BpuqOUyXigGSERy0uKje45ThQtoy1y7h7qmBdeI2WGgI=
X-Received: by 2002:aca:4006:: with SMTP id
	n6-v6mr14985126oia.304.1540310381488; 
	Tue, 23 Oct 2018 08:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <1540295004-26121-1-git-send-email-jef.driesen@niko.eu>
In-Reply-To: <1540295004-26121-1-git-send-email-jef.driesen@niko.eu>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 23 Oct 2018 08:59:29 -0700
Message-ID: <CABcZANnzZOGgsmt+c9XSCWUdPKUJq4o3WrGFG8BXzCLncNcEog@mail.gmail.com>
To: jef.driesen@niko.eu
Cc: anders@chargestorm.se, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] npm.bbclass: allow overriding NPM_INSTALL_DEV
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
X-List-Received-Date: Tue, 23 Oct 2018 15:59:41 -0000
Content-Type: multipart/alternative; boundary="00000000000021f13a0578e7756d"

--00000000000021f13a0578e7756d
Content-Type: text/plain; charset="UTF-8"

Technically a recipe can still set it just fine, they just have to set it
after the inherit, not before. This is likely still a good change to apply,
but wanted to clarify :)

On Tue, Oct 23, 2018 at 4:49 AM Jef Driesen <jef.driesen@niko.eu> wrote:

> Commit b1f10b18eaf6c8009e86863ca4a26f429de97082 added the NPM_INSTALL_DEV
> variable. But due to the use of simple assignment, a recipe can't override
> its
> value.
>
> Signed-off-by: Jef Driesen <jef.driesen@niko.eu>
> ---
>  meta/classes/npm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index c351ff0..a5b155a 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -22,7 +22,7 @@ def npm_oe_arch_map(target_arch, d):
>      return target_arch
>
>  NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
> -NPM_INSTALL_DEV = "0"
> +NPM_INSTALL_DEV ?= "0"
>
>  npm_do_compile() {
>         # Copy in any additionally fetched modules
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000021f13a0578e7756d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Technically a recipe can still set it just fine, they just=
 have to set it after the inherit, not before. This is likely still a good =
change to apply, but wanted to clarify :)</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Tue, Oct 23, 2018 at 4:49 AM Jef Driesen &lt;<a href=
=3D"mailto:jef.driesen@niko.eu">jef.driesen@niko.eu</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Commit b1f10b18eaf6c8009e86863ca4a26f429de9=
7082 added the NPM_INSTALL_DEV<br>
variable. But due to the use of simple assignment, a recipe can&#39;t overr=
ide its<br>
value.<br>
<br>
Signed-off-by: Jef Driesen &lt;<a href=3D"mailto:jef.driesen@niko.eu" targe=
t=3D"_blank">jef.driesen@niko.eu</a>&gt;<br>
---<br>
=C2=A0meta/classes/npm.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass<br>
index c351ff0..a5b155a 100644<br>
--- a/meta/classes/npm.bbclass<br>
+++ b/meta/classes/npm.bbclass<br>
@@ -22,7 +22,7 @@ def npm_oe_arch_map(target_arch, d):<br>
=C2=A0 =C2=A0 =C2=A0return target_arch<br>
<br>
=C2=A0NPM_ARCH ?=3D &quot;${@npm_oe_arch_map(d.getVar(&#39;TARGET_ARCH&#39;=
), d)}&quot;<br>
-NPM_INSTALL_DEV =3D &quot;0&quot;<br>
+NPM_INSTALL_DEV ?=3D &quot;0&quot;<br>
<br>
=C2=A0npm_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy in any additionally fetched modules<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, M=
entor Graphics</div></div></div></div>

--00000000000021f13a0578e7756d--

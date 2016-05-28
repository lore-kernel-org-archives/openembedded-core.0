Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCC273212
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 22:14:55 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id h125so18776730oib.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 15:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=E45voSDXWCM9L7GclCi63gghlB1uAQluFpc0kDew9Ys=;
	b=S8TjFIfGzvR6fnsszuMQNpIRPIs+YFw5hTREklOQ2xQxQgrVTEnAvb0Ai2AWPnQR1s
	TPM5OBolYy+A9vSLkgGFmyHqB5ndqbNLV+mMqsHVJsVjcd05PGea0rmsEM7B0YdC9fD9
	HxRF7GlSEL1MfRiNXeBtA7dNPOqFdcmkpEJHmRubSoyR0QuOM2rkbMa16+ebfJpffuzv
	qEKo+97EwrFAvjUHIc5p7lLakWctETnSZp4CNg7Bxma6MnkUpjgrYOTOXN/3LOqhKEFi
	kIrxmlmLaEMiI0jrGIjj75kWMdaaKj5sNluomRX6hDh5h5gLF4+d407xlBF2rbZIlHJ0
	UuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=E45voSDXWCM9L7GclCi63gghlB1uAQluFpc0kDew9Ys=;
	b=YckmRE4qqsw8Cm6KMDaUwdUXMsDb6tviFwMIYGboY3kLHa0GqT3ET2Q/160S+nfQ0o
	PUO5mR0NfL+vH8jnUc3vVvaQ/J2e66GsDpg2Vb3qQ5w2BdDoX8gqG0u12EKxH+hd8J7H
	Z/lU7Hz0Esh2Euq0vVXRpnYolO5zwoWrUgRD9B2L25N3s3Gy5c2FB9Eo2tZvl2TjRvZF
	HfFlI3+dnK/BZbyJEAVkK8nLUGJxdld5gQOHq/WaRw5O929kOW1lKAp2v+mZ5wbEN6v1
	R+QeYulIeqlhW5BOOnJqJpoWpxwgynaxv/1kLNS74DPoKuzNfJAHfhaD7brvG2lDQI+f
	gl/Q==
X-Gm-Message-State: ALyK8tL/RNaoYlntiMDX4f4HCqo1h+eprKeUB2SBoJeBZSQtjf1nqfIelfcDa6R6R0TyptqbJDDlyx+GBshvRw==
MIME-Version: 1.0
X-Received: by 10.157.39.234 with SMTP id c97mr12861381otb.186.1464473696340; 
	Sat, 28 May 2016 15:14:56 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Sat, 28 May 2016 15:14:56 -0700 (PDT)
In-Reply-To: <2d425e7e0f2020c64240c74a78b65c67d8ad97f0.1464450270.git.tom.zanussi@linux.intel.com>
References: <cover.1464450270.git.tom.zanussi@linux.intel.com>
	<2d425e7e0f2020c64240c74a78b65c67d8ad97f0.1464450270.git.tom.zanussi@linux.intel.com>
Date: Sat, 28 May 2016 18:14:56 -0400
Message-ID: <CADkTA4NQ8TKiQtJSNx8v=mEu0dGOkZahrkFB=+G=oxoGJPd=CQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto-rt/4.4: Update KBRANCH
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
X-List-Received-Date: Sat, 28 May 2016 22:14:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c1154367416590533ee5afa

--94eb2c1154367416590533ee5afa
Content-Type: text/plain; charset=UTF-8

On Sat, May 28, 2016 at 3:27 PM, Tom Zanussi <tom.zanussi@linux.intel.com>
wrote:

> standard/preempt-rt was replaced by standard/preempt-rt/base in
> linux-yocto-4.4.git, so KBRANCH needs to be updated accordingly.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> index 5e39374..beff921 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> @@ -1,4 +1,4 @@
> -KBRANCH ?= "standard/preempt-rt"
> +KBRANCH ?= "standard/preempt-rt/base"
>

This is missing the krogoth tag in the patch, right ?  since for master,
this was in my series
under commit [linux-yocto: create intel branches].

Bruce



>
>  require recipes-kernel/linux/linux-yocto.inc
>
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1154367416590533ee5afa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, May 28, 2016 at 3:27 PM, Tom Zanussi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:tom.zanussi@linux.intel.com" target=3D"_blank">tom.zanussi@li=
nux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;border-left-color:rgb(204,204,204);padding-left:1ex">standard/preempt-rt=
 was replaced by standard/preempt-rt/base in<br>
linux-yocto-4.4.git, so KBRANCH needs to be updated accordingly.<br>
<br>
Signed-off-by: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@linux.intel.co=
m">tom.zanussi@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
index 5e39374..beff921 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
@@ -1,4 +1,4 @@<br>
-KBRANCH ?=3D &quot;standard/preempt-rt&quot;<br>
+KBRANCH ?=3D &quot;standard/preempt-rt/base&quot;<br></blockquote><div><br=
></div><div>This is missing the krogoth tag in the patch, right ? =C2=A0sin=
ce for master, this was in my series</div><div>under commit [linux-yocto: c=
reate intel branches].</div><div><br></div><div>Bruce</div>







<div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0require recipes-kernel/linux/linux-yocto.inc<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
1.9.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c1154367416590533ee5afa--

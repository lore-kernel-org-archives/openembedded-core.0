Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id D893860053
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 16:44:00 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 41so12881528wrc.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 08:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q1uIKSqGueEdRz7BUqomvQtZ6qg76zHXokTeP/44/f4=;
	b=L8xio/tJjPgPw4TNAl1eTt5qlitvZInvgu8e43/k3Srt0jB0p/8SGdck1cWImxprEr
	7+01RI/aILDqcvVTTfnC5a9DNh/Zu3cMFRgyWVPrhGe6uRJ2F8fw8qps5G4IXYhTiUNk
	r/PIK8CYknEHtK+XKOwlMGSQ8wX7YvTf1bZO0y9n6mh9PQEZAAtEOy1zKfF3vMwFODc9
	/8NV6SzamIuOKCyRCfFhwvuYlr89ijYcZShxLvXFV4FmDOl+e4PMpIa1viVGbDVkHZEp
	x81zL7LoHULbcoTmcC3Z2iFw+wVjkcGrk5MGlc9UXBBT7ce3g0tAk08Z4t8xPYrjQpes
	vuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q1uIKSqGueEdRz7BUqomvQtZ6qg76zHXokTeP/44/f4=;
	b=nqnTfKeHNKb92OzmK1U2qcqYc1yFzEnEZKsUFydFUYwVfL+Y4gbWs5KAg86aI3HRW/
	+AJXgBGt4/o08gaim/jjHztrH9f2MEmhcF8LLXXOKHejSp9AGGmIkFrp9TuUZ32g8Wd3
	5qlfIB1nIQGL+07fYLSDIownYptUkXvYnLEcvB7pOlGzNV73u/mXSa8FpXDrrYlTbCoe
	PiZmxDMuvsAwQVXCqOtWEJxGr0T0YgrZNKqXiV6jEZYOvcqVRJt37O3rQ/iAFLpeblug
	grAUtjje8V1Zqc96dUkavF+2PG9gbSmNqr3c4F2HTUg/W/cN/TdDDvQk6m/725JhA6Xh
	oXVg==
X-Gm-Message-State: APf1xPBSrR0Xrxub11tDzOKUKvQQYk+hkKvKKkEqwruIBtsvHs5wJ/oE
	S0W9mLAXjrDbHmlt5ubItW0gxeTRO1i08pl8v8b5gg==
X-Google-Smtp-Source: AH8x225JmyJ+G7nxZZnl3P1rkx0Pw6lHcWKiC6OORygI7N6XiwsZaMB+VFoXvh0oqxfwwT3vQptpjJZG6XrU7UrWHJo=
X-Received: by 10.223.132.166 with SMTP id 35mr7531484wrg.183.1518367441351;
	Sun, 11 Feb 2018 08:44:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 11 Feb 2018 08:44:00 -0800 (PST)
In-Reply-To: <20180201122218.4533-1-Martin.Jansa@gmail.com>
References: <20180201122218.4533-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Feb 2018 17:44:00 +0100
Message-ID: <CA+chaQcQztFnFJjZhXVYQeTZuv4qJ41j5cNca0NJhHPz4R6x7A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Sun, 11 Feb 2018 16:44:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c0defbefaf7eb0564f27704"

--94eb2c0defbefaf7eb0564f27704
Content-Type: text/plain; charset="UTF-8"

50e7619aebae5351e9a41fe1b909a31b9e383f0a bitbake.conf: add ssh to
HOSTTOOLS_NONFATAL

should be cherry-picked together with this one.


On Thu, Feb 1, 2018 at 1:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add tools required by testimage to HOSTTOOLS only when testimage is
> inherited. These tools, as described in the comment, are only required
> by the testimage task. So this change should not have negtive effect.
> This would also solve build error on hosts which miss some tool such as
> scp.
>
> Cherry-picked from rocko 8ca61a5464743ff85b6d26886112750d6ddd13e0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2dac3a1481..f3994fc642 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,7 +469,7 @@ HOSTTOOLS += " \
>  "
>
>  # Tools needed to run testimage runtime image testing
> -HOSTTOOLS += "ip ping ps scp ssh stty"
> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage',
> d)]}"
>
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat
> sudo"
> --
> 2.15.1
>
>

--94eb2c0defbefaf7eb0564f27704
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">50e7619aebae5351e9a41fe1b909a31b9e383f0a bitbake.conf: add=
 ssh to HOSTTOOLS_NONFATAL<div><br></div><div>should be cherry-picked toget=
her with this one.<br><div><br></div></div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Thu, Feb 1, 2018 at 1:22 PM, Martin Jans=
a <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D=
"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi=
.Chen@windriver.com</a>&gt;<br>
<br>
Add tools required by testimage to HOSTTOOLS only when testimage is<br>
inherited. These tools, as described in the comment, are only required<br>
by the testimage task. So this change should not have negtive effect.<br>
This would also solve build error on hosts which miss some tool such as scp=
.<br>
<br>
Cherry-picked from rocko 8ca61a5464743ff85b6d2688611275<wbr>0d6ddd13e0<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 2dac3a1481..f3994fc642 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -469,7 +469,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Tools needed to run testimage runtime image testing<br>
-HOSTTOOLS +=3D &quot;ip ping ps scp ssh stty&quot;<br>
+HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp ssh stty&#39;][bb=
.data.inherits_class(<wbr>&#39;testimage&#39;, d)]}&quot;<br>
<br>
=C2=A0# Link to these if present<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc=
 sftp socat sudo&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c0defbefaf7eb0564f27704--

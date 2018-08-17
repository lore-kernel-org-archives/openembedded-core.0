Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF1F79304
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 10:07:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f21-v6so7080715wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FrhkB8088pDADlWQe1BJzNSeIPQx5AcnRhbcd1rPRqk=;
	b=j4cRSm1lm1ufOtnoetULYB2YQNftR0qm+v9UmOv8lo46QjXR3uwKQBUN2W3dC1Ch0T
	yjHzgP2lU4+AVXBkyUSnmwtuLdcTJPnRbJBhXnexwBZpv8oiTomPBykWQh1np+/44Y1V
	ydeYZeWKltxh0uE+qv4wl6VUB9JcUI1NsMcTgswvtp0UMtIj3Ibb+ThlOSUBsOqowFLe
	pdvY3znQy8mL6zYUBfu/ExkASOvOhhCbpscXd1WtBH/dFhYM1qGAkMU/GEQZPbqEvUly
	ym1k5ILw1diFPuRArOTS2AK6G+11uMmSBOg6U2TT1NPwhndCRyXvdgmazf2zdlRb7lih
	Z8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FrhkB8088pDADlWQe1BJzNSeIPQx5AcnRhbcd1rPRqk=;
	b=IcjxT3SIzraYkuGzbtMRBb0A8oQacxIhAZErBNUKZK83hV+syqgZkK7UOzBmGmBXKq
	aLcnZx8XkI1Sy8hXQ439R13IIhAe6v7LpMhcljZi00OHhnWdGPiAoxrWO0WVFwlzVaMY
	dAWcgDtYcryF8r715AN0huwyu9z/L0bcbMYRG6n/javIIvtNOgrNFclBo+EBLhfzWCl0
	Rzu/Rn3lTatF9kBaXycE1jooP6ey84/jpztxkqXeY6246LnDUgD25SLh7GZnjJ2VtBTr
	SFcyH5v0xInBAQJs3+yJdeYrOtaRlWPKtrExRxx6LrCjNIqkHj4B3vMRyeC8ft0kX/Do
	PYMw==
X-Gm-Message-State: AOUpUlGUpn3dkxA4RxDL/rJG4/wLCZhki92zPGzGArsYOx6VmlUsORZO
	tWuL60mRB/7Eed6uWoPlC9GfUe95gdB2In8oCZKacg==
X-Google-Smtp-Source: AA+uWPwm+FNa0lKI+6RbJrcTa3aWPVVDY75JNnk1mcantfVMGAZr0xfTyL/l69cCcF8P98v4Y+UuLQbN8JF6T7dmt5g=
X-Received: by 2002:a1c:8c08:: with SMTP id
	o8-v6mr17397230wmd.60.1534500427252; 
	Fri, 17 Aug 2018 03:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <1534498011-388674-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1534498011-388674-1-git-send-email-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Aug 2018 12:06:55 +0200
Message-ID: <CA+chaQfV0oD4j5wB=OAQmgu53S=Zddcsjqbd=aK=nHSnoF-LWA@mail.gmail.com>
To: changqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Avoid indirect auto-archive-native dependencies (via SSTATE_EXCLUDEDEPS_SYSROOT)
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
X-List-Received-Date: Fri, 17 Aug 2018 10:07:07 -0000
Content-Type: multipart/alternative; boundary="000000000000dfcb0405739eb8be"

--000000000000dfcb0405739eb8be
Content-Type: text/plain; charset="UTF-8"

Please update the summary and commit message "auto-" > "autoconf-"

On Fri, Aug 17, 2018 at 11:27 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> remove the indirect dependcy of auto-archive-native to avoid
> not needed .m4 installed into sysroot, which may cause
> compile problem.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/layer.conf | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index cc77d07..63346ae 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -90,6 +90,8 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
>      .*->.*-initial.* \
>      .*(base-passwd|shadow-sysroot)->.* \
>  "
> -
> +# Avoid adding autoconf-archive-native to sysroot without a specific
> +# dependency in the recipe.
> +SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
>  # We need to keep bitbake tools in PATH
>  PATH :=
> "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000dfcb0405739eb8be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please update the summary and commit message &quot;auto-&q=
uot; &gt; &quot;autoconf-&quot;</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Fri, Aug 17, 2018 at 11:27 AM &lt;<a href=3D"mailto:changqing.=
li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
remove the indirect dependcy of auto-archive-native to avoid<br>
not needed .m4 installed into sysroot, which may cause<br>
compile problem.<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/layer.conf | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index cc77d07..63346ae 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -90,6 +90,8 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0.*-&gt;.*-initial.* \<br>
=C2=A0 =C2=A0 =C2=A0.*(base-passwd|shadow-sysroot)-&gt;.* \<br>
=C2=A0&quot;<br>
-<br>
+# Avoid adding autoconf-archive-native to sysroot without a specific<br>
+# dependency in the recipe. <br>
+SSTATE_EXCLUDEDEPS_SYSROOT +=3D &quot;.*-&gt;autoconf-archive-native&quot;=
<br>
=C2=A0# We need to keep bitbake tools in PATH<br>
=C2=A0PATH :=3D &quot;${@os.path.dirname(bb.utils.which(d.getVar(&#39;PATH&=
#39;),&#39;bitbake&#39;))}:${HOSTTOOLS_DIR}&quot;<br>
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
</blockquote></div>

--000000000000dfcb0405739eb8be--

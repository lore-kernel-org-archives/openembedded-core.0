Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9F39788CE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 08:35:50 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u66so4411599ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 00:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KhShqFmF9qCwDsWZTnvV+3F5CVagvNxzGuxbegUwtyk=;
	b=uioRCqRuHCa16oA4zJZR9zxD0QEQjw6RR04kRvlWJ+0/kqRRV3JZZP1bPSYqDwyuna
	tEtP2fwsL0+lsH/ODf9btA0ztq5IApXFCEpgJPilCFXnteDZRz1lm+dbbpGSfiJe8zY/
	rFcMoixaDM4yuEOhvqatTa4h/kpLy1jdcE4KYDi9dbC9afHFuwr7GUHge/eqhP0YPK6k
	5Stb1t22nmtR368KWcQPOAJ/auF7yxTJAkJmbZmVllMo1wFqjgArWfX1p0XbEKxRg5CG
	PQwBmP04cYyLE9yW8MxOdAGRY9PI22lSJell1RmCWnIGIVuBz4/RItUMXgULKuku7ZuO
	843w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KhShqFmF9qCwDsWZTnvV+3F5CVagvNxzGuxbegUwtyk=;
	b=Gqok4Abhs5D1G2bEV1KtixM6N0/MPaU4Yn5xZtO4pvE5u6hDYm4mfyVBt0e9UDr1Ms
	FWorwpq8IRHLd3pKqHSfwbLMsdU6SDPBXuKPn8rk7ID0FVNJckMRZj6sVY55I+Znm6Hl
	7FMOOgsgQvit4CtXMYLxOoqec7/A4hFrjq2LHmwCh9zsQIWD6SUZKIU7cDVEYMvmz+5Q
	jguBkUN3O5mbSMEzjSJIjNKjfxLFsnIM8RZqCG90/hFHIGKjDJgejY6mTTgiqT4n6cFS
	qmkA3d4gPDHAHKxQHCb5UooZXyqMwfQmkWQSrCCa/PzVSNvvzDlRaqybJ5tTCb1FZbnz
	+21w==
X-Gm-Message-State: APf1xPD4WwDMTf8UurIkqp9KjFEe2ZY+R/KHnnq9dCNxweWwjmQluEQu
	15adNRYBoLP1HDPB+q5PlmifgDFq74TjKRnGLACkhg==
X-Google-Smtp-Source: AG47ELtfgX9qvkhkf+J5KQSQh2qonusrvh1/Q+PZZ209GDF3pv9guOyry6ElU6gY8QmV+xUdr9tPplLHZPVNkau1cV4=
X-Received: by 10.36.36.144 with SMTP id f138mr1515185ita.131.1519893351815;
	Thu, 01 Mar 2018 00:35:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 1 Mar 2018 00:35:31 -0800 (PST)
In-Reply-To: <20180228204607.16416-1-raj.khem@gmail.com>
References: <20180228204607.16416-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Mar 2018 08:35:31 +0000
Message-ID: <CAJTo0LacweumOd2kSTtcxuLn_wwEcG+D6R=zqNc_OqO2OMApPA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Enable static PIE support
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
X-List-Received-Date: Thu, 01 Mar 2018 08:35:50 -0000
Content-Type: multipart/alternative; boundary="001a1147cd305522b6056655bff4"

--001a1147cd305522b6056655bff4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would this be the cause of glibc failing to build like this on PPC?

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/build/tmp/=
work/ppc7400-poky-linux/glibc/2.27-r0/recipe-sysroot-native/usr/bin/powerpc=
-poky-linux.gcc-cross-initial-powerpc/../../libexec/powerpc-poky-linux.gcc-=
cross-initial-powerpc/gcc/powerpc-poky-linux/7.3.0/ld:
read-only segment has dynamic relocations.

The previous glibc run was all green, added this patch and it fails.

Ross

On 28 February 2018 at 20:46, Khem Raj <raj.khem@gmail.com> wrote:

> go programs when compiled with PIE fails otherwise on aarch64
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.27.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb
> b/meta/recipes-core/glibc/glibc_2.27.bb
> index e9d4117a47..62db3e9d02 100644
> --- a/meta/recipes-core/glibc/glibc_2.27.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -81,6 +81,7 @@ EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} \
>                  --enable-bind-now \
>                  --enable-stack-protector=3Dstrong \
>                  --enable-stackguard-randomization \
> +                --enable-static-pie \
>                  ${GLIBC_EXTRA_OECONF}"
>
>  EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147cd305522b6056655bff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would this be the cause of glibc failing to build like thi=
s on PPC?<br><br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-p=
pc/build/build/tmp/work/ppc7400-poky-linux/glibc/2.27-r0/recipe-sysroot-nat=
ive/usr/bin/powerpc-poky-linux.gcc-cross-initial-powerpc/../../libexec/powe=
rpc-poky-linux.gcc-cross-initial-powerpc/gcc/powerpc-poky-linux/7.3.0/ld: r=
ead-only segment has dynamic relocations.<div><br></div><div>The previous g=
libc run was all green, added this patch and it fails.</div><div><br></div>=
<div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 28 February 2018 at 20:46, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">go programs when compiled wit=
h PIE fails otherwise on aarch64<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_<wbr>2.27.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=
=3D"noreferrer" target=3D"_blank">glib<wbr>c_2.27.bb</a> b/meta/recipes-cor=
e/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noreferrer" target=3D"_blan=
k">glib<wbr>c_2.27.bb</a><br>
index e9d4117a47..62db3e9d02 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noref=
errer" target=3D"_blank">glib<wbr>c_2.27.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noref=
errer" target=3D"_blank">glib<wbr>c_2.27.bb</a><br>
@@ -81,6 +81,7 @@ EXTRA_OECONF =3D &quot;--enable-kernel=3D${OLDEST_<wbr>KE=
RNEL} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-bind=
-now \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-stac=
k-protector=3D<wbr>strong \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-stac=
kguard-<wbr>randomization \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-static-pi=
e \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GLIBC_EXTRA=
_OECONF}&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;${@get_libc_fpu_setting(bb, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.2<br>
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

--001a1147cd305522b6056655bff4--

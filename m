Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6839878200
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:32:55 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id h2so19017538wre.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wss6xOLCaBNN8Y1pnA7wo8RzuDo0kOo5cYqp4Ywplg0=;
	b=QqgDl2gawlokM+ZBB/6D87Rl4HmksuGR5SlK7ue+2eubaIyrLz1ELVv8IWh1+zE4o5
	NwRzbJe1QkP4T7x28EVTSstAh484MmAf+P2zdgLI7Rvet37S6MaFlM+VcnOs4NcQ8FbA
	1HDRS2UFBQdP24lXp5i33JgPFPBETtCcxsoj1zeol8goEYPqjX7g0u2CutUbqCJCPZgA
	LMnhxPepCz7CeaRQhzVIcPDu6BBLBdGLnf+VY2560kmIm4N3jM06G54q+wRqw6uHcFPu
	c/cwAffgMEY38em3qJn1ChMyOTI8TXf0Hs2p5EYhf52mHXAVKlzdzGV7fDQdjfzz0Imm
	pqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wss6xOLCaBNN8Y1pnA7wo8RzuDo0kOo5cYqp4Ywplg0=;
	b=Ia/oO7uJJ+s8MvxjZICZ1DjQ0PXBjXkHjQJPFV5vgKrxORDxWzreP5PX19tnibLtCQ
	ptzO3aTEq8ep7LZ1EYwVBDVQ7wTdD9lF6R6jRLEzzZeqmDmMT+qKNKD4rY8PQi44eNUE
	n8RrChWVli2wPWSMUHK+P4AoGxVlZR0MelyAoo7m97b8z4JSwgLtrOVSebFaSSS13AnB
	KvPTunqGrayT3Z+qzJmqrAVwZvOIcAXV1q2K6Bkt9aB2pjwTBM2nQFAQWmrGbnkQlWqd
	5JPEV13C9rx+aC9jaaNkEorEgZYe1cvApWN7x48uPuqdz6AwmcgVqnLbU4jPbuoMPB/I
	tEcw==
X-Gm-Message-State: AElRT7GQNDPk3eKbhLpuAVg/i31ftBHNpalgh34falzBU/ZQI0R00Hta
	hOUfKjVOP8coWMVRErYw0pSDql6dmpkk0VQzpJ4=
X-Google-Smtp-Source: AG47ELtz6ZlIUbJBYvMMhIOkVKGsRIar7DuykzxFKDjkfNfgFTY0myF5V1B5dFDwe12cn0wkMfduKdSvehTVks+BeYI=
X-Received: by 10.223.134.4 with SMTP id 4mr2862675wrv.230.1521473576239; Mon,
	19 Mar 2018 08:32:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Mon, 19 Mar 2018 08:32:55 -0700 (PDT)
In-Reply-To: <20180315112706.18183-1-alexander.kanavin@linux.intel.com>
References: <20180315112706.18183-1-alexander.kanavin@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Mar 2018 16:32:55 +0100
Message-ID: <CA+chaQdRLqo0z__-qnVZ1xeJGeALjA6GbNvRP50LpRT3BVBFCA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: run postinst script only for -target package
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
X-List-Received-Date: Mon, 19 Mar 2018 15:32:55 -0000
Content-Type: multipart/alternative; boundary="001a1147d44c0c05ed0567c5ac51"

--001a1147d44c0c05ed0567c5ac51
Content-Type: text/plain; charset="UTF-8"

Do you already have similar patch for nativesdk-shadow somewhere?

One thing I've noticed with new set -e is that you get only one failure per
run, which is expected.

Just when I had 8 different update-alternatives call failing in busybox
postinst (due to different defconfig we use) I would appreciate to see all
errors in one go. But I don't see how to "improve" this easily, running it
twice with and without "set -e" would probably cause more confusion than
helping with too many errors in one postinst.

It would be great if the output of postinst script could be extracted to
separate file or the warning provided some simple way to re-execute just
the failing postinst manually (e.g. with devtool). Currently I do it
manually, which I cannot recommend to anyone (basically removing rm_work
from INHERIT to keep rootfs after do_rootfs, then jumping to rootfs
directory, exporting D and running the postinst from OPKGLIBDIR).

Regards,

On Thu, Mar 15, 2018 at 12:27 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Nativesdk package has a special arrangement where the same thing is done
> in do_install(). It was assumed (in the comment) that postinsts don't run
> when
> installing nativesdk packages, but this was incorrect: they are run, but
> any failures were previously silently ignored. Now this missing failure
> reporting has
> been fixed, and so we get to see the failures.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 5
> +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_
> 20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_
> 20170717.bb
> index 52a1a07f68c..51af72e79a3 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> @@ -64,13 +64,14 @@ do_install_append_class-target () {
>          ${D}${mandir}/man8/update-ca-certificates.8
>  }
>
> -pkg_postinst_${PN} () {
> +pkg_postinst_${PN}_class-target () {
>      SYSROOT="$D" $D${sbindir}/update-ca-certificates
>  }
>
>  CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
>
> -# Postinsts don't seem to be run for nativesdk packages when populating
> SDKs.
> +# Rather than make a postinst script that works for both target and
> nativesdk,
> +# we just run update-ca-certificate from do_install() for nativesdk.
>  CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-
> certificates.crt"
>  do_install_append_class-nativesdk () {
>      SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-certificates
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147d44c0c05ed0567c5ac51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you already have similar patch for nativesdk-shadow som=
ewhere?<div><br></div><div>One thing I&#39;ve noticed with new set -e is th=
at you get only one failure per run, which is expected.</div><div><br></div=
><div>Just when I had 8 different update-alternatives call failing in busyb=
ox postinst (due to different defconfig we use) I would appreciate to see a=
ll errors in one go. But I don&#39;t see how to &quot;improve&quot; this ea=
sily, running it twice with and without &quot;set -e&quot; would probably c=
ause more confusion than helping with too many errors in one postinst.</div=
><div><br></div><div>It would be great if the output of postinst script cou=
ld be extracted to separate file or the warning provided some simple way to=
 re-execute just the failing postinst manually (e.g. with devtool). Current=
ly I do it manually, which I cannot recommend to anyone (basically removing=
 rm_work from INHERIT to keep rootfs after do_rootfs, then jumping to rootf=
s directory, exporting D and running the postinst from OPKGLIBDIR).</div><d=
iv><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Thu, Mar 15, 2018 at 12:27 PM, Alexander Kanavin <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" ta=
rget=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Nativesdk package has a special arrangement =
where the same thing is done<br>
in do_install(). It was assumed (in the comment) that postinsts don&#39;t r=
un when<br>
installing nativesdk packages, but this was incorrect: they are run, but<br=
>
any failures were previously silently ignored. Now this missing failure rep=
orting has<br>
been fixed, and so we get to see the failures.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/ca-<wbr>certificates/<a href=3D"http://ca-certif=
icates_20170717.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_<w=
br>20170717.bb</a> | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/ca-<wbr>certificates/<a href=3D"http://ca=
-certificates_20170717.bb" rel=3D"noreferrer" target=3D"_blank">ca-certific=
ates_<wbr>20170717.bb</a> b/meta/recipes-support/ca-<wbr>certificates/<a hr=
ef=3D"http://ca-certificates_20170717.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ca-certificates_<wbr>20170717.bb</a><br>
index 52a1a07f68c..51af72e79a3 100644<br>
--- a/meta/recipes-support/ca-<wbr>certificates/<a href=3D"http://ca-certif=
icates_20170717.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_<w=
br>20170717.bb</a><br>
+++ b/meta/recipes-support/ca-<wbr>certificates/<a href=3D"http://ca-certif=
icates_20170717.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_<w=
br>20170717.bb</a><br>
@@ -64,13 +64,14 @@ do_install_append_class-target () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${mandir}/man8/update-ca-<wbr>certifi=
cates.8<br>
=C2=A0}<br>
<br>
-pkg_postinst_${PN} () {<br>
+pkg_postinst_${PN}_class-<wbr>target () {<br>
=C2=A0 =C2=A0 =C2=A0SYSROOT=3D&quot;$D&quot; $D${sbindir}/update-ca-<wbr>ce=
rtificates<br>
=C2=A0}<br>
<br>
=C2=A0CONFFILES_${PN} +=3D &quot;${sysconfdir}/ca-<wbr>certificates.conf&qu=
ot;<br>
<br>
-# Postinsts don&#39;t seem to be run for nativesdk packages when populatin=
g SDKs.<br>
+# Rather than make a postinst script that works for both target and native=
sdk,<br>
+# we just run update-ca-certificate from do_install() for nativesdk.<br>
=C2=A0CONFFILES_${PN}_append_class-<wbr>nativesdk =3D &quot; ${sysconfdir}/=
ssl/certs/ca-<wbr>certificates.crt&quot;<br>
=C2=A0do_install_append_class-<wbr>nativesdk () {<br>
=C2=A0 =C2=A0 =C2=A0SYSROOT=3D&quot;${D}${SDKPATHNATIVE}&quot; ${D}${sbindi=
r}/update-ca-<wbr>certificates<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.1<br>
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

--001a1147d44c0c05ed0567c5ac51--

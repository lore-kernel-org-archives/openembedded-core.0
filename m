Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 149AB71C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 09:34:19 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id b9so340635wra.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f6MxLsSFxoEwr923JZuCKIDr48OFKgtl5AD1h4iFc5c=;
	b=VhZoZ0APBzkCKZxC605hgFY33VpSrzYzz4AE5qPUyYmoJU1zRPTN7uzlSs8ODqyzQT
	AeXHGD7LKhinwyePMKqCjaoWDzXH0sbNfmKf5ubRLp7auoBFjczUGS89l+9qOc0rb12I
	KyGRXrvsEaTYOZRfmkkmCi8HFp37lcV6PSUfiuGJbP0Ve6+vwEjoPegHlZC4S+4/ZCJP
	IWAb8EYl7zdN/2IUZIlCVBLrab1UokQJL3lgq9/pA45iZ1IFMuskxH8nyko8eULyJd38
	MW4XTzTakA07hTaoeKueoVSbgGFpkNzgx6rhHsa99PAcTgrHGjU36t7NsLNUh6w1+Kim
	hOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f6MxLsSFxoEwr923JZuCKIDr48OFKgtl5AD1h4iFc5c=;
	b=ZP8dTjaR+fiZyHPk4kDGe4dS98p6DXJqusotEpWP2QtL0ywrcQG56WhmOjcSPXEcam
	2WOyJoc3Ua3W3Zwv7OYnK0MTKg8KKFlmDGyKUFsS/ji87Y9DTE9VLj8BJCKrIRh4RqhG
	QTx4HH0nrZd/+eTi+kgHtPXFluJ666FQF4rN4+QJBQvEc0cZM1ZRo8cfIlcpiO7eF/v0
	PO/2LvfWl2TKDMbMecowp4jaaRFkZDVXvPHqi9XPJaoPBwkGAOqaMLqLYu8nDWsXX3qB
	Xox/UEGe3AREErcPBlws0eCxBpyPiJIU8V1OKRqvaCBobLavrCYyI1Zqu3ps20BvycDV
	lkqQ==
X-Gm-Message-State: AHPjjUjrgkioxMTwhDcM/s9jNt4HBRjk5rTY5tuglzQZWdVZTQU2gzkT
	j/tBhEs9V/1t4vTVC32UDNSQEXdhJwZCkk/V8fcBMQ==
X-Google-Smtp-Source: AOwi7QCwtLCWIZR3vtqfibz3zPfXYJRMvfAS3ZmEq5IWYRk4c0Tr+cU9nhyiae+j7rTDH19IigAS8YwrHqP1h2dVjmw=
X-Received: by 10.223.157.142 with SMTP id p14mr4027648wre.104.1506072860762; 
	Fri, 22 Sep 2017 02:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Fri, 22 Sep 2017 02:34:20 -0700 (PDT)
In-Reply-To: <68a878cd6e53211af0f2a5a248328d05597e63af.1504598502.git.Qi.Chen@windriver.com>
References: <cover.1504598502.git.Qi.Chen@windriver.com>
	<68a878cd6e53211af0f2a5a248328d05597e63af.1504598502.git.Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Sep 2017 11:34:20 +0200
Message-ID: <CA+chaQfUX5_GS+jJ-Av9-k=pB9RA+JG1=v8MhJhOzUR5jMJBjw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: change some RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Fri, 22 Sep 2017 09:34:20 -0000
Content-Type: multipart/alternative; boundary="f403043a43b0df287e0559c3e9b2"

--f403043a43b0df287e0559c3e9b2
Content-Type: text/plain; charset="UTF-8"

This doesn't seem to work correctly for MACHINEs with empty SERIAL_CONSOLE,
because with empty SERIAL_CONSOLE there is no systemd-serialgetty package
(because it's also empty) and the build fails with:

Collected errors:
 * calculate_dependencies_for: Cannot satisfy the following dependencies
for packagegroup-core-boot:
 *      systemd-serialgetty *
 * opkg_solver_install: Cannot install package packagegroup-core-boot.

If you're setting NO_RECOMMENDATIONS to "1", then you should expect that
some recommended functionality will be missing, no?

On Tue, Sep 5, 2017 at 10:07 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Set NO_RECOMMENDATIONS to "1", build and start a systemd image, and we
> could not get serial getty spawned, thus causing the user not able to
> login via serial port.
>
> E.g.
> MACHINE=qemux86-64 bitbake core-image-minimal
> runqemu qemux86-64 nographic
>
> And we cannot login onto the system.
>
> Move util-linux-agetty and systemd-serialgetty (determined by
> PACKAGECONFIG)
> from RRECOMMENDS to RDEPENDS to fix the above problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_234.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb
> b/meta/recipes-core/systemd/systemd_234.bb
> index 2736f38..2695e15 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -492,13 +492,13 @@ FILES_${PN} = " ${base_bindir}/* \
>
>  FILES_${PN}-dev += "${base_libdir}/security/*.la
> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>
> -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
> +RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})
> util-linux-agetty"
> +RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>  RDEPENDS_${PN} += "volatile-binds update-rc.d"
>
> -RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> 'serial-getty-generator', '', 'systemd-serialgetty', d)} \
> -                      systemd-extra-utils \
> +RRECOMMENDS_${PN} += "systemd-extra-utils \
>                        systemd-compat-units udev-hwdb \
> -                      util-linux-agetty  util-linux-fsck e2fsprogs-e2fsck
> \
> +                      util-linux-fsck e2fsprogs-e2fsck \
>                        kernel-module-autofs4 kernel-module-unix
> kernel-module-ipv6 \
>                        os-release \
>  "
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403043a43b0df287e0559c3e9b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t seem to work correctly for MACHINEs with =
empty=C2=A0SERIAL_CONSOLE, because with empty SERIAL_CONSOLE there is no sy=
stemd-serialgetty package (because it&#39;s also empty) and the build fails=
 with:<div><br></div><div>Collected errors:<br></div><div><div>=C2=A0* calc=
ulate_dependencies_for: Cannot satisfy the following dependencies for packa=
gegroup-core-boot:</div><div>=C2=A0*=C2=A0 =C2=A0 =C2=A0 systemd-serialgett=
y *</div><div>=C2=A0* opkg_solver_install: Cannot install package packagegr=
oup-core-boot.</div></div><div><br></div><div>If you&#39;re setting=C2=A0<s=
pan style=3D"font-size:12.8px">NO_RECOMMENDATIONS to &quot;1&quot;, then yo=
u should expect that some recommended functionality=C2=A0will be missing, n=
o?</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 5, 2017 at 10:07 AM, Chen Qi <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Set NO_RECOMMENDATIO=
NS to &quot;1&quot;, build and start a systemd image, and we<br>
could not get serial getty spawned, thus causing the user not able to<br>
login via serial port.<br>
<br>
E.g.<br>
MACHINE=3Dqemux86-64 bitbake core-image-minimal<br>
runqemu qemux86-64 nographic<br>
<br>
And we cannot login onto the system.<br>
<br>
Move util-linux-agetty and systemd-serialgetty (determined by PACKAGECONFIG=
)<br>
from RRECOMMENDS to RDEPENDS to fix the above problem.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">syst<wbr>emd_234.bb</a> | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" re=
l=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" target=3D"=
_blank">sy<wbr>stemd_234.bb</a><br>
index 2736f38..2695e15 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
@@ -492,13 +492,13 @@ FILES_${PN} =3D &quot; ${base_bindir}/* \<br>
<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${base_libdir}/security/*.la ${datadir}/db=
us-1/interfaces/ ${sysconfdir}/rpm/macros.<wbr>systemd&quot;<br>
<br>
-RDEPENDS_${PN} +=3D &quot;kmod dbus util-linux-mount udev (=3D ${EXTENDPKG=
V})&quot;<br>
+RDEPENDS_${PN} +=3D &quot;kmod dbus util-linux-mount udev (=3D ${EXTENDPKG=
V}) util-linux-agetty&quot;<br>
+RDEPENDS_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39=
;, &#39;serial-getty-generator&#39;, &#39;&#39;, &#39;systemd-serialgetty&#=
39;, d)}&quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;volatile-binds update-rc.d&quot;<br>
<br>
-RRECOMMENDS_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&=
#39;, &#39;serial-getty-generator&#39;, &#39;&#39;, &#39;systemd-serialgett=
y&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 systemd-extra-utils \<br>
+RRECOMMENDS_${PN} +=3D &quot;systemd-extra-utils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0systemd-compat-units udev-hwdb \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 util-linux-agetty=C2=A0 util-linux-fsck e2fsprogs-e2fsck \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 util-linux-fsck e2fsprogs-e2fsck \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0os-release \<br>
=C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--f403043a43b0df287e0559c3e9b2--

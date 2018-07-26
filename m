Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1BCC478C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:26:11 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h10-v6so1716087wre.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GStvxOD/jDApjWKu44NlvdqnnMpZrlRAVLnA7Jl721o=;
	b=K0ocqeYQc+kKsEDmDAGh00abrtu2dAqfzNSucaf2rVYxW0ckja6YD2paXvhU4kgkHt
	HGEeB3epTgaFVjNJiNnlusgZhJWiPgwC2vBGWCngeFh6+XJiVgvLbpQQb9qT+CVczKPZ
	8wjNqOhUrj2xX0P9MmT7Oakw36RSJnRdXWZ/WrXBtsIuLguJrWnjnKdK1TDvQAejf70o
	sJHSjWTBq+29BhSiqLJXRT1Ny0+ny/rjlendtLJ8uKXgxiha6te5hPtOK7tp4h7y4vNs
	TAhU7MXr0m9qfB50waAbF/j26tF34dgeMSk+H+4phv0ocnxpsZuulonJZIM61sphtX/q
	K0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GStvxOD/jDApjWKu44NlvdqnnMpZrlRAVLnA7Jl721o=;
	b=NzrnkbJ9l5+BJ61ZiTvZ/0Xbf1XrURqhvtbQcbyMUbXF1A89aE8gK6JEdZndXyKZ+G
	G+X2zegExBt3wYKmrYaZZzhJ7+wiLuQscMXYlXgxv+WSBMdHHYwJ490nxMnSM+rVbdo2
	vbHtyQdFpXbmu/ahx8Jpe6rtXcDtwaCUfytQfhnXCvjYblvCWHwBQZPpmWZDUC1MfUHM
	grCElx7x6bczdCjt6zWOlEAXLrYjfQaeyBpbB23S4lfVpcJ0aas2TGZeu/2YWLnOP+0Z
	NMTd8mQ44Zi6ikiYsySFUCf4C4Hl4IV2GPOyNkii0DhYNuTBmpPZrKGtvI8Rbqxwcr1j
	ZqPQ==
X-Gm-Message-State: AOUpUlF8MhMl4YMNxXw+oVh0L7x8jzUYRQDFejjr8rQwhnbm5gqYqYxU
	6yClB+6KlexiIJRZkTIfeariGEyuueOaOO7+kSQ=
X-Google-Smtp-Source: AAOMgpd7W8t1TZzPnxC3ARAWsb665hFfEr20+G4cUrPMnjV4Bl/I5SVP65mQKSyZc/82H7Smx55nQHMCEUlwLGjMEPU=
X-Received: by 2002:adf:f50e:: with SMTP id
	q14-v6mr1521713wro.241.1532611571871; 
	Thu, 26 Jul 2018 06:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180705085719.3184-1-adrian.ratiu@ni.com>
In-Reply-To: <20180705085719.3184-1-adrian.ratiu@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jul 2018 15:26:02 +0200
Message-ID: <CA+chaQddtODqrxpAwB_f0mP=wdt+kVC2o+tp=+6VdHt_Zk4_AA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate & unshare to alternatives
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
X-List-Received-Date: Thu, 26 Jul 2018 13:26:11 -0000
Content-Type: multipart/alternative; boundary="00000000000051f68f0571e6f073"

--00000000000051f68f0571e6f073
Content-Type: text/plain; charset="UTF-8"

This is good, but the fallocate alternative should be added only for target
build.

nativesdk explicitly disables fallocate in
meta/recipes-core/util-linux/util-linux_2.32.bb

EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
                                --disable-fallocate \
                                --disable-use-tty-group \
"

so now nativesdk builds have new warning:
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alternative
target (sdk/usr/bin/fallocate or sdk/usr/bin/fallocate.util-linux) does not
exist, skipping...
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
alternative provide sdk/usr/bin/fallocate: sdk/usr/bin/fallocate.util-linux
does not exist
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate


On Thu, Jul 5, 2018 at 10:56 AM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> These binaries can be provided by busybox triggering a conflict in
> do_rootfs so update-alternatives needs to know about them to properly
> create the symlinks.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 8d8f3962ff..ed5c618750 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -206,7 +206,7 @@ do_install_append_class-native () {
>  ALTERNATIVE_PRIORITY = "80"
>
>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
> switch_root"
> -ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall
> fallocate unshare"
>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
>
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
> @@ -217,6 +217,8 @@ ALTERNATIVE_LINK_NAME[blockdev] =
> "${base_sbindir}/blockdev"
>  ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>  ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> +ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
> +ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
>  ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
>
>  ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1
> nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8
> fsck.8 uuid.3 eject.1 logger.1"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000051f68f0571e6f073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is good, but the fallocate alternative should be adde=
d only for target build.<div><br></div><div>nativesdk explicitly disables f=
allocate in</div><div>meta/recipes-core/util-linux/<a href=3D"http://util-l=
inux_2.32.bb">util-linux_2.32.bb</a><br></div><div><br></div><div><div>EXTR=
A_OECONF_class-nativesdk =3D &quot;${SHARED_EXTRA_OECONF} \</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-fallocate \</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-use-tty-group \</div><div>&quot;<=
/div></div><div><br></div><div>so now nativesdk builds have new warning:</d=
iv><div><div>WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: =
alternative target (sdk/usr/bin/fallocate or sdk/usr/bin/fallocate.util-lin=
ux) does not exist, skipping...</div><div>WARNING: nativesdk-util-linux-2.3=
2-r0 do_package: util-linux: NOT adding alternative provide sdk/usr/bin/fal=
locate: sdk/usr/bin/fallocate.util-linux does not exist</div><div>WARNING: =
nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link =3D=3D alt_ta=
rget: sdk/usr/bin/fallocate =3D=3D sdk/usr/bin/fallocate</div></div><div><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul 5=
, 2018 at 10:56 AM Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.=
com">adrian.ratiu@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">These binaries can be provided by busybox triggering a conflict in<br>
do_rootfs so update-alternatives needs to know about them to properly<br>
create the symlinks.<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
 target=3D"_blank">adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index 8d8f3962ff..ed5c618750 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -206,7 +206,7 @@ do_install_append_class-native () {<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;80&quot;<br>
<br>
=C2=A0ALTERNATIVE_${PN}=C2=A0 =3D &quot;dmesg kill more mkswap blockdev piv=
ot_root switch_root&quot;<br>
-ALTERNATIVE_${PN} +=3D &quot;hexdump last lastb logger mesg renice wall&qu=
ot;<br>
+ALTERNATIVE_${PN} +=3D &quot;hexdump last lastb logger mesg renice wall fa=
llocate unshare&quot;<br>
=C2=A0ALTERNATIVE_${PN} +=3D &quot;setsid chrt flock utmpdump eject nologin=
 taskset&quot;<br>
<br>
=C2=A0ALTERNATIVE_LINK_NAME[dmesg] =3D &quot;${base_bindir}/dmesg&quot;<br>
@@ -217,6 +217,8 @@ ALTERNATIVE_LINK_NAME[blockdev] =3D &quot;${base_sbindi=
r}/blockdev&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[pivot_root] =3D &quot;${base_sbindir}/pivot_roo=
t&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[switch_root] =3D &quot;${base_sbindir}/switch_r=
oot&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[eject] =3D &quot;${bindir}/eject&quot;<br>
+ALTERNATIVE_LINK_NAME[unshare] =3D &quot;${bindir}/unshare&quot;<br>
+ALTERNATIVE_LINK_NAME[fallocate] =3D &quot;${bindir}/fallocate&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[nologin] =3D &quot;${base_sbindir}/nologin&quot=
;<br>
<br>
=C2=A0ALTERNATIVE_${PN}-doc =3D &quot;mountpoint.1 last.1 lastb.1 mesg.1 wa=
ll.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 find=
fs.8 fsck.8 uuid.3 eject.1 logger.1&quot;<br>
-- <br>
2.18.0<br>
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

--00000000000051f68f0571e6f073--

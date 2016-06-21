Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 11027612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:01:58 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b136so3518178qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PYMgYaqHwscQiriyo5lkp3B8VWaWjA5pWGPhLGucAJc=;
	b=EszLnPyqQ7jUIzZ7mLOxPc3quNjGKacemvqaVz7oZKtk2WoCKf1CxHiTTrti8itlOz
	oPJXsifcRt8Ca4/DpvzDQaH/cWc4op6T15lPAlqJj0+XgI6lbIkm/fYxg5Gsc73CD/TR
	DEBy5WBzrD0mNfZIEOB6SM2DvQO4UK1eqvxl/YJXVHNHRG2GVVHzkG5MOZeOyKNOV8nY
	+x6j0wVvV5CjA8uOthjx6vQVJZYEcm4CetGfuPqYsF2ob7aByO59w8P26wJTn9cXjC0/
	W1HpobA9pikjTx0Twz6I+yBSWozdj2tovXKbLamRKSppIZSWoA3C3YYvcgfIUaeVLFnl
	Z7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PYMgYaqHwscQiriyo5lkp3B8VWaWjA5pWGPhLGucAJc=;
	b=QMk+0N/3Vxx0Gzz/xLbRoon022aG+24hCANFJWjqrPdRaN4J7othtIich1cCg6/LGW
	+fKOM2OS5U6F6drRL2990EaGnzVl36xfYbSe+7Qd5mqoVeVVU9rAzVixxuNclGvr/rqk
	OBdgb0uNtzL86h09vz/Z35qkaBdOq+b/3REgAjMCZ0wOSZSJLvuKeMG2iPTHhRciy2Kh
	Kr8M157lAegWkHRGrt5oPg8HjSHfUI2skjfeSxyGTsfAkw8++wgwUzl0QqLz1Ne38fZb
	BU9raDLmUoggqQYzG0jMMYm+cUK587AxvXH9Ri8kaA+f5kTYKYAdbsEdJiXQAe2XAbvS
	okkA==
X-Gm-Message-State: ALyK8tI4uyK5FHhXX+JdEl5S8wO9dT2InUEPQAyDk6FXqLZ0Wu4h44196ktjEYsWoGeNa3XEEfh8/drGvOG1AQ==
X-Received: by 10.237.34.100 with SMTP id o33mr29824292qtc.57.1466521318158;
	Tue, 21 Jun 2016 08:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Tue, 21 Jun 2016 08:01:57 -0700 (PDT)
In-Reply-To: <1466519942-5978-3-git-send-email-akuster808@gmail.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
	<1466519942-5978-3-git-send-email-akuster808@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Jun 2016 11:01:57 -0400
Message-ID: <CADkTA4PZjmyF7a_3UtmKBkhG_9Mu2_G_P0e69JywAGZbJ45hrQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] linux-yocto: add qemuppc64
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
X-List-Received-Date: Tue, 21 Jun 2016 15:02:00 -0000
Content-Type: multipart/alternative; boundary=001a11412dec3984270535cb1abe

--001a11412dec3984270535cb1abe
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 21, 2016 at 10:39 AM, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>

Is this for master ? If so, can you drop the SRCREV updates ? I have an
entire series
under test that bumps all the versions.

What is listed here, isn't ready to go yet.

Bruce


>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb | 22 ++++++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb | 22 ++++++++++++----------
>  2 files changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> index 667212f..6053ea3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> @@ -7,19 +7,21 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
>  KBRANCH_qemuarm64 ?= "standard/qemuarm64"
>  KBRANCH_qemumips ?= "standard/mti-malta32"
>  KBRANCH_qemuppc  ?= "standard/qemuppc"
> +KBRANCH_qemuppc64  ?= "standard/qemuppc"
>  KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "a6899b7c294ed25d9d37afde858cdd52f41f86b0"
> -SRCREV_machine_qemuarm64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> -SRCREV_machine_qemumips ?= "69936a9614608b7aa893ae78bd69e5cc197816c3"
> -SRCREV_machine_qemuppc ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> -SRCREV_machine_qemux86 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> -SRCREV_machine_qemux86-64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> -SRCREV_machine_qemumips64 ?= "f0eb9eabbeafa5eadf66893822ea42d80e04afbd"
> -SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
> -SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
> +SRCREV_machine_qemuarm ?= "a7b999561115b0b84814a2a27fe3f8c5b0599b0d"
> +SRCREV_machine_qemuarm64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> +SRCREV_machine_qemumips ?= "ce9d4e563925e65c7a4b73fd6027ed8d2a4fc5e4"
> +SRCREV_machine_qemuppc ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> +SRCREV_machine_qemuppc64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> +SRCREV_machine_qemux86 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> +SRCREV_machine_qemux86-64 ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> +SRCREV_machine_qemumips64 ?= "75260c1966188a38e070420624ac65b188f77948"
> +SRCREV_machine ?= "57f17e7008c57885ef5c41bda2829589e499ae28"
> +SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}
> "
> @@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index d69ecec..a277199 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -7,19 +7,21 @@ KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
>  KBRANCH_qemuarm64 ?= "standard/qemuarm64"
>  KBRANCH_qemumips ?= "standard/mti-malta32"
>  KBRANCH_qemuppc  ?= "standard/qemuppc"
> +KBRANCH_qemuppc64  ?= "standard/qemuppc"
>  KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "cdfdcbd7ee553dc2e483813054a378ef9eaa44b6"
> -SRCREV_machine_qemuarm64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> -SRCREV_machine_qemumips ?= "b1f51ad1d4e95be437bf7725e094d6ad1b8286b0"
> -SRCREV_machine_qemuppc ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> -SRCREV_machine_qemux86 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> -SRCREV_machine_qemux86-64 ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> -SRCREV_machine_qemumips64 ?= "4b17815085dbd2a0408d7969bf4689a4c2b12942"
> -SRCREV_machine ?= "bc64c8124504681545cb97a22b69a4e4bfeb55e2"
> -SRCREV_meta ?= "870134f4bfa6208d6e5339e065486be3b6e693a5"
> +SRCREV_machine_qemuarm ?= "ae04be16985c86803d8016b06aa57c02fe63cab3"
> +SRCREV_machine_qemuarm64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> +SRCREV_machine_qemumips ?= "1d16db0bce02f4f46a925e5425194de8d25a926e"
> +SRCREV_machine_qemuppc ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> +SRCREV_machine_qemuppc64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> +SRCREV_machine_qemux86 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> +SRCREV_machine_qemux86-64 ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> +SRCREV_machine_qemumips64 ?= "6fe42d5321cd24411c2a4b7f2aac8a01dfa82b8f"
> +SRCREV_machine ?= "1f3e98df094cb7afb7d3d540dd0e47b3b8c89711"
> +SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> "
> @@ -31,7 +33,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> --
> 1.9.1
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

--001a11412dec3984270535cb1abe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 21, 2016 at 10:39 AM, Armin Kuster <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Armin Kuste=
r &lt;<a href=3D"mailto:akuster@mvista.com">akuster@mvista.com</a>&gt;<br><=
/blockquote><div><br></div><div>Is this for master ? If so, can you drop th=
e SRCREV updates ? I have an entire series<br></div><div>under test that bu=
mps all the versions.<br><br></div><div>What is listed here, isn&#39;t read=
y to go yet.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a> | 22 ++++++++++++-=
---------<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> | 22 ++++++++++++-=
---------<br>
=C2=A02 files changed, 24 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_4.1.bb</a><br>
index 667212f..6053ea3 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a><br>
@@ -7,19 +7,21 @@ KBRANCH_qemuarm=C2=A0 ?=3D &quot;standard/arm-versatile-9=
26ejs&quot;<br>
=C2=A0KBRANCH_qemuarm64 ?=3D &quot;standard/qemuarm64&quot;<br>
=C2=A0KBRANCH_qemumips ?=3D &quot;standard/mti-malta32&quot;<br>
=C2=A0KBRANCH_qemuppc=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
+KBRANCH_qemuppc64=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
=C2=A0KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;a6899b7c294ed25d9d37afde858cdd52f41f86b0=
&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb0d56513=
ff&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;69936a9614608b7aa893ae78bd69e5cc197816c=
3&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb0d56513ff=
&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb0d56513ff=
&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb0d5651=
3ff&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;f0eb9eabbeafa5eadf66893822ea42d80e04a=
fbd&quot;<br>
-SRCREV_machine ?=3D &quot;9ba8c36e9ea7419d06accab5311e7fb0d56513ff&quot;<b=
r>
-SRCREV_meta ?=3D &quot;9f68667031354532563766a3d04ca8a618e9177a&quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;a7b999561115b0b84814a2a27fe3f8c5b0599b0d=
&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499ae=
28&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;ce9d4e563925e65c7a4b73fd6027ed8d2a4fc5e=
4&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499ae28=
&quot;<br>
+SRCREV_machine_qemuppc64 ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499ae=
28&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499ae28=
&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499a=
e28&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;75260c1966188a38e070420624ac65b188f77=
948&quot;<br>
+SRCREV_machine ?=3D &quot;57f17e7008c57885ef5c41bda2829589e499ae28&quot;<b=
r>
+SRCREV_meta ?=3D &quot;4b4199bd24f206d459061bb0a920d009429d5ed3&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.1.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto-4.1.git;name=3Dmachine;branch=
=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.1;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.1;destsu=
ffix=3D${KMETA}</a>&quot;<br>
@@ -31,7 +33,7 @@ PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qe=
mumips64|qemux86-64&quot;<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|q=
emumips|qemumips64|qemux86-64&quot;<br>
<br>
=C2=A0# Functionality flags<br>
=C2=A0KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc&quo=
t;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_4.4.bb</a><br>
index d69ecec..a277199 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
@@ -7,19 +7,21 @@ KBRANCH_qemuarm=C2=A0 ?=3D &quot;standard/arm-versatile-9=
26ejs&quot;<br>
=C2=A0KBRANCH_qemuarm64 ?=3D &quot;standard/qemuarm64&quot;<br>
=C2=A0KBRANCH_qemumips ?=3D &quot;standard/mti-malta32&quot;<br>
=C2=A0KBRANCH_qemuppc=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
+KBRANCH_qemuppc64=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
=C2=A0KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;cdfdcbd7ee553dc2e483813054a378ef9eaa44b6=
&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;bc64c8124504681545cb97a22b69a4e4bfeb55=
e2&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;b1f51ad1d4e95be437bf7725e094d6ad1b8286b=
0&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;bc64c8124504681545cb97a22b69a4e4bfeb55e2=
&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;bc64c8124504681545cb97a22b69a4e4bfeb55e2=
&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;bc64c8124504681545cb97a22b69a4e4bfeb5=
5e2&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;4b17815085dbd2a0408d7969bf4689a4c2b12=
942&quot;<br>
-SRCREV_machine ?=3D &quot;bc64c8124504681545cb97a22b69a4e4bfeb55e2&quot;<b=
r>
-SRCREV_meta ?=3D &quot;870134f4bfa6208d6e5339e065486be3b6e693a5&quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;ae04be16985c86803d8016b06aa57c02fe63cab3=
&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c897=
11&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;1d16db0bce02f4f46a925e5425194de8d25a926=
e&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c89711=
&quot;<br>
+SRCREV_machine_qemuppc64 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c897=
11&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c89711=
&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c89=
711&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;6fe42d5321cd24411c2a4b7f2aac8a01dfa82=
b8f&quot;<br>
+SRCREV_machine ?=3D &quot;1f3e98df094cb7afb7d3d540dd0e47b3b8c89711&quot;<b=
r>
+SRCREV_meta ?=3D &quot;8900370d334ab4f7224fa71d7d46d62f0b11199d&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.4.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto-4.4.git;name=3Dmachine;branch=
=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsu=
ffix=3D${KMETA}</a>&quot;<br>
@@ -31,7 +33,7 @@ PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qe=
mumips64|qemux86-64&quot;<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemuppc64|q=
emumips|qemumips64|qemux86-64&quot;<br>
<br>
=C2=A0# Functionality flags<br>
=C2=A0KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc&quo=
t;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a11412dec3984270535cb1abe--

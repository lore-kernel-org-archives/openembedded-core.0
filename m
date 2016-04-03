Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6A2731D1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 10:11:04 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id y204so16101268oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=rzlnZeTo5l72q/fIsPqj4XgR26ZNHIOqCOLGJdXQOuk=;
	b=HVOM7iJ13/3SItlnLJt7E6LoWgP1jALwA6vvTUz1+2twy3mdbpLHDVmYxW+JkC08Rw
	umBge2QD26DEs7EoHVD/kM/vIp0bIwn9cOfzmwrao6BhTb7x4AMZwNGB9e45y6LmLD9I
	llGjr+xyYVMMdwlVvV1dXboBGBO5gdqo+gva86LWuW3Y9x3tl38g9242cnz3c72G8rAU
	q61LeDk+Nlyd5+4Zoz3XFQpnHggbhhz4XQtxv4CTO9rPGIpGB0jCmz/TJaf2EBruTn8u
	KKEsHJrWzvCVf529BhMhE0dtIDZz6tWrv8CmF5pAmdsb7gFJ+bvNUYdirOkn3o/+5dPm
	eSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=rzlnZeTo5l72q/fIsPqj4XgR26ZNHIOqCOLGJdXQOuk=;
	b=jOIdusw1nh/w9O8E3+KEi4JfCBqT5ytuKfHMTKoyR88Eij1hBaK/6nbz7AW0zgpLmw
	4C5J42TYEXvS+EDxt2JfwL650oA6JJD25Q0Dh9+2shzfjpiDEDWPNGDmXKwtlvNF4wUY
	KDP1AnNHsrqp3/j5r/nrAUjEU5ewx4LVjh+W1Im9AqnjPbJxO3Ld6zdQFwO1NSdyyMK/
	tWLMWUp6UrhqdX830EQAWjKzLQnHKOSaP7FGwYm4sufNoJiGZF5ijZNyu4gK0JT8Ab+O
	BrhjpXUJtv7LhSQ9bCo94YMTDB3XZk1MkJJllg6lTRZjJQNHsmxJwELFLEO2mm6wuZQT
	UDYQ==
X-Gm-Message-State: AD7BkJKpnk9cEuCIpDITAAidOkY+0h0wWtdtxRSu3VjgpzDxwUigvjpLYlVrVHTeOVokZHTCSQ1moibQ+7Q41Q==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr9507036oib.96.1459678265150; Sun,
	03 Apr 2016 03:11:05 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Sun, 3 Apr 2016 03:11:05 -0700 (PDT)
In-Reply-To: <637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
Date: Sun, 3 Apr 2016 06:11:05 -0400
Message-ID: <CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Sun, 03 Apr 2016 10:11:05 -0000
Content-Type: multipart/alternative; boundary=001a113d5edc7b1538052f91d4fb

--001a113d5edc7b1538052f91d4fb
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> So that iso can work well, otherwise the iso is readonly and there would
> be errors. The other way is aufs, but overlayfs is more pupolar and had
> been merged by kernel mainline, we need make iso work well by default.
>

Nope. As I mentioned before, this can't be a always on default. It will
conflict
with other unionFS use cases.

If you want overlayfs enabled, it needs to be triggered from a specific
image
or distro feature.

Bruce



>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> index 48025c4..4f3beb7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> @@ -20,7 +20,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
>  COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>
>  # Functionality flags
> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
> features/taskstats/taskstats.scc"
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
> features/taskstats/taskstats.scc features/overlayfs/overlayfs.scc"
>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index 3d6991e..66bf956 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -34,7 +34,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  COMPATIBLE_MACHINE =
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>
>  # Functionality flags
> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
> features/overlayfs/overlayfs.scc"
>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> --
> 2.8.0
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

--001a113d5edc7b1538052f91d4fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">So that =
iso can work well, otherwise the iso is readonly and there would<br>
be errors. The other way is aufs, but overlayfs is more pupolar and had<br>
been merged by kernel mainline, we need make iso work well by default.<br><=
/blockquote><div><br></div><div>Nope. As I mentioned before, this can&#39;t=
 be a always on default. It will conflict</div><div>with other unionFS use =
cases.</div><div><br></div><div>If you want overlayfs enabled, it needs to =
be triggered from a specific image</div><div>or distro feature.</div><div><=
br></div><div>Bruce</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yo=
cto-rt_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</=
a> | 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a>=C2=A0 =C2=A0 | 2 +=
-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
</span>diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" rel=3D=
"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
index 48025c4..4f3beb7 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
@@ -20,7 +20,7 @@ LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm|qemuppc|qemu=
mips)&quot;<br>
<br>
=C2=A0# Functionality flags<br>
-KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc features=
/taskstats/taskstats.scc&quot;<br>
+KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc features=
/taskstats/taskstats.scc features/overlayfs/overlayfs.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_4.4.bb</a><br>
index 3d6991e..66bf956 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
@@ -34,7 +34,7 @@ KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|qemuppc|qemumi=
ps|qemumips64|qemux86-64&quot;<br>
<br>
=C2=A0# Functionality flags<br>
-KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc&quot;<br=
>
+KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.scc features=
/overlayfs/overlayfs.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
2.8.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113d5edc7b1538052f91d4fb--

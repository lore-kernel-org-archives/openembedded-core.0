Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 53879606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:15:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l9so1483665wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 22:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vo+VF4Q3iWoHCcTJKgJvkJYwYYt1lCv99InPyvVGOns=;
	b=ErL7LqSgDIvPJytaVUBxrLRosjMe6T8pGTux3TRxuGsBSGOCwfwN0Nc1/+G0dqEhtH
	Wft8RKmxAl35utvCDGfyy8TpUgBJ/9EwK3ubkvD05UDmt7GUTTKvx2NporUsnnSG/oNZ
	tR4PmaEAbjZvAoAGdnEX80Cjn2OG8IJDggOl/QBzK6XDnKAsJWvz1gPN8/vo5eEw9N+f
	gEmRdkZ0zCxEHxx/6XxSs3WuIyWlE9GRE5o8xM55FxkHc8jaJwbVXR+fKSYzG+5v7s2w
	7mRGTONHCMajZcr0nJ8XAvbyc14YSxIZzq9wv911EzZz4EFBlHGRhJojPMAsOoX9TESE
	tlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vo+VF4Q3iWoHCcTJKgJvkJYwYYt1lCv99InPyvVGOns=;
	b=ItfrvWFrQU+6CIKCdkG4IfDcDhVfUko6zFGNQ3knhxBuo5bkjzC3bHJZYzmYm64cNS
	JL2eKhZYu8Xn8hvhZoWebe2p8S6ghslzskRkbEL0FWMKZHB/hRE/ATizTj8BkyLplmb0
	gfNiZRCacioa9mufn71RnhfqfpZnqQSfos/wGeNL5GiyouSScnPpM2WHv7AtYDXtO6Od
	//Re0HrUiTFZTgiMVOM4t7hlltAQBzI9x75I0fAd8sTXLNyXN0GduFi026JjiGg2fOvh
	JKXo4xiEF9xER4cK0O9R/jv6pBmMSCXrB7M1mLz98c+S53G2LVsn4jwxZG+aDi2YFOLr
	rMPQ==
X-Gm-Message-State: AJcUukct0t/8GkJjvqdPeD4jfm+LIgAXFj6wqtDfchJ9zh+ivbpGXIDF
	7zk1I1Wq9heS+mE2+QeTl7SA5fpy3/F6b+/84zx5XQ==
X-Google-Smtp-Source: ALg8bN7HykBA/ND0NWzTaYTK5KaJfZhc8sPEdyrCU/arMBrXIv1zR+4DP47f8dYb75/nqXW5mXGT9wZndUmOb+Slq10=
X-Received: by 2002:adf:93e2:: with SMTP id 89mr1590220wrp.129.1547532930999; 
	Mon, 14 Jan 2019 22:15:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<b592c36a7bc200f1058adc383f9ee3338a569a98.1547477793.git.alex.kanavin@gmail.com>
In-Reply-To: <b592c36a7bc200f1058adc383f9ee3338a569a98.1547477793.git.alex.kanavin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Jan 2019 07:15:20 +0100
Message-ID: <CA+chaQds3QnkrhAs727A9R7GHjCP8rn6Hrw=a946G3Byeg6iww@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/23] runqemu: add support for virgl GL acceleration
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
X-List-Received-Date: Tue, 15 Jan 2019 06:15:30 -0000
Content-Type: multipart/alternative; boundary="000000000000a16d2b057f79162d"

--000000000000a16d2b057f79162d
Content-Type: text/plain; charset="UTF-8"

You're duplicating nographic elif

On Mon, Jan 14, 2019 at 4:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Also, do not hardcode -vga option to qemu, set it according to command
> line parameters.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/machine/include/qemuboot-x86.inc |  2 +-
>  scripts/runqemu                            | 11 +++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
> b/meta/conf/machine/include/qemuboot-x86.inc
> index 5fdbe4df50e..574b7bbfc7d 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -11,7 +11,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>  QB_AUDIO_DRV = "alsa"
>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE}
> oprofile.timer=1 uvesafb.task_timeout=-1"
> -QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
> +QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of
> entropy
>  QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0
> -device virtio-rng-pci,rng=rng0"
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c4a0ca811d9..fa88dc4583c 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -74,6 +74,8 @@ of the following environment variables (in any order):
>    MACHINE - the machine name (optional, autodetected from KERNEL filename
> if unspecified)
>    Simplified QEMU command-line options can be passed with:
>      nographic - disable video console
> +    gl - enable virgl-based GL acceleration
> +    gl-es - enable virgl-based GL acceleration, using OpenGL ES
>      serial - enable a serial console on /dev/ttyS0
>      serialstdio - enable a serial console on the console (regardless of
> graphics mode)
>      slirp - enable user networking, no root privileges is required
> @@ -427,12 +429,21 @@ class BaseConfig(object):
>                  sys.argv.remove(quiet)
>
>          unknown_arg = ""
> +        if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
> +            self.qemu_opt_script += ' -vga vmware'
>          for arg in sys.argv[1:]:
>              if arg in self.fstypes + self.vmtypes:
>                  self.check_arg_fstype(arg)
>              elif arg == 'nographic':
>                  self.qemu_opt_script += ' -nographic'
>                  self.kernel_cmdline_script += ' console=ttyS0'
> +            elif arg == 'gl':
> +                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
> +            elif arg == 'gl-es':
> +                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
> +            elif arg == 'nographic':
> +                self.qemu_opt_script += ' -nographic'
> +                self.kernel_cmdline_script += ' console=ttyS0'
>              elif arg == 'serial':
>                  self.kernel_cmdline_script += ' console=ttyS0'
>                  self.serialconsole = True
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a16d2b057f79162d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;re duplicating nographic elif</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Mon, Jan 14, 2019 at 4:06 PM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Also, do not hardcode -vga option to qemu, set it according to command li=
ne parameters.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/qemuboot-x86.inc |=C2=A0 2 +-<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++<br>
=C2=A02 files changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine=
/include/qemuboot-x86.inc<br>
index 5fdbe4df50e..574b7bbfc7d 100644<br>
--- a/meta/conf/machine/include/qemuboot-x86.inc<br>
+++ b/meta/conf/machine/include/qemuboot-x86.inc<br>
@@ -11,7 +11,7 @@ QB_CPU_KVM_x86-64 =3D &quot;-cpu core2duo&quot;<br>
=C2=A0QB_AUDIO_DRV =3D &quot;alsa&quot;<br>
=C2=A0QB_AUDIO_OPT =3D &quot;-soundhw ac97,es1370&quot;<br>
=C2=A0QB_KERNEL_CMDLINE_APPEND =3D &quot;vga=3D0 uvesafb.mode_option=3D${UV=
ESA_MODE} oprofile.timer=3D1 uvesafb.task_timeout=3D-1&quot;<br>
-QB_OPT_APPEND =3D &quot;-vga vmware -show-cursor -usb -device usb-tablet&q=
uot;<br>
+QB_OPT_APPEND =3D &quot;-show-cursor -usb -device usb-tablet&quot;<br>
=C2=A0# Add the &#39;virtio-rng-pci&#39; device otherwise the guest may run=
 out of entropy<br>
=C2=A0QB_OPT_APPEND +=3D &quot;-object rng-random,filename=3D/dev/urandom,i=
d=3Drng0 -device virtio-rng-pci,rng=3Drng0&quot;<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index c4a0ca811d9..fa88dc4583c 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -74,6 +74,8 @@ of the following environment variables (in any order):<br=
>
=C2=A0 =C2=A0MACHINE - the machine name (optional, autodetected from KERNEL=
 filename if unspecified)<br>
=C2=A0 =C2=A0Simplified QEMU command-line options can be passed with:<br>
=C2=A0 =C2=A0 =C2=A0nographic - disable video console<br>
+=C2=A0 =C2=A0 gl - enable virgl-based GL acceleration<br>
+=C2=A0 =C2=A0 gl-es - enable virgl-based GL acceleration, using OpenGL ES<=
br>
=C2=A0 =C2=A0 =C2=A0serial - enable a serial console on /dev/ttyS0<br>
=C2=A0 =C2=A0 =C2=A0serialstdio - enable a serial console on the console (r=
egardless of graphics mode)<br>
=C2=A0 =C2=A0 =C2=A0slirp - enable user networking, no root privileges is r=
equired<br>
@@ -427,12 +429,21 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.argv.remo=
ve(quiet)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unknown_arg =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;gl&#39; not in sys.argv[1:] and &#39;g=
l-es&#39; not in sys.argv[1:]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_script +=3D &#39; =
-vga vmware&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for arg in sys.argv[1:]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if arg in self.fstypes + se=
lf.vmtypes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_ar=
g_fstype(arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;nograp=
hic&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemu_opt=
_script +=3D &#39; -nographic&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_c=
mdline_script +=3D &#39; console=3DttyS0&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &#39;gl&#39;:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scri=
pt +=3D &#39; -vga virtio -display gtk,gl=3Don&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &#39;gl-es&#39;:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scri=
pt +=3D &#39; -vga virtio -display gtk,gl=3Des&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &#39;nographic&#=
39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_scri=
pt +=3D &#39; -nographic&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kernel_cmdlin=
e_script +=3D &#39; console=3DttyS0&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;serial=
&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_c=
mdline_script +=3D &#39; console=3DttyS0&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.serialco=
nsole =3D True<br>
-- <br>
2.17.1<br>
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

--000000000000a16d2b057f79162d--

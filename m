Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA3A73123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 14:26:13 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id w63so6411613ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D11hTQkKZWMTlqX7lF/egmr/f5/Z8L69BjD5NsGfvpg=;
	b=m0sojSS+PdOG1n+cwxrrmHuVJ7ZoxBOp0C74SUTEDyEJQbb4O4FPwpOmVVbDvlDyzF
	RNwOYuI+HiwbJJ18s8GDPZSpMmtiiQlRNu+b14wnj7T/yngemn5kvr9Lmkw51t9Cfpoo
	2JvatPNYe32S0sQCs1sBJjRe/NwJeSFHRoEIut7k5/EuFJiwnVzvjrL6KdBBRQ5i26/B
	EOrEJSeYW5CiV2TzV5EbT5b41yAKROg5cO/xvrmXG3uQC8DBCG0VJWWVHU7L9u2nNt92
	FPImdL89mkb6EfiqL7J4svYK97EcBTutkBdcwkmA0ONDi6+RuvjtPoAElM1N5ytQPnmw
	loCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D11hTQkKZWMTlqX7lF/egmr/f5/Z8L69BjD5NsGfvpg=;
	b=kbkrULy/VGCd7l/+OK6bnsqPitqwxoeQ25MLsB7GxFLs2qhGR0ji0Nc1wfIcJc3Dmv
	Oc1VvnAcbk1caPp1rMJJiRLIrCpuy81LFFWlUsBzgUZQvMY0opegFBUyUL1Rm/0hxrBW
	mS/XkZI26JXYRaSS6K3q83zWUkP/yk1l64mFgropzqIpTMMhCxBsz83zRwUgpTAzhHKU
	+UuG1sbftTzIQv2Ru8CUkcTp+Nw2pxfjXlt+CQCHyRKnS1upCWJoaG7jUKrooWJas0QC
	RJgyzjV/aq8LKh/+AjM4SEkMhMsvmOkruTZXHqPiw9iYLiaMnQetPbF3gK/yoVrSP2Kh
	91EA==
X-Gm-Message-State: APf1xPBZin6wKGsu7zNpTeEC/SomqSiXeAOSP8o6FLEfodbpcTRywKD7
	GyK3ccpqLJrehj1S1J66i+T94RcVmaHjGF7GrLqKgQ==
X-Google-Smtp-Source: AH8x226PFY/RS+B3eSooTBp5XYTOPiobR/w+m5Sr9+bbBQOviIHjL8Ndm6X6R8V2BYJHbu9uQaMvvBm4m6oU3DIQXnw=
X-Received: by 10.36.144.68 with SMTP id x65mr8397489itd.60.1519309575222;
	Thu, 22 Feb 2018 06:26:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 22 Feb 2018 06:25:54 -0800 (PST)
In-Reply-To: <20180222141537.229103-1-hongzhi.song@windriver.com>
References: <20180222141537.229103-1-hongzhi.song@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Feb 2018 14:25:54 +0000
Message-ID: <CAJTo0LaJ6EzLdBSs1K6n2u0O0DEtX8QJEEpdiQcv=vFh50_oyg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Thu, 22 Feb 2018 14:26:14 -0000
Content-Type: multipart/alternative; boundary="94eb2c07e806890c2e0565cdd35f"

--94eb2c07e806890c2e0565cdd35f
Content-Type: text/plain; charset="UTF-8"

We used to have this but it was removed in the 232 upgrade:

    * Drop mount propagation patch, it only happens with libseccomp, OE
doesnt
      enable it

Is this not the case?  Or are you enabling seccomp?  Maybe this should be a
bbappend in meta-security?

Ross

On 22 February 2018 at 14:15, Hongzhi.Song <hongzhi.song@windriver.com>
wrote:

> MountFlags's default value is shared in systemd-udevd.service. But upstream
> sets MountFlags with slave just for keeping mounts done by udev private to
> udevd, which causes block device mounted by udev unvisable but being busy
> for
> host. So we revert it to shared to be propagated to host.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  ...evd-re-enable-mount-propagation-for-udevd.patch | 33
> ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_234.bb           |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-udevd-re-
> enable-mount-propagation-for-udevd.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/systemd-udevd-re-
> enable-mount-propagation-for-udevd.patch b/meta/recipes-core/systemd/
> systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
> new file mode 100644
> index 0000000000..fce7bdd796
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-udevd-re-
> enable-mount-propagation-for-udevd.patch
> @@ -0,0 +1,33 @@
> +From 11a3312d36109f5e5a7697ddb05c533c51e2cd75 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Mon, 19 Feb 2018 20:43:02 -0500
> +Subject: [PATCH] systemd-udevd: re-enable mount propagation for udevd
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Change the mount propagation flag from MountFlags=slave to
> MountFlags=shared
> +(default). Use shared to ensure that mounts and unmounts are propagated
> from
> +systemd's namespace to the service's namespace and vice versa, while use
> slave
> +to run processes so that none of their mounts and unmounts will propagate
> to
> +the host.
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + units/systemd-udevd.service.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/units/systemd-udevd.service.in b/units/
> systemd-udevd.service.in
> +index fc037b5..841d7a8 100644
> +--- a/units/systemd-udevd.service.in
> ++++ b/units/systemd-udevd.service.in
> +@@ -24,7 +24,6 @@ ExecStart=@rootlibexecdir@/systemd-udevd
> + KillMode=mixed
> + WatchdogSec=3min
> + TasksMax=infinity
> +-MountFlags=slave
> + MemoryDenyWriteExecute=yes
> + RestrictRealtime=yes
> + RestrictAddressFamilies=AF_UNIX AF_NETLINK AF_INET AF_INET6
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_234.bb
> b/meta/recipes-core/systemd/systemd_234.bb
> index babc351cc8..42f4f1ec76 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -32,6 +32,7 @@ SRC_URI += " \
>             file://0001-main-skip-many-initialization-steps-when-running-in-.patch
> \
>             file://CVE-2017-18078.patch \
>             file://0001-resolved-fix-loop-on-packets-with-pseudo-dns-types.patch
> \
> +          file://systemd-udevd-re-enable-mount-propagation-for-udevd.patch
> \
>             "
>  SRC_URI_append_qemuall = " file://0001-core-device.c-
> Change-the-default-device-timeout-to-2.patch"
>
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c07e806890c2e0565cdd35f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We used to have this but it was removed in the 232 upgrade=
:<div><br></div><div><div>=C2=A0 =C2=A0 * Drop mount propagation patch, it =
only happens with libseccomp, OE doesnt</div><div>=C2=A0 =C2=A0 =C2=A0 enab=
le it</div></div><div><br></div><div>Is this not the case?=C2=A0 Or are you=
 enabling seccomp?=C2=A0 Maybe this should be a bbappend in meta-security?<=
/div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 22 February 2018 at 14:15, Hongzhi.Song <span di=
r=3D"ltr">&lt;<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_blan=
k">hongzhi.song@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">MountFlags&#39;s default value is shared in systemd-udevd.servic=
e. But upstream<br>
sets MountFlags with slave just for keeping mounts done by udev private to<=
br>
udevd, which causes block device mounted by udev unvisable but being busy f=
or<br>
host. So we revert it to shared to be propagated to host.<br>
<br>
Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.co=
m">hongzhi.song@windriver.com</a>&gt;<br>
---<br>
=C2=A0...evd-re-enable-mount-<wbr>propagation-for-udevd.patch | 33 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">syst<wbr>emd_234.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<wbr>systemd/systemd-ude=
vd-re-<wbr>enable-mount-propagation-for-<wbr>udevd.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/systemd-udevd-re-<wbr>e=
nable-mount-propagation-for-<wbr>udevd.patch b/meta/recipes-core/systemd/<w=
br>systemd/systemd-udevd-re-<wbr>enable-mount-propagation-for-<wbr>udevd.pa=
tch<br>
new file mode 100644<br>
index 0000000000..fce7bdd796<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/systemd-udevd-re-<wbr>enable-m=
ount-propagation-for-<wbr>udevd.patch<br>
@@ -0,0 +1,33 @@<br>
+From 11a3312d36109f5e5a7697ddb05c53<wbr>3c51e2cd75 Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@windrive=
r.com">hongzhi.song@windriver.com</a>&gt;<br>
+Date: Mon, 19 Feb 2018 20:43:02 -0500<br>
+Subject: [PATCH] systemd-udevd: re-enable mount propagation for udevd<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+Change the mount propagation flag from MountFlags=3Dslave to MountFlags=3D=
shared<br>
+(default). Use shared to ensure that mounts and unmounts are propagated fr=
om<br>
+systemd&#39;s namespace to the service&#39;s namespace and vice versa, whi=
le use slave<br>
+to run processes so that none of their mounts and unmounts will propagate =
to<br>
+the host.<br>
+<br>
+Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.c=
om">hongzhi.song@windriver.com</a>&gt;<br>
+---<br>
+ units/<a href=3D"http://systemd-udevd.service.in" rel=3D"noreferrer" targ=
et=3D"_blank">systemd-udevd.service.in</a> | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/units/<a href=3D"http://systemd-udevd.service.in" rel=3D"nore=
ferrer" target=3D"_blank">systemd-udevd.service.<wbr>in</a> b/units/<a href=
=3D"http://systemd-udevd.service.in" rel=3D"noreferrer" target=3D"_blank">s=
ystemd-udevd.service.<wbr>in</a><br>
+index fc037b5..841d7a8 100644<br>
+--- a/units/<a href=3D"http://systemd-udevd.service.in" rel=3D"noreferrer"=
 target=3D"_blank">systemd-udevd.service.<wbr>in</a><br>
++++ b/units/<a href=3D"http://systemd-udevd.service.in" rel=3D"noreferrer"=
 target=3D"_blank">systemd-udevd.service.<wbr>in</a><br>
+@@ -24,7 +24,6 @@ ExecStart=3D@rootlibexecdir@/<wbr>systemd-udevd<br>
+ KillMode=3Dmixed<br>
+ WatchdogSec=3D3min<br>
+ TasksMax=3Dinfinity<br>
+-MountFlags=3Dslave<br>
+ MemoryDenyWriteExecute=3Dyes<br>
+ RestrictRealtime=3Dyes<br>
+ RestrictAddressFamilies=3DAF_<wbr>UNIX AF_NETLINK AF_INET AF_INET6<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" re=
l=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" target=3D"=
_blank">sy<wbr>stemd_234.bb</a><br>
index babc351cc8..42f4f1ec76 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
@@ -32,6 +32,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-main-skip-many-<wbr>i=
nitialization-steps-when-<wbr>running-in-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-18078.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-resolved-fix-loop-<wb=
r>on-packets-with-pseudo-dns-<wbr>types.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://systemd-udevd-re-<wbr>enable-mou=
nt-propagation-for-<wbr>udevd.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_qemuall =3D &quot; file://0001-core-device.c-<wbr>Chan=
ge-the-default-device-<wbr>timeout-to-2.patch&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.13.3<br>
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

--94eb2c07e806890c2e0565cdd35f--

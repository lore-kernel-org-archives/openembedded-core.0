Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 45E4C780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 13:20:59 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id d123so1787274ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yRVOra/mKUUI8qn0arGh90Cxd8BGSagcCvLXcC1bqCc=;
	b=EAjh8qWC/8J68XOpOvje1h4zFGRi9IM5EQX/Fv6vkp7SLNpNCrN0IpJdoLb5lLCxmV
	hG1f4ltw5gZUnKFrWIwLqmjLn/9LuB0U+1/qVfCQrprcshVB3HucUlNq2wln4Aoydlqi
	8gDQRnBghYMJ68kGW3ob3WITdJqevSGLkLXVa8b1ehzbtwwgsSc0LbZAg5wfCLghgRIt
	0n3R/e2ua2rvYwkTMzm8dXxIzNZDO6ls5wjGbgi9JR2jI2I2Grygnh+2A9Agtt9w65Gb
	OEajYkgOL27fhOr/M+V99WcVWW5zVt7Nv+Yfs6pdjQj3kNfxna3k+IrzU+ZIg5pdBqxf
	xNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yRVOra/mKUUI8qn0arGh90Cxd8BGSagcCvLXcC1bqCc=;
	b=ukieHIaHA1J3fjwzxpORWXWiDgR/M93aafvGTO49xIrlZwqJygjmhd1bLJCIu4aY/D
	/BB+HZF+bke6wUEShsnH39uE63arxwaSxTjk2H3K86du/L6XXIT0CsWGHKzkebzWdDwA
	+kKC6+jfDbOVrTf3bY7I32f+22DJhuRunTG4LeQ3NczLtgOm0JkkaFYKAVTR0BhTDxmQ
	nxM+oI/7iD5S05hX39MyV77TMvXznEVAorSrt9thz611tNkbQNESkM+83rpf7f6RMB0U
	bupDxj4G9M1I+OfQTb/4FaalMV/lAhkL/fzVfscag5OriStpEIecLIK+LeHoZIis0xeh
	X6Tg==
X-Gm-Message-State: AHPjjUhesUhcuBpZuQND3Cl6CU3h2ilf2QB4D4R7WYTfChlsx+Fh3AP4
	+rez8/+LFj31h5AQPoAlXAThrssPo721bGpv5eGI4g==
X-Google-Smtp-Source: AOwi7QDgYInDNWHJ/Ql+Y2FwC5YsBXPBk0OH6P1bjNcyEXQ+YtAfOlxAXtKfWZbp3FPYYjauUYfDXdQgXaCh1io9P0g=
X-Received: by 10.36.162.67 with SMTP id o3mr1743751iti.27.1505827260897; Tue,
	19 Sep 2017 06:21:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 06:20:40 -0700 (PDT)
In-Reply-To: <20170919131639.28283-1-ferlandm@amotus.ca>
References: <20170919131639.28283-1-ferlandm@amotus.ca>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 14:20:40 +0100
Message-ID: <CAJTo0LaYPP5B99Z2OuubMY2199BU8=SqPaM82F4fK0j_CqkOvg@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5: Upgrade 5.46 -> 5.47
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
X-List-Received-Date: Tue, 19 Sep 2017 13:21:00 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a2fad05905598aba5e"

--f403045fb2a2fad05905598aba5e
Content-Type: text/plain; charset="UTF-8"

It's too late for this in master, but I've queued it in my branch for when
master reopens.

Ross

On 19 September 2017 at 14:16, Marc Ferland <ferlandm@amotus.ca> wrote:

> This release includes:
>
> - SDP fix for CVE-2017-1000250.
> - New bluetooth mesh profile.
> - Various fixes to GATT, A2DP and BR/EDR vs LE bearer handling.
>
> This commit also drops the following two patches which are included in
> 5.47:
>
> - 0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
> - cve-2017-1000250.patch
>
> Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  3 +-
>  ...cm43xx-fix-the-delay-timer-for-firmware-d.patch | 36
> ----------------------
>  .../bluez5/bluez5/cve-2017-1000250.patch           | 34
> --------------------
>  .../bluez5/{bluez5_5.46.bb => bluez5_5.47.bb}      |  4 +--
>  4 files changed, 3 insertions(+), 74 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/
> bluez5/bluez5/0001-hciattach-bcm43xx-fix-the-delay-timer-
> for-firmware-d.patch
>  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-
> 1000250.patch
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.46.bb => bluez5_5.47.bb}
> (91%)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 2ae4553d48..3a8d3476ea 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -41,6 +41,7 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-
> sixaxis"
>  PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
>  PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>  PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
> +PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c"
>
>  SRC_URI = "\
>      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> @@ -49,8 +50,6 @@ SRC_URI = "\
>      file://run-ptest \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
> 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch',
> d)} \
>      file://0001-tests-add-a-target-for-building-tests-without-runnin.patch
> \
> -    file://0001-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
> \
> -    file://cve-2017-1000250.patch \
>  "
>  S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-
> bcm43xx-fix-the-delay-timer-for-firmware-d.patch
> b/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-
> bcm43xx-fix-the-delay-timer-for-firmware-d.patch
> deleted file mode 100644
> index 46794381f7..0000000000
> --- a/meta/recipes-connectivity/bluez5/bluez5/0001-hciattach-
> bcm43xx-fix-the-delay-timer-for-firmware-d.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 3b341fb421ef61db7782bf1314ec693828467de9 Mon Sep 17 00:00:00 2001
> -From: Andy Duan <fugang.duan@nxp.com>
> -Date: Wed, 23 Nov 2016 17:12:12 +0800
> -Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware
> download
> -
> -From the log in .bcm43xx_load_firmware():
> -        /* Wait 50ms to let the firmware placed in download mode */
> -        nanosleep(&tm_mode, NULL);
> -
> -But timespec tm_mode is real is 50us. Correct the delayed timer count.
> -
> -Upstream-Status: Accepted [https://git.kernel.org/pub/
> scm/bluetooth/bluez.git/commit/?id=76255f732d68aef2b90d36d9c7be51
> a9e1739ce7]
> -
> -Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> ----
> - tools/hciattach_bcm43xx.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/hciattach_bcm43xx.c b/tools/hciattach_bcm43xx.c
> -index 81f38cb..ac1b3c1 100644
> ---- a/tools/hciattach_bcm43xx.c
> -+++ b/tools/hciattach_bcm43xx.c
> -@@ -228,8 +228,8 @@ static int bcm43xx_set_speed(int fd, struct termios
> *ti, uint32_t speed)
> - static int bcm43xx_load_firmware(int fd, const char *fw)
> - {
> -       unsigned char cmd[] = { HCI_COMMAND_PKT, 0x2e, 0xfc, 0x00 };
> --      struct timespec tm_mode = { 0, 50000 };
> --      struct timespec tm_ready = { 0, 2000000 };
> -+      struct timespec tm_mode = { 0, 50000000 };
> -+      struct timespec tm_ready = { 0, 200000000 };
> -       unsigned char resp[CC_MIN_SIZE];
> -       unsigned char tx_buf[1024];
> -       int len, fd_fw, n;
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> deleted file mode 100644
> index 9fac961bcf..0000000000
> --- a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable
> to an
> -information disclosure vulnerability which allows remote attackers to
> obtain
> -sensitive information from the bluetoothd process memory. This
> vulnerability
> -lies in the processing of SDP search attribute requests.
> -
> -CVE: CVE-2017-1000250
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
> -From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> -Date: Wed, 13 Sep 2017 10:01:40 +0300
> -Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req
> function
> -
> -Check if there is enough data to continue otherwise return an error.
> ----
> - src/sdpd-request.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/sdpd-request.c b/src/sdpd-request.c
> -index 1eefdce..318d044 100644
> ---- a/src/sdpd-request.c
> -+++ b/src/sdpd-request.c
> -@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req,
> sdp_buf_t *buf)
> -       } else {
> -               /* continuation State exists -> get from cache */
> -               sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
> --              if (pCache) {
> -+              if (pCache && cstate->cStateValue.maxBytesSent <
> pCache->data_size) {
> -                       uint16_t sent = MIN(max, pCache->data_size -
> cstate->cStateValue.maxBytesSent);
> -                       pResponse = pCache->data;
> -                       memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent,
> sent);
> ---
> -cgit v1.1
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> b/meta/recipes-connectivity/bluez5/bluez5_5.47.bb
> similarity index 91%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.47.bb
> index e1f85879ce..49666f226c 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.47.bb
> @@ -2,8 +2,8 @@ require bluez5.inc
>
>  REQUIRED_DISTRO_FEATURES = "bluez5"
>
> -SRC_URI[md5sum] = "913f35d6fa4ca5772c53adb936bf1947"
> -SRC_URI[sha256sum] = "ddab3d3837c1afb8ae228a94ba1770
> 9a4650bd4db24211b6771ab735c8908e28"
> +SRC_URI[md5sum] = "783e15f65e70cdb8f721c659e140dd56"
> +SRC_URI[sha256sum] = "cf75bf7cd5d564f21cc4a2bd01d5c3
> 9ce425397335fd47d9bbe43af0a58342c8"
>
>  # noinst programs in Makefile.tools that are conditional on READLINE
>  # support
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045fb2a2fad05905598aba5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s too late for this in master, but I&#39;ve queued =
it in my branch for when master reopens.<div><br></div><div>Ross</div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 September =
2017 at 14:16, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"mailto:ferland=
m@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This release includes:<br>
<br>
- SDP fix for CVE-2017-1000250.<br>
- New bluetooth mesh profile.<br>
- Various fixes to GATT, A2DP and BR/EDR vs LE bearer handling.<br>
<br>
This commit also drops the following two patches which are included in<br>
5.47:<br>
<br>
- 0001-hciattach-bcm43xx-fix-<wbr>the-delay-timer-for-firmware-<wbr>d.patch=
<br>
- cve-2017-1000250.patch<br>
<br>
Signed-off-by: Marc Ferland &lt;<a href=3D"mailto:ferlandm@amotus.ca">ferla=
ndm@amotus.ca</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/<wbr>bluez5/bluez5.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 3 +-<br>
=C2=A0...cm43xx-fix-the-delay-timer-<wbr>for-firmware-d.patch | 36 --------=
--------------<br>
=C2=A0.../bluez5/bluez5/cve-2017-<wbr>1000250.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 34 --------------------<br>
=C2=A0.../bluez5/{<a href=3D"http://bluez5_5.46.bb" rel=3D"noreferrer" targ=
et=3D"_blank">bluez5_5.46.bb</a> =3D&gt; <a href=3D"http://bluez5_5.47.bb" =
rel=3D"noreferrer" target=3D"_blank">bluez5_5.47.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +--<br>
=C2=A04 files changed, 3 insertions(+), 74 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>bluez5/bluez5/0001-=
hciattach-<wbr>bcm43xx-fix-the-delay-timer-<wbr>for-firmware-d.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2=
017-<wbr>1000250.patch<br>
=C2=A0rename meta/recipes-connectivity/<wbr>bluez5/{<a href=3D"http://bluez=
5_5.46.bb" rel=3D"noreferrer" target=3D"_blank">bluez5_5.46.bb</a> =3D&gt; =
<a href=3D"http://bluez5_5.47.bb" rel=3D"noreferrer" target=3D"_blank">blue=
z5_5.47.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc b/meta/recipe=
s-connectivity/<wbr>bluez5/bluez5.inc<br>
index 2ae4553d48..3a8d3476ea 100644<br>
--- a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
+++ b/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
@@ -41,6 +41,7 @@ PACKAGECONFIG[sixaxis] =3D &quot;--enable-sixaxis,--disab=
le-<wbr>sixaxis&quot;<br>
=C2=A0PACKAGECONFIG[tools] =3D &quot;--enable-tools,--disable-<wbr>tools&qu=
ot;<br>
=C2=A0PACKAGECONFIG[threads] =3D &quot;--enable-threads,--disable-<wbr>thre=
ads&quot;<br>
=C2=A0PACKAGECONFIG[deprecated] =3D &quot;--enable-deprecated,--<wbr>disabl=
e-deprecated&quot;<br>
+PACKAGECONFIG[mesh] =3D &quot;--enable-mesh,--disable-mesh, json-c&quot;<b=
r>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${KERNELORG_MIRROR}/linux/<wbr>bluetooth/bluez-${PV}.ta=
r.xz \<br>
@@ -49,8 +50,6 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;systemd&#39;, &#39;&#39;, &#39;file://0001-Allow-using-<wbr>obexd-withou=
t-systemd-in-the-<wbr>user-sessio.patch&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-tests-add-a-<wbr>target-for-building-tests-=
<wbr>without-runnin.patch \<br>
-=C2=A0 =C2=A0 file://0001-hciattach-bcm43xx-<wbr>fix-the-delay-timer-for-<=
wbr>firmware-d.patch \<br>
-=C2=A0 =C2=A0 file://cve-2017-1000250.patch \<br>
=C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/bluez-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5/0001-hciattach-<w=
br>bcm43xx-fix-the-delay-timer-<wbr>for-firmware-d.patch b/meta/recipes-con=
nectivity/<wbr>bluez5/bluez5/0001-hciattach-<wbr>bcm43xx-fix-the-delay-time=
r-<wbr>for-firmware-d.patch<br>
deleted file mode 100644<br>
index 46794381f7..0000000000<br>
--- a/meta/recipes-connectivity/<wbr>bluez5/bluez5/0001-hciattach-<wbr>bcm4=
3xx-fix-the-delay-timer-<wbr>for-firmware-d.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 3b341fb421ef61db7782bf1314ec69<wbr>3828467de9 Mon Sep 17 00:00:00 200=
1<br>
-From: Andy Duan &lt;<a href=3D"mailto:fugang.duan@nxp.com">fugang.duan@nxp=
.com</a>&gt;<br>
-Date: Wed, 23 Nov 2016 17:12:12 +0800<br>
-Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware down=
load<br>
-<br>
-From the log in .bcm43xx_load_firmware():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Wait 50ms to let the firmware placed in dow=
nload mode */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nanosleep(&amp;tm_mode, NULL);<br>
-<br>
-But timespec tm_mode is real is 50us. Correct the delayed timer count.<br>
-<br>
-Upstream-Status: Accepted [<a href=3D"https://git.kernel.org/pub/scm/bluet=
ooth/bluez.git/commit/?id=3D76255f732d68aef2b90d36d9c7be51a9e1739ce7" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/bluet=
ooth/bluez.git/<wbr>commit/?id=3D<wbr>76255f732d68aef2b90d36d9c7be51<wbr>a9=
e1739ce7</a>]<br>
-<br>
-Signed-off-by: Fugang Duan &lt;<a href=3D"mailto:fugang.duan@nxp.com">fuga=
ng.duan@nxp.com</a>&gt;<br>
----<br>
- tools/hciattach_bcm43xx.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/tools/hciattach_bcm43xx.c b/tools/hciattach_bcm43xx.c<br>
-index 81f38cb..ac1b3c1 100644<br>
---- a/tools/hciattach_bcm43xx.c<br>
-+++ b/tools/hciattach_bcm43xx.c<br>
-@@ -228,8 +228,8 @@ static int bcm43xx_set_speed(int fd, struct termios *t=
i, uint32_t speed)<br>
- static int bcm43xx_load_firmware(int fd, const char *fw)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char cmd[] =3D { HCI_COMMAND_PKT, 0x2e=
, 0xfc, 0x00 };<br>
--=C2=A0 =C2=A0 =C2=A0 struct timespec tm_mode =3D { 0, 50000 };<br>
--=C2=A0 =C2=A0 =C2=A0 struct timespec tm_ready =3D { 0, 2000000 };<br>
-+=C2=A0 =C2=A0 =C2=A0 struct timespec tm_mode =3D { 0, 50000000 };<br>
-+=C2=A0 =C2=A0 =C2=A0 struct timespec tm_ready =3D { 0, 200000000 };<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char resp[CC_MIN_SIZE];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char tx_buf[1024];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int len, fd_fw, n;<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>100=
0250.patch b/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>100=
0250.patch<br>
deleted file mode 100644<br>
index 9fac961bcf..0000000000<br>
--- a/meta/recipes-connectivity/<wbr>bluez5/bluez5/cve-2017-<wbr>1000250.pa=
tch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to=
 an<br>
-information disclosure vulnerability which allows remote attackers to obta=
in<br>
-sensitive information from the bluetoothd process memory. This vulnerabili=
ty<br>
-lies in the processing of SDP search attribute requests.<br>
-<br>
-CVE: CVE-2017-1000250<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-From 9e009647b14e810e06626dde7f1bb9<wbr>ea3c375d09 Mon Sep 17 00:00:00 200=
1<br>
-From: Luiz Augusto von Dentz &lt;<a href=3D"mailto:luiz.von.dentz@intel.co=
m">luiz.von.dentz@intel.com</a>&gt;<br>
-Date: Wed, 13 Sep 2017 10:01:40 +0300<br>
-Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req funct=
ion<br>
-<br>
-Check if there is enough data to continue otherwise return an error.<br>
----<br>
- src/sdpd-request.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/sdpd-request.c b/src/sdpd-request.c<br>
-index 1eefdce..318d044 100644<br>
---- a/src/sdpd-request.c<br>
-+++ b/src/sdpd-request.c<br>
-@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_<wbr>req_t *req=
, sdp_buf_t *buf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* continuation Sta=
te exists -&gt; get from cache */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdp_buf_t *pCache =
=3D sdp_get_cached_rsp(cstate);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pCache) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pCache &amp;&amp; cs=
tate-&gt;cStateValue.<wbr>maxBytesSent &lt; pCache-&gt;data_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint16_t sent =3D MIN(max, pCache-&gt;data_size - cstate-&gt;cSta=
teValue.<wbr>maxBytesSent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pResponse =3D pCache-&gt;data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memcpy(buf-&gt;data, pResponse + cstate-&gt;cStateValue.<wbr>maxB=
ytesSent, sent);<br>
---<br>
-cgit v1.1<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/<a href=3D"http://bluez5=
_5.46.bb" rel=3D"noreferrer" target=3D"_blank">bluez5_5.46.bb</a> b/meta/re=
cipes-connectivity/<wbr>bluez5/<a href=3D"http://bluez5_5.47.bb" rel=3D"nor=
eferrer" target=3D"_blank">bluez5_5.47.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-connectivity/<wbr>bluez5/<a href=3D"http://bluez5_=
5.46.bb" rel=3D"noreferrer" target=3D"_blank">bluez5_5.46.bb</a><br>
rename to meta/recipes-connectivity/<wbr>bluez5/<a href=3D"http://bluez5_5.=
47.bb" rel=3D"noreferrer" target=3D"_blank">bluez5_5.47.bb</a><br>
index e1f85879ce..49666f226c 100644<br>
--- a/meta/recipes-connectivity/<wbr>bluez5/<a href=3D"http://bluez5_5.46.b=
b" rel=3D"noreferrer" target=3D"_blank">bluez5_5.46.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>bluez5/<a href=3D"http://bluez5_5.47.b=
b" rel=3D"noreferrer" target=3D"_blank">bluez5_5.47.bb</a><br>
@@ -2,8 +2,8 @@ require bluez5.inc<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;bluez5&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>913f35d6fa4ca5772c53adb936bf19<wbr>47&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>ddab3d3837c1afb8ae228a94ba1770<wbr>9a465=
0bd4db24211b6771ab735c890<wbr>8e28&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>783e15f65e70cdb8f721c659e140dd<wbr>56&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>cf75bf7cd5d564f21cc4a2bd01d5c3<wbr>9ce42=
5397335fd47d9bbe43af0a583<wbr>42c8&quot;<br>
<br>
=C2=A0# noinst programs in Makefile.tools that are conditional on READLINE<=
br>
=C2=A0# support<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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

--f403045fb2a2fad05905598aba5e--

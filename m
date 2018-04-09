Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id EF7D7747C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 00:54:56 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id t20-v6so1262411ply.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Apr 2018 17:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HmajEOyV69TmsbeOjgxvKmsinL8V4NjsmWZSuHmppKo=;
	b=LUaFkuP1TY6JonrhOwtA5PlRazb6v6tHtuBH8Z5WsDSDulb5Xgr1w5PyweTtWRcbng
	nvQS6xy+Y8B25pzPVcZWpZ5HbLcP1qHch1j+o/n7TlkIsX67kgM59a7bm3fM1zw/0VsF
	uEPXg47rDcjYXy8ZGZkxVEoIDPzE+QCEyNMOw6Pga8zZmas0SzAwhkNug1U2D3dW9HlD
	39P4PSexI7EJoSVt8s9An0gAmLW+dLgXqFa/5dwd2CUhoNqdqQzbZOCXZrTYxdY5xmrs
	V7aWagxkJugd3iuYPKTu/DevDCfBPwr5qzswgMG/xDkZ4er2UuQUPNQAIJZ5tUKvn7rW
	y8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HmajEOyV69TmsbeOjgxvKmsinL8V4NjsmWZSuHmppKo=;
	b=nOaOyDA77F4AQj7w8NlNhYfVuLSp5EkErEj0lbDW7z+vy++lIF3GIlpDg9mtlRyqXg
	hdL/hxlzLE7TY+++f8avWMVVym91b8rBk++F+xIaL7fBdSgKiUTJ33DJzsR9cvxQPHkT
	vrQcKqQA9uArj9Bywa45v2ynmquHP9yzJTfONffZL9AB7KDlywBBFLIHgu0Qhs4KCw3K
	5FJJSdBBKpNBTNU/VrC4Tl+SyvsOpz9er/6RJafFNSS6y47voHmHSBHVahmTRPZKQOwk
	drH9pS3xWHCHeKZv0T3Tw4NfBZGzZmnXYypif3YIOnAd08U6RrdqG1iIa+bOckbCkdkX
	5owg==
X-Gm-Message-State: AElRT7F1cI2Ohch+AvTw1A9B7K9TLQi4nln46puLBm8XqA8W6snKLFWZ
	tOdkGcIh5wkuwiJLJyzJTdsyXfGAzZDRIhtr+As=
X-Google-Smtp-Source: AIpwx4+ZJBpIeFfBLv82xIA6BQCvSOK1wmVgUD/8JTqHjVwrm+W7iq1Cf8aBXb350gYaiFtOoNfDZ7Uu3+AzFJZCj4U=
X-Received: by 2002:a17:902:244:: with SMTP id
	62-v6mr27955954plc.125.1523235297935; 
	Sun, 08 Apr 2018 17:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180408230223.17260-1-marex@denx.de>
In-Reply-To: <20180408230223.17260-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 09 Apr 2018 00:54:47 +0000
Message-ID: <CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 09 Apr 2018 00:54:57 -0000
Content-Type: multipart/alternative; boundary="000000000000d7c36705695fdaa9"

--000000000000d7c36705695fdaa9
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de> wrote:

> This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
> patches accepted upstream, getting the patch count to zero.



It fails for me if I have libfdt installed on build host
It seems build is doing the include dance which goes all the way into hosts
system include directories

>
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19
> -------------------
>  ...t-common_2018.01.inc => u-boot-common_2018.03.inc} |  6 ++----
>  ...fw-utils_2018.01.bb => u-boot-fw-utils_2018.03.bb} |  0
>  ...t-mkimage_2018.01.bb => u-boot-mkimage_2018.03.bb} |  0
>  .../u-boot/{u-boot_2018.01.bb => u-boot_2018.03.bb}   |  0
>  5 files changed, 2 insertions(+), 23 deletions(-)
>  delete mode 100644
> meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc =>
> u-boot-common_2018.03.inc} (68%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.01.bb =>
> u-boot-fw-utils_2018.03.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.01.bb =>
> u-boot-mkimage_2018.03.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2018.01.bb => u-boot_2018.03.bb}
> (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
> b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
> deleted file mode 100644
> index ecaa1796a4..0000000000
> --- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Enabled dhcp client functionality for Yocto reference
> -hardware MPC8315E-RDB.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> -
> -Index: git/configs/MPC8315ERDB_defconfig
> -===================================================================
> ---- git.orig/configs/MPC8315ERDB_defconfig
> -+++ git/configs/MPC8315ERDB_defconfig
> -@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
> - CONFIG_CMD_SATA=y
> - CONFIG_CMD_USB=y
> - # CONFIG_CMD_SETEXPR is not set
> -+CONFIG_CMD_DHCP=y
> - CONFIG_CMD_MII=y
> - CONFIG_CMD_PING=y
> - CONFIG_CMD_DATE=y
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
> b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
> similarity index 68%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
> index d2073ea0c7..8ffae365a9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
> @@ -7,10 +7,8 @@ PE = "1"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
> +SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
>
> -SRC_URI = "git://git.denx.de/u-boot.git \
> -    file://MPC8315ERDB-enable-DHCP.patch \
> -"
> +SRC_URI = "git://git.denx.de/u-boot.git"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.01.bb
> b/meta/recipes-bsp/u-boot/u-boot_2018.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2018.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2018.03.bb
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d7c36705695fdaa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sun, Apr 8, 2018 a=
t 4:10 PM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This upgrades the U-Bo=
ot from 2018.01 to 2018.03 release and drops<br>
patches accepted upstream, getting the patch count to zero.</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">It f=
ails for me if I have libfdt installed on build host=C2=A0</div><div dir=3D=
"auto">It seems build is doing the include dance which goes all the way int=
o hosts system include directories=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
Cc: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" target=
=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bla=
nk">ross.burton@intel.com</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0.../u-boot/files/MPC8315ERDB-enable-DHCP.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 19 -------------------<br>
=C2=A0...t-common_2018.01.inc =3D&gt; u-boot-common_2018.03.inc} |=C2=A0 6 =
++----<br>
=C2=A0...<a href=3D"http://fw-utils_2018.01.bb" rel=3D"noreferrer" target=
=3D"_blank">fw-utils_2018.01.bb</a> =3D&gt; <a href=3D"http://u-boot-fw-uti=
ls_2018.03.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2018.03=
.bb</a>} |=C2=A0 0<br>
=C2=A0...<a href=3D"http://t-mkimage_2018.01.bb" rel=3D"noreferrer" target=
=3D"_blank">t-mkimage_2018.01.bb</a> =3D&gt; <a href=3D"http://u-boot-mkima=
ge_2018.03.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.03.=
bb</a>} |=C2=A0 0<br>
=C2=A0.../u-boot/{<a href=3D"http://u-boot_2018.01.bb" rel=3D"noreferrer" t=
arget=3D"_blank">u-boot_2018.01.bb</a> =3D&gt; <a href=3D"http://u-boot_201=
8.03.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2018.03.bb</a>}=C2=A0 =
=C2=A0|=C2=A0 0<br>
=C2=A05 files changed, 2 insertions(+), 23 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-D=
HCP.patch<br>
=C2=A0rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc =3D&gt; u-b=
oot-common_2018.03.inc} (68%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-fw-utils_201=
8.01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2018.01.bb</a=
> =3D&gt; <a href=3D"http://u-boot-fw-utils_2018.03.bb" rel=3D"noreferrer" =
target=3D"_blank">u-boot-fw-utils_2018.03.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-mkimage_2018=
.01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.01.bb</a> =
=3D&gt; <a href=3D"http://u-boot-mkimage_2018.03.bb" rel=3D"noreferrer" tar=
get=3D"_blank">u-boot-mkimage_2018.03.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2018.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-boot_2018.01.bb</a> =3D&gt; <a href=
=3D"http://u-boot_2018.03.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2=
018.03.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch b/=
meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch<br>
deleted file mode 100644<br>
index ecaa1796a4..0000000000<br>
--- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-Enabled dhcp client functionality for Yocto reference<br>
-hardware MPC8315E-RDB.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com=
" target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br>
-<br>
-Index: git/configs/MPC8315ERDB_defconfig<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/configs/MPC8315ERDB_defconfig<br>
-+++ git/configs/MPC8315ERDB_defconfig<br>
-@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=3Dy<br>
- CONFIG_CMD_SATA=3Dy<br>
- CONFIG_CMD_USB=3Dy<br>
- # CONFIG_CMD_SETEXPR is not set<br>
-+CONFIG_CMD_DHCP=3Dy<br>
- CONFIG_CMD_MII=3Dy<br>
- CONFIG_CMD_PING=3Dy<br>
- CONFIG_CMD_DATE=3Dy<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc b/meta/recip=
es-bsp/u-boot/u-boot-common_2018.03.inc<br>
similarity index 68%<br>
rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc<br>
rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc<br>
index d2073ea0c7..8ffae365a9 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc<br>
@@ -7,10 +7,8 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;f3dd87e0b98999a78e500e8c6d2b063ebadf535a&quot;<br>
+SRCREV =3D &quot;f95ab1fb6e37f0601f397091bb011edf7a98b890&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=3D"n=
oreferrer" target=3D"_blank">git.denx.de/u-boot.git</a> \<br>
-=C2=A0 =C2=A0 file://MPC8315ERDB-enable-DHCP.patch \<br>
-&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=3D"n=
oreferrer" target=3D"_blank">git.denx.de/u-boot.git</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018=
.01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2018.01.bb</a>=
 b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018.03.bb" re=
l=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2018.03.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018.=
01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2018.01.bb</a><=
br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018.03=
.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2018.03.bb</a><br=
>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.=
01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.01.bb</a> b=
/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.03.bb" rel=
=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.03.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.01.bb</a><br=
>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.03.=
bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.03.bb</a><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.01.bb" r=
el=3D"noreferrer" target=3D"_blank">u-boot_2018.01.bb</a> b/meta/recipes-bs=
p/u-boot/<a href=3D"http://u-boot_2018.03.bb" rel=3D"noreferrer" target=3D"=
_blank">u-boot_2018.03.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.01.bb" re=
l=3D"noreferrer" target=3D"_blank">u-boot_2018.01.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.03.bb" rel=
=3D"noreferrer" target=3D"_blank">u-boot_2018.03.bb</a><br>
--<br>
2.16.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000d7c36705695fdaa9--

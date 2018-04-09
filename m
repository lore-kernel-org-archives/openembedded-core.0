Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 993E1744EE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 07:12:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b127so16530194wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eNBJagW4mPVhFwE5HB6WUr9YBhNkIC0S7gPE0S0m9hE=;
	b=f4o7bIUNyQw/0qbY1XLlgI1v6BENXj+70QX7gEsIsRZ6ozLfRi9M69RhjYbRo064qr
	+e/6ahN5dVpd8bi9VKtF2VUgy5FVeHDEhxgTXKRHQxuxzwUXAQzCln9eO+UPqm/PPG9Z
	I8vuh2x/M6NYhrw+JRgwKtaIDX250353Ixvq7A6bDfnL/efYDARCPrvLxKj8digJMVt1
	IFtIvqZVP7kTo4NJLAcEwbuCVPaArtzq8k/QolkiobOmroblSqwJXS/UtkESmnyVE0Fe
	gIAWFyd5QH6+sKZGW3o7DygTnSqvuR9fdFDmt5goo5j0IjzhFbtL/okgvAxfGge/PXUp
	BY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eNBJagW4mPVhFwE5HB6WUr9YBhNkIC0S7gPE0S0m9hE=;
	b=TN9IS17cPRiAK1LNTiYIp4FfDgDr5H6NnAYU9E0Bvj++nJ/QYU1LbUVan89nUzKbOp
	m7yDVb3VAsXChV3c+sOcig1OL3ZTlD6iPeftvpmVvlp2ymZu0vPnPWPW3KgR1XtkURY9
	ulkXipcuS2xHi6DGVVU/mBzC3visuo+kcoJoTs+C8z+aa3VVVkIEJKDZGvvvIfIJB4sY
	gjGsYNvf+2/zVB9oek8/Or2O+r1661d8Uj1jidxdfmgDkH5YFYyPXJFT8OyO//h90hlY
	DousoV83BB+ySL1Izhi87Yw/f8jPKK6o98wvIDpqQWxgV4B9Y4i6D5iPt/5FPcEgiMhB
	CaEg==
X-Gm-Message-State: AElRT7HT4vif2U3+/YFNdHqGwqXyEwhitZ2zcwuM8rkszTRmO2Uw2KWJ
	BzgFJXYpb7BMKLDd3Z/v6B4ASos/Z9COrV7W62w=
X-Google-Smtp-Source: AIpwx48QG2rGbZJ8xlxxBQulyDaVFakvoe7y4CUg6hUIvEUA1iQWi/mZVHvaJX00vULlbk1CN6QEouXc8IHpIfoe9VY=
X-Received: by 10.28.156.4 with SMTP id f4mr20792635wme.79.1523257959070; Mon,
	09 Apr 2018 00:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Mon, 9 Apr 2018 00:12:38 -0700 (PDT)
In-Reply-To: <CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 9 Apr 2018 09:12:38 +0200
Message-ID: <CA+chaQcmLnpuj3qtyn602GwUppYFjwVzXvOmWw4Y8_0w8ykbhg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 09 Apr 2018 07:12:39 -0000
Content-Type: multipart/alternative; boundary="001a114b2de68d41eb05696521a7"

--001a114b2de68d41eb05696521a7
Content-Type: text/plain; charset="UTF-8"

Isn't it fail again because of autodetected swig from host?

Since 2017.07 I have:

do_compile_prepend () {
    sed 's@\(^always += $(if $(shell which swig 2>
/dev/null),_libfdt.so)$\)@# do not autodetect swig, there is no swig-native
dependency \1@g' -i ${S}/tools/Makefile
}

to prevent rebuilding libfdt which was failing because of host headers.

On Mon, Apr 9, 2018 at 2:54 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de> wrote:
>
>> This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>> patches accepted upstream, getting the patch count to zero.
>
>
>
> It fails for me if I have libfdt installed on build host
> It seems build is doing the include dance which goes all the way into
> hosts system include directories
>
>>
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> Cc: Ross Burton <ross.burton@intel.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  .../u-boot/files/MPC8315ERDB-enable-DHCP.patch        | 19
>> -------------------
>>  ...t-common_2018.01.inc => u-boot-common_2018.03.inc} |  6 ++----
>>  ...fw-utils_2018.01.bb => u-boot-fw-utils_2018.03.bb} |  0
>>  ...t-mkimage_2018.01.bb => u-boot-mkimage_2018.03.bb} |  0
>>  .../u-boot/{u-boot_2018.01.bb => u-boot_2018.03.bb}   |  0
>>  5 files changed, 2 insertions(+), 23 deletions(-)
>>  delete mode 100644 meta/recipes-bsp/u-boot/files/
>> MPC8315ERDB-enable-DHCP.patch
>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2018.01.inc =>
>> u-boot-common_2018.03.inc} (68%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.01.bb =>
>> u-boot-fw-utils_2018.03.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.01.bb =>
>> u-boot-mkimage_2018.03.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot_2018.01.bb => u-boot_2018.03.bb}
>> (100%)
>>
>> diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>> b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>> deleted file mode 100644
>> index ecaa1796a4..0000000000
>> --- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -Enabled dhcp client functionality for Yocto reference
>> -hardware MPC8315E-RDB.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> -
>> -Index: git/configs/MPC8315ERDB_defconfig
>> -===================================================================
>> ---- git.orig/configs/MPC8315ERDB_defconfig
>> -+++ git/configs/MPC8315ERDB_defconfig
>> -@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
>> - CONFIG_CMD_SATA=y
>> - CONFIG_CMD_USB=y
>> - # CONFIG_CMD_SETEXPR is not set
>> -+CONFIG_CMD_DHCP=y
>> - CONFIG_CMD_MII=y
>> - CONFIG_CMD_PING=y
>> - CONFIG_CMD_DATE=y
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>> b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>> similarity index 68%
>> rename from meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>> rename to meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>> index d2073ea0c7..8ffae365a9 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
>> @@ -7,10 +7,8 @@ PE = "1"
>>
>>  # We use the revision in order to avoid having to fetch it from the
>>  # repo during parse
>> -SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
>> +SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
>>
>> -SRC_URI = "git://git.denx.de/u-boot.git \
>> -    file://MPC8315ERDB-enable-DHCP.patch \
>> -"
>> +SRC_URI = "git://git.denx.de/u-boot.git"
>>
>>  S = "${WORKDIR}/git"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.01.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot_2018.01.bb
>> rename to meta/recipes-bsp/u-boot/u-boot_2018.03.bb
>> --
>> 2.16.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114b2de68d41eb05696521a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Isn&#39;t it fail again because of autodetected swig =
from host?</div><div><br></div><div>Since=C2=A02017.07 I have:</div><div><b=
r></div><div>do_compile_prepend () {</div><div>=C2=A0 =C2=A0 sed &#39;s@\(^=
always +=3D $(if $(shell which swig 2&gt; /dev/null),_libfdt.so)$\)@# do no=
t autodetect swig, there is no swig-native dependency \1@g&#39; -i ${S}/too=
ls/Makefile</div><div>}</div><div><br></div><div>to prevent rebuilding libf=
dt which was failing because of host headers.</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Mon, Apr 9, 2018 at 2:54 AM, Khe=
m Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div><br><div class=3D"gmail_quote"><span class=3D""><div dir=3D"a=
uto">On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut &lt;<a href=3D"mailto:marex=
@denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">This upgrades the U-Boot from 2018.01 to 2018.03 rele=
ase and drops<br>
patches accepted upstream, getting the patch count to zero.</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><br></div></span><div dir=3D"aut=
o">It fails for me if I have libfdt installed on build host=C2=A0</div><div=
 dir=3D"auto">It seems build is doing the include dance which goes all the =
way into hosts system include directories=C2=A0</div><div><div class=3D"h5"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
Cc: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" target=
=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bla=
nk">ross.burton@intel.com</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0.../u-boot/files/MPC8315ERDB-<wbr>enable-DHCP.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 19 -------------------<br>
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
=C2=A0delete mode 100644 meta/recipes-bsp/u-boot/files/<wbr>MPC8315ERDB-ena=
ble-DHCP.patch<br>
=C2=A0rename meta/recipes-bsp/u-boot/{u-<wbr>boot-common_2018.01.inc =3D&gt=
; u-boot-common_2018.03.inc} (68%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-fw-utils_201=
8.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2018.01.=
bb</a> =3D&gt; <a href=3D"http://u-boot-fw-utils_2018.03.bb" rel=3D"norefer=
rer" target=3D"_blank">u-boot-fw-utils_2018.03.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-mkimage_2018=
.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb=
</a> =3D&gt; <a href=3D"http://u-boot-mkimage_2018.03.bb" rel=3D"noreferrer=
" target=3D"_blank">u-boot-mkimage_2018.03.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2018.01.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2018.01.bb</a> =3D&gt; <a =
href=3D"http://u-boot_2018.03.bb" rel=3D"noreferrer" target=3D"_blank">u-bo=
ot_2018.03.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<wbr>files/MPC8315ERDB-enable-DHCP.<wb=
r>patch b/meta/recipes-bsp/u-boot/<wbr>files/MPC8315ERDB-enable-DHCP.<wbr>p=
atch<br>
deleted file mode 100644<br>
index ecaa1796a4..0000000000<br>
--- a/meta/recipes-bsp/u-boot/<wbr>files/MPC8315ERDB-enable-DHCP.<wbr>patch=
<br>
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
-Index: git/configs/MPC8315ERDB_<wbr>defconfig<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/configs/MPC8315ERDB_<wbr>defconfig<br>
-+++ git/configs/MPC8315ERDB_<wbr>defconfig<br>
-@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=3Dy<br>
- CONFIG_CMD_SATA=3Dy<br>
- CONFIG_CMD_USB=3Dy<br>
- # CONFIG_CMD_SETEXPR is not set<br>
-+CONFIG_CMD_DHCP=3Dy<br>
- CONFIG_CMD_MII=3Dy<br>
- CONFIG_CMD_PING=3Dy<br>
- CONFIG_CMD_DATE=3Dy<br>
diff --git a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2018.01.inc b/meta/=
recipes-bsp/u-boot/u-<wbr>boot-common_2018.03.inc<br>
similarity index 68%<br>
rename from meta/recipes-bsp/u-boot/u-<wbr>boot-common_2018.01.inc<br>
rename to meta/recipes-bsp/u-boot/u-<wbr>boot-common_2018.03.inc<br>
index d2073ea0c7..8ffae365a9 100644<br>
--- a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2018.01.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2018.03.inc<br>
@@ -7,10 +7,8 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;<wbr>f3dd87e0b98999a78e500e8c6d2b06<wbr>3ebadf535a&quot;<=
br>
+SRCREV =3D &quot;<wbr>f95ab1fb6e37f0601f397091bb011e<wbr>df7a98b890&quot;<=
br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=3D"n=
oreferrer" target=3D"_blank">git.denx.de/u-boot.git</a> \<br>
-=C2=A0 =C2=A0 file://MPC8315ERDB-enable-<wbr>DHCP.patch \<br>
-&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=3D"n=
oreferrer" target=3D"_blank">git.denx.de/u-boot.git</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018=
.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2018.01.b=
b</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018.03.b=
b" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2018.03.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018.=
01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2018.01.bb=
</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2018.03=
.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2018.03.bb</=
a><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.=
01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb<=
/a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.03.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.03.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.01.bb</=
a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.03.=
bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2018.03.bb</a>=
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.01.bb" r=
el=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2018.01.bb</a> b/meta/recip=
es-bsp/u-boot/<a href=3D"http://u-boot_2018.03.bb" rel=3D"noreferrer" targe=
t=3D"_blank">u-<wbr>boot_2018.03.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.01.bb" re=
l=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2018.01.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2018.03.bb" rel=
=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2018.03.bb</a><br>
--<br>
2.16.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114b2de68d41eb05696521a7--

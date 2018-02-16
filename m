Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC48D607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 23:43:58 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id b52so4402438wrd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 15:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/bMKgOLHhHDOpJJm4Y5WlCmNmUTEY3uIyY1oDS/apKo=;
	b=GF/RMX6Hc7FeQYRqfVwW5xPCZgq1xXMKfKvwcCEONAy+Qs/Wroud494iv7xSh7PVRN
	ix2BN5aaPsWdsjsl4m3je3Dnxwkgnv5ATKVKRJ4e8JQ/8vk5uEKfzerWXwpLjcBkZIzN
	3WlM9ZZfUim7cBc5dFm7WaJp2X2FYxLYqfHNenSIK2wQO0QsHETj0YcaiYRVWduB1FFP
	lz7sxvU+/4m1Mh/1zcCTq9woEh11bfOfpOv4dRNXFeQn0qWwcLeS1udMggNlw06pyJn9
	pCvvANjVEOxMEngaBgsUbJYBjKkMygZtju1s+ROF56mAKmcI3wXkyetdJW69E02KJlSo
	BZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/bMKgOLHhHDOpJJm4Y5WlCmNmUTEY3uIyY1oDS/apKo=;
	b=ogDwNZxALuL/CXBMWtrEk0GwFFjZg5977ZSsqX3zeagbqIq4KGP7/psFlCx6I3Qsci
	V6hznbTucA9XOChUCCEjiad0AaSuJaKBzjLi/jF90fAVfyv09Z4WPvc7FzeNX2LS5dU3
	g9QRmBc8BPKLbs2OZKfSc1iYzBipleNT/jpugm41jGB9aN8hxQhOFpzRGbzoI7OJRZ29
	cY8uni03j5/ZOYMg/zdMpPNkOYBJ4/8JJBqi7QA/XY+ZZ+Zes+IEMlr5YAS9K7LYOFd7
	L7I4r5ujrEEmD/NUtdKVA2bWUBS64dkq0IvYAeaOFPRt2Nz9dnBvWBrhl/qPc23/SZl2
	FrCQ==
X-Gm-Message-State: APf1xPClFViIaegTy2q/omcjaJoBpZf4er2if3bOOirWTtqI6keT+pnS
	stRFz/UeSbdAHwlhYcIzXvU9sYU77EOKfeDDsZ0=
X-Google-Smtp-Source: AH8x227mNjHFERHh5TgqA7N99j+bXuMB5C5AB7t8cpkGlnvJBjGhuNQGI1c0tBAg6UQgMyQlvkTLpidMulllj2cpR4I=
X-Received: by 10.223.196.250 with SMTP id o55mr7303133wrf.200.1518824639648; 
	Fri, 16 Feb 2018 15:43:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 16 Feb 2018 15:43:59 -0800 (PST)
In-Reply-To: <01d2ca4a15327dee7e56a94487131a639b8090e8.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<01d2ca4a15327dee7e56a94487131a639b8090e8.1517857764.git.JPEWhacker@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Feb 2018 00:43:59 +0100
Message-ID: <CA+chaQdkfaUukWmTTcPFV-gp2i8YcfRQb0WM_s_4bw4BrypM9g@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] icecc-toolchain: Add SDK icecream setup
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
X-List-Received-Date: Fri, 16 Feb 2018 23:43:59 -0000
Content-Type: multipart/alternative; boundary="f403045f55701f5ab805655ceb72"

--f403045f55701f5ab805655ceb72
Content-Type: text/plain; charset="UTF-8"

Is the LIC_FILES_CHKSUM correct? Doesn't match here:


nativesdk-icecc-toolchain/0.1-r0/icecc-env.sh;beginline=2;en
dline=20;md5=aafdb7bc2aa7ac5d039fda0c8733983c
nativesdk-icecc-toolchain: The new md5 checksum is
dd6b68c1efed8a9fb04e409b3b287d47
nativesdk-icecc-toolchain: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=2 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a
copy
# of this software and associated documentation files (the "Software"), to
deal
# in the Software without restriction, including without limitation the
rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE
# SOFTWARE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=20 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


On Tue, Feb 6, 2018 at 11:01 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> IceCream can now be optionally included in the generated SDK by
> including nativesdk-icecc-toolchain to TOOLCHAIN_HOST_TASK. When the SDK
> is installed, it will check if icecc exists, and if so will generate the
> toolchain environment.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../icecc-toolchain/icecc-toolchain/icecc-env.sh   | 37
> +++++++++++++++++++
>  .../icecc-toolchain/icecc-toolchain/icecc-setup.sh | 43
> ++++++++++++++++++++++
>  .../nativesdk-icecc-toolchain_0.1.bb               | 38
> +++++++++++++++++++
>  3 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/
> icecc-env.sh
>  create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/
> icecc-setup.sh
>  create mode 100644 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-
> toolchain_0.1.bb
>
> diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
> b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
> new file mode 100644
> index 00000000000..4c34edbbc5d
> --- /dev/null
> +++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
> @@ -0,0 +1,37 @@
> +#! /bin/sh
> +# Copyright 2018 Garmin Ltd. or its subsidiaries
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a
> copy
> +# of this software and associated documentation files (the "Software"),
> to deal
> +# in the Software without restriction, including without limitation the
> rights
> +# to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> +# copies of the Software, and to permit persons to whom the Software is
> +# furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice shall be included
> in
> +# all copies or substantial portions of the Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> THE
> +# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> FROM,
> +# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN THE
> +# SOFTWARE.
> +#
> +
> +if [ -z "$ICECC_PATH" ]; then
> +    ICECC_PATH=$(which icecc 2> /dev/null)
> +fi
> +
> +if [ -n "$ICECC_PATH" ]; then
> +    export ICECC_PATH
> +    export ICECC_VERSION="$OECORE_NATIVE_SYSROOT/usr/share/icecream/@
> TOOLCHAIN_ENV@"
> +    export ICECC="$(which ${CROSS_COMPILE}gcc)"
> +    export ICECXX="$(which ${CROSS_COMPILE}g++)"
> +    export ICEAS="$(which ${CROSS_COMPILE}as)"
> +    export PATH="$OECORE_NATIVE_SYSROOT/usr/share/icecream/bin:$PATH"
> +else
> +    echo "Icecc not found. Disabling distributed compiling"
> +fi
> +
> diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
> b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
> new file mode 100644
> index 00000000000..a433e55b029
> --- /dev/null
> +++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
> @@ -0,0 +1,43 @@
> +#! /bin/sh
> +# Copyright 2018 Garmin Ltd. or its subsidiaries
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a
> copy
> +# of this software and associated documentation files (the "Software"),
> to deal
> +# in the Software without restriction, including without limitation the
> rights
> +# to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> +# copies of the Software, and to permit persons to whom the Software is
> +# furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice shall be included
> in
> +# all copies or substantial portions of the Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> THE
> +# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> FROM,
> +# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN THE
> +# SOFTWARE.
> +#
> +
> +# Setup environment
> +for env_setup_script in `ls $1/environment-setup-*`; do
> +       . $env_setup_script
> +done
> +
> +# ICECC_PATH will have been found icecc-env.sh
> +if [ -z "$ICECC_PATH" ]; then
> +    exit 0
> +fi
> +
> +echo "Setting up IceCream distributed compiling..."
> +
> +# Create the environment
> +mkdir -p "`dirname $ICECC_VERSION`"
> +icecc-create-env $ICECC $ICECXX $ICEAS $ICECC_VERSION || exit $?
> +
> +# Create symbolic links
> +d="$OECORE_NATIVE_SYSROOT/usr/share/icecream/bin"
> +mkdir -p "$d"
> +ln -s "$ICECC_PATH" "$d/${CROSS_COMPILE}gcc"
> +ln -s "$ICECC_PATH" "$d/${CROSS_COMPILE}g++"
> diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-
> toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-
> toolchain_0.1.bb
> new file mode 100644
> index 00000000000..28b2924ebfb
> --- /dev/null
> +++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-
> toolchain_0.1.bb
> @@ -0,0 +1,38 @@
> +# Copyright (C) 2018 Joshua Watt <JPEWhacker@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +DESCRIPTION = "Generates IceCream toolchains for SDKs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/icecc-env.
> sh;beginline=2;endline=20;md5=aafdb7bc2aa7ac5d039fda0c8733983c"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +SRC_URI = "\
> +    file://icecc-env.sh \
> +    file://icecc-setup.sh \
> +    "
> +
> +inherit nativesdk
> +
> +ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TUNE_PKGARCH}-$
> {DISTRO_VERSION}.tar.gz"
> +
> +do_compile() {
> +}
> +
> +do_install() {
> +    install -d ${D}${SDKPATHNATIVE}${datadir}/icecream/bin
> +
> +    install -d ${D}${SDKPATHNATIVE}/environment-setup.d/
> +    install -m 0644 ${WORKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}/
> environment-setup.d/
> +    sed -i ${D}${SDKPATHNATIVE}/environment-setup.d/icecc-env.sh \
> +        -e "s,@TOOLCHAIN_ENV@,${ENV_NAME},g"
> +
> +    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
> +    install -m 0755 ${WORKDIR}/icecc-setup.sh ${D}${SDKPATHNATIVE}/post-
> relocate-setup.d/
> +    sed -i ${D}${SDKPATHNATIVE}/post-relocate-setup.d/icecc-setup.sh \
> +        -e "s,@TOOLCHAIN_ENV@,${ENV_NAME},g"
> +}
> +
> +PACKAGES = "${PN}"
> +FILES_${PN} = "${SDKPATHNATIVE}"
> +RDEPENDS_${PN} += "nativesdk-icecc-create-env"
> +
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f55701f5ab805655ceb72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is the LIC_FILES_CHKSUM correct? Doesn&#39;t match he=
re:</div><div><br></div><div><br></div><div>nativesdk-icecc-toolchain/0.1-r=
0/icecc-env.sh;beginline=3D2;en</div><div>dline=3D20;md5=3Daafdb7bc2aa7ac5d=
039fda0c8733983c</div><div>nativesdk-icecc-toolchain: The new md5 checksum =
is dd6b68c1efed8a9fb04e409b3b287d47</div><div>nativesdk-icecc-toolchain: He=
re is the selected license text:</div><div>vvvvvvvvvvvvvvvvvvvvvvvvvvvv beg=
inline=3D2 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv</div><div># Copyright (c) 2018 Jos=
hua Watt, Garmin International,Inc.</div><div>#</div><div># Permission is h=
ereby granted, free of charge, to any person obtaining a copy</div><div># o=
f this software and associated documentation files (the &quot;Software&quot=
;), to deal</div><div># in the Software without restriction, including with=
out limitation the rights</div><div># to use, copy, modify, merge, publish,=
 distribute, sublicense, and/or sell</div><div># copies of the Software, an=
d to permit persons to whom the Software is</div><div># furnished to do so,=
 subject to the following conditions:</div><div>#</div><div># The above cop=
yright notice and this permission notice shall be included in</div><div># a=
ll copies or substantial portions of the Software.</div><div>#</div><div># =
THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR</div><div># IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF MERCHANTABILITY,</div><div># FITNESS FOR A PARTICULAR PURPOSE AND NONINF=
RINGEMENT. IN NO EVENT SHALL THE</div><div># AUTHORS OR COPYRIGHT HOLDERS B=
E LIABLE FOR ANY CLAIM, DAMAGES OR OTHER</div><div># LIABILITY, WHETHER IN =
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,</div><div># OUT OF =
OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE</div=
><div># SOFTWARE.</div><div>^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=3D20 ^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^</div><div><br></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Tue, Feb 6, 2018 at 11:01 PM, Joshua =
Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=
=3D"_blank">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">IceCream can now be optionally included in the generated SDK =
by<br>
including nativesdk-icecc-toolchain to TOOLCHAIN_HOST_TASK. When the SDK<br=
>
is installed, it will check if icecc exists, and if so will generate the<br=
>
toolchain environment.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEW=
hacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../icecc-toolchain/icecc-<wbr>toolchain/icecc-env.sh=C2=A0 =C2=A0| 3=
7 +++++++++++++++++++<br>
=C2=A0.../icecc-toolchain/icecc-<wbr>toolchain/icecc-setup.sh | 43 ++++++++=
++++++++++++++<br>
=C2=A0.../<a href=3D"http://nativesdk-icecc-toolchain_0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nativesdk-icecc-toolchain_<wbr>0.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++++++++++++<br>
=C2=A03 files changed, 118 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/icecc-<wbr>toolchain/icecc-t=
oolchain/<wbr>icecc-env.sh<br>
=C2=A0create mode 100644 meta/recipes-devtools/icecc-<wbr>toolchain/icecc-t=
oolchain/<wbr>icecc-setup.sh<br>
=C2=A0create mode 100644 meta/recipes-devtools/icecc-<wbr>toolchain/<a href=
=3D"http://nativesdk-icecc-toolchain_0.1.bb" rel=3D"noreferrer" target=3D"_=
blank">nativesdk-icecc-<wbr>toolchain_0.1.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/icecc-<wbr>toolchain/icecc-toolchain/<wb=
r>icecc-env.sh b/meta/recipes-devtools/icecc-<wbr>toolchain/icecc-toolchain=
/<wbr>icecc-env.sh<br>
new file mode 100644<br>
index 00000000000..4c34edbbc5d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/icecc-<wbr>toolchain/icecc-toolchain/<wbr>icecc=
-env.sh<br>
@@ -0,0 +1,37 @@<br>
+#! /bin/sh<br>
+# Copyright 2018 Garmin Ltd. or its subsidiaries<br>
+#<br>
+# Permission is hereby granted, free of charge, to any person obtaining a =
copy<br>
+# of this software and associated documentation files (the &quot;Software&=
quot;), to deal<br>
+# in the Software without restriction, including without limitation the ri=
ghts<br>
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sel=
l<br>
+# copies of the Software, and to permit persons to whom the Software is<br=
>
+# furnished to do so, subject to the following conditions:<br>
+#<br>
+# The above copyright notice and this permission notice shall be included =
in<br>
+# all copies or substantial portions of the Software.<br>
+#<br>
+# THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND=
, EXPRESS OR<br>
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,=
<br>
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE<br>
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER<b=
r>
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,<br>
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS I=
N THE<br>
+# SOFTWARE.<br>
+#<br>
+<br>
+if [ -z &quot;$ICECC_PATH&quot; ]; then<br>
+=C2=A0 =C2=A0 ICECC_PATH=3D$(which icecc 2&gt; /dev/null)<br>
+fi<br>
+<br>
+if [ -n &quot;$ICECC_PATH&quot; ]; then<br>
+=C2=A0 =C2=A0 export ICECC_PATH<br>
+=C2=A0 =C2=A0 export ICECC_VERSION=3D&quot;$OECORE_NATIVE_<wbr>SYSROOT/usr=
/share/icecream/@<wbr>TOOLCHAIN_ENV@&quot;<br>
+=C2=A0 =C2=A0 export ICECC=3D&quot;$(which ${CROSS_COMPILE}gcc)&quot;<br>
+=C2=A0 =C2=A0 export ICECXX=3D&quot;$(which ${CROSS_COMPILE}g++)&quot;<br>
+=C2=A0 =C2=A0 export ICEAS=3D&quot;$(which ${CROSS_COMPILE}as)&quot;<br>
+=C2=A0 =C2=A0 export PATH=3D&quot;$OECORE_NATIVE_SYSROOT/<wbr>usr/share/ic=
ecream/bin:$PATH&quot;<br>
+else<br>
+=C2=A0 =C2=A0 echo &quot;Icecc not found. Disabling distributed compiling&=
quot;<br>
+fi<br>
+<br>
diff --git a/meta/recipes-devtools/icecc-<wbr>toolchain/icecc-toolchain/<wb=
r>icecc-setup.sh b/meta/recipes-devtools/icecc-<wbr>toolchain/icecc-toolcha=
in/<wbr>icecc-setup.sh<br>
new file mode 100644<br>
index 00000000000..a433e55b029<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/icecc-<wbr>toolchain/icecc-toolchain/<wbr>icecc=
-setup.sh<br>
@@ -0,0 +1,43 @@<br>
+#! /bin/sh<br>
+# Copyright 2018 Garmin Ltd. or its subsidiaries<br>
+#<br>
+# Permission is hereby granted, free of charge, to any person obtaining a =
copy<br>
+# of this software and associated documentation files (the &quot;Software&=
quot;), to deal<br>
+# in the Software without restriction, including without limitation the ri=
ghts<br>
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sel=
l<br>
+# copies of the Software, and to permit persons to whom the Software is<br=
>
+# furnished to do so, subject to the following conditions:<br>
+#<br>
+# The above copyright notice and this permission notice shall be included =
in<br>
+# all copies or substantial portions of the Software.<br>
+#<br>
+# THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND=
, EXPRESS OR<br>
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,=
<br>
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE<br>
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER<b=
r>
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,<br>
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS I=
N THE<br>
+# SOFTWARE.<br>
+#<br>
+<br>
+# Setup environment<br>
+for env_setup_script in `ls $1/environment-setup-*`; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0. $env_setup_script<br>
+done<br>
+<br>
+# ICECC_PATH will have been found icecc-env.sh<br>
+if [ -z &quot;$ICECC_PATH&quot; ]; then<br>
+=C2=A0 =C2=A0 exit 0<br>
+fi<br>
+<br>
+echo &quot;Setting up IceCream distributed compiling...&quot;<br>
+<br>
+# Create the environment<br>
+mkdir -p &quot;`dirname $ICECC_VERSION`&quot;<br>
+icecc-create-env $ICECC $ICECXX $ICEAS $ICECC_VERSION || exit $?<br>
+<br>
+# Create symbolic links<br>
+d=3D&quot;$OECORE_NATIVE_SYSROOT/<wbr>usr/share/icecream/bin&quot;<br>
+mkdir -p &quot;$d&quot;<br>
+ln -s &quot;$ICECC_PATH&quot; &quot;$d/${CROSS_COMPILE}gcc&quot;<br>
+ln -s &quot;$ICECC_PATH&quot; &quot;$d/${CROSS_COMPILE}g++&quot;<br>
diff --git a/meta/recipes-devtools/icecc-<wbr>toolchain/<a href=3D"http://n=
ativesdk-icecc-toolchain_0.1.bb" rel=3D"noreferrer" target=3D"_blank">nativ=
esdk-icecc-<wbr>toolchain_0.1.bb</a> b/meta/recipes-devtools/icecc-<wbr>too=
lchain/<a href=3D"http://nativesdk-icecc-toolchain_0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">nativesdk-icecc-<wbr>toolchain_0.1.bb</a><br>
new file mode 100644<br>
index 00000000000..28b2924ebfb<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/icecc-<wbr>toolchain/<a href=3D"http://nativesd=
k-icecc-toolchain_0.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-ic=
ecc-<wbr>toolchain_0.1.bb</a><br>
@@ -0,0 +1,38 @@<br>
+# Copyright (C) 2018 Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.co=
m">JPEWhacker@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+DESCRIPTION =3D &quot;Generates IceCream toolchains for SDKs&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/icecc-env.<wbr>sh;beginline=
=3D2;endline=3D20;md5=3D<wbr>aafdb7bc2aa7ac5d039fda0c873398<wbr>3c&quot;<br=
>
+<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 file://icecc-env.sh \<br>
+=C2=A0 =C2=A0 file://icecc-setup.sh \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+inherit nativesdk<br>
+<br>
+ENV_NAME=3D&quot;${DISTRO}-${TCLIBC}<wbr>-${SDK_ARCH}-${TUNE_PKGARCH}-$<wb=
r>{DISTRO_VERSION}.tar.gz&quot;<br>
+<br>
+do_compile() {<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${SDKPATHNATIVE}${datadir}<wbr>/icecream/bin<=
br>
+<br>
+=C2=A0 =C2=A0 install -d ${D}${SDKPATHNATIVE}/<wbr>environment-setup.d/<br=
>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}=
/<wbr>environment-setup.d/<br>
+=C2=A0 =C2=A0 sed -i ${D}${SDKPATHNATIVE}/<wbr>environment-setup.d/icecc-e=
nv.<wbr>sh \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s,@TOOLCHAIN_ENV@,${ENV_NAME}<wbr>,g&=
quot;<br>
+<br>
+=C2=A0 =C2=A0 install -d ${D}${SDKPATHNATIVE}/post-<wbr>relocate-setup.d/<=
br>
+=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/icecc-setup.sh ${D}${SDKPATHNATIV=
E}/post-<wbr>relocate-setup.d/<br>
+=C2=A0 =C2=A0 sed -i ${D}${SDKPATHNATIVE}/post-<wbr>relocate-setup.d/icecc=
-setup.<wbr>sh \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s,@TOOLCHAIN_ENV@,${ENV_NAME}<wbr>,g&=
quot;<br>
+}<br>
+<br>
+PACKAGES =3D &quot;${PN}&quot;<br>
+FILES_${PN} =3D &quot;${SDKPATHNATIVE}&quot;<br>
+RDEPENDS_${PN} +=3D &quot;nativesdk-icecc-create-env&quot;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
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

--f403045f55701f5ab805655ceb72--

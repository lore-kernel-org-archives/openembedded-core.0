Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 96019607DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 15:07:14 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id o14so1980652oth.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=thkiWyiScvE5RdL+tjQv+umfyTlSY6kRgs6OLYnEt6A=;
	b=N84v9SRSuTRWaytyu6N2zDCDSOOQigbho2tbUJK9e5fL8lzDVOn+TXTImh6/swWAHe
	gbEp8lAgMSHY8qS/AygyCCoEcCNgoR9eXLnjXNI4cR7H0rEHTwKR7hW0fAl/qoN0UE4v
	1k494nnmg3UZqzrQVmWdurrUxF/6j2F29o0R3hI0EqTKD1YhMafepa3sdVRB6tkW+jRs
	AXEc72R/WBBZGXoz8XeJ4StGcCb8ToTC/yWKR8U2If/k5elIeZWkhWnmdD7Wq6k0U5oG
	OREC62jP4v1A/YlzjcvWXCsI5oA95TjAEwRoYP33pZfIM9eJCSxsMyRs5O4lIeH1Yrd3
	GQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=thkiWyiScvE5RdL+tjQv+umfyTlSY6kRgs6OLYnEt6A=;
	b=OxAmR5HuAXZFyU8Ks7j0n4EuJQmueRkoSOR2HB18eSC628SmpTyuY7NHRLaWPR37nH
	H5syv2eHne+6soMZ8e9pu0yZM/JW2rv8rb5Eyx6WEKgRFgOyG9LVX582QjDoS8pe4Jd3
	C77chmeYe98OoKA0ra7gM3oFDGIpaz72QdyEFuGFLyGJaTvSLau7ZgEI2iv2L6WB2fOK
	0oTqDYbUKOZvhXANQoOkqPitFgEc3zpMWolpdYryvvBq5YLDjEday1iiBD8Oca2Ay2IV
	mCDUn26xF9U83JsuVcN1Ln1t1YalHo6PGEu3Mk0CygPV8ha6bYxxdL+VJL1mTbC0n53D
	kAfA==
X-Gm-Message-State: ABuFfohaYJsSlj4P3cXmQWPSyC4jw84NOlbZOwjWWHKmBoF56fcuudGW
	CCf5iRMsg0FioCps/ZCQF/8CBje5vFjJyzzovDrUoA==
X-Google-Smtp-Source: ACcGV6160DtANu++j+M4FRCFeknqe5S9IeZPF7Sh3+QLxgOs4H5kUARswqYAGL9Yz4CJ4VBoCEfK9pxBVrWgLOGFQkw=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr9194003otg.8.1539097635523;
	Tue, 09 Oct 2018 08:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181009140315.4933-1-pascal.bach@siemens.com>
In-Reply-To: <20181009140315.4933-1-pascal.bach@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Oct 2018 16:07:03 +0100
Message-ID: <CAJTo0LZtZnKVSu7cB6TnEad_KmER5xDcMaWyi6pfN52vveF3-w@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: search both sysroot-native and host for native packages
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
X-List-Received-Date: Tue, 09 Oct 2018 15:07:14 -0000
Content-Type: multipart/alternative; boundary="000000000000d7208d0577cd1707"

--000000000000d7208d0577cd1707
Content-Type: text/plain; charset="UTF-8"

All but this one apply now... weird.

If you can rebase on top of poky-contrib:ross/thud then that would be great.

Ross

On Tue, 9 Oct 2018 at 15:07, Pascal Bach <pascal.bach@siemens.com> wrote:

> Certain headers and libraries like `math.h` an `-m` are only available on
> the
> host as they are provided by the host toolchain.
>
> This leads to issues that a find_library in CMake doesn't find the `m`
> library
> of a find_path doesn't find `math.h`. This issue occurred in the wireshark
> recipe
> for example.
>
> This change enables CMake to also look on the host for libraries and
> includes when
> building a native package.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta/classes/cmake.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 6e2c34e4c6..89a2a77a50 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -43,8 +43,8 @@ OECMAKE_RPATH ?= ""
>  OECMAKE_PERLNATIVE_DIR ??= ""
>  OECMAKE_EXTRA_ROOT_PATH ?= ""
>
> -OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
> -OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
> +OECMAKE_FIND_ROOT_PATH_MODE = "ONLY"
> +OECMAKE_FIND_ROOT_PATH_MODE_class-native = "BOTH"
>
>  EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
>
> @@ -93,10 +93,10 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"
> CACHE STRING "LDFLAGS" )
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
>  set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN})
> -set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
> -set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM
> ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
> -set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> -set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )
> +set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )
> +set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )
> +set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${OECMAKE_FIND_ROOT_PATH_MODE} )
>
>  $cmake_sysroot
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d7208d0577cd1707
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All but this one apply now... weird.<div><br></div><div>If=
 you can rebase on top of poky-contrib:ross/thud then that would be great.<=
/div><div><br></div><div>Ross</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Tue, 9 Oct 2018 at 15:07, Pascal Bach &lt;<a href=3D"mailt=
o:pascal.bach@siemens.com">pascal.bach@siemens.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Certain headers and libraries like `math.h` =
an `-m` are only available on the<br>
host as they are provided by the host toolchain.<br>
<br>
This leads to issues that a find_library in CMake doesn&#39;t find the `m` =
library<br>
of a find_path doesn&#39;t find `math.h`. This issue occurred in the wiresh=
ark recipe<br>
for example.<br>
<br>
This change enables CMake to also look on the host for libraries and includ=
es when<br>
building a native package.<br>
<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com" t=
arget=3D"_blank">pascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cmake.bbclass | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass<br>
index 6e2c34e4c6..89a2a77a50 100644<br>
--- a/meta/classes/cmake.bbclass<br>
+++ b/meta/classes/cmake.bbclass<br>
@@ -43,8 +43,8 @@ OECMAKE_RPATH ?=3D &quot;&quot;<br>
=C2=A0OECMAKE_PERLNATIVE_DIR ??=3D &quot;&quot;<br>
=C2=A0OECMAKE_EXTRA_ROOT_PATH ?=3D &quot;&quot;<br>
<br>
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D &quot;ONLY&quot;<br>
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D &quot;BOTH&quot;<br>
+OECMAKE_FIND_ROOT_PATH_MODE =3D &quot;ONLY&quot;<br>
+OECMAKE_FIND_ROOT_PATH_MODE_class-native =3D &quot;BOTH&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE_append =3D &quot; ${PACKAGECONFIG_CONFARGS}&quot;<br>
<br>
@@ -93,10 +93,10 @@ set( CMAKE_CXX_LINK_FLAGS &quot;${OECMAKE_CXX_LINK_FLAG=
S}&quot; CACHE STRING &quot;LDFLAGS&quot; )<br>
=C2=A0# only search in the paths provided so cmake doesnt pick<br>
=C2=A0# up libraries and tools from the native build machine<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} $=
{CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL=
_TOOLCHAIN})<br>
-set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )<br>
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGR=
AM} )<br>
-set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )<br>
-set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )<br>
+set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )<br=
>
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )<br=
>
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )<br=
>
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${OECMAKE_FIND_ROOT_PATH_MODE} )<br=
>
<br>
=C2=A0$cmake_sysroot<br>
<br>
-- <br>
2.11.0<br>
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

--000000000000d7208d0577cd1707--

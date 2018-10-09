Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04C2C75260
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:06:50 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y81-v6so1306579oia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Cwpaiet/0PTJgKDz7qGVXXPd4R11DFNtmTMYcfEVCGI=;
	b=DL0wAXuJT24TCS4TYZADx4XoRlBpZSHpDEUuWKoys8aOAIU/gjselxWXC0T3I6yOQs
	QTU/DrVAW1omO62cTm9WOvVJMY+9M8hmPZ1jCtdJcHAR+H7tqPTdkUx9qgddIgedBXm5
	UVBE5lRlUghY7aH8T2/QhQHvrphWQykWJJtxfhxE6Eor8NFqKCSXxUU5qXphLzrGL6g8
	0pU3Zv+l4B1vzNSRIcwK8kKyvH0FM6+PdULrwK5YniC59bw1AIYA708KAVggkjOxW48P
	mznTYCGKQSGNpFI31d/uThSbp2kkxC4l8O4T65opNJn7V/lM5bXTcuJm7xhXTxWnDzsg
	tArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cwpaiet/0PTJgKDz7qGVXXPd4R11DFNtmTMYcfEVCGI=;
	b=oW89owYRDVh0FP5kbL5q5yMvq7RIA7CZIEiT8BLsptL7U0flhvWe6w3UULH4eRNLpE
	2oCOGny191uCjibzCw9eZrMQ51BIHd9pQl4R3sa3MipHUcDqTrXQMT4IjsF9IEKhWMss
	3it76u5cdbU07uBuy+kQ863suRVj1KcBmCOwxfXc0FxWIXUppBpJNLXNfDQcsxMB1VHG
	NaCk3vq6pe1MF0HqphjB9BRklJj/iAZdaOtD5ioIQkBiyiuylUVQDHqqEhG7QuOIREs5
	9CoCNLTutY9AxhfHwO+uVw52uLJMm73QprvdUqcs5Xg3F66ICh+mda8lINPRpoQmK13/
	WXNQ==
X-Gm-Message-State: ABuFfohmkMRjrbvCjqkTnDK74kcIBGzIuUifi/czofLpqwA9wlz8LjFR
	PLRdhTMItcyaqiVq4LyB7XEdmDQaUag2oqD3SOP8Ug==
X-Google-Smtp-Source: ACcGV617kkJXJRKVzHWO6uV3q8h/mWmwCR/okQQ80TBU4InholKuyAvnyGYLI8cU161/zymZsIpQKHkd26nBCMMhplo=
X-Received: by 2002:aca:f0d6:: with SMTP id
	o205-v6mr7532160oih.138.1539094011616; 
	Tue, 09 Oct 2018 07:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20181009133416.3535-1-pascal.bach@siemens.com>
In-Reply-To: <20181009133416.3535-1-pascal.bach@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Oct 2018 15:06:39 +0100
Message-ID: <CAJTo0LZbUvgH8XQLouKAGHjVgSigSJKPpnB6PULf1a-See+zwQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: allow cmake to find hosttools
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
X-List-Received-Date: Tue, 09 Oct 2018 14:06:51 -0000
Content-Type: multipart/alternative; boundary="000000000000d6b5880577cc3fb8"

--000000000000d6b5880577cc3fb8
Content-Type: text/plain; charset="UTF-8"

The hashes don't match anything public and git isn't happy:

Applying: cmake.bbclass: allow cmake to find hosttools
error: sha1 information is lacking or useless (meta/classes/cmake.bbclass).
error: could not build fake ancestor
Patch failed at 0001 cmake.bbclass: allow cmake to find hosttools

Ross

On Tue, 9 Oct 2018 at 14:36, Pascal Bach <pascal.bach@siemens.com> wrote:

> Currently the generated toolchain file is unable to find hosttools as they
> do not appear in the search paths.
>
> One example where this is useful is for projects that query git for their
> version
> number as git is usually provided via HOSTTOOLS.
>
> Just adding HOSTTOOLS_DIR is not enough as binaries are located directly
> under
> ${HOSTTOOLS_DIR}. Like ${HOSTTOOLS_DIR}/git for example.
> CMake however only searches in [s]bin sub directories of the paths
> specified in
> CMAKE_FIND_ROOT_PATH. Explicitly adding / to CMAKE_SYSTEM_PROGRAM_PATH
> makes
> CMake look in the right location.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta/classes/cmake.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 684f71299a..421d85fd9d 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -92,7 +92,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"
> CACHE STRING "LDFLAGS" )
>
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN})
> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})
>  set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE} )
>  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE} )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE} )
> @@ -113,6 +113,10 @@ list(APPEND CMAKE_MODULE_PATH
> "${STAGING_DATADIR}/cmake/Modules/")
>  # add for non /usr/lib libdir, e.g. /usr/lib64
>  set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})
>
> +# by default CMake only looks in [s]bin subdirectories of
> CMAKE_FIND_ROOT_PATH
> +# adding / makes CMake look for binaries in hosttools too.
> +set( CMAKE_SYSTEM_PROGRAM_PATH /)
> +
>  # avoid treating imports as system includes
>  set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON)
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

--000000000000d6b5880577cc3fb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">The hashes don&#39;t match anything publi=
c and git isn&#39;t happy:<div><br></div><div><div>Applying: cmake.bbclass:=
 allow cmake to find hosttools</div><div>error: sha1 information is lacking=
 or useless (meta/classes/cmake.bbclass).</div><div>error: could not build =
fake ancestor</div><div>Patch failed at 0001 cmake.bbclass: allow cmake to =
find hosttools</div></div><div><br></div><div>Ross</div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 9 Oct 2018 at 14:36, Pasca=
l Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">pascal.bach@siemens.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Currently the gen=
erated toolchain file is unable to find hosttools as they<br>
do not appear in the search paths.<br>
<br>
One example where this is useful is for projects that query git for their v=
ersion<br>
number as git is usually provided via HOSTTOOLS.<br>
<br>
Just adding HOSTTOOLS_DIR is not enough as binaries are located directly un=
der<br>
${HOSTTOOLS_DIR}. Like ${HOSTTOOLS_DIR}/git for example.<br>
CMake however only searches in [s]bin sub directories of the paths specifie=
d in<br>
CMAKE_FIND_ROOT_PATH. Explicitly adding / to CMAKE_SYSTEM_PROGRAM_PATH make=
s<br>
CMake look in the right location.<br>
<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com" t=
arget=3D"_blank">pascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cmake.bbclass | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass<br>
index 684f71299a..421d85fd9d 100644<br>
--- a/meta/classes/cmake.bbclass<br>
+++ b/meta/classes/cmake.bbclass<br>
@@ -92,7 +92,7 @@ set( CMAKE_CXX_LINK_FLAGS &quot;${OECMAKE_CXX_LINK_FLAGS}=
&quot; CACHE STRING &quot;LDFLAGS&quot; )<br>
<br>
=C2=A0# only search in the paths provided so cmake doesnt pick<br>
=C2=A0# up libraries and tools from the native build machine<br>
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROS=
S_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOL=
CHAIN})<br>
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROS=
S_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOL=
CHAIN} ${HOSTTOOLS_DIR})<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OECMAKE_FIND_ROOT_PATH_MODE}=
 )<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE}=
 )<br>
=C2=A0set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OECMAKE_FIND_ROOT_PATH_MODE}=
 )<br>
@@ -113,6 +113,10 @@ list(APPEND CMAKE_MODULE_PATH &quot;${STAGING_DATADIR}=
/cmake/Modules/&quot;)<br>
=C2=A0# add for non /usr/lib libdir, e.g. /usr/lib64<br>
=C2=A0set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})<br>
<br>
+# by default CMake only looks in [s]bin subdirectories of CMAKE_FIND_ROOT_=
PATH<br>
+# adding / makes CMake look for binaries in hosttools too.<br>
+set( CMAKE_SYSTEM_PROGRAM_PATH /)<br>
+<br>
=C2=A0# avoid treating imports as system includes<br>
=C2=A0set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON)<br>
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

--000000000000d6b5880577cc3fb8--

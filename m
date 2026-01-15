Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C61D3CCAE
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 04:23:00 +0000 (UTC)
Subject: Re: [PATCH] llvm: enable LLVMgold.so build by adding binutils dependency
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 20:22:50 -0800
References: <20260113225424.1208879-1-mark.yang@lge.com> <DFOFPON5W0JH.3442V3YUTEX2L@bootlin.com>
In-Reply-To: <DFOFPON5W0JH.3442V3YUTEX2L@bootlin.com>
Message-ID: <659490.1768450970085586138@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GoDEkryou6jmG4qCPZkz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 04:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229386

--GoDEkryou6jmG4qCPZkz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry. I have reproduced error in the GCC toolchain. I will upload Patc=
h v2.

On Thu, Jan 15, 2026 at 12:58 AM, Antonin Godard wrote:

>=20
> Hi,
>=20
> On Tue Jan 13, 2026 at 11:54 PM CET, mark.yang via lists.openembedded.org
> wrote:
>=20
>> From: "mark.yang" <mark.yang@lge.com>
>>=20
>> Currently, LLVMgold.so is not built because the binutils headers
>> are missing during the build process.
>>=20
>> This allows LLVM to find the necessary headers and build the LLVMgold.so=
,
>> which is required for Link Time Optimization (LTO) support properly.
>>=20
>> Signed-off-by: mark.yang <mark.yang@lge.com>
>> ---
>> meta/recipes-devtools/clang/llvm_git.bb | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/clang/llvm_git.bb
>> b/meta/recipes-devtools/clang/llvm_git.bb
>> index 96ea383731..bed9988c1a 100644
>> --- a/meta/recipes-devtools/clang/llvm_git.bb
>> +++ b/meta/recipes-devtools/clang/llvm_git.bb
>> @@ -11,7 +11,7 @@ require common-source.inc
>>=20
>> LIC_FILES_CHKSUM =3D
>> "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b893c9afe"
>>=20
>> -DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd"
>> +DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd binutils"
>>=20
>> inherit cmake pkgconfig lib_package multilib_header
>>=20
>> @@ -50,6 +50,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>> -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
>> -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>> -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \
>> + -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
>> -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/to=
olchain-native.cmake'
>> \
>> "
>=20
> I think this triggered the following error on our test infrastructure:
>=20
> NOTE: Running task 9262 of 9824
> (virtual:native:/srv/pokybuild/yocto-worker/qemux86-64-ltp/build/layers/o=
penembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx)
>=20
> ERROR: llvm-21.1.8-r1 do_package: QA Issue: llvm: Files/directories were
> installed but not shipped in any package:
> /usr/lib/LLVMgold.so
>=20
> Can you have a look?
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2846
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4942824/raw_inl=
ine
>=20
>=20
> Antonin
>=20
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--GoDEkryou6jmG4qCPZkz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I'm sorry. I have reproduced error in the GCC toolchain. I will upload=
 Patch v2.<br /><br />On Thu, Jan 15, 2026 at 12:58 AM, Antonin Godard wrot=
e:</div>
<div>
<blockquote>Hi,<br /><br />On Tue Jan 13, 2026 at 11:54 PM CET, mark.yang v=
ia lists.openembedded.org wrote:<br />
<blockquote>From: "mark.yang" &lt;mark.yang@lge.com&gt;<br /><br />Currentl=
y, LLVMgold.so is not built because the binutils headers<br />are missing d=
uring the build process.<br /><br />This allows LLVM to find the necessary =
headers and build the LLVMgold.so,<br />which is required for Link Time Opt=
imization (LTO) support properly.<br /><br />Signed-off-by: mark.yang &lt;m=
ark.yang@lge.com&gt;<br />---<br />meta/recipes-devtools/clang/llvm_git.bb =
| 3 ++-<br />1 file changed, 2 insertions(+), 1 deletion(-)<br /><br />diff=
 --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/cl=
ang/llvm_git.bb<br />index 96ea383731..bed9988c1a 100644<br />--- a/meta/re=
cipes-devtools/clang/llvm_git.bb<br />+++ b/meta/recipes-devtools/clang/llv=
m_git.bb<br />@@ -11,7 +11,7 @@ require common-source.inc<br /><br />LIC_FI=
LES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b893c9afe"<=
br /><br />-DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd"<br />=
+DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd binutils"<br /><b=
r />inherit cmake pkgconfig lib_package multilib_header<br /><br />@@ -50,6=
 +50,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \<br />-DLLVM=
_TOOL_YAML2OBJ_BUILD=3DOFF \<br />-DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR=
_NATIVE} \<br />-DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \<br=
 />+ -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \<br />-DCROSS_TOOLCHAIN_FL=
AGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain-native.cmake' \=
<br />"</blockquote>
I think this triggered the following error on our test infrastructure:<br /=
><br />NOTE: Running task 9262 of 9824 (virtual:native:/srv/pokybuild/yocto=
-worker/qemux86-64-ltp/build/layers/openembedded-core/meta/recipes-devtools=
/clang/libclc_git.bb:do_create_spdx)<br />ERROR: llvm-21.1.8-r1 do_package:=
 QA Issue: llvm: Files/directories were installed but not shipped in any pa=
ckage:<br />/usr/lib/LLVMgold.so<br /><br />Can you have a look?<br /><br /=
><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/bui=
lds/2846" target=3D"_blank" rel=3D"noopener">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/63/builds/2846</a><br /><a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/api/v2/logs/4942824/raw_inline" target=3D"=
_blank" rel=3D"noopener">https://autobuilder.yoctoproject.org/valkyrie/api/=
v2/logs/4942824/raw_inline</a><br /><br />Antonin<br /><br />-- <br />Anton=
in Godard, Bootlin<br />Embedded Linux and Kernel engineering<br /><a href=
=3D"https://bootlin.com" target=3D"_blank" rel=3D"noopener">https://bootlin=
.com</a></blockquote>
</div>

--GoDEkryou6jmG4qCPZkz--


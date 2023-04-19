Return-Path: <florian.cathelineau@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDFDC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 13:15:30 +0000 (UTC)
Subject: [PATCH]  icu: upgrade 72-1 -> 73-1
To: openembedded-core@lists.openembedded.org
From: florian.cathelineau@smile.fr
X-Originating-Location: FR (176.157.204.145)
X-Originating-Platform: Linux Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Apr 2023 06:15:20 -0700
Message-ID: <oKZ6.1681910120290537896.AdPN@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="BU1LMRns5PyLGEtxuRGF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 13:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180219

--BU1LMRns5PyLGEtxuRGF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'=
.
# The following is the difference between the old and the new license text.
# Please update the LICENSE value if needed, and summarize the changes in
# the commit message via 'License-Update:' tag.
# (example: 'License-Update: copyright years updated.')
#
# The changes:
#
# --- ../LICENSE
# +++ ../LICENSE
# @@ -13,7 +13,7 @@
#
#  COPYRIGHT AND PERMISSION NOTICE
#
# -Copyright =C2=A9 1991-2022 Unicode, Inc. All rights reserved.
# +Copyright =C2=A9 1991-2023 Unicode, Inc. All rights reserved.
#  Distributed under the Terms of Use in https://www.unicode.org/copyright.=
html.
#
#  Permission is hereby granted, free of charge, to any person obtaining
#
#

SUMMARY =3D "International Component for Unicode libraries"
DESCRIPTION =3D "The International Component for Unicode (ICU) is a mature,=
 \
portable set of C/C++ and Java libraries for Unicode support, software \
       rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MA=
JOR_VER}b.dat
       icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/$=
{BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
   fi
=09

	# Remove build host references...
	sed -i  \
	    -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \

BBCLASSEXTEND =3D "native nativesdk"

LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D a89d03060ff9c46552434dbd1fe3=
ed1f "
LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D 80c2cf39ad8ae12b9b9482a1737c=
6650 "

def icu_download_version(d):
   pvsplit =3D d.getVar('PV').split('-')
SRC_URI:append:class-target =3D "\
          file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
         "
SRC_URI[code.sha256sum] =3D "a 2d2d38217092a7ed56635e34467f92f976b370e20182=
ad325edea6681a71d68 "
SRC_URI[data.sha256sum] =3D " ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c=
33a89efdb55e3385dea "
SRC_URI[code.sha256sum] =3D "a 457431de164b4aa7eca00ed134d00dfbf88a77c6986a=
10ae7774fc076bb8c45 "
SRC_URI[data.sha256sum] =3D " 07d7557efb30fc2e9b74652f1525603b3209a4539d2d3=
45d704e3df3bf9b957e "

UPSTREAM_CHECK_REGEX =3D "releases/tag/release-(?P<pver>(?!.+rc).+)"
GITHUB_BASE_URI =3D "https://github.com/unicode-org/icu/releases"

--BU1LMRns5PyLGEtxuRGF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<pre class=3D"code highlight" lang=3D"plaintext"><span id=3D"LC1" class=3D"=
line" lang=3D"plaintext"># FIXME: the LIC_FILES_CHKSUM values have been upd=
ated by 'devtool upgrade'.</span>
<span id=3D"LC2" class=3D"line" lang=3D"plaintext"># The following is the d=
ifference between the old and the new license text.</span>
<span id=3D"LC3" class=3D"line" lang=3D"plaintext"># Please update the LICE=
NSE value if needed, and summarize the changes in</span>
<span id=3D"LC4" class=3D"line" lang=3D"plaintext"># the commit message via=
 'License-Update:' tag.</span>
<span id=3D"LC5" class=3D"line" lang=3D"plaintext"># (example: 'License-Upd=
ate: copyright years updated.')</span>
<span id=3D"LC6" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC7" class=3D"line" lang=3D"plaintext"># The changes:</span>
<span id=3D"LC8" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC9" class=3D"line" lang=3D"plaintext"># --- ../LICENSE</span>
<span id=3D"LC10" class=3D"line" lang=3D"plaintext"># +++ ../LICENSE</span>
<span id=3D"LC11" class=3D"line" lang=3D"plaintext"># @@ -13,7 +13,7 @@</sp=
an>
<span id=3D"LC12" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC13" class=3D"line" lang=3D"plaintext">#  COPYRIGHT AND PERMIS=
SION NOTICE</span>
<span id=3D"LC14" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC15" class=3D"line" lang=3D"plaintext"># -Copyright &copy; 199=
1-2022 Unicode, Inc. All rights reserved.</span>
<span id=3D"LC16" class=3D"line" lang=3D"plaintext"># +Copyright &copy; 199=
1-2023 Unicode, Inc. All rights reserved.</span>
<span id=3D"LC17" class=3D"line" lang=3D"plaintext">#  Distributed under th=
e Terms of Use in https://www.unicode.org/copyright.html.</span>
<span id=3D"LC18" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC19" class=3D"line" lang=3D"plaintext">#  Permission is hereby=
 granted, free of charge, to any person obtaining</span>
<span id=3D"LC20" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC21" class=3D"line" lang=3D"plaintext">#</span>
<span id=3D"LC22" class=3D"line" lang=3D"plaintext"></span>
<span id=3D"LC23" class=3D"line" lang=3D"plaintext">SUMMARY =3D "Internatio=
nal Component for Unicode libraries"</span>
<span id=3D"LC24" class=3D"line" lang=3D"plaintext">DESCRIPTION =3D "The In=
ternational Component for Unicode (ICU) is a mature, \</span>
<span id=3D"LC25" class=3D"line" lang=3D"plaintext">portable set of C/C++ a=
nd Java libraries for Unicode support, software \</span>
<span id=3D"LC79" class=3D"line" lang=3D"plaintext">        rm -f ${D}/${da=
tadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat</span>
<span id=3D"LC80" class=3D"line" lang=3D"plaintext">        icupkg -tb ${S}=
/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_f=
older(d)}/icudt${ICU_MAJOR_VER}b.dat</span>
<span id=3D"LC81" class=3D"line" lang=3D"plaintext">    fi</span>
<span id=3D"LC60" class=3D"line" lang=3D"plaintext"><span class=3D"idiff le=
ft right deletion">	</span></span>
<span id=3D"LC82" class=3D"line" lang=3D"plaintext"></span>
<span id=3D"LC83" class=3D"line" lang=3D"plaintext">	# Remove build host re=
ferences...</span>
<span id=3D"LC84" class=3D"line" lang=3D"plaintext">	sed -i  \</span>
<span id=3D"LC85" class=3D"line" lang=3D"plaintext">	    -e 's,--sysroot=3D=
${STAGING_DIR_TARGET},,g' \</span>
<span id=3D"LC101" class=3D"line" lang=3D"plaintext"></span>
<span id=3D"LC102" class=3D"line" lang=3D"plaintext">BBCLASSEXTEND =3D "nat=
ive nativesdk"</span>
<span id=3D"LC103" class=3D"line" lang=3D"plaintext"></span>
<span id=3D"LC82" class=3D"line" lang=3D"plaintext">LIC_FILES_CHKSUM =3D "f=
ile://../LICENSE;md5=3D<span class=3D"idiff left right deletion">a89d03060f=
f9c46552434dbd1fe3ed1f</span>"</span>
<span id=3D"LC104" class=3D"line" lang=3D"plaintext">LIC_FILES_CHKSUM =3D "=
file://../LICENSE;md5=3D<span class=3D"idiff left right addition">80c2cf39a=
d8ae12b9b9482a1737c6650</span>"</span>
<span id=3D"LC105" class=3D"line" lang=3D"plaintext"></span>
<span id=3D"LC106" class=3D"line" lang=3D"plaintext">def icu_download_versi=
on(d):</span>
<span id=3D"LC107" class=3D"line" lang=3D"plaintext">    pvsplit =3D d.getV=
ar('PV').split('-')</span>
<span id=3D"LC134" class=3D"line" lang=3D"plaintext">SRC_URI:append:class-t=
arget =3D "\</span>
<span id=3D"LC135" class=3D"line" lang=3D"plaintext">           file://0001=
-Disable-LDFLAGSICUDT-for-Linux.patch \</span>
<span id=3D"LC136" class=3D"line" lang=3D"plaintext">          "</span>
<span id=3D"LC115" class=3D"line" lang=3D"plaintext">SRC_URI[code.sha256sum=
] =3D "a<span class=3D"idiff left right deletion">2d2d38217092a7ed56635e344=
67f92f976b370e20182ad325edea6681a71d68</span>"</span>
<span id=3D"LC116" class=3D"line" lang=3D"plaintext">SRC_URI[data.sha256sum=
] =3D "<span class=3D"idiff left right deletion">ee19f876507d6c23d9e0a2b631=
096f6b0eaa6fa61728c33a89efdb55e3385dea</span>"</span>
<span id=3D"LC137" class=3D"line" lang=3D"plaintext">SRC_URI[code.sha256sum=
] =3D "a<span class=3D"idiff left right addition">457431de164b4aa7eca00ed13=
4d00dfbf88a77c6986a10ae7774fc076bb8c45</span>"</span>
<span id=3D"LC138" class=3D"line" lang=3D"plaintext">SRC_URI[data.sha256sum=
] =3D "<span class=3D"idiff left right addition">07d7557efb30fc2e9b74652f15=
25603b3209a4539d2d345d704e3df3bf9b957e</span>"</span>
<span id=3D"LC139" class=3D"line" lang=3D"plaintext"></span>
<span id=3D"LC140" class=3D"line" lang=3D"plaintext">UPSTREAM_CHECK_REGEX =
=3D "releases/tag/release-(?P&lt;pver&gt;(?!.+rc).+)"</span>
<span id=3D"LC141" class=3D"line" lang=3D"plaintext">GITHUB_BASE_URI =3D "h=
ttps://github.com/unicode-org/icu/releases"</span>
</pre>

--BU1LMRns5PyLGEtxuRGF--


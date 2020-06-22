Subject: package bzip2-ptest requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest
To: openembedded-core@lists.openembedded.org
From: "Rahul Kumar" <rahulk@mvista.com>
X-Originating-Location: Bengaluru, Karnataka, IN (36.255.87.241)
X-Originating-Platform: Linux Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Jun 2020 10:58:59 -0700
Message-ID: <HwH9.1592848739113991729.4KYH@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9QKKP9Mz2OqN9I8ZwkTR"

--9QKKP9Mz2OqN9I8ZwkTR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi community members,

I am working on Yocto Newcommer Bug 13444 - Add test suite for bzip2
Patch link
https://patchwork.openembedded.org/patch/173009/

but upstream build, reported below error .
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2/ptes=
t/bzip2-tests/.git/hooks/update.sample contained in package bzip2-ptest req=
uires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest? [file-rd=
eps]
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors. Pl=
ease consider fixing them.

I am already using below line to my patch.
RDEPENDS_${PN}-ptest +=3D "make bash perl"

can anyone please help me on this.

--9QKKP9Mz2OqN9I8ZwkTR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi community members,</div>
<div><br />I am working on Yocto Newcommer Bug 13444 - Add test suite for =
bzip2</div>
<div>Patch link</div>
<div>https://patchwork.openembedded.org/patch/173009/</div>
<div>&nbsp;</div>
<div>but upstream build, reported below error .</div>
<div>step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2=
/ptest/bzip2-tests/.git/hooks/update.sample contained in package bzip2-ptes=
t requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest? [fi=
le-rdeps]</div>
<div>step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal error=
s. Please consider fixing them.</div>
<div>&nbsp;</div>
<div>I am already using below line to my patch.&nbsp;</div>
<div>RDEPENDS_${PN}-ptest +=3D "make bash perl"</div>
<div>&nbsp;</div>
<div>can anyone please help me on this.</div>
</div>
<div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>

--9QKKP9Mz2OqN9I8ZwkTR--

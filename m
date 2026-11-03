Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5337.1793687205273840149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=USQv2Lmv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DbUTq6iF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1a016b216-1696c0ed-8d42-4541-9f12-80b0e06033bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iYjnrlD/BecAzSYvDsa4MWdjlByh6drZAfRxQn9FVFs=;
	b=USQv2LmvMZQRMuiEc2j6XzGcqBlIK9LHkUBoObHJGjOM2k8bzZx3WAvvV5BMO83J
	2OUfHdbXVZQbEmjKOozfeZunf8v45gvE9TY2G7C3M+p7u98c47BbSyJzSZsXBF3M7B0
	sHcI9szwTvpfLiPukw9rn9DtEiZpVgxu9ps4C+lM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iYjnrlD/BecAzSYvDsa4MWdjlByh6drZAfRxQn9FVFs=;
	b=DbUTq6iFOMq4vBz2uOpQDzQSJDSwtWB0ZmdMgn5LShes2P9wFlPxKJYrtaDyi+VH
	KSuP1/rMgmD9CotZLzH08/34b6a18RtQImoTanvfaVCdSPhuhFAnyEYU0Yni9JahrM4
	+fJWDTolGa8DVoOR52+zJIFBHlvaiNP8Owbge72s=
Content-Type: multipart/mixed; boundary="===============5621072509621010809=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.4.0 SUCCEEDED
Message-ID: <010101a1a016b216-1696c0ed-8d42-4541-9f12-80b0e06033bf-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249240

--===============5621072509621010809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.3.5-1.4.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From b499b447610f198006ac20726e80979424c2a077 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 05:57:51 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.3.5 -> 1.4.0

## [v1.4.0] - 2026-11-02
[v1.4.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.4.0
### Added or Changed

- Added the `--export-author` option and the `openvex` export type, generating
  an [OpenVEX](https://github.com/openvex/spec) v0.2.0 document ([#38](
 ) by Andrey Zhizhikin).
- Product database mappings can now use a wildcard vendor.
- Added a `crowcpp:crow` product database entry.
- Added support for multiple simple annotation entries or OpenVEX statements
  for the same vulnerability, and for multiple package versions in SPDX2
  annotations.
- Exported datetime fields may now include microseconds, as input datetime
  values are no longer truncated.

### Fixed

- Improved assessment of Linux kernel CVE version ranges, including backports
  and stable kernel branches ([#43](
 )).
- Improved version parsing and comparison for additional version formats,
  distribution suffixes, and alphabetical version segments.
- Fixed handling of version ranges whose lower bound contains a wildcard (e.g.,
  `1.2.*`).
- Corrected VEX assessment generation from Yocto VEX manifests, including the
  handling of unpatched and ignored assessments and their justifications.
- Improved error reporting when extracting compressed SPDX2 SBOMs ([#39](
 )).

### New Contributors

- Andrey Zhizhikin made their first contribution in [#38](
 ).

## [v1.3.5] - 2026-09-14

[v1.3.5]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5
## [v1.3.4] - 2026-09-07

[v1.3.4]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.4
## [v1.3.3] - 2026-08-03

[v1.3.3]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.3
## [v1.3.2] - 2026-06-24

[v1.3.2]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.2
## [v1.3.1] - 2026-05-07

[v1.3.1]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.1
## [v1.3.0] - 2026-04-22

[v1.3.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.0
## [v1.2.1] - 2026-03-25

[v1.2.1]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.2.1
## [v1.2.0] - 2026-03-16

[v1.2.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.2.0
## [v1.1.0] - 2026-02-04

[v1.1.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.1.0
## [v1.0.1] - 2025-12-01

[v1.0.1]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.0.1
---
 ...-sbom-cve-check_1.3.5.bb => python3-sbom-cve-check_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.5.bb => python3-sbom-cve-check_1.4.0.bb} (80%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
similarity index 80%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
index 5396720fbd..fe38fed5ea 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
-SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
+SRC_URI[sha256sum] = "b0dfd6a60c715d7b4694897fdde5dddac0524e9bb25bc6736160712ce1d91e86"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============5621072509621010809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.5.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.4.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.3.5" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.4.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.4.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/sbom_cve_check/export/__pycache__/export_openvex.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/database/annot_utils.py /usr/lib/python3.14/site-packages/sbom_cve_check/export/export_openvex.py /usr/lib/python3.14/site-packages/sbom_cve_check/database/__pycache__/annot_utils.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.3.5 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1364094 to 1415575 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.4.0.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/database/annot_utils.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/database/__pycache__/annot_utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/export/export_openvex.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/export/__pycache__/export_openvex.cpython-314.pyc was added

--===============5621072509621010809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-sbom-cve-check-changelog.txt"

## [v1.4.0] - 2026-11-02
[v1.4.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.4.0
### Added or Changed

- Added the `--export-author` option and the `openvex` export type, generating
  an [OpenVEX](https://github.com/openvex/spec) v0.2.0 document ([#38](
 ) by Andrey Zhizhikin).
- Product database mappings can now use a wildcard vendor.
- Added a `crowcpp:crow` product database entry.
- Added support for multiple simple annotation entries or OpenVEX statements
  for the same vulnerability, and for multiple package versions in SPDX2
  annotations.
- Exported datetime fields may now include microseconds, as input datetime
  values are no longer truncated.

### Fixed

- Improved assessment of Linux kernel CVE version ranges, including backports
  and stable kernel branches ([#43](
 )).
- Improved version parsing and comparison for additional version formats,
  distribution suffixes, and alphabetical version segments.
- Fixed handling of version ranges whose lower bound contains a wildcard (e.g.,
  `1.2.*`).
- Corrected VEX assessment generation from Yocto VEX manifests, including the
  handling of unpatched and ignored assessments and their justifications.
- Improved error reporting when extracting compressed SPDX2 SBOMs ([#39](
 )).

### New Contributors

- Andrey Zhizhikin made their first contribution in [#38](
 ).

## [v1.3.5] - 2026-09-14

[v1.3.5]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5
## [v1.3.4] - 2026-09-07

[v1.3.4]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.4
## [v1.3.3] - 2026-08-03

[v1.3.3]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.3
## [v1.3.2] - 2026-06-24

[v1.3.2]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.2
## [v1.3.1] - 2026-05-07

[v1.3.1]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.1
## [v1.3.0] - 2026-04-22

[v1.3.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.0
## [v1.2.1] - 2026-03-25

[v1.2.1]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.2.1
## [v1.2.0] - 2026-03-16

[v1.2.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.2.0
## [v1.1.0] - 2026-02-04

[v1.1.0]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.1.0
## [v1.0.1] - 2025-12-01

[v1.0.1]: https://github.com/bootlin/sbom-cve-check/releases/tag/v1.0.1

--===============5621072509621010809==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.3.5-1.4.0.patch"

RnJvbSBiNDk5YjQ0NzYxMGYxOTgwMDZhYzIwNzI2ZTgwOTc5NDI0YzJhMDc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNTo1Nzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2JvbS1jdmUtY2hlY2s6IHVwZ3JhZGUgMS4zLjUgLT4gMS40LjAKCiMjIFt2MS40LjBd
IC0gMjAyNi0xMS0wMgpbdjEuNC4wXTogaHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1j
dmUtY2hlY2svcmVsZWFzZXMvdGFnL3YxLjQuMAojIyMgQWRkZWQgb3IgQ2hhbmdlZAoKLSBBZGRl
ZCB0aGUgYC0tZXhwb3J0LWF1dGhvcmAgb3B0aW9uIGFuZCB0aGUgYG9wZW52ZXhgIGV4cG9ydCB0
eXBlLCBnZW5lcmF0aW5nCiAgYW4gW09wZW5WRVhdKGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVudmV4
L3NwZWMpIHYwLjIuMCBkb2N1bWVudCAoWyMzOF0oCiApIGJ5IEFuZHJleSBaaGl6aGlraW4pLgot
IFByb2R1Y3QgZGF0YWJhc2UgbWFwcGluZ3MgY2FuIG5vdyB1c2UgYSB3aWxkY2FyZCB2ZW5kb3Iu
Ci0gQWRkZWQgYSBgY3Jvd2NwcDpjcm93YCBwcm9kdWN0IGRhdGFiYXNlIGVudHJ5LgotIEFkZGVk
IHN1cHBvcnQgZm9yIG11bHRpcGxlIHNpbXBsZSBhbm5vdGF0aW9uIGVudHJpZXMgb3IgT3BlblZF
WCBzdGF0ZW1lbnRzCiAgZm9yIHRoZSBzYW1lIHZ1bG5lcmFiaWxpdHksIGFuZCBmb3IgbXVsdGlw
bGUgcGFja2FnZSB2ZXJzaW9ucyBpbiBTUERYMgogIGFubm90YXRpb25zLgotIEV4cG9ydGVkIGRh
dGV0aW1lIGZpZWxkcyBtYXkgbm93IGluY2x1ZGUgbWljcm9zZWNvbmRzLCBhcyBpbnB1dCBkYXRl
dGltZQogIHZhbHVlcyBhcmUgbm8gbG9uZ2VyIHRydW5jYXRlZC4KCiMjIyBGaXhlZAoKLSBJbXBy
b3ZlZCBhc3Nlc3NtZW50IG9mIExpbnV4IGtlcm5lbCBDVkUgdmVyc2lvbiByYW5nZXMsIGluY2x1
ZGluZyBiYWNrcG9ydHMKICBhbmQgc3RhYmxlIGtlcm5lbCBicmFuY2hlcyAoWyM0M10oCiApKS4K
LSBJbXByb3ZlZCB2ZXJzaW9uIHBhcnNpbmcgYW5kIGNvbXBhcmlzb24gZm9yIGFkZGl0aW9uYWwg
dmVyc2lvbiBmb3JtYXRzLAogIGRpc3RyaWJ1dGlvbiBzdWZmaXhlcywgYW5kIGFscGhhYmV0aWNh
bCB2ZXJzaW9uIHNlZ21lbnRzLgotIEZpeGVkIGhhbmRsaW5nIG9mIHZlcnNpb24gcmFuZ2VzIHdo
b3NlIGxvd2VyIGJvdW5kIGNvbnRhaW5zIGEgd2lsZGNhcmQgKGUuZy4sCiAgYDEuMi4qYCkuCi0g
Q29ycmVjdGVkIFZFWCBhc3Nlc3NtZW50IGdlbmVyYXRpb24gZnJvbSBZb2N0byBWRVggbWFuaWZl
c3RzLCBpbmNsdWRpbmcgdGhlCiAgaGFuZGxpbmcgb2YgdW5wYXRjaGVkIGFuZCBpZ25vcmVkIGFz
c2Vzc21lbnRzIGFuZCB0aGVpciBqdXN0aWZpY2F0aW9ucy4KLSBJbXByb3ZlZCBlcnJvciByZXBv
cnRpbmcgd2hlbiBleHRyYWN0aW5nIGNvbXByZXNzZWQgU1BEWDIgU0JPTXMgKFsjMzldKAogKSku
CgojIyMgTmV3IENvbnRyaWJ1dG9ycwoKLSBBbmRyZXkgWmhpemhpa2luIG1hZGUgdGhlaXIgZmly
c3QgY29udHJpYnV0aW9uIGluIFsjMzhdKAogKS4KCiMjIFt2MS4zLjVdIC0gMjAyNi0wOS0xNAoK
W3YxLjMuNV06IGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL3Nib20tY3ZlLWNoZWNrL3JlbGVh
c2VzL3RhZy92MS4zLjUKIyMgW3YxLjMuNF0gLSAyMDI2LTA5LTA3CgpbdjEuMy40XTogaHR0cHM6
Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcmVsZWFzZXMvdGFnL3YxLjMuNAoj
IyBbdjEuMy4zXSAtIDIwMjYtMDgtMDMKClt2MS4zLjNdOiBodHRwczovL2dpdGh1Yi5jb20vYm9v
dGxpbi9zYm9tLWN2ZS1jaGVjay9yZWxlYXNlcy90YWcvdjEuMy4zCiMjIFt2MS4zLjJdIC0gMjAy
Ni0wNi0yNAoKW3YxLjMuMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL3Nib20tY3ZlLWNo
ZWNrL3JlbGVhc2VzL3RhZy92MS4zLjIKIyMgW3YxLjMuMV0gLSAyMDI2LTA1LTA3CgpbdjEuMy4x
XTogaHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcmVsZWFzZXMvdGFn
L3YxLjMuMQojIyBbdjEuMy4wXSAtIDIwMjYtMDQtMjIKClt2MS4zLjBdOiBodHRwczovL2dpdGh1
Yi5jb20vYm9vdGxpbi9zYm9tLWN2ZS1jaGVjay9yZWxlYXNlcy90YWcvdjEuMy4wCiMjIFt2MS4y
LjFdIC0gMjAyNi0wMy0yNQoKW3YxLjIuMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9ib290bGluL3Ni
b20tY3ZlLWNoZWNrL3JlbGVhc2VzL3RhZy92MS4yLjEKIyMgW3YxLjIuMF0gLSAyMDI2LTAzLTE2
CgpbdjEuMi4wXTogaHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcmVs
ZWFzZXMvdGFnL3YxLjIuMAojIyBbdjEuMS4wXSAtIDIwMjYtMDItMDQKClt2MS4xLjBdOiBodHRw
czovL2dpdGh1Yi5jb20vYm9vdGxpbi9zYm9tLWN2ZS1jaGVjay9yZWxlYXNlcy90YWcvdjEuMS4w
CiMjIFt2MS4wLjFdIC0gMjAyNS0xMi0wMQoKW3YxLjAuMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9i
b290bGluL3Nib20tY3ZlLWNoZWNrL3JlbGVhc2VzL3RhZy92MS4wLjEKLS0tCiAuLi4tc2JvbS1j
dmUtY2hlY2tfMS4zLjUuYmIgPT4gcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjQuMC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2sve3B5dGhvbjMtc2JvbS1jdmUt
Y2hlY2tfMS4zLjUuYmIgPT4gcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjQuMC5iYn0gKDgwJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9u
My1zYm9tLWN2ZS1jaGVja18xLjMuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2
ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9weXRo
b24zLXNib20tY3ZlLWNoZWNrXzEuMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjQuMC5iYgppbmRleCA1
Mzk2NzIwZmJkLi5mZTM4ZmVkNWVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
c2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18xLjMuNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svcHl0aG9uMy1zYm9tLWN2ZS1jaGVja18x
LjQuMC5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT01NzBhOWIzNzQ5ZGQwNDYzYTE3Nzg4MDNiMTJhNmRjZSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjllZDhiMGU5YzQ2MDE1NDQ0Y2QzZTMwMzMyZDk1NThlMGJlNWY1ZmVjOTdmNmRmNDdj
Njc2MDE2NmEzMTQxNjciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjBkZmQ2YTYwYzcxNWQ3YjQ2
OTQ4OTdmZGRlNWRkZGFjMDUyNGU5YmIyNWJjNjczNjE2MDcxMmNlMWQ5MWU4NiIKIAogaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4xCgo=

--===============5621072509621010809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.4.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.4.0.dist-info, added "/usr/lib/python3.14/site-packages/sbom_cve_check/database/__pycache__/annot_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/database/annot_utils.py /usr/lib/python3.14/site-packages/sbom_cve_check/export/__pycache__/export_openvex.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/export/export_openvex.py"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.5.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.4.0.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/database/annot_utils.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/database/__pycache__/annot_utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/export/export_openvex.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/export/__pycache__/export_openvex.cpython-314.pyc was added

--===============5621072509621010809==--

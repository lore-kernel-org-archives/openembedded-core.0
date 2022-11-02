Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8C5C64EC1
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.843.1667349632023130775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NCm7htCl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c857fb-29a2ba9a-47d4-48ff-b53b-0e716b098b55-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lThmzpVwdw4H5bM2qqV8ZUC+D/bIbvUPrw/Oc4bCgC8=;
	b=NCm7htClxxlDzQML5kdFR6ghoGOBiGRRH46O+tenTAjBFIhKHxn2OkpVY01J9eBR
	l59Fu+o4NXrAwTf4u+GXMiLLoc1k7IT860+DVpq0bDitzGZw5i5ILyYIiebO5qK/sn2
	e/+eImn4A/H/ie1ia5IyCftl5pQkeMHeX1pvx3RY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lThmzpVwdw4H5bM2qqV8ZUC+D/bIbvUPrw/Oc4bCgC8=;
	b=LK1/VcGif3CmgNYZ9NaD57x04SlP+uwltT9SNXOP84KLKz6pv8DSx4j/2lz64SD5
	AQzEMtJ6RtcpM7yivDfWTcJ0S2CRcoXB2+fBfqlPtbx4rRFxv3qUvMEhHGXb+/L/dkS
	l4kDSWQenkxGX7ZA0y5v6jZ5xmnj5YZ89EU07OYE=
Content-Type: multipart/mixed; boundary="===============1180338764560810303=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 22.3 SUCCEEDED
Message-ID: <0101018435c857fb-29a2ba9a-47d4-48ff-b53b-0e716b098b55-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172431

--===============1180338764560810303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-22.2.2-22.3.patch
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
--===============1180338764560810303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pip: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-22.2.2.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-22.3.tar.gz file://no_shebang_mangling.patch"
packages/core2-32-poky-linux/python3-pip: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "22.2.2" to "22.3"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGV changed from 22.2.2 [default] to 22.3 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info -> /usr/lib/python3.11/site-packages/pip-22.3.dist-info, removed "/usr/lib/python3.11/site-packages/pip/_vendor/pep517/compat.py /usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/compat.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/_compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/pep517/_compat.py"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 13898594 to 13956896 (+0%)
packages/core2-32-poky-linux/python3-pip/python3-pip: PV changed from "22.2.2" to "22.3"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/_compat.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/_compat.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/compat.cpython-311.pyc was removed

--===============1180338764560810303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info -> /usr/lib/python3.11/site-packages/pip-22.3.dist-info, removed "/usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/pep517/compat.py", added "/usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/_compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/pep517/_compat.py"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pip-22.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/_compat.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/_compat.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pip-22.2.2.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pep517/__pycache__/compat.cpython-311.pyc was removed

--===============1180338764560810303==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-22.2.2-22.3.patch"

RnJvbSAwNjUxYzJlNTE0YzlkZWM5MmIyODgwYjY4Yjc2NjJhNDQ2ODI5YjVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDo0MzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDIyLjIuMiAtPiAyMi4zCgotLS0KIC4uLmhvbjMtcGlwXzIyLjIu
Mi5iYiA9PiBweXRob24zLXBpcF8yMi4zLmJifSB8IDEyMSArKysrKysrKysrKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBpcF8yMi4yLjIuYmIgPT4gcHl0
aG9uMy1waXBfMjIuMy5iYn0gKDEyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIyLjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1waXBfMjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIyLjIuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yMi4zLmJiCmlu
ZGV4IDViNmNjY2Y3ZWQuLmFjNGJjOTBiZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1waXBfMjIuMi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1waXBfMjIuMy5iYgpAQCAtMSw0MCArMSwxMDUgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBzcmMvcGlwL192ZW5kb3IvY2VydGlmaS9MSUNFTlNFCisjICsrKyBz
cmMvcGlwL192ZW5kb3IvY2VydGlmaS9MSUNFTlNFCisjIEBAIC02LDcgKzYsNyBAQAorIyAgVGhp
cyBpcyBhIGJ1bmRsZSBvZiBYLjUwOSBjZXJ0aWZpY2F0ZXMgb2YgcHVibGljIENlcnRpZmljYXRl
IEF1dGhvcml0aWVzCisjICAoQ0EpLiBUaGVzZSB3ZXJlIGF1dG9tYXRpY2FsbHkgZXh0cmFjdGVk
IGZyb20gTW96aWxsYSdzIHJvb3QgY2VydGlmaWNhdGVzCisjICBmaWxlIChjZXJ0ZGF0YS50eHQp
LiAgVGhpcyBmaWxlIGNhbiBiZSBmb3VuZCBpbiB0aGUgbW96aWxsYSBzb3VyY2UgdHJlZToKKyMg
LWh0dHA6Ly9teHIubW96aWxsYS5vcmcvbW96aWxsYS9zb3VyY2Uvc2VjdXJpdHkvbnNzL2xpYi9j
a2Z3L2J1aWx0aW5zL2NlcnRkYXRhLnR4dD9yYXc9MSMKKyMgK2h0dHBzOi8vaGcubW96aWxsYS5v
cmcvbW96aWxsYS1jZW50cmFsL2ZpbGUvdGlwL3NlY3VyaXR5L25zcy9saWIvY2tmdy9idWlsdGlu
cy9jZXJ0ZGF0YS50eHQKKyMgIEl0IGNvbnRhaW5zIHRoZSBjZXJ0aWZpY2F0ZXMgaW4gUEVNIGZv
cm1hdCBhbmQgdGhlcmVmb3JlCisjICBjYW4gYmUgZGlyZWN0bHkgdXNlZCB3aXRoIGN1cmwgLyBs
aWJjdXJsIC8gcGhwX2N1cmwsIG9yIHdpdGgKKyMgIGFuIEFwYWNoZSttb2Rfc3NsIHdlYnNlcnZl
ciBmb3IgU1NMIGNsaWVudCBhdXRoZW50aWNhdGlvbi4KKyMgLS0tIHNyYy9waXAvX3ZlbmRvci90
eXBpbmdfZXh0ZW5zaW9ucy5MSUNFTlNFCisjICsrKyBzcmMvcGlwL192ZW5kb3IvdHlwaW5nX2V4
dGVuc2lvbnMuTElDRU5TRQorIyBAQCAtMTMsMTIgKzEzLDExIEBACisjICAKKyMgIEluIE1heSAy
MDAwLCBHdWlkbyBhbmQgdGhlIFB5dGhvbiBjb3JlIGRldmVsb3BtZW50IHRlYW0gbW92ZWQgdG8K
KyMgIEJlT3Blbi5jb20gdG8gZm9ybSB0aGUgQmVPcGVuIFB5dGhvbkxhYnMgdGVhbS4gIEluIE9j
dG9iZXIgb2YgdGhlIHNhbWUKKyMgLXllYXIsIHRoZSBQeXRob25MYWJzIHRlYW0gbW92ZWQgdG8g
RGlnaXRhbCBDcmVhdGlvbnMgKG5vdyBab3BlCisjIC1Db3Jwb3JhdGlvbiwgc2VlIGh0dHA6Ly93
d3cuem9wZS5jb20pLiAgSW4gMjAwMSwgdGhlIFB5dGhvbiBTb2Z0d2FyZQorIyAtRm91bmRhdGlv
biAoUFNGLCBzZWUgaHR0cDovL3d3dy5weXRob24ub3JnL3BzZi8pIHdhcyBmb3JtZWQsIGEKKyMg
LW5vbi1wcm9maXQgb3JnYW5pemF0aW9uIGNyZWF0ZWQgc3BlY2lmaWNhbGx5IHRvIG93biBQeXRo
b24tcmVsYXRlZAorIyAtSW50ZWxsZWN0dWFsIFByb3BlcnR5LiAgWm9wZSBDb3Jwb3JhdGlvbiBp
cyBhIHNwb25zb3JpbmcgbWVtYmVyIG9mCisjIC10aGUgUFNGLgorIyAreWVhciwgdGhlIFB5dGhv
bkxhYnMgdGVhbSBtb3ZlZCB0byBEaWdpdGFsIENyZWF0aW9ucywgd2hpY2ggYmVjYW1lCisjICta
b3BlIENvcnBvcmF0aW9uLiAgSW4gMjAwMSwgdGhlIFB5dGhvbiBTb2Z0d2FyZSBGb3VuZGF0aW9u
IChQU0YsIHNlZQorIyAraHR0cHM6Ly93d3cucHl0aG9uLm9yZy9wc2YvKSB3YXMgZm9ybWVkLCBh
IG5vbi1wcm9maXQgb3JnYW5pemF0aW9uCisjICtjcmVhdGVkIHNwZWNpZmljYWxseSB0byBvd24g
UHl0aG9uLXJlbGF0ZWQgSW50ZWxsZWN0dWFsIFByb3BlcnR5LgorIyArWm9wZSBDb3Jwb3JhdGlv
biB3YXMgYSBzcG9uc29yaW5nIG1lbWJlciBvZiB0aGUgUFNGLgorIyAgCisjICBBbGwgUHl0aG9u
IHJlbGVhc2VzIGFyZSBPcGVuIFNvdXJjZSAoc2VlIGh0dHA6Ly93d3cub3BlbnNvdXJjZS5vcmcg
Zm9yCisjICB0aGUgT3BlbiBTb3VyY2UgRGVmaW5pdGlvbikuICBIaXN0b3JpY2FsbHksIG1vc3Qs
IGJ1dCBub3QgYWxsLCBQeXRob24KKyMgQEAgLTc0LDggKzczLDkgQEAKKyMgIGRpc3RyaWJ1dGUs
IGFuZCBvdGhlcndpc2UgdXNlIFB5dGhvbiBhbG9uZSBvciBpbiBhbnkgZGVyaXZhdGl2ZSB2ZXJz
aW9uLAorIyAgcHJvdmlkZWQsIGhvd2V2ZXIsIHRoYXQgUFNGJ3MgTGljZW5zZSBBZ3JlZW1lbnQg
YW5kIFBTRidzIG5vdGljZSBvZiBjb3B5cmlnaHQsCisjICBpLmUuLCAiQ29weXJpZ2h0IChjKSAy
MDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA1LCAyMDA2LCAyMDA3LCAyMDA4LCAyMDA5LCAyMDEw
LAorIyAtMjAxMSwgMjAxMiwgMjAxMywgMjAxNCBQeXRob24gU29mdHdhcmUgRm91bmRhdGlvbjsg
QWxsIFJpZ2h0cyBSZXNlcnZlZCIgYXJlCisjIC1yZXRhaW5lZCBpbiBQeXRob24gYWxvbmUgb3Ig
aW4gYW55IGRlcml2YXRpdmUgdmVyc2lvbiBwcmVwYXJlZCBieSBMaWNlbnNlZS4KKyMgKzIwMTEs
IDIwMTIsIDIwMTMsIDIwMTQsIDIwMTUsIDIwMTYsIDIwMTcsIDIwMTgsIDIwMTksIDIwMjAsIDIw
MjEsIDIwMjIgUHl0aG9uIFNvZnR3YXJlIEZvdW5kYXRpb247CisjICtBbGwgUmlnaHRzIFJlc2Vy
dmVkIiBhcmUgcmV0YWluZWQgaW4gUHl0aG9uIGFsb25lIG9yIGluIGFueSBkZXJpdmF0aXZlIHZl
cnNpb24KKyMgK3ByZXBhcmVkIGJ5IExpY2Vuc2VlLgorIyAgCisjICAzLiBJbiB0aGUgZXZlbnQg
TGljZW5zZWUgcHJlcGFyZXMgYSBkZXJpdmF0aXZlIHdvcmsgdGhhdCBpcyBiYXNlZCBvbgorIyAg
b3IgaW5jb3Jwb3JhdGVzIFB5dGhvbiBvciBhbnkgcGFydCB0aGVyZW9mLCBhbmQgd2FudHMgdG8g
bWFrZQorIyBAQCAtMTgwLDkgKzE4MCw5IEBACisjICBBZ3JlZW1lbnQsIExpY2Vuc2VlIG1heSBz
dWJzdGl0dXRlIHRoZSBmb2xsb3dpbmcgdGV4dCAob21pdHRpbmcgdGhlCisjICBxdW90ZXMpOiAi
UHl0aG9uIDEuNi4xIGlzIG1hZGUgYXZhaWxhYmxlIHN1YmplY3QgdG8gdGhlIHRlcm1zIGFuZAor
IyAgY29uZGl0aW9ucyBpbiBDTlJJJ3MgTGljZW5zZSBBZ3JlZW1lbnQuICBUaGlzIEFncmVlbWVu
dCB0b2dldGhlciB3aXRoCisjIC1QeXRob24gMS42LjEgbWF5IGJlIGxvY2F0ZWQgb24gdGhlIElu
dGVybmV0IHVzaW5nIHRoZSBmb2xsb3dpbmcKKyMgK1B5dGhvbiAxLjYuMSBtYXkgYmUgbG9jYXRl
ZCBvbiB0aGUgaW50ZXJuZXQgdXNpbmcgdGhlIGZvbGxvd2luZworIyAgdW5pcXVlLCBwZXJzaXN0
ZW50IGlkZW50aWZpZXIgKGtub3duIGFzIGEgaGFuZGxlKTogMTg5NS4yMi8xMDEzLiAgVGhpcwor
IyAtQWdyZWVtZW50IG1heSBhbHNvIGJlIG9idGFpbmVkIGZyb20gYSBwcm94eSBzZXJ2ZXIgb24g
dGhlIEludGVybmV0CisjICtBZ3JlZW1lbnQgbWF5IGFsc28gYmUgb2J0YWluZWQgZnJvbSBhIHBy
b3h5IHNlcnZlciBvbiB0aGUgaW50ZXJuZXQKKyMgIHVzaW5nIHRoZSBmb2xsb3dpbmcgVVJMOiBo
dHRwOi8vaGRsLmhhbmRsZS5uZXQvMTg5NS4yMi8xMDEzIi4KKyMgIAorIyAgMy4gSW4gdGhlIGV2
ZW50IExpY2Vuc2VlIHByZXBhcmVzIGEgZGVyaXZhdGl2ZSB3b3JrIHRoYXQgaXMgYmFzZWQgb24K
KyMgCisjCisKIFNVTU1BUlkgPSAiVGhlIFB5UEEgcmVjb21tZW5kZWQgdG9vbCBmb3IgaW5zdGFs
bGluZyBQeXRob24gcGFja2FnZXMiCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2pl
Y3QvcGlwIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCAmIEFwYWNo
ZS0yLjAgJiBNUEwtMi4wICYgTEdQTC0yLjEtb25seSAmIEJTRC0zLUNsYXVzZSAmIFBTRi0yLjAg
JiBCU0QtMi1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gIlwKLSAgZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT02M2VjNTJiYWY5NTE2M2I1OTcwMDhiYjQ2ZGI2ODAzMCBcCi0gIGZpbGU6Ly9zcmMv
cGlwL192ZW5kb3IvY2FjaGVjb250cm9sL0xJQ0VOU0UudHh0O21kNT02NTcyNjkyMTQ4MDc5ZWJi
YmQ4MDBiZTRiOWYzNmM2ZCBcCi0gIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvY2VydGlmaS9MSUNF
TlNFO21kNT02N2RhMDcxNGMzZjk0NzEwNjdiNzI5ZWNhNmM5ZmJlOCBcCi0gIGZpbGU6Ly9zcmMv
cGlwL192ZW5kb3IvY2hhcmRldC9MSUNFTlNFO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhi
MzY0NTE2YyBcCi0gIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvY29sb3JhbWEvTElDRU5TRS50eHQ7
bWQ1PWI0OTM2NDI5YTU2YTY1MmI4NGM1YzAxMjgwZGNhYTI2IFwKLSAgZmlsZTovL3NyYy9waXAv
X3ZlbmRvci9kaXN0bGliL0xJQ0VOU0UudHh0O21kNT1mNmExMTQzMGQ1Y2Q2ZTJjZDM4MzJlZTk0
ZjIyZGRmYyBcCi0gIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvZGlzdHJvL0xJQ0VOU0U7bWQ1PWQy
Nzk0YzBkZjViOTA3ZmRhY2UyMzVhNjE5ZDgwMzE0IFwKLSAgZmlsZTovL3NyYy9waXAvX3ZlbmRv
ci9pZG5hL0xJQ0VOU0UubWQ7bWQ1PTIzOTY2OGE3YzYwNjZkOWUwYzUzODJlOWM4YzZjMGUxIFwK
LSAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9tc2dwYWNrL0NPUFlJTkc7bWQ1PWNkOTUyMzE4MWQ5
ZDRmYmY3ZmZjYTUyZWFhMmE1NzUxIFwKLSAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9wYWNrYWdp
bmcvTElDRU5TRTttZDU9ZmFhZGFlZGNhOTI1MWE5MGIyMDVjOTE2NzU3OGNlOTEgXAotICBmaWxl
Oi8vc3JjL3BpcC9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFLkFQQUNIRTttZDU9MmVlNDExMTJh
NDRmZTcwMTRkY2UzM2UyNjQ2OGJhOTMgXAotICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3BlcDUx
Ny9MSUNFTlNFO21kNT1hYWQ2OWM5M2Y2MDUwMDNlMzM0MmIxNzRkOWIwNzA4YyBcCi0gIGZpbGU6
Ly9zcmMvcGlwL192ZW5kb3IvcGtnX3Jlc291cmNlcy9MSUNFTlNFO21kNT05YTMzODk3ZjFiY2Ex
MTYwZDdhYWQzODM1MTUyZTE1OCBcCi0gIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvcGxhdGZvcm1k
aXJzL0xJQ0VOU0UudHh0O21kNT0yODJjOTcwYmI4NDQ5NTRjODUzNWRkNmU5NzMzZGI3ZiBcCi0g
IGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvcHlnbWVudHMvTElDRU5TRTttZDU9MzZhMTNjOTA1MTRl
Mjg5OWYxZWJhN2Y0MWMzZWU1OTIgXAotICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3B5cGFyc2lu
Zy9MSUNFTlNFO21kNT02NTdhNTY2MjMzODg4NTEzZTFmMDdiYTEzZTJmNDdmMSBcCi0gIGZpbGU6
Ly9zcmMvcGlwL192ZW5kb3IvcmVxdWVzdHMvTElDRU5TRTttZDU9MzQ0MDBiNjgwNzJkNzEwZmVj
ZDBhMjk0MGEwZDE2NTggXAotICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3Jlc29sdmVsaWIvTElD
RU5TRTttZDU9NzhlMWMwMjQ4MDUxYzMyYTM4YTdmODIwYzMwYmQ3YTUgXAotICBmaWxlOi8vc3Jj
L3BpcC9fdmVuZG9yL3JpY2gvTElDRU5TRTttZDU9YjVmMGI5NGZiYzk0ZjVhZDlhZTRlZmNmOGE3
NzgzMDMgXAotICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3NpeC5MSUNFTlNFO21kNT00M2NmYzll
NGFjMGUzNzdhY2ZiOWI3NmY1NmI4NDE1ZCBcCi0gIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvdGVu
YWNpdHkvTElDRU5TRTttZDU9MTc1NzkyNTE4ZTRhYzAxNWFiNjY5NmQxNmM0ZjYwN2UgXAotICBm
aWxlOi8vc3JjL3BpcC9fdmVuZG9yL3RvbWxpL0xJQ0VOU0U7bWQ1PWFhYWFmMDg3OWQxN2RmMDEx
MGQxYWE4YzhjOWY0NmY1IFwKLSAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci90eXBpbmdfZXh0ZW5z
aW9ucy5MSUNFTlNFO21kNT02NGZjMmIzMGI2N2QwYTg0MjNjMjUwZTAzODZlZDcyZiBcCi0gIGZp
bGU6Ly9zcmMvcGlwL192ZW5kb3IvdXJsbGliMy9MSUNFTlNFLnR4dDttZDU9YzI4MjNjYjk5NTQz
OWM5ODRmZDYyYTk3M2Q3OTgxNWMgXAotICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3dlYmVuY29k
aW5ncy9MSUNFTlNFO21kNT04MWZiMjRjZDc4MjNjY2UyM2I2OWY3MjE5OTNkY2U0ZCBcCi0iCitM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NjNlYzUyYmFmOTUxNjNi
NTk3MDA4YmI0NmRiNjgwMzAgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9f
dmVuZG9yL2NhY2hlY29udHJvbC9MSUNFTlNFLnR4dDttZDU9NjU3MjY5MjE0ODA3OWViYmJkODAw
YmU0YjlmMzZjNmQgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9y
L2NlcnRpZmkvTElDRU5TRTttZDU9M2MyYjc0MDQzNjljNTg3YzM1NTlhZmI2MDRmY2UyZjIgXAor
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL2NoYXJkZXQvTElDRU5T
RTttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAorICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL2NvbG9yYW1hL0xJQ0VOU0UudHh0O21kNT1iNDkz
NjQyOWE1NmE2NTJiODRjNWMwMTI4MGRjYWEyNiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvcGlwL192ZW5kb3IvZGlzdGxpYi9MSUNFTlNFLnR4dDttZDU9ZjZhMTE0MzBkNWNkNmUy
Y2QzODMyZWU5NGYyMmRkZmMgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9f
dmVuZG9yL2Rpc3Ryby9MSUNFTlNFO21kNT1kMjc5NGMwZGY1YjkwN2ZkYWNlMjM1YTYxOWQ4MDMx
NCBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvaWRuYS9MSUNF
TlNFLm1kO21kNT0yMzk2NjhhN2M2MDY2ZDllMGM1MzgyZTljOGM2YzBlMSBcCisgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvbXNncGFjay9DT1BZSU5HO21kNT1jZDk1
MjMxODFkOWQ0ZmJmN2ZmY2E1MmVhYTJhNTc1MSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvcGlwL192ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFhOTBi
MjA1YzkxNjc1NzhjZTkxIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3Zl
bmRvci9wYWNrYWdpbmcvTElDRU5TRS5BUEFDSEU7bWQ1PTJlZTQxMTEyYTQ0ZmU3MDE0ZGNlMzNl
MjY0NjhiYTkzIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9w
ZXA1MTcvTElDRU5TRTttZDU9YWFkNjljOTNmNjA1MDAzZTMzNDJiMTc0ZDliMDcwOGMgXAorICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3BrZ19yZXNvdXJjZXMvTElD
RU5TRTttZDU9OWEzMzg5N2YxYmNhMTE2MGQ3YWFkMzgzNTE1MmUxNTggXAorICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3BsYXRmb3JtZGlycy9MSUNFTlNFLnR4dDtt
ZDU9MjgyYzk3MGJiODQ0OTU0Yzg1MzVkZDZlOTczM2RiN2YgXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3B5Z21lbnRzL0xJQ0VOU0U7bWQ1PTM2YTEzYzkwNTE0
ZTI4OTlmMWViYTdmNDFjM2VlNTkyIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9w
aXAvX3ZlbmRvci9weXBhcnNpbmcvTElDRU5TRTttZDU9NjU3YTU2NjIzMzg4ODUxM2UxZjA3YmEx
M2UyZjQ3ZjEgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3Jl
cXVlc3RzL0xJQ0VOU0U7bWQ1PTM0NDAwYjY4MDcyZDcxMGZlY2QwYTI5NDBhMGQxNjU4IFwKKyAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9yZXNvbHZlbGliL0xJQ0VO
U0U7bWQ1PTc4ZTFjMDI0ODA1MWMzMmEzOGE3ZjgyMGMzMGJkN2E1IFwKKyAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9yaWNoL0xJQ0VOU0U7bWQ1PWI1ZjBiOTRmYmM5
NGY1YWQ5YWU0ZWZjZjhhNzc4MzAzIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9w
aXAvX3ZlbmRvci9zaXguTElDRU5TRTttZDU9NDNjZmM5ZTRhYzBlMzc3YWNmYjliNzZmNTZiODQx
NWQgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3RlbmFjaXR5
L0xJQ0VOU0U7bWQ1PTE3NTc5MjUxOGU0YWMwMTVhYjY2OTZkMTZjNGY2MDdlIFwKKyAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci90b21saS9MSUNFTlNFO21kNT1hYWFh
ZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvcGlwL192ZW5kb3IvdHlwaW5nX2V4dGVuc2lvbnMuTElDRU5TRTttZDU9ZjE2YjMyMzkx
Nzk5MmUwZjhhNmYwMDcxYmM5OTEzZTIgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3Jj
L3BpcC9fdmVuZG9yL3VybGxpYjMvTElDRU5TRS50eHQ7bWQ1PWMyODIzY2I5OTU0MzljOTg0ZmQ2
MmE5NzNkNzk4MTVjIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRv
ci93ZWJlbmNvZGluZ3MvTElDRU5TRTttZDU9ODFmYjI0Y2Q3ODIzY2NlMjNiNjlmNzIxOTkzZGNl
NGQgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ub19zaGViYW5nX21hbmdsaW5n
LnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2ZkMTkyOWRiMDUyZjA1NmQ3YTk5ODQz
OTE3NmQzMzMzZmExYjNmNmMxYWQ4ODFkZTE4ODVjMDcxNzYwOGE0YiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI4MTgyYWVjMjFkYWQ2YzBhNDlhMmEzZDEyMWE4N2NkNTI0Yjk1MGUwYjYwOTJiMTgx
NjI1ZjA3ZWJkZGU3NTMwIgogCiBkb19pbnN0YWxsOmFwcGVuZCgpIHsKICAgICBybSAtZiAke0R9
LyR7YmluZGlyfS9waXAKLS0gCjIuMzEuMQoK

--===============1180338764560810303==--


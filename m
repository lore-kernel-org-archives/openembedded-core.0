Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5F6C761AF
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30359.1675272856635694310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AQR9jQ+c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b215f-52e8e968-b720-4e39-acf7-8b89ea5db4a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0SnQOLY34vnknBQ5avicwvaA6oStT4s/cojLk3J+imw=;
	b=AQR9jQ+cyqJYM/J/LvB2LZZoiJQ3efYFYXHsFEI/TQXluD/k0fIyB7VUWIs1nheg
	GRtKBepi9fv6l0ycyjMfj5yi1fvZYnNVri2IrojmFJFxvuyEVSEy4l5vAsQY6hweUmo
	BJA6V2XX4rUFLK4L5qsGbJaz2pTcAdHQ9TqfgomM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0SnQOLY34vnknBQ5avicwvaA6oStT4s/cojLk3J+imw=;
	b=g3xeR6WHDqBhfkYGQnguZIL7kpPOJDuuxVEdv0QzksDUp8SiHSclWr1gN2jtr5U4
	9XXw2QP6FeQ+NQ60RXIRyhYtzPrQVjmAR3ucOee91fR8ZfN9AIdXvdAuZZtzahd2TzZ
	5K3Vmm/V1lQeel8E4hUdDMQlR67wFbnU4O5Qo3Cw=
Content-Type: multipart/mixed; boundary="===============4040914875933020837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 6.1.3 SUCCEEDED
Message-ID: <010101860e0b215f-52e8e968-b720-4e39-acf7-8b89ea5db4a1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176613

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *6.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-6.0.0-6.1.3.patch
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
--===============4040914875933020837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-6.0.0-6.1.3.patch"

RnJvbSBiOTY5ZDcxZThmZDgxZTI1Yjk3MGRjYWIwODRmZjY4NWZiMTdjN2Y5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzowMToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDYuMC4wIC0+IDYuMS4zCgotLS0KIC4uLnBoaW54XzYuMC4w
LmJiID0+IHB5dGhvbjMtc3BoaW54XzYuMS4zLmJifSB8IDI2ICsrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzYuMC4wLmJiID0+
IHB5dGhvbjMtc3BoaW54XzYuMS4zLmJifSAoNDklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNi4wLjAuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzYuMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
NDklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhp
bnhfNi4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbnhfNi4xLjMuYmIKaW5kZXggNWU1NjVlNzQ1ZC4uZDc3YWQwYTZmZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF82LjAuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzYuMS4zLmJi
CkBAIC0xLDEyICsxLDM0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysg
TElDRU5TRQorIyBAQCAtNCw3ICs0LDcgQEAKKyMgIFVubGVzcyBvdGhlcndpc2UgaW5kaWNhdGVk
LCBhbGwgY29kZSBpbiB0aGUgU3BoaW54IHByb2plY3QgaXMgbGljZW5jZWQgdW5kZXIgdGhlCisj
ICB0d28gY2xhdXNlIEJTRCBsaWNlbmNlIGJlbG93LgorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIw
MDctMjAyMiBieSB0aGUgU3BoaW54IHRlYW0gKHNlZSBBVVRIT1JTIGZpbGUpLgorIyArQ29weXJp
Z2h0IChjKSAyMDA3LTIwMjMgYnkgdGhlIFNwaGlueCB0ZWFtIChzZWUgQVVUSE9SUyBmaWxlKS4K
KyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2Ug
aW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAKKyMKKwogREVT
Q1JJUFRJT04gPSAiUHl0aG9uIGRvY3VtZW50YXRpb24gZ2VuZXJhdG9yIgogSE9NRVBBR0UgPSAi
aHR0cDovL3NwaGlueC1kb2Mub3JnLyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5T
RSA9ICJCU0QtMi1DbGF1c2UgJiBNSVQgJiBCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yMjE0YTg5MzE3NDQ4YzdmNzkyZjViNzVkZDY3MjZlNCIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA2NmRhNTFhYjczMjMxOWEw
NmJlYWU0ZjEwNzg4NTc3IgogCiBQWVBJX1BBQ0tBR0UgPSAiU3BoaW54IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNThjMTQwZWNkOWFhMGFiYmM4ZmY2ZGE0OGEyNjY2NDhlYWM5ZTViZmM4ZTQ5
NTc2ZWZkMjk3OWJmNDZmNTk2MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwZGFjM2I2OTg1Mzhm
ZmVmNDE3MTZjZjk3YmEyNmMxYzc3ODhkYmE3M2NlNmYxNTBjMWZmNWI0NzIwNzg2ZGQyIgogCiBp
bmhlcml0IHB5dGhvbl9mbGl0X2NvcmUgcHlwaQogCi0tIAoyLjM3LjMKCg==

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:120d6ff80ab9c883dc9b1e9883ee73cfe70e2886"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 11 Mirrors 0 Missed 67 Current 362 (14% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 375 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package_setscene)
NOTE: Running task 1138 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1180 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_fetch)
NOTE: Running task 1183 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1184 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1185 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_fetch)
NOTE: Running task 1186 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1187 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1188 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1189 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1190 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1191 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1192 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1194 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1195 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_fetch)
NOTE: Running task 1196 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_unpack)
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Started
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_unpack)
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_unpack)
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Started
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Started
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_patch)
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_patch)
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1507 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1514 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata)
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1515 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_patch)
NOTE: Running task 1516 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1519 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1520 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1521 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1523 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1524 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: Running task 1525 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1526 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1527 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1528 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_populate_lic)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Failed
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 1528 tasks of which 1450 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pytz/2022.7-r0/temp/log.do_packagedata.4173855
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata) failed with exit code '1'

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 37 recipes from the core2-32 sysroot...done.
Removing 61 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:120d6ff80ab9c883dc9b1e9883ee73cfe70e2886"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 264 Local 197 Mirrors 0 Missed 67 Current 190 (74% match, 85% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package_setscene)
NOTE: recipe python3-packaging-23.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 208 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 804 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 805 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 806 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_fetch)
NOTE: Running task 807 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 808 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_fetch)
NOTE: Running task 809 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_fetch)
NOTE: Running task 810 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 811 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 812 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 814 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 815 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 816 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 817 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 818 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 819 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 820 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: Running setscene task 295 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: Running task 908 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_unpack)
NOTE: Running task 909 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: Running task 910 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Started
NOTE: Running task 911 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: Running task 912 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 913 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_unpack)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 914 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 915 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 916 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 917 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_unpack)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 918 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 919 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 920 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 921 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 922 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: Running task 923 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 301 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 933 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 935 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 936 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 937 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 938 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: Running task 939 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 940 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Started
NOTE: Running task 941 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 942 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-cryptography-39.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 948 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: Running task 953 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: Running task 955 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 956 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 957 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 958 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 959 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 960 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Started
NOTE: Running task 962 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 963 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 964 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-39.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 965 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 312 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb:do_packagedata_setscene)
NOTE: Running task 976 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 977 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 978 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 979 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 980 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 981 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 329 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 1029 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 334 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_populate_lic unihash changed to 3f5b3de2bf4fb9f2e6c4a91948d183e216a4e9e499f7168faa86eb797141c682
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1401 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1429 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1454 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1456 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1457 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1458 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1459 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1460 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1461 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1462 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1566 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1580 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1583 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1585 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: Running task 1586 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_configure: Started
NOTE: Running task 1587 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Failed
NOTE: Running task 1588 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 1588 tasks of which 1497 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pytz/2022.7-r0/temp/log.do_packagedata.4184274
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata) failed with exit code '1'

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:120d6ff80ab9c883dc9b1e9883ee73cfe70e2886"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 11 Mirrors 0 Missed 67 Current 362 (14% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 375 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package_setscene)
NOTE: Running task 1138 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1180 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_fetch)
NOTE: Running task 1183 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1184 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1186 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1187 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1188 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1189 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1190 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_fetch)
NOTE: Running task 1191 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1192 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_fetch)
NOTE: Running task 1193 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1194 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1195 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1196 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_unpack)
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Started
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Started
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_unpack)
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_unpack)
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Started
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Started
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_patch)
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1503 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: Running task 1516 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata)
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1517 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_populate_lic)
NOTE: Running task 1519 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running task 1521 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1522 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1525 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1526 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1527 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1528 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1529 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1530 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1532 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1533 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1534 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 1534 tasks of which 1450 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pytz/2022.7-r0/temp/log.do_packagedata.4167986
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata) failed with exit code '1'

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-6.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-6.1.3.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15009682 to 14957001 (-0%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "6.0.0" to "6.1.3"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 6.0.0 [default] to 6.1.3 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.0.0.dist-info -> /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info, added "/usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/http_date.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/http_date.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/display.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/exceptions.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/exceptions.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/display.py"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.0.0.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info
  /usr/lib/python3.11/site-packages/sphinx/util/display.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/exceptions.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/http_date.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/display.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/exceptions.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/http_date.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was added
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was added

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1699 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:120d6ff80ab9c883dc9b1e9883ee73cfe70e2886"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 11 Mirrors 0 Missed 67 Current 362 (14% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 375 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package_setscene)
NOTE: Running task 1138 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1180 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_fetch)
NOTE: Running task 1183 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1184 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1185 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_fetch)
NOTE: Running task 1186 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1187 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1188 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1189 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1190 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_fetch)
NOTE: Running task 1191 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1192 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1193 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1195 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1196 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_unpack)
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Started
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Started
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_unpack)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_unpack)
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Started
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Started
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_patch)
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1508 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: Running task 1516 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 1517 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1519 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1520 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1521 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 1521 tasks of which 1450 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pytz/2022.7-r0/temp/log.do_packagedata.4166073
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata) failed with exit code '1'

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:120d6ff80ab9c883dc9b1e9883ee73cfe70e2886"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 11 Mirrors 0 Missed 67 Current 362 (14% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 375 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_package_setscene)
NOTE: Running task 1138 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1180 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_fetch)
NOTE: Running task 1183 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1184 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1186 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1187 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1188 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_fetch)
NOTE: Running task 1189 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_fetch)
NOTE: Running task 1190 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1191 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1192 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1193 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1194 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1195 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1196 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_unpack)
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Started
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_unpack)
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_unpack)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Started
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Started
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Started
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_patch)
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_patch)
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: Running task 1502 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1503 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2022.7-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1517 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1518 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1519 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_populate_lic)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1520 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Started
NOTE: Running task 1521 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Started
NOTE: Running task 1524 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1525 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1526 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1528 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1529 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1531 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_populate_lic unihash changed to 3f5b3de2bf4fb9f2e6c4a91948d183e216a4e9e499f7168faa86eb797141c682
NOTE: recipe python3-babel-2.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1532 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb:do_configure)
NOTE: Running task 1533 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1536 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-sphinx-6.1.3-r0: task do_configure: Started
NOTE: Running task 1537 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: recipe python3-pytz-2022.7-r0: task do_packagedata: Failed
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-6.1.3-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 1537 tasks of which 1450 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.7.1-r0 to 0:2022.7-r0) [version-going-backwards]
ERROR: python3-pytz-2022.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pytz/2022.7-r0/temp/log.do_packagedata.4170910
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.7.bb:do_packagedata) failed with exit code '1'

--===============4040914875933020837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.0.0.dist-info -> /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info, added "/usr/lib/python3.11/site-packages/sphinx/util/__pycache__/exceptions.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/util/display.py /usr/lib/python3.11/site-packages/sphinx/util/http_date.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/http_date.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/display.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/exceptions.py"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.0.0.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info
  /usr/lib/python3.11/site-packages/sphinx/util/display.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/exceptions.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/http_date.py was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/display.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/exceptions.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/http_date.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was added
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was added

--===============4040914875933020837==--


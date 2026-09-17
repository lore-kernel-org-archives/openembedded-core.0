Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCB3C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:16:13 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42147.1789658165847878324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x9S+Ycnr;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so12884825e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789658164; x=1790262964; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaqLtAz8BeigWMZLAN7oqcxjbOvB24pIhguJBEr9x6k=;
        b=x9S+Ycnr7WXvDe8c5zuqLJximIhApmRgaFrokyoNQHn59Ej9d0w/b9ziG1uRtHtz2N
         THWYJkDHivLkixeZdNarrkvcpiNHD+eKT+XUDAs2S7St/isXaj2X0nM8KnwvfsxqMc1l
         HJs6eWB7aTbyD1O9+9oeoDXJ39dPDAk6rpevM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658164; x=1790262964;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XaqLtAz8BeigWMZLAN7oqcxjbOvB24pIhguJBEr9x6k=;
        b=oQctPqvQydtpvKWVcrn5iIq8RCRXYYD/x37Z1vSmW6pIDEbCaDUBYDiv4zyJOEtfYH
         CqSbASGNGF2ICm+IYktmMaHWUhDYC8yIi365t4wGln5Aa8gDU1PpiKwv/I232iwun2SK
         kQkuVsAAzOvtTZjBPDtoIO+svasXPyGLENUWti1snk0WDuwGBnDm+kE0sRj1AC8+EUdL
         5GvGic/jYtrb3SlgqmkpcQiz16Qz5+mdI808ZWwapaMXQkaRL5QxxrApLcGw3Qt/9v59
         IVCNj72vPasCuN01ddxpFfOudAEzj3VtHSzJ0hqXeTopbSNFnzYRLqxyDlkDR4UxvOSw
         hv5g==
X-Gm-Message-State: AFuF++mVlbbMucfLye38OZUMy/y/4ZjWsuP6QT7dib9ZOZHgYdIvepFZ
	ff0a8pfgBv0thoeTPuixAdwt/LzVHsnSpe6coukz50zjrJitKKAA5ru0VKPQSXZwnytFAPs3irO
	5Aafd4Q8=
X-Gm-Gg: AYBFou2EIm/4+8w5J4ttjMF1LAChscBAlw8M5fwyijjYYeUbd+liNpIr1ICuM8XMDtU
	ZoDCgpWUgLyjS/T+m/fYSX5ZXGsnNZSd2Ix3ddY7RZFufFtuKtY4pu4REt4pZVEELEXrlRSi1Cx
	dPc3MHOHAeiT5PqXUyv3HvnsaW6+t521u/vXrmdyIB64P6rbq8vtAjMCFyCF3Bfj3jNrQRRHUgu
	SOnF+mgtCo7tAIWdJnsHvWzOnqq81IkQA5zYJlrisnSNq4rAG9CRfY+bowKHm6tBtk19wvasjZM
	+i/SUNSlpH5hKj+Bwpxofy1ZlWsDlAlXuEUkJdrOQ0f1kvpzuA1/kD+m1FU2SMxS9HhFpqgKGRu
	gZpL6k5w/VDRxOF3rHJCithGUVzoLpPdFUW3uPiIyAQQsydv4dMiFyepPPjhz6Cdz3NvnfH1uzT
	6EwqAPgBs5VCO8py0GwcTNq/zhZPAHUZAcW2avZx/eCPsVGA9+RMcE24Panm6yfsBy/6orfphH8
	14aOsSKuEmpCDyZMsE/eNYm/hTG+rM1w3oSI3iXIfIBbF/LZxVNsDJc+Yx1Bv4EP5AcGn0cvlI=
X-Received: by 2002:a05:600c:4f81:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49ec0539d94mr80687005e9.28.1789658163989;
        Thu, 17 Sep 2026 08:16:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232bd9sm82804565e9.5.2026.09.17.08.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:16:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap v2 00/12] Pull request (cover letter only)
Date: Thu, 17 Sep 2026 17:15:47 +0200
Message-ID: <cover.1789657495.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246074

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1789163914.git.yoann.congal@smile.fr/
Changes:
* Removed "go: Fix CVE-2026-33814"
  see https://lore.kernel.org/openembedded-core/7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev/T/#m64e0e8296e4df92ef5bb835bcc923df9a844a1c5
* Rebased "go: Fix CVE-2026-39823"

Passed a-full on autobuilder:
The previous version of the branch built:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4718
> * oe-selftest-fedora fails with 16415 – AB-INT: github infrastructure issues
>   I still need to backport fixes from master to wrynose, and then,
>   scarthgap.
> * qemuarm64-ptest failed with 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
>   retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4516
> Note: this build was not rebased on the latest build-appliance update.

For tests of this updated branch, I only built go, the CVE-2026-33814
fix is isolated from the CVE-2026-39823 fix, its removal should not
impact tests results.
But, I could start an a-full or a sub-build if deemed needed.

The following changes since commit bb166ac536daa43602ce8962cd3eb137783b8dc9:

  build-appliance-image: Update to scarthgap head revision (2026-09-11 14:32:15 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 04f18f976b3809e195433b6b31a6121014bdc37c:

  u-boot, u-boot-tools: Fix CVE-2026-46728 (2026-09-17 16:32:11 +0200)

----------------------------------------------------------------

Daniel Turull (1):
  libarchive: mark CVE-2026-14164 as fixed-version

Darsh Kelaiya (1):
  python3-lxml: fix CVE-2026-41066

Deepak Rathore (2):
  binutils: fix CVE-2026-3441 and CVE-2026-3442
  binutils: fix CVE-2026-4647

Devansh Patel (1):
  u-boot: share CVE_PRODUCT with u-boot-tools

Gyorgy Sarvari (1):
  python3-py: set CVE_PRODUCT

Hetvi Thakar (3):
  python3-pip: Fix CVE-2026-8643
  go: Fix CVE-2026-39823
  u-boot, u-boot-tools: Fix CVE-2026-46728

Peter Marko (1):
  openssl: upgrade 3.5.7 -> 3.5.8

Vijay Anusuri (1):
  p11-kit: Fix CVE-2026-18938

Yoann Congal (1):
  linux-yocto/6.6: update CVE exclusions (6.6.151)

 .../u-boot/files/CVE-2026-46728.patch         |  379 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |    2 +
 .../u-boot/u-boot-tools_2024.01.bb            |    2 +
 meta/recipes-bsp/u-boot/u-boot.inc            |    2 -
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |    1 +
 .../{openssl_3.5.7.bb => openssl_3.5.8.bb}    |    2 +-
 .../binutils/binutils-2.42.inc                |    2 +
 .../CVE-2026-3441_CVE-2026-3442.patch         |   51 +
 .../binutils/binutils/CVE-2026-4647.patch     |  228 +
 meta/recipes-devtools/go/go-1.22.12.inc       |    1 +
 .../go/go/CVE-2026-39823.patch                |  100 +
 .../python/python3-lxml/CVE-2026-41066.patch  |  262 +
 .../python/python3-lxml_5.0.2.bb              |    4 +-
 .../CVE-2026-8643-regression_p1.patch         |   34 +
 .../CVE-2026-8643-regression_p2.patch         |   69 +
 .../python/python3-pip/CVE-2026-8643.patch    |   79 +
 .../python/python3-pip_24.0.bb                |    3 +
 .../python/python3-py_1.11.0.bb               |    2 +
 .../libarchive/libarchive_3.7.9.bb            |    5 +
 .../linux/cve-exclusion_6.6.inc               | 4540 ++++++++++++++++-
 .../p11-kit/files/CVE-2026-18938.patch        |   52 +
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |    1 +
 22 files changed, 5742 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39823.patch
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-18938.patch



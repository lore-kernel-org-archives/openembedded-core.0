Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E638C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 15:52:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33864.1786981918991338983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 08:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Yw9t5XoC;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954df200ddso25138375e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786981917; x=1787586717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTSbq92OdVHpJqL6qPAmeOxItjWp9rico/U4fR8OQu8=;
        b=Yw9t5XoCRKNk06nv6vLX6XenNEybUVM/RsvyCeZA4hIKZUOpo7hABnS1Bw0TZyoJjw
         nTwd/s6/iVFBW8sKl5f6cZAsohTqxYYImE4gb+2hdJ/SOGB9/DCGVP15UweyQQB5IE7n
         vXoDqZSTPFX+RcdEV7WOeLhWO9c8gioX/FE5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981917; x=1787586717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTSbq92OdVHpJqL6qPAmeOxItjWp9rico/U4fR8OQu8=;
        b=DM/OViJAGQvZ26udTo6YCrRNBObUjyuPQOCl0rVoTOPMW0syI+b26aO0fA1th/1BbU
         bZ5XSGhyAwElXGeMXdKFwIpQB/4OSu9LcJPr7Fth3OidHZQGANW5WioQQwigDx1VrugT
         NEZ/VfaREX35AWTXManHwZIBmfawJL6j+CjmOJYMjQmbDXkTmQ3zRz5c7M2Kp9GCvitX
         vgYDV0ICul3/HVLtn+b4oTxuyJqPQpgLtmrtctHjyob3oOeAbk0wXRWPxIBZpudX0SO6
         gwhVEfUGkg/6n3ZcVbHw3G7jjUE88hVkVe3PSeHQnsmsjrL22ZsWDdVKhQWESnql0yC5
         vxxA==
X-Gm-Message-State: AOJu0YxUVaUANF+50Ze9xAZWxowGUmwYy1YYFVuv4A/E8juiFvMwi+1V
	40A4NmopxH7fEFQz7CCUhnzlrWXNrN/xGNi6Gz9RIeqyAyP27TWgrdGWaWao0Z4rQ9obJtyeBTU
	wbNTNMLM=
X-Gm-Gg: AR+sD11yQe5xksAbMRmv5rCVX63oh+7sD4qbK2/wG8qT7K3oXPmOnrTU/wv6KwMUcab
	J43YyyjVg4RprzR2ubYYyajcJhaQGxgPma+f3k9NEIae9hUF2g/SaWNtHpVV4jzVJV9ymK/JQ/h
	vVnbb/byr9twnSj/2AaCCnVN0I0NhRnRTgmMawaFv95M3UI/U/c/Yup3u5TgsD8FyX+HNMgFBh0
	IIX9J+/1FO4xKfuJaNSMSyKx3iBmXeN2UCSAUbmprDD+BuAyWw4jbvegzPDdwEJqSlqIPq+lQ/p
	LTgFyaAd9oSYYnMqnVTodJ7RR42DZd+/q26uFKsaQFPqy6tC13MnBccFu0vxekw6xxjpNHEPPPQ
	/dLAqoMdTQn4XI1cHSDGGmMJS1oUM0ElXKKJQBEPGwIkqclJkW0lpDj6W9+On49UWgPT6BqMOcR
	CRQ3/RUKbR0voluMN/mgng9fi7jtEe3KyEWaPhsDiD5JVeEGdRBj3XU5ao+DFxXdY8uVM2Kp8Nh
	s1lTwfngw7rYqjObA/0Ix7VfqN3CksjqrxLefDxiTmHZBrfIz4ipONC
X-Received: by 2002:a05:600c:a45:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-49987990f37mr380233475e9.16.1786981917169;
        Mon, 17 Aug 2026 08:51:57 -0700 (PDT)
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b3a6ddsm3976165e9.1.2026.08.17.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:51:56 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/15] Pull request (cover letter only)
Date: Mon, 17 Aug 2026 17:51:41 +0200
Message-ID: <cover.1786981174.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 15:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243627

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1786633048.git.fabien.thomas@smile.fr/T/#t
From this series, two patches where removed:
* glibc: CVE-2026-5358 add CVE_STATUS
  see : https://lore.kernel.org/openembedded-core/bc68aa3b2ccc7def8130e240e82c9d4977a12121.camel@pbarker.dev/
* libarchive: fix CVE-2026-14164
  see : https://lore.kernel.org/openembedded-core/1d72f768ffe412a45227e6f38d5fc485a86d811b.camel@pbarker.dev/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4490

The following changes since commit f09a0f28aeb54ddd90415dd458338e1565bb5a49:

  build-appliance-image: Update to wrynose head revisions (2026-07-30 13:29:32 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 3b859a1f3eb0c7eace3f66bbbba845cba0c20133:

  oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED (2026-08-17 17:03:49 +0200)

----------------------------------------------------------------

Adrian Freihofer (1):
  oe-selftest: fitimage: Do not expect kernel property in DTBO config
    subnodes

Himanshu Jadon (1):
  python3-pip: set CVE_PRODUCT

Jaipaul Cheernam (1):
  bind: upgrade 9.20.23 -> 9.20.26

Marek Vasut (2):
  kernel-fit-image.bbclass: Do not include kernel property in DTBO
    config subnodes
  kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"

Peter Marko (1):
  gstreamer1.0: set status for CVE-2026-5056

Ryan Eatmon (2):
  kernel-fit-image: Add KERNEL_DTBVENDORED support for
    FIT_CONF_DEFAULT_DTB
  oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED

Wes Malone (1):
  cpan_build: disable .packlist and html doc

Yoann Congal (1):
  selftest: uboot: remove duplicated KVM presence test

mark.yang (5):
  python3-pyopenssl: set CVE_PRODUCT
  python3-pyyaml: set CVE_PRODUCT
  python3-xmltodict: set CVE_PRODUCT
  python3-certifi: set CVE_PRODUCT
  python3-idna: set CVE_PRODUCT

 meta/classes-recipe/cpan_build.bbclass        |  7 +++
 meta/classes-recipe/kernel-fit-image.bbclass  | 22 ++++++-
 meta/lib/oe/fitimage.py                       |  7 ++-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 59 ++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/uboot.py         |  6 +-
 ...1-avoid-start-failure-with-bind-user.patch |  2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...d-V-and-start-log-hide-build-options.patch |  4 +-
 ...ching-for-json-headers-searches-sysr.patch |  6 +-
 .../recipes-connectivity/bind/bind/conf.patch |  2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |  2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |  2 +-
 .../bind/{bind_9.20.23.bb => bind_9.20.26.bb} |  2 +-
 .../perl/libmodule-build-perl_0.4234.bb       |  2 -
 .../python/python3-certifi_2026.2.25.bb       |  2 +
 .../python/python3-idna_3.11.bb               |  2 +
 .../python/python3-pip_26.0.1.bb              |  2 +
 .../python/python3-pyopenssl_26.0.0.bb        |  2 +
 .../python/python3-pyyaml_6.0.3.bb            |  2 +
 .../python/python3-xmltodict_1.0.4.bb         |  2 +
 .../gstreamer/gstreamer1.0_1.28.2.bb          |  2 +
 21 files changed, 116 insertions(+), 23 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.23.bb => bind_9.20.26.bb} (97%)



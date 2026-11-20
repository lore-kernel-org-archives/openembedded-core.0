Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2729.1795167313733976774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=hYRaEdQp;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so4609615e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 01:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795167312; x=1795772112; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEM+aSz7TyPfwZO+9peiIme4Vtb/pSPjok2jkaBu24o=;
        b=hYRaEdQp7B+clmWe4g8/Yt2ehcLjjh4CMpUeXtxrn1Xr4Ad3oJ7DYLKUku0xJMGPRm
         aO4nO4uk146a83UQJkum+XM+83VGWMelZ0wP6dSfExshnZUeotdq6b/7TuX0RUlenA6Y
         nSNY21Jem9Npj1MTIFqljsTopkXfly/dRY9NVG3sc+01j3Oxyvl6oT2Rm9zkuGks/A+b
         F0BZ0FM+itKWEMbKb2kUWY9UNRYAXDx57xlm5mm6pNG+bZ6aX7FC9jcz/4ERyfUD7FNC
         8xFv65If5T3UufB9GVQiszGfmu3pf2oyiGLuTXVEsQrgq2HhXSsS/JwhC3PBjHdUZmg+
         8KxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167312; x=1795772112;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEM+aSz7TyPfwZO+9peiIme4Vtb/pSPjok2jkaBu24o=;
        b=IwGqKJEqvCg/CHQnaH0+k0PnAx+wWwqJ1awXJ3+kLg1HhaAkuJUUcF1PWrr0ipXcvw
         zu0U7Mna9J6pEgXCP+B2kTQjGRB9ZoHi4NAVBA/J3LJIM0F8xZ9IFAacVRSung620fIb
         ln6g2V5R+XAwVKR5wIXaVmjg/RsDCEM4bsLmcEG++lTZ6zdVLjhYYnLvcWI3cFWbk+Cn
         GuQi75bMs1J5sq+Qw2VpF5n/eY+eih8/7/RnCgCh/sN6PggkrQrt7KRr3V1XJAF+nRTX
         feUUesmLZxOCSfNJX8xauSsNfJM7dmauIt3oictynL/4MVjrM5Te2QYBUxRxRTtyPr9q
         lh0Q==
X-Gm-Message-State: APuU4Z9XBLA6SbTz+Iz+YrJwMHpzDSJckPDf9ow34xlDhJjG3FNyrPr8
	bi/vLEB3ypFdk44mHjpKYwfUCS4SwlHGeXxgm0ZlgvGtyWQqACXzZZJtUNNrINf3+95qSHxCL3A
	yPAOwIkM=
X-Gm-Gg: AYBFou3xtmY9CMNUIV3Es8zSPHDLmZws5you/e2IHeV6XsLHxhV61H4eJ/d2lhf0UfC
	OgccIOE4gscWrw9ojOY1CB8p6pAkstAQW6x1ZyS2k74hCVI/DGWsRCtmLmN4ojJdERh4DUZZ822
	4EqcK1sDUnAd428DTSUTEhRCqN6OwbJ9DxvhW1J3LnJedt4QQc0vZ8o/xGERWIcsNKpnkGYTOBC
	KLB+oB93xzCJ1zKU3U6HwZhoUyMRAUPfO22nefoo2znnofcaZFRyNPr8cppMVodzROMt41K5YpR
	3FBkQbgECL5ByfxVvuS3AFNYMVqaCUhHbrI9FtBao/T7h1N+SOfKJM7OlQBRHIn0dvA3YZiZ6/S
	pDVOqza0dyFIvpqz8+QY5oid941PsMS8GDDDP1yxJwFRyW8KmRF4/pV8mjmpn1aJ1vAi+1nPrVh
	hDAJ3UK0KKHeieuM15Zod3jpdhUz/k7unpOg79wjY+/RkBTxfjFQIWjF9hL0HOxlhR+OsjNtBx8
	j4YpT4Uj5MPIeRtSzBOSrF3D97SQVmhOycKHiTdlo3IpMrzID66rlXeY5Z+LckP3k4JUCtvTukC
	LFqNsq7uoB/vTvN18jwKkORjsMkTwZaRkHnFn3XMbuAsrGcyO28aKgi2MHaK2oECf0ysRsoDe09
	jP9/qU4spCFXVUrSmkQ/SHDK/aTRK
X-Received: by 2002:a05:600c:820c:b0:4bb:6a2d:b426 with SMTP id 5b1f17b1804b1-4bb887c281dmr51095045e9.1.1795167311734;
        Fri, 20 Nov 2026 01:35:11 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm116120975e9.11.2026.11.20.01.35.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:35:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/17] Pull request (cover letter only)
Date: Fri, 20 Nov 2026 10:34:52 +0100
Message-ID: <cover.1795167241.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250755
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1794939400.git.yoann.congal@smile.fr/

Highlighted patches: this series upgrades rsync 3.4.1 -> 3.5.1: This is
an exception to the stable rules to handle the otherwise very difficult
to patch CVEs.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5137

The following changes since commit 33a6bd6cc8a9a976902081642414bd67adc74879:

  populate_sdk_ext: Fix locale error handling in SDK (2026-11-11 00:22:27 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to dcc87a051b64f2643b94bdb1a703aa50e8dccb26:

  perl: upgrade 5.42.0 -> 5.42.3 (2026-11-17 11:03:28 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (3):
  curl: fix CVE-2026-87864
  curl: fix CVE-2026-92388
  curl: fix CVE-2026-92389

Ashishkumar Parmar (1):
  bluez5: fix CVE-2026-19774

Darsh Kelaiya (4):
  curl: fix CVE-2026-82208
  curl: fix CVE-2026-86409
  curl: set CVE_STATUS for CVE-2026-19931
  curl: fix CVE-2026-18924

Jaipaul Cheernam (4):
  rsync: upgrade 3.4.4 -> 3.5.0
  rsync: upgrade 3.5.0 -> 3.5.1
  perl-cross: add patches for perl-5.42.3
  perl: upgrade 5.42.0 -> 5.42.3

KAZUYOSHI AKIYAMA (秋山 和慶) (1):
  spdx30_tasks: Fix duplicated revision in Git PURLs

Richard Purdie (2):
  rsync: upgrade 3.4.1 -> 3.4.2
  rsync: upgrade 3.4.2 -> 3.4.4

Shuai Zhang (1):
  bluez5: Abort continuing response on fragmented CT replies

Yoann Congal (1):
  pseudo: Upgrade 1.9.11 -> 1.9.12+git

 meta/lib/oe/spdx30_tasks.py                   |   7 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   3 +
 ...inuing-response-on-fragmented-CT-rep.patch |  62 ++++++++
 .../bluez5/bluez5/CVE-2026-19774_p1.patch     |  63 ++++++++
 .../bluez5/bluez5/CVE-2026-19774_p2.patch     |  62 ++++++++
 ...rl-cross-add-patches-for-perl-5.42.3.patch | 114 ++++++++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   1 +
 .../perl/files/CVE-2026-13221.patch           |  75 ---------
 .../perl/files/CVE-2026-42496.patch           |  99 ------------
 .../perl/files/CVE-2026-57432-01.patch        |  52 -------
 .../perl/files/CVE-2026-57432-02.patch        |  34 -----
 .../perl/files/CVE-2026-57433.patch           |  32 ----
 .../perl/files/CVE-2026-8376-01.patch         |  62 --------
 .../perl/files/CVE-2026-8376-02.patch         |  49 ------
 .../perl/{perl_5.42.0.bb => perl_5.42.3.bb}   |   9 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
 ...-prototypes-to-function-declarations.patch |  78 ++--------
 .../rsync/files/CVE-2025-10158.patch          |  36 -----
 .../rsync/files/determism.patch               |   6 +-
 .../rsync/files/makefile-no-rebuild.patch     |   6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb}  |   4 +-
 .../curl/curl/CVE-2026-18924.patch            |  57 +++++++
 .../curl/curl/CVE-2026-82208.patch            |  54 +++++++
 .../curl/curl/CVE-2026-86409.patch            |  88 +++++++++++
 .../curl/curl/CVE-2026-87864.patch            |  52 +++++++
 .../curl/curl/CVE-2026-92388-1.patch          | 142 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 ++++
 .../curl/curl/CVE-2026-92389.patch            |  53 +++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   8 +
 29 files changed, 822 insertions(+), 523 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-for-perl-5.42.3.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.42.3.bb} (98%)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb} (95%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch


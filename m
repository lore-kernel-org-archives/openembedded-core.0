Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1628.1794529992079169613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 16:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vSQexCFa;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb2893531bso386794a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 16:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529991; x=1795134791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFkR9XDgicspifufqPvEguBNEkIzzO1lcBskAkvKu+A=;
        b=vSQexCFaaKcJ1Yh3+GjDtHwpvJBVpWu8kqFp4EI6pyc/aDVMgDXdX7pEPOSN6uEvhm
         j6sqflgcsQtqmxBhKKRj+A6zu1WNxnqclkj+Ecb+ZlNdpmeBYSUqpP3wSUXq+a8sPnsl
         ec3aV//xtw7ltkIh7dmtcXxHpDceNnXj8fd9dAGyyou/SBUpJsiv78g+qnRKErPQnec7
         6RrCNOvjAxFkKiyxBVS+a/G6xQduGpd16BwISJ4GWSgaazmZgae+OXQDEKbVR4Re20p4
         UVy0kUt04Q1XvVqtRM8s3M6VdKzAP4gP+DgRzNsn7KkIZwywjk6dH9oXKxv/HRs7DwI3
         72hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529991; x=1795134791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFkR9XDgicspifufqPvEguBNEkIzzO1lcBskAkvKu+A=;
        b=VMFp4ObE/8To1CGjMw+uEuTAQSTnMPHAji9KMYUNcbwGfY+4ODxrcFDatAYQ2AcB14
         knJuKga6o6W05s3Y/i7xQC8RACvuyxw6eOapoDJsH7Aq84KBauOqN/5tR/6g9KTBBMBf
         kiOyTn1fr6BOJOa1Sx4M89gplI6zn7qWm67HOWp++mzR/MBEBxSd8czGXhy2NAFq1FmY
         OjgfNgKCkAyLt4MMQ8YSR7j2Wvr1Ca9x5LhSwuYPGN+2aaUEn0hrXIe3syQLQM+FNjE3
         yEIrSrZ4uSF9pFp80MJY7fImohAUhxGZuc6RblmPNTzYaHOAOUdeuUzdDT6lMapUBGSV
         ps6A==
X-Gm-Message-State: APuU4Z8FKL2EyGqhPn0kxjb7cxBCcW4yyTCP4/VILEGtkGrKnVC6FGBZ
	fkHqbuQh8tzpZHb7NqeELrdC7RC9/MU1pRKRADD4C6a7t4/adlywOPHUajTmufPc
X-Gm-Gg: AYBFou1izJMehK6J6gDupHgNBv25VTRiLi+9EVLmCOWuuwltowfmYwREEFu5aLc1OW+
	GF5a/GgCRj7669Meh3YyyQLINbHlMiySGlFjzf3eDAFWPpI8GnYs9+3NgItjwRoxaBjuiJTe8xO
	qUxE2PAldA6R1rhVp9Cyy22t/d2alSvbQ0J1yThwfYbauHJJPt4ZXAYAqz0FnjwLoD3/qE4VHFP
	fJWKetKtPqDGvCQKk3m9QimQDBTbFGPq0Mgi7VeLMN+qLLUi/isi45iLP5aRZBBdm1tpfaeZl86
	r2wHL/feJrxx9OPCAeHQULHc7cdbS17EUPtTlsKVmutzBoA2Qx4RufOxSPSnp9LtKPPwOYcu3W8
	FRA7iVDXM4mofAXDkrrz5c/0qoxcBHwJIYXQaxJBaOb04LHEr+1QP3iQkbvjP0k91KHvt6hqqFD
	LQ6PRcMrE8rF9vTai/mta/nS4ApRZ1L+NWoVJR2aSneNoY8usg2j6cjZlq9I1+zegnwQ3yBiUL7
	eJpTEatQUVHEMKBHmZn9bKsTcf1gRsLZN38cSk2Z7y0OYyEi8hUvl6nIVx0oi9XRJqYKelCGZCS
	d1e6WuJ8MqxjoVBxKiY4aEWr/KOiCB0thzPTpAN5Z13IZK4WKL/lndOuouNNAK+J6mftvxNPkEP
	w4A==
X-Received: by 2002:a05:6a20:4391:b0:3e2:a0b7:9af2 with SMTP id adf61e73a8af0-3f7a7fc6d8amr711504637.65.1794529991260;
        Thu, 12 Nov 2026 16:33:11 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm388932a12.8.2026.11.12.16.33.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 16:33:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 0/5] perl: upgrade libxml-parser-perl and libtimedate-perl
Date: Thu, 12 Nov 2026 16:32:57 -0800
Message-ID: <20261113003302.20809-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 00:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250132
Content-Type: text/plain; charset="utf-8"

Neither upgrade was picked up by AUH, because both recipes fetched from
CPAN directories that stopped receiving releases: TimeDate is now
released by a different CPAN author, and www.cpan.org/modules/by-module/
no longer lists new XML-Parser versions. Both now fetch from the current
author's directory.

Since 2.48, XML::Parser installs its encoding maps with
File::ShareDir::Install and finds them at runtime with File::ShareDir,
which needs Class::Inspector. The first three patches add those modules,
with ptest, and the XML-Parser upgrade drops the CVE-2006-10003 backport,
which 2.48 includes, and sets CVE_PRODUCT to the CPE that NVD uses.

Tested by building all five recipes for target and native, the four
that support it for nativesdk, and intltool-native, and by running
their ptests on qemux86-64.

Tim Orling (5):
  libclass-inspector-perl: add recipe for 1.36
  libfile-sharedir-install-perl: add recipe for 0.14
  libfile-sharedir-perl: add recipe for 1.118
  libxml-parser-perl: upgrade 2.47 -> 2.59
  libtimedate-perl: upgrade 2.30 -> 2.35

 meta/conf/distro/include/maintainers.inc      |  3 +
 .../distro/include/ptest-packagelists.inc     |  3 +
 .../perl/libclass-inspector-perl_1.36.bb      | 36 +++++++++
 .../libfile-sharedir-install-perl_0.14.bb     | 35 +++++++++
 .../perl/libfile-sharedir-perl_1.118.bb       | 41 ++++++++++
 ...ile.PL-make-check_lib-cross-friendly.patch |  4 +-
 .../libxml-parser-perl/CVE-2006-10003.patch   | 75 -------------------
 ...erl_2.47.bb => libxml-parser-perl_2.59.bb} | 43 ++++++++---
 ...-perl_2.30.bb => libtimedate-perl_2.35.bb} | 31 ++++++--
 9 files changed, 176 insertions(+), 95 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/libclass-inspector-perl_1.36.bb
 create mode 100644 meta/recipes-devtools/perl/libfile-sharedir-install-perl_0.14.bb
 create mode 100644 meta/recipes-devtools/perl/libfile-sharedir-perl_1.118.bb
 delete mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.47.bb => libxml-parser-perl_2.59.bb} (43%)
 rename meta/recipes-extended/perl/{libtimedate-perl_2.30.bb => libtimedate-perl_2.35.bb} (31%)

-- 
2.56.0


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AB7C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:31 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.5562.1752029490143194757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pbjxMCS4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2350fc2591dso5094815ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029489; x=1752634289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5aPZyTvxxGguo/GcCz22AqbXuOkSwvBXque9Wyl0KGc=;
        b=pbjxMCS48X9OCvtZmJmbidvGu1BKmXlzrOOx+kSZV0YqluOwyOHMVWl5icFnBXwarz
         T6/ZGGzFTCML8Cqd/ECK/hJmpMPTlxARHjFkfaBlev8xB1cgZ6PvdiAmSTTTALIYlvO9
         XCNQam92Q7KKAoha4djKNqusXbbHRIK50YAKsU7uy/4U8r8nw2frlm6ei1Xm/0U8fniV
         1h25jbAofRepiC5sNzWRVa0Q4VPQBJ0vTl9WNqyHoMpp8/qnOEM3CcfMAYg3wkSiIQm5
         dWloJ6SXhXqg8g9JB42PWTgB1iDnr0HUxEe8IuNGXBP33bS5mi4KMUmlxDvbWWiCwRJI
         QbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029489; x=1752634289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aPZyTvxxGguo/GcCz22AqbXuOkSwvBXque9Wyl0KGc=;
        b=tjO0Ah1xm/v1WZP1fPMrwGqyk4/rIiVB9w80FDwLm8YUFETafYrrO36+nKoxRdNccc
         i5S66EGL0EFgbyde8HDTDlcsGBOP2qP7zzKZ1EcKVVvWw9boV3TnUoEDnuNXAae1PC82
         a3cpzbmF1KxmfnQOlMcV+3iyE9DiuhptiN7yFBoS32rkVFPy/f1mbXArnhzIkh7qU05a
         UATPnjGgdNU91XPNO0m9m7Hm0b7iIvMYSmKLBjod6ZbyxLPzFvK54cpBmliSPDOgZTdk
         ENJBcRvLPcuz+KYVEvBPJ8MUAlzqDy/EuJuIAPzrL9++M7DwIHi0iPAQtPn6WDeH6UZl
         LHiw==
X-Gm-Message-State: AOJu0YyTyCLys0BdY1xZr0mjczNa2yloAdB+M9jbvSsSofv3vSar5q+J
	tDFYF4OVEHGSnkxVfJAgUVtDsPCQUQi7w9UAZlmn/ndkUJ9cKkgd+uVitUT2u+Q+cYgsXrhwxl3
	DER05
X-Gm-Gg: ASbGnctVnJmR4DkKk0SazsjFk1ts7dUXtHjvkUMDGrkC0SLHDGi0HBhUDqQu7dfM2cd
	2kh/iBynRSSSUs+OpVFeVSM0m2N70mkOt9ZhsCj8zyPgiFstf4g9qGoWfZwngl2DPh72lStT+L3
	E4Gv7GdvnZdE8L6gv/Fx+eqbiyDq+PCkJmVyPtl/ncyet19yhZSb7E/Tn1NaC1Sbiew4Z8HTXCv
	vRzve5aMLnHK/+9O61aMnmlWZ/sCjn/G4dAfQv0yuK4gbfUQ0xjdZLI/wh32N+DAErmCmmpC3Bs
	faMkFgkte6B+Ab6YELWGQV5GifQjD7Di/Cjb7eRIIAiu49287QNhDQ==
X-Google-Smtp-Source: AGHT+IEvpy1W6c7BfU5DXsMNqNJbWTISEjhK1fdAKk8AWO5uK4OnsPqddFR8DnUuvfaemNZt0DmwPw==
X-Received: by 2002:a17:902:f68f:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-23ddb553756mr10605125ad.1.1752029488928;
        Tue, 08 Jul 2025 19:51:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Tue,  8 Jul 2025 19:51:11 -0700
Message-ID: <cover.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220057

Please review this set of changes for scarthgap and have comments back by
end of day Tursday, July 10

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1980

The following changes since commit 15881f41f8c00c5f0a68628c2d49ca1aa1999c2e:

  xwayland: fix CVE-2025-49180 (2025-07-03 09:04:44 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.93
  linux-yocto/6.6: update to v6.6.94
  linux-yocto/6.6: update to v6.6.96

Changqing Li (4):
  icu: fix CVE-2025-5222
  libsoup-2.4: refresh CVE-2025-4969.patch
  libsoup-2.4: fix CVE-2025-4945
  libsoup: fix CVE-2025-4945

Guocai He (1):
  minicom: correct the SRC_URI

Hitendra Prajapati (1):
  libxml2: fix CVE-2025-6021

Vijay Anusuri (1):
  sudo: Fix CVE-2025-32462

Virendra Thakur (1):
  curl: set conditional CVE_STATUS for CVE-2025-5025

Yogita Urade (1):
  python3-urllib3: fix CVE-2025-50181

 .../libxml/libxml2/CVE-2025-6021.patch        |  56 ++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 .../python3-urllib3/CVE-2025-50181.patch      | 283 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   4 +
 meta/recipes-extended/minicom/minicom_2.9.bb  |   2 +-
 .../sudo/files/CVE-2025-32462.patch           |  42 +++
 meta/recipes-extended/sudo/sudo_1.9.15p5.bb   |   1 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 .../icu/icu/CVE-2025-5222.patch               | 166 ++++++++++
 meta/recipes-support/icu/icu_74-2.bb          |   1 +
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 ++++++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  54 +---
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 .../libsoup/libsoup-3.4.4/CVE-2025-4945.patch | 118 ++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 18 files changed, 826 insertions(+), 63 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2025-32462.patch
 create mode 100644 meta/recipes-support/icu/icu/CVE-2025-5222.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4945.patch

-- 
2.43.0



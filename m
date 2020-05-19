Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13122.1589899879433492135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I52qSEWD;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id n18so21264pfa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=OWryQrE9CYdi1zQw25CnrfDIL1asGmOgWA/h8icIrFg=;
        b=I52qSEWDk93PjwTgn2ZxWWx4VqQId16qvy+8LPlSSfdrywn6bMI/4Zpg9w0r46aGRS
         m/Ukvh44DoEaqMqICLeqTEdgzJgAYZSJLrBtk027PHu5QKzoIv0mGx1lUQMrudAE/Ay+
         5gCCHFvkw9NU9mC2QgSGp+J0Ycxbg1bowCg1K1aFWLUdziNDn+R08Txxl7SM76nkhlCZ
         6ZBhhHl5bxagketyW/wCbXm5CLxxsOvV0cbzldQ/vggjpYxGQNAHdkEkltiX0LB26wcv
         ItRHXMv4//bY3BKylWJIrBA7URDLPy1OtunCq3hlgmYGqTdOZ4O7gogXVLgHFL51Aw39
         3nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=OWryQrE9CYdi1zQw25CnrfDIL1asGmOgWA/h8icIrFg=;
        b=IjOruJjdM3CB2M+vHbnlTm2jxTiw6ybNPIYDqtaigGJqchpSv/S2XDda7+8zwl8ESu
         MV8iStLukxzYcJWHjXtcaq7E3HjHK2B+DPCYepTf7d2B8yxKYpfc4+H5F5yPNPSIXjOp
         Jo3uiFMxqqpR0yIwv2qvpQipUMsrEfnPThGyFvg1mPVdxZM/RIp6DKIcjXroQ+eqqftf
         1goVH8dKR9kbMjRKg8rOySN2tU4mEo8gdLseMOINmc2X/6Nbl8sK5xmvxlEPJbb5waLU
         lE+eQdgRZT9XMPD4jWCPC2JkSyf1cDw+XhD+scWPD4FaZ5kD1cTkgQ0vRqVb9dApNGUk
         2VTg==
X-Gm-Message-State: AOAM533f6/dvw6bzhILnOSvAf5NkkPd+/Kb3o0csL72picAtTcxfpNLp
	/CzaUVkXknwzQ9zEl2fBIPPs+nSx
X-Google-Smtp-Source: ABdhPJw9mT/HBcXCXxe9dIw5SFXz9oewUfd1YNZhsG+vAdfQXzEggdH/DEp3kYDVPsJqfqXbfL7oew==
X-Received: by 2002:a63:2ec3:: with SMTP id u186mr12890054pgu.194.1589899878632;
        Tue, 19 May 2020 07:51:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 0/8] Patch review
Date: Tue, 19 May 2020 07:51:07 -0700
Message-Id: <cover.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Here are the next set of changes for warrior last dot release.

Please have comments back by Friday.

The following changes since commit ae341aed81be28232cc34daf4684bc0922f17699:

  yocto-uninative.inc: version 2.8 updates glibc to 2.31 (2020-03-26 07:04:11 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/warrior-nut
  http://cgit.openembedded.org//log/?h=stable/warrior-nut

Adrian Bunk (3):
  git: Upgrade 2.20.1 -> 2.20.4
  python: Upgrade 2.7.17 -> 2.17.18
  openssl: Upgrade 1.1.1d -> 1.1.1e

Alexander Kanavin (1):
  openssl: update to 1.1.1f

Denys Dmytriyenko (1):
  openssl: recommend cryptodev-module for corresponding PACKAGECONFIG

Jan Luebbe (1):
  openssl: upgrade 1.1.1f -> 1.1.1g

Lee Chee Yang (1):
  cve-check: CPE version '-' as all version

Richard Purdie (1):
  openssl: Fix reproducibility issue

 meta/classes/cve-check.bbclass                |   2 +-
 .../openssl/openssl/CVE-2019-1551.patch       | 758 ------------------
 .../openssl/openssl/reproducible.patch        |  32 +
 .../{openssl_1.1.1d.bb => openssl_1.1.1g.bb}  |   7 +-
 .../recipes-core/meta/cve-update-db-native.bb |   2 +-
 meta/recipes-devtools/git/git_2.20.1.bb       |  11 -
 meta/recipes-devtools/git/git_2.20.4.bb       |  11 +
 ...tive_2.7.17.bb => python-native_2.7.18.bb} |   0
 meta/recipes-devtools/python/python.inc       |   6 +-
 .../{python_2.7.17.bb => python_2.7.18.bb}    |   0
 10 files changed, 51 insertions(+), 778 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1551.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1d.bb => openssl_1.1.1g.bb} (97%)
 delete mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.20.4.bb
 rename meta/recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 rename meta/recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)

-- 
2.17.1


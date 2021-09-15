Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.3125.1631679603235483531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 21:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18F4Jsmu016085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 21:19:54 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 21:19:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 14 Sep 2021 21:19:52 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 21:19:52 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <qi.chen@windriver.com>
Subject: Review request 0/1: python3-awscrt: Fix build with usrmerge [LIN1021-1466]
Date: Tue, 14 Sep 2021 21:19:51 -0700
Message-ID: <20210915041952.123945-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Summary: python3-awscrt: Fix build with usrmerge
Tech Review: Qi
Gatekeeper: Hongxu
Lockdown Approval (if needed): 
Branch Tag: WRLINUX_10_21_LTS

IP Statement (form link or license statement, usually automated):
Crypto URL(s) (if needed): see https://jive.windriver.com/docs/DOC-80428
Parent Template (where applicable):


====== Sanity Issues: (DO NOT EDIT this section) ======



====== Impacted area             Impact y/n ======
docs/tech-pubs                      n
tests                               n
build system                        n
host dependencies                   n
RPM/packaging                       n
toolchain                           n
kernel code                         n
user code                           n
configuration files                 n
target configuration                n
Applicable to Yocto/upstream        n
New Kernel Warnings                 n
Other                               n


====== Comments (indicate scope for each "y" above) ======
* Conditions of submission

* Documentation Changes/Release Notes
  = Doc changes

  = Release notes

* Git logs
[meta-iot-cloud]
commit 2990cda923526dd2745f7ef576f7b11d1ea3156b
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Mon Aug 23 04:08:23 2021 -0700

    python3-awscrt: Fix build with usrmerge
    
    Issue: LIN1021-1466
    
    Fixed:
    DISTRO_FEATURES_append = ' usrmerge'
    $ bitbake python3-awscrt
    
    CMake Error at CMakeLists.txt:191 (add_library):
      Target "s2n" links to target "LibCrypto::Crypto" but the target was not
      found.  Perhaps a find_package() call is missing for an IMPORTED target, or
      an ALIAS target is missing?
    
    (LOCAL REV: NOT UPSTREAM) - Send to upstream on 20210914
    
    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>



====== Testing ======
* Commands
WRTEMPLATE = "feature/usrmerge feature/aws"
$ bitbake python3-awscrt

* Expected Results
Works well

* Applicable to

* Tested configurations

  Arch    built      boot     boardname
  -------------------------------------
  MIPS      n         n
  MIPS64    n         n
  MIPS64n32 n         n
  ARM32     n         n
  ARM64     n         n
  x86       n         n
  x86_64    n         n
  PPC       n         n
  PPC64     n         n
  SPARC64   n         n


====== Reviewer Checklist ======
[Submitters: make sure that your review doesn't trigger any checkmarks!]
http://lxgit.wrs.com/cgit/bin.git/tree/etc/review.txt


====== PULLs ======
* PULLs


* WRH-PULLs ("wrh -m" can merge it):


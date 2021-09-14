Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web09.548.1631662685648746450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OpHWqonx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631662684; i=@fujitsu.com;
	bh=KiCFF/sHVpqJu/eeHglycdwoR3dJsdIewGQRuhxzkuI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OpHWqonxJmJObYLr8v35BY2C3f5ljMKbZC09OCnIrnU0CfkHuq2zo+RBzYHbCRxsm
	 jY+oEpeG2ZcLdkJq5KN+JVPe0EEa3v+4L45NVxGdd6u7cO9DmVPvGDZo2WYy+HBPJb
	 C3m9pLhbd5aQQJ2BKW4aSCEaOhdtzfAJXqbLvXHyAJEw+VIaak3T5eR41AyX/gNelg
	 sKBR2PdkMJ6cpaml5539vTnkB0XqfFOIKiJaQJD8imRxDYID3eMfMAel+xCbM9wRPL
	 MP4KUwcALcuLnpNGxrsu8e+gxs6G9GUAF9XQaqEKWzcXUOSIxyRgPNHPdYHWa4pR/z
	 9SushORd+GyXA==
Received: from [100.113.7.117] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 6A/D5-15923-B5231416; Tue, 14 Sep 2021 23:38:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxRTfayDH
  RoHcRm8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtF1ei5jwWHuioM7p7E1ME7l6mLk4hASmMUk
  MfHfYVYI5wSjxPkH69m6GDk52ATUJKbfugGU4OAQEdCTuPpPFCTMLKAi8eJ3DzuILSxgLvFz8
  QEwm0VAVaLzTwcLSDmvgJPE5FuuIGEJAQWJKQ/fM4PYnALOEusXXmcEKRECKplxQQ0kzCsgKH
  Fy5hMWiOkSEgdfvGCGaFWUmH25mQXCrpCYNauNaQIj/ywkLbOQtCxgZFrFaJFUlJmeUZKbmJm
  ja2hgoGtoaKxrpmthrpdYpZukl1qqm5yaV1KUCJTUSywv1iuuzE3OSdHLSy3ZxAgMxZRCtvAd
  jGdef9A7xCjJwaQkyruDxzFRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvAz2gnGBRanpqRVpmD
  jAuYNISHDxKIryOBkBp3uKCxNzizHSI1ClGRSlxXlFDoIQASCKjNA+uDRaLlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ87LoA03hycwrgZv+CmgxE9DiI/sdQBaXJCKkpBqY4oOXH9u7kM+
  f68n/PyLXOL493bg57v0h30Pfr3qnbfB0FM/4lJBkWVAkMM/EZfIt9ZMTVzilTbzueHkfw1tr
  x1PHZy0675wb6hkfEqoSu/8Ag1vG3SaVR0uLkoQqBZzrrcQnhKfIrRW6YDKh/FTsZN23x9fY3
  DL50lTYI8NtOvFkHOMWpvaovXPXLGt/KWpxdOPNJfEphzhKQx03ZWrP+aSlFMT4ne+OrVWEcd
  u+g4wHCqxtf/eGM/QvZGOxrwj9aPZWwKtaPSNDcu4GgeQjk692v9ogf2+VQNfhTsZIzV+5/mE
  H/imFTW3he/dYi3/q+RU5/TelpLgCpCxCFK9zcqsyXGdJL9okfuLt6QolluKMREMt5qLiRAA8
  5JD9QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-238.messagelabs.com!1631662682!78716!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19547 invoked from network); 14 Sep 2021 23:38:03 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Sep 2021 23:38:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18ENc2PB023611
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 00:38:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 00:38:01 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 5.13 -> 5.14
Date: Wed, 15 Sep 2021 07:37:43 +0800
Message-ID: <1631662663-37180-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631662663-37180-1-git-send-email-wangmy@fujitsu.com>
References: <1631662663-37180-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Improvements

Implemented decoding of memfd_secret and quotactl_fd syscalls, introduced in Linux 5.14.
Enhanced prctl syscall decoding.
Enhanced decoding of IFLA_* netlink attributes.
Enhanced decoding of MDBA_ROUTER_PATTR_* mdb router port netlink attributes.
Updated lists of BPF_*, IORING_*, MADV_*, MOUNT_ATTR_*, SCTP_*, and UFFD_* constants.
Updated lists of ioctl commands from Linux 5.14.
Bug fixes

Fixed build using bionic libc.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_5.13.bb b/meta/recipes-devtools/strace/strace_5.14.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_5.13.bb
rename to meta/recipes-devtools/strace/strace_5.14.bb
index 7d93f2da98..02a4843edf 100644
--- a/meta/recipes-devtools/strace/strace_5.13.bb
+++ b/meta/recipes-devtools/strace/strace_5.14.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656"
+SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
 
 inherit autotools ptest
 
-- 
2.25.1


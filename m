Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.1406.1621468465273513090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 16:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nxZGFpnK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621468462; i=@fujitsu.com;
	bh=AShAHyRfKGTVWmMZakWcqb9dkIxSgj8CIPp3opv8sIE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nxZGFpnKeHpRejpBA5V1i48Jq2Leez8SbmiyPugPoFicA9cQVWmsyFrWOUJcQbdAX
	 KbE9+beaF0eDbJFa+0xB6Ax+Trhyj4rKfN8ZaGIcQi22a4d+Dj0SxEzqpX4/HnTzGu
	 Xpb5nj6YEuWiWIiR5yvB5RywKD0YYOEd9Du8nAJU+jWspw9S59fVieI52T5Ux+CQ24
	 eQkC34vUezmmbE9x5IfGWCx9sbArXQ2C7SSq4EgKPVezqC2Dlz3hDFVWZ9476WhLJl
	 J3Lcro08ZHb3VFk1ZMnCyxkEQZ6PoD9ENCeATZrd+xp7S9NOOTxQ1mgjv1Xy5a4MUd
	 2lcfaT0G1/3+g==
Received: from [100.112.192.186] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 84/1B-34775-D25A5A06; Wed, 19 May 2021 23:54:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRoqu7dGm
  CwduvwhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ajhxeYC87xVjQeucjUwHiXu4uRi0NIYBaT
  xJPJB1kgnBOMEp0zn7N2MXJysAmoSUy/dQPI5uAQEdCTuPpPFCTMLKAi8eJ3DzuILSxgJdH5o
  4UNxGYRUJX4fHQXWJxXwEni5uMTYHEJAQWJKQ/fM4PYnALOEuvaX4HVCAHVrFm1hRmiXlDi5M
  wnLBDzJSQOvnjBDNGrKDH7cjMLhF0h8frwJeYJjPyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6
  hgYGuoaGRrqElEJuY6CVW6SbqpZbqlqcWl+ga6iWWF+sVV+Ym56To5aWWbGIEhmNKwYEJOxj3
  v/6gd4hRkoNJSZTX7P6iBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvNMWL00QEixKTU+tSMvMA
  cYGTFqCg0dJhFdjClCat7ggMbc4Mx0idYpRUUqc13cRUEIAJJFRmgfXBovHS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeT+DTOHJzCuBm/4KaDET0OL/jYtAFpckIqSkGpg2WpoeZZ9wWqN
  +/txktiT2jWIFW5g5uDVuzWVw+nC1Mrh7qb/wop8l06/OO7f/hNahML5sKfN3d0JF9zBsuPV6
  3oxJCw+d22DBu4tX4XHLFfeX70M+T1nDpazgVrHhvcemEykxitwL93jM+iLVWDp1Tm31rcPX2
  m8Jfl6VOmu6cKnzn6vurMuYxJnXWAUHTRP8ZvUi6yh/6b+5E75+ufRka/QBr/2aKhqWNmaOM7
  Pa1+ZJfd9Q5h+W+LhyhVt80AKL6UH1q8yfM3TPFt/ccYTjb/TEhdLPas7mMWd91thqd/PbFYe
  p7DckpabaFWcs+GFfujrLovBJHNPCCP20jHd/JnB4nnunbZ0gdjiwY3edEktxRqKhFnNRcSIA
  iwoGWEIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-267.messagelabs.com!1621468460!609026!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19754 invoked from network); 19 May 2021 23:54:21 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 23:54:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14JNsKhL015401
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 00:54:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 00:54:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libidn2: upgrade 2.3.0 -> 2.3.1
Date: Thu, 20 May 2021 07:53:53 +0800
Message-ID: <1621468435-21509-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libidn/{libidn2_2.3.0.bb => libidn2_2.3.1.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.0.bb => libidn2_2.3.1.bb} (77%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.0.bb b/meta/recipes-extended/libidn/libidn2_2.3.1.bb
similarity index 77%
rename from meta/recipes-extended/libidn/libidn2_2.3.0.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.1.bb
index 7adf924aeb..d33d6a7dab 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.0.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.1.bb
@@ -6,12 +6,12 @@ LICENSE = "(GPLv2+ | LGPLv3) & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/idn2.c;endline=16;md5=426b74d6deb620ab6d39c8a6efd4c13a \
-                    file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
+                    file://src/idn2.c;endline=16;md5=e4b6d628a84a55f1fd8ae4c76c5f6509 \
+                    file://lib/idn2.h.in;endline=27;md5=d0fc8ec628be130a1d5b889107e92477"
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "01c5084995295e519f95978ae9785ee0"
-SRC_URI[sha256sum] = "e1cb1db3d2e249a6a3eb6f0946777c2e892d5c5dc7bd91c74394fc3a01cab8b5"
+SRC_URI[md5sum] = "cda07f5ac55fccfafdf7ee01828adad5"
+SRC_URI[sha256sum] = "8af684943836b8b53965d5f5b6714ef13c26c91eaa36ce7d242e3d21f5d40f2d"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.25.1


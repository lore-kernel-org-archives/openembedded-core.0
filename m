Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web09.7574.1617200913797163130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FesCIFEG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200912; i=@fujitsu.com;
	bh=r2ygoW8ukiGdyFXXJ94jQTvHG2Q7k+adCgCO6Wcj5Ss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FesCIFEGnysusrB0nTlCCv6bxUegb5qGtoAJQBIDzalZ16ArG9U7Pqho3ikO8Ypu/
	 QnaiM+U+68GusLUtvm7UzgOz01+kypER9rf/bdN2N2V1V2w3AANddM5Khv29yqkaX2
	 w1SRHaDUdTOO6v2VPN+b2Pl98qQ3ZwPbgv1z+VbDCEyuBiA58AOz5hRBwkg0o5GjpS
	 C585Phnzwhz9RzrwYRDdiuOi0RqpqOwG8eH7KF7RJTIGcNg/DS7DfaBYybqL/PwwOC
	 uFrgDvBPYtwm9a3CUSLlnzO1BlHGkEXUrHxK6TsgmWNMglUL7vPocMHb8c4NzjawXk
	 f4PqMHPaVYHQA==
Received: from [100.113.7.82] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id A5/34-44603-01784606; Wed, 31 Mar 2021 14:28:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxRZe/PSX
  BoPGkqcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFh2lH2grnsFTuWJTcwHmDrYuTiEBLYyiRx
  8818FgjnBKPE8S3TmLsYOTnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jARmLz6
  olgNouAqsT0g2tYQGxeASeJy1s+g42REFCQmPLwPTNEXFDi5MwnLBBzJCQOvngBVaMoMftyMw
  uEXSXR+eE42wRG3llIWmYhaVnAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXVNfI2EIvsUo3SS+
  1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGF4phazvdjA+e/1B7xCjJAeTkijvI/uUBCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvD1tQDnBotT01Iq0zBxgqMOkJTh4lER4PVqB0rzFBYm5x
  ZnpEKlTjLocV1YtWcQsxJKXn5cqJc4bAjJDAKQoozQPbgQs7i4xykoJ8zIyMDAI8RSkFuVmlq
  DKv2IU52BUEub9CbKKJzOvBG7TK6AjmICOuPIoEeSIkkSElFQDk+3Fum27GsN8i9j/KM6ZKaL
  HJxlp+dJvl/jXvO7GT2nGpx+I3u07Mk3w9krLttn6m6XkZ6i/1b7Fp2CwfdeuSIc47x0azU1d
  dzZ8npIjWr047flGb0PletXyylkS5VdNn9RPVe57/4WL9WH3fTGD1i92taWSq/e2+1nefxK6/
  fQqFZW06vxUHZ3tVrPZUiqDxEvei7KKN5RtKVJ7s8me8a3e+U3nijc/69/NsHl2uesbCe6XvY
  5zp21IFdu202TX5TsPVYM81C2TL3G9fuN4fY7nmypvoTV1e0+HsVhx6GRVK68WLzStlD70maF
  g3+x3he96qlr/itXHxaeJXJoucZ/N+vjnqZ/i/c8WFOkpsRRnJBpqMRcVJwIACizWAjYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-245.messagelabs.com!1617200911!174313!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11279 invoked from network); 31 Mar 2021 14:28:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:28:31 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VESVwk003405
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:28:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:28:29 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.17 -> 0.7.18
Date: Wed, 31 Mar 2021 22:28:21 +0800
Message-ID: <1617200901-62255-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.17.bb => libsolv_0.7.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.17.bb => libsolv_0.7.18.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb b/meta/recipes-extended/libsolv/libsolv_0.7.18.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.17.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.18.bb
index fa6e8a3c4d..cce20655dd 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.18.bb
@@ -11,7 +11,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "4bc791c0d235eb14bfe4c5da607206bfdfa6983d"
+SRCREV = "35e172e9fb99594b49c630cb188dab9d2b2c4dc7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web11.6040.1616593147229388783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 06:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=otWaLB6+;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616593151; i=@fujitsu.com;
	bh=DJVy8U0meaWxAUdiqkohR66krLvTVtFdGVKkTSkBMkc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=otWaLB6+x/hdMfqgebnZYvDrZZkkkbhdl3/YTFPcPZz6Td1LeEmiocoK+xoZFlazv
	 d7k9j9XsySyncaOIp2IPLtEL1aF0FNVRgyh7IT0xBRtggSe4cycQDJSIgKSltiCTuJ
	 1+zA8AmVIQkInSwuMTGI1pEmvhIuLKEOaug5gQ3p0ZIP3EKXAUuQ8KKVe7Cog9+62G
	 593oKPmYkZ4/39eRAGLgjhl2Xeb42B2s1C0PgYsXPrwtbWTPDnl2h1V/gYld+9E0Lu
	 83IjV1iR63nNxr/kl3ZUDGYbtvGh0hK7nBGweCefuI0RnGEJrxCD9FsOYcsyKaoclO
	 ynQub565hw1aQ==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id A8/36-53635-FF04B506; Wed, 24 Mar 2021 13:39:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MRovvPITr
  BYOoufYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNlRgtTwU2Oii0HdjM2MDZxdDFycQgJbGaS
  6O5/yAbhnGCU+HP8BWsXIycHm4CaxPRbN4BsDg4RAT2Jq/9EQcLMAuoSl9a1sICEhQVcJSY1p
  IGEWQRUJdZvmAjWySvgJLHpxTdmEFtCQEFiysP3YDangLPE1Ge3wWwhoJq2Pc8ZIeoFJU7OfM
  ICMV5C4uCLF1C9ihKzLzezQNhVEms6prFNYOSfhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx
  0DQ2NdA0tgdjYVC+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMBhTCg6072B89PqD
  3iFGSQ4mJVHeKpvoBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvJL2QDnBotT01Iq0zBxgZMCkJ
  Th4lER4JWyB0rzFBYm5xZnpEKlTjLocV1YtWcQsxJKXn5cqJc57HWSGAEhRRmke3AhYlF5ilJ
  US5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzbCTKFJzOvBG7TK6AjmICO2PgjEuSIkkSElFQDk4f
  Ug9PifdzTQvScJhQV87Vcf90te/vovHlrdpx+O2kh765Izh0d0x+sbEg1W8ISuLHWVlB4z7Oe
  FQHpFX9mdn8QTjlgFariHW8hL/fn/2+j3v2/90w7WPCueWGVg7YLf4Jp76qT0TdPvv6pwMYez
  Kq9XrF19ja2h++TpkjO3XsobMLOq9dmvvgREGd37V9zwuzS/38qLN64icxdcsB2jwbnFi/BzH
  05jzmEoiZ17G6cnSsRJvP06gbmhMuT9Wt5j7Bz+Pqdkbxz3OOJsiGT3neLuUuDt1T98Lma8Zn
  lZex+3hlHvF+VTPv2+feJ5HCWpPMWHdYnuf6s/fPfVl3kbqvPHg+Jdg4f5zmMS3T4cpRYijMS
  DbWYi4oTAa7RM7ZNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-271.messagelabs.com!1616593150!445202!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2576 invoked from network); 24 Mar 2021 13:39:10 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-27.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2021 13:39:10 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ODd6IL015150
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 13:39:10 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 13:39:04 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] boost-build-native: upgrade 4.3.0 -> 4.4.1
Date: Wed, 24 Mar 2021 21:38:48 +0800
Message-ID: <1616593128-42917-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616593128-42917-1-git-send-email-wangmy@fujitsu.com>
References: <1616593128-42917-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{boost-build-native_4.3.0.bb => boost-build-native_4.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_4.3.0.bb => boost-build-native_4.4.1.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_4.3.0.bb b/meta/recipes-support/boost/boost-build-native_4.4.1.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_4.3.0.bb
rename to meta/recipes-support/boost/boost-build-native_4.4.1.bb
index 19e991e65f..ad675ce731 100644
--- a/meta/recipes-support/boost/boost-build-native_4.3.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_4.4.1.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https"
-SRCREV = "632ea768f3eb225b4472c5ed6d20afee708724ad"
+SRCREV = "76da80f33187a3d9e5336157cdfae12ce82e37eb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+){2,}))"
 
-- 
2.25.1


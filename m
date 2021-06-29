Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.9634.1624979132750156653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 08:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uLLDaIyr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624979130; i=@fujitsu.com;
	bh=LiBHh5Xdn9IRNQh0xaWwMv+B59QZWxEhE7heDUiVA3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uLLDaIyrHWJ0AeGLpOfaDBx8x8QZxSioeOxx65JzTrVWNXdfRKBvWcyrqzLG7Q4Ja
	 rxOM+GQHdICDCNwIt4p1yajLJ+GouSO6sjIScC1qecQyZg1Azri/S5HDnqoxHb8EOk
	 jMVcqDV9A2JAlbuXXSWUQoJlFk5pBPRnnADFTCm251qrRZD2aIYCe77U27SG07KLab
	 whM5Bjd3vBhE8Pt8pA/nYp1+sQwUuIVJxdhh/lIVf/akxJjQ2jLzrKS7JlgwoG+3No
	 i3h2OaumZZQKtAr4hL5OOr4VtbmDcXDdj9XA9JYUXhL8P0BtSPD8PkXSYoBTmbWZCA
	 UIv19bkzhEZ+w==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id BE/DD-56066-AB63BD06; Tue, 29 Jun 2021 15:05:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRorvT7Ha
  CwbIvZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ayVzwFXzkqvm9uZGxgbODoYuTiEBKYxSQx
  6ecGRgjnBKPE695O9i5GTg42ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7B6xEWMBB4uKzp
  YwgNouAqsTcg0dZQWxeASeJs/fns4HYEgIKElMevmcGsTkFnCU275vLCDJSCKhm8WdJiHJBiZ
  Mzn7BAjJeQOPjiBTNEq6LE7MvNLBB2hcTrw5eYJzDyz0LSMgtJywJGplWMFklFmekZJbmJmTm
  6hgYGuoaGRrqGlkBsbKqXWKWbqJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERiKKQUH2ncw
  Pnr9Qe8QoyQHk5Io7yW92wlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgvmADlBItS01Mr0jJzg
  HEBk5bg4FES4Z0MkuYtLkjMLc5Mh0idYlSUEuflNAVKCIAkMkrz4NpgsXiJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjDvbZDxPJl5JXDTXwEtZgJavOjJTZDFJYkIKakGpkzdhNk/MnO/Orw
  34H0dnbn/5u7NDetnHeA7EvDx7WZNpsCXqXe0opKYhB8VXpx20Oz6n48R6RqBIWv1u7bcfuzD
  WF1e/EBR2sfW9uSu9XpRIY5JLL+PcT/5+3jRWpZ3Lix/p+/fqvuwJm2z7Vf3P3I7jXZtKnNKt
  jZnVFDI+N+Z+pZPdvHzRlXzR5KKXw2K2+Y3a5U+mqnWVvZ8rbyxfu2T28f4C2el2PiG3tDsy1
  bT2zh/rUv1xEaDBrnoVz6Kj6vu/Pw8edsWqburvtU8Om2woeD9hDd8Qc+y7A3+JG0OLPkifup
  roOjt6dEpf0WTNwnv3yzacH3tFuFEh9CN7/ujZ7jGmobsk5F+53CyRImlOCPRUIu5qDgRAHJ4
  OPdAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-271.messagelabs.com!1624979129!47593!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30290 invoked from network); 29 Jun 2021 15:05:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jun 2021 15:05:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TF5QYl007165
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 16:05:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 16:05:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.12.10 -> 0.12.11
Date: Tue, 29 Jun 2021 23:04:52 +0800
Message-ID: <1624979093-98912-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
References: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.12.10.bb => stress-ng_0.12.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.10.bb => stress-ng_0.12.11.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
index 7b06f00616..d0cf45f42d 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "bd167b6559fa8a28680371b1defd3ffe2344eb550129d58dd7d5e2d568f2786e"
+SRC_URI[sha256sum] = "971393075321c24c3d5769acfabb705911d1f411ced5937b7cfea58528c1b4e6"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1


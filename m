Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.6299.1627542414271602157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OA9BpuEu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542412; i=@fujitsu.com;
	bh=uXUg7cX2eZAiJfsIqlxEha0uc/SpQKZtQD4tLyFSCJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OA9BpuEuiq2rtI1pLn2usTKl1VfWB6RI1cSPVWIolIvnEhUrZemxIUFBUNjyn5yxa
	 /XGjyRg/p/qwpcvFgXrFfApFoXAhakV2QJn7yJaxyOzy5QI4ydbjVJddy5HfbNwHul
	 ntrU/aRPTUMm94ykje1/1ciBbEw+5YQUnpDSltZAaHFOE3DRxw26sozAW25EZtBPqk
	 JHSz2ecCpw0Qv2sxowv4qDkIWTbS0jiz86cCwuYeIaYy8KRqZYHCG6PQWKEbdAdzxI
	 cJK3nuKFkEQosnCIVec4/+by+C+xj4A0V/rgmDi3253NfceViWElMrm60DOlvIPLzb
	 obcdRhQovRFhg==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 4D/AE-31114-C8352016; Thu, 29 Jul 2021 07:06:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MxVbc7mCn
  R4PYKY4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPtzKdsBfs4K45fu8nSwHiQo4uRi0NIYBaT
  xIz9T5i7GDmBnBOMEtuW6oDYbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCFxd
  dVrpi5Gdg4WAVWJs2DFvAJOEo+vV4IUSAgoSEx5+B5sNqeAs0T3h/VMICVCQCUT10qChHkFBC
  VOznzCAjFbQuLgixfMEK2KErMvN7NA2BUSs2a1MU1g5J+FpGUWkpYFjEyrGM2TijLTM0pyEzN
  zdA0NDHQNDY10DS1NdM3M9BKrdBP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECQzCl4JDT
  Dsb3rz/oHWKU5GBSEuX9ZceUKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd1MQUE6wKDU9tSItM
  wcYDzBpCQ4eJRFeoQCgNG9xQWJucWY6ROoUo6KUOO/iQKCEAEgiozQPrg0Wg5cYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfOGgkzhycwrgZv+CmgxE9Di2hJGkMUliQgpqQYmTjev1g3NWqm
  Odaat1YfPTjR0LTgatfLFp+83fx6y3dyncv+60uWj8Twl5wNXWhW2NfEqT7KVsFc6/HHuM7ML
  Ox8vdZ9Ts1LXZ1XZgfjknnvNvK+eV/6aMJslbr9zmP+H518mLJrwrPt2ik1I8vN5/h/Nvy+P+
  3jWgs2qK+Cix5b2mToCU93rtk0oOcdwJKK0/GhQksmUCK7loXq19q47AqR8DbbE2MSfeXjrXN
  Uii9SDBRJGh3KYigv2rvEqmi45t3j6iZfPGI9tvX3L7eH1T1ufeATpz+QwVYu5N3F1ugzfvLU
  3ufV3G1RJxn1+wr3pWkTICllj8fOqy3gDd5aFyITIhL7RzHv6+/D8zs87lViKMxINtZiLihMB
  II0QZzwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-265.messagelabs.com!1627542411!63321!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19899 invoked from network); 29 Jul 2021 07:06:51 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:06:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T76gGf001513
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 08:06:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:06:46 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] i2c-tools: upgrade 4.2 -> 4.3
Date: Thu, 29 Jul 2021 15:06:28 +0800
Message-ID: <1627542388-24698-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627542388-24698-1-git-send-email-wangmy@fujitsu.com>
References: <1627542388-24698-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

4.3 (2021-07-22)
   decode-dimms: Attempt to decode LPDDR3 modules
   eeprom, eepromer: Removed the tools in favor of eeprog
   i2cdetect: Sort the bus list by number

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../i2c-tools/{i2c-tools_4.2.bb => i2c-tools_4.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.2.bb => i2c-tools_4.3.bb} (95%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
similarity index 95%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
index 9842d1f135..76bd85331a 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
+SRC_URI[sha256sum] = "eec464e42301d93586cbeca3845ed61bff40f560670e5b35baec57301d438148"
 
 inherit update-alternatives
 
-- 
2.25.1


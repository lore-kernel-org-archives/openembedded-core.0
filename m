Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.4662.1622704434840881291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 00:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=n7gce/Wn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622704432; i=@fujitsu.com;
	bh=Bmg69V3ir3ENZeYftXmPfvRPhjoNVOPkm+dz88c/X9Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=n7gce/Wn2b2WCiLjMVG5e4tkqmpT1wN+yxapdYbyOLNHUaBmvNxlN+lzuoSY6UU4d
	 rvWGrO+70etxQKAwGoUc9GvMe9ygtTkkwAkTXVeXtfxCW3HDa4Cs/w+V5G0d3Ctqh2
	 48lSqTuPBEggCgLmBjY0ssafBdXMFkUV7XSCUeBDD03vFDpkZ0VxA4348pwXo257Hd
	 45UyGUJqF1DAPbu25uac4EpDwYN5s9yiDPuYSjYfpqtOll9cIsYfarpL/3Ek2O2n9/
	 w7MONa/52DWEEFdIP9zZ9Qx+OlnuTGQaDrg0E7a4GSSJ15guRSakHkHcnA2l8cM0Tt
	 NVEKrIS/OLMMQ==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id FA/DE-34775-03188B06; Thu, 03 Jun 2021 07:13:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRomvQuCP
  B4Ps0Vos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePbx9VsBe0cFQs3XmdrYFzE3sXIySEkMJNJ
  YsL2si5GLiD7OKPE1uNNLCAJNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxuwesV1jASeLgs
  z1gNgtQvLlpCZjNCxS/+PM7mC0hoCAx5eF7ZhCbU8BZ4tiPZywQe50kdvR0QNULSpyc+YQFYr
  6ExMEXL5ghehUlZl9uZoGwKyReH77EPIGRfxaSlllIWhYwMq1iNE8qykzPKMlNzMzRNTQw0DU
  0NNI1tDTVNTHTS6zSTdRLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMxZSCw3o7GCe8+aB3
  iFGSg0lJlNc4bUeCEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneonqgnGBRanpqRVpmDjAuYNISH
  DxKIrxytUBp3uKCxNzizHSI1ClGRSlx3rcgfQIgiYzSPLg2WCxeYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMewBkCk9mXgnc9FdAi5mAFgt4bQNZXJKIkJJqYOKVvy9wMeWteNI1ifdhNXP
  CtTnnPNNO5CjvufJ9qsyFW9w9NdfUMio1nb2zOFQ82L9kzhU+L6uRvS/dZofijGmT3rNXsz44
  y7on6PiKabod0tueFXGYKXkelwz7rO4pqH6oXiupbJuEl4aEp1AQ3yynNrnGzzpPP678nHqEu
  00pY99ZoVUxSoLzfh2RrncU+MmUw5l5LiPD707BrFns05o91lXMikjeLz/zY/vrhVFscdP/6Z
  dOiak9siPH+ZlKFl/YvtUfFi/0Wmn/7KxOrKtXTq32w2ebNjxYLKodsD8wf7lX++v2LDfDO3P
  UPlZ8Vrx+ik3HolJUSdJIJnOa4cP3W9RDjQuf/Vwed+SKEktxRqKhFnNRcSIAYs3HKkADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-265.messagelabs.com!1622704431!115879!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17129 invoked from network); 3 Jun 2021 07:13:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 07:13:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1537DpuX011105
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 08:13:51 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 08:13:49 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-magic: upgrade 0.4.22 -> 0.4.23
Date: Thu, 3 Jun 2021 15:13:22 +0800
Message-ID: <1622704403-26153-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-magic_0.4.22.bb => python3-magic_0.4.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.22.bb => python3-magic_0.4.23.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.22.bb b/meta/recipes-devtools/python/python3-magic_0.4.23.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-magic_0.4.22.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.23.bb
index b828927599..4ebae32569 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.22.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.23.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ca884349f2c92ce830e3f498c5b7c7051fe2942c3ee4332f65213b8ebff15a62"
+SRC_URI[sha256sum] = "88f71d04fde4318da32fa03930362f1c6127caa833614563fd53a0fd3438cc3e"
 
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.25.1


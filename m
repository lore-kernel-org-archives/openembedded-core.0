Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web08.3172.1620955768549231737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 18:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KHVGq/1p;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620955767; i=@fujitsu.com;
	bh=rngA54ieN7ajBworRtwXiws4HGPbUP9XPXyiQmzoZD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KHVGq/1pWSI+LI5wJ0jQBWWJLccYCKMu1a9TkLbo17WKokekrnnPxkeEycLLBUcFf
	 IWV5qvQSylBo6GUf5UqD2ortBfBSYlLOgjLdPqgKfo9pUcAbbeKV28OQyqQNdTi6z6
	 9G7ugWIZ7ibxCq2NDf49Fjyep/wxmL1qqr+cBoX+Ul3aCZfTkgDhvmwWwk7EJsmKct
	 FGkYotGVdGCHg00KZO2935yYTP8Z4y80nQ/pVko7fm0iTZxYD83bBAwpKVTOvXo8yh
	 C1eb0r/i3RO+0iGV4Qb/HcAvdwHQK/n/I54SYq3vZHcH1zOo7KmTSqNTc6H2jdT+2+
	 Ulu490NP9i6lg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 81/16-14259-672DD906; Fri, 14 May 2021 01:29:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxVbfs0tw
  Eg3lzuCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxLW5uZCuZzVPQ86mFsYDzA3sXIxSEkMItJ
  YuG5iYwQznFGiXf3njF3MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sIGFhAR+JC
  3fEQcIsAqoSXz+uYQKxeQUcJabs/sMKYksIKEhMefgebCKngJPE+wMbwFqFgGo6vwdAlAtKnJ
  z5hAViuoTEwRcvmCFaFSVmX25mgbArJF4fvsQ8gZF/FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE
  1NDDQNTQ01jXTtTDXS6zSTdJLLdVNTs0rKUoESuollhfrFVfmJuek6OWllmxiBIZiSiFb+A7G
  M68/6B1ilORgUhLlPek5O0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+zC3MThASLUtNTK9Iyc
  4BxAZOW4OBREuGtOg+U5i0uSMwtzkyHSJ1iDOd4s3bJImaOt2Cy7d5dINkOJmcuOLiamWMWmL
  zffghIPgCRQix5+XmpUuK8d0C2CYCMyyjNg1sGi/tLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTk
  YlYR5t4NM4cnMK4G76RXQuUxA596YPgvk3JJEhJRUA9Pc8g6md69vHb7yf0vQgX8qH9nje5br
  zcxim1WS75+4p6ndI3j6j5szROc3XVZ4bfJrzeuF+/cpnmLIKr2/7XT86WkRGx2nO9v3vrM2O
  nFpS9IiL0f3vur0y6l/Clxu6ywL2NarmnyS57igrMdMhxsFiWIXfU6+nZxxd9OJa7Yn1mec23
  Lhb9D/9uhDvqrlfPt8a8TEIppag5LWty47f3e5gcmFrIlaXxRlP/rw3prQlfdzpQPX5jiP1jW
  N+nbfggKjpv5uNnVeZslkcLArem1p9+7THH9maLL8yynPdHi4+aFLVVCETzX/+yeOXusnLZwl
  JnGK/3LFlk2dVlLxiTrZHhXeR+ZFSJ9++Xt65C0lluKMREMt5qLiRAAIiwMgdgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-238.messagelabs.com!1620955765!43489!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3909 invoked from network); 14 May 2021 01:29:26 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 01:29:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E1TPES021244
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 02:29:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 02:29:23 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/4] vulkan-loader: upgrade 1.2.170.0 -> 1.2.176.0
Date: Fri, 14 May 2021 09:28:39 +0800
Message-ID: <1620955720-4296-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620955720-4296-1-git-send-email-wangmy@fujitsu.com>
References: <1620955720-4296-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-loader_1.2.170.0.bb => vulkan-loader_1.2.176.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.170.0.bb => vulkan-loader_1.2.176.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
index 6b6ed06dbb..e241a2f156 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
            "
-SRCREV = "c5678a03db383fd0dc5bfb8e9a383043bdbcb57b"
+SRCREV = "eb6d6f95dff809d66e95b903105da6424e75862f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.6040.1616593147229388783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 06:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OD1+ZYJR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616593145; i=@fujitsu.com;
	bh=4lBS0emL/qJ5MkLB7UF0+KQMvmIs4b0fzVWhDRMu9oE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OD1+ZYJReW7VFan3LsMPBPjk9nIdT+5pW7S81YDvI1Iux/XJFyt4y75DOTtueJ+GX
	 yOxJXKwlzW7ueqHWjK4l7qb9ih1Kup04aWGRYlyblx8fvRo2zcA8lL0eX4uhZBOgTV
	 C42MzQRHrjSVvNyYWLHiabB/Sr3OjB+Lv6E4jIUEiMzpNBViizwH9lwiwubqfyp9mD
	 EdhGzF54kpFZS8cJaRRYPGSRiIUsUyoIP/a4n9j2IvEDkPOQ6rDBMcBHXj8AODF0DO
	 ey9Lr8Plw67qBOHsWlJyU6YU2XYkBlxC9yAKzTL6rSIG7cjYv5uYTVp245cIyZmmRS
	 veBjxpwZj4tng==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 22/F5-53635-9F04B506; Wed, 24 Mar 2021 13:39:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVfenQ3S
  CwYxXghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aFi8fYCnZwVFy9coupgfE2excjJ4eQwGYm
  icbdkl2MXED2CUaJ7w8/soAk2ATUJKbfusHaxcjBISKgJ3H1nyhImFlAXeLSuhawEmEBR4nDP
  bMYQWwWAVWJp8tXg9m8Ak4Sj/Y/YQKxJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvt
  zMAmFXSazpmMY2gZF3FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0BGJjU73EKt1
  EvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwOBKKTjQvoPx0esPeocYJTmYlER5q2yiE4T4
  kvJTKjMSizPii0pzUosPMcpwcChJ8EraA+UEi1LTUyvSMnOAgQ6TluDgURLhlbAFSvMWFyTmF
  memQ6ROMSpKifNeB+kTAElklObBtcGi6xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5OkC
  k8mXklcNNfAS1mAlq88UckyOKSRISUVAPT9KQ8b6lHPIkNcSd+P93FeGC5PNvS1LzSFXrOnuw
  qK2zKv1/OCBPLr2N/8KXV9/fEiLoKrrDKbJ5LX/PvnfXandLXaxFSv2eG+u1jb0snGXwNvnX8
  2ZQLyw6Izbjf23TpV+f+RBbxUw8LFVtuvJ56MGn5932aCRy9u/beS77cvuvPeXdFmyOPDJ9rG
  v3Zr/2H2fRFheku88+ybS3aJ80v2IulamTJbli1/NbVioh7i1sfnlde9mtytpvMu0O2bVwBE8
  Kfqp5u31Ng+aWvZl2NkxznS2GZM5vL1E7qH9e/Me3fFT8X6z/5ubdaD64T+sv0bOkXiV/FNzi
  CEho9z86caHpmbkG08fIzd9e90pXlV2Ipzkg01GIuKk4EAFK+T64pAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-267.messagelabs.com!1616593144!547499!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17465 invoked from network); 24 Mar 2021 13:39:05 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2021 13:39:05 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ODcxpb026640
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 13:39:04 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 13:38:57 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] at-spi2-core: upgrade 2.38.0 -> 2.40.0
Date: Wed, 24 Mar 2021 21:38:46 +0800
Message-ID: <1616593128-42917-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../atk/{at-spi2-core_2.38.0.bb => at-spi2-core_2.40.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.38.0.bb => at-spi2-core_2.40.0.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.38.0.bb b/meta/recipes-support/atk/at-spi2-core_2.40.0.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.38.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.40.0.bb
index a74e4cd5cf..e80fa260f0 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.40.0.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "84e36c3fe66862133f5fe229772b76aa2526e10de5014a3778f2fa46ce550da5"
+SRC_URI[sha256sum] = "4196a7d30a0051e52a67b8ce4283fe79ae5e4e14a725719934565adf1d333429"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.25.1


Return-Path: <a.novikov@yadro.com>
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
	by mail.openembedded.org (Postfix) with ESMTP id 9466977972
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 08:09:14 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id B17A940418
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 08:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-language:content-type:content-type:mime-version
	:user-agent:date:date:message-id:subject:subject:from:from
	:received:received:received; s=mta-01; t=1498032550; x=
	1499846951; bh=JLoLcE+WRs2yW4ZRAIpq6YL0+QATZNq8WsGsvnSXnSs=; b=b
	5XDBkiUAmOnBsVmFh0Y7urKstM+l9b17mCYeMnfo0nqaoImaK8YNVwsXMbzKD8rK
	zuT+LWL8VQyiBVlMzB6QcdubECc7V7QDK/PujLpHtYT0FjP9F0Z5XfDCJ1RMux50
	8kEazuJ3ziRhglU7oDYtOPiDT91FwIWMBM2AExYYr8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNyVIUhWh2Rt
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:09:10 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 45D28400FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:09:10 +0300 (MSK)
Received: from [172.17.15.41] (172.17.15.41) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Wed, 21 Jun 2017 11:09:10 +0300
To: <openembedded-core@lists.openembedded.org>
From: Anton Novikov <a.novikov@yadro.com>
Message-ID: <0e3ce726-1eb7-e456-8270-84fb866a423b@yadro.com>
Date: Wed, 21 Jun 2017 11:09:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
X-Originating-IP: [172.17.15.41]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
Subject: [PATCH] (morty) gcc: fix ubsan empty string check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Jun 2017 08:09:15 -0000
X-Groupsio-MsgNum: 99165
Content-Type: multipart/mixed; boundary="------------D1CCC2CD4FF31B788C89686D"
Content-Language: en-US

--------------D1CCC2CD4FF31B788C89686D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks,

Anton


--------------D1CCC2CD4FF31B788C89686D
Content-Type: text/x-patch; name="0001-fix-GCC-build.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-fix-GCC-build.patch"

From 10d86dd98109c66814229c18dc199d08fa49145c Mon Sep 17 00:00:00 2001
From: Anton Novikov <a.novikov@yadro.com>
Date: Tue, 20 Jun 2017 15:42:34 +0300
Subject: [PATCH 1/3] fix GCC build

GCC 6.2 build with recent GCC was failing (for example, on my Arch system).
Patch fixing it was added from GCC upstream commit. Part of it adding noise to
ChangeLog was skipped, as it wasn't applying for some reason.

https://gnu.googlesource.com/gcc/+/c0c52589c6a7265e8fc6b77706a83d22aa1ef0ce

Signed-off-by: Anton Novikov <a.novikov@yadro.com>
---
 meta/recipes-devtools/gcc/gcc-6.2.inc              |  1 +
 .../0049-ubsan-empty-string-check-fix.patch        | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
index b118995e1d..97ee7bfbc5 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0049-ubsan-empty-string-check-fix.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch b/meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch
new file mode 100644
index 0000000000..3bbdbe7115
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch
@@ -0,0 +1,25 @@
+2017-01-26  Richard Biener  <rguenther@suse.de>
+
+	Backport from mainline
+	2016-09-03  Kirill Yukhin  <kirill.yukhin@intel.com>
+
+	* ubsan.c (ubsan_use_new_style_p): Fix check for empty string.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@244923 138bc75d-0d04-0410-961f-82ee72b054a4
+
+diff --git a/gcc/ubsan.c b/gcc/ubsan.c
+index 56637d8..1093824 100644
+--- a/gcc/ubsan.c
++++ b/gcc/ubsan.c
+
+@@ -1471,7 +1471,7 @@
+ 
+   expanded_location xloc = expand_location (loc);
+   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
+-      || xloc.file == '\0' || xloc.file[0] == '\xff'
++      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
+       || xloc.file[1] == '\xff')
+     return false;
+ 
+
-- 
2.13.1


--------------D1CCC2CD4FF31B788C89686D--

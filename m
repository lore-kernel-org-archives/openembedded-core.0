Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE680C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:33 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.1503.1654188749882029691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=auRDetq6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so9983429pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eJ48cgCy3bN8SW290dk5FqaRjwruy+WBM/0Ka8ZkYaM=;
        b=auRDetq6GGB0clhOCQB+EKSkIXegr5GJ72qC+hdxqDN0+yFEApQAY9vNYnAJRLMkQY
         BunlhDLQ+ScskCGQxV4gK3dZHe4xdljAJA2zebqBEvkcXPrpWFvz3prP0j6HhVQkFt2/
         pe0HYgVHL665VfxV6pJ0qB53nCxmQeMOjO8/xJMZmzoFT9fjjiWBWDNfrQYH98M5/wf2
         oqjuOLX2vAzu8sIv0CT0LUGOwXxcLVsFoHpc5Sc9yhuDJUiaaqrtw5S3mAGAz7h1e/IG
         gs7UB5kRzTLqgDomXgXIqGbsgLqjZ7S5uNWhGJlOSYjLxmRhISKBMIEMDde51l1ZutXS
         TsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJ48cgCy3bN8SW290dk5FqaRjwruy+WBM/0Ka8ZkYaM=;
        b=EAVt2mn+SPAI0ujt9oni/TkOql3ELPh9YfXrfs8/A2RSHhE/UE7x6WRFT4r0uDHNtm
         mwa26RrZ7T9KOf6VUG7BWrAq4i3KMyxqxnYrteOPuMv3hWvUrK2/u9gRmU5F/o4KYTqH
         rtCkqSmA2FbfMQH0CHZAEw8GUPB/ZkKfjW0w3eyGjUtx6ZEIMNTeENJpDk31oVce5aqP
         kDi0m6gj7zKD04eaqimDDF9s7RMMgLCTWbALRqVbMn6BFEi1Rtz9X/klZ5fK8IkxRGI7
         NRM3yNuNFY5F0oWrKrd6OcUl33LPQKji25gP4olo34y6ML4IhOFeTnJ9DkEXVocPNjZi
         w2cg==
X-Gm-Message-State: AOAM532g3ZUOvxQhe5u1Bz0nNNCEwrcO6SCRrajoFyHlJGdrEy6sLx6o
	BsV0LUaua/tpxYbw5GsE2fTAwmoLtO9z9Qu3
X-Google-Smtp-Source: 
 ABdhPJwafgkm4hAGcNgtiFDt0k4nzc7rPsGX2KbFybBqGSpwEjuchsLJsdqXXdXtxECj20Dgp63yLw==
X-Received: by 2002:a17:90b:3b4c:b0:1e0:2c34:fbe8 with SMTP id
 ot12-20020a17090b3b4c00b001e02c34fbe8mr6368088pjb.70.1654188748630;
        Thu, 02 Jun 2022 09:52:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/26] cve-extra-exclusions: Add kernel CVEs
Date: Thu,  2 Jun 2022 06:51:39 -1000
Message-Id: 
 <726ce5bf1ea64d31f523ec5aff905407480c1095.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166484

From: Richard Purdie <richard.purdie@linuxfoundation.org>

For OE-Core our policy is to stay as close to the kernel stable releases
as we can. This should ensure the bulk of the major kernel CVEs are fixed
and we don't dive into each individual issue as the stable maintainers are
much more able to do that.

Rather than just ignore all kernel CVEs which is what we have been doing,
list the ones we ignore on this basis here, allowing new issues to be
visible. If anyone wishes to clean up CPE entries with NIST for these, we'd
welcome than and then entries can likely be removed from here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 319d465d44328b5f062d2da0526c0e8b189b4239)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 6c19cd293d..993ee2811a 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -53,6 +53,43 @@ CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 
+
+#
+# Kernel CVEs, e.g. linux-yocto*
+#
+# For OE-Core our policy is to stay as close to the kernel stable releases as we can. This should
+# ensure the bulk of the major kernel CVEs are fixed and we don't dive into each individual issue
+# as the stable maintainers are much more able to do that.
+#
+# Rather than just ignore all kernel CVEs, list the ones we ignore on this basis here, allowing new
+# issues to be visible. If anyone wishes to clean up CPE entries with NIST for these, we'd
+# welcome than and then entries can likely be removed from here.
+#
+# 1999-2010
+CVE_CHECK_IGNORE += "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-2764 CVE-2007-4998 CVE-2008-2544 \
+                     CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
+# 2011-2017
+CVE_CHECK_IGNORE += "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-0774 CVE-2016-3695 CVE-2016-3699 \
+                     CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE-2017-6264"
+# 2018
+CVE_CHECK_IGNORE += "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
+                     CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-2018-5873 CVE-2018-6559"
+# 2019
+CVE_CHECK_IGNORE += "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
+# 2020
+CVE_CHECK_IGNORE += "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
+# 2021
+CVE_CHECK_IGNORE += "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
+                     CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-4202 CVE-2021-44879 CVE-2021-45402"
+# 2022
+CVE_CHECK_IGNORE += "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
+                     CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
+                     CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
+                     CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-2022-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
+                     CVE-2022-25375 CVE-2022-26490 CVE-2022-26878 CVE-2022-26966 CVE-2022-27223 CVE-2022-27666 CVE-2022-27950 \
+                     CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-2022-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
+                     CVE-2022-29582 CVE-2022-29968"
+
 #### CPE update pending ####
 
 # groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
-- 
2.25.1



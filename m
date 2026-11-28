Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2756.1795845257349891166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eDyN5+9/;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1124; q=dns/txt;
  s=iport01; t=1795845257; x=1797054857;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8aFNg5bSB5lgVVFVYj0YRi/gTvtR45DS9nxnLZ62p6Y=;
  b=eDyN5+9/7AR5aHdarIcLggTcWGe9z/nYc5jhhZ/L15J0MBsHmm5oGeao
   PzBq7kgPYUxnsbvt+n7PH/SmudxV0HA7CeeZMakgFlrKxGyLQCHIk5Rmq
   y6DuCcDJ/lBYU8Gn5t2wflGz3mEQU5fr4TJwl9Y6RHK3VgksL5wj1DOoW
   u1cJ8iaQuVauGg5ICo4LZFPc4sXuy4Ke26dfNfp0znjN7CtuqO4iu58A7
   ZkVBwK4pxMo56secHGW80Cx+sVDINfopH6zBittkGX6KQm9B0JCqRgUi7
   IxBV6Fye5/eGtB8AbqSAZZcmGTYATR93ppkPeUlmlOJ6oR1F71BQzOApq
   Q==;
X-CSE-ConnectionGUID: ArIU7TvnS/K3eQ0v0WcM8Q==
X-CSE-MsgGUID: 0QWu2SAbTMWUcOS7KmSTsg==
X-IPAS-Result: =?us-ascii?q?A0BBAgACawpr/9VK/pBRCYJZgld1YENJk1oBoRyBfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBY4lAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBU2AUYwXESDAgGCdAO6HoIsgQHgMQELFAGBOIVCiCV2hH4nGxuBc?=
 =?us-ascii?q?oR/hBd5hXkEgiKBDIFyjHOKIUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjO?=
 =?us-ascii?q?xeBBxsGBYEcgR6BEoEDW4ErJl0BIYEGgXYCglGCAAIBRkEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0McjkQMBwkLwUXJjwbB4EMJx0bF?=
 =?us-ascii?q?w4CKAYVIQtDGA1IESw3FRkEPm4HlBKDHIEOgV9QOpNskXihEQoog3mMJJU6G?=
 =?us-ascii?q?jOqcy6YWqRchGqBaDyBWXAVgyIJShkP4H8mMj0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:ygLUP6hJRGM299kHhLPIQZMdX161fREKZh0ujC45NGQN5FlHY01je
 htvCD+HOq7Zajf9KN4lPt/nph5TuZDSztA2HVRpqCgxRnxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUx4MdKXl1Q8
 8dfC2sAV0id39295eKCH7wEasQLdKEHPasWt2slyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYT/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKLIoPSG5oOzy50o
 EqexlvkWCozPuC69geO1Unzper0oTj0Ddd6+LqQs6QCbEeo7mkaFB0XWEb9reSzjU+lHthFK
 kUS9gIkqq8u8E2tCNL6WnWQun+PvhcGV5xIDvc26QylzqvS/haXAXUCQjddadsg8sgsSlQC0
 UeEmd7sDzFjvLCZDHma7Lq8qTKpJTNTKncPYyIBRwYJ79Tv5oYpgXryos1LGaOvy9mwEjbqz
 nXT9m41hq4YiogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:NORAwqyyi8n9X92w1gZgKrPwGr1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: =?us-ascii?q?9a23=3Aep/9WWpzxEVgUh9uTVUZ/CrmUek/U0CC8GnWGAi?=
 =?us-ascii?q?bUmtQEKPNdlS1qJoxxg=3D=3D?=
X-Talos-MUID: 9a23:vQywywqnmdSyXULOHaYez2lbC9oy2I2kNGUyrJ4hgJanMBdMIDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="60706739"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:54:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id C667818000214;
	Sat, 28 Nov 2026 05:54:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 6DCD0CC1611; Fri, 27 Nov 2026 21:54:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/3] vim: correct CVE_PRODUCT mapping
Date: Fri, 27 Nov 2026 21:54:08 -0800
Message-Id: <20261128055410.1928584-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251474
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

The default "vim" mapping uses a vendor wildcard and also reports the
unrelated JetBrains Vim plugin and VSCodeVim extension.

Use "vim_development_group:vim" for the historical NVD configuration
identity and "vim:vim" for the active NVD dictionary CPE and configuration
identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef202e90a5f11e6c649c8c5812e507d9c8bae3c5)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/vim/vim_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index c492342ffb7..5465a6ef91c 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -1,5 +1,7 @@
 require vim.inc
 
+CVE_PRODUCT = "vim_development_group:vim vim:vim"
+
 PROVIDES = "xxd"
 
 RDEPENDS:${PN} = "ncurses-terminfo-base ${PN}-xxd"
-- 
2.35.6

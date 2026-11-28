Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2711.1795844897301429978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lnvdRc8m;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1124; q=dns/txt;
  s=iport01; t=1795844897; x=1797054497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rDExC7eNYdXy+GeJF7l6jQuDHwTQEZ5AAUDRmvuVrCI=;
  b=lnvdRc8mNHIDpMQT4ljsbnbsOxZ74l+tb8/WUD5dtfiQ95BMJX1BbUWo
   tr/aWAxSjDrZEanGGiJ6EkXwlQ9/03soHLu4Wu504thLZwj1/AZvx0iQV
   4dMKE38X2eRQ1dd4dyK4vmZ7BgRFzlEgKYYWvB7jhB/1vxqkCZoh5k2Ck
   HhDyQboyDwdgYLZKGeX7bqwr7z4jUiHzgHUFzojiDOhhhRfRZ8s6KDs4X
   K8sYA+1Va+miImDigxDuy1tMqz6IyitK11wOyJmuXLiVEpzXsBFB+Mgq2
   RgzxAiReUO1Cf/hOOJ++X4fI8JNItBv3iMjskcxCUK5w640jpsG5byeQ3
   g==;
X-CSE-ConnectionGUID: W9rx0TSASHOu0rk/UYofJw==
X-CSE-MsgGUID: fjUdhWR8SiuGACb7DYwvBg==
X-IPAS-Result: =?us-ascii?q?A0BBAgDIaQpr/9VK/pBRCYJZgld1YENJk1oBoRyBfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBY4lAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBU2AUYwXESDAgGCdAO6JIIsgQHgMQELFAGBOIVCiCV2hH4nGxuBc?=
 =?us-ascii?q?oR/hBd5hXkEgiKBDIFyjHOKIUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjO?=
 =?us-ascii?q?xeBBxsGBYEcgR6BEoEDW4ErJl0BIYEGgXYCglGCAAIBRkEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0McjkQMBwkLwUXJjwbB4EMJx0bF?=
 =?us-ascii?q?w4CKAYVIQtDGA1IESw3FRkEPm4HlBKDHIEOgV9QOpNskXihEQoog3mMJJU6G?=
 =?us-ascii?q?jOqcy6YWqRchGqBaDyBWXAVgyIJShkP4H8mMj0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:tv4OuaP7i7HavRHvrR24lsFynXyQoLVcMsEvi/4bfWQNrUokhj1Tz
 zcZDWrQP/mKYGOgKdB0bYTi9EIHuZKGnIM2S3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gW4sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68o/FlFuAbYxwcZQHDlU9
 rslGTcDTA/W0opawJrjIgVtrs0uNozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2M0BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FIqjOa2a4WFEjCMbctXo0qYm
 ViWxGXkLTgxPoOz+CWb2H3504cjmgu+Aur+DoaQ8/d2gFye2yofFRcRVED+q+O4g0iyc9hYL
 FAQ+yxopq83nGSxT9L9Vge05maZpBIdVvJUEusn+A+K16zY6hqYAW5CSSROAPQhrMIwSDkg2
 1OFkt+sDjt1vZWRSGmB7fGTtT60NC0fIGMOaCNCShEKi+QPu6k6gwiKSpNoF7S4y4SvXzrx2
 DuN6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:SrzpPKlblw/XD5/0FZ7U6uXt3DzpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AzUTlimvK1+QySBY67V1eX0nu6IsaI2fNlEvrCnS?=
 =?us-ascii?q?YLnsxUr7SdG6X9oF7xp8=3D?=
X-Talos-MUID: 9a23:JVXbQQVv+lbZ4+fq/DHuuT1iC/042KWzJ2kmm8oqitaaHyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="63463378"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:48:14 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 9F02018000214;
	Sat, 28 Nov 2026 05:48:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 35B72CC1611; Fri, 27 Nov 2026 21:48:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/2] vim: correct CVE_PRODUCT mapping
Date: Fri, 27 Nov 2026 21:48:09 -0800
Message-Id: <20261128054810.1655089-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251471
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
 meta/recipes-support/vim/vim_9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.2.bb b/meta/recipes-support/vim/vim_9.2.bb
index fee9f055e9a..d31d277faee 100644
--- a/meta/recipes-support/vim/vim_9.2.bb
+++ b/meta/recipes-support/vim/vim_9.2.bb
@@ -1,5 +1,7 @@
 require vim.inc
 
+CVE_PRODUCT = "vim_development_group:vim vim:vim"
+
 PROVIDES = "xxd"
 
 RDEPENDS:${PN} = "ncurses-terminfo-base ${PN}-xxd"
-- 
2.35.6

Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2710.1795844897301196803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WQUjKAmM;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1233; q=dns/txt;
  s=iport01; t=1795844897; x=1797054497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k6mjDWdZ0DMPZx5z1McbU0JMa3s/BpXvQm5O/nOYioc=;
  b=WQUjKAmMZOB5gp4h0KRB5U+xmvqDBOAl2wtjMayyA07N7JSXeow0X11h
   doYJy5ES+Lwn/Rn/rCO4Q5sxkCigYZUtNLuE0dNq8wOAK6uUgn8EbNW3c
   bDwRQ/ozTDNmRNCEGxKPoZloDjZ/Y5lHl7iPQ0I5XiNS21ik84WCfkYtp
   nuUVohBQPYCnnenY1motf9cv09BK1Za7P4wOfWekBEuaOf9upR8lt7roZ
   8ei+8Xgw+1VulQFeqgvYaynqI8fNVeD5f7tl3uCKlhrJfM+sQ84vG8glF
   a8sfj04/sOby6V8PE57ToNYcue4orlWNjL46ef5+j50H6N8F/91NqWhww
   w==;
X-CSE-ConnectionGUID: ymTVHN2gRnePdyIfqlz2Zg==
X-CSE-MsgGUID: EFS4TfPIQkCudP6znNJ7eQ==
X-IPAS-Result: =?us-ascii?q?A0BEAgDIaQpr/89K/pBRCYJZgld1YENJlksDnimBfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBQKOIwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXJATAgEDMgFGECAxKysZgwIBgnQDuiSCLIEB4DEBCxQBgTiFQogld?=
 =?us-ascii?q?oR+JxsbgXKEf4QXeYV5BIIigQyOZYohSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNbgSsmXQEhgQaBdgKCUYIAAgFGQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQxyORAwHCQvBRcmPBsHg?=
 =?us-ascii?q?QwnHRsXDgIoBhUhC0MYDUgRLDcVGQQ+bgeUEoMcPVGBHxlhFjqlZKERCiiDe?=
 =?us-ascii?q?YwklToaM6pzLphapFyEaoFoPIFZcBWDIglKGQ/gfyYyPQEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:SyTEqKPu5kCxerrvrR24lsFynXyQoLVcMsEvi/4bfWQNrUp01TEBm
 zQdUDrUOfnYZDOgfI11aI/k8hgPuZeBz4JiHnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gW4sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+RrMH8WG9cXwOB6OW1f1
 PIBLCJXXB/W0opawJrjIgVtrs0uNozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IwBPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FIqjOW1b4OIEjCMbeh7pRqkq
 FrnxmfSHx0ias6Z7xja/0v504cjmgu+Aur+DoaQ8/d2gFye2yofFRcRVED+q+O4g0iyc9hYL
 FAQ+yxopq83nGSxT9L9Vge05maZpBIdVvJUEusn+A+K16zY6hqYAW5CSSROAPQhrMIwSDkg2
 1OFkt+sDjt1vZWRSGmB7fGTtT60NC0fIGMOaCNCShEKi+QPu6k6gwiKSpNoF7S4y4WrXzrx2
 DuN6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:C9mfQqtkmyYF8+zQgg/qIyOj7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:ICvEsmHGoi0Fq9ILqmJ28XIqOuZ/fUfbwU/cMm62EGJ7Eo+aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A7+kAOw6AcUDBmx+1c3u+DSngxoxFzZ/yNE41sKw?=
 =?us-ascii?q?FkNSIDXJiPRG/0zmOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="63450715"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:48:14 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id A95AE180001C6;
	Sat, 28 Nov 2026 05:48:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 43B18CBF201; Fri, 27 Nov 2026 21:48:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/2] vim-tiny: add CVE_PRODUCT mapping
Date: Fri, 27 Nov 2026 21:48:10 -0800
Message-Id: <20261128054810.1655089-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261128054810.1655089-1-dkelaiya@cisco.com>
References: <20261128054810.1655089-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251470
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

The inherited "vim-tiny" identity has no vulnerability records even
though this recipe builds the official Vim source with the tiny feature
set, so source-aligned CVEs are missed.

Use "vim_development_group:vim" for the historical NVD configuration
identity and "vim:vim" for the current NVD dictionary CPE, configuration,
and CNA affected-data identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89ffb1fec8e7372b6e91ffb0b912f7a69270cf04)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-support/vim/vim-tiny_9.2.bb
index e4c26d23f69..426a45ead1c 100644
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb
@@ -2,6 +2,8 @@ require vim.inc
 
 SUMMARY += " (with tiny features)"
 
+CVE_PRODUCT = "vim_development_group:vim vim:vim"
+
 PACKAGECONFIG += "tiny"
 
 do_install() {
-- 
2.35.6

Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web08.4389.1627076741556932975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 14:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=VExiD5Yu;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=829; q=dns/txt; s=iport;
  t=1627076742; x=1628286342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CjWqJjxJtJeEXLzOk3QBIKVhG8V9pvSzQZYvLKPuTMQ=;
  b=VExiD5Yuid7rWvNvb0HejLEOWSVCY38s7C8/eAerYeD6SO6f32h0bw90
   R15+z8Siq/sak65Hw0qdhz7xycDMWjSI9JvG3UbW1WEtiZNyede8wJkos
   BcYFnb49iWxuxi5kD+h5yLUcaDXWAuOLNpCQXZQkxTZmLha2z4lnfZPbQ
   s=;
X-IronPort-AV: E=Sophos;i="5.84,265,1620691200"; 
   d="scan'208";a="725692445"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 Jul 2021 21:45:42 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 16NLjfTw000340
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 23 Jul 2021 21:45:42 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 8C7DECC128E; Fri, 23 Jul 2021 14:45:41 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ruslan Babayev <fib@cisco.com>
Subject: [OE-core][dunfell][PATCH v2 3/3] qemu: Enable seccomp if FEATURE is set
Date: Fri, 23 Jul 2021 14:45:27 -0700
Message-Id: <20210723214527.2225841-4-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <20210723214527.2225841-1-fib@cisco.com>
References: <20210723214527.2225841-1-fib@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ruslan Babayev <fib@cisco.com>
---
 meta/recipes-devtools/qemu/qemu_4.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
index 9c76144749..f9905e2812 100644
--- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
@@ -26,5 +26,6 @@ do_install_append_class-nativesdk() {
 PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
-- 
2.26.2.Cisco


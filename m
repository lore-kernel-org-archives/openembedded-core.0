Return-Path: <rruslich@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id D57A5781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1023; q=dns/txt; s=iport;
	t=1513605656; x=1514815256;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=6nxIoh+Smprt8DjZaggqEvehxaOo1I1Y652WVktgn2Y=;
	b=NjgWvslCjDvs6y7xZRKAmzsegLQ04VfvIkSwvvdDoSwGdiab76nCoNDA
	zaVE5lYv4wMYjhtnDgwt8FDVGt9DtAXrK/jH+Vx9mSJ5WfLswYdtigG9J
	B0MsdwKwvWqaJa/17tlY3Vo5UTcS/Mzz67AFBTntIU9SF/KWj0QcRu0ry s=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="45605333"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:51:35 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBR1009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:33 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:49 +0200
Message-Id: <1513605052-9357-4-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: [morty][PATCH 4/7] python.inc: set CVE_PRODUCT to python
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
X-List-Received-Date: Mon, 18 Dec 2017 14:00:55 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

All python versions are just python in NVD like this CVE
for python 3.4.4:

https://nvd.nist.gov/vuln/detail/CVE-2016-5699

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 848e1be494e8ea10c729f95f02acb366e1843d75)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-devtools/python/python.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 79a431c..a8c48e8 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "d7837121dd5652a05fef807c361909d255d173280c4e1a4ded94d73d80
 # also, exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
 
+CVE_PRODUCT = "python"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools
-- 
1.9.1



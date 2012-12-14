Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWrc-0001Ag-6b
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:07:49 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:52:20 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so2367104wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=luDWnLLs7iCLAFOk5ZJWnLxoXGI7mSVg9iMB88oaB1c=;
	b=nNuMWu+AQe6CwsYvK+1IfDAscxVs1nA7XL37b5u7qak1faC/AAENcnOz94XEx36k1p
	VQ27kPT8Ybupf3pI3jLh2WUxbWiZlaPWpBmT+2s4pBEjEgTL8KMd77dKh1RUnuMpQxGK
	88lRSDGCFgsqWjGQt4UW9Vamr9Cm3tZ0cFqK1GbKj8nWQe0HSnU+99OKb/k3W/KVkvor
	KqKpiIR9E/+ybQ0cgGk5iiHYRCPmpHpflVnC4I9NcqPsqhMIhIcED0rTuL/t4jyCvMrk
	AIqFvmWkekj+naS5LdxY7iZe99Ur2knGgFCKupUsCNbDz+m+zca7baghHQc1zbp725yM
	oPIg==
X-Received: by 10.180.101.104 with SMTP id ff8mr3123523wib.11.1355496788828;
	Fri, 14 Dec 2012 06:53:08 -0800 (PST)
X-Received: by 10.180.101.104 with SMTP id ff8mr3123463wib.11.1355496788176;
	Fri, 14 Dec 2012 06:53:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:16 +0000
Message-Id: <1355496684-1498-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmK4i7+7iTH88Uj1s/4jdohThA0ePjPMJmVmPBh/zXJwre6aS0+AHBxq5PuRvoS+HdXuSS16ls3+xtqpb/l6ck6ghNloOGzea1RMShrfObZ8mn3+qx5TegtCk2BzG/3pQPabsF/H30bH/xMBwG3mH2H4r8v2ZdEY8t6PzCO+JPg3AKELmRDear+ScNAnFXnm9N7dS5Z
Subject: [PATCH 1/9] curl: fix out-of-tree builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 15:07:50 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/curl/curl_7.26.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
index fef247c..c95788b 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.26.0.bb
@@ -38,7 +38,7 @@ CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
 CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
 
 do_configure_prepend() {
-	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
+	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
 }
 
 PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
-- 
1.7.10




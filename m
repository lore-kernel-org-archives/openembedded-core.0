Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC797707D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:00:00 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so56840964igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i9CC10zdfyajA+AfTkgFyahaI6SGjtrU3WVQef2i0Hk=;
	b=0pCSJfBT6UMKcX25FUN3ILGZ5V06XUj5AkpBjQaaTkfhDNnCEWCSFe5W6U8c50qGVz
	4mYlbW5dos8owhSafPXDXI6cICPQ4Zh8wlw1pM/qDNVNaOph/hL8E7I4N2KKFOajbVKW
	meQ2NdCuqnaoGNSHFtzEfWEdngMWG8VLXFkQ3Z4T+OtSQi1AFFcN00g0yARF0eWUCscF
	9VvwNqnwJWignVhGwpTDwh696m0hEKuMOoYmBljF0XkjJrx+1Pfd/6G31SK5vLDzpGLQ
	IzdzVZ4EhN1qSEqLWl5DAWMyRcIh2C8MzhAQNjHe3//Z4x2850LTEjFiJQywFnHISkbE
	sVqA==
X-Received: by 10.50.164.225 with SMTP id yt1mr20186546igb.76.1445281200294;
	Mon, 19 Oct 2015 12:00:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ot2sm8240489igb.17.2015.10.19.11.59.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 11:59:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:59:36 -0700
Message-Id: <1445281177-3309-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/5] tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
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
X-List-Received-Date: Mon, 19 Oct 2015 19:00:00 -0000

Use 'atom' as an alias for the first generation Intel Atom CPUs.
---
 meta/conf/machine/include/tune-atom.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 5e1bb74..24cd676 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -1,2 +1,2 @@
-# Atom tunings are the same as core2 for now...
-require conf/machine/include/tune-core2.inc
+# Alias for the first generation of Intel Atom CPUs.
+require conf/machine/include/tune-bonnell.inc
-- 
1.9.1



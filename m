Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id D533060D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:55:04 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so2095309wes.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dhD40w4cJ64pQ9mxD1/QNnmHH5tbjqkP4iDHenK6VaE=;
	b=g5yk+90HRisvmmOrRpeIWl4XZcFWovNQINt+etH2dn8LMdbAN2yWpO8DTvXinEZI71
	RZuTMESWJemE9k+R1pIikWtmTXVspk+Ma0sIk+VGq3gwwUsLQyJbVvYumj/flklpmAzQ
	l2k1qd/zdLcFBJEeMSPYQOGh4RU5VXAaZ5FiwS55R5YksF7JAiSykD0S8ugi3eRjSAFl
	QZT0sMN+ixCgxxaoe+PiHbfCTOlmAXeSdqzpZHvbPjTqPLnO8wCoEFyN8ED+h/JE9Qh/
	ksaKqrKwxpTVAJnJSi4ukz8O8+6wy+JBBfAelZcqJMYMreOsw0kSKnx6wUCX5GfuOfRJ
	SLtA==
X-Gm-Message-State: ALoCoQm5+lgvjBrbpqwD8228zy/sPBrmznkExugRpe4YBIF4NmcfrTTqCiAueQYGvEcjAhoF3jwh
X-Received: by 10.180.76.103 with SMTP id j7mr3883067wiw.58.1389376505412;
	Fri, 10 Jan 2014 09:55:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a9sm3686306wiy.10.2014.01.10.09.55.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:55:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:54:48 +0000
Message-Id: <1389376488-22286-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] cmake: default to out-of-tree builds
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
X-List-Received-Date: Fri, 10 Jan 2014 17:55:06 -0000

Set B=${WORKDIR}/build in cmake.bbclass so that recipes using cmake.bbclass do
out-of-tree builds by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 1dc406d2..3ac3fcc 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -1,4 +1,5 @@
 DEPENDS_prepend = "cmake-native "
+B = "${WORKDIR}/build"
 
 # We need to unset CCACHE otherwise cmake gets too confused
 CCACHE = ""
-- 
1.7.10.4



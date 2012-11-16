Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TZPlT-00082v-58
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 18:31:39 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 16 Nov 2012 09:17:38 -0800
Received: by mail-ea0-f197.google.com with SMTP id d14so157775eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 09:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ZV0X0Daocp38Z95h4H2aq00STyrEOjNKs8BxWEM0oGg=;
	b=SIqzK+MVTJ+GTYjN9lqt7wCHb32GNgDxth99hIZSr5z5LmAP5OH0JriKgO+hKk5huY
	/x7GY0+93NYL3c1EkREUyvTiVZfZI1usQzBMOZkc6EamOHQPKcQfBIUKNNATr4mOa19W
	Dk77vJfJsAaZKJs4/C3EagGJoDriC/du6VQ0dWFhvupzxHJcZdq5pNg9PuRtSzPdgZLL
	tmZvLj9iYbhUS1JhMOR0J7v0tPJP6+4HCKWCMdkXeiaKI665eMdAw8tgvtU/VUulyycM
	JOhhjUM2pLgYNPLXuxYzxqwn3YTQWibbR7+xr+oz5V4wTNNe4z63g+S4IAxlPcjjBMvn
	Gjyg==
Received: by 10.180.87.201 with SMTP id ba9mr6245132wib.1.1353086256879;
	Fri, 16 Nov 2012 09:17:36 -0800 (PST)
Received: by 10.180.87.201 with SMTP id ba9mr6245128wib.1.1353086256831;
	Fri, 16 Nov 2012 09:17:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id az2sm1583310wib.7.2012.11.16.09.17.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 09:17:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 17:16:07 +0000
Message-Id: <1353086167-5604-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1353086167-5604-1-git-send-email-ross.burton@intel.com>
References: <1353086167-5604-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnV+bYJRUfJMs2TYuLw7za4yAmnKIZKi+SxSpgnnVl9QDg86vf1z2DKJhM+YMBFRowsawZFj0ai2S9g/Jm4z9vKfplw4vJHvaNGWtD8sqh1O57MCcH8r27fvYIDUHtBXpqgVeimxNfqB5/j7I783hz1s5Yg57h4yz+GA28lWDBUM3PMkS4y2eiDAoCr9H7nIZ2jUufd
Subject: [PATCH 2/2] cmake.bbclass: use DEPENDS_prepend instead of += for cmake-native
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
X-List-Received-Date: Fri, 16 Nov 2012 17:31:39 -0000

Otherwise when a recipe using DEPENDS=, the cmake-native dependency disappears.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index eda45dd..54d4519 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -1,4 +1,4 @@
-DEPENDS += " cmake-native "
+DEPENDS_prepend = "cmake-native "
 
 # We need to unset CCACHE otherwise cmake gets too confused
 CCACHE = ""
-- 
1.7.10




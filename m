Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULgzE-0004XX-Dm
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 22:37:24 +0100
Received: by mail-ee0-f54.google.com with SMTP id e51so376625eek.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 14:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=9ddYFyhHQ94LivCPx0s7Xgrr9TM2Qn3EqtwwNmfLjGk=;
	b=yJZwy309KxBUZ3SoUeH3OPjOYsfxZcc1sZrQ5he7nRI7oLz13BESPrt1Sht+e8ZepG
	1BDz009P+f8UJw+Pcr44B+HaP6HnE+Sc2YfZBqmgnfjHF3YGSR1Yv7lh13rfMXv7JyJt
	T2RbyXIO3hJ2nxOuoptlZvuZbyUBG+W5CpqtbDC6k8W7ThMGzgNRu7fC3wa+Wu2r7kXm
	M3bFHSFxAf8Y3PL8j56tDSBpgPCT0PVjThPtsXntUWo8KtV8KTI+LZeSd8oCnIkLNX6y
	tJkjENJDXM2F14uogGQRIDWdyTnt9cAB33VqOkEZBJnO7BoqZqmMDJ2rHtMjqvSRLN3q
	m65w==
X-Received: by 10.14.218.71 with SMTP id j47mr11507913eep.28.1364592020231;
	Fri, 29 Mar 2013 14:20:20 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id f47sm6366494eep.13.2013.03.29.14.20.18
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 14:20:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 22:20:01 +0100
Message-Id: <1364592001-3562-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] seperatebuilddir.inc: remove reference to gtk+-native
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
X-List-Received-Date: Fri, 29 Mar 2013 21:37:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 06df5fd..a9ca240 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -222,7 +222,6 @@ B_pn-gtk+3 = "${SEPB}"
 B_pn-gtk-doc-stub = "${SEPB}"
 B_pn-gtk-doc-stub-native = "${SEPB}"
 B_pn-gtk-engines = "${SEPB}"
-B_pn-gtk+-native = "${SEPB}"
 ##make[1]: *** No rule to make target `data/gtkrc', needed by `all-am'.  Stop
 ##B_pn-gtk-sato-engine = "${SEPB}"
 B_pn-guile = "${SEPB}"
-- 
1.7.4.4




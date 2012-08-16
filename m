Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27sB-0003Vy-Q2
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:45:00 +0200
Received: by mail-wg0-f41.google.com with SMTP id ds1so907938wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=dUWmDXba9dGAq+psIhFzDRIxxp3x0qHEQT8SqC7pEGk=;
	b=l1nmWtnFoyTm/bM36LwR0UElNEblcyyuQWAzKpoV5dr3FwfWBHm6ysi4wedi+qv0sx
	iWHZigkhKmC3qsVWjyws6ns9/QevBavKnLzp7qjilCiHvtCOsblX8Oc/dl4esyUGQoHM
	SQsOzD1YNy5Y4oB47H1lAnI/W/sVSsb0Wi8Wo5pF8Ohi92SlA9118G7iUYVbQQJGnJUE
	UR0MOoa9+4xaLxAyKJ8OgrsdoRwj2ULG1SJGp1ss36inO9+jJBVv22NgpCE70K/ED1AD
	AWZtsX2nPg9+RyYNysAe+yBd1HXqoKdjRUUPjZJ5Zx8UJgs04XzA2HxHzD3YE0mo6IOv
	4pkg==
Received: by 10.180.84.104 with SMTP id x8mr9154161wiy.20.1345152784306;
	Thu, 16 Aug 2012 14:33:04 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:33:03 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:48 +0300
Message-Id: <3f88694096116da408832aad9afd90df386e0a36.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmsQ4lOrltxCpDUfr4T0bFGQ7GokFeOuLiGc4FjsN97/X9YeJnwNERPZ0eXlPtk2NPplocD
Subject: [PATCH 5/7] subversion: Add gettext to DEPENDS as msgfmt is needed at compile time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 21:45:00 -0000

Avoid error:
| /bin/bash: <path>/tmp/sysroots/i686-linux/usr/bin/msgfmt: No such file or
directory
| make: *** [subversion/po/de.mo] Error 127
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../subversion/subversion_1.7.2.bb                 |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
index 4f71de5..6b72e73 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -5,9 +5,11 @@ RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
 
+DEPENDS = "gettext"
+
 BBCLASSEXTEND = "native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
-- 
1.7.9.5




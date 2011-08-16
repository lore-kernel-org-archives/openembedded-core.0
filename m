Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QtQG4-0008PM-N9
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 22:29:08 +0200
Received: by yxi19 with SMTP id 19so248428yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/ULF3Jwk5uubthmapjlpxqiqs0ETDuB99Xu1OH3qvlg=;
	b=kefMEObM/PXaYG/QTNoKKZAPLkEr8iqoaTvrjPzw/V7NmmGOw7KU8iGAihpO/o7F/4
	mqXCvJwmIWEKpdFDHZInFjByAU4UWU6uMsBRPCZQ7KfX5WhNGzvPGesACo0eVTM35gUJ
	mFdhc3lk9cENhimVp7UZDTP+99yGE7QfJU1LU=
Received: by 10.236.115.73 with SMTP id d49mr435039yhh.245.1313526270575;
	Tue, 16 Aug 2011 13:24:30 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id a29sm462423yhj.17.2011.08.16.13.24.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 13:24:29 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:16:36 -0500
Message-Id: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH] angstrom-task-gnome: Added gedit to task-gnome dependencies
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
X-List-Received-Date: Tue, 16 Aug 2011 20:29:08 -0000

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
This patch can be applied  after these have been:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034413.html

 recipes-angstrom/tasks/angstrom-task-gnome.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index a2f9fae..75e59c6 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -41,6 +41,7 @@ RDEPENDS_task-gnome = " \
   gpe-scap \
   bash \ 
   tzdata \
+  gedit \
 "
 
 RRECOMMENDS_task-gnome = "ofono"
-- 
1.7.0.4




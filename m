Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULgzD-0004XK-29
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 22:37:23 +0100
Received: by mail-ea0-f171.google.com with SMTP id b15so368098eae.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=bDwvoyIKa0Ksm3QSALIOq4zNjyrkqUhVKf/A9DOr+a0=;
	b=Pzp+vfUO1G/RSWq8LwwE1eRVOflreXPAeyoZKidufqXV/mghZ2Q49BHa7GwPgasj6D
	8K3tLBe8zguRMvYtkvmu5bdk+4g98AtBg9daGcy5CFlJvbLJuegBICG5nFWliXJ0+qTG
	ugxBuphaTpADQoUDlbx/yF8izixOfSo/nHzrZ5BjUfOsm9+MPtL3JFNrbt3yCKI/Rn2B
	qGoJ8p+WkGWhp9WkbZgf/LvjKGHJXFY/HnQBdRti1EM32Ws863wnr8KsxfDYh8FDSbIl
	0yczNHUcT+PRyyWFRXrD4dRHNJFGkwODFrHH+OBxNxG0GYp1ztKmZz0Fc4hIz1lV4ZFW
	RIcQ==
X-Received: by 10.14.183.198 with SMTP id q46mr11848804eem.1.1364592018741;
	Fri, 29 Mar 2013 14:20:18 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id f47sm6366494eep.13.2013.03.29.14.20.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 14:20:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 22:20:00 +0100
Message-Id: <1364592001-3562-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] sstate.bbclass: remove reference to gtk+-native
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
X-List-Received-Date: Fri, 29 Mar 2013 21:37:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ce9f243..6a7c219 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -641,7 +641,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             return True
         return False
     def isPostInstDep(x):
-        if x in ["qemu-native", "gdk-pixbuf-native", "gtk+-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-update-icon-cache-native"]:
+        if x in ["qemu-native", "gdk-pixbuf-native", "qemuwrapper-cross", "depmodwrapper-cross", "systemd-systemctl-native", "gtk-update-icon-cache-native"]:
             return True
         return False
 
-- 
1.7.4.4




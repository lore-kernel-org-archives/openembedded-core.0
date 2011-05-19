Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMt2I-0008BV-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 04:32:26 +0200
Received: by pvc30 with SMTP id 30so1026182pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ckDsRHUeNz02/b/iNXwvSW6BZtLnfvHQuaqvlpjdDjA=;
	b=rrPfPK//viMDQ34UuRYMC8gsqMTAh9/9v4w9VrRlxZhqrKdd4/x9fN425xwRClmvoo
	wZ/oTP0wzy9spZflJ+TbJ2i240vWqgPX7MzDywIKadttCephnPxgbs8OsxNtX8vBV04H
	s/x1vbVk7NkLfLQGNOqKHJowFeAbMvAPyAAe4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=M17m20Qwo6MLItEtMEVty4zWkzb1Zv98MIVxWZ8QokedxuACOV0O9iCqY0WGb1hN0Y
	APK+CYo15Z/bcRR+a7vAWgPmYPxuN9g0301dwYWOzZaKSzdi3/IFV1mGhEugdRg29465
	JprJ1O+3CA0l5s7dELTN16fHIHQ+kcn9oi7uU=
Received: by 10.143.33.7 with SMTP id l7mr1411631wfj.228.1305772170960;
	Wed, 18 May 2011 19:29:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x15sm1066616wfd.12.2011.05.18.19.29.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 19:29:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2011 19:29:20 -0700
Message-Id: <cf5b76e465816605d56879a4df263082afecdcba.1305772107.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305772107.git.raj.khem@gmail.com>
References: <cover.1305772107.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] uclibc/site_config/funcs: getloadavg is unimplemented
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
X-List-Received-Date: Thu, 19 May 2011 02:32:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/site_config/funcs |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/site_config/funcs b/meta/recipes-core/uclibc/site_config/funcs
index ccc8539..79a3c19 100644
--- a/meta/recipes-core/uclibc/site_config/funcs
+++ b/meta/recipes-core/uclibc/site_config/funcs
@@ -121,7 +121,6 @@ gethostid
 gethostname
 getifaddrs
 getline
-getloadavg
 getmntent
 getmsg
 getnameinfo
-- 
1.7.4.1




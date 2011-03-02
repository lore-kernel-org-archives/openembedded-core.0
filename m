Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuhaO-0002L0-Qr
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 09:39:09 +0100
Received: by pwj9 with SMTP id 9so996421pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XN8zM5q84RL4t/4bNrUi/yTueriI3UiH2SL+KNBzPEc=;
	b=JRjXiYtTZ3RCiIxvIg28UdkZAPWg160jReK1wWo4E28EYTs2GZ0i383EkDmYsfTM86
	pMnUgJS8ASppboQmdGb0NpkDc9DIjK2nELLN7P2FU7Svz/+hYi3NQ5amIiQS22yXgaSp
	e+p6RlZUtRro2S2a1w49FFwJksnn5s7xfIFNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Z3Mp+Ru78eYUN5T3UzNLdQ3ovXJzRbxWBgZ1OWIUnNuRSu+x5/AlhYHGDM+x2dfof1
	/MsD8nvT70EwfaZTPJoVjyl2pFHvGz7jZPo0/91exf692V8ppYUtFwBEGtQijyPLhdVF
	R8wYSut/EdPi+9SwK46JoFK0oBLNpyNNS6brk=
Received: by 10.142.218.13 with SMTP id q13mr6204802wfg.416.1299055060813;
	Wed, 02 Mar 2011 00:37:40 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8708546wfl.14.2011.03.02.00.37.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:37:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 00:37:21 -0800
Message-Id: <1299055045-8096-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH v2 3/7] linux-libc-headers_2.6.37.2.bb: Add checksums
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
X-List-Received-Date: Wed, 02 Mar 2011 08:39:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linux-libc-headers_2.6.37.2.bb                 |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
index dc9d49a..888d9e4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -45,3 +45,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "nativesdk"
+SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
+SRC_URI[sha256sum] = "2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
-- 
1.7.4.1




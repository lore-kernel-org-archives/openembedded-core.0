Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwm-00028H-SW
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:13 +0100
Received: by ywg8 with SMTP id 8so1174514ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=nQN4gB7Rfl0ynvzbVlBa+J3nA3C1fRG4TKkp7mWwsRs=;
	b=nRz8OXijGGAFqMOWd/QdB8HygvMZCFsmSZMpTM/3GMibOcJISpnDcfuZckjuxwxfN6
	ohwXD8e94RpylbpnHlmiY32NoY878mfugyLBJy+zf42pRDRky9ReVIzJ3i+VX+qGqqhV
	FzCFdTLCqtFV8eBnq2wNeOUqdHnGrAkitiiQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=px+er1/kVc6gBlG9AKqYIepm9WCM8cQ3yj9lOFOKtkjG1L48M8HshMRXP+fp0ooZC6
	Hevv5Fsr/jw+LHb8FEHacmsRe+QOylSA8XHthftI/UiCSK1H0qw26ESlru8FtnEOLXst
	Ros9RkbAWiI89dlv0bOkFwQJ1UIMdo+VUl0Bo=
Received: by 10.236.187.101 with SMTP id x65mr157639yhm.224.1300378768162;
	Thu, 17 Mar 2011 09:19:28 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:27 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:08 -0700
Message-Id: <0a14457b62382fe24bfa2bbb1d1cd86acdb88723.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 10/12] packagedata: don't choke on empty PACKAGES
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:13 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/packagedata.py |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 7f0a89d..ee10a23 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -84,7 +84,8 @@ def _pkgmap(d):
             except OSError:
                 continue
 
-            for pkg in pkgdata["PACKAGES"].split():
+            packages = pkgdata.get("PACKAGES") or ""
+            for pkg in packages.split():
                 pkgmap[pkg] = pn
 
     return pkgmap
-- 
1.7.2.3




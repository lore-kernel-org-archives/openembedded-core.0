Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7D4m-000871-KI
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:42:12 +0200
Received: by gxk3 with SMTP id 3so328954gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=nOI+9i9Ac34Jl0A8PASlMWtvuw4fz3YF02EQ2JJXx34=;
	b=B5Oz5p8t2lOuTyqwhk2TgJZmM1zB3NyRorDe21l6dU6gn7IuKrKxegli1CLxlookk4
	fgCmjRvXy4phbd88qQ1jxO+NWVPxeLVepsYr5sOCd+Sykohpw9f6tiUsVCfHIPEUthhr
	p5JPvpCtyGaEW0hZIzaRnSHyrVbUSz6jzX5OE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VHGRQ8d1ZBSg4qi86DsQuYltaCiBLbjAtXW21MAcJBndJjoAD4Su5qIaJBbpRAG8nj
	EWVOrrAT56IBSkFTCeTheIeaHqJgVW+JITgaB8DL4riAcNMVqvXnyrk1gmPzg35mYaet
	pa0Mhdcl8+R6BBLI3VW/nnukpqqDj8qunyvz4=
Received: by 10.150.215.16 with SMTP id n16mr992338ybg.224.1302036005675;
	Tue, 05 Apr 2011 13:40:05 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id p28sm288105ybk.0.2011.04.05.13.40.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:40:05 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:39:57 -0700
Message-Id: <cd41608ac54d1aec88d55a2c66eac1dde627c4ff.1302035800.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] base: when using zip files, depend on unzip-native
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
X-List-Received-Date: Tue, 05 Apr 2011 20:42:12 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0a1aebf..7a11c9a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -269,7 +269,9 @@ def set_uri_depends(d):
 	    fetch_depends.add('osc-native')
 
 	root, ext = os.path.splitext(uri.path)
-	if ext == '.xz':
+	if ext == '.zip':
+	    unpack_depends.add('unzip-native')
+	elif ext == '.xz':
 	    unpack_depends.add('xz-native')
 
     fdepends = d.getVarFlag('do_fetch', 'depends') or ''
-- 
1.7.4.1




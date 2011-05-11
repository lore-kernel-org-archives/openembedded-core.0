Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK2yU-0007ri-BQ
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:32:46 +0200
Received: by pxi6 with SMTP id 6so159437pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dG5AsRuTEAe+X04KpZLvZzsseR1mljuZ73awv1OV1I8=;
	b=iQdEopJ5zur7iNzU4JdpQgov9yaJ0px3vrG596YNzzsLM7oIH26C8K0gFTEX+eaEhd
	nar5Yg/wC4n2iBzNM1oCc2l71Px1Z1tVYLVTpixR8T5VNUpkHlzuqYr5A5KABWdQpwTi
	zMo/y1EhSZi8302CVNRG/KwJ1KLaryxemj4Gk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iwsFuK2QE0U+LDypjgoPZ9XaAjhDg+uUXC8xOtxv2YEmCpFBjciFaga+ijb5+efmOl
	uwu+npc0pfnXJ/HM2cZiqKtnNeXPVdOFUqlspD3HG6LB9jyQkLlvhKy1o3JSBH0MSXWw
	PJGBlB6RbUNgr+40FY6SC7TGnq2CVbOg2uA4Q=
Received: by 10.68.69.50 with SMTP id b18mr8434289pbu.298.1305095399382;
	Tue, 10 May 2011 23:29:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d2sm5311548pbd.68.2011.05.10.23.29.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 23:29:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 23:29:55 -0700
Message-Id: <4d4aef2d2625c935f09c277d892df6860fd0e28d.1305095232.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305095232.git.raj.khem@gmail.com>
References: <cover.1305095232.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] metadata_scm.bbclass: Use COREBASE to grok for SCM operations
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
X-List-Received-Date: Wed, 11 May 2011 06:32:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/metadata_scm.bbclass |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 7112ad5..99ac05c 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -25,12 +25,9 @@ def base_detect_branch(d):
 			return rev.strip()
 
 	return "<unknown>"	
-	
-	
 
 def base_get_scmbasepath(d):
-	path_to_bbfiles = bb.data.getVar( 'BBFILES', d, 1 ).split()
-	return path_to_bbfiles[0][:path_to_bbfiles[0].rindex( "packages" )]
+	return bb.data.getVar( 'COREBASE', d, 1 )
 
 def base_get_metadata_monotone_branch(path, d):
 	monotone_branch = "<unknown>"
-- 
1.7.4.1




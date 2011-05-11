Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK1CG-0005M3-Ej
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 06:38:53 +0200
Received: by pzk36 with SMTP id 36so74766pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 21:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dG5AsRuTEAe+X04KpZLvZzsseR1mljuZ73awv1OV1I8=;
	b=lCGM8f3GlbD3vW2SqfGjMFhzFpj2z1fyp/WyYAtbmQwtOQ/u/9gwm1wIpIdYu/NC4F
	BZfo6hrhRs+EWwL8vmR7v+VXGEqD+ZqON4GjHRvvJ5AMevqI/HWh7dyHf3n0GEzbDO/L
	uC3Bi/A5UKbs/xxb2r17QxI54oTn32lupb9bI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VENoBHTu0TmTTi8cl11g+eCOxCzjoZJpoINZPmjdNxg5wg7gCI52AajL9kSOQV1S2F
	XEPhjgKSsbN3CEwfl3rYMsALtskJlTE7pFQ/BWa/6zLqaqBVQblrKdg+Ng3Za/chIUjz
	bc3zexcXiZgeDktTDo/nZai/ym0zB4HODnnr0=
Received: by 10.68.65.233 with SMTP id a9mr12661436pbt.187.1305088552027;
	Tue, 10 May 2011 21:35:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z7sm5256197pbm.53.2011.05.10.21.35.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 21:35:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 21:35:48 -0700
Message-Id: <4d4aef2d2625c935f09c277d892df6860fd0e28d.1305088327.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305088327.git.raj.khem@gmail.com>
References: <cover.1305088327.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] metadata_scm.bbclass: Use COREBASE to grok for SCM operations
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
X-List-Received-Date: Wed, 11 May 2011 04:38:53 -0000

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




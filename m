Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A6BF270F5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:57:54 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so22167351pac.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KQukv1TDZyU+vX/Wqp60tCl2X3c2nnqE+J8yg5ThrQo=;
	b=V6CDrpFJcLaTySLHfNboz5ThAmBPGNtMpQ+LY0Hd4db41gvKS2oAWx4m6438+lTWKU
	S1WJwHEG5Iu321pLtrtxC3IDceVwyHC/fxuwpDG8UDTxohnQAoLXCRByaldftrwyCpVf
	kHmgTsJ3LjYVdoIhDx7u/p9B3gpUNzqdTRWLmzeqr8QF1jnVyOYhWepEPdv0CuHBmNMq
	OI776wWO8icR/XsHamyN8jqZt/gBrHSx8xTCXELQeFmXzPwJOwa5TRWP5pYH2Kfw0rN0
	PS8rxqFycGYKrW7WPfkcIdBC/PDcisoLPcaln4Ogx17JCYXQhfMrrWMfbZbvsz4VbkpL
	foAQ==
X-Received: by 10.66.220.67 with SMTP id pu3mr15918196pac.43.1409007475457;
	Mon, 25 Aug 2014 15:57:55 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id bv5sm922487pbc.20.2014.08.25.15.57.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:57:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:57:42 -0700
Message-Id: <483e2f9eb1085db0958bb1ef9184814766bbd214.1409007366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409007366.git.chris_larson@mentor.com>
References: <cover.1409007366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409007366.git.chris_larson@mentor.com>
References: <cover.1409007366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/3] sanity: handle both \n and \\n in mirror vars
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Aug 2014 22:57:54 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index dbcc26b..7cfc4be 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -759,7 +759,7 @@ def check_sanity_everybuild(status, d):
         'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn://', \
         'bzr://', 'cvs://']
     for mir_type in mir_types:
-        mirros = (d.getVar(mir_type, True) or '').split('\\n')
+        mirros = (d.getVar(mir_type, True) or '').replace('\\n', '\n').split('\n')
         for mir in mirros:
             mir_list = mir.split()
             # Should be two members.
-- 
1.8.3.4



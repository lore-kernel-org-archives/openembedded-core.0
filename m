Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 96AA560FC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:02:25 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1VbnD0-000I62-Cq for openembedded-core@lists.openembedded.org;
	Thu, 31 Oct 2013 08:02:27 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.6/8.14.6) with ESMTP id
	r9V826LJ006623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 03:02:15 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX18dS8qnB+hdypYmoCN/NwbeR9vS1tGBLlM=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 03:02:03 -0500
Message-Id: <28cb7ae91795c2644d1995be9a61dd1c6ead4b7c.1383206227.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1383206227.git.blloyd@familyhonor.net>
References: <cover.1383206227.git.blloyd@familyhonor.net>
In-Reply-To: <cover.1383206227.git.blloyd@familyhonor.net>
References: <cover.1383206227.git.blloyd@familyhonor.net>
Subject: [PATCH 2/2] Removed trailing whitespace added with last commit
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
X-List-Received-Date: Thu, 31 Oct 2013 08:02:25 -0000

Signed-off-by: blloyd <blloyd@familyhonor.net>
---
 meta/classes/devshell.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index cc1bb64..552fa90 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -8,7 +8,7 @@ OE_DEVSHELL_TERMINAL_ADDL_EXPORTS[type] = 'list'
 python do_devshell () {
     import oe.data
     import oe.terminal
-    export_dev=d.getVar('OE_DEVSHELL_TERMINAL_ADDL_EXPORTS') 
+    export_dev=d.getVar('OE_DEVSHELL_TERMINAL_ADDL_EXPORTS')
     export_term=d.getVar('OE_TERMINAL_EXPORTS')
     export_term = export_term + ' ' + export_dev
     d.setVar('OE_TERMINAL_EXPORTS', export_term)
-- 
1.8.1.4



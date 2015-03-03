Return-Path: <Rob.Woolley@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61BB97382E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 21:32:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t23LWk4c026933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Mar 2015 13:32:46 -0800 (PST)
Received: from yow-rwoolley-lx.wrs.com (128.224.146.40) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 3 Mar 2015 13:32:46 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Mar 2015 16:32:44 -0500
Message-ID: <1425418365-16648-2-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1425418365-16648-1-git-send-email-rob.woolley@windriver.com>
References: <1425418365-16648-1-git-send-email-rob.woolley@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] nfs-utils: Identify CONFFILES
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
X-List-Received-Date: Tue, 03 Mar 2015 21:32:50 -0000
Content-Type: text/plain

Some package formats explicitly track which files are configuration files
so that they are not overwritten on updates. Explicitly list the
configuration files.

Signed-off by: Rob Woolley <rob.woolley@windriver.com>
--- meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -68,6 +68,12 @@ PACKAGECONFIG[nfsidmap] = "--enable-nfsi
 INHIBIT_AUTO_STAGE = "1"
 
 PACKAGES =+ "${PN}-client ${PN}-stats"
+
+CONFFILES_${PN}-client += "/var/lib/nfs/etab"
+CONFFILES_${PN}-client += "/var/lib/nfs/rmtab"
+CONFFILES_${PN}-client += "/var/lib/nfs/state"
+CONFFILES_${PN}-client += "/var/lib/nfs/xtab"
+
 FILES_${PN}-client = "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
 		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
 		      ${sbindir}/showmount ${sbindir}/nfsstat \


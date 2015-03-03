Return-Path: <Rob.Woolley@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47297737CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 21:32:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t23LWjJ7017168
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Mar 2015 13:32:45 -0800 (PST)
Received: from yow-rwoolley-lx.wrs.com (128.224.146.40) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 3 Mar 2015 13:32:45 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Mar 2015 16:32:43 -0500
Message-ID: <1425418365-16648-1-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Identify existing configuration files
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
so that they are not overwritten on updates.

This series explicitly identifies files that were already being packaged, 
but not known as configuration files.

I built the RPM packages and compared the output of rpm -qp --filesbypkg with 
rpm -qp --configfiles against the equivalent packages in CentOS 7.

 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb |    6 ++++++
 1 file changed, 6 insertions(+)

 meta/recipes-extended/logrotate/logrotate_3.8.8.bb |    2 ++
 1 file changed, 2 insertions(+)

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>


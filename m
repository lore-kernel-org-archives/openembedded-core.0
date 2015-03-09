Return-Path: <Rob.Woolley@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8024373970
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 23:53:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t29Nr0qx004690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Mar 2015 16:53:00 -0700 (PDT)
Received: from yow-rwoolley-lx.wrs.com (128.224.20.140) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 9 Mar 2015 16:53:00 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 19:52:55 -0400
Message-ID: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH v2 0/3] Identify existing configuration files
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
X-List-Received-Date: Mon, 09 Mar 2015 23:53:02 -0000
Content-Type: text/plain

Some package formats explicitly track which files are configuration files
so that they are not overwritten on updates.

This series explicitly identifies files that were already being packaged, 
but not known as configuration files.

I built the RPM packages and compared the output of rpm -qp --filesbypkg with 
rpm -qp --configfiles against the equivalent packages in CentOS 7.

 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb |    3 +++
 1 file changed, 3 insertions(+)

 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb |    7 +++++++
 1 file changed, 7 insertions(+)

 meta/recipes-extended/logrotate/logrotate_3.8.8.bb     |    3 +++
 1 file changed, 3 insertions(+)

UPDATE: I updated the patches to use the proper GNU Coding Standard directory
variables.  I also added a patch to add nfsmount.conf to nfs-utils-client as it 
seemed to be missing by accident rather than by omission.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>


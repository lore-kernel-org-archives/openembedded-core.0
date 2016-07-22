Return-Path: <Liam.Howlett@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE1346FFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 18:24:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6MIO7AQ018966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:24:07 -0700 (PDT)
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jul 2016 11:24:05 -0700
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2016 14:24:04 -0400
Message-ID: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Liam.Howlett@WindRiver.com
Subject: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Fri, 22 Jul 2016 18:24:09 -0000
Content-Type: text/plain

wget: Add --ssh-askpass support

This adds the --ssh-askpass option which is disabled by default.

--ssh-askpass will request the username and password for a given URL by
executing the external program pointed to by the environment variable
SSH_ASKPASS.  If the environment variable is not set, an error is
returned.  If an error occurs requesting the username or password, wget
will exit.

Upstream-Status: Pending

Liam R. Howlett (1):
  wget: Add --ssh-askpass support

 .../wget/0001-wget-Add-ssh-askpass-support.patch   | 221 +++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.18.bb            |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch

-- 
1.9.1



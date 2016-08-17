Return-Path: <Liam.Howlett@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFF46612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 19:05:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7HJ5CK3008522
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 12:05:12 -0700 (PDT)
Received: from yow-lhowlett-d0.corp.ad.wrs.com (128.224.56.234) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Aug 2016 12:05:11 -0700
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 15:05:10 -0400
Message-ID: <1471460711-6976-1-git-send-email-Liam.Howlett@WindRiver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Liam.Howlett@WindRiver.com
Subject: [PATCH v2 0/1] wget: Add --ssh-askpass support
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
X-List-Received-Date: Wed, 17 Aug 2016 19:05:14 -0000
Content-Type: text/plain

This adds the --ssh-askpass=COMMAND option which is disabled by default.

--use-askpass=COMMAND will request the username and password for a given
URL by executing the external program COMMAND.  If COMMAND is left
blank, then the external program in the environment variable
WGET_ASKPASS will be used.  If WGET_ASKPASS is not set then the
environment variable SSH_ASKPASS is used.  If there is no value set, an
error is returned.  If an error occurs requesting the username or
password, wget will exit.

Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>

Liam R. Howlett (1):
  wget: Add --ssh-askpass support

 .../0001-Add-use-askpass-COMMAND-support.patch     | 355 +++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.18.bb            |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/0001-Add-use-askpass-COMMAND-support.patch

-- 
1.9.1



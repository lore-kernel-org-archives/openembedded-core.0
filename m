Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D109703BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:57:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1vwQ8025045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 18:57:58 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Jul 2014 18:57:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jul 2014 21:57:55 -0400
Message-ID: <cover.1404987090.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH 0/1] postfix: add new recipe
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
X-List-Received-Date: Fri, 11 Jul 2014 01:58:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We ported postfix from openembedded a year ago, and updated it to 2.9.5,
now we are updating it to the latest stable release 2.11.1, and I'm
sending here to see if oe-core take it, if not, I will send it to meta-oe.

--
The following changes since commit a5776ae532d6af1e880ab1a712dc768c900f88db:

  sanity.bbclass: Update minimum git version to 1.7.8 (2014-07-08 11:19:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/uprev-postfix_140710-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/uprev-postfix_140710-1

Jackie Huang (1):
  postfix: add new recipe

 meta/recipes-extended/postfix/files/install.patch  |   66 ++++++
 .../postfix/files/internal_recipient               |    1 +
 meta/recipes-extended/postfix/files/main.cf_2.0    |  102 +++++++++
 meta/recipes-extended/postfix/files/makedefs.patch |  116 ++++++++++
 meta/recipes-extended/postfix/files/postfix        |   85 ++++++++
 .../postfix/files/postfix-add-db6-support.patch    |   26 +++
 .../recipes-extended/postfix/files/postfix.service |   14 ++
 meta/recipes-extended/postfix/postfix.inc          |  230 ++++++++++++++++++++
 meta/recipes-extended/postfix/postfix_2.11.1.bb    |    6 +
 9 files changed, 646 insertions(+)
 create mode 100644 meta/recipes-extended/postfix/files/install.patch
 create mode 100644 meta/recipes-extended/postfix/files/internal_recipient
 create mode 100644 meta/recipes-extended/postfix/files/main.cf_2.0
 create mode 100644 meta/recipes-extended/postfix/files/makedefs.patch
 create mode 100755 meta/recipes-extended/postfix/files/postfix
 create mode 100644 meta/recipes-extended/postfix/files/postfix-add-db6-support.patch
 create mode 100644 meta/recipes-extended/postfix/files/postfix.service
 create mode 100644 meta/recipes-extended/postfix/postfix.inc
 create mode 100644 meta/recipes-extended/postfix/postfix_2.11.1.bb

-- 
1.7.9.5



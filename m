Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D89F16A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 09:45:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s999jPkI016130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Oct 2014 02:45:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 02:45:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Thu, 9 Oct 2014 02:45:24 -0700
Message-ID: <cover.1412847857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] nss-myhostname: skip it when systemd
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
X-List-Received-Date: Thu, 09 Oct 2014 09:45:27 -0000
Content-Type: text/plain

The following changes since commit 16cedc3bce6fc37543e9ef053cd7c589e523ca1c:

  package_ipk.bbclass: Fix SRC_URI whitespace handling (2014-10-06 16:03:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/nss
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/nss

Robert Yang (1):
  nss-myhostname: skip it when systemd

 .../nss-myhostname/nss-myhostname_0.3.bb           |    6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.7.9.5



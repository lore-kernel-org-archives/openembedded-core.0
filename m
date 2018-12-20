Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE77BFA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:04:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBK84tPm017411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 00:04:55 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Dec 2018 00:04:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Dec 2018 00:04:53 -0800
Message-ID: <cover.1545293075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] create-pull-request: fix sed command for SUBJECT
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
X-List-Received-Date: Thu, 20 Dec 2018 08:04:54 -0000
Content-Type: text/plain

The following changes since commit 14c291e1fb6324da46885b69fbd7f01b3c6b053e:

  gcc-runtime: Add missing libc dependency (2018-12-18 16:19:30 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/cpr
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/cpr

Robert Yang (1):
  create-pull-request: fix sed command for SUBJECT

 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.10.2



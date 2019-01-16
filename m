Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 126807BDA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 06:08:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G68oou013426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:08:51 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 15 Jan 2019 22:08:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 14:27:07 +0800
Message-ID: <cover.1547620011.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: remove dependencies of SSTATE_EXTRAPATHWILDCARD
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
X-List-Received-Date: Wed, 16 Jan 2019 06:08:50 -0000
Content-Type: text/plain

The following changes since commit fa7020c040189ae904625b5c60c8a7e79dc1145e:

  perl: fix yet another race failure (2019-01-14 11:48:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sstate
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/sstate

Robert Yang (1):
  sstate.bbclass: remove dependencies of SSTATE_EXTRAPATHWILDCARD

 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.7.4



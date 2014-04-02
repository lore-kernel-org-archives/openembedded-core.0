Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6BA96EE4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 07:06:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3276giQ013494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Apr 2014 00:06:42 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 2 Apr 2014 00:06:42 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 2 Apr 2014 15:06:29 +0800
Message-ID: <1396422390-28115-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] Fix bash 3.2.48 getc_with_restart() error
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
X-List-Received-Date: Wed, 02 Apr 2014 07:06:44 -0000
Content-Type: text/plain

Hi Richard,

I checked that Yong Zhang from Wind River is the author of these 2 patches, and he sent to upstream and merged by bash 4.3.

I think this will NOT be a license violation with Yong Zhang's Signed-off-by. So resend it.

Yong Zhang (1):
  bash-3.2.48: fix error path of getc_with_restart

 .../bash-fix-error-path-of-getc_with_restart.patch | 41 ++++++++++++++++++++++
 .../bash-3.2.48/bash-fix-getc_with_restart.patch   | 28 +++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  2 ++
 3 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch

-- 
1.8.1.2



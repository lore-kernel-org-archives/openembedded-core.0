Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69BB979670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 23:25:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9GNOgVE012778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 16:24:53 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 16 Oct 2018 16:24:31 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Oct 2018 19:24:26 -0400
Message-ID: <20181016232427.15363-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <2d902e2e7fad998fdd1c22eea5c64ade52955e6a.camel@linuxfoundation.org>
References: <2d902e2e7fad998fdd1c22eea5c64ade52955e6a.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH v2] util-linux: fix alternatives setting for switch-root
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
X-List-Received-Date: Tue, 16 Oct 2018 23:25:02 -0000
Content-Type: text/plain

V2:

Fixed typo in previous version:
  -ALTERNATIVE_util-linux-switch-root
  +ALTERNATIVE_util-linux-switch-root
in keeping with the existing package name.

Adding util-linux-switch-root to an image works and
the dangling symlink in the sdk is also gone.





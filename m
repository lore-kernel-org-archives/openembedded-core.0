Return-Path: <Lu.Jiang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2646C6C497
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 07:56:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2J7uvBJ010172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 00:56:58 -0700 (PDT)
Received: from ljiang0-OptiPlex-9020.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 19 Mar 2019 00:56:56 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 15:54:49 +0800
Message-ID: <20190319075451.18823-1-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: libsoup:add a new routine & build as native package
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
X-List-Received-Date: Tue, 19 Mar 2019 07:56:57 -0000
Content-Type: text/plain


Hi all,

This rr including 2 patch:
1.add a new routine for libsoup with name soup_uri_to_string_with_password()
and make libsoup compiled as a native package.
2.make glib-networking compiled as a native package.

Make this change for ostree utilies, which needs libsoup when building ostree image
on host.

Thanks
Jiang Lu



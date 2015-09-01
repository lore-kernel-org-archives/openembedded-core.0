Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E64C77005
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:34:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t81LYV1G008272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 14:34:31 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 1 Sep 2015 14:34:30 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Sep 2015 14:34:28 -0700
Message-ID: <1441143270-27322-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/2] add ifupdown
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
X-List-Received-Date: Tue, 01 Sep 2015 21:34:31 -0000
Content-Type: text/plain

I'm not sure where this should go, but these patches are for oe-core.
This recipe overrides the versions of ifup and ifdown implemented
by busybox, if present.

This was copied, with one minor change, from meta-overc, as mentioned in
the first patch.

Joe Slater (2):
  ifupdown: import recipe
  ifupdown: create alternative links

 meta/recipes-core/ifupdown/files/99_network        |    1 +
 ...-don-t-rely-on-dpkg-architecture-to-set-a.patch |   56 +++++++++++
 ...-6-.defn-fix-inverted-checks-for-loopback.patch |  103 ++++++++++++++++++++
 meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb    |   54 ++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-core/ifupdown/files/99_network
 create mode 100644 meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
 create mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
 create mode 100644 meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb

-- 
1.7.9.5



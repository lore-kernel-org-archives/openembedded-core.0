Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80B3C6D19A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 18:33:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9NIXJgv026024
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 11:33:19 -0700 (PDT)
Received: from yow-kscherer-l1.wrs.com (128.224.147.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 23 Oct 2013 11:33:19 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2013 14:33:17 -0400
Message-ID: <1382553198-11119-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [Patch 0/1] pixbufcache.bbclass: gdk-pixbuf-query-loaders depends on libz
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
X-List-Received-Date: Wed, 23 Oct 2013 18:33:19 -0000
Content-Type: text/plain

Another native sstate minor issue. Reuse of native sstate file for
gdk-pixbuf-native fails in the pixbufcache_sstate_postinst. The file
gdk-pixbuf-query-loaders attempts to use the host libz. Adding the
dependency to zlib-native ensures the sstate for zlib-native is
available.

---
Konrad Scherer, MTS, Linux Products Group, Wind River


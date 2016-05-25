Return-Path: <andrew@bradfordembedded.com>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 77C2E62135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 19:46:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B25FD21134;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute3.internal (MEProxy); Wed, 25 May 2016 15:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=dF2We
	5+DRXxzLEhb/PUg9OArsvQ=; b=E4QbLXqHIMbAclaib42nyfDPOsCm2Ivhnu/Qz
	pcT856mwPbGNLR/uE0MpnS4aHBpIn4jmgJXc/zHKCkJcGnoKE7Xy5maRjVh3n+Ux
	/rqiz/tIHYTL5AdTxlrkUZzA53nS4MRWMxMLUUfFwo+YbCK8AAPMJmLnUYcMciHB
	RbKM78=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=dF2W
	e5+DRXxzLEhb/PUg9OArsvQ=; b=saz9PujQqN20n43CnVUYn9bZkbN/syAkC9eK
	h4cuGXkRcfDquc++MoJIjfbY4s7qz2B2NEUoNwxb2cLudtaiQ8n4i8QaZCaoCxNy
	j5WfEBAncVvavivnNR75+oQ1PN+iPpw+8vTv9FNUyMyKej5CQ46xtrKN5ZUg8xCu
	tQ6+KmA=
X-Sasl-enc: z6b6OMVWaLtaNVoM3GgkFUJsadkxMTiJAwA49myetdbv 1464205595
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4D99FCCD9A;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:46:10 -0400
Message-Id: <1464205571-26293-3-git-send-email-andrew@bradfordembedded.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: [PATCH 2/3] bitbake.conf: Add P4DIR and FETCHCMD_p4
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
X-List-Received-Date: Wed, 25 May 2016 19:46:37 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

So that perforce fetching can work more like the other source control
system fetchers.

Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index acef30b..1aa1d37 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -339,6 +339,7 @@ SVNDIR = "${CO_DIR}/svn"
 GITDIR = "${CO_DIR}/git2"
 BZRDIR = "${CO_DIR}/bzr"
 HGDIR = "${CO_DIR}/hg"
+P4DIR = "${CO_DIR}/p4"
 
 STAMPS_DIR ?= "${TMPDIR}/stamps"
 STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
@@ -618,6 +619,7 @@ FETCHCMD_cvs = "/usr/bin/env cvs"
 FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
+FETCHCMD_p4 = "/usr/bin/env p4"
 
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
-- 
2.8.1



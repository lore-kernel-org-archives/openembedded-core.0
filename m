Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B82D4726CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 16:25:11 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so20937626wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 08:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CiEgi6P2TmF4xhelrB0FwKxNiXAwYGv0zurFvd858lA=;
	b=BZj0bqNLr5JJS1ZuhJj4ArK3OUvM4PPZPzEz0o8v55O2IZbpCtgtUPW8TI4WRbEYVv
	sK+oF+KdIG935YoNIzHdZUyjlyameGsIwB3B0u2WRQ6i0IB3PrVuxAsk5SfK1MfMr4b9
	PHJm8LpF1FzDaDJMVuZs87XGLWSjzNywN82qsCqXahU9HGCR8IbEtqxdu/LXAu5vZYD6
	wZDivS9uLZSzbDSi3zpm8qDbtsFyN0v7hvJqKbODyvNSd73M/Ry0l+g3a6ffk6CMiq4/
	nfIGGW4WWP7/sTAL/GLBazvbThxWswdulTdzcF70YBSnk4hPlAR9SxwftrjSHRyuon7r
	KP5Q==
X-Gm-Message-State: ALoCoQl7vxoUnOGsT2QGrL8r+V54lRc0B6D7CsANiMRvmI/8935VEyPkPNfuPm0yOU8EJaPp7kKN
X-Received: by 10.194.184.199 with SMTP id ew7mr75358325wjc.85.1418833511346; 
	Wed, 17 Dec 2014 08:25:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id cs8sm21527940wib.1.2014.12.17.08.25.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Dec 2014 08:25:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Dec 2014 16:24:17 +0000
Message-Id: <1418833458-5858-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] which: add missing Upstream-Status
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
X-List-Received-Date: Wed, 17 Dec 2014 16:25:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/which/which-2.20/automake.patch |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/which/which-2.20/automake.patch b/meta/recipes-extended/which/which-2.20/automake.patch
index 92365dd..ef00bc9 100644
--- a/meta/recipes-extended/which/which-2.20/automake.patch
+++ b/meta/recipes-extended/which/which-2.20/automake.patch
@@ -1,3 +1,8 @@
+Update autoconf prologue to use "foreign" strictness.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 diff --git a/configure.ac b/configure.ac
 index d974461..a20dfa8 100644
 --- a/configure.ac
-- 
1.7.10.4



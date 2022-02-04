Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0600C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 12:46:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8468.1643978783314832908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 04:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 128D811D4
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Feb 2022 04:46:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C9423F774
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Feb 2022 04:46:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] common-licences: remove ambiguous "BSD" license
Date: Fri,  4 Feb 2022 12:46:17 +0000
Message-Id: <20220204124617.951524-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 12:46:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161343

Our "BSD" license is the 3-clause BSD license, but many recipes were
using "BSD" for any variation of the license.

We've mostly moved recipes away from the vague "BSD" license to concrete
names such as "BSD-3-Clause", so delete the BSD license to force the
remaining users to update their license statements.

[ YOCTO #14539 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/files/common-licenses/BSD | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta/files/common-licenses/BSD

diff --git a/meta/files/common-licenses/BSD b/meta/files/common-licenses/=
BSD
deleted file mode 100644
index c7a0aa4f941..00000000000
--- a/meta/files/common-licenses/BSD
+++ /dev/null
@@ -1,26 +0,0 @@
-Copyright (c) The Regents of the University of California.
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions
-are met:
-1. Redistributions of source code must retain the above copyright
-   notice, this list of conditions and the following disclaimer.
-2. Redistributions in binary form must reproduce the above copyright
-   notice, this list of conditions and the following disclaimer in the
-   documentation and/or other materials provided with the distribution.
-3. Neither the name of the University nor the names of its contributors
-   may be used to endorse or promote products derived from this software
-   without specific prior written permission.
-
-THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
-ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPO=
SE
-ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
-FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTI=
AL
-DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRI=
CT
-LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WA=
Y
-OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-SUCH DAMAGE.
--=20
2.25.1



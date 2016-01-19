Return-Path: <Liam.Howlett@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 350F46FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 20:20:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0JKKIE2024194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 12:20:18 -0800 (PST)
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 12:20:18 -0800
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 15:20:16 -0500
Message-ID: <1453234817-29076-1-git-send-email-Liam.Howlett@WindRiver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Liam.Howlett@WindRiver.com
Subject: [PATCH] toolchain-shar-relocate.sh: Detect python binary and location.
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
X-List-Received-Date: Tue, 19 Jan 2016 20:20:18 -0000
Content-Type: text/plain

If /usr/bin/python does not exist, the exec of the toolchain relocation script
will fail.  This was the case with FC23 without python2 installed.  Since the
SDK extraction already contains python3 support, the fix only requires checking
for the correct interpreter.


Liam R. Howlett (1): meta/files/toolchain-shar-relocate.sh: Detect different
python binaries     and select one that exists.

 meta/files/toolchain-shar-relocate.sh | 19 +++++++++++++++++-- 1 file changed,
 17 insertions(+), 2 deletions(-)

-- 2.1.4



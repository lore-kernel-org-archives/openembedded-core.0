Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3bYQ-0004ZP-VL
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 00:06:27 +0100
Received: by dado14 with SMTP id o14so2202792dad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 14:57:54 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.218.228 as permitted sender) client-ip=10.68.218.228; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.218.228 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.218.228])
	by 10.68.218.228 with SMTP id pj4mr21783576pbc.167.1330729074941
	(num_hops = 1); Fri, 02 Mar 2012 14:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LnoYx3Ggp+oq5fevAkJAGhe5fgUCOS6SjMq6YtrNB4k=;
	b=kERKktYoeYXq841mLHQwbIdQ79N5G0jWRWzOP+OtZljEEgOO78DMwaaBFLXcMTA2fW
	W6e5NS5Ih6vZ45TFlfTk5zotFnRChmzumFE3H1HwrQEkfXdhFnEMEkaQ8GM45X2Mn7CE
	aOrMJ20JOAFmqXzNNEyzRnnBBQiNsbVtJCzaNzpqWIjXhGAvDUwk2nhSVgrG6L3yCA4h
	l3PxS74rYlutLy1OAcbVUY1UqVBpIVyzE6tl5K04Saa8kCH5LgPo762lOuW0nrfLCCQO
	nYVY8QRzN7T2IvHyE3z1caZTopUnqICX6rSJDo3m9pQka1tI/2AJDBdxytEZOUT2Us6V
	Qpbw==
Received: by 10.68.218.228 with SMTP id pj4mr18232622pbc.167.1330729074847;
	Fri, 02 Mar 2012 14:57:54 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id f5sm6118286pbe.26.2012.03.02.14.57.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 14:57:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2012 14:57:28 -0800
Message-Id: <1330729048-22399-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] eglibc-testing: Fix testing script to work well with dash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 23:06:27 -0000

Dash did not like >& so we do 2 >& 1 > /dev/null

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-testing.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-testing.inc b/meta/recipes-core/eglibc/eglibc-testing.inc
index c30409f..a5ce773 100644
--- a/meta/recipes-core/eglibc/eglibc-testing.inc
+++ b/meta/recipes-core/eglibc/eglibc-testing.inc
@@ -47,7 +47,7 @@ then
 	echo "Please specify the target machine and remote user in form of user@target"
 	exit 1;
 fi
-ssh \$target ls \$PWD\ >& /dev/null
+ssh \$target ls \$PWD\  2>&1 > /dev/null
 if [ "x\$?" != "x0" ]
 then
 	echo "Failed connecting to \$target it could be because of:"
-- 
1.7.5.4




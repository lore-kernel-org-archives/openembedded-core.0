Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA6373CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 13:45:55 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so42519492qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=w54MQf6Fft0TYHw+775xI5AzMZqvySop9F9ksMXo9ko=;
	b=p4n4XUlRBuvx+CDRjljpqCPD5rvaV0Q6h1t0gyzHmc44IOeH0bbibW0sFPnGCNZ/Rn
	7ujTK5ZbocOfwLKqJmvAJicMcnwcTUm6cPajX+B1gavL5gus/OCztPj8n23qPlpQHUyj
	jdUMbqMOsvyQIdxg8EUemXDvoveG20Ii6ZvfUZIPbAqwkxoxGp/S05H8+Z5q1iS/Xf7q
	q1ZDwcnTHDUqEwQq4qNV9uJeZBYKdBZHE9399+lmwf+OPrv75SuwBRMtss3jTThFlH1P
	J6RIr0L7ijMQiiVKa6uX7Qt8h6JH4ho1OHvAcno7TqMwTWmxjssvEMDbiCJ+bGb+puXD
	FqHg==
X-Received: by 10.140.97.203 with SMTP id m69mr53926194qge.39.1427895956708;
	Wed, 01 Apr 2015 06:45:56 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id g31sm1286241qge.11.2015.04.01.06.45.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 06:45:56 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Apr 2015 10:45:45 -0300
Message-Id: <1427895945-4919-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] useradd_base.bbclass: typo fixes (s/scucess/success/)
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
X-List-Received-Date: Wed, 01 Apr 2015 13:45:56 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/classes/useradd_base.bbclass |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index c47b1eb..4398a25 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -29,7 +29,7 @@ perform_groupadd () {
 			fi
 			count=`expr $count + 1`
 			if test $count = $retries; then
-				bbfatal "Tried running groupadd command $retries times without scucess, giving up"
+				bbfatal "Tried running groupadd command $retries times without success, giving up"
 			fi
                         sleep $count
 		done
@@ -57,7 +57,7 @@ perform_useradd () {
 		       fi
 		       count=`expr $count + 1`
 		       if test $count = $retries; then
-				bbfatal "Tried running useradd command $retries times without scucess, giving up"
+				bbfatal "Tried running useradd command $retries times without success, giving up"
 		       fi
 		       sleep $count
 	       done
@@ -99,7 +99,7 @@ perform_groupmems () {
 					rm -f $rootdir${sysconfdir}/gshadow
 					rm -f $rootdir${sysconfdir}/gshadow-
 				fi
-				bbfatal "Tried running groupmems command $retries times without scucess, giving up"
+				bbfatal "Tried running groupmems command $retries times without success, giving up"
 			fi
 			sleep $count
 		done
@@ -131,7 +131,7 @@ perform_groupdel () {
 			fi
 			count=`expr $count + 1`
 			if test $count = $retries; then
-				bbfatal "Tried running groupdel command $retries times without scucess, giving up"
+				bbfatal "Tried running groupdel command $retries times without success, giving up"
 			fi
 			sleep $count
 		done
@@ -159,7 +159,7 @@ perform_userdel () {
 		       fi
 		       count=`expr $count + 1`
 		       if test $count = $retries; then
-				bbfatal "Tried running userdel command $retries times without scucess, giving up"
+				bbfatal "Tried running userdel command $retries times without success, giving up"
 		       fi
 		       sleep $count
 	       done
@@ -189,7 +189,7 @@ perform_groupmod () {
 			fi
 			count=`expr $count + 1`
 			if test $count = $retries; then
-				bbfatal "Tried running groupmod command $retries times without scucess, giving up"
+				bbfatal "Tried running groupmod command $retries times without success, giving up"
 			fi
 			sleep $count
 		done
@@ -219,7 +219,7 @@ perform_usermod () {
 		       fi
 		       count=`expr $count + 1`
 		       if test $count = $retries; then
-				bbfatal "Tried running usermod command $retries times without scucess, giving up"
+				bbfatal "Tried running usermod command $retries times without success, giving up"
 		       fi
 		       sleep $count
 	       done
-- 
1.7.10.4



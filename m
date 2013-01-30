Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0YaN-0002FG-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:24:43 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662p007211; Wed, 30 Jan 2013 14:06:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q6U2KhHI5705; Wed, 30 Jan 2013 14:06:07 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE61kd007171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:02 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDx-00082u-CP; Wed, 30 Jan 2013 14:01:13 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:00:56 +0000
Message-Id: <0f303a349d4dd899e68c5356d4cac1319bce6eb0.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/17] sstate: Move debug comment to more logical place
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 14:24:44 -0000

The same log message gets output multiple times in the log which look
confusing and is rather pointless. Move the log message to the correct
level.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index edddd2f..a79d2b5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -146,8 +146,8 @@ def sstate_install(ss, d):
         locks.append(bb.utils.lockfile(lock))
 
     for state in ss['dirs']:
+        bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
         for walkroot, dirs, files in os.walk(state[1]):
-            bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
             for file in files:
                 srcpath = os.path.join(walkroot, file)
                 dstpath = srcpath.replace(state[1], state[2])
-- 
1.7.10.4




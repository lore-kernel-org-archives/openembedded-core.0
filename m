Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Ya3-0002FG-Kd
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:24:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662o007211; Wed, 30 Jan 2013 14:06:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tQi97jDevxSe; Wed, 30 Jan 2013 14:06:06 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE60Uw007170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:02 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDx-00082p-1q; Wed, 30 Jan 2013 14:01:13 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:00:55 +0000
Message-Id: <7c8a616c499c777b33ce15506eb6137645024037.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/17] multilib.conf: Use BASELIB to set baselib, not hardcode the value
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
X-List-Received-Date: Wed, 30 Jan 2013 14:24:22 -0000
X-List-Received-Date: Wed, 30 Jan 2013 14:24:22 -0000
X-List-Received-Date: Wed, 30 Jan 2013 14:24:22 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/multilib.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 97b53ec..f86cff0 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,5 +1,5 @@
 
-baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
+baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or d.getVar('BASELIB', True)}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
-- 
1.7.10.4




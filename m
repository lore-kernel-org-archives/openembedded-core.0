Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0YZX-0002FG-Eg
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:23:56 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE6CjK007260; Wed, 30 Jan 2013 14:06:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l+te8tJt1deB; Wed, 30 Jan 2013 14:06:13 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE65OB007198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:07 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YE1-000842-U6; Wed, 30 Jan 2013 14:01:17 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:10 +0000
Message-Id: <c9683f65462fdbe2c0f3034f1740fd6bad721bf4.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 17/17] directfb: Explictly disable mesa
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
X-List-Received-Date: Wed, 30 Jan 2013 14:24:09 -0000

Without this, directfb might build with mesa enabled if present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/directfb/directfb.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index c9b8ff8..aecc834 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -31,6 +31,7 @@ EXTRA_OECONF = "\
   --enable-sdl=no \
   --enable-vnc=no \
   --disable-x11 \
+  --disable-mesa \
 "
 
 #PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
-- 
1.7.10.4




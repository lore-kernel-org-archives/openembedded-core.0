Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZs-0005c2-UQ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:37 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=igsDiPf5GSls5cRpe08UdI4qMFxFzn0Fgd27hkR56TE=;
	b=WelZUmt2A6uL/mwtjuS/I6bAV94SfPySD8/KLgwQ86+seggsMHI1Q4Ey4YKMoEWdAL
	G7brxOqNHziKkS2qgCE7NFDFfbtr+IKFzuRhYkk1YvgB5xnTVyVqMtwSYY16pQGku+fq
	IH91f7rArhWvIomObHAzib0p1WJ/mQmVAwcB2pKoN8kvxmlKox1IK76m1VldWACte2GI
	gXJmYIXBuCjYGboZOCukxWtSeVNXMpzfIth88i1cnLIYjkN28gOnhfVQObGQkcc+Pofz
	yxPbCD1KBKoR0TRPsoLiEecuNGWMU3gry6FZBVsdQLm1mSm2QjrSbXK4O/WP967aL6zK
	obCQ==
Received: by 10.68.219.166 with SMTP id pp6mr64218018pbc.35.1337571391900;
	Sun, 20 May 2012 20:36:31 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:40 -0700
Message-Id: <22ce249a814f750bc47ead9ce281fcbd63c775c8.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 05/14] kernel-arch.bbclass: Map mips64{el} to mips KARCH
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
X-List-Received-Date: Mon, 21 May 2012 03:46:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-arch.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index d37c1fb..e186422 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -23,7 +23,7 @@ def map_kernel_arch(a, d):
 	if   re.match('(i.86|athlon|x86.64)$', a):	return 'x86'
 	elif re.match('arm26$', a):		        return 'arm26'
 	elif re.match('armeb$', a):		        return 'arm'
-	elif re.match('mipsel$', a):		        return 'mips'
+	elif re.match('mips(el|64|64el)$', a):	        return 'mips'
 	elif re.match('p(pc|owerpc)(|64)', a):		return 'powerpc'
 	elif re.match('sh(3|4)$', a):		        return 'sh'
 	elif re.match('bfin', a):                       return 'blackfin'
-- 
1.7.5.4




Return-Path: <stefansat@telenet.be>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Jul 2014 18:35:14 UTC
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	by mail.openembedded.org (Postfix) with ESMTP id 90CB57029E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 18:35:14 +0000 (UTC)
Received: from [192.168.65.2] ([84.198.230.176])
	by andre.telenet-ops.be with bizsmtp
	id WiWC1o00F3p0LaU01iWCEE; Fri, 25 Jul 2014 20:30:12 +0200
Message-ID: <53D2A234.60303@telenet.be>
Date: Fri, 25 Jul 2014 20:30:12 +0200
From: Stefan sat <stefansat@telenet.be>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Subversion does not support http protocol anymore
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
X-List-Received-Date: Fri, 25 Jul 2014 18:35:25 -0000
X-Groupsio-MsgNum: 55587
Content-Type: multipart/mixed; boundary="------------080602030203080507010806"

--------------080602030203080507010806
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hello since a certain time native subversion build of 
openembedded-oe-core does not support http protocol anymore.

I found out that it is just the missing neon-config script file.

Whitout this the subversion_1.7.10.bb builds whitout neon support.

It was just ok by removing binconfig-disabled by 
meta/recipes-support/neon/neon_0.30.0.bb

Then rebuild neon and subversion.

Included git patch file

Thank's

--------------080602030203080507010806
Content-Type: text/x-patch;
 name="neon-subversion-openemebedded-oe-core.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="neon-subversion-openemebedded-oe-core.patch"

From 23996da1c500a6851e98f93706b09dd819f17312 Mon Sep 17 00:00:00 2001
From: Christophe Van Reusel <christophe@stefan2l>
Date: Fri, 25 Jul 2014 19:01:28 +0200
Subject: [PATCH] Changed neon bb file to not inherit binconfig-disabled

neon-config script file needed to compile subversion with http support.

 Committer: Christophe Van Reusel <stefansat@telenet.be>

 Changes to be committed:

	modified:   meta/recipes-support/neon/neon_0.30.0.bb
---
 meta/recipes-support/neon/neon_0.30.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/neon/neon_0.30.0.bb b/meta/recipes-support/neon/neon_0.30.0.bb
index 61bd7d9..c257215 100644
--- a/meta/recipes-support/neon/neon_0.30.0.bb
+++ b/meta/recipes-support/neon/neon_0.30.0.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d165078
 
 BINCONFIG = "${bindir}/neon-config"
 
-inherit autotools binconfig-disabled lib_package pkgconfig
+inherit autotools lib_package pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
 EXTRA_OECONF += "--without-gssapi"
-- 
1.9.1


--------------080602030203080507010806--

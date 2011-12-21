Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rd9lM-0004TJ-W4 for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 01:10:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBL03PX9002581
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 00:03:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02341-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 00:03:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBL03Hbj002575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 00:03:18 GMT
Message-ID: <1324425799.3622.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 00:03:19 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] multilib.conf: Enable shadow-sysroot and libffi
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
X-List-Received-Date: Wed, 21 Dec 2011 00:10:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Enable these two core dependencies for multilib builds, fixing
multilib build failures that were occurring. I've checked and the
recipes are multilib capable.

[YOCTO #1835]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 1540f9c..87a3d86 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -163,6 +163,7 @@ BBCLASSEXTEND_append_pn-libdrm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-liberation-fonts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libevent = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libfakekey = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libffi = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libfm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libfontenc = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libgcc = " ${MULTILIBS}"
@@ -350,6 +351,7 @@ BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sgml-common = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-shadow = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-shadow-sysroot = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-shared-mime-info = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-slang = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-speex = " ${MULTILIBS}"




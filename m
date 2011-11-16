Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RQmxf-0002aW-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 22:24:03 +0100
Received: by mail-wy0-f175.google.com with SMTP id 8so1128420wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 13:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=jN8AFXSBolfpBaxcme9lvVpFElctzku68cQb8VDziHE=;
	b=YFoFohi2BojfKG02TyOdGg8HeVB9FDMza2gEo4YfEjngZchJn4UFG9QuD1DOvaTbPN
	T2+LiIlvj+ZQH2V+iFVKzuI5KSezHl5F3Vm+6IXL80kqLcKDZa4GXyqKqandWhgmv2S4
	oqAdQUNsEXUj82BN6TIIH2w+jMAfMYXHggluM=
Received: by 10.216.54.83 with SMTP id h61mr93982wec.6.1321478261238; Wed, 16
	Nov 2011 13:17:41 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Wed, 16 Nov 2011 13:17:21 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Nov 2011 14:17:21 -0700
X-Google-Sender-Auth: cEI3FexQSBPf-RTiokU0TPKNVd0
Message-ID: <CABcZAN=BW7pRGFfQ5RgeX=rwWWFdWo3iJk2Z4zD1oOapTrpdFQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] bitbake.conf: add a couple explicit vardeps
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
X-List-Received-Date: Wed, 16 Nov 2011 21:24:03 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0d6b3b8..c158c61 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -506,6 +506,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@bb.data.getVar(['FULL_OPTIMIZATION',
'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD', 1) == '1'], d, 1)}"
+SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"

 ##################################################################
@@ -717,6 +718,7 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES",
"usbgadget", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES",
"usbhost", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
+COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"


 # Make sure MACHINE isn't exported
-- 
1.7.7



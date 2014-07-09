Return-Path: <smennetrier@connected-labs.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 316E670290
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 14:24:54 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so7447368wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jul 2014 07:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IU81d+cvDBDwP1GgE29ax88n8j8LpnClFKaTwHI527Q=;
	b=I6iWPzpimwdD0at2j4G6VjeVPUhTI/mZyoW9dlA2zEfHSiYXQHd+zP+RUVem7/kzY5
	g7Ro2QKhp/g1t55IdJbUyhTulrkJHJQ/OgwC7xkBE68sr1O4S1u65+PkmqVHkIajBa8I
	c4QiY69DsNlwQjJAc+wTi92Umb8ShY8gZ/iYPChyroAX82gcvwto/aSnurOvxIJStMH9
	jrQlPlMR8oFa40MYqyv0RdALemNPDvgR4tedFitSI0hVa6PwbATGL0BLTE4D+U+0xRix
	xAGEYmI5YJIhWo+iDj2VAyiu/66Pz2EFrycVIKX7mU/Ro8Zgf8LGHNio7omR6V7ZJzwU
	vbOw==
X-Gm-Message-State: ALoCoQkzvTIoawABqdQ0tcAYrVPRCd3WyipgzGMYm19RgcGfj4Xhc6l2/Ec3iacYmltcKE38WPjH
X-Received: by 10.180.80.70 with SMTP id p6mr12209319wix.22.1404915895289;
	Wed, 09 Jul 2014 07:24:55 -0700 (PDT)
Received: from smennetrier-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	h3sm103689110wjz.48.2014.07.09.07.24.53 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jul 2014 07:24:54 -0700 (PDT)
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <smennetrier@connected-labs.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jul 2014 16:24:49 +0200
Message-Id: <1404915889-26159-1-git-send-email-smennetrier@connected-labs.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [dora][backport from master] apmd.service: Fix typo (not mandatory EnvironmentFile prefix)
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
X-List-Received-Date: Wed, 09 Jul 2014 14:25:03 -0000

From: Tobias Blom <tobias.blom@techne-dev.se>

Prefix to EnvironmentFile should be preciding the filenamn.

(From OE-Core rev: 1f694e4cb493b0737b6009382c0957e6837ebbed)

Signed-off-by: Tobias Blom <tobias.blom@techne-dev.se>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
index 62d6af1..ffab823 100644
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
@@ -3,5 +3,5 @@ Description=Advanced Power Management daemon
 After=remote-fs.target
 
 [Service]
-EnvironmentFile-= @SYSCONFDIR@/default/apmd
+EnvironmentFile=-@SYSCONFDIR@/default/apmd
 ExecStart=@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
-- 
1.8.3.2



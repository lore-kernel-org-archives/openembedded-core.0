Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0d-0004q3-Ib
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:55 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so571564pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7ZVVCnRckohuzn6M68YFMwcR0KLWq4kHi7WXaD+CCBw=;
	b=A8oS0skze8OJzxCriEYcLI0RI93PdwVCUMx/orw3B0eCbCEb1BW1fuqg/eeJLCtjJu
	rcYCq2hLSc3GkDaLdWGnAT2+sIoBwCEMystisE8vePBI9jQp1DU92dK6S6IAbK2TT+lD
	DLRYmdpyGioBrYzZuU8enSsdtGbPVuX3J9M3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Uo50tIyYKac0PigtYyqsElZhOeCc+ZphQQ7HmnoEuNa0/afVROgpeBugJIPMlvEbnk
	LHHWrnK5E9nS3wme2kGYZDbKnPg9LFFZ+Xp6jLDt7vCkOiAHT3GXqglahC/HZVCGgDHz
	zdOkhe3lfxeq0Lin4FeVLMbKONBBVPVLo71Sc=
Received: by 10.143.26.4 with SMTP id d4mr2621422wfj.243.1301632136403;
	Thu, 31 Mar 2011 21:28:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y2sm2382326wfd.20.2011.03.31.21.28.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:48 -0700
Message-Id: <d22a618d7ca6e992f2b3539c5089842d0d8541eb.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 13/46] gettext_0.17.bb: Use linux-uclibceabi instead of linux-uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.17.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.17.bb b/meta/recipes-core/gettext/gettext_0.17.bb
index 3a9f893..b9c4e1c 100644
--- a/meta/recipes-core/gettext/gettext_0.17.bb
+++ b/meta/recipes-core/gettext/gettext_0.17.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
           "
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
-SRC_URI_append_linux-uclibcgnueabi = " file://gettext-error_print_progname.patch;patch=1"
+SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
 
 SRC_URI[md5sum] = "58a2bc6d39c0ba57823034d55d65d606"
 SRC_URI[sha256sum] = "209638bb8e162f22c281145a34e220c66f1f6e9ff5e4c50c6f2ef2ded59537ba"
-- 
1.7.4.1




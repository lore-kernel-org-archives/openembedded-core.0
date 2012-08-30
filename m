Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1T75Nm-0004Ce-KF
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 16:06:06 +0200
Received: by qadc11 with SMTP id c11so214901qad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=MA4nD7y3hJC2j7ETr1wyKzKENt7qM28IHHjHx5e7xEI=;
	b=NYeUyVNhDrImE29HdHm8yYVXwNs9Y9i/oDODmZvC+pY9cP5cSMUQ9LAVJltFzFnXn2
	KqfaY+DA58BGWmbVLrTzmxT4ijEflnyawhZfc8CAdGumhRK/qMmozznygLgPwMKkZAW8
	x7Pz+gien0E+qwUxU/2LmKhabKOmslyJMcircwRZKJvgTBQSoICIWugMGJ7BrvcIU301
	voxVGla6TGCIcLZXcoKD29H2EzwLPZIGxKYJazbMZT2TS+1ibxTJTniJIenaRN5OUnaa
	5U350kE5c6F08xEoimY3SoC74vLeA6wjJmjgZ/IZTW8mw9/6zzsMsgJKLxIFUEZ1gTNV
	VbuA==
Received: by 10.224.196.73 with SMTP id ef9mr11382732qab.36.1346334830892;
	Thu, 30 Aug 2012 06:53:50 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id k6sm2656925qac.0.2012.08.30.06.53.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 06:53:50 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 30 Aug 2012 09:54:22 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2012 09:54:22 -0400
Message-Id: <1346334862-18868-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] sysstat: Explicitly disable sensors support.
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
X-List-Received-Date: Thu, 30 Aug 2012 14:06:06 -0000

Since no lmsensors recipe exists by default in oe-core, explicitly disable
support for it in sysstat. In my case sysstat would fail linking complaining
about undefined references when adding my own lmsensors recipe.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta/recipes-extended/sysstat/sysstat.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9da40a7..76c9252 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -9,6 +9,7 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
 
 inherit autotools gettext
 
+EXTRA_OECONF += "--disable-sensors"
 EXTRA_OEMAKE += 'LFLAGS=""'
 
 do_install() {
-- 
1.7.5.4




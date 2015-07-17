Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id DB0CF65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 20:01:32 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6HK1WHc032044 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 15:01:32 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015071715013214-1398967 ;
	Fri, 17 Jul 2015 15:01:32 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 14:59:28 -0500
Message-Id: <1437163168-1087-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.4.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/17/2015 03:01:32 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/17/2015 03:01:32 PM,
	Serialize complete at 07/17/2015 03:01:32 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-17_10:, , signatures=0
Subject: [PATCH] ncurses-terminfo-base: include screen-256color
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
X-List-Received-Date: Fri, 17 Jul 2015 20:01:33 -0000

Nominally tmux sets TERM=screen which we are including in
ncurses-terminfo-base. However, if tmux detects that it's running in a
terminal capable of 256-color output (e.g. xterm-256color), it will
instead use TERM=screen-256color. We aren't including that, and we ought
to be.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 087fc93..ffd80ee 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -176,7 +176,7 @@ do_install() {
 
         # include some basic terminfo files
         # stolen ;) from gentoo and modified a bit
-        for x in ansi console dumb linux rxvt screen sun vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree86 xterm-256color
+        for x in ansi console dumb linux rxvt screen screen-256color sun vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree86 xterm-256color
         do
                 local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
                 local basedir="$(basename $(dirname "${termfile}"))"
-- 
2.4.4



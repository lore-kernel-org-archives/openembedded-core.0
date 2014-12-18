Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 791A0728A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 20:57:29 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so2729074wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I0XkuKW310km/AGDeGpaJV6xNtT7GmTelNBYvQHTeEM=;
	b=Xz26ddJ+uTLKQTsk90qc0T7FqBPnV7F1fEWaQfQ7CdR9AqB3haaolFl9EmHcOxSg0I
	IRj1r8tIQmSGq1RGAwoPtwjEqO/wGRv+SQT8Mrebg5B97iUCmqPc5pDnNvgFUdoiShL+
	s0kX97OaVR32gceb9zzHBADc/B/OGOvxlkiIV2hGOFrw34sxgBA4sm/5oGgfwQM3GXKY
	1gYMrfpSvcDwCwDGotYasH7oDC+V86QnHtg/wgxgkXqx+1re72CM3V+JUxBH4J/b205k
	myqoTVf2feV1IgXiiS82I7t7Hzm4D8J9S6tWWLh45zZfxiEPBAqe5sCEJZlqANVByYjA
	d0GQ==
X-Gm-Message-State: ALoCoQneNdtO/gBaiBOpS0Cy8+hawPWeuaDYE8kQuR957PGdnuiSAs17ZQ8n6k6N/svixKnM1TJg
X-Received: by 10.194.246.167 with SMTP id xx7mr8139012wjc.118.1418936249878; 
	Thu, 18 Dec 2014 12:57:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id nb8sm11328774wic.7.2014.12.18.12.57.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 12:57:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 20:56:35 +0000
Message-Id: <1418936195-9717-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] common-licenses: add SMAIL_GPL
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
X-List-Received-Date: Thu, 18 Dec 2014 20:57:33 -0000

This is used by debianutils.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/files/common-licenses/SMAIL_GPL |  164 ++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 meta/files/common-licenses/SMAIL_GPL

diff --git a/meta/files/common-licenses/SMAIL_GPL b/meta/files/common-licenses/SMAIL_GPL
new file mode 100644
index 0000000..dfc3fd1
--- /dev/null
+++ b/meta/files/common-licenses/SMAIL_GPL
@@ -0,0 +1,164 @@
+This is the Debian GNU/Linux package debianutils.
+
+It is an original Debian package.  Programs in it were maintained by
+Guy Maor <maor@debian.org>, and are now maintained by Clint Adams
+<schizo@debian.org>.
+
+All its programs except readlink, savelog, and which may be
+redistributed under the terms of the GNU GPL, Version 2 or later,
+found on Debian systems in the file /usr/share/common-licenses/GPL.
+
+which is in the public domain.
+
+readlink is Copyright (c) 1997 Kenneth Stailey, and may also be
+distributed under the terms of the BSD copyright.
+
+savelog may be redistributed under the following terms: (The rest of
+this file consists of savelog's distribution terms.)
+
+#ident	"@(#)smail:RELEASE-3_2:COPYING,v 1.2 1996/06/14 18:59:10 woods Exp"
+
+		     SMAIL GENERAL PUBLIC LICENSE
+		       (Clarified 11 Feb 1988)
+
+ Copyright (C)  1988 Landon Curt Noll & Ronald S. Karr
+ Copyright (C)  1992 Ronald S. Karr
+ Copyleft (GNU) 1988 Landon Curt Noll & Ronald S. Karr
+
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license, but changing it is not allowed.  You can also
+ use this wording to make the terms for other programs.
+
+  The license agreements of most software companies keep you at the
+mercy of those companies.  By contrast, our general public license is
+intended to give everyone the right to share SMAIL.  To make sure that
+you get the rights we want you to have, we need to make restrictions
+that forbid anyone to deny you these rights or to ask you to surrender
+the rights.  Hence this license agreement.
+
+  Specifically, we want to make sure that you have the right to give
+away copies of SMAIL, that you receive source code or else can get it
+if you want it, that you can change SMAIL or use pieces of it in new
+free programs, and that you know you can do these things.
+
+  To make sure that everyone has such rights, we have to forbid you to
+deprive anyone else of these rights.  For example, if you distribute
+copies of SMAIL, you must give the recipients all the rights that you
+have.  You must make sure that they, too, receive or can get the
+source code.  And you must tell them their rights.
+
+  Also, for our own protection, we must make certain that everyone
+finds out that there is no warranty for SMAIL.  If SMAIL is modified by
+someone else and passed on, we want its recipients to know that what
+they have is not what we distributed, so that any problems introduced
+by others will not reflect on our reputation.
+
+  Therefore we (Landon Curt Noll and Ronald S. Karr) make the following 
+terms which say what you must do to be allowed to distribute or change 
+SMAIL.
+
+
+			COPYING POLICIES
+
+  1. You may copy and distribute verbatim copies of SMAIL source code
+as you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy a valid copyright notice "Copyright
+(C) 1988 Landon Curt Noll & Ronald S. Karr" (or with whatever year is
+appropriate); keep intact the notices on all files that refer to this
+License Agreement and to the absence of any warranty; and give any
+other recipients of the SMAIL program a copy of this License
+Agreement along with the program.  You may charge a distribution fee
+for the physical act of transferring a copy.
+
+  2. You may modify your copy or copies of SMAIL or any portion of it,
+and copy and distribute such modifications under the terms of
+Paragraph 1 above, provided that you also do the following:
+
+    a) cause the modified files to carry prominent notices stating
+    that you changed the files and the date of any change; and
+
+    b) cause the whole of any work that you distribute or publish,
+    that in whole or in part contains or is a derivative of SMAIL or
+    any part thereof, to be licensed at no charge to all third
+    parties on terms identical to those contained in this License
+    Agreement (except that you may choose to grant more extensive
+    warranty protection to some or all third parties, at your option).
+
+    c) You may charge a distribution fee for the physical act of
+    transferring a copy, and you may at your option offer warranty
+    protection in exchange for a fee.
+
+Mere aggregation of another unrelated program with this program (or its
+derivative) on a volume of a storage or distribution medium does not bring
+the other program under the scope of these terms.
+
+  3. You may copy and distribute SMAIL (or a portion or derivative of it,
+under Paragraph 2) in object code or executable form under the terms of
+Paragraphs 1 and 2 above provided that you also do one of the following:
+
+    a) accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of
+    Paragraphs 1 and 2 above; or,
+
+    b) accompany it with a written offer, valid for at least three
+    years, to give any third party free (except for a nominal
+    shipping charge) a complete machine-readable copy of the
+    corresponding source code, to be distributed under the terms of
+    Paragraphs 1 and 2 above; or,
+
+    c) accompany it with the information you received as to where the
+    corresponding source code may be obtained.  (This alternative is
+    allowed only for non-commercial distribution and only if you
+    received the program in object code or executable form alone.)
+
+For an executable file, complete source code means all the source code for
+all modules it contains; but, as a special exception, it need not include
+source code for modules which are standard libraries that accompany the
+operating system on which the executable file runs.
+
+  4. You may not copy, sublicense, distribute or transfer SMAIL
+except as expressly provided under this License Agreement.  Any attempt
+otherwise to copy, sublicense, distribute or transfer SMAIL is void and
+your rights to use the program under this License agreement shall be
+automatically terminated.  However, parties who have received computer
+software programs from you with this License Agreement will not have
+their licenses terminated so long as such parties remain in full compliance.
+
+  5. If you wish to incorporate parts of SMAIL into other free
+programs whose distribution conditions are different, write to Landon
+Curt Noll & Ronald S. Karr via the Free Software Foundation at 51
+Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.  We have not yet
+worked out a simple rule that can be stated here, but we will often
+permit this.  We will be guided by the two goals of preserving the
+free status of all derivatives of our free software and of promoting
+the sharing and reuse of software.
+
+Your comments and suggestions about our licensing policies and our
+software are welcome!  This contract was based on the contract made by
+the Free Software Foundation.  Please contact the Free Software
+Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
+USA, or call (617) 542-5942 for details on copylefted material in
+general.
+
+		       NO WARRANTY
+
+  BECAUSE SMAIL IS LICENSED FREE OF CHARGE, WE PROVIDE ABSOLUTELY NO
+WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE STATE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING, LANDON CURT NOLL & RONALD S. KARR AND/OR
+OTHER PARTIES PROVIDE SMAIL "AS IS" WITHOUT WARRANTY OF ANY KIND,
+EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF SMAIL IS WITH
+YOU.  SHOULD SMAIL PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
+NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL LANDON CURT NOLL &
+RONALD S. KARR AND/OR ANY OTHER PARTY WHO MAY MODIFY AND REDISTRIBUTE
+SMAIL AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+LOST PROFITS, LOST MONIES, OR OTHER SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
+(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE
+PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS) SMAIL, EVEN IF YOU HAVE
+BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY
+ANY OTHER PARTY.
-- 
1.7.10.4



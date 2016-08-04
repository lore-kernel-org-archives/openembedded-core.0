Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 444 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Aug 2016 13:35:22 UTC
Received: from root.phytec.de (mail.x-arc.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 010DB7665F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:22 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 9AEC7A00419
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275727-19328 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:50 +0200
Message-Id: <1470317274-27771-4-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 3/7] guile: remove dangling patch
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
X-List-Received-Date: Thu, 04 Aug 2016 13:35:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 .../files/opensuse/guile-turn-off-gc-test.patch    | 49 ------------------=
----
 1 file changed, 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-turn-o=
ff-gc-test.patch

diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-t=
est.patch b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-te=
st.patch
deleted file mode 100644
index e2a353e..0000000
--- a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.pat=
ch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Inappropriate [opensuse patch]
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D10096
-why this test is turned off.
-Index: guile-2.0.3/test-suite/tests/gc.test
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- guile-2.0.3.orig/test-suite/tests/gc.test	2011-10-15 09:34:40.00000000=
0 -0700
-+++ guile-2.0.3/test-suite/tests/gc.test	2012-01-13 21:52:10.282540355 -08=
00
-@@ -65,23 +65,23 @@
-       foo)))
-=20
-=20
--(with-test-prefix "gc"
--  (pass-if "Unused modules are removed"
--    (let* ((guard (make-guardian))
--           (total 1000))
--
--      (for-each (lambda (x) (guard (make-module))) (iota total))
-+;;(with-test-prefix "gc"
-+;;  (pass-if "Unused modules are removed"
-+;;    (let* ((guard (make-guardian))
-+;;           (total 1000))
-+;;
-+;;      (for-each (lambda (x) (guard (make-module))) (iota total))
-=20
-       ;; Avoid false references to the modules on the stack.
--      (stack-cleanup 20)
-+;;      (stack-cleanup 20)
-=20
--      (gc)
--      (gc) ;; twice: have to kill the weak vectors.
--      (gc) ;; thrice: because the test doesn't succeed with only
-+;;      (gc)
-+;;      (gc) ;; twice: have to kill the weak vectors.
-+;;      (gc) ;; thrice: because the test doesn't succeed with only
-            ;; one gc round. not sure why.
-=20
--      (=3D (let lp ((i 0))
--           (if (guard)
--               (lp (1+ i))
--               i))
--         total))))
-+;;      (=3D (let lp ((i 0))
-+;;           (if (guard)
-+;;               (lp (1+ i))
-+;;               i))
-+;;         total))))
--=20
1.9.1



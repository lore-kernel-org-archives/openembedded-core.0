Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web11.12490.1613500125771793631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 10:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=ccd8eusT;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1613500123;
	bh=Q0tHfzi6sPGWhUtE+IAhooOfIcQd+4KJVBsy6TXfZO0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=ccd8eusTY23FnpgqYt0Hnj/o8u+JV10TiOFgoHbj36kYy6RF8P0h56Ba40oMg9sVl
	 n/XZroPj43SLD9884kgu0bwYqbLJ2Cfy11uwo0XmXt5SuUOLjiSu6aKZaR3x0iR52F
	 0n5tMbp1LGUMTvD+qdvTnHU6Cdb+YiCy9ng4YLaY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1l32HU0lpH-00AjmS; Tue, 16
 Feb 2021 19:28:43 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: [PATCH] oe-selftests: add rpm to reproducible build selftest
Date: Tue, 16 Feb 2021 19:28:35 +0100
Message-Id: <20210216182835.31821-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ud8f/X1WNRpHoYtHn8rmHzAUd/c8zxaQ38ojnpc+cazo/1+dwK+
 lYJv5tcOSR1CrtslQw4vazwZPyH28/tXyfbhhVbifeBVAFTIAgRZOKKJToU8IIQoQEGaer8
 hjEKCAnwZMDZ4aL+n4baEx7R+TPoo40A+zIdP5/W+mHCn78pxEJLo2iACzDnyRx9F+38W5L
 uStW+no2nf1wwyWp57KAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jpUdKnVp6i8=:gv1KKn3OHKHxOGMIRhmm2u
 1NKpfXtU50jq0fmOcrB+IoJejWyZtSpzSJnq0GMoaSSiLPgGn92wksePi0huz5U+ZquRwHp7K
 bJdeOUG9PZE7QnzIF0E1KG9ttGtQOtAlP92VGzxNqE0M19JcubVKe3oYYVniqm/w9okKQ8bU+
 +JPwFTxe7gPCSZmXBXIqfbmvOSS9g4Tsg5sUWtxzwckV+AZR3mVZ57EkMiBN33thaG0s7189p
 nl9oRxbqcVWP/LRwKMgUkRgQnT6VVf4BPWqX53GubO7buZpGCd6F0g9meW9qhgAt0pJNIGyqR
 oZIN2jh1zfEZi73OAfHbwNkjsjrHt/ZjnKvuPc+bJGw8g1U0TrT0/x/a026EaqXRgdtVze/M8
 PdD30x2TVaQQ6iZcwMxoXR557nMT/+yvm+cayDAYWL622eZeb8/EW6c/0D6xWPewew8v8qeeA
 KrfqnJ0VH/MXaO5a+I5YVn9V+iVrqSXlwC9Q9hA176ZSl9sV7HcBw4ZvmOiBhwi4tbwJl02pC
 bYwf2EL/gPG5J4meemdOfLBhCl3/xRzwJeUccrk7+86hXBTThH3wmAMYI5nwuP0oFmH9EbC1o
 2A0eaYsh/1NcrzTitYxFF+ws/hoSJYS5yU1DHjGGxDwVQWW+u4gIAaL9NZ99s28ZpcLZBnR/8
 TKB3oA50z5q61y1ESm9MXYlSCEDU6HcCQ87YGYVdkfoU/Q7i06UNk++3Vcngq1E+3njXAIXkG
 jPj3BsQSj9Li2L89HeEevYXjI56yTnMLZk6TRMnnocxHpq2vMyTcK1L/kvesFtj6pKRkQQ9gw
 ThmIsVLMFH/f0GkA11hdyCjC21p7xoQbJvvkD0h2iKqgV+UEsOkgXaB0E6dv5QI4KahViugcv
 Vfee7EzKFaxEob54ipkw==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>

rpm packaging has shown good numbers wrt reproducible builds as well
when testing core-image-minimal locally:

 Reproducibility summary for rpm: same=3D4671 different=3D0 missing=3D0 to=
tal=3D4671

Thus enable it in the autobuilder to be more widely tested.

Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
=2D--
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py
index 32016f3e65..ae67afdd21 100644
=2D-- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -174,7 +174,7 @@ class DiffoscopeTests(OESelftestTestCase):
             self.assertTrue(os.path.exists(os.path.join(tmpdir, 'index.ht=
ml')), "HTML index not found!")

 class ReproducibleTests(OESelftestTestCase):
-    package_classes =3D ['deb', 'ipk']
+    package_classes =3D ['deb', 'ipk', 'rpm']
     images =3D ['core-image-minimal', 'core-image-sato', 'core-image-full=
-cmdline', 'world']
     save_results =3D False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
=2D-
2.30.0


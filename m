Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by mx.groups.io with SMTP id smtpd.web11.1002.1614620797635298466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=L6LsuUOA;
 spf=pass (domain: gmx.de, ip: 212.227.15.19, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1614620795;
	bh=BkTTT1p/G10cWTtu2a5Gr6E8horrElYK86cXEjpVNjQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=L6LsuUOAwCJtrihcr5ufeyX8Oa5byJtkElKJnZq/s2rz2SJne8yHUOene66DXVzQE
	 Txgos8gtKfiKuVikSm1qtnIs75L/OvugSpWbf53Jse9U9MQMjaPimuy7BDu3uPbTaB
	 zp06rCkwrwvXW4aC2Q723iAqT3fPVOp2RVUXTVdI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5Q5-1l2kWK0nd1-00FFoR; Mon, 01
 Mar 2021 18:46:35 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Subject: [PATCH] Add core-image-weston to reproducible build tests
Date: Mon,  1 Mar 2021 18:46:23 +0100
Message-Id: <20210301174623.16811-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:a2YKWgFo6SsQts8NTddmqPFldD2QADNPj/uOeMWkBdNgqPXIJ0K
 SLEFTIlaTZ4vDqRDclmN0GNq1N4Xmn4u9kgKRALIgmC+PiPXToZwEP2KSbMrqZj3atGaX4y
 s/+kBlTwXwQ6UHNSDIBpEpv5kgeDBV4W6kLz5B+U/pc+LyB3opk5A/jhV6mSWR+WULwbYrI
 FAv+jAjvYnkFzWtMq1a/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCcEl3CPpx8=:fBO3DPkWd8VNGweBEdFXMM
 AzSHyJm/M3BiMNhvsMOe9sHnAyItJwneGShlUQyPE8ZVitqFKfrXih9E5ecs39i8huwajtpDO
 lyZk8JnnGvJ6SP17qFrOOQn9Tt/+GG7zD6gJMiCBR21aE9X/LENrT0SapH1nw9KSclyQXGRPz
 BXs6QWCO8sKL2bEysEBvnNEXP/vWS/f7gS5SNXxKbHl7e5pNjtwuRhVQRtlNGWjFNvp5UOOl+
 ngwzCVDUXB/KElnfnVlPuyE0UDeasuW/Y+yhD4YroP9qNHopxJ3nodSzCrSyQ+LVTH4g8itHI
 vdTdNu/yN1qIEm8MopaVNNyJwhc5JYQZrEQnasz4g80iAsHiJ+hQOXRcY/3+vIC0UA5iL7Wc9
 ABlr0gZT1wIB/MRuWY7TcZOWdqL6wS+wwZJKgRDODHcpeRttnjTzYl5McUA1fhw85xsGBMuju
 kx1YUmEW9bTm5vxStJdNmuj6EhjiM4WRMZlYg0OhSZVBtITZCApO+pbDiJxLz+tVRfXVulM/Y
 9z/2HjGYhYV2MikrYZH3gru4UyFsPuDRF6jawnaKeyPrjYCNmjAKi5qC4lsTm3sv9R2jlJJ0l
 hzSaOw/LGxfrga3o0RJxYoUt9HBjko25lRsr/RZhZOEyMq6bOOWamG+2sn+yncwgaPtoUJ0Wi
 6BuFHK85lKkwVVdANDNywcVzs5IFR5QJDmTy6vh+EulkL02xw4HTUiINvCg8BuKmqX9ytTmCj
 ytJig6ltM87CgoaModnSaPUXJdtkMDwTlhyDDeieKfduYRjWRE8Nx4DEaVcTP3nyYDRZLFsz2
 DwsTuEW4M4XvcRRAsskKOMxLc+zz6Mq3eW8M/LRSkQKVF6QIKzNkfbTW+Yx7wy3P4lX9BmznR
 QjF9ybTwWteR+IRbLJMA==
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>

This change adds core-image-weston to the reproducible build test.
For this we also need to update the static-group and static-passwd.

Besides the world package build which includes the wayland package,
this adds a wayland/weston-based image to the reproducible build test.

Signed-off-by: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
=2D--
 meta-selftest/files/static-group             | 5 ++++-
 meta-selftest/files/static-passwd            | 3 ++-
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static=
-group
index 5487ed6e32..b2e0e2f870 100644
=2D-- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -19,4 +19,7 @@ tracing:x:519:
 pulse:x:520:
 bind:x:521:
 builder:x:522:
-_apt:x:523:
\ No newline at end of file
+_apt:x:523:
+weston-launch:x:524:
+weston:x:525:
+wayland:x:526:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/stati=
c-passwd
index f663361f4a..2cfd0c9b42 100644
=2D-- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -15,4 +15,5 @@ sshd:x:516:516::/:/bin/nologin
 pulse:x:520:520::/:/bin/nologin
 bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
-_apt:x:523:523::/:/bin/nologin
\ No newline at end of file
+_apt:x:523:523::/:/bin/nologin
+weston:x:525:525::/:/bin/nologin
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py
index bbc5c0d8a4..a510ad5200 100644
=2D-- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -155,7 +155,7 @@ class ReproducibleTests(OESelftestTestCase):
     package_classes =3D ['deb', 'ipk', 'rpm']

     # targets are the things we want to test the reproducibility of
-    targets =3D ['core-image-minimal', 'core-image-sato', 'core-image-ful=
l-cmdline', 'world']
+    targets =3D ['core-image-minimal', 'core-image-sato', 'core-image-ful=
l-cmdline', 'core-image-weston', 'world']
     # sstate targets are things to pull from sstate to potentially cut bu=
ild/debugging time
     sstate_targets =3D []
     save_results =3D False
=2D-
2.20.1


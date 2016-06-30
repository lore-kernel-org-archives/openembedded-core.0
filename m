Return-Path: <prvs=7989d91d95=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 304F362132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:18:23 +0000 (UTC)
X-AuditID: 0a000213-f79066d0000013b8-8f-57752a2e81b8
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	8F.40.05048.E2A25775; Thu, 30 Jun 2016 09:18:22 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 30 Jun 2016 09:18:22 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] pulseaudio: Disable unit tests
Thread-Index: AQHR0tpBLvvbcGPewkiI4+erTjwzqw==
Date: Thu, 30 Jun 2016 14:18:21 +0000
Message-ID: <1467296262-3088-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWyRiBPQ1dPqzTc4MFxOYs7P9+xOzB6nNu4
	gjGAMYrbJimxpCw4Mz1P3y6BO+PbsR6Wgka2ioObtjI1MDazdjFycEgImEh8OcbSxcgJZIpJ
	XLi3nq2LkYtDSOAEo8TfGY3sEM4sRomj144xglSxCRhJnLu+CcwWEYiWWDpjJjuIzSxgIPFu
	80ZWEFtYQF/i3fxNrBA1JhLtjU+YIWw9ieb2v0wgNouAqsTEWVfBangFPCSW7t0IFmcEuuL7
	qTVMEDPFJW49mc8EcZ2AxJI955khbFGJl4//QT0gJ/F/iwdEuZ7EjalT2CBsbYllC18zQ4wX
	lDg58wnLBEaRWUimzkLSMgtJyywkLQsYWVYxCuYmZuYY6qUWF5fll6TqJefnbmIEhjwXA5Pw
	DsY5U2wPMQpwMCrx8F4wKwkXYk0sK67MPcQozcGiJM6rIqQULiSQnliSmp2aWpBaFF9UmpNa
	fIiRiYPzEKMEB5eUSHFqXkpqUWJpSUY8KLLii4GxJdXAeCQtwu6WQQmj+GTjizfvCV3L8TY5
	UdBgf1lWqediacS2UxqJDyKV4q8+Uwm7Mv3a4nvPtTM/N2pdDf7hXxCTWvWuc+O5a2u1GiVu
	v219e7mWbUuRzrcdS9ucwl3c+b9X+kTU8WyfVBHaI75Kp/JGcl/sM1FJjer2zbMsXzL2ZM/2
	SCtsf7RBiaU4I9FQi7moOBEA0gTzQHUCAAA=
Subject: [PATCH] pulseaudio: Disable unit tests
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
X-List-Received-Date: Thu, 30 Jun 2016 14:18:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index 8a28ca7..accafe1 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -30,6 +30,7 @@ EXTRA_OECONF =3D "\
 		--without-zsh-completion-dir \
 		--with-udev-rules-dir=3D`pkg-config --variable=3Dudevdir udev`/rules.d \
                 ac_cv_header_valgrind_memcheck_h=3Dno \
+                --disable-tests \
 "
=20
 # soxr (the SoX Resampler library) doesn't seem to be currently packaged i=
n
--=20
2.5.5


Return-Path: <prvs=49955caf30=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 983C860119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:48:38 +0000 (UTC)
X-AuditID: 0a000213-f79066d0000013b8-43-577d7cb6d557
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	BA.5B.05048.6BC7D775; Wed,  6 Jul 2016 16:48:38 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 6 Jul 2016 16:48:38 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCHv2][master][krogoth] pulseaudio: Disable unit
	tests
Thread-Index: AQHR19AmBPFl+IQ7e0iafhZ3wCxdMA==
Date: Wed, 6 Jul 2016 21:48:37 +0000
Message-ID: <1467841683-6684-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWyRiBPQ3dbTW24QfNHOYs7P9+xOzB6nNu4
	gjGAMYrbJimxpCw4Mz1P3y6BO+PQwlNsBSfZKi6d+czYwLiftYuRk0NCwETi3+tXjBC2mMSF
	e+vZuhi5OIQETjBKbD3Xzw7hzGSU2LK3ix2kik3ASOLc9U1gHSIC0RJLZ8wEizMLGEi827wR
	bKqwgLfE45+nWCFqgiR+Le2FsvUkWo+2gPWyCKhIzF+zgAXE5hXwkJjQ+wqshhHoiu+n1jBB
	zBSXuPVkPhPEdQISS/acZ4awRSVePv4HVM8BZMtJ/N/iAVGuJ3Fj6hQ2CFtbYtnC18wQ4wUl
	Ts58wjKBUWQWkqmzkLTMQtIyC0nLAkaWVYyCuYmZOYZ6qcXFZfklqXrJ+bmbGIFBz8XAJLyD
	cc4U20OMAhyMSjy8AYW14UKsiWXFlbmHGKU5WJTEeVWElMKFBNITS1KzU1MLUovii0pzUosP
	MTJxcB5ilODgkhIpTs1LSS1KLC3JiAfFVnwxMLqkGhjVu5PiD/e013/1y/x09nPVS+1Fh49c
	YCxl4emLD/BiKyqpb9q89nWJ2KeprE//GLz1rpnHvTz+FN9C0Ty9/cvebIgqD919fv7Miod+
	Z5PFHTfI/LA7nLgtiVluba5PqFPqz7tMVWz+H678tRb6Z71ERuhg89WGn69Mnut6HnXj8/xZ
	IvdZa60SS3FGoqEWc1FxIgDQfqo3dgIAAA==
Subject: [PATCHv2][master][krogoth] pulseaudio: Disable unit tests
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
X-List-Received-Date: Wed, 06 Jul 2016 21:48:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Disable unit tests because missing libcheck dependency breaks build.

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


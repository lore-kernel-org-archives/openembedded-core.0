Return-Path: <prvs=307982320c=michael.davis@essvote.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Sep 2016 18:51:46 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id DF62F6014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 18:51:46 +0000 (UTC)
X-AuditID: 0a00029b-f79b86d000002197-74-57ec0dbb09bd
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	6D.0F.08599.BBD0CE75; Wed, 28 Sep 2016 13:36:43 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 28 Sep 2016 13:36:42 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][krogoth][PATCH] pulseaudio: Disable unit tests
Thread-Index: AQHSGbdBGwA+tJyl7kecC4YgEQ+ZmQ==
Date: Wed, 28 Sep 2016 18:36:41 +0000
Message-ID: <1475087765-19476-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.26]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWyRiBPQ3c375twg+Mt8hZ3fr5jt5i3w96B
	yWPxnpdMHuc2rmAMYIritklKLCkLzkzP07dL4M5ovviQueAqR0Xrni7GBsbF7F2MnBwSAiYS
	a27dY4KwxSQu3FvP1sXIxSEkcJRR4v/LI0wQzixGib07+1hAqtgEjCTOXd/ECGKLCERLLJ0x
	E2wSs0C4xMmnR1hBbGEBR4kvez+xQdS4SbR2rIKq15N4cr8bLM4ioCpxfudaMJtXwFNi4ozt
	YPMZga74fmoNE8RMcYlbT+ZDXScgsWTPeWYIW1Ti5eN/rBC2nMTLcy8YIer1JG5MncIGYWtL
	LFv4mhlivqDEyZlPWCYwisxCMnYWkpZZSFpmIWlZwMiyipEv10gvtbi4LL8kVS85P3cTIzAG
	uBiYZu9g3DPB4RCjAAejEg/vhbuvwoVYE8uKK3MPMUpzsCiJ81778ChcSCA9sSQ1OzW1ILUo
	vqg0J7X4ECMTB+chRgkOLimR4tS8lNSixNKSjHhQXMUXAyNLqoHR9vBNrZJYx9s3qxqbK92S
	buzR4Xf/2DTjXmJ84LrnmiF3Rd6pdtqW/bPfcOyY0IsIEVNrldTFjTvUIyt0D96d3tZjwXBv
	dVbyuhapuEsnmeQClPq+Jf5K3sXy5EemwEGtw1lSNj85nfJuaEeKO+XtdtUtvPz3g1TAP8uk
	Z4ft17pZhwp2sSixFGckGmoxFxUnAgAyaZtYfQIAAA==
Subject: [krogoth][PATCH] pulseaudio: Disable unit tests
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
X-List-Received-Date: Wed, 28 Sep 2016 18:51:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: "Davis, Michael" <michael.davis@essvote.com>

Pulseaudio unit tests create a dependency on check not in the recipe.
Since unit tests are not used they are disabled to eliminate build race con=
dition.

Backported from master commit 92cfdb2ba7e04e2b70986c6569f500dd2a48b5d1

Signed-off-by: Michael Davis <michael.davis@essvote.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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


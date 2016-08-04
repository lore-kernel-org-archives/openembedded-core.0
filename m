Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id F3663762B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:22 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id B496AA0041B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275733-19330 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:52 +0200
Message-Id: <1470317274-27771-6-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 5/7] alsa-utils: remove dangling patch
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
 ...1-alsabat-rename-to-avoid-naming-conflict.patch | 153 -----------------=
----
 1 file changed, 153 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-re=
name-to-avoid-naming-conflict.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to=
-avoid-naming-conflict.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001=
-alsabat-rename-to-avoid-naming-conflict.patch
deleted file mode 100644
index b6d7d4f..0000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to-avoid-=
naming-conflict.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 28c29dece6c434e7d3d01e805555ba7ddf6fba65 Mon Sep 17 00:00:00 2001
-From: "Lu, Han" <han.lu@intel.com>
-Date: Wed, 3 Feb 2016 14:20:33 +0800
-Subject: [PATCH] alsabat: rename to avoid naming conflict
-
-alsa-utils as well as bareos-bat (as well a some Bacula packages)
-all contain a program called /usr/bin/bat, which causes conflicts on
-various distributions ("basic audio tester" vs "bareos administration
-tool"("bacula administration tool")).
-Rename to avoid conflict.
-
-Signed-off-by: Lu, Han <han.lu@intel.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
-
-Upstream-Status: Accepted [expected in version 1.1.1]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- bat/Makefile.am          | 10 +++++-----
- bat/{bat.1 =3D> alsabat.1} | 43 ++++++++++++++++++++++-------------------=
--
- bat/bat.c                |  2 +-
- 3 files changed, 28 insertions(+), 27 deletions(-)
- rename bat/{bat.1 =3D> alsabat.1} (72%)
-
-diff --git a/bat/Makefile.am b/bat/Makefile.am
-index 842ae6b..985f00c 100644
---- a/bat/Makefile.am
-+++ b/bat/Makefile.am
-@@ -1,9 +1,9 @@
--bin=5FPROGRAMS =3D bat
--man=5FMANS =3D bat.1
-+bin=5FPROGRAMS =3D alsabat
-+man=5FMANS =3D alsabat.1
-=20
--EXTRA=5FDIST =3D bat.1
-+EXTRA=5FDIST =3D alsabat.1
-=20
--bat=5FSOURCES =3D \
-+alsabat=5FSOURCES =3D \
- 	bat.c \
- 	common.c \
- 	analyze.c \
-@@ -21,4 +21,4 @@ noinst=5FHEADERS =3D \
- AM=5FCPPFLAGS =3D \
- 	      -Wall -I$(top=5Fsrcdir)/include
-=20
--bat=5FLDADD =3D @FFTW=5FLIB@
-+alsabat=5FLDADD =3D @FFTW=5FLIB@
-diff --git a/bat/bat.1 b/bat/alsabat.1
-similarity index 72%
-rename from bat/bat.1
-rename to bat/alsabat.1
-index e00fc27..8d0b9c0 100644
---- a/bat/bat.1
-+++ b/bat/alsabat.1
-@@ -1,23 +1,23 @@
--.TH BAT 1 "20th October 2015"
-+.TH ALSABAT 1 "20th October 2015"
- .SH NAME
--bat \- command\-line sound tester for ALSA sound card driver
-+alsabat \- command\-line sound tester for ALSA sound card driver
-=20
- .SH SYNOPSIS
--\fBbat\fP [\fIflags\fP]
-+\fBalsabat\fP [\fIflags\fP]
-=20
- .SH DESCRIPTION
--\fBBAT(Basic Audio Tester)\fP is a simple command\-line utility intended
--to help automate audio driver and sound server testing with little human
--interaction. BAT can be used to test audio quality, stress test features
--and test audio before and after PM state changes.
-+\fBALSABAT(ALSA Basic Audio Tester)\fP is a simple command\-line utility
-+intended to help automate audio driver and sound server testing with litt=
le
-+human interaction. ALSABAT can be used to test audio quality, stress test
-+features and test audio before and after PM state changes.
-=20
--BAT's design is relatively simple. BAT plays an audio stream and captures
--the same stream in either a digital or analog loop back. It then compares
--the captured stream using a FFT to the original to determine if the test
--case passes or fails.
-+ALSABAT's design is relatively simple. ALSABAT plays an audio stream and
-+captures the same stream in either a digital or analog loop back. It then
-+compares the captured stream using a FFT to the original to determine if
-+the test case passes or fails.
-=20
--BAT can either run wholly on the target machine being tested (standalone
--mode) or can run as a client/server mode where by bat client runs on the
-+ALSABAT can either run wholly on the target machine being tested (standal=
one
-+mode) or can run as a client/server mode where by alsabat client runs on =
the
- target and runs as a server on a separate tester machine. The client/serv=
er
- mode still requires some manual interaction for synchronization, but this
- is actively being developed for future releases.
-@@ -93,8 +93,8 @@ Frequencies with amplitude larger than threshold will be=
 recognized as a
- peak, and the frequency with largest peak value will be recognized as a
- detected frequency.
- .br
--BAT then compares the detected frequency to target frequency, to decide
--if the detecting passes or fails.
-+ALSABAT then compares the detected frequency to target frequency, to
-+decide if the detecting passes or fails.
- .br
- The default value is 3.0.
- .TP
-@@ -117,18 +117,19 @@ Target WAV file to save capture test content.
- .TP
- \fI\-\-local\fP
- Internal loopback mode.
--Playback, capture and analysis internal to BAT only. This is intended for
--developers to test new BAT features as no audio is routed outside of BAT.
-+Playback, capture and analysis internal to ALSABAT only. This is intended
-+for developers to test new ALSABAT features as no audio is routed outside
-+of ALSABAT.
-=20
- .SH EXAMPLES
-=20
- .TP
--\fBbat \-P plughw:0,0 \-C plughw:0,0 \-c 2 \-f S32=5FLE \-F 250\fR
-+\fBalsabat \-P plughw:0,0 \-C plughw:0,0 \-c 2 \-f S32=5FLE \-F 250\fR
- Generate and play a sine wave of 250 Hertz with 2 channel and S32=5FLE fo=
rmat,
- and then capture and analyze.
-=20
- .TP
--\fBbat \-P plughw:0,0 \-C plughw:0,0 \-\-file 500Hz.wav\fR
-+\fBalsabat \-P plughw:0,0 \-C plughw:0,0 \-\-file 500Hz.wav\fR
- Play the RIFF WAV file "500Hz.wav" which contains 500 Hertz waveform LPCM
- data, and then capture and analyze.
-=20
-@@ -152,7 +153,7 @@ Currently only support RIFF WAV format with PCM data. =
Please report any bugs to
- the alsa-devel mailing list.
-=20
- .SH AUTHOR
--\fBbat\fP is by Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bernard =
Gautier
--<bernard.gautier@intel.com> and Han Lu <han.lu@intel.com>.
-+\fBalsabat\fP is by Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bern=
ard
-+Gautier <bernard.gautier@intel.com> and Han Lu <han.lu@intel.com>.
- This document is by Liam Girdwood <liam.r.girdwood@linux.intel.com> and H=
an Lu
- <han.lu@intel.com>.
-diff --git a/bat/bat.c b/bat/bat.c
-index 086b9fa..ddb60b7 100644
---- a/bat/bat.c
-+++ b/bat/bat.c
-@@ -272,7 +272,7 @@ static void test=5Fcapture(struct bat *bat)
- static void usage(struct bat *bat)
- {
- 	fprintf(bat->log,
--=5F("Usage: bat [-options]...\n"
-+=5F("Usage: alsabat [-options]...\n"
- "\n"
- "  -h, --help             this help\n"
- "  -D                     pcm device for both playback and capture\n"
---=20
-2.7.0
-
--=20
1.9.1



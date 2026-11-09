Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1956.1794212975530599789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 00:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=USyZEuV5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: kumaranu@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96ADdt3298644
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Nov 2026 08:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XUPQXEfbYsnbNMp6DATB07q/GtZ8ISSgljZ
	Eno5SR4o=; b=USyZEuV5mfFZE0ki2yo55fLUuJWziaKDk6MQaQ54gEpEMEeDQvh
	zM6WLX1d4tFYAUVDifyTRkIVHClKF6c/39JlaN/mYqbqKs2KepwmeaOU2mI0QX94
	HwxHx7fJlwHK4bd3rY/ggqLJpiKFt+ur1+JXRnUiaLVTgX43XQsKVeq7JbAbsPxY
	MR1AJsLjAe15ZjIs6VFrXMnHN/odIoD3F6lhuujomAxXtgshKO7YtL2Hp3OoARLd
	FXmpjg8yaMxDAEF9ts07LgRyAgayK2EwtDxCUJh5RgCxtA3WEB6ihl3+6RNKwWEo
	b1dMIL7SxotVlF4BrDnQQ4YZmv43PRCdbLg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwesn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 08:08:16 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A987Za81313307
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Nov 2026 08:08:15 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6A988FGY1315284
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 08:08:15 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id 9B926A9A; Mon,  9 Nov 2026 00:08:14 -0800 (PST)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [wrynose][PATCH] alsa-ucm-conf: Backport Arduino Monza UCM support with DP audio
Date: Mon,  9 Nov 2026 00:08:09 -0800
Message-Id: <20261109080809.4186466-1-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMiBTYWx0ZWRfX4wq9XZGJBKc1
 CnSNPgUsjYo3TSM6O5sp7IusuhLHisxynjXaPKJd+xB4ipgPQYWNE+R/J2kNNdxrJjq+B6iBVU2
 zFhSBkBUsT/mV7IrKIESa9OHGyka7almb7oTec8zFuoS1lDx/B9bivN0yKCs31rNq2sDt34r+xa
 44HirMjOyEqXBr8PKBjNW/+0UVaCy1ajesu6s6BqwQ7FPhfQ1nIYW3DoVDLbb4ozwjQoflgOhoU
 C9F86GereH7J5xxYJNpU8HyYzVoHyYBlVoqzZ0+smyuAC79B1WLCOvqNL2Is6QMEElL70LlcrRq
 PYorvLg3iW11zILL6+ns6SPL1lboE5LNximikvuKfCg368lSld1229ZWFrlRAv0YzN/yCFI+6M5
 5BbxapbB0wqN1PK9HTu3DZeH9msDo0YTo0Bb13Ct8CiaNKvTFsgjwKk81e/3JTvRmMZYJirpABv
 W1oO1RjjqhTpRy9hbpg==
X-Proofpoint-ORIG-GUID: 5lIgJ_RsFoctXWjrGmVc3VNrHbLy8IjN
X-Proofpoint-GUID: 5lIgJ_RsFoctXWjrGmVc3VNrHbLy8IjN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMiBTYWx0ZWRfX7xf3y9UYVh0C
 nCiHwC2jhbxkrBlEdWOz6k7zuMUz96nroJhh4Lg3YrpGAZGqbS5xNPxioH99sHDzlf8PRnPclyp
 xCVl9MyFw3yZx2cn8ES+m/nKzpRd2qo=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af17f70 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=jf98MIAxOPlV9BS0KHMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090032
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 08:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249797
Content-Type: text/plain; charset="utf-8"

Add UCM2 configs for the Qualcomm qcs8300 Arduino Monza board
(VENTUNO), covering HiFi playback/capture via Line1, Headphones,
Earpiece, HDMI1 and Headset, followed by the Display Port audio
support added on the Arduino VENTUNO-Q variant (HDMI2/DP0).

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 .../0001-ucm2-add-Arduino-monza-support.patch | 193 ++++++++++++++++++
 ...Arduino-Monza-add-display-port-audio.patch |  53 +++++
 .../alsa/alsa-ucm-conf_1.2.15.3.bb            |   2 +
 3 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-add-Arduino-monza-support.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Arduino-Monza-add-display-port-audio.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-add-Arduino-monza-support.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-add-Arduino-monza-support.patch
new file mode 100644
index 0000000000..dfb58ea498
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-add-Arduino-monza-support.patch
@@ -0,0 +1,193 @@
+From 5cc65aac417e378aa13169a88e701702fce14140 Mon Sep 17 00:00:00 2001
+From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+Date: Wed, 28 Jan 2026 03:39:21 +0000
+Subject: [PATCH 1/2] ucm2: add Arduino monza support
+
+Arduino VENTUNO has 1xHDMI, 1xDP, Headset(Mic and speakers), LineOut and
+EarOut connectors.
+
+Add support for everything except DP, as it is not fully enabled yet.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/5cc65aac417e378aa13169a88e701702fce14140]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/751
+Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+---
+ ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf | 137 ++++++++++++++++++
+ .../qcs8300/arduino-monza/arduino-monza.conf  |  11 ++
+ ucm2/conf.d/qcs8300/arduino-monza.conf        |   1 +
+ 3 files changed, 149 insertions(+)
+ create mode 100644 ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf
+ create mode 100644 ucm2/Qualcomm/qcs8300/arduino-monza/arduino-monza.conf
+ create mode 120000 ucm2/conf.d/qcs8300/arduino-monza.conf
+
+diff --git a/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf b/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf
+new file mode 100644
+index 000000000..3d82a9586
+--- /dev/null
++++ b/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf
+@@ -0,0 +1,137 @@
++# Use case configuration for Arduino Monza
++# Author: Srinivas Kandagatla <srinivas.Kandagatla@oss.qualcomm.com>
++
++SectionVerb {
++	EnableSequence [
++		cset "name='LPI_MI2S_RX_0 Audio Mixer MultiMedia1' 1"
++		cset "name='LPI_MI2S_RX_4 Audio Mixer MultiMedia2' 1"
++		cset "name='MultiMedia4 Mixer LPI_MI2S_TX_0' 1"
++	]
++	Include.e.File "/codecs/max98090/EnableSeq.conf"
++	Value {
++		TQ "HiFi"
++	}
++}
++
++SectionDevice."Line1" {
++	Comment "Analog Line Output"
++
++	Value {
++		PlaybackPCM "hw:${CardId},0"
++		PlaybackMixer "default:${CardId}"
++	}
++
++	ConflictingDevice [
++		"Headphones"
++		"Earpiece"
++	]
++
++	EnableSequence [
++		cset "name='Receiver Left Switch' on"
++		cset "name='Receiver Right Switch' on"
++		cset "name='Receiver Switch' on"
++		cset "name='Left Receiver Mixer Left DAC Switch' 1"
++		cset "name='Right Receiver Mixer Right DAC Switch' 1"
++		cset "name='LINMOD Mux' 1"
++		cset "name='Receiver Left Mixer Volume' 2"
++		cset "name='Receiver Right Mixer Volume' 2"
++		cset "name='Speaker Switch' off"
++	]
++
++	DisableSequence [
++		cset "name='Receiver Left Switch' off"
++		cset "name='Receiver Right Switch' off"
++		cset "name='Receiver Switch' off"
++	]
++}
++
++SectionDevice."Headphones" {
++	Comment "Headphone Output"
++
++	Value {
++		PlaybackPCM "hw:${CardId},0"
++		PlaybackMixer "default:${CardId}"
++	}
++
++	ConflictingDevice [
++		"Line1"
++		"Earpiece"
++	]
++
++	EnableSequence [
++		cset "name='Headphone Left Switch' on"
++		cset "name='Headphone Right Switch' on"
++		cset "name='Headphone Switch' on"
++	]
++
++	DisableSequence [
++		cset "name='Headphone Left Switch' off"
++		cset "name='Headphone Right Switch' off"
++		cset "name='Headphone Switch' off"
++	]
++}
++
++SectionDevice."Earpiece" {
++	Comment "Earpiece playback"
++
++	Value {
++		PlaybackPCM "hw:${CardId},0"
++		PlaybackMixer "default:${CardId}"
++	}
++
++	ConflictingDevice [
++		"Line1"
++		"Headphones"
++	]
++
++	EnableSequence [
++		cset "name='Speaker Left Switch' on"
++		cset "name='Speaker Right Switch' on"
++		cset "name='Speaker Switch' on"
++		cset "name='Receiver Switch' off"
++	]
++
++	DisableSequence [
++		cset "name='Speaker Left Switch' off"
++		cset "name='Speaker Right Switch' off"
++		cset "name='Speaker Switch' off"
++	]
++
++}
++SectionDevice."HDMI" {
++	Comment "HDMI playback"
++
++	Value {
++		PlaybackChannels 2
++		PlaybackPCM "hw:${CardId},1"
++		PlaybackMixer "default:${CardId}"
++	}
++}
++
++SectionDevice."Headset" {
++	Comment "Headset microphone"
++
++	EnableSequence [
++		cset "name='MIC1 Mux' IN12"
++		cset "name='DMIC Mux' 0"
++		cset "name='Headset Mic Switch' on"
++		cset "name='Headset Mic12 Switch' on"
++		cset "name='Record Path DC Blocking' on"
++		cset "name='Left ADC Mixer MIC2 Switch' on"
++		cset "name='Right ADC Mixer MIC2 Switch' on"
++	]
++
++	DisableSequence [
++		cset "name='Headset Mic Switch' off"
++		cset "name='DMIC Mux' 1"
++		cset "name='Record Path DC Blocking' off"
++		cset "name='Headset Mic12 Switch' off"
++		cset "name='Left ADC Mixer MIC2 Switch' off"
++		cset "name='Right ADC Mixer MIC2 Switch' off"
++	]
++
++	Value {
++		CapturePriority 200
++		CapturePCM "hw:${CardId},3"
++	}
++}
+diff --git a/ucm2/Qualcomm/qcs8300/arduino-monza/arduino-monza.conf b/ucm2/Qualcomm/qcs8300/arduino-monza/arduino-monza.conf
+new file mode 100644
+index 000000000..70c4dac11
+--- /dev/null
++++ b/ucm2/Qualcomm/qcs8300/arduino-monza/arduino-monza.conf
+@@ -0,0 +1,11 @@
++Syntax 4
++
++SectionUseCase."HiFi" {
++	File "/Qualcomm/qcs8300/arduino-monza/HiFi.conf"
++	Comment "HiFi quality Music"
++}
++
++BootSequence [
++	cset "name='Headphone Volume' 30"
++	cset "name='MIC1 Volume' 20"
++]
+diff --git a/ucm2/conf.d/qcs8300/arduino-monza.conf b/ucm2/conf.d/qcs8300/arduino-monza.conf
+new file mode 120000
+index 000000000..411636407
+--- /dev/null
++++ b/ucm2/conf.d/qcs8300/arduino-monza.conf
+@@ -0,0 +1 @@
++../../Qualcomm/qcs8300/arduino-monza/arduino-monza.conf
+\ No newline at end of file
+-- 
+2.34.1
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Arduino-Monza-add-display-port-audio.patch b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Arduino-Monza-add-display-port-audio.patch
new file mode 100644
index 0000000000..8097371742
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-Arduino-Monza-add-display-port-audio.patch
@@ -0,0 +1,53 @@
+From 16cd7e7f89027b830242b110f249edf3d7544a46 Mon Sep 17 00:00:00 2001
+From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+Date: Fri, 22 May 2026 09:52:34 +0000
+Subject: [PATCH 2/2] ucm2: Arduino Monza: add display port audio
+
+Enable Display port audio on Arduino VENTUNO-Q board.
+
+Upstream-Status: Backport
+[https://github.com/alsa-project/alsa-ucm-conf/commit/16cd7e7f89027b830242b110f249edf3d7544a46]
+Closes: https://github.com/alsa-project/alsa-ucm-conf/pull/793
+Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+---
+ ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf b/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf
+index 3d82a9586..35c76fb8e 100644
+--- a/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf
++++ b/ucm2/Qualcomm/qcs8300/arduino-monza/HiFi.conf
+@@ -5,6 +5,7 @@ SectionVerb {
+ 	EnableSequence [
+ 		cset "name='LPI_MI2S_RX_0 Audio Mixer MultiMedia1' 1"
+ 		cset "name='LPI_MI2S_RX_4 Audio Mixer MultiMedia2' 1"
++		cset "name='DISPLAY_PORT_RX_0 Audio Mixer MultiMedia3' 1"
+ 		cset "name='MultiMedia4 Mixer LPI_MI2S_TX_0' 1"
+ 	]
+ 	Include.e.File "/codecs/max98090/EnableSeq.conf"
+@@ -98,7 +99,7 @@ SectionDevice."Earpiece" {
+ 	]
+ 
+ }
+-SectionDevice."HDMI" {
++SectionDevice."HDMI1" {
+ 	Comment "HDMI playback"
+ 
+ 	Value {
+@@ -135,3 +136,14 @@ SectionDevice."Headset" {
+ 		CapturePCM "hw:${CardId},3"
+ 	}
+ }
++
++SectionDevice."HDMI2" {
++	Comment "USB/DisplayPort 0 playback"
++
++	Value {
++		PlaybackPriority 200
++		PlaybackPCM "hw:${CardId},2"
++		PlaybackChannels 2
++		JackControl "DP0 Jack"
++	}
++}
+-- 
+2.34.1
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index 0a6f884e5e..767d1ca6a0 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -13,6 +13,8 @@ SRC_URI += "file://0001-ucm2-da7213-Add-ADC-switch-in-HeadphoneMic2-sequence.pat
 SRC_URI += "file://0001-ucm2-Qualcomm-sa8775p-Remove-Fixed-channel-setting-f.patch"
 SRC_URI += "file://0002-ucm2-Qualcomm-qcs8300-Remove-Fixed-channel-setting-f.patch"
 SRC_URI += "file://0001-Qualcomm-glymur-Add-GLYMUR-CRD-HiFi-config.patch"
+SRC_URI += "file://0001-ucm2-add-Arduino-monza-support.patch"
+SRC_URI += "file://0002-ucm2-Arduino-Monza-add-display-port-audio.patch"
 SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
-- 
2.34.1


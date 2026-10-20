Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3933.1792535556386735246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 15:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eIt8wo7V;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Xx0K/pfp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KMInC83489067
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4qzrOotbrQ
	KBDDyD0QwOEKNnSu/rdVETcRo3xMnGT4=; b=eIt8wo7VIKjxtFXK+1vtffW3SBw
	z+d/9sbpU+WwnRuWiaMv801qx2xmou3AMmCNgiBlIXbH9jm5dN3nlD6+95oKRnrS
	+CEw9uJDwMGsUpNUjJqrVdMwCYz1YjaDcRFjMfUVhu6j+uCKa7nPiUv82NfV+MUx
	vZ3Xs7dswO7k3in4Eh/F1ihY1HXvI1HTynIfaEl1SDIpz5hiOJM/9z/hDv1OYSvY
	ooYcnp30j3duhOc0GnDCfRBy1SmTj5ZX0h1dOVfLU1EPZlDSIeNhJThfPqECXRhc
	CWa7N/SoUYKXrHxlkpvkNHmgw1LoRQr9BX90puHAirPCWOCuadWLd6yTwDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajgw0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:32:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ba4757baso979735ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792535554; x=1793140354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4qzrOotbrQKBDDyD0QwOEKNnSu/rdVETcRo3xMnGT4=;
        b=Xx0K/pfp7hikgjO3fW8ip7fNmTTcBeQBlroAqcdLA35499Ezh9WI5kFD8g4kJ++Xi7
         q1Z082GUWSjx+Ygy3HFg4E54RWK3RlIv8rFKx+bDfM57NIK6XiFkNqF9LAfTizi6eLyX
         Klu3MzpiYJ4hJLnyW4z1LDrycbsD8yDqxJZPBwTQCl05ZYkUNyDp4U0AmV+9sJtzihYF
         bP749e4Fr6Sj9tfpKOlbUnFGgaaW7hTu1Q9EiH5Kh6xcT5xID7wNfwyH98Ixj/E6Wtze
         UM4IE/fTPc5tgWYnOhBlmidRAdoLNp5DNnf/52SQRdqgdFW/POkP4q/wRU0VR+JYFylq
         wuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535554; x=1793140354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4qzrOotbrQKBDDyD0QwOEKNnSu/rdVETcRo3xMnGT4=;
        b=eZL+W30t0AF/g3cDlZ57DGUJK49eQQO/a+UdrPPBwaHgp4KecLh84PhGNZVnZVww8v
         6UzJXJcrvApOtPQUKPMkq82uq8bDSqbxOfq//nVDCTvA5N8bXx6TZqkhCRIrGcmSY7C7
         4pqd+Wt9KbuUNxlX6JDpqBqLqnDpf+4FF/HtS31/2QLrHSYSZewxAGZgkCP3/33y8ePK
         J+SDrYXN5ZbUPW2GSE//+h2GXIsXb/XlMSXw1Cl3Wwtus++XsPthq+Ixb+HR9c8gA2xE
         sifco96Xg+j9K7O7qgAeuSxEJX5GCw/oIvRzLQJr8qmM61IxaP5hPHw6CW6z6utCB7Vp
         2CRA==
X-Gm-Message-State: AFq9FYL5IXCeROYW5x3gXOqq4L7eRTMivISslYYeKzrpMzqeuqXGOwOi
	MYmF6ty2uMU8GFm+OYjyddODOwG9Arw+S9jv0kQdWugU/Md0aaFoEva4jYe00nUaIdoGFGrroUF
	XjE7qxZ0wN6BS46QofhQQ3a04JzNyQ0/LRXE2njY22CseWQskmUYpc61V547oF+xAfPMwWOH7+H
	GrvZ7GrEn7cH4fJOc=
X-Gm-Gg: AYBFou3v+twq/Z4LvKyrpuHnvkQAi6zAnhMS4GQfu9XAQgpjx6eI5Jz1HEaCO10gD0d
	ZUk84Gri+j+qEBpvQpqAHxZHRk3RYW7h0JEmQSiuZKbvFaza7UBZBalTyFBE43ErZS5RuaqKK5F
	c+wPzfKPJVfgB2oS+HR12eRVDnz2plukEXLxM7EO19MJlERn2vQBSHhyt4yba0Oe1N9n20rFojp
	eJIPWJT0seciLQgHhjCekMLOMtbu1I2uJXDUvBFLoNRBog3sQjXNIE3cMoU/vi6sPUpkLV1Ye8k
	Cw9iXq0aflIlWcKFfHA0ehtotzMPCkRMSZrERiDWKwCmD5BXTSZbnc6sNwP19qEiK2QaKa0aO4z
	9Zed4wIMPmRnm0XZvq3f+vs4Fj9pqF9Zo4hE+Z5Od0IymNsy+32j6h90gPfoiYP64KFq6dfEPRg
	0PV4YliUSWwmKu5rAsGJ0jFuuFbJmyRxygLuUkSw==
X-Received: by 2002:a17:903:2304:b0:2e4:9fbe:f72 with SMTP id d9443c01a7336-2ea43a07ec7mr1452065ad.44.1792535553609;
        Tue, 20 Oct 2026 15:32:33 -0700 (PDT)
X-Received: by 2002:a17:903:2304:b0:2e4:9fbe:f72 with SMTP id d9443c01a7336-2ea43a07ec7mr1451955ad.44.1792535553096;
        Tue, 20 Oct 2026 15:32:33 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b48edc9sm3378745ad.67.2026.10.20.15.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:32:32 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Subject: [PATCH v2] uboot-sign: keep the SPL BSS padding when reassembling the SPL binary
Date: Tue, 20 Oct 2026 22:32:09 +0000
Message-ID: <20261020223209.282478-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
References: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4OSBTYWx0ZWRfXxRjudM4Uu2bD
 MUyAwAzZKNEqZ4HiX9yfZ93Ki7cof0vNA7cjEVA8PG5u2vveQDnkEPlGYYUKjvCCcSjKe6NJguA
 ddI6trKt6A7zsG89yl91u3lJ6B2wVa6fJFFJZUi8xb5nmhgXZ20cofKzq8P4pqLL9TloFiMbqT1
 i0/SJmjkTsDHJVBXOLsI/vwkV1HSDiVlwt9ICOmxExcAHXyu7NTGGR77CNnecQqF3u0fFbS5tjG
 yx5b61ql6N8rv6qkMpuAHmoXfO1fKCMDiS5cY38k/eZ+t2T2zQGWuYkLPkuE2Q19UsPjf3HaiHA
 R3HBFy0vzTvkku0dYk8glB7dBnX9meg0cNtvSqJY81ya1SFrP1C2ZjWxBsSQo31BSFA9DqEl9YN
 0vprUpI047fibLOORRRycF0+34MUgx3xFf1vEqbYY/1oA0nAqqkeay3qoDQIOFe6gOy3aB/jhkg
 LrILwCUCS2OidtRk8kg==
X-Proofpoint-GUID: oumN6c2qQNMg724TjMZyOQSnT5lPL3n2
X-Proofpoint-ORIG-GUID: oumN6c2qQNMg724TjMZyOQSnT5lPL3n2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4OSBTYWx0ZWRfX+EkWp9w+d4Il
 fCZcbPGhSbuw8VWvx/ZTD6rD+aGYRUzAjyKMyovL2zcO+9UToldfm/5NyfxcsWZNRRy8nSCNZge
 Y7PyHpNlTEhJD3vuoFyBcFpGwfTX9Gc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad7ec02 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Yy9Eq7-UqNHH_y3GaAQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248312
Content-Type: text/plain; charset="utf-8"

concat_spl_dtb() rebuilds the SPL as a plain concatenation of the nodtb
image and the signed device tree. U-Boot only assembles it that way with
SPL_SEPARATE_BSS; otherwise BSS is part of the image and it pads between
the two, so that clearing BSS cannot overwrite the appended device tree.
Platforms loading the SPL as one contiguous image, such as Qualcomm SoCs,
need that layout: without the padding the device tree ends up inside BSS
and spl_early_init() finds none, before the console is up.

Add SPL_WITH_DTB_BINARY, empty by default, for machines to name the SPL
image U-Boot assembled (u-boot-spl-dtb.bin). When set, the signed device
tree is appended at the offset U-Boot used; otherwise nothing changes.

Tested with oe-selftest fitimage.UBootFitImageTests and by booting a
signed SPL FIT on an IQ-9075 EVK, where the device tree lands at the
same offset as in U-Boot's own u-boot-spl-dtb.bin.

AI-Generated: Uses Claude Code
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
Changes in v2:
- Make SPL_WITH_DTB_BINARY opt-in (empty by default); machines that need
  the padding set it to "u-boot-spl-dtb.bin"
- bbfatal when it is set but the file is missing, or is smaller than the
  nodtb image and the DTB combined, instead of silently falling back
- Keep the existing concatenation untouched when it is not set

 meta/classes-recipe/uboot-sign.bbclass | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 236d19925e..5d9e48e103 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -57,6 +57,10 @@ SPL_DTB_SYMLINK ?= "u-boot-spl-${MACHINE}.dtb"
 SPL_NODTB_IMAGE ?= "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
 SPL_NODTB_BINARY ?= "u-boot-spl-nodtb.bin"
 SPL_NODTB_SYMLINK ?= "u-boot-spl-nodtb-${MACHINE}.bin"
+# The SPL image as assembled by U-Boot (e.g. "u-boot-spl-dtb.bin"). When set,
+# the signed SPL DTB is appended at the same offset U-Boot used, keeping the
+# padding it adds behind BSS for SPLs built without SPL_SEPARATE_BSS.
+SPL_WITH_DTB_BINARY ?= ""
 
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
@@ -249,7 +253,26 @@ deploy_dtb() {
 
 concat_spl_dtb() {
 	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" ] && [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
-		cat ${SPL_DIR}/${SPL_NODTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
+		if [ -n "${SPL_WITH_DTB_BINARY}" ] ; then
+			test -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" || \
+				bbfatal "${SPL_WITH_DTB_BINARY} not found in ${SPL_DIR}. Set SPL_WITH_DTB_BINARY to the SPL image U-Boot assembled, or to an empty string."
+
+			# U-Boot pads behind BSS before appending the device tree
+			# ($(SPL_BIN)-pad.bin in scripts/Makefile.xpl); keep that offset.
+			nodtb_size=$(stat -Lc %s ${SPL_DIR}/${SPL_NODTB_BINARY})
+			image_size=$(stat -Lc %s ${SPL_DIR}/${SPL_WITH_DTB_BINARY})
+			dtb_size=$(stat -Lc %s ${SPL_DIR}/${SPL_DTB_BINARY})
+			dtb_offset=$(expr ${image_size} - ${dtb_size})
+			if [ ${dtb_offset} -lt ${nodtb_size} ] ; then
+				bbfatal "${SPL_WITH_DTB_BINARY} is smaller than ${SPL_NODTB_BINARY} and ${SPL_DTB_BINARY} combined."
+			fi
+
+			cp ${SPL_DIR}/${SPL_NODTB_BINARY} "${SPL_BINARY}"
+			truncate -s ${dtb_offset} "${SPL_BINARY}"
+			cat ${SPL_DIR}/${SPL_DTB_SIGNED} >> "${SPL_BINARY}"
+		else
+			cat ${SPL_DIR}/${SPL_NODTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
+		fi
 	else
 		bbwarn "Failure while adding public key to spl binary. Verified U-Boot boot won't be available."
 	fi
-- 
2.43.0


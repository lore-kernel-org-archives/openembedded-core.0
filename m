Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13756.1795251597512572119
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 00:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aQzCWocN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V2/Q4hOq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8ArwS063713
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TcWz0o6CtX8
	KNnB6JogZm/3GnRLCjqHBdaQTVPn6lEg=; b=aQzCWocNwbSa+WwaVqAiKXUIcPD
	S0YIQQTbRn4oyCNu/5G8vDzVJrAl4yUVdUPqOwD178/FAGU7knC5VU5WiaORviru
	g8gl6qhhM4uUMrTikLHt6Ap4SXCdubSi6I8v9fZa2T9rdfvk1vv8MH+PSX6okY6T
	G80Fr80IJb8smPygN3AhcYdfyeb94jclh3ET99MPh1bvg7YnHCqSkGA9LYeFoi6E
	wRuwRQvDhF/1WHUQG5yrxWLbrI0du75+4sbPntZQA1xBjIm6zcuXO91lpDJ6WBl4
	YLrTpXWJY5WA5NaIZbv0veDtT8oP9mjYhJN1s5M59jh4C6//NPOLvzN4BiQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu0k55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a0f79047so150979eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795251595; x=1795856395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcWz0o6CtX8KNnB6JogZm/3GnRLCjqHBdaQTVPn6lEg=;
        b=V2/Q4hOq7d5Bg0EPZBKs/GFwHftznuJ4hOFJtbRkIF8TCdm47EKeqopX7SGp1s4RR+
         bge+bMeeBBZ1ph+50uuXrcHxVs7O0UllVaicIFnpQfbMSEjV2Uxv+Pn4NQ4YJmhBw3CR
         CuwBTjqRZHPN9ewoL5hczLy78dSeHZ+Kw4EpOBAGEfI/yQDrpdqcoI6YK3TuuKRyrRVL
         l3BXyWN2JVZAs5Wm/0nLdivWY6J96j7uI8LDj8bu30qhmyiQlyPaqntAM3JiPRj84Df6
         zEfw8+Mx10mdEcrm2aMgPgKBp3YDPrEQ9DnXJ29vM6bAMwFoW4VZ/4+fdpNtZLeqgbN0
         vd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251595; x=1795856395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcWz0o6CtX8KNnB6JogZm/3GnRLCjqHBdaQTVPn6lEg=;
        b=huuz+y2sbgtBHFcd6BtU6EFVzshnEeOx1/WwFTiwCSUYUmRf/1+txjvz5skVneRi0p
         BcqJaWpFF/YNryB/DUqbn1QWSy2oPaaUVkPklQlnPgmjrdqCt8mG3K3JctqwTQP0BXNf
         OfFREMI2I1MHeUTSJG6aJ8EJenlpa1umpFT71bztF4WK1AYCPEL9I1yefmre49EEikQN
         fHihVFgx3uxGEA/R2FMgZk3QKhOocSUOlQ8Rk9Eluf3YiaQfF4+V3c2QmUwK2Rz54jaG
         FqtrIj9zLFigARBJPVkyxDQoPC7krlYi/tMye/tAY0OGyARdk060KeQ7ZFjf6yiqHqX1
         4gcQ==
X-Gm-Message-State: APuU4Z/auFcfbJwnUunJey7f0WHaSYF1IPv5DgdnuwfFz1+6KXVO/YBj
	JrKnbcA8igu4rknE6oYYc9cn9JuTLJTQMiwg90ghE8U7Hh2B8CCKNS+Nr5MfyU+st4Lmpk5Vnq+
	Eb8mYcMoP+TG9gEkdBBm/e/P2Iog5FMqoMcXAjgL0EwGcNz1mpU5LaMoOaMujVXUkQWC2HPkYau
	s4EJj6Qd45gthlUzd1YQ==
X-Gm-Gg: AZFdTZdcSYOA+tHKGEcKuiLt0DN8xDbdVgIxkBwl84czIcNRy/Xco4lNYjX5f5b71+E
	xca/aJXggzaf0N4eniX5XJDDjIHgO3xC07nF7/ncqnWd3dRedWDHzYKs/8IdMyf3jvc0zFka6Ja
	w+seL7HT/UozC/UYGNZcP5As4IWn84W/xRLWUNNYydqj3RPEaZKj1oqB1ta4Ew56J0VRTWiDaJx
	bibKzsBGRMH4dYdRUxAnYk5/WwBP7IBWRq3YDin65VaSQgYg81wPZNpxUusj/XreE+sCdx/2VHq
	3NZ4IrYguUU2/mXILU96TlRt2cHntvmNTWJAlXfn+tqLaYby14NYjLVJXZRWdwsQeUJ8VcTH4tK
	p5Lokw8FoDMkdhFjZGH0I1CpsBYZEiG78eyDlWEHD5qK2i4caUzgUEZ7fUPfDOcEAs4mY5MfcIj
	GdpqatRsdjfTt3wyCWwwc9Vk955RlonS5b/laTh8RSclg=
X-Received: by 2002:a05:7301:1a02:b0:376:b957:c08 with SMTP id 5a478bee46e88-3856fe5acd0mr5432216eec.9.1795251595123;
        Sat, 21 Nov 2026 00:59:55 -0800 (PST)
X-Received: by 2002:a05:7301:1a02:b0:376:b957:c08 with SMTP id 5a478bee46e88-3856fe5acd0mr5432208eec.9.1795251594557;
        Sat, 21 Nov 2026 00:59:54 -0800 (PST)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm17887231eec.26.2026.11.21.00.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:59:54 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v2 2/4] uboot-sign: write the image hash and signature nodes in one place
Date: Sat, 21 Nov 2026 14:29:35 +0530
Message-ID: <20261121085937.411140-3-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _XbY9kAihEh3gxSuAosny786X0TP1piM
X-Proofpoint-ORIG-GUID: _XbY9kAihEh3gxSuAosny786X0TP1piM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfX9xrAk72vuEq+
 bDk1SUQqUp4xMX8DtJtUU+4jHhpCGGSm/mmkktMRqwtNLZNet1LY6/hMS5CVHRuZONq1Szi6oCA
 vO4VLnssvA6ykHXBhtxwrSCWn+OXFALDOQDG7bOw9Wr/APUwy6K/ClqQNzdStSGwFqYIpLJpgZp
 bNmZyKYL+MQoM+Gw68cjKQ1mz21UBLfzpTKBf4NDGJ5ZeAHvWdXIj4PTU1zPlKdyoe69MuzOVsD
 5Z0TnUXcLGQLrM6FhiGF8vENCpgT5uSta6i7Aqx3msPhnQNsvt2WaTvGd4ymu85OOZ7V1d6OGrj
 VHWL4dKTN0+oI2gLWNfVTui8O2Fvh+N+mIgvl2GDSn3aTLeWkpr2/Pjmp30pcjgREYuTPtZdLPs
 FiDzUZuNee2CqZLfUF+96Sejxpfvj/ruqX7iMxnf73/SBNNW4YSrxYUbqoYenUs44Dlt7AisW8Y
 qTz0i+CshNApVrp4xUw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b015d8c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3fAs9qo7yUOUnOsMBkcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfXyvf87uhv3Kv/
 fcMmHtJYlVxZjPVMWjKv2PLm8NG2wlJd9XglEEOL8lqTjAr5FPkny8OyG/7ArtYSgQyyPSPKg6g
 UW6ej5Ms0Ytkr1AeOT/FpQMUMX+7ofs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250844
Content-Type: text/plain; charset="utf-8"

The uboot, fdt, tee and atf image nodes each carry their own copy of the
hash and signature nodes SPL_SIGN_CONF and SPL_SIGN_INDIVIDUAL ask for.

Write them from uboot_fitimage_image_signing instead, so that every
image node is signed the same way, including the ones added next.

AI-Generated: Uses Claude Code
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 83 +++++++-------------------
 1 file changed, 22 insertions(+), 61 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index c1dae56582..1c738f7f9d 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -352,19 +352,9 @@ do_uboot_generate_rsa_keys() {
 
 addtask uboot_generate_rsa_keys before do_uboot_assemble_fitimage after do_compile
 
-# Create a ITS file for the atf
-uboot_fitimage_atf() {
-	cat << EOF >> ${UBOOT_ITS}
-        atf {
-            description = "ARM Trusted Firmware";
-            data = /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE}");
-            type = "firmware";
-            arch = "${UBOOT_ARCH}";
-            os = "arm-trusted-firmware";
-            load = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS}>;
-            entry = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT}>;
-            compression = "none";
-EOF
+# Write the hash and signature nodes of the image node being written, as
+# SPL_SIGN_CONF and SPL_SIGN_INDIVIDUAL ask for them
+uboot_fitimage_image_signing() {
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
 		cat << EOF >> ${UBOOT_ITS}
             hash-1 {
@@ -381,6 +371,22 @@ EOF
             };
 EOF
 	fi
+}
+
+# Create a ITS file for the atf
+uboot_fitimage_atf() {
+	cat << EOF >> ${UBOOT_ITS}
+        atf {
+            description = "ARM Trusted Firmware";
+            data = /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE}");
+            type = "firmware";
+            arch = "${UBOOT_ARCH}";
+            os = "arm-trusted-firmware";
+            load = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS}>;
+            entry = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT}>;
+            compression = "none";
+EOF
+	uboot_fitimage_image_signing
 
 	cat << EOF >> ${UBOOT_ITS}
         };
@@ -400,22 +406,7 @@ uboot_fitimage_tee() {
             entry = <${UBOOT_FIT_TEE_ENTRYPOINT}>;
             compression = "none";
 EOF
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            hash-1 {
-                algo = "${UBOOT_FIT_HASH_ALG}";
-            };
-EOF
-	fi
-
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            signature {
-                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
-                key-name-hint = "${SPL_SIGN_KEYNAME}";
-            };
-EOF
-	fi
+	uboot_fitimage_image_signing
 
 	cat << EOF >> ${UBOOT_ITS}
         };
@@ -449,22 +440,7 @@ uboot_fitimage_assemble() {
             entry = <${UBOOT_FIT_UBOOT_ENTRYPOINT}>;
 EOF
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            hash-1 {
-                algo = "${UBOOT_FIT_HASH_ALG}";
-            };
-EOF
-	fi
-
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            signature {
-                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
-                key-name-hint = "${SPL_SIGN_KEYNAME}";
-            };
-EOF
-	fi
+	uboot_fitimage_image_signing
 
 	cat << EOF >> ${UBOOT_ITS}
         };
@@ -476,22 +452,7 @@ EOF
             compression = "none";
 EOF
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            hash-1 {
-                algo = "${UBOOT_FIT_HASH_ALG}";
-            };
-EOF
-	fi
-
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            signature {
-                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
-                key-name-hint = "${SPL_SIGN_KEYNAME}";
-            };
-EOF
-	fi
+	uboot_fitimage_image_signing
 
 	cat << EOF >> ${UBOOT_ITS}
         };

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7700.1793976622603708685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ppxqd3O2;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vwfubj/2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EPvHd1046827
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 14:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dsBZr4aPIrM
	WwaWZq+fEOPXbU1MONnMbsXBHzRvyt/c=; b=Ppxqd3O2ocL4+HNhNDEHIn2ztI2
	arh9wywrU6bBYOjuDBv9zTB/fc0/vuSywpcUhkiV/LV4HWn/ToHgnTReIrZktQYY
	E/R0Q58UF7NZTJIZ0tywcrIoETuXXWsayFpIa8ClHr6okI2wy1KicEbAr3m33UTD
	y4MycrqZ/G0U2zTqCxHtOaze9w5HNjYUy4fdFGxIjI5FBqW8XwcIaFjiGeDZiPSt
	ojll+l0PBRZ0r7D0JuFZoY+u3woR9gCgJQFsB/u3B9+p3jHPqm08Ss9KJ7M/yS4r
	R8ZWlm+wMeanmqdMKCP1Kz0qnjXBQJK5YomsmoF6df6CQsyitx2JTb/Ps6Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u7cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1097767eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793976620; x=1794581420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsBZr4aPIrMWwaWZq+fEOPXbU1MONnMbsXBHzRvyt/c=;
        b=Vwfubj/2hz2cGgsCngC5Fkjb+gkXTs42AqvWUe8HQWFIqGwiBK7L4k+hb/RzpYr31w
         SUv+f4rlZOZPhGNKOQxjBjX8qChVy1TIqUdYdVPTLEZvwovyPF1y4UF6+Ipv30ab8qXO
         fahkhSAG3hV5/piJ5LedN8abtniCYc7yeDT7tdttc7fbcI2m3+ul3+nesPBJkSyPW/3Z
         O9BsGJqVPk4zn4RcEpf7SrOlcPd2rUN/q3++mlhrjfwFhotSzid22emoKQYWKa6Rl6GI
         y9eHj8g1SCoDKftDqnYQnpV1hFmuuK3FVbO8Zd5DSyviN5Lv0C4yV8nHPFG0/gIuu8li
         3aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976620; x=1794581420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsBZr4aPIrMWwaWZq+fEOPXbU1MONnMbsXBHzRvyt/c=;
        b=CYhDx7E9bK66uZU+RHAeGPMuLiKltmJvln9bdWXUd92d8rEYWdFACJp94be7BgwILk
         +RBrqW5/ifAtxVNaHCqeaI2rTiilrMQXg/8RELk9c6Q08endmmqxICp97sBGFIOh4CJd
         SCSXbYhtHewvLV5mqrEvGa2KWoZLF8ziXaduqB/515zZu2K7J+tSbBCTESCShv8u/gIQ
         /za3Z2x5rK2Tm8PGpbljpp8LrUHMD9/vRqIBcDOD5ZhHqLlSaNd70OZ2z1WO+zbm/gDb
         uiy6ebgwyZa9x3/ssfucD3pl94dVH2mtS6d97OLu95CIUQpNWC9qOXJSVEcHjQoDyGvq
         ncYg==
X-Gm-Message-State: APuU4Z/YurF2XsN95q5Cc3OQIWXg8kzI2wTG+bD0INGZ3PDlCgMc0A6F
	uVuJjTaYNFaL8eXpxdiYFWqVilldJkybzTEbmYEGZv34tvuIw7JXGSvHdRfvyoXoXnQ4m7kElyw
	2kwFpCtnCJmJP2Apjvo9cjhzO9KWsNL/VUkP+cMwck6MyiEKN9FmSuyCKyzbf594fe+umhhyikN
	EgCqfE/z3SOoHWHTQ=
X-Gm-Gg: AYBFou0ab41Ws/DWlAS43FjkfOqzJnTkkU0Ql6gwZ4ATU14AuIkn20G/FeXRZbU+cSJ
	Rq4iP2f9IipucYi9ruXaC73dFR7/IDsQ0T5HI7d4Y9EKvqypGtwHAhnBfT3M/SXSvAbnKZo31/y
	vLdiVj/8ctSPCuWTTyTztBD8vew36BoGAhq7egsD184DvrKwJYS5c6I7NkTGzMNkt+MAKpIdj9W
	oSlDBKiFyC861PEbVJW8LbfcJ+jM6omXf6GdSFsRq92db0jTpgYifU96c8V9glwoa5zaqDL+VeP
	HLFtbn4RxIy6oD5uCgRVPWD1j1zDW85XNUH/73PEleTiz5tkFkWA7gHzio/+4/Lp1Q2mhx0N9bj
	wLWIMcM+pvSh2QIDRnt/cOFnXd37Dh5Eg+hJjTRTrI7CqyEqfHomVMR2IypiQVbnfk79PYHv0/6
	EZx2MhErr/yg6+0pfTUFh+E4s6btUBU0fK6tdaCPk8l+w=
X-Received: by 2002:a05:693c:884b:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36f723e73cfmr1823eec.1.1793976619895;
        Fri, 06 Nov 2026 06:50:19 -0800 (PST)
X-Received: by 2002:a05:693c:884b:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36f723e73cfmr1741eec.1.1793976618730;
        Fri, 06 Nov 2026 06:50:18 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm7466502eec.17.2026.11.06.06.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:50:18 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH 2/4] uboot-sign: add SPL_MKIMAGE_ARGS for the U-Boot fitImage
Date: Fri,  6 Nov 2026 20:19:55 +0530
Message-Id: <20261106144957.3818987-3-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX82y7TvrSPXz0
 w3ppFHDdrd3/995XgmgdEOvtfCkzCkHfNeW1rN6uiOIwGNFmQsZGS+87pp69z4NtvdlA7XZg86g
 +lgIOF8ud3whfcB+BqeeUZOlGWrrkI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX/7IAdQ7tsfUG
 bkh9VL/Ontk3t2tzy4nqYgIQ1fcy6B2X7jx+b9iLhUdO74UD+soezVg3FrqNhox5d51ExmNeGPw
 97wfcGv6VlPUXxMTcvc+t0wuttHpoTFxlgEp+EjT9z7aU64L5oaEoBbX2CLWyl+Via42i4OkgPn
 YAM2Gh3GXk024Xejz8MfxKF7+pk/dNOG08rl/7WOo2bgaZBLNKDwtwlLOMxD/aCVDf4d+YnQt9u
 No1Pc2J8js6vM+sZl3SjqAeMNQqqHhUsvN2dQPbZQov7FJxKWqoyjZTDM8okPRE5vU0rFKhaVqe
 /yUwrfTWgwuEBAyEIyGb3GudPFAQE4zBYeW4GqxwZhWZV+RmL28MLZIk+w3hXBMZABAd8Hg1WlY
 kDsQQQXjrdbWLZLfPSq7ux/RUhIUW1ru8oi0qIyCXZqjdN0PKPnWYxPKw+k3fFsrJK87fUy/fea
 rXCLDLoY5MGN4Wg7bVw==
X-Proofpoint-ORIG-GUID: 2vc5ZCWFbkXuBQn6eBenkACp7ulbOIvQ
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aede92c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Yq3IalCRE6alaCmtRBEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 2vc5ZCWFbkXuBQn6eBenkACp7ulbOIvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249693
Content-Type: text/plain; charset="utf-8"

There is no way to pass options such as -E, which places the image
data after the FIT structure, to the mkimage call creating the U-Boot
fitImage. Such an option also has to be repeated when signing, since
mkimage -F moves external data back into the FIT unless -E is given
again.

Add SPL_MKIMAGE_ARGS and pass it to the mkimage calls that create and
sign the U-Boot fitImage.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 82ecba108b..368888707d 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -72,6 +72,10 @@ SPL_NODTB_SYMLINK ?= "u-boot-spl-nodtb-${MACHINE}.bin"
 # padding it adds behind BSS for SPLs built without SPL_SEPARATE_BSS.
 SPL_WITH_DTB_BINARY ?= ""
 
+# Arguments passed to mkimage both when creating and when signing the
+# U-Boot fitImage, e.g. "-E" to place the image data after the FIT structure
+SPL_MKIMAGE_ARGS ?= ""
+
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
@@ -563,6 +567,7 @@ EOF
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+		${SPL_MKIMAGE_ARGS} \
 		-f ${UBOOT_ITS} \
 		${UBOOT_FITIMAGE_BINARY}
 
@@ -591,6 +596,7 @@ EOF
 			cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
 			${UBOOT_MKIMAGE_SIGN} \
 				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+				${SPL_MKIMAGE_ARGS} \
 				-F -k "${SPL_SIGN_KEYDIR}" \
 				-K "${SPL_DIR}/${SPL_DTB_SIGNED}" \
 				-r ${UBOOT_FITIMAGE_BINARY} \
@@ -604,6 +610,7 @@ EOF
 			# Sign the U-boot FIT image
 			${UBOOT_MKIMAGE_SIGN} \
 				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+				${SPL_MKIMAGE_ARGS} \
 				-F -k "${SPL_SIGN_KEYDIR}" \
 				-r ${UBOOT_FITIMAGE_BINARY} \
 				${SPL_MKIMAGE_SIGN_ARGS}

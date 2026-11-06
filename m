Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7497.1793976627115587496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eRHPueSE;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HHnz5u9s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ50J2596745
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 14:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C+ti+nPJSDD
	bx58RrRLDKX3yqqEOI0vuooBKXkUWI1s=; b=eRHPueSEw9A+bvXRckUi/IRTpMW
	3BPwDY77LCChXfZYKbYq8LF7AjYdiZ62HUETqjOsLDySgDrLVxPdIFnQP8LnU3vK
	NWsncn1gKOmn6Ekshn4X9eJa5U7UANQ460DGVZShRvvlDUyV+BB4UhXAEGMCcFoP
	YEaqUiQ7GniZ9vv+vSV0z5N8wqa5oYIkDClSXrYAigcUzS0q65WNyV4RB7ap5AvY
	1lZEmsv4vvhxmh7RIOPS+3QW+mZoGKvBa+T1axBz/fjsbkr1QFnElIwYZ7hwuKHT
	dKOTNbrjFZECCZcdghJ5QgKHGmqS5UFVORxXqsMDdzAFIX6WXA60w0+2fsg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcb73h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1035558eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793976626; x=1794581426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+ti+nPJSDDbx58RrRLDKX3yqqEOI0vuooBKXkUWI1s=;
        b=HHnz5u9sWKJByQV0TAnZPdXgs12491eIvHM2NPPhKOj5ZQW0ds53bXhqddtSBp2bQe
         4klM54WgXs1HrpMcZgWtUqRKlWwvqNnU7ASjmUSb84nDDSYKYnmrrqyar8nC5U51v5mF
         fIuNUbG1k99U2jbnJAq/fEszkQC5v/SvSOt4B0KErLhYfaL/T0IktJNoYcnbQpyC5AOe
         +ZmKnLDmo+C+wYrvcggCu+ONcrOsezrwEnjeaDA1emXSS7Rbwu9DZWckET2C37s5Kvrz
         ASd5GyXwMVdbmFAYrA3/8GBKLm9pBIfIPUUDciw2xRz+kH+x8YzsyU0u5Lf5CmfgRFQg
         hb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976626; x=1794581426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+ti+nPJSDDbx58RrRLDKX3yqqEOI0vuooBKXkUWI1s=;
        b=o0MfpfSgv3/0uB3jPI/tRV8kW64eHZqfA1zSrWVjr+IFLGcnmlAN+v2O/d/O1ZLptb
         LWF4OngRoZ4tZ4LqRATOoOtbLl9eSUqxMp3qLATxfDt+VBxQc7YrreFRNNxiQodHQ06z
         sp6h0rYpDvr28hu9MzwNd/WIfKRWxLIhsKKQE1DTwGbIIwPGvGHqsb8SvySazGee2xNL
         Rbmc+U+20ry2zUaeHW4y1sg1RH8KWJ4zqd13sGOfm9BP2X6xE1Zs6ERlFjNVU4y1yuc3
         GTyB08kCwHgrMVVr+DXjZJU4LnEjwp6dJXTfp/OhGWM4QXUvjE14SOekeY9Oj4s3Obke
         nDkQ==
X-Gm-Message-State: APuU4Z+wJwaBbFOpUOqpYfAX2Vz4Vs+DEpMAozQ75WZAksHdzG3IZ7uy
	BOz1IZzpjuCJFq0zemPIHgmN35ma8+LlBjgi8VUNGIT4QTKCFwlU44veE/THBPAlnvFQs0lVjDQ
	VcikXg0jwWYUierf+sRyWY8ti76M3DezEkzA9z1hOA9J1+lU7kwGbba7JWTL5JaKWchFVBQIK2z
	ObXRLE97yhVzo2Gpo=
X-Gm-Gg: AYBFou2Nvfl5+g6NNqFWiF39+9QoncqpCQ9I/L7TWVaUXIEzdbpGXRPau62CG3AM1O+
	I0QJ+Ye+hhg7E0b8Q/YmeE9Y2oaMr+jeiDnigOAPw4jvfTAiBwXziETPKQHprlj/zNZelpVLlhH
	EV7ImV651+LWMLx+8DYZGgRR8iq2PqntvTqNBsdG4OYopGuNJGbiUfhtNsje/g7+qT2dgjFnJ83
	H4y8h4/yvf054yNo4Av2o2TdNKIk7asjDtmIHAUIQow94QgLttZCvFA5rIWGPW+b0KVNvG5Zo+k
	2ZrXwZGzSAqQL8tpFJuVCxgRe2+GuFzBcmAEqIuxrO4wT4RWzLmdhi+8QRHTKTiUF5PAZUJZ65G
	qYmwq/2riBczlOYxTvXb+gExWZ27333oaj4S2F5Wf/5C9eMcSgvVASb7rojjk0ExBXsKHWh4tiG
	YaK3VjeEUvEpUheUCdaqW8X93ZhAflDiDmvfnCNRGaSdY=
X-Received: by 2002:a05:7300:dd05:b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36f75b30488mr3553998eec.27.1793976625831;
        Fri, 06 Nov 2026 06:50:25 -0800 (PST)
X-Received: by 2002:a05:7300:dd05:b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36f75b30488mr3553964eec.27.1793976625210;
        Fri, 06 Nov 2026 06:50:25 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm7466502eec.17.2026.11.06.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:50:24 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH 4/4] uboot-sign: add UBOOT_FIT_USER_CONFIGURATIONS
Date: Fri,  6 Nov 2026 20:19:57 +0530
Message-Id: <20261106144957.3818987-5-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0uulv6lAgPl_iwPjNxm8_uvzGUqrMuEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX+JcT8zJOtkMy
 KBT6CwOd3KL9OoOCgGu3STSpK3KSr0N4xBT1KrDXYbh7ckYxKlwMFhz9jwFKwUNu/dg0mGmQFj7
 1S6AcQovPre3A9mbXU8f6lLhfFbxODf/nrNypiY6TbsOPB1G5ylHl2BSrzsNRxpmMCrb1WFBbjv
 OukWQwvcA5rtC9Ry7mHQAtdl5yMdJ1O5hsszvUq7/vvoYHD17RcuycGaxAWXQdBlWqlofOa15oG
 GuAzEu8ncCLciiWRWvguqvSyCxJaCl4GSOa+v9Akhw4SlYK38ww6Y6axSh4g+QXeDN+AW1kWcDk
 ciFuNR2ihgGGfsNSMTKolVA2KHrT68eu2ZeH1b0XMLuurXoTmUvKaMqy8ZVz1Q3ni7pAC1+SJsV
 Sdnxl7yiV6UrgC3WiazW45wQiGj2hFxlywkVvIwNMgVebtalSIWwrjSsniFfURXDtihUf4iZyv1
 g405oa+crQZpzWo/WLw==
X-Proofpoint-GUID: 0uulv6lAgPl_iwPjNxm8_uvzGUqrMuEA
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aede932 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=A7cOQzBelK9jzjY8NncA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX9kOQnT+n1oEQ
 XAzEpALk399jOaojVdr1m213M6NUBKt1yJ9VazTId78xya0dGjK2+T+YTVozGKDU0eZzlThT9Rs
 CGg0/GLxBcu2gI0TMhPwtxyhlCMrLR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249695
Content-Type: text/plain; charset="utf-8"

UBOOT_FIT_USER_SETTINGS lets a user add image nodes to the U-Boot FIT,
but the configurations node only ever holds the class's "conf". An SPL
that selects a configuration by name, such as one loading firmware
ahead of DDR init from a "pre-ddr" configuration, has no way to get it
into the FIT.

Add UBOOT_FIT_USER_CONFIGURATIONS, written after "conf" the same way
UBOOT_FIT_USER_SETTINGS is written after the image nodes, and
UBOOT_FIT_CONF_NAME to give "conf" a name matching the others.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 4a7872074a..e711a36c38 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -123,6 +123,13 @@ UBOOT_FIT_TEE_TYPE ?= "tee"
 # User specific settings
 UBOOT_FIT_USER_SETTINGS ?= ""
 
+# User specific configuration nodes, added next to the class one, e.g.
+# for an SPL that picks a configuration other than the default one
+UBOOT_FIT_USER_CONFIGURATIONS ?= ""
+
+# U-Boot fitImage configuration node name, also the default configuration
+UBOOT_FIT_CONF_NAME ?= "conf"
+
 # U-Boot fitImage configuration description
 UBOOT_FIT_CONF_DESC ?= "Boot with signed U-Boot FIT"
 
@@ -553,8 +560,8 @@ EOF
     };
 
     configurations {
-        default = "conf";
-        conf {
+        default = "${UBOOT_FIT_CONF_NAME}";
+        ${UBOOT_FIT_CONF_NAME} {
             description = "${UBOOT_FIT_CONF_DESC}";
             ${conf_firmware}
             loadables = ${conf_loadables};
@@ -573,6 +580,13 @@ EOF
 
 	cat << EOF >> ${UBOOT_ITS}
         };
+EOF
+
+	if [ -n "${UBOOT_FIT_USER_CONFIGURATIONS}" ] ; then
+		printf "%b" "${UBOOT_FIT_USER_CONFIGURATIONS}" >> ${UBOOT_ITS}
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
     };
 };
 EOF

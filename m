Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40772.1793188107818044757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 04:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MJzZ1DRm;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Yi1wcEjE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxuu2105699
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 11:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yH9w1BMfjsVc1yjKtBR5gIDVuwG5Upk8Pwm
	FL2DW2KE=; b=MJzZ1DRmCxoNDtpw50IzL8Ye2bjW7QkI8qmOQPf0HtIufXbDDp5
	TfUqiVRMGJj7gi6yHDOc73lGele7Vle3eoub3B9WpbsyGhX+2t42pVGq65m4UCUm
	oRqj4nSxDsHQfWi++0ANTR2igLauLl4W7MeZ8Fjc7Aa+9qxp7eUeHvyzBBbUDuAX
	gPMiiTQ6b8HBiCdqHch5KArMXDC08yEJmxyZv1aXAtJaI9Mngbt92rnsQSBLK87C
	vuzxIySoeLUIhRuRnCPTV05rf3t4Iv0O1i1okIHJvwAoQeYYlDFeHpeTRGzKs1Lm
	oDEACnBbWFc0u2s9iaCkLwwtOwtDl3pbmSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12puc8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 11:48:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so158279085a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188106; x=1793792906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yH9w1BMfjsVc1yjKtBR5gIDVuwG5Upk8PwmFL2DW2KE=;
        b=Yi1wcEjElZWjXX0NUeWIve8oeSufhshw+tjmfn+OZHYEWg3hEIgfVnSmImygDSd//D
         kY0SP5+5B3YjgdkDW9HisuDAJeFtexXNeEm0+/8UquXEV6EPrPU82cicLAEO5ZxB18xd
         RLYWC8ijRoaHNMXhjbh2JGW+OMqEyOn7soTMJJUVp/GOezhsCl5Z4v/U0+j2OBTUKjij
         hAijpcoLc7dS1f6tyNZmGv4PU6kBMQojLzHpjiGJ/xCu6fyABgP1qO7RT2ouoevzyuRm
         y/ykbAK8T92ys1CEHzJCX0eYRU1MrwEhhfD6wMBsxcp9In+BXbAOojwUCKusncER4qqj
         lHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188106; x=1793792906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yH9w1BMfjsVc1yjKtBR5gIDVuwG5Upk8PwmFL2DW2KE=;
        b=S805r/ad6sjOgmAkHKqaL0N279LxUIOlBMXiKOV1aFgwLj34udyi4aYGQ99TMpwyCZ
         UtdCxmTA9hNPqLEpHnSnxlrCRA69jYr+fVZBHCFNA+I0MsK3YmKdqzNXEwTz7tRmcYg5
         xqXA1FX+LJm0Ai6kVqaZt83eikAJEx6WCeaoHVuC7Pa63JtRZYqVnRNcnMEqwBdM+jPJ
         PNOcppsVsAHqEcFY0TiEbOzVfD4CYjxoFJ4PvFDw3+Y7qm3kCI98OqnVQ78fTPzV5vmA
         pJb0mgmdSLOd7vHT+xp31odLIY2fll6IfuDT8A0wkSOODWlDHXdcRljBWQAcgJWlC1zN
         /99A==
X-Gm-Message-State: AFq9FYLf/dltFY6VXOctFM5ApDDuTtkbfeVI614XFab1LweUWiEChwIt
	VkXD574laP4vYc8xiNNrXjYr8V1UyylQng4kbtlsYNmpFZDzwz/Cv4vBXXmEjU79Gv5YFXn6Nb/
	mF37GH2KyGwE9Hr0zCfOQQfHHDjFR/O71FpAdZI9cETSBqHsJVqPRSTAzAzp/1S3oME1RWTqPeL
	63eIblIuwscUwDkpY=
X-Gm-Gg: AYBFou3/OK5p9qKELxOqDU+yCenHBZj54td0iLf4K681ef2MP7lm3XwGBHa/cqmCD1O
	JubwftRMHBc4Nsc9tZhwyXBfYkQc4gMvvllCSBMuqoFetI+KmK+8y5ZyPM+e4b6i6QZsWyPln/V
	mHf7uLYr18/XHbGDNTPBNRlzkcvvATgGynFSxu9R4Q29JLqtWC+K8OxGPKc9tFsFagXg5/2eoFT
	LDTSW0cymNmxQzYha0UNh4W2YsX6X9i0XzmcowVJq1DN1iKYt8T5kjZTG+P+c7DR3zixVmxiemW
	jyW1kppwxuYD+IA2oPNjhz0roQAqFmccw9Bnq4N3Aq5Z4HkcTDlc/469OMHA1lW1C5DHcfzUIaE
	nrk6O9Sc6D00xUozDN2Lb4cpuZxg/mAmwQ1tzhilVkAiVeKXmJ1XnT+doojO2jhrUSqQCjCPBuX
	Pf9emb9QuuNOnDaAX8GwE=
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id af79cd13be357-94408a80789mr257697085a.18.1793188105905;
        Wed, 28 Oct 2026 04:48:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id af79cd13be357-94408a80789mr257693985a.18.1793188105460;
        Wed, 28 Oct 2026 04:48:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:90a0:1ff:8900:807f:c8d6:6dd0:fea5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e7c83sm584892766b.30.2026.10.28.04.48.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 04:48:24 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH] dropbear: don't delete host keys during package updates
Date: Wed, 28 Oct 2026 12:48:19 +0100
Message-ID: <20261028114819.81482-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 80WD5jPGmbK0k3Lhi80aAthKAmPlseq_
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1e10b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=WK96OJPVadu532BSjVUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX/KzX9imwZ+ZZ
 CzR99VYUYlgXbUJZhM+nnrF4tg8lFNwiZEWt+AeVQ8lXfYHW5npycWCy5JcUB01wOIfj0gTJrju
 OH9DasMk8kTDMV4JQz4ZR5Jexa5iP3DkBldozh0TyrQ8d1FvHknRxc3K2VGufJq6+M6Rmw42tSO
 YQ2yacQFLiFtoXD2DezbN/AMAsRcoBsvI4DVx7w1HM1lwOiirIZgcaJSFE1o5tmr5mtnQO9GvH8
 9CL+xzj6BDeeyVZ6UEGA0CRWpDA+rrYC2R5+w45Xund5CurFNwoyNnbCDGpTR+QVuz5SBVyXJf/
 R+O+sade7S6d7yuDqWOR/WAg8oPluomdkfVIS3d1SXPO5STbAYg42X2GT7Q7Jk1b41ZLlL06sKv
 2nzRwp9sKVkVxZG4DrPRuiYTnInvL54PtbH26lR9c1g2p/2e3J12xjcQTk4poI/SC03RQXNubkC
 3tsQ9Lp+t+C3FHs5FUw==
X-Proofpoint-GUID: 80WD5jPGmbK0k3Lhi80aAthKAmPlseq_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX67JUSHZR2DNh
 bQHfUAYGMh0Jjl0CduvgO8nfAUN1aWZXKkk41JBeYZZU8Zq1aaLMaQx76Aae5WGAlW2HO3wgnSF
 JL9lYe8HbrO2V/crnK4bLP3dJrc+Fzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 11:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248811
Content-Type: text/plain; charset="utf-8"

Dropbear deletes its keys in its postrm(), which is fine for deb and
rpm, but opkg still runs postrm() during upgrades...

Skip the deletion when postrm() is called with "upgrade". It still works
for actual removal, the respective package managers provide:

* opkg: "remove"
* dpkg: "remove" or "purge"
* rpm: "0"

The postrm() in the recipe gets a comment spelling this out. I had an
LLM write that comment since this very unwelcome detour broke my
development setup and sarcasm shouldn't end up in comments, so:

AI-Generated: Uses Claude Code
Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta/recipes-core/dropbear/dropbear_2026.94.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2026.94.bb b/meta/recipes-core/dropbear/dropbear_2026.94.bb
index dd9863d96d..f6f81feb31 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.94.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.94.bb
@@ -124,10 +124,13 @@ ALTERNATIVE:${PN} = "${@bb.utils.filter('BINCOMMANDS', 'scp ssh', d)}"
 ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
 
 pkg_postrm:${PN} () {
-  if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
+  # The host keys are generated on the target, not shipped in the package,
+  # so keep them on upgrade: a new key changes the identity every client
+  # has recorded for this host.
+  if [ "$1" != "upgrade" ] && [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
         rm ${sysconfdir}/dropbear/dropbear_rsa_host_key
   fi
-  if [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
+  if [ "$1" != "upgrade" ] && [ -f "${sysconfdir}/dropbear/dropbear_dss_host_key" ]; then
         rm ${sysconfdir}/dropbear/dropbear_dss_host_key
   fi
 }
-- 
2.54.0 (Apple Git-157)


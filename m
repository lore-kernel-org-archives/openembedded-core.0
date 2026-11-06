Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7695.1793976611012503565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=V7ykqzte;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Adp+A47J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EPveK1046897
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 14:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ofmF+6Bx26JshGX/Fto02qjpotwLQMQg9C4
	AYaMaDFw=; b=V7ykqztefAfgTqsNmDDq6ilLkM04hlloZVXIFeZLRBAI/TaQ+t0
	nipZB6n37pv81Yu5zFqUj0tNUCD11+P2m+wMY5fqHwZiD39B8sfKPT7MOPedj254
	sOKTxQ1geZ0DJW+tR51OC3FaoDNyWpCJXBa3mngz063Aaqwlp2QPuN1KzSNZaqv/
	DOHoYlIVDncu+rGQgLH9QX/8hNlVSvuGwgXYA3ZDTA+wKxggGPV+PuTEl088yKFn
	a9eTMO9gev/NvtR11EDkqjuhQusTDZV2GQdkZ/x9NSMH/T96F5vq1k1+Xx8CMnUx
	d0bgMCpdoaycTIr4ngefchwoUQ6kl248KZw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u7c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so2094488eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793976609; x=1794581409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ofmF+6Bx26JshGX/Fto02qjpotwLQMQg9C4AYaMaDFw=;
        b=Adp+A47JsIIy3qX2wKG6NctolAhbR23Os6TBpSZc3EJQAOMTybSP61/PiHipD9gLj9
         YMt6ljy2RQlxol22aDcPU+FkHL/2MlaK3NUKT/nw6r83wjOpx7Yu3lH7+EAWQIbgijFS
         zibHx/+3wnZU4dkr7kAJmY9GtTFkflZgMo4gyCuWPkIZiNb/wTiAA/kojo979vm286W/
         lVmhPz3CP0+rTlDmSzQGWteF9P5OwRm41HzehVUV/4TtBrXUqgnem8OgfgwssU/pBYu2
         VPLNQcimLDuZCFN1ZfD6QUYM71ha9Mq4BDqhROYtzX0RfDs1Hal8OwYdzZ9mej+ynN8M
         C9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976609; x=1794581409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofmF+6Bx26JshGX/Fto02qjpotwLQMQg9C4AYaMaDFw=;
        b=FH/bbPIb7nxgu50h8+QakmEIOZSFD5TLjTd1HoQ3EClwKSqc1DCvLY0p7KnbFssLY7
         kUYyDAcuUwhxuJHxmiTwVld6hGYLtvWZG6JCpxByLI/347dtfeymcYWfQIt2JzzuaxAZ
         MXEv6jiUpzoGgtgkt641kuu2/jCi4Mqr80U8mbrnECbTOIHx+oiik5NVuVyizfIYpB9O
         1fY2rEtUGwLUiPjFW3BpIp5mlkeDoWtLCc7PiJrCUe/efgLFKV7jeaWxCvdeALHRizY/
         Q28NCxjqvVgmtgFm0AyHi/m+llQM1Pqf+halV5jdOPEStLNQDbA4sDXVD6pLoO7p8vfH
         kb/g==
X-Gm-Message-State: APuU4Z9LTmmAkXG5ch+yVxLDufM9tbOGpYjD17p++jdzHdlBHw8W3AK3
	z7yQIv5h9oSoUcDztdefa1IHO+UC7s/miFebsKAOa5w0Pku0tQCJO/bWDT8M5PruJkSXutgvgPD
	/3K/xNq5NGW1d7uINP5pxO/547fU6iXbzy3mJBJL4RZMcFDBbW7aOpPxAj2gabI0WjTodP0DMAO
	XF5aO0Z84Fjoyav5Q=
X-Gm-Gg: AYBFou1R1kPRoo7Xog5kW9DX2z9hAp0Mr1WK0/uJ6tDlCLGEqbO+Tx/oVyCEisFAZE3
	lYVdjytOPXeq54n18FJGNU6pmG64hLITAkJfXbptOO4VpUxH9mBosFW6KZILYCTBUumoIeGXAmi
	DNblTxfvmO4RdkXWcKs/DDzIBB8BxBjCsJ/j0cEDT7bkkeTbZXtV10JrNoU/T7oOcnyaafYEbOc
	/OUCXrj+KtCs2LGk9BiN5aNGepbTLkwKf1Q4Qgv5nKkP7G4er5LfbnCtXmDdsIwaNyK64cdlGOT
	FO3s3B3hW01ZW8SRaohACIpa32l1EnFIXNMkprjCpoTcTEuqfZmwXmV539hTV+rLcr94iYm5c4q
	RUdvgtKi8UO0nTgdqSdcKsca+xTavMZKOxVmGjOAIPwuIGqDToUSJRdvEAQX8mOPgZcGU964Ebs
	2Jbsux7w+4WvtlyvDWohoWZnzTgHBoz2gnAQ8xtC3261g=
X-Received: by 2002:a05:7301:f8e:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-36f775f83f4mr3975177eec.41.1793976609301;
        Fri, 06 Nov 2026 06:50:09 -0800 (PST)
X-Received: by 2002:a05:7301:f8e:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-36f775f83f4mr3975114eec.41.1793976608557;
        Fri, 06 Nov 2026 06:50:08 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm7466502eec.17.2026.11.06.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:50:08 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH 0/4] uboot-sign: support an SPL FIT with firmware
Date: Fri,  6 Nov 2026 20:19:53 +0530
Message-Id: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX2q8GL34S2eeI
 yaCEZ/X9JS90wD8/rmzWFatg1YvYO3MzUQal8Ndd3e/7OR/lnXNcS2BziURVItsrgdjGGaCTQc+
 EW5eWdRuemhHxxSA6bbPZpmGeQB0Ne4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX7p71MW/wTn/X
 G+2Ac27efj9PakMoN8C+YyiuJxkIWJM1S7DE+2/KB8TPF73++u3Dx8UfN5gihO+K1J1c1jaojek
 v+EDfR3zThtXnvL6AQ6m9mAsmpD+USFmtFZG02yU3q7g9DUeh/vkCmslVMbB+8iLg34PW0YvAG3
 uxWM2uaiHeRrTQm7Yx+ctnKyQcCHrJFclb8mKG2bJAYZnahnE+2VJuXtgaZgyKMPz2WAom822fy
 OXASxXSFYrDjSpoTImsHYFlkEWuLPguwXeXuRb0fJ5C8VQ+1+cTvxc7g8SVmAWG9bW8rOCpJ+hB
 saEtHJDJyHcE4nf0EIE351RWtr0LNyRhWrvOMrB42Vlx0OyU/a4EIG9rB4ppaEFn0rPqoWHkdxK
 bnuLkAQWSliZsm+FwOnFNd8g3d7za2pExFAaX5zgXivhhS4VZ5Nzt3d8k+G4qDHitvjPe5lrnWG
 eMDUcsUqrZSbfec4/aQ==
X-Proofpoint-ORIG-GUID: dj0NA3QSxKEFHEp9vZqGC8SbJGAbJ7LM
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aede922 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=y_30nQMSxBjSmNvzmbUA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: dj0NA3QSxKEFHEp9vZqGC8SbJGAbJ7LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249691
Content-Type: text/plain; charset="utf-8"

The Qualcomm Shikra boot flow replaces XBL with the U-Boot SPL. The SPL
loads a single FIT from the uefi partition, which holds two
configurations: "pre-ddr" for the PMIC, DDR and QcLib firmware it runs
before DRAM is up, and "post-ddr" for BL31, U-Boot, OP-TEE and the RPM
firmware it loads afterwards. It picks the configuration by its
description.

uboot-sign can't build that FIT today. This series adds the knobs it
needs, so the layer can describe the extra images and configuration
through UBOOT_FIT_USER_SETTINGS and the new UBOOT_FIT_USER_CONFIGURATIONS 
instead of redefining the class functions:

    1. UBOOT_FIT_TEE_TYPE, so OP-TEE can be a "firmware" image
    2. UBOOT_FIT_FDT, to drop the separate fdt image when the U-Boot dtb
       is appended to the uboot image
    3. SPL_MKIMAGE_ARGS, to pass options such as -E to mkimage when the
       fitImage is created and signed
    4. UBOOT_FIT_USER_CONFIGURATIONS and UBOOT_FIT_CONF_NAME, to add
       configurations next to the class one and name it

All defaults keep the current output unchanged. The fitimage selftests
are updated as needed.

Viswanath Kraleti (4):
  uboot-sign: make the type of the tee image node configurable
  uboot-sign: add SPL_MKIMAGE_ARGS for the U-Boot fitImage
  uboot-sign: make the separate fdt image optional
  uboot-sign: add UBOOT_FIT_USER_CONFIGURATIONS

 meta/classes-recipe/uboot-sign.bbclass   | 65 +++++++++++++++++++-----
 meta/lib/oeqa/selftest/cases/fitimage.py | 47 ++++++++++++-----
 2 files changed, 85 insertions(+), 27 deletions(-)


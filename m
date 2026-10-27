Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14066.1793088386665912514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=AuACaRiR;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=ft5RDZbh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: shuai.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YsGJ2336765
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 07:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dS7Gb2wyjB3MzNoq/KEB8H1sfJIP+8xzXCM4yauaFDA=; b=AuACaRiRTij/oesr
	XZpgXesfcdizdgoEASUF85CRjS1mVlLSZ0kHUI/FXBKqapAKP5q9mtSEXryCF/Hq
	LwdTnyK0hVFZOc6UjEUQIkv7i4w+GtG/H9uQSq6ZJaEsp7paTdPfH+k8ZTkSc9+5
	eQhTfZ0GMiN9ebaxqBO8fAJQEiBLkh/PLqWpXCPLQ+OUkOzg88s+YK/lj3E6CHCN
	O4iEhXwzMOWtRQu8M8EMkwXeSApTaVN3EFBXLSowUAoCgbPwCeyQgiAZUCqnRh0K
	3m4/rQ5XLGpTolU4wiSR6sfEqsSvq5F+aDTxBnQqkJbY1q/KJVIBDVgvXm4s/QNn
	RAC3AA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d9v5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 07:23:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso4174587a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793085797; x=1793690597; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS7Gb2wyjB3MzNoq/KEB8H1sfJIP+8xzXCM4yauaFDA=;
        b=ft5RDZbhoyk7Yi0uekVEPIZBW/O6RwrGep9z1LynUUQPuFoDoKD+xYqZVM9I1d2ciR
         pCk+UzMbwnzQ71inh5nvWykTuba8hHFljM2dTObCJl8GfpV9l3IkrJMjX/u/R80Z2oLZ
         30yuiOHtbDQ6M3KRP/ggID+lT1VavnWVzYSVYlNzpq0RyQ9ZIfjl1dwapMqk3cDaWOOB
         xLawjTwwyL5J0J4WDnZM1oM37LcCpPZUclqWdCMdmvpjUc56TzbrMIiOGViWWJsEAdzf
         kbRVwJYfibnFKOsCGUVXEtzXEz3hOLXwtMlE6vh/32+LCsyCHVcZlHrQ+kpody1q+prQ
         RFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085797; x=1793690597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dS7Gb2wyjB3MzNoq/KEB8H1sfJIP+8xzXCM4yauaFDA=;
        b=S8xsvGEwNFXqhK1tKeMgY9IRV7YV7QPbjMcoEKxcF0If+CQIW1c6mIb/123StW2uFT
         Icp30DPUNVwRk6UvPjjycmPaqMXCVGZaAJ5hl9oZaj386cF3acCKwUp/BHvjHUoocxzl
         XORH4KC1KLu8gWGmYnHhu80WEqC2OK5oS+P7QyRGCAdFg47INTTgwKgyTCfxRtAdeVox
         Tr1yf1Ek49VY1hDk8/GLAFX0a5/O9RQuNabBsJx4m3ONUqMrNV5Y8JVL7qM81Kn2h2jZ
         SCmQiLDolj6Grh9qN1I/4x6KxhaZHqs0xd79AZGL2iVfmMXpYCcBK1sY3v2FhoKBmRFa
         PMXw==
X-Gm-Message-State: AFq9FYIfGSyuW9lgpnmrAn5t5fDka/HC8BgKTaoS2RZtJeif9nCA/FRz
	aL00KCnlJWFQDcTLkVIq6rFVq4azG+1RYJO02VEiKiRRv99VzZYnOR4Nu1EdcMMcghJ4e6Vr2vN
	mz9H65e1Qb/XLwcilIYPaFEf3G81P7GTRIw8cI6CCasaFoo0Oa8qSq4Y8ZTiNTa2ZCNQ1bS9YQT
	n+ybgCkJU4SR9T6nM=
X-Gm-Gg: AYBFou2m2aPqoW2aZpQ6H2c5wnPGNA3kzUlrHuaAIO31vQlQi99QqJW+WMELwA4U009
	e77DPaiFvsvOyqhnhXinLMun0yng5uAFgCt46Qis9vL5iy1Jgc+0pTN6u86A0WyE8n6CV0MtwSo
	8CUXkuUBJ0K7Bh4sIUnQKNqXtASo2JaVYSMDWqe7jypQxySWDXFWvgr+/ourjAcjTHV1EcQxmP4
	ngLVWEXu+2co9jYgKG153eQ7YZqNhlARaCB3Mm4fK/vboA7To/gqCOfg6qZplk/HVif1IR5Zkr7
	NGbKXZOVdsk3kLwfb0pEi6JP4j5x7a+MB0oQbXcgIkJWvGGUjUXagz/tDpl+LJLf2EV0M15FiE7
	deoWCAnYicNn/dfLsAwBnYKw5mFo=
X-Received: by 2002:a17:90b:55cd:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3adea1a76b8mr7211200a91.6.1793085796624;
        Tue, 27 Oct 2026 00:23:16 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3adea1a76b8mr7211187a91.6.1793085796106;
        Tue, 27 Oct 2026 00:23:16 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40451f4bsm2447126a91.10.2026.10.27.00.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 00:23:15 -0700 (PDT)
Message-ID: <75823d78-77f7-4c1e-ab72-147fbc1130cb@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:22:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] [wrynose][backport] bluez5: Abort continuing response on fragmented CT replies
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, chenhong.zhou@oss.qualcomm.com
References: <20261021090017.683390-1-shuai.zhang@oss.qualcomm.com>
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20261021090017.683390-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfXzaR6MCtXH8jM
 dZ3tbX3g6j5kP1qTyJAfWG4DcDEINESGhdjOcNPtGTtcCyZ78XabdSiFnqvvFb8/yrN25IM0Khu
 lI3C6sdmn6aTHGHmhlz+4eBAqe12ElQ=
X-Proofpoint-GUID: JrHStD_6NL9ANzx7g9LKcW-9B-xwtB_h
X-Proofpoint-ORIG-GUID: JrHStD_6NL9ANzx7g9LKcW-9B-xwtB_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX7nTHGSXlUNp6
 rxoxTYSsr+zCc8LlWMfmOvsuNdF1k/lXvSoquElux6eHG29zmq3B72JesVg8GIsaY8R3ToMbGpp
 sMRJt7r8kCWSgLgXUZlZurtS6HJknNT2TT0MYynqW9vvMoX6dXkVJ1SH+n2SkpPYrEaWvqdOBNS
 I7q32m6PF8BCrPI4ikl9UELB8tUJfOcOypNgjH/sf/bNweC3X+yf/854/eEgjJsNJYfdEbCN8Wq
 qZob5r5ji9fjJ7keK3Nyxqo2uaoyPq+xcox18DKEaBce+1EqIUdDA0nvLYk7Ns/99bKR9FYcsLU
 czrQ05Iexbev+17PN/U8LqY9m/WfG+Ztmbl5o12X/DxOBaqE3NgD99RZd4IMLY6yLT7EP3QTH5N
 QUZSNgzqDwgb8jJd8BCfOMiq/Abi1hw0Bnb5aoGSHTyMr1Y6M38/SQqd31mXeSpGcYCaaHxAziW
 u0U2R+KBjCWEiEvstJA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae05165 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=UIFwVCDISMsRLlRzA6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270029
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 69R5YsGJ2336765
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248719

Hi Maintainer,

On 10/21/2026 5:00 PM, Shuai Zhang wrote:
> Send AbortContinuingResponse when a Get Element Attributes reply
> arrives fragmented, as the CT side does not reassemble fragments.
>
> Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
> response on fragmented CT replies") to bluez 5.86.
>
> Fixes PTS test AVRCP/CT/RCR/BV-03-C.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
> Changes for v2:
> - Fix subject prefix to [wrynose][backport]
> - Drop Upstream-Status tag from the commit message
> - Keep upstream Upstream-Status and both Signed-off-by lines in the rec=
ipe patch
>
> Link to v1: https://lists.openembedded.org/g/openembedded-core/topic/pa=
tchtest_results_for/121863269
> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>   ...inuing-response-on-fragmented-CT-rep.patch | 63 ++++++++++++++++++=
+
>   2 files changed, 64 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp=
-Abort-continuing-response-on-fragmented-CT-rep.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes=
-connectivity/bluez5/bluez5.inc
> index d857c23..2d0ee56 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/blue=
z-${PV}.tar.xz \
>              file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value=
-no.patch    \
>              file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listen=
ers.patch \
>              file://0001-adapter-restrict-delta-0-RSSI-to-proximity-fil=
ters.patch \
> +           file://0001-avrcp-Abort-continuing-response-on-fragmented-C=
T-rep.patch \
>              "
>   S =3D "${UNPACKDIR}/bluez-${PV}"
>  =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-c=
ontinuing-response-on-fragmented-CT-rep.patch b/meta/recipes-connectivity=
/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.=
patch
> new file mode 100644
> index 0000000..9b29ffa
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continui=
ng-response-on-fragmented-CT-rep.patch
> @@ -0,0 +1,63 @@
> +From 41a00c93baa48cbd63b182b853e93a946962cada Mon Sep 17 00:00:00 2001
> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Date: Tue, 9 Jun 2026 23:26:56 +0200
> +Subject: [PATCH] avrcp: Abort continuing response on fragmented CT rep=
lies
> +
> +Send AbortContinuingResponse when a Get Element Attributes reply
> +arrives fragmented, as the CT side does not reassemble fragments.
> +
> +Fixes PTS test AVRCP/CT/RCR/BV-03-C
> +
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/249e2=
bedfacf51fc6c89f43a0adb9a12d761c2b7]
> +Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> +---
> + profiles/audio/avrcp.c | 25 +++++++++++++++++++++++++
> + 1 file changed, 25 insertions(+)
> +
> +diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> +index 326dfda..557ed97 100644
> +--- a/profiles/audio/avrcp.c
> ++++ b/profiles/audio/avrcp.c
> +@@ -2466,6 +2466,24 @@ static void avrcp_parse_attribute_list(struct a=
vrcp_player *player,
> + 	}
> + }
> +
> ++static void avrcp_abort_continuing(struct avrcp *session, uint8_t pdu=
_id)
> ++{
> ++	uint8_t buf[AVRCP_HEADER_LENGTH + 1];
> ++	struct avrcp_header *pdu =3D (void *) buf;
> ++
> ++	memset(buf, 0, sizeof(buf));
> ++
> ++	set_company_id(pdu->company_id, IEEEID_BTSIG);
> ++	pdu->pdu_id =3D AVRCP_ABORT_CONTINUING;
> ++	pdu->packet_type =3D AVRCP_PACKET_TYPE_SINGLE;
> ++	pdu->params_len =3D cpu_to_be16(1);
> ++	pdu->params[0] =3D pdu_id;
> ++
> ++	avctp_send_vendordep_req(session->conn, AVC_CTYPE_CONTROL,
> ++					AVC_SUBUNIT_PANEL, buf, sizeof(buf),
> ++					NULL, session);
> ++}
> ++
> + static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
> + 						uint8_t code, uint8_t subunit,
> + 						uint8_t transaction,
> +@@ -2483,6 +2501,13 @@ static gboolean avrcp_get_element_attributes_rs=
p(struct avctp *conn,
> + 	if (code =3D=3D AVC_CTYPE_REJECTED)
> + 		return FALSE;
> +
> ++	/* Abort fragmented responses as reassembly is not supported */
> ++	if (pdu->packet_type =3D=3D AVRCP_PACKET_TYPE_START ||
> ++			pdu->packet_type =3D=3D AVRCP_PACKET_TYPE_CONTINUING) {
> ++		avrcp_abort_continuing(session, AVRCP_GET_ELEMENT_ATTRIBUTES);
> ++		return FALSE;
> ++	}
> ++
> + 	count =3D pdu->params[0];
> +
> + 	if (be16_to_cpu(pdu->params_len) - 1 < count * 8) {
> +--
> +2.34.1
> +


 =C2=A0Just wanted to check if there are any updates on this. Thanks!


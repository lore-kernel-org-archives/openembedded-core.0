Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10628.1795078608826279505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 00:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ly4hvSSV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KmP8yzim;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: shuai.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wHkV1534921
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAFxtU0WGHuWHSJa1rSZ0oX/0wFFeHcj/7QdrLdGul4=; b=Ly4hvSSVAFOMQ3nY
	/vcG39+RGYobCB6RcZREsUxNmeVOQ9qcy/SPy65oZi+IgE1U9K/AkGBIxBSLRpk7
	dYP8c1hSD+cPH2QraU69PHTi3DdAdxomGSPrxa1gudE+aTEUnmLf07QKoO3qJj9h
	t0AavKLjeb8lJ9i8NN7z3RG1mps5UfZcMkeOEv4ARpu8+x5qXtMDqg0kXqrSFdno
	u6MhnvkIEeBRGpRFuzn4XBdv9sXOL7FUggR4oGjpY1MV/EOM8sX8E86IJQKfcnYx
	qRHiJpE3uZKYO1SmkteKcf4prMEZoVyWvtbi8Ldw+LD95tVcpK7wMl6M7MjC83t0
	XOTvpQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcc3w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:12:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso692016a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 00:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795075949; x=1795680749; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAFxtU0WGHuWHSJa1rSZ0oX/0wFFeHcj/7QdrLdGul4=;
        b=KmP8yzimWD9I7QSR7x1LZYutDQzDWw5dRqoRpM2nePvkBudLF1tOckw+7mvtQxfAV0
         B2IXT/9/xV8JGDHa3/ZNsY8E9qUhFWFfEUHtfoeXL9EVyNc3dWkWor7tHj3fIBkZX4FC
         INddy1yuDPjODCSM5oPpb04x716IqD4LwH0WXglZ4DIvUKyNrhC2r2CmkMD3vMgcOMrz
         PTzSIwQjSdOqx1bzlse9untCbLRMzl8yDlfLyj7TWnj8LGf7zA1hOOj7ygKt0KmIH1Dv
         7TxRcWBfCFaC4AU8oHTblybwRE4pGzasO1t1kHav7MYsk9/CZ6lJEIDBkD4sADQPkozH
         Jn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075949; x=1795680749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAFxtU0WGHuWHSJa1rSZ0oX/0wFFeHcj/7QdrLdGul4=;
        b=efw9PIlXSyZtjs5dz4KuzQQWyQxk9wJdg/uGxvFyhM59BBQIYx5g2Yev3C+k4fuPtJ
         rahyUy+bkUcvih9TH6U+xsqUUiW8ruuY6suw/BcU1wxE1H1n26tpDi2U12mgKEEVSbHC
         e1u8p5K5hi2MUVgI12YqffB8Rb1ezWG3YfOFYnlhy4RTkF2Od9wTDDDQ5qNs22xmXVb0
         luNXWbSbliCSY28Jpa77oQsVX9uvcgXUvBBDQuv9lxDZoBOCaO631VMz2I3fk/X+D65y
         P58s6+0vEaUIEnxJAeD3nOW2fYEdCYyygJoQkGA2Dp9IKQBcCvLa24cdriob038EHmme
         TJRA==
X-Gm-Message-State: APuU4Z/ozxt6O3y4kwd32ATMLmqfe04xUbJRF9jt3XAbJEngzkAFUDf9
	fxTI0Sc+SNzF4s8bX5+nY2C0JO5A9aiRsL9IHHYcNM/Zj21H6Dwt/pF0IG9354aphhclvfe1iOn
	2plNBjSL3hfayBWGAiu09guSdEmqrsynHe7tHonPcymNmdL0CICcpZnwk5P3pt6aN1l1maVTkB8
	/SC9eU3QG8G8c5SHQ=
X-Gm-Gg: AZFdTZdAIIv0vNpW446D5a9Tpt36ki8/MNmXADsFLeLdO00ueInzwMAfYlNU9t1+OWF
	voNgFGPvLYg64jcsqadMu+1sMjtHxssj33MNOiZw5rhV98YU2cziaSeU9CeIre0CsdpyZWu1Yjm
	ETG3Rm2FScEwobVUWZhHx2QDxqNzEIAXg1KOXD/K2V2TQueKuAsr9yE9HzoUPphS6AXUkd1OBd7
	YVxaawHCCRQBKKEA+BoNYm2ZCkkLvRPD5kXYwqIwZPzoerqf08emt7DJcu1IKGjDWfuy1w8o8GA
	mLeVGaVw7sxQCLo7DaAVV7n5YXJ/tSxF+tl8AWCaaQL3Ea/bLyFcOsF15ip0KLrbhTKV4o4uZlw
	fBFSlz87PYF/lph1uaLS0snKvaSclISB0SFhUeHxkaINJeGVggApAinv2XGOwDCYQV1r4VkLHbv
	wA
X-Received: by 2002:a17:90b:5544:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b409eb69bamr339311a91.16.1795075949140;
        Thu, 19 Nov 2026 00:12:29 -0800 (PST)
X-Received: by 2002:a17:90b:5544:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b409eb69bamr339285a91.16.1795075948483;
        Thu, 19 Nov 2026 00:12:28 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4058e12c4sm1562506a91.10.2026.11.19.00.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:12:27 -0800 (PST)
Message-ID: <a4daf280-ed05-4335-95c1-dd0f99123184@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:12:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] [wrynose][backport] bluez5: Abort continuing response on fragmented CT replies
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, chenhong.zhou@oss.qualcomm.com
References: <20261111112254.1486896-1-shuai.zhang@oss.qualcomm.com>
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20261111112254.1486896-1-shuai.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afeaf6e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=UIFwVCDISMsRLlRzA6MA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMiBTYWx0ZWRfXx2Fi+xWwbXdT
 aiMXYJxmgdberErrNFSAuN515XmpIOJyyBCTjy7e0OF3vJ5e2Rdymo+gG0SqQ0oPn3IkiUiN6LO
 VWIBvry32ktFkppjWB6FzQmHXmqpTPCTkBLdEcfVdqCboMOpcWkG4kKvwsBI3fv+ARPdLUj8Opy
 8b83BDI1e/hk9wuUfRSNwAGsmfZDb/XcXh03iZBl/0Ur6JmQBhhteqwIXUiB02guzO90Y4rb5kq
 E8JUNCUpFswgx3LroFuMQl8iO1SqyoyiOhmXHhrwd3a50NxjJyO9tBFk0minflkX7+sLws1WRe5
 EtnyFyjduPR8sEkB277YUaCFIdaG5p0laNNPIKTQnOfNbNbeWyQeFXAh0I5s5yGHui6C7CEhvjB
 XYQTErtbUNbhuur8dAb+9STLiLHF1G8Aa48I1J+1c2NuKDRuKj4ZXXL3fThSHVhPX6Sm4qnbEE7
 RjlV/nHuVFIRWz3Lcjg==
X-Proofpoint-ORIG-GUID: efJt6uyfisyFLBzox7d5dQXfYNSQ7TOC
X-Proofpoint-GUID: efJt6uyfisyFLBzox7d5dQXfYNSQ7TOC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMiBTYWx0ZWRfX9g6A1tOLh4yw
 fA8sGrDb04tjN8eaEpUPfZ2F0EbQ+ti0pRK+uEPndlg5w9CMmid3R4OxR109XVxYPVQwF1i4CsY
 DeHNBOso5zZujMk54kO22wF22VDqdpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190032
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250655

Hi maintainers

On 11/11/2026 7:22 PM, Shuai Zhang wrote:
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
> Changes for v3:
> - Remove Simon Mikuda's Signed-off-by from the recipe patch, as he did
>    not sign off the upstream commit
> Link to v2: https://lists.openembedded.org/g/openembedded-core/message/248377
>
> Changes for v2:
> - Fix subject prefix to [wrynose][backport]
> - Drop Upstream-Status tag from the commit message
> Link to v1: https://lists.openembedded.org/g/openembedded-core/topic/patchtest_results_for/121863269
> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>   ...inuing-response-on-fragmented-CT-rep.patch | 62 +++++++++++++++++++
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index d857c23..2d0ee56 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -76,6 +76,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>              file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
>              file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
>              file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
> +           file://0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch \
>              "
>   S = "${UNPACKDIR}/bluez-${PV}"
>   
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
> new file mode 100644
> index 0000000..68f824d
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
> @@ -0,0 +1,62 @@
> +From 41a00c93baa48cbd63b182b853e93a946962cada Mon Sep 17 00:00:00 2001
> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Date: Tue, 9 Jun 2026 23:26:56 +0200
> +Subject: [PATCH] avrcp: Abort continuing response on fragmented CT replies
> +
> +Send AbortContinuingResponse when a Get Element Attributes reply
> +arrives fragmented, as the CT side does not reassemble fragments.
> +
> +Fixes PTS test AVRCP/CT/RCR/BV-03-C
> +
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/249e2bedfacf51fc6c89f43a0adb9a12d761c2b7]
> +Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> +---
> + profiles/audio/avrcp.c | 25 +++++++++++++++++++++++++
> + 1 file changed, 25 insertions(+)
> +
> +diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> +index 326dfda..557ed97 100644
> +--- a/profiles/audio/avrcp.c
> ++++ b/profiles/audio/avrcp.c
> +@@ -2466,6 +2466,24 @@ static void avrcp_parse_attribute_list(struct avrcp_player *player,
> + 	}
> + }
> +
> ++static void avrcp_abort_continuing(struct avrcp *session, uint8_t pdu_id)
> ++{
> ++	uint8_t buf[AVRCP_HEADER_LENGTH + 1];
> ++	struct avrcp_header *pdu = (void *) buf;
> ++
> ++	memset(buf, 0, sizeof(buf));
> ++
> ++	set_company_id(pdu->company_id, IEEEID_BTSIG);
> ++	pdu->pdu_id = AVRCP_ABORT_CONTINUING;
> ++	pdu->packet_type = AVRCP_PACKET_TYPE_SINGLE;
> ++	pdu->params_len = cpu_to_be16(1);
> ++	pdu->params[0] = pdu_id;
> ++
> ++	avctp_send_vendordep_req(session->conn, AVC_CTYPE_CONTROL,
> ++					AVC_SUBUNIT_PANEL, buf, sizeof(buf),
> ++					NULL, session);
> ++}
> ++
> + static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
> + 						uint8_t code, uint8_t subunit,
> + 						uint8_t transaction,
> +@@ -2483,6 +2501,13 @@ static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
> + 	if (code == AVC_CTYPE_REJECTED)
> + 		return FALSE;
> +
> ++	/* Abort fragmented responses as reassembly is not supported */
> ++	if (pdu->packet_type == AVRCP_PACKET_TYPE_START ||
> ++			pdu->packet_type == AVRCP_PACKET_TYPE_CONTINUING) {
> ++		avrcp_abort_continuing(session, AVRCP_GET_ELEMENT_ATTRIBUTES);
> ++		return FALSE;
> ++	}
> ++
> + 	count = pdu->params[0];
> +
> + 	if (be16_to_cpu(pdu->params_len) - 1 < count * 8) {
> +--
> +2.34.1
> +


just following up to see if there are any updates on this.

Thanks,

Shuai


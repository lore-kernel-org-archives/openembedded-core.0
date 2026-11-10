Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10067.1794271359196279509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 16:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mEJn4ixt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GejoTp5x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA0mW435866
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tnix/eRkHhUM0E6vc5kxi0s/7aVb4k2u6mP0xhfY8po=; b=mEJn4ixtdOGzavtc
	QL3SX2S4KYoZCdS3NuJsTsHQE2tTIUDrRObce+KtKa1r0fsHbE9uP+3he+4Mxyju
	pwGxtFj5JG5oW61VKyfDlJMgvq5YgZT+qgty8YIchMH+9N8G0/spXEvA8ZnKHD6X
	GBJhN2/GEAt2k86RcyG0ef0A5HGzeou9KXjx9dL8QIQE5cbY8gS6hpVfkGVOfMlo
	KjkE46vOAWHZ+6782azb4RGzHHDZE/5eCIG8zGVuBG6hVEi+JRGrcUJoIYOk7KOE
	Luv/amo0bxvu4P/rYH+Mp3X4NnFmDwjcio+VemU1u957TTeyT+1qu7d4Z0tUIZgt
	Vp0pHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjanx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:42:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e954d87b48so23618425ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271358; cv=none;
        d=google.com; s=arc-20260327;
        b=hj2ckdBJku6yZrFI4w6h/yvkhUelfGdR/1tcUrcufuNzR8oGR6vsTzftgeLf3qT1l/
         2gylFiiGCqHp9IXGwPM9Pars8A/Fbp3ct1Ao3iapH5YuGc2W0bMethhVRyX5tOX8GZt2
         IpiPZkSz945KaKRBrStNPwReYM7vF5yg8DeI/WELtmFDy//Djin6QVev7+8yHldJt9z7
         dgJaexB3mlt9lw/M+COYrBnmObiC5G+iwQE6J+hQFEevWV1ojMVPpc6lQm45KsQITMHo
         il8nZyjjLQr9s4vZf7Kl2GpsDy7pFzpIsSjQKFeRGp1pxcv4mlxmorQ0pg8s7A4XM33r
         mUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tnix/eRkHhUM0E6vc5kxi0s/7aVb4k2u6mP0xhfY8po=;
        fh=L+hSxwScffKHTYDun5mmRaaioMq9QiPQ4Z2T7OU7Pkc=;
        b=qz+v17KwCZVkb+WL1319GuFp0lDh9wbQRGP5W+rIeKAGP+UPFa4gt8Ed+JBped6jqF
         uR/TW/L72G9L8SAJinxZm9JLCiYYyVKViODuaUwonS0gk0AagQzKKGpbuaMZSdWnw817
         4OZg6fg80e0Vhj9nn94xAgkaVQJ+RRqVagKZO//c/QMz/6Jq+zYdVsFNZBg9BuizoHEa
         2tk17xqjBnjI1vMFpHOwgzvQWfpyjG/hN3rYHdFqMAfkTEqpWJCGxzBdnYpYVnFGUqU/
         XPuE+ecYa52cBZLZLHTmQYE50i60kCdiynuHFoeeD9Z1vU2HC3SStlU9qz1L2bbvYVMp
         ZG0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794271358; x=1794876158; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tnix/eRkHhUM0E6vc5kxi0s/7aVb4k2u6mP0xhfY8po=;
        b=GejoTp5xIJ79OLC3zcpmryNlo0Cu93CUJT0bMaUPZ607TUuiY1QbJwMB9kpKHFfa/E
         I8bwGAuA2gb1g7kDg5p+2U2NNr6/RDcUZahpS4znWfG15DJVcz+tPFzIxRfI012JVdwF
         jAjlzhaF1YSGWQ84M2Y0EQLecdSRcQu2P7KMyhJcM5Sysbxc+xfB4YOkFFUGxK5Ur+l2
         BtPnjfkCnFWU6QpzobkK9oqtM8DlINrsO06yRf3bJS8XKvl5rGWZMx6HLO9JXgW/MUT8
         SQnMHnzLA53OFSbGskymXSMT4wCUQvMzosoeTdAniKh63OacRm5s+fi3MpFW21IEcP+k
         2y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271358; x=1794876158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tnix/eRkHhUM0E6vc5kxi0s/7aVb4k2u6mP0xhfY8po=;
        b=xjrv8W+u/j7/5c9OIZMzxIafib2vuebsEqfLvsFYsOtnf0lRjGOFaLYHlue84GNibY
         hXlBuhOQMtYnMV+Df3G1fvb510/9Z7eqtlxEVy0UV90b/9UUCYVlcoT7gNSOb6hhYSGh
         yinJfbLki/+Si3GeJJcchGQdxslryvzrRBuvwk34+8JTzxfql10hL8al52/45tkl0LOw
         QZwh264WfTT8v90hEcooe6eKWYbnG5VmAxuzuJdT9QOIP2Hb98z53XKORBjQX5V55Vt0
         1Qe67/21h3fe43nEIoS9CrKDEs7SSt/201lx2fD11ubzq+Nm7qEYJ7r0sLky767rMz9Q
         qccg==
X-Gm-Message-State: APuU4Z/6mNPh60gBhwXb5UtgkBfHP6CqUyQbQO7+xsMWdmG/cKcF415d
	clfJ2EK62T5In2Szqycf2fOS8KbOx0wqeaMYge4hKJtsbqNehESsJkUXan3xEDavRV7gzaq07t5
	6wiRlfWnngX4pz+3PUQPDv5dTayx4vIapmvruBJfmqydwyQkXkZDApl0DjxIOD9linPD51LeDJd
	AIEn2tACY/WCL/LKjY3sy9UfikrU55AtEAUMOpVy8tikeixZKy7q5J+Uenyg==
X-Gm-Gg: AYBFou216uZn4JP5UE5nOrA6qpExYBpEZwtc1ie3MzJV4en7u51ix5uDaHj/Zq/RDMm
	i4/dYAE83khcoKklt66uIQ8TxpG/4uPjY4DtOwHFJ8cjZfkluPa6W7pgUY58vmnSJXEs4zVfytA
	XbFhbjbXbieYYMYlv/6Huhbkb4AcEFaT1AXUJGgKQsWbIG0H2bOy3AR0Y=
X-Received: by 2002:a17:903:2a90:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2edb912b6c7mr8010765ad.16.1794271357645;
        Mon, 09 Nov 2026 16:42:37 -0800 (PST)
X-Received: by 2002:a17:903:2a90:b0:2ed:21fb:e764 with SMTP id
 d9443c01a7336-2edb912b6c7mr8010595ad.16.1794271357135; Mon, 09 Nov 2026
 16:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com> <20261106144957.3818987-2-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20261106144957.3818987-2-viswanath.kraleti@oss.qualcomm.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 21:42:00 -0300
X-Gm-Features: AclHuK8FY7h_kgnPKOIcE8Tzk9m7NRGxv1HZVaTXtYA-EYZCyP4Dt0BuNi8CiNg
Message-ID: <CAA_5youMxym5OjL9TxwDFJzY-UnMt_vf9JLsKU4SW7gH1FqW4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/4] uboot-sign: make the type of the tee image
 node configurable
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: QXmXxrsizkumzVfHvj5ypTFsmMG3zRT2
X-Proofpoint-ORIG-GUID: QXmXxrsizkumzVfHvj5ypTFsmMG3zRT2
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2687e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=C5ftWrpYxjZcWcdFdIEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMSBTYWx0ZWRfX6HXdl7/Z1eKd
 7DazzTQ1uEdWR5Ojkp00CWzbkGZFXMx/cejyBFMR/ms8evc3FOt/cUtwS+aqJRGbcYJ5smmtZDL
 YjFnOelKNevHadEhrmoE7mddjaUbjDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMSBTYWx0ZWRfX8PC8M5Le7Dbc
 GgAFHryjPJN+fz4tpfSvGZa7ZxEJe9+sEH3uU1kMj/v5HI70TkDw6CwNFdvAJnDNJCM36y9MhP8
 WdAniMnO/VqUQ+3zke4Ylxa47JiTbF29P5u3fSmpezO6hYpY0a/lmquf0nv2ykq8pTheu4CNenh
 f9HOj0leHwcWOsVE7Gm5QwxSTzoCDEFahj5LJMtZYQwl4XNnExYJYXwvK1j9J3T7/PzOyZ16Kay
 fPTBgV8okBQe1iiQgvBVrsszYKOtjXv3GIPrHh4mRWCm2q++WtBeY9vhAC0Uj2FWWYJZqtOwqbX
 XIYh7DZQPNMf1daMO2C9v2WMfAzofqPabcVBXV5n6Ot3f4RLbbISusZ7Y+4KCvBGlKjc6zDqIIu
 p+v1tcNNj6jhApKnm9/3sGmYV3nmCXKiqtPUEqeyIR3nBvaNASZH7RwpwIrweWIKaceiw+8xqPO
 Iu301s5fF8nCEzJVjuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249884

On Fri, Nov 6, 2026 at 11:50=E2=80=AFAM Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> The tee image node is always typed "tee", but some SPLs, such as the
> Qualcomm one, expect OP-TEE in a "firmware" typed node.
>
> Add UBOOT_FIT_TEE_TYPE, defaulting to "tee", to set the node type.

Where does the Qualcomm SPL require this and why? The lemans SPL boots
its FIT with the default type =3D "tee", can you point out where in
u-boot this is now a requirement for Shikra?

Thanks,

Ricardo

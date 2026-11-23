Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.931.1795457622743174498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 10:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y8CEmXmS;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=InN2XnhE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGntI1861277
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 18:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNtP49zr53ntoy+jTe9EmTKv7H7HiF0Q7nZ18qz6r+U=; b=Y8CEmXmSVEaAOidE
	XUXhmJUDoCYPigaQ1qzdtzKR4yd2rSTv1ryibt4AdcURzttaiWToioL9dvJKYgSl
	0kJxfPaVfL1WdxyHPaUqB/88C9TLGDTZgLeNZsgyf/zlSs+l4NCbROwXbZYb76Ay
	uN/OuGmebaItGOv08G4kDgSzREPO8qDu6KIH0zVLGlNXE5E4iuDDgvUac8Qo0kaD
	/lC8OS7kWMwUr3QdhNUN3sPKYroYn7rdjLzJKpV3FQtLcZxj/foxDrGDHwxMM9sf
	EgrsXulbdSx+H3J1xrEiQMoIzRSAjtEjbtE1Zw/D5DU7JQsDyw2cbK52d1ZWV6NY
	wdOiVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2qws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 18:13:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso3364033a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457621; cv=none;
        d=google.com; s=arc-20260327;
        b=OkgoTApYeMoyId3OZpDQqHN93l64YMY0tCMLlvwgr+QG8mjnbXSg6RFRRQqLqCXmP4
         kcag9iD5L7cnLl0fcXtMmxB/0B89i2LqJy1Qj+5R4TiMtYtX+uUHli6B/vLnacAmdRGL
         PgBEu99hAkNj8W8K8JGC9178TLnmYA7MXUA2peI4LFmcjRpPnRKnaFF6Zv10uK+MKvYA
         aiB8lpwa4+vZZYS5YJs5kF5FZVZ6pL5STMFx+IJ0c/jTNJLSVMNwmIFl7qvFxqjlLSd2
         M5oKW/9ncGWn9EO1RAeseN5k83gkLdQ9++4HFMytDP9Wrllx/G4SwLyCw+KkD9emAwZQ
         Ix4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNtP49zr53ntoy+jTe9EmTKv7H7HiF0Q7nZ18qz6r+U=;
        fh=qNLd4ZDr6pRn2WuMnhxKwAgZBHRwp23PWZZyIzzyQWY=;
        b=WQ4hmiawnFvHS5ZMABYbEc1Ltd+70QeFUalXWdKZTpCg2vDtHBXu3V9/9dIx+PDTXO
         K/Q5jipkUp+M9+UuQ9Qb6clDQPXz133bXW5agFxQDDMa+M974uq1gz/1N6E3EzaidsYG
         Lhsx0bCqMKB/klz8hFVwXgcSe2eX62B6SQV/ge6V1VQuPP97Vj1umB9o7v67syP+Dywn
         XhRmbo1fGeUjejcgsbrL8G+O7JRJ96redAqSh7oCSqgljshkHxLpEvLAChfdQ6JVGnX4
         5QJas6jxGq6n7DRB9gypKL0hNJ+4/p1TCv0OBtnzai7CSJ6/uKt2oVGiFJWKVDjKBs9A
         lNJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795457621; x=1796062421; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNtP49zr53ntoy+jTe9EmTKv7H7HiF0Q7nZ18qz6r+U=;
        b=InN2XnhELp8nw8f/BiUCVtE/NIwwPVrJRc9BRXYxEd/KekDCEolTcMa3l5Vh/eLcTS
         Nf/3b7x0OLb+C0sed/LRRc+PryW9WqIAi9n18w440Lv9L6LrE5B86YqWjp5JPWfljXmL
         tDhpq0hBo+w68Erk3OFChuRnHKaqN4U6WB5oENzkaMkVsAfTpD+b5hXi+rS98dLnQbDX
         PQnxUlOwTKTvgufmg79hpjW7JKwhI8EzfjUKT53JE2eFwICVx2gP8p8PAlkI4ua2jxD+
         2JRFQUr5dC5bBVVuTv+pqfyRrG9L8Ogsm7IG3ksanBp/YiWV9SiAy+0YdFrNzv/87Sfp
         YZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457621; x=1796062421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNtP49zr53ntoy+jTe9EmTKv7H7HiF0Q7nZ18qz6r+U=;
        b=0JSpoa9DlcwWRmOqcc2+SR+ds9DIIpozd0kK1qlut5ReFoX59DGycviW3CTGVhyRoG
         GjAEZnDvlR9uARtH1TbbagahMxVdwiiDpN0syzHrGF++EKigCWuAihagsxBFf2ZKfXeq
         gegUKYyDBqygzqCRoY5Z93hTHilx2bDW9sZUaB6ke8IWeDZmM3JGiTc2dwu2ECYdJR26
         +QrPnNusWPXW+dqXYCtlt3sj+Ac9nRWEZ50i03LAzfEC8d6GniSotvPdvHqxHFL0KQ4U
         Wg+/SdVw98Mm2KCtUiWF+41Eq7sWas12fXYjFB7sYxLLZVGuz5R52//+oAISQw8XrsfP
         XHHw==
X-Gm-Message-State: APuU4Z+NPRfsGIqGxXfhZ7zlETkJZlLpNNJaZB2V9gb906MzjVPn9xOI
	/H8E37LugqK5oD+aCONCKh0nLAdDut9T2p0v8QMYFr4Alu+yBEAMsYUuO0s484f+Zwy53z/f3Hl
	VIc++xBxMavVzihzPRj4v8aPo2K7fbt8dKAMkQl+pVB8AfryapkBQ2/4joCAjmEjD+iGE86oe/6
	QEN4syigdmhMKknagYbpthvPz2UL56l1eQHJWqCMv/Y0JihyADpMqfzrICEP5nnSG4iA==
X-Gm-Gg: AZFdTZcqxdIfs8O58zD94lZXFj1S/iljDLpmw4/YIThAj7MmJJ0mI9ESQJFE7ML5DXJ
	Q7cWoUr3mhDek/XSSOXqTEiqoUvJ+IOXbUI19aFRsoMeE79g5bVatxBHOl8pwLMHCODCwT86wvZ
	MXsNcmRRENFEUtFES+G9vHCcX1441r+jkXmb/5BWmGCqAL6QSIVQzhHIbczOc=
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b41c907e21mr10516656a91.26.1795457621419;
        Mon, 23 Nov 2026 10:13:41 -0800 (PST)
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id
 98e67ed59e1d1-3b41c907e21mr10516629a91.26.1795457620933; Mon, 23 Nov 2026
 10:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:13:04 -0300
X-Gm-Features: Aa3M54oUkXfLVOWYK7nn8UNgkbd6T7iEFOA5OntOhgFwPrXjFBAZv9PA3CN6TFY
Message-ID: <CAA_5yovVqGo6_TgUcAMJVGi4fmMcWa3r_bPV5g37Qb5xyjCviw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/4] uboot-sign: support an SPL FIT with
 firmware loadables and extra configurations
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
        Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX0MQjsm7pzvgn
 S3FUYs9Zw73Y7O0zXiiar2se48j+QjONrKcYNZrACtMeIJeGcoBYJ/XQg04wfCjAkxPwh/2EV8o
 WQHcBbKZW47SGAHLcm8eZoVGnN4AIbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfXziuuV4+vW9Z1
 x7DHbho2+DmKBjff0OGrYBCmcFtYHN1JxDDqZXYF3uITzgoAccb05DCGChjTYDV+kX1Y/Ct/SSb
 AYX8OZTNpptCillU6dTf7JB7IY/izYedTp3CCk30x/ZVi1/nbAJtnJPBQXOyk6FPTAa6iXofQLV
 7LLwHyNswmMkc/sQ0ToPx2pQCz/ZblQ5TgIdAyiZ6B2rtzJ8MKjM3Xk2FGHAW58toc3wmA7yu8B
 qi9XtWV0P5c83xW3PHk2hgD09DVabsUy+x6xjSc9Q2yzJzPJf+VsQ86PYaR8a7ACzmqE6DG01P2
 rZ2hfvFTJ/kGOyRjIW7NGtM+bqXeNRraA+E/1rDC//pGtpW+Xku0GrjJsOG+aQfy8UTR7+hPCS0
 XCOrngsZEnZFLkkaO0XpXmkjh5S1IaUhxYGL96ZAwc/9ZxtqtmEd0IQayhOQr/5HVsIpGVXoaKc
 4MUmujVVR5nSJmWf0yA==
X-Proofpoint-ORIG-GUID: 1fpgby5HDVakjp2l-f4vM1dPK5BNS_Og
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b048256 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=m5KGUUsMeP5xxakH:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=Jr1nKlO3uwbBBqX26JUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 1fpgby5HDVakjp2l-f4vM1dPK5BNS_Og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250931

On Sat, Nov 21, 2026 at 5:59=E2=80=AFAM Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> The Qualcomm Shikra open boot flow replaces XBL with the U-Boot SPL,
> which loads its images from a single FIT. Besides BL31, OP-TEE and
> U-Boot, that FIT carries the PMIC, DDR, QcLib and RPM firmware, and has a
> second configuration, "pre-ddr", holding the images the SPL loads ahead
> of DDR init. The SPL picks the configuration by its description, and
> reads the image data stored after the FIT structure.
>
> uboot-sign can't build that FIT today, short of writing the extra image
> and configuration nodes as ITS text in UBOOT_FIT_USER_SETTINGS, along
> with copies of the hash and signature nodes the class would give them.
> This series adds what is needed so the layer can describe them with
> variables instead:
>
>   1. UBOOT_FIT_MKIMAGE_EXTRA_OPTS, to pass options such as -E to
>      mkimage when the fitImage is created and signed
>   2. write the image hash and signature nodes in one place, so every
>      image node is signed alike
>   3. UBOOT_FIT_LOADABLES and UBOOT_FIT_LOADABLE_* varflags, for
>      additional images, and UBOOT_FIT_CONF_LOADABLES to load them from
>      the default configuration
>   4. UBOOT_FIT_CONFIGURATIONS and UBOOT_FIT_CONFIGURATION_* varflags,
>      for additional configurations, each checked with fit_check_sign -c
>
> All defaults leave the generated ITS unchanged. Each patch extends the
> U-Boot FIT selftests, and oe-selftest -r fitimage.UBootFitImageTests
> passes on master with the series applied.
>
> Changes in v2:
> - Rework the series after the v1 review: the extra images and
>   configurations are now variables and varflags handled by the class,
>   so no ITS text has to carry its own hash and signature nodes
> - Rename SPL_MKIMAGE_ARGS to UBOOT_FIT_MKIMAGE_EXTRA_OPTS, separate from
>   the kernel FIT_MKIMAGE_EXTRA_OPTS
> - Add a patch writing the image hash and signature nodes in one place
> - Add UBOOT_FIT_LOADABLES, UBOOT_FIT_LOADABLE_* and
>   UBOOT_FIT_CONF_LOADABLES
> - Replace UBOOT_FIT_USER_CONFIGURATIONS and UBOOT_FIT_CONF_NAME with
>   UBOOT_FIT_CONFIGURATIONS and UBOOT_FIT_CONFIGURATION_*
> - Drop UBOOT_FIT_TEE_TYPE and UBOOT_FIT_FDT
> - Add selftests for the new variables, signed and unsigned
> - v1: https://lists.openembedded.org/g/openembedded-core/message/249691

Thanks for the rework, this covers my v1 comments.

Once merged, please follow up and extend yocto-docs to cover the new variab=
les.

Reviewed-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>

Thanks,

Ricardo

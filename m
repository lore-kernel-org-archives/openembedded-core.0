Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10164.1794271967385447536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 16:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Tk3kzIPN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CFgDmwkZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j2lE1804146
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKx0gclrhkf/1xcKpZIdLu2hPZUXM5nWZcsjETy3Ono=; b=Tk3kzIPN5xKV9md2
	an9+RrXDe4F6QJvHq8pCjfv/LbsQixBm4IXKID0Rub4BjrOnCp9ls37z9pK9lVmB
	oj+bTwHPgmDcaC1yNQOkyPlleFrYrv2GyZwIYlevrgYl9pBTNXawLmeFYKDzubMU
	14pLyze3dE6eJyYwBWdxgSlsf7m7bonVOyAIP14Ldyn3JR+6DLKQLRvrpBQ3nzgb
	NLx9lyenC35O2pAb7Ab84vLtYBy/eGUyfBkpCGh2zrJv6LvAL21c8B/FSIHwKNBL
	XmWrQUgzZRQrtmT273V4bjh8VAxpBiUqTnytMkh1CYM+JwxWlwO/N7H2QeKNYosi
	bEF8ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapawmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:52:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so1327273a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271966; cv=none;
        d=google.com; s=arc-20260327;
        b=aeJ6KHkUSFZ+oSdBbr+k0rKfZcp6JCwLJJaRzZrCRGRzW9Sl6suTTbMz8YSGHrBrmC
         ila0ApEINngjeteyEu9KOjzpVnISGTTM3X+BCNo567aONH4crU+1yzRZTLwAgTq05q2e
         n8KjxVdbPlBdaP4vTCRBTdMWK/7vcOEqZd0pN5qrHYQxh2ZJzFKfUEGuM3lG6+rs0xEQ
         1D/R2WrXv/Ft82gnS8TnW+Ug4z4lgR5m176h31DJC/eKWW5L4MggKjoQGvwGERDyzEhH
         pR+pRFL8OiKW4/ZytyVyVD0WnS5SerXsTbIDL+X45svi6IJShe9nMBzD/EScv33qywkm
         IqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eKx0gclrhkf/1xcKpZIdLu2hPZUXM5nWZcsjETy3Ono=;
        fh=L+hSxwScffKHTYDun5mmRaaioMq9QiPQ4Z2T7OU7Pkc=;
        b=JvuolJjVsMW/yXA5CmjAaJ0/gNnchkKE9OrwQowJzcBEHFDtGe8yu+XTL/J0H9WsU4
         xqTAuuqwxvlJelZ6sLZnVMAU+ZaT/5bHqpontbDR2DQGE7j4UsSZr7hx68oOEifvInff
         p0EhqN+MNZnUoqjxLdS4DXDuiVJu4tYhmwHiUgMRR6Wf7R2eRdd7QGmg5798xW/q0jiC
         DNqs07YqRQbJuSbjKdaQL0o6ok0DK0y1Jr5UWw3fl+RyvMS+nYzlKyImugr2oL53Hcnb
         2Nc6m5WU/ir+VmbeunbKYzu2f4VYgEQ3QkiwMLsKkLPEe9Xx9iygTMlpLUPAleqNKM8e
         tT/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794271966; x=1794876766; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eKx0gclrhkf/1xcKpZIdLu2hPZUXM5nWZcsjETy3Ono=;
        b=CFgDmwkZbiiT1Y5AMhj2+tg0OXpqSva52iXEETJQxgXNpRlJ4xVfoUeyqgB+vVpLlZ
         Z/rkOOZJQThmdu24Tp9aJ1oZQWgyhfG/lTkU16P4vtUm9F240ws1xz/osKWErMAeq3dx
         F00nN5hl7AMsJlJ+w3/ItIWjN8iWoN5WNoRgjseXMVghVeInBFblknIhrrsQW3Hmom5e
         dOttXtiB7gOOskUuZAAtccYliuOO7V3ICZOnI9rUmfDghj+bsdRTTyRfBXjPYfHzkYWn
         oOVuIJZQZm4frg3/ElMpuKe01ASSlBJ8/uyPurWqBQgCedHE6ah0ut4i5KKzp02d0fUL
         8dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271966; x=1794876766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKx0gclrhkf/1xcKpZIdLu2hPZUXM5nWZcsjETy3Ono=;
        b=ZvErV1j5317HeA2xyszALX0NDENhmLdRfx4qhdwymSsrFYkSxzNpZEhFMVMrM790qS
         aIQHfduT/oRjU2WSTsuRWXOCQ6iiE0x3WCEUhUaW4sH5HKdT2/vMJ6+wpNZdp1dX5qL5
         MSJ0jXj2V+sBgTyn+6+2apc7NB7eJ01pafqagTiaPfsSLDD4OMZxwCr5p5y64c0j+3ic
         ulzmZYyqH43inPY4ISiNe27m4K3/7nxM4J66usV/Y6lV8NYRetH4eJF1UQZ0LLt6dJMY
         8oP4q/tUuMYDDNK0YHQ9sI3/CO651TgYSLHwQ8YE6pTC7mxz4BhfFdeAh1BQk3QO2a+k
         jFmA==
X-Gm-Message-State: APuU4Z8n/ddPEakWPuohMBYDfUJ2cR01nWwKJ5Hjgl5s54KI9bm5mZPz
	+oWiqtWcjmW2pQ6UEaWTRtQoVnT/48qPOewv9wBJeJDkY9RAp7cSUWydHM03jf2Ht9aPnwG2KA4
	Y+62XPJeiNi615t7/kDE/5k3CHfTXsN9pgHBg8VZquyBQzr08k6Xv4tcrk6HtU7e2CAv9xWUZ3x
	aExSXGz4XJu+AiRQ/RAo0TPEjWzne/LJFlDlJ3aTW+bebqZfGp15/tp7ONdA==
X-Gm-Gg: AYBFou053HhjaV7S4yV9USBMB2H+tksS4tOI9f0MWC4x2GjtnKNHbp1AUkYa/HcQkbp
	jXaf8OCA9cJKPqc1K7XGmPZvtn67V9hyQ+LBNeN4m8O2KIh3oqUKxR9W9f1X/nDsnRbjkajazlR
	DcVQ0w1HIVuQR6HH/zYK/Gl4h2zD4aAnyE8n+rrmahb4c4Hl0tx1RV2k8=
X-Received: by 2002:a17:90a:e7cf:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b16797cd8dmr829154a91.21.1794271965755;
        Mon, 09 Nov 2026 16:52:45 -0800 (PST)
X-Received: by 2002:a17:90a:e7cf:b0:3b0:9bfa:72ac with SMTP id
 98e67ed59e1d1-3b16797cd8dmr829139a91.21.1794271965085; Mon, 09 Nov 2026
 16:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com> <20261106144957.3818987-4-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20261106144957.3818987-4-viswanath.kraleti@oss.qualcomm.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 21:52:07 -0300
X-Gm-Features: AclHuK9quds9PZefXQH5Kn_sKoEKxpMSz8liUNiTxSUls3SRNL6rV5lzIlvbXZw
Message-ID: <CAA_5yougXdAaiN-Qnf6-RP1zs1L3Ri1SFb7JGqUueXjN_3CYKg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/4] uboot-sign: make the separate fdt image optional
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMyBTYWx0ZWRfXwgLYcg1fctFp
 EXhAIMsy7ZADbfUfl14omjoPMn4K94y8wRVLMFby1lgcXZVr7aIMfRNMQptgK1hb3e5njlxbi28
 szl1ZAHY2ozltJxKbYy2oO2hIk92C8x4c38GL7Vzyr5L62zw8kcG3P58Ef4KlbNvYistXLmVTh1
 IPSc7PbM36FxVrgOGY5ggx8Snnj1Hy7Dwii8oPbaOX9rj2bjO75ovV6DL0kaXFB2Wy3n8bC2bp4
 5VnBooYpYKlZ0UPVr1z2Eexz+W5FMV94fpRbGr5099PPcvwBxfEiNBhQ5BZNyByG+ie/v+WIX6X
 s7I3svcpSP7e/vwhk7a0XxXPpt8XVmanMHzkejnXV8UuGc6XE0xOEyrNyTV0fCmhKaBeEGqOZhq
 obOFyolz670JWbew2av4G+PvbXxoSQjl7U1DiT+AAcd3jhLoR+Y4bCcZf4evVCzWrRBVE51Vcvu
 jvHFhieMGNsAHfZ4Yrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMyBTYWx0ZWRfX4yeGG0Y4C6gi
 jqR9QH1D8Nzunp+jWspYCjOZcSl7SBMgoJWxsxAg4AgtyDt+5rxG9fr94IzsKKX1Bc42lOPe5QG
 BRp16oqH6hwMnd4lgv3+lQDy7ao1GYk=
X-Proofpoint-ORIG-GUID: QotHCmWz-taXWlG4OrqmptfJVHkkkAKF
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af26ade cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=wytED3W66SEsADghYWAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: QotHCmWz-taXWlG4OrqmptfJVHkkkAKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249886

On Fri, Nov 6, 2026 at 11:50=E2=80=AFAM Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> The U-Boot FIT always carries the U-Boot device tree as an "fdt" image
> next to u-boot-nodtb.bin, and its configuration points at it. An SPL
> that loads U-Boot with the device tree already appended, as the
> Qualcomm one does, has no use for the extra image.

Not sure I follow why this is needed for shikra, and this also breaks
verified boot when UBOOT_SIGN_ENABLE and SPL_SIGN_ENABLE are both set,
since concat_dtb() adds the kernel signing keys to ${UBOOT_DTB_BINARY}
in place, but only rebuilds ${UBOOT_BINARY} when SPL_SIGN_ENABLE !=3D
"1".

> Add UBOOT_FIT_FDT, defaulting to "1". With "0" the fdt image, the
> configuration's fdt property and its entry in sign-images are left
> out, and the uboot image defaults to ${UBOOT_BINARY}. The new
> UBOOT_FIT_UBOOT_IMAGE sets the uboot image data explicitly.
>
> Assisted-by: Claude Code:claude-opus-5-5

oe-core's AGENTS.md asks for "AI-Generated: Uses <tool>" instead,
please make sure the entire series is following this pattern instead.

Thanks,

Ricardo

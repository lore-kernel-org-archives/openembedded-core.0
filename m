Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10483.1794272926705308835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 17:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=i5/yB4ob;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jLfYC/2/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j2I21323021
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 01:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jzu/X/7hzne13SmiqgYc+a8tnsRCu5uggJs2hjxX4OQ=; b=i5/yB4ob+FVKzRwE
	+qlaKfUhUFGOGYI7ohGkzwVtVPS3aQs9zDznXSZ2jrpsFvClCZR18uCX5rvj17F7
	awsPT4sZpnrPBbeTgBdxUGJ6gb3D1oYhI9O0n4OWxS1+KvsHElenftTwGcsaq3ne
	tkTyadojAHixvRFOaIavbxrlmPxrybyc3SM3ULzut168IaiCdQxo+Ln5JdwS5VO9
	oHXF7ijLH7EHldpgZHUWilU/307lDbwYVAhIZ0bJXC7QZWRzLCYhEVDsB1X2EJu/
	Y3PGI60rqkkPVjGZZ6+luLPTBkEkU1l+kIOcI2G3m0ufQa156cxYLDIWgHeWkwgi
	3cYwmg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58bg1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 01:08:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb990c283aso940750a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 17:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272925; cv=none;
        d=google.com; s=arc-20260327;
        b=D1JDRpeBsx9+uUcSexoCxqVSupZOdYNmw95kJXVxf0800KXBCO3kSzxdupImmHNwaz
         /9SlXTHMLudLak9gNJ3qHjSjQgEIYIWTL4djWWpPh5eG03oOf7npsfSf5cH4ZBEviL6/
         dDVx4hWLOenqpLuCEHLqp0x0byQ85OgGxw61hUhNLf9CttaXOnCjfYmBHtfgngoGl0Ae
         Uu6+Zy1pHDz9XnqYEVRgnhf5JsIv6yWD4esSkQTyhnRvp4wbdC5aGcEw4QIvRbiNoJn3
         gVT276rbso7PfDd4h96ngKfn0ZEtz26Xf/blOlCEHOElpN6Qa856BsSETRlvFvX9ibH2
         e3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jzu/X/7hzne13SmiqgYc+a8tnsRCu5uggJs2hjxX4OQ=;
        fh=L+hSxwScffKHTYDun5mmRaaioMq9QiPQ4Z2T7OU7Pkc=;
        b=dPKNK5u6rEc67+aTgqyWNDTb533PtzlrRl6Atj7eq/q0k7mJZXo9vl45+1/rnNKZL3
         CwIeNtTyOxlN5vNcuZkvaaPoKzPvhWUBEmhUVWiJWc/APnn54GxktzCsrXA1WLRnP3jn
         4VfPbvqeODxd3BwK0t3tAsHvf3/UQClat8q6wqPl8Oc44RwTiZ5Xd0gIRlLY/cCofCHE
         ybvuwBgFs663dcEpV+XqotKLAZ64LkoE5/fDag0DDWiLJ+rIqpeh5m25c5PVbNoBxfqx
         BNSBXWDLgHAWvxuI78N/MZqRWlO2ACsNClsrS+ZTLsEEQ3vQl3cS/YH/nrp3hxR4XpZc
         s3gg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794272925; x=1794877725; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jzu/X/7hzne13SmiqgYc+a8tnsRCu5uggJs2hjxX4OQ=;
        b=jLfYC/2/rBwi6OXZSElDu1sZBiszP/ah15RXblFBf2Oa17CJix898SJWrJLAhDz5Y9
         X2g9VmWYjFeYZtDXOk+0wayGF7EcZ7IQLKBTk7UlNLlUcsp8Vb8KWge0N77d1J7yoSBf
         5iwcu3knJtBiA1OBm0tMFvhk/L0S5l5f/vz3AHhUBVWplLLudf2L23Gw6tcbCRbDd0WW
         WJquQwtcke/KEnwtjbjdPigmgehXAIkweFQ7JC2TpWl+242aAPPGlkkt/embi6A+VyPw
         S7TB+Ctf6guAgHbXuFwyuZ0PnAp05v1xWQGf1ywKzQNljb8ndcH4Y+M1/na8ePaWTZGm
         3bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272925; x=1794877725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jzu/X/7hzne13SmiqgYc+a8tnsRCu5uggJs2hjxX4OQ=;
        b=xOJ+5VspkFVScd7vxgstGDeJF+gXaTbESkuU6OJqSvKN1vZJ792a99KiQ1+5YV+IFn
         0ol9QZ3K9hk1Muc0G0zTp12dYu2WVVdFzhW5VFVI/NZpjpUCDCda6oeebXOX5fS6wMbF
         oyiAKnbZl30eMBEp7jTLIlzvcayuAEzr+fffearWiC9LxpgDcTyPwmjcK9jtOed1RlFm
         BXpOe9kVd8H5Qxp53sV41P7GVK9YaGVnSB0I5JG+BxZzqEjXNRT/JIuKdIfCIFIBLbcT
         UZIHpCIUIoDBNVVL7XYb8RrjJXKc7QUGANFsB2fc1WyRnQ20UebukcU59lhMmRpseI6E
         CccA==
X-Gm-Message-State: APuU4Z/9jRDHV+p8kh3ZNArEGvyOG/s9fS+jPgANpfG9DHx6wqc0cBpF
	tXMC4Ma82APWiQkttrL2YZyBGuqtZ5xJ886muF0MWcZBalZlsFCTYMHwJB+/lymyS4zxBl/730c
	+QHxmKABTrk7ZwGKoeOb8PDz+KB/5GGjU77Xy+b+kinS3ErGHUpTBe+9rU/WdPcyC86+5CPQHv5
	q9TtGiHUTJfh5N6VzgdgDjvLlDWHRoCH6LVd32YVGx46tLrW0mxAM6F1GhCA==
X-Gm-Gg: AYBFou0F21WGaajCEG4m/sxo0DxDqU2fMNpSrL/XpqBbtuyWJzoul83Ynv+28fvxW4/
	kWeQcfZV4NTN7R20BJ6QfaztMPxBBFPVjizuvAWiA/mw/bIesGOpbA5ucm68s4NtiA9FogGnrie
	HVlf55MHxvnu6/ryVmxA3NJKCPyJlMmEC6JRTL+QhV0gZBvXBkXLO3YpM=
X-Received: by 2002:a05:6a21:498e:b0:3e2:8c2f:4b80 with SMTP id adf61e73a8af0-3f18f3aa9fbmr596525637.25.1794272925172;
        Mon, 09 Nov 2026 17:08:45 -0800 (PST)
X-Received: by 2002:a05:6a21:498e:b0:3e2:8c2f:4b80 with SMTP id
 adf61e73a8af0-3f18f3aa9fbmr596512637.25.1794272924657; Mon, 09 Nov 2026
 17:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com> <20261106144957.3818987-5-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20261106144957.3818987-5-viswanath.kraleti@oss.qualcomm.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 22:08:08 -0300
X-Gm-Features: AclHuK9w9cQkao4N-QWKDaAkeq3BcbSFBv5MbIuH-RNS-oSwC8fq5rfWgvP4ey4
Message-ID: <CAA_5yosi1djTZQ7B6CP3VO=p5z9_a+KKu=kSteNkRAEdDcgAeg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/4] uboot-sign: add UBOOT_FIT_USER_CONFIGURATIONS
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX1+0a9Wjcj6+k
 XTURdN78UF27gfQJqB3N/R/YippL0TZ8B6LKH2cJ40F/d7lGIFi/V+YG557f8NXfuq1Qe0pyYUh
 8OGDz+POJnRnACdn6yc+lzYeEFpiCnALnYy42Zkhj9EnPbnawZx8tyANdtu2fvLnxhGsztIpG/1
 YGk85m3MuWF0soEAG0CyG3WAVFpCj/J6/GvQCwi/42pldrRsBLDY6ul+cNx4eoDvBhbJm5yQHxX
 opalvuiybNkn+hS0HoryK2JNIrzotVEvpJpjglhWiOqVBYQsbw5tZqVkNvRCTdU8/A1HoBDCEmf
 p27XqBuakpMv4De1bPIOvLVcoDEhXjFQC3qQSVUeh16dJP/fOe3ceROkFl/2Um+G6TgfH5OvKz0
 1FiSVryjQnafa0wl88DnC2/Ys/G+GNIsD+8RiNiD23uSSeWiXqrgldaMqZKOh33qdedT4ma2mcp
 9bLLh5i7Klft8D62z1g==
X-Proofpoint-ORIG-GUID: K8YOaGVe_C8zV1-9YxWqx_WRyAc8fqI-
X-Proofpoint-GUID: K8YOaGVe_C8zV1-9YxWqx_WRyAc8fqI-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX63bxRUyYTv/d
 g4zO6tmKd34x9ir1AjLipLHHgwQxaTqCPFu3fpMR2mjGPqRQh39YhFPtqq45HQmnov+qbroxSSs
 DjhOrKJMgJY6KAAtiX5aA9pJW+cv3P4=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af26e9d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=T7q_E9Mx4alo1IoGPHkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 01:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249887

On Fri, Nov 6, 2026 at 11:50=E2=80=AFAM Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> UBOOT_FIT_USER_SETTINGS lets a user add image nodes to the U-Boot FIT,
> but the configurations node only ever holds the class's "conf". An SPL
> that selects a configuration by name, such as one loading firmware
> ahead of DDR init from a "pre-ddr" configuration, has no way to get it
> into the FIT.

SPL selects by description: fit_find_config_node() passes each
configuration's description to board_fit_config_name_match(), and
"default" is only the fallback. What we have here is the need for
providing multiple configurations that are going to be used as part of
the same boot flow, which is unusual, so please extend the reasoning
and the need for this patch.

Also, this brings a major concern as we're customizing nodes and
configurations outside the logic of the class, and this has a big
potential to break both the hashing and signing of the nodes (I would
prefer for the class to be the single and only one responsible for
generating all the nodes, and signing in the end). Here it would be
better if we had another mechanism to expose different loadables (like
we have FIT_LOADABLES for the kernel fit), with their flags / load
addresses / etc as part of the definition, and let the class use them
when creating the final its.

Thanks,

Ricardo

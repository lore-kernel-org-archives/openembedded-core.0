Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2150.1793234687712265547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 17:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KQg/xvz0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fymF22iF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMAvDK2981731
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 00:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZXDojITsp2Onq0+d9RetnjgB
	4s335xV0FQEUP94nGdg=; b=KQg/xvz0a2YgnPr3/Yo7tOvTgaao4gmykAGahd5f
	j4B0gG0cKpx1YmLLl5JjN8GemzZainMteXy7sFTWAlHm9VhbZAQR4lKgYiwlY+u1
	yG2t6Np+eo1znqwJnmV2SgEFrvnAPu/TZKfYejc9Y55WSDiNtY7NXaiiQDl2+1wg
	RSdV+1Z1A+yFeVDg8ifXYTr4NS921JNqqN30qBIRDOQ0CVNq0mkZM2xcEWWNDj6m
	R7XPr3FgpCVSG683SNRMBfNWFp+cya4iIbkbjzzQMDO8jRsYQo5VJqI0rOHhq85c
	8/RJrymQU5m/Aqu2uqHmIqlzoHO69SYx4BO+ZxbGdP6qqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc16gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 00:44:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9440b27c1feso220548485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793234685; x=1793839485; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXDojITsp2Onq0+d9RetnjgB4s335xV0FQEUP94nGdg=;
        b=fymF22iFzNS4ibiAC/b0bqqyGImKyAsiiJpsbB2IkdjwWOF7IzHDZCWd2cCFkkZwQo
         MnSt58HUwztw4YaSCfmFJ/+Z1t5RXzLz6UX7cjQl74cnql2msAEnYF7gWcVBj3IKrs69
         1aPRWtVP1PpvglJ398UCExDTV5wUpA/IYNLSlFjJ33WZW1kQ/nwmz16vjBsyhftIQg80
         vzaxbpS0OcKkstSRx9qM4n4rLica/b0RThy9ocupRUiEjFfVvT3nRdhtyXXz9frqk/J6
         IPgXgH6RXXlaOlogZ7MZkgSc2L4iEZEeagBt2Xyq9XrujWb8PfLHl1Rn6uM2Rd9R4Gdv
         IBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234685; x=1793839485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXDojITsp2Onq0+d9RetnjgB4s335xV0FQEUP94nGdg=;
        b=rOPDChQAUOcPX+heFW25f4g6r/Qn3aKI3HvlGrSAN3fXufDPU/H9WRB0g100eVmwFn
         X94xuSrjGPqyiibMcxdjGaPfwt59qpSopLdPTjWq2zoxHsJkCQbPcqhDk7sGutKgkG54
         TBQtX8xnE4IxQs++pgAYIFtwf1GR75ZQHxQEbrax4pRTYu0xlipZdQLZSeKKimcZV2lH
         R+qEzUUG+KLTVlVn0hOqyQqHz/E1Px6St3RESJ/2ZqEyurFQc5/fMeHtFaQw4riC9T59
         2jLKXf38GKcDjYpdNlCZIV76vRTFfpFGG0v6utP+VYm4kHzfrNjDdk/iNjwJZi1B5y9Y
         VIiw==
X-Forwarded-Encrypted: i=1; AKwUvBwie6VV1zqaakfcO8dyWHPwjFbnvInv1IqT9F6AOEMTWTG9hfObx6zaVjK1wuM+YTyrxIdPtPpiSO1fvNbXmmyWHA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYImc65Vp0xL9hrBRctfpZtROeVH7klyjlc0XrMTPyeq7be9c0wJ
	9ILPjkYUCKaEKfIGCBxJQXi/slrSjvP1U3jgXxFYUWY+VIzROb59pmdUNBbDT+bWT1A7xI34iKO
	2xyRqH79pZO/ik2iB9BffKeAOd+hvF1riMl8eSbCYAqs4ww2Pbq24hhrHCqbv6p31OOG/jSubM+
	AmtfZUtLo=
X-Gm-Gg: AYBFou3NTVnfQ6yX6cBFXl8Z/FNBp+gyknkixBOwHRrKSAwIlerHU+NJzunc4p29N2g
	5Ub+UXDgs2zlFVpSfFhhbHQX6KI68jW9rNaxlPZNTMftW6gxgU+JORvbDX0QDfgG84LwlJbpIF+
	dKlsPLBp1iSzJygujwuRSamhNPjWBonesUnJ4lMS3XqXp31SDQLl/7EHqx2/EKjNcDlWQaCRUpH
	qV9S6DcfUfWEIovYedJQGXU3xf7cha3A7A7lqTIMEmuFAJwiMwMlwPwQhJ+oqtVlREM/egk4jG4
	oA4OQOCpabVVE0JWuNOs2SC7HJcjFLNqoIF4kk2dljUDXoowZTaL16NYOOVIcgwefnl1Sjdxx/9
	l53NHbURJNdHkW7HHHc8U645g97FusRpbDhz4mxzEpVGaFn9GkYQ4lwjjAmMTJTTQNUDoJpJitp
	9B9X9aMGK9Uso3KUAekWlMhFwa9kQdhbE/U/TZtbR0/DXWo45YHpUWIH37xhZyaw==
X-Received: by 2002:a05:620a:280d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94408936293mr595030585a.12.1793234685585;
        Wed, 28 Oct 2026 17:44:45 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94408936293mr595028985a.12.1793234684947;
        Wed, 28 Oct 2026 17:44:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca57dc11sm940469e87.33.2026.10.28.17.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:44:43 -0700 (PDT)
Date: Thu, 29 Oct 2026 02:44:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: jose.quaresma@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] igt-gpu-tools: fix build on non-x86
 platforms
Message-ID: <ec5inptrwoorqndzh3oj25wpcq5uigf3kzp5hpbwrnjapnhor5@hgbkezkezgxa>
References: <20261028101022.3308-2-jose.quaresma@oss.qualcomm.com>
 <CANNYZj-Z99z6A=p8XHinkOFC86L7EMWUxNfJdd_39Op5N=AfGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-Z99z6A=p8XHinkOFC86L7EMWUxNfJdd_39Op5N=AfGg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae296fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=QizNMybPmbXYK5WU1gYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: aMMSPgf2asVeV_65-38YWkK_FLMta39u
X-Proofpoint-ORIG-GUID: aMMSPgf2asVeV_65-38YWkK_FLMta39u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwMiBTYWx0ZWRfX1Bn37EQw79Hm
 jUgTUgGQcBcCw4FlZfgHPn3HT7cK3r+eoyCtvghQfDVLLJQ4DjOyIwhCGCkZr/RYrEQlxDXTWLC
 GvBQdeD9lQYLpbNyToDJGe5rD+BRm5Pj+VuswxroeCSvvb/pWjBW4t6cjpq08DCMUGXe6pXq828
 P0lF7BGyFj8XRFSe6XT27Sujap1KZGvfs/EjBoC+e4glFQ3F/bc2tWs/fgfkUgFLhBWtWCm+Tyr
 GKio3A7Rit244zqfUZfk2CDZhPV+r5V+RF+aRphGF9A6hDlvw/R9Gx64y62fNVIwkAzlbeSQlt+
 DRjNiCH3SJJsr1MhxHRH8IcHh5Erh9eSibSYVSo+w5rHEM6XKXV7w336XNKwiJyD+1aOrGZYm/0
 T3d+kLZ+P5UuBCK8aq8tTkqQcCOsZbkHOpOn0YbBzcNCnOn7ZMYxYHjPGf5afkNPHzOykBv5bCs
 kxbZ+eZCYEKxvn+7FOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwMiBTYWx0ZWRfX/HTCtSDiyiZ+
 3WlX2J/2x53FZpQSLmwbPtPmcRr1CMaiIsPZ4cmRtOoUZIgucFMEAQsyOQ3/3Jf2w/qBWMpxIs6
 ldjKgfsf4SWWH7YlQff1aXuhBIGCCWw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 00:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248856

On Wed, Oct 28, 2026 at 11:28:51AM +0100, Alexander Kanavin wrote:
> On Wed, 28 Oct 2026 at 11:11, Jose Quaresma via lists.openembedded.org
> <jose.quaresma=oss.qualcomm.com@lists.openembedded.org> wrote:
> 
> > +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > +Date: Fri, 26 Jun 2026 22:34:06 +0300
> > +Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
> > + platforms
> > +
> > +The "pause" assembly mnemonic is only available on IA-32 platforms,
> > +breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
> > +assembly with the preprocessor checks, making sure that other platforms
> > +don't see the invalid assembly.
> > +
> > +FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> > +Assembler messages:
> > +{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> > +
> > +Upstream-Status: Pending [for internal clearance]
> 
> 
> So what's taking so long with this 'internal clearance'? Will it be
> cleared, and why does it need clearance for upstream submission, but not
> for oe-core submission?

Legal processes, where I need to get an approval before sending a patch
to a project.

-- 
With best wishes
Dmitry

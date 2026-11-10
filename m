Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10127.1794271585507188864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 16:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hK/GpQbc;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gCQG0tvQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jCrj1829725
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kE7IP+MqX5ss6Mk5GpDeg38jtHBXHdobA2ZEiuyb+Yg=; b=hK/GpQbclZNHJjyB
	vGmZEm+zGk0JpQjDvI8vvGdPtE5tjK0FjjkKr1bulCydTm7Rz5yB43TEou+sSbgX
	q3yOIwtgRr2LdWS4xwIZaIaGklBdOu0VUjtF7VFVS7aOoZtC2MJjcbwLNRgorLoz
	65SOhhb29YTCbfyxJHIuMgr6NGJzETYv4aGOtgxzBOMA/JE3rMCwE1W0cY7IcZ+X
	JpfN5h/XMa4s1VHCqqE4jyGWJjB6etqiuoo3cdXa7mEyL8jXEUacSASyP+DNVgsy
	tq12KoMKT/shP0OcCP2vyVBEh+PkmQKpV8lVuZEVQ9iuOpi3+AXHqyop/k+/HB9+
	R67SOw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5apqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:46:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so1005884b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271583; cv=none;
        d=google.com; s=arc-20260327;
        b=raIo3/2tclDPkz97x2mmcEd10CwI6Zf4xLDZ3871tAWDlwZcOoYTbTPsBPhZQheT7n
         hgpWwNKWzNSLdKq+RTMiruFHsElPxJPwHxBlUsMokz3KUzESdAGz8bWop0MqqeUAY/nz
         bcOGuxNO2UXRjsBMQxGdij+2aNS1EnU1T8jh3U1KimEcQHAGMJWzPvS4n/nku2MNcNtL
         dYMkkirPeCg4vxWezXzJPCVbe4l6r8QKfSl2DmyE2SpruHHe5b0+2JiKG5vp+W08iezU
         JpBKy+FPKNS+POO5ggI/BZEfqiaGYIjRO4Jx0sA13hykNR3LRUsKnf6bn6XpND+ODe0C
         ZHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kE7IP+MqX5ss6Mk5GpDeg38jtHBXHdobA2ZEiuyb+Yg=;
        fh=L+hSxwScffKHTYDun5mmRaaioMq9QiPQ4Z2T7OU7Pkc=;
        b=MK6hswxqmKb9Xku5q++qs7rdRqWR37raQX50mhBL+ilqXlU8tV9GgnZK0aPF8r1m6d
         aw4cZBMwlNfJWXC+121Ri5TDDGTCX4U7JYyHA7x3JXsPIDf1m31m7JeqiWqGaT++Atri
         xwC/eXoSakc3As1w1WGUkI70bJC6kwwYk+ZEuWTu5MlN+2c4lhQJEWGhOLbl3/s49T7R
         8qo/kO5mpk0/R2d39z2+yFCk1w+caUNtxaF9dt1EliUf4wPVB+i+XvmwMZi2jGhA7yu0
         I7qXqZE63ZUauxm82YPx+I8EYHaR3kGY7p5Zv38trQNznHnUvt5FQGnA9oNg3gZofpNa
         9HlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794271583; x=1794876383; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kE7IP+MqX5ss6Mk5GpDeg38jtHBXHdobA2ZEiuyb+Yg=;
        b=gCQG0tvQl+yVoS1Vma9csIAhFAhOsK7RS8xc+HM1nJ8kX7rFliBmc+vncg8H6983jv
         ix0L24hOxxiPtH6y1O1QioVIutjYCLrG3Pbt++GLUk4gNCSddFHaCUaI2/IHmOAD/2Mz
         yuIN48vUODhR5pKtQa6ZNrQ62rDgf2K42vanzCyUb3J4E39SM+dA9UxNa52VPxXIptCl
         C8YuVXihdMYrsWJsFpqoxA7sGLjrLRkXMjTJHi1Eynxm5MA4yYV6Q+4Xvn18G+AFi4ma
         RkPETv75wHAOiDD5vhzFFozmrzOoUgv1H9uE8TC37Ke5+bz3vMOVxd5MbwWDzldM+r3a
         DTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271583; x=1794876383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kE7IP+MqX5ss6Mk5GpDeg38jtHBXHdobA2ZEiuyb+Yg=;
        b=g8DdxBCES0ODuIczJaav34GvwPU4i2slr7gJWOFb2f4FmQlq8xZgIIMpSBQnXXe4mV
         0Vf+V69oh8+PydpzFQZTYN+OquGQt/bXDWhEWZbNCpuHx8uJcmcdM6pZEb3NSSHYxyZl
         4nZgK2Nk81ompniVgaQG349MhDWvECDFC8WzyNwEzaxeyrzl3uGR5g+t59V1NDhU8j7M
         SHW0Zqgj88a3Nql9/AIx/+mZg7KoY4Lm/6nvqCieYK9HCqKn85IjfibdtUfzxrCr1c8s
         VfCgHCQXSEeHzjxvT4V80KTdGZXEGXrAeDy+FY6xXpV9I4iIeMolsHaPLw2S19wbfZQp
         lmdg==
X-Gm-Message-State: APuU4Z/OxaVs7EZRuFSWhFbT8xuBb2x40OEoCgfuEon5H+tCCwnfUtgR
	pcz3BQ1KvORseQ7BhVtSGfaFNZWf18jzf4drPp6cDuKw9oE+joP7R9Ga01vTedLUvK4xkfwr3NI
	M7HUAS/SvBV06XwgCEIflWfbR9UK3Urbe2s/ueGZcKVI0MmCc3mWLcqE7eBXFtfh5OCZwhA8Nwd
	PEcE0V/SkoViisUuxHbNsW3Yk57K8WyrAOyH55oPJm9mjSEsWDm6zVGWXppSZBKscN+O8M
X-Gm-Gg: AYBFou2c7Y4wt9JqaOFDCrcilDaBdltecut2bVXyN2Vgp4tw5FwOe3qPD5Kaquo9e6d
	Qg8DLlDEHDd5znqRNQg4K6ODwlYsmObjXPaxceSrjWRNiqMaoyViXXtHYuIwCF/swzOhuiDyOLX
	3hGPMmgPx87bvkXZyYN07l/5QhteNatkQc4oYoLJ9wzTjYnBvl3eLW6dI=
X-Received: by 2002:a05:6a20:918e:b0:3e2:799:f2dc with SMTP id adf61e73a8af0-3f18efad312mr816444637.40.1794271582880;
        Mon, 09 Nov 2026 16:46:22 -0800 (PST)
X-Received: by 2002:a05:6a20:918e:b0:3e2:799:f2dc with SMTP id
 adf61e73a8af0-3f18efad312mr816419637.40.1794271582362; Mon, 09 Nov 2026
 16:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com> <20261106144957.3818987-3-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20261106144957.3818987-3-viswanath.kraleti@oss.qualcomm.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 21:45:45 -0300
X-Gm-Features: AclHuK-VB56X3u5mvDZbT-NNU5OyLcbR5DnAVPClcUMxO5pPPwZntmPxuRtoiD4
Message-ID: <CAA_5you0kx33XL4netG-F4v=wk61aAGbtMZhETHiZTqUvg+upg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/4] uboot-sign: add SPL_MKIMAGE_ARGS for the
 U-Boot fitImage
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: vLcqsE1-5nP_7OPxPMq_6kFYEq2GUTbQ
X-Proofpoint-GUID: vLcqsE1-5nP_7OPxPMq_6kFYEq2GUTbQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMiBTYWx0ZWRfX5lQN7ZpvMUCt
 cBbDmF7iNE5penvSO7YaFM2+fYboP6L4Ip1e4UpXC0GzLGxIyKcTTJTMJVcJlhCPVpDd3BP82/d
 nn6T3HCWe57cuKJylp3tcEiBCiXNXfo=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2695f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=4JX0a8BX9CDdn3nwnYQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMiBTYWx0ZWRfX9omEmheCc4Xu
 VhKhLwc/5CidNOZqN2bRxsPowe8/PH2G9LfgJWNcHVxPqTpheAVuEzQfE6U/aS4QwHL8UAkxuBE
 AZWApapUh88lxILqF+CaZxmnd/by2wDsisLoUnNntT88n3/PmB7rM95GFBDOJWV9FCq0Bf6xNHm
 bJtVCzvfsinc/JgdHA/vZEvgmNb+XwAnBUyn9HT6RzLusZ/0aapTWKBurxSD6nYhqzODtg/2XVW
 kH6xi8byC6WOgpaBfgwVH7nGK8vwwSMA18FUoZVG1gMt9ymES2kTW2H1pPEFXo8urghIfnltYNG
 CjQ+3C7d3HWsW0PcOnh0o865WOH8/RqxBEAmGEd8TgEowwz1re4RbBKUtgV+xjXS5OfN2abDRO9
 xLBzmZXXfWTRG9+/BBIJtMMtY23IA1xqrTTlsmY0kHY2kxGM5vO7VRsHw2hPhmj+yKOe5rGYUfu
 Xyz0qVD8lL81yaqxnlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 00:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249885

On Fri, Nov 6, 2026 at 11:50=E2=80=AFAM Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> There is no way to pass options such as -E, which places the image
> data after the FIT structure, to the mkimage call creating the U-Boot
> fitImage. Such an option also has to be repeated when signing, since
> mkimage -F moves external data back into the FIT unless -E is given
> again.
>
> Add SPL_MKIMAGE_ARGS and pass it to the mkimage calls that create and
> sign the U-Boot fitImage.
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  meta/classes-recipe/uboot-sign.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 82ecba108b..368888707d 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -72,6 +72,10 @@ SPL_NODTB_SYMLINK ?=3D "u-boot-spl-nodtb-${MACHINE}.bi=
n"
>  # padding it adds behind BSS for SPLs built without SPL_SEPARATE_BSS.
>  SPL_WITH_DTB_BINARY ?=3D ""
>
> +# Arguments passed to mkimage both when creating and when signing the
> +# U-Boot fitImage, e.g. "-E" to place the image data after the FIT struc=
ture
> +SPL_MKIMAGE_ARGS ?=3D ""

Should we follow the name used by the kernel fit
(FIT_MKIMAGE_EXTRA_OPTS) here instead?

Also good to extend selftest with this new option.

Thanks,

Ricardo

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6159.1793787745125718672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LMY534E/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ONq/4m8E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kfk71263941
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Nov 2026 10:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4U0TCnl9j/ss0KsmjbhlJn5R
	vV7ogajod04Ik5D4LHo=; b=LMY534E/bHPNeMrWp/ebBT/lQIzzF+6xr51IWjy8
	6Har4b6qBS+CI7PeCb+H7cIRkLMvR3HV2ZOENketTMKcAUtAk5W0KpTCACg3J61i
	0XTaHX1Cuo+KNBtzjbOwisTQX04N2iCzroSwR1LDTfdx4ExXnjqBMvxGhhlETueQ
	vOWTzBHjvtPlTlCG1M+mJPChEDHwwh9y9Uw0dQpGKzvrT5ZwF+2uikAzeF9aLXLX
	oHc3hB5KGHjX+MSbIT9waz5hHmBDg96IbvDDtZqNnLmOeqQ7jvO5mggmU2XXeg/O
	KmQsCyOp1f5FWT9ienMt74fwaModko2FRVOXo2iRaTG/Dw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubm4q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:22:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b92acedd9so14784106d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 02:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793787743; cv=none;
        d=google.com; s=arc-20260327;
        b=oYmfnT6eQkHcXClYPMCOG0iEFiOH+kajPpgcOFocOXMxNneebID60Mc/HA+u7pTVx7
         /sZdZii7qYz1Lw5wGXRd62Hc+Gr3g8iFawXZaeE9nmtEFqoj4wMEVhpfJG5FAGBhcKa9
         zo1SJ1lQs4dN/KSulDMEl1vL93WsgySFUV0iPQm6B9vBUN3GPt2JL5IbapagrZS/Vjne
         ohQFjkVChJYzpQBlBxBx2O1MFZgfOsI2hIx+C9NEvueU7xcY2N9Q0jiXs1Pk0SsoJ5Z7
         3yp/XtH4YACM7G0crNWctzdUly72H8AOjLCwedG+1PP2vsCYbR9SbYCcWfDZzXfVIkgE
         Mlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4U0TCnl9j/ss0KsmjbhlJn5RvV7ogajod04Ik5D4LHo=;
        fh=xXt3zkPzGzwqgcwM2PfDANE3URAnGLCAfWrzfeluHNU=;
        b=gz48u6eeCMTPk1cQKaelLh/rDSsnruo+VXpL7GvXMUp3hGIV1gTRAJOE3TuTj8E1H+
         5v7RVt29Saukx+9WStmSM6xqWSmhwW7jbzlk7TVyTbk9VAkOQfqnfXduoVm3yM4MwAT/
         aicjZd+VVH0FGgiU5vYDx/trrEnwuykjQcATjTVkGDVmWp8er9q8UhdpywtbmPSt0lD6
         WtSh+PxC/ZAJ/sebuTpc3SuGJ+CrfX7qI9Y8fgaCBFuDOCEXj0w6b1HB0uW0mFr8Og27
         VFhsCML3NgkOvDw5EWZpi1mVgxPxEZr//UdBanJHCN9/+BgFIZROJjTHMgQ+p3Mh4VaH
         4pqg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793787743; x=1794392543; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U0TCnl9j/ss0KsmjbhlJn5RvV7ogajod04Ik5D4LHo=;
        b=ONq/4m8Exl7stBSRVFai4M9etOW4ug51x9sWGXlLyx3xGA1mIwcp+4S+e1m3XanprA
         0PUD+S+WV78NIyjf6U48fTLYA48GI7heG4vD9d7twWaUNyzOORmb3mVr6gcPZ6Aor0vp
         DIR2UA9i+12vkqRsYf3HpQ59khL4Z2AVQUURpDAwtUl3L7c7vaEAcg5m8btMl7jXijZi
         pT4/JqEZr5dWRIABICsNpBAtuqZRRH1fP8ScNUEiO+Syp+zli+UZVrsswpu5BBqzerUj
         YA1lBAyU2jmW9LKn7C/nHq5OqG1uO0JweIMGkCDrjpLPdphVfsoWSd87SvVcZrXlI4hh
         P0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787743; x=1794392543;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4U0TCnl9j/ss0KsmjbhlJn5RvV7ogajod04Ik5D4LHo=;
        b=Kfl69yykYw9itPlVmov/LWelYI1jdgfNtrYcbxK/X5mvmzzaiFLyk+CBQH6CrzmzXa
         pd3cAX2BSBQ9etnj+eFywDbxEdvGjNuZzQEDnMKFEQfy8U+1d+SgZrFldK1u+qCo0QaC
         SH2ObMjIb8IKnBcGdgEWD52QOyLm3c09dK4YAPLKsPd6dP9Et+j5sOJ2h4H7BEGKuhYe
         0tWsqP+rxp+AYeWxSrmcVcbaPms97wqm6F49WYco16Lf6+xyhLOMQGrcgSld/wCe6yMX
         PkZMXsAZ4lzNyzME6xVGqOqxhTMUod6XDt+umMuJJgxlMvLVwWBi69dkmS23uN3QDNer
         eYdA==
X-Gm-Message-State: APuU4Z8we1kIeS+zmqnN5Pupz1A3isHzUY8z8u1OjbvIxIM7fG/Zsir+
	9YtrOCNCsvTZsq+6z797G6ewSLidOmtnXPN6I281UAfAtRpHqpijP13/BTC7rAQMeJR2WPQYdW+
	+RdRkjDQfxdIkN7uyCRmmC12uHMNCDwGE/fMTJsuG2FZYkOudTarTynKqQoOrjk5HMM9rvgqlCl
	C8qdOy7BcUaUBryqX7FpKpR52d14FXcJ/JoV3is/EGeoor9P2HZjBqcH647w==
X-Gm-Gg: AYBFou3RnshoQXR/652iDWg7fCVfT1mCAPFWmlwaHqg5OhP+F8p72VLZfbRRrP7shlo
	Xqy961ldKRLYeNXMbJfBR4O5Nd06C1sRaoLY88ujSgaHkqVEfSLRkDHKAN7NznGA8I/ilIeIMrm
	n77aea7rEfONaZFVQVJNChbf/ZK/lVh55QYkz+zbFNcjpTC8XtLIscRISXf8c=
X-Received: by 2002:a05:6214:4f1b:b0:91b:b26a:9791 with SMTP id 6a1803df08f44-91cd0496219mr80047366d6.56.1793787742718;
        Wed, 04 Nov 2026 02:22:22 -0800 (PST)
X-Received: by 2002:a05:6214:4f1b:b0:91b:b26a:9791 with SMTP id
 6a1803df08f44-91cd0496219mr80047086d6.56.1793787742209; Wed, 04 Nov 2026
 02:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20261029093738.1507-2-jose.quaresma@oss.qualcomm.com> <1905cd5a-760f-4f3e-99af-4aea68136154@windriver.com>
In-Reply-To: <1905cd5a-760f-4f3e-99af-4aea68136154@windriver.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:22:10 +0000
X-Gm-Features: AclHuK_3P8gOvT8xX8bfbeD6t3AljdH5hUYajr6SscFnX0j_Pt8MFyhRBy6SOc0
Message-ID: <CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZD-mZrQ4B5G_4Sfxcvxow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] igt-gpu-tools: fix build on non-x86 platforms
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000002d573c065f70c19e"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MSBTYWx0ZWRfXyLNRK1OpGqFR
 HTwNA9MKTxEvFUavyiqmaSVK3S+Kp9RuPiQoePUy28c546EYbaae7AlthO+e2OKDPamp6kvKc5T
 Rm8/A0m4pOepismDV+/ovAESASP6Ou0=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeb075f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8
 a=NK6Xpl-MVJvXfKe2ru8A:9 a=QEXdDO2ut3YA:10 a=zhH3trtjAAAA:8
 a=vm37TZYX5tVYyQp0H1cA:9 a=hq07FEiFZrkc2kXC:21 a=lqcHg5cX4UMA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=lap4kSrHH8eKdvMWMUGw:22
X-Proofpoint-GUID: RVF6yyMnthfJJAPwyPshm9FmCL9vfoAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MSBTYWx0ZWRfX0h5MvExoKYx4
 IOycOavyIPgooxFRJ5SY+2Qy94ca9d0njMnGRO0GF496SJOrKG7P9/pERWxvKZ0r2F1IjKLruFt
 h+b2r3iHGumx2Awu3BmR+T/Z6rDtTUGtwif4pYJMhE9T/1Q+iejWDVUqXUq8JEK86pD9VBO8yh4
 EF3ODX6giSN9ApomtTlhW9O46kn5BzrJ9buyOWmpmw0IAGVNWh0haPekUojTNSaMf8RD59vsSLo
 d/GUfVqTeV79wTOOzkMcxHo63DUWeTpucOfWQrn3AYC9cnzxVbVgxZXtSZOjcu8aNMPIkTnTEC3
 eBghP8EEd8c7t/SuoLi+UL0313sQ7RJJiDcPWKxyNPeDhxN2FSUDrLZ0Rkjx4VNqhjwhKWnc0II
 JWzms+d5gYUTMPyx95Es/A+sJEWK/OLd4BSV/8GRZTcBGhiVsWGRUwvHw56YzfzkPHChmq0CQ6n
 K4zsrIcCMfOcYgCtB/w==
X-Proofpoint-ORIG-GUID: RVF6yyMnthfJJAPwyPshm9FmCL9vfoAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249350

--0000000000002d573c065f70c19e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, Nov 3, 2026 at 10:04=E2=80=AFPM Randy MacLeod <randy.macleod@windri=
ver.com>
wrote:

> Jose,
>
> Thanks for the fix. When people were discussing it on the YP patch review
> call today,
> the question arose: Why didn't the YP autobuilder catch this error and ar=
e
> there more
> inline assembly issues that we are not testing and catching at build time=
 ?
>

Taking a quick look at the layer, I observe that this tool is not a
dependency of any other
package, nor is it included in any image.

However, it should be included in the bitbake world building.
I don't know if it will be excluded due to some setting.


>
> Can you look into that or explain why it's not worth doing so?
>

I would very much like to be able to help with this part, but my knowledge
regarding
autobuilder is very limited.

Jose


> Thanks,
> ../Randy
>
>
> On 2026-10-29 05:37, Jose Quaresma via lists.openembedded.org wrote:
>
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> <dmitry.barysh=
kov@oss.qualcomm.com>
>
> The "pause" assembly mnemonic is only available on IA-32 platforms,
> breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
> assembly with the preprocessor checks, making sure that other platforms
> don't see the invalid assembly.
>
> FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> Assembler messages:
> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> <dmit=
ry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com> <jose.quare=
sma@oss.qualcomm.com>
> ---
>
> v5: Move Upstream-Status to the carried patch
>
>  ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++++++++
>  .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/000=
1-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
>
> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-a=
mdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphi=
cs/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-o=
n-x86-x86_64-.patch
> new file mode 100644
> index 0000000000..38582bf1d4
> --- /dev/null
> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-i=
nsert-pause-mnemonic-only-on-x86-x86_64-.patch
> @@ -0,0 +1,37 @@
> +From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> <dmitry.barys=
hkov@oss.qualcomm.com>
> +Date: Fri, 26 Jun 2026 22:34:06 +0300
> +Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
> + platforms
> +
> +The "pause" assembly mnemonic is only available on IA-32 platforms,
> +breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
> +assembly with the preprocessor checks, making sure that other platforms
> +don't see the invalid assembly.
> +
> +FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> +Assembler messages:
> +{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc]
> +
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> <dmi=
try.baryshkov@oss.qualcomm.com>
> +---
> + tests/amdgpu/amd_basic.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> +index 3ad023472136..e5475f337549 100644
> +--- a/tests/amdgpu/amd_basic.c
> ++++ b/tests/amdgpu/amd_basic.c
> +@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr,=
 uint64_t expected,
> + 		/* Sleep if interval specified, otherwise tight loop */
> + 		if (check_interval_ns > 0)
> + 			nanosleep(&sleep_time, NULL);
> ++#if defined(x86_64) || defined(i386)
> + 		else
> + 			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wai=
t */
> ++#endif
> + 	}
> + }
> +
> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb b/m=
eta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
> index d76c2355a1..a46b002b83 100644
> --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
> @@ -12,6 +12,7 @@ inherit meson pkgconfig
>  SRCREV =3D "916c79cfb7675ca01607dcd821f8c49d4f633a6f"
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3Dv${PV} <http://gitlab.freedesktop.org/drm/ig=
t-gpu-tools.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D> \
> +           file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_=
64-.patch \
>             "
>
>  DEPENDS +=3D "libdrm libpciaccess cairo udev glib-2.0 procps libunwind k=
mod openssl elfutils alsa-lib json-c bison-native pciutils jansson"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248920): https://lists.openembedded.org/g/openembedde=
d-core/message/248920
> Mute This Topic: https://lists.openembedded.org/mt/121991366/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--0000000000002d573c065f70c19e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"background-color:transparent">Hi=C2=A0=
</span><span style=3D"background-color:transparent">Randy,</span></div><div=
><span style=3D"background-color:transparent"><br></span></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, 2026 =
at 10:04=E2=80=AFPM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windr=
iver.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
 =20

   =20
 =20
  <div>
    <div>Jose,<br>
    </div>
    <div><br>
    </div>
    <div>Thanks for the fix. When people were
      discussing it on the YP patch review call today,=C2=A0</div>
    <div>the question arose: Why didn&#39;t the YP
      autobuilder catch this error and are there more<br>
      inline assembly issues that we are not testing and catching at
      build time ?<br></div></div></blockquote><div><br></div><div><span st=
yle=3D"background-color:transparent">Taking a quick look at the layer, I ob=
serve=C2=A0</span><span style=3D"background-color:transparent">that this to=
ol is not a dependency of any other</span></div><div><span style=3D"backgro=
und-color:transparent">package</span><span style=3D"background-color:transp=
arent">, nor is it included in any image.</span></div><div><br></div><div>H=
owever, it should be included in the bitbake world building.</div><div>I do=
n&#39;t know if it will be excluded due to some setting.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>
      <br>
      Can you look into that or explain why it&#39;s not worth doing so?<br=
></div></div></blockquote><div><br></div><div>I would very much like to be =
able to help with this part, but my knowledge regarding</div><div>autobuild=
er is very limited.</div><div><br></div><div>Jose<br><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div><div>
      <br>
      Thanks,</div>
    <div>../Randy</div>
    <div><br>
    </div>
    <div><br>
    </div>
    <div>On 2026-10-29 05:37, Jose Quaresma via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Dmitry Baryshkov <a href=3D"mailto:dmitry.baryshkov@oss.qu=
alcomm.com" target=3D"_blank">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>

The &quot;pause&quot; assembly mnemonic is only available on IA-32 platform=
s,
breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
assembly with the preprocessor checks, making sure that other platforms
don&#39;t see the invalid assembly.

FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause&#39; -- `pause&#39;

Signed-off-by: Dmitry Baryshkov <a href=3D"mailto:dmitry.baryshkov@oss.qual=
comm.com" target=3D"_blank">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
Signed-off-by: Jose Quaresma <a href=3D"mailto:jose.quaresma@oss.qualcomm.c=
om" target=3D"_blank">&lt;jose.quaresma@oss.qualcomm.com&gt;</a>
---

v5: Move Upstream-Status to the carried patch

 ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++++++++
 .../igt-gpu-tools/<a href=3D"http://igt-gpu-tools_2.6.bb" target=3D"_blank=
">igt-gpu-tools_2.6.bb</a>        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-=
lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amd=
gpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics=
/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-=
x86-x86_64-.patch
new file mode 100644
index 0000000000..38582bf1d4
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-ins=
ert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,37 @@
+From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com=
" target=3D"_blank">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
+Date: Fri, 26 Jun 2026 22:34:06 +0300
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
+ platforms
+
+The &quot;pause&quot; assembly mnemonic is only available on IA-32 platfor=
ms,
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
+assembly with the preprocessor checks, making sure that other platforms
+don&#39;t see the invalid assembly.
+
+FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
+Assembler messages:
+{standard input}:3702: Error: unknown mnemonic `pause&#39; -- `pause&#39;
+
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/drm/i=
gt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc" target=3D"_=
blank">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c028961=
7f3c7ba7ee376ea1d8aabd2ff5afdc</a>]
+
+Signed-off-by: Dmitry Baryshkov <a href=3D"mailto:dmitry.baryshkov@oss.qua=
lcomm.com" target=3D"_blank">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
+---
+ tests/amdgpu/amd_basic.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
+index 3ad023472136..e5475f337549 100644
+--- a/tests/amdgpu/amd_basic.c
++++ b/tests/amdgpu/amd_basic.c
+@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr, u=
int64_t expected,
+ 		/* Sleep if interval specified, otherwise tight loop */
+ 		if (check_interval_ns &gt; 0)
+ 			nanosleep(&amp;sleep_time, NULL);
++#if defined(x86_64) || defined(i386)
+ 		else
+ 			__asm__ __volatile__(&quot;pause&quot; ::: &quot;memory&quot;); /* CPU=
 hint for spin-wait */
++#endif
+ 	}
+ }
+=20
diff --git a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-=
tools_2.6.bb" target=3D"_blank">igt-gpu-tools_2.6.bb</a> b/meta/recipes-gra=
phics/igt-gpu-tools/<a href=3D"http://igt-gpu-tools_2.6.bb" target=3D"_blan=
k">igt-gpu-tools_2.6.bb</a>
index d76c2355a1..a46b002b83 100644
--- a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-tools_2=
.6.bb" target=3D"_blank">igt-gpu-tools_2.6.bb</a>
+++ b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-tools_2=
.6.bb" target=3D"_blank">igt-gpu-tools_2.6.bb</a>
@@ -12,6 +12,7 @@ inherit meson pkgconfig
 SRCREV =3D &quot;916c79cfb7675ca01607dcd821f8c49d4f633a6f&quot;
=20
 SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/drm/igt-g=
pu-tools.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" target=3D"_=
blank">gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV}</a> \
+           <a>file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86=
_64-.patch</a> \
            &quot;
=20
 DEPENDS +=3D &quot;libdrm libpciaccess cairo udev glib-2.0 procps libunwin=
d kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson&quot;
</pre>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#248920): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248920" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/248920</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121991366/361=
6765" target=3D"_blank">https://lists.openembedded.org/mt/121991366/3616765=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank=
">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div>
</div>

--0000000000002d573c065f70c19e--

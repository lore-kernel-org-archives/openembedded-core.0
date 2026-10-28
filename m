Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1023.1793206190127888859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 09:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PKXMa0WZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cymkdibF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA0C62542999
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ce6vgKO3SJi9r347byUMaXdL
	gffyXWZXHHgyD1JOLuU=; b=PKXMa0WZjJ2kPiyUwmawAxK4pH4zqwRYrZYzc44s
	ZXFC6B2mlzGWqat8cto0r8KDVzbjFpD77ZFwsB7Cfh0H3Ekuu+gSTGxePu6dc2cJ
	qCI8ZMUECUg+fTBktncPC+k23npcdfgWqD/3EtPKI5PcBKq3zGiP2VeTqNcS7Hsq
	4lIgKe8ewjfRrkUUVIBa1JJdlSF1syZhhSg9IdqX77XoP554nt+cBOeCJtvm5qn8
	a0kw9/vWwyD8iI0jzjAWM1h43Z+F3sOkhnY+gdN9XfgIttRpNJBIu9MWz3mhwLbv
	9J06u+MjiwDKRwD9zTgh1pvmEIKKtA5ehlnQerSMS3W17Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehrfrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:49:49 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso2019536b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793206188; cv=none;
        d=google.com; s=arc-20260327;
        b=crHAHgZ7OKV17+2H9UdLZuYGNBq66x/BCWNobGPZeVM/7OCn+0b8PE17s7DM5hieNF
         VtJeWJ82BGFhLOP3JC7+wpP46BIjN9bTkCg0fp2lq0O4n67sWcCnircjwrsEUWot1oSE
         UXmdB20Gy/c8CO3E7Wr5k3DVqqsYxu8o4MCCh9mJeUaigF3XDjD93rURu90qpDGcp/Mg
         SKss7hE8tZE1jiB3E+zaUhhGrRMuUIcZ9olTWqFPIvo1xIAhF4WWCiJ0Zv4d9F28AMjx
         MHXgDwpnfv2SmK0MBENP64lduzBwhDaBmZ2P75hNKj2GM3+75UK1uUhpae4khGNr5JTD
         K01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ce6vgKO3SJi9r347byUMaXdLgffyXWZXHHgyD1JOLuU=;
        fh=H+u/svSelZhq1dSDbTmufc6y2jiQxplLbyIzjOY1qgo=;
        b=ja+6qxQQMhxsHW5jMbpQ+ZPwwjpGleIqW84PPw7xGLw4AtBUZChcfsGdewGLMuvINC
         c1sQewTbQSpQ2lwAojOSbUgn+TYZOMaMx6eFxyKw8IP2qdkajDIwM4MjCgR8z/c87/3O
         6nP58wv7ah3Kg1n70TJlNOGFjs3Vw51oE/x7HQt478IEwp9ynx0Z+pyBZViZRBkwCb5V
         lKA4a6OIW+629zNNTwz+EbV2hUBMkuc8Gg59jnkavtpO/D8lXFz4VY5b1Bp5evDwZCsV
         xnHNtTUtZFPP3F1+WMi8hxAYFiRh6JNloilce8LgVQ8Z14VFACl7GPsMA/csWMJMAhX8
         uL4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793206188; x=1793810988; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ce6vgKO3SJi9r347byUMaXdLgffyXWZXHHgyD1JOLuU=;
        b=cymkdibF2/l6GT9hZsGdzE7sAhLMD7xHPAQUr3XDI5RIqtHCrWAZtEBW6CjgdiTVpN
         pd968Yn5U6BznxbV5IVxV6ls+F8rwEU0hMBzsRQthyMAa2yMmyYYBUjJcJnMvVCGaVMM
         6DkyXvNoT14QhsVkH0Eeok66JDv4ipNDEOheuNpYwdL2kLTRSaIUi9Z18UwUhsXK8cGQ
         hb589qQeMkeTKrLYgrNuBI2oKvhh368m8aThJtiyjF2PYZHByGKw2grPvJNHBxfzQ2um
         2UWNK6UbkicStFsdFlrTJ2zLp5f9gn+PkneNg/CsVSz/eteRUp8hykH7cmDIdJirPkeQ
         1B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206188; x=1793810988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ce6vgKO3SJi9r347byUMaXdLgffyXWZXHHgyD1JOLuU=;
        b=zyvBGZE54qQuf/ylpWDjcsL9rH+TdAE3igwczx+04oZOdaNHfgDzBGmYOy6TXyeshl
         8qMgmEgt2J2mW4ZuAaxrpph44Se9E/TryNRJjN7xCXhMDrbAcHOXClEBR4rMLDqnErqD
         NfPQwt8wYgwcZJLkuN4h2kwm3/A8F3stJWVgQVnZCol8dfcJmQiGr7f/LNUD89ZpYaud
         /89J/Hv7LGsKioEd9+kV7u5hdAP3JRgzJUP+3IDePY86gPG8hzOLGmqbki1Q9C/Euptk
         1XIZP823V+2+bKQ0hRB2yfJdnU+KqmOZs2+NAYJ2JdByaO1FSq3rscTYarwzCN7CfXF/
         McEg==
X-Gm-Message-State: AFq9FYKXLAJKacyd4ic1Cou+LRTpPQuCMSVsY1V20EwB+EmIH6yPF46U
	GbvcYXOK/5SCZJ8xdGfrEHWMDeC8KXz84ldWXzC6G2k5kbNhshWVuq5HMHj5pFW6XTXwfggs9Vl
	7RYer47dKPEwBn3GuYziGGDsRyvSw1l86+b4KPsjfHKknQL4AvxAmgL/nIvjlkd6SBzeLNN4/wV
	eWTyhMr2rUm15pOg1NU3ZUpOS8as2HNfrKj3/0rWnkzNiJ1IHaqr8br9V5yg==
X-Gm-Gg: AYBFou1Geb9ivRlcqNLu5rkLo8OGnwIEnW1sWJ1nFDVxT+n96fp1nLi/tBTjG7tT3Ih
	R8XcPXaOACtm//S7Vz/ajpq0lNMpL6hQTNdZi7ascTEZ+YLmCdKuqyG7oNORhG/7WWF3QVFEFWF
	rvrJC4xhayNWcGQNso4k+c7hZ2OtUkUXTTjwqxfIB15KvZ6XjIFfkTMOyJBhY=
X-Received: by 2002:a05:6808:181d:b0:4b9:a829:f015 with SMTP id 5614622812f47-5638379b1d6mr1758338b6e.33.1793206188402;
        Wed, 28 Oct 2026 09:49:48 -0700 (PDT)
X-Received: by 2002:a05:6808:181d:b0:4b9:a829:f015 with SMTP id
 5614622812f47-5638379b1d6mr1758313b6e.33.1793206187774; Wed, 28 Oct 2026
 09:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20261028101022.3308-2-jose.quaresma@oss.qualcomm.com> <CANNYZj-Z99z6A=p8XHinkOFC86L7EMWUxNfJdd_39Op5N=AfGg@mail.gmail.com>
In-Reply-To: <CANNYZj-Z99z6A=p8XHinkOFC86L7EMWUxNfJdd_39Op5N=AfGg@mail.gmail.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:49:35 +0000
X-Gm-Features: AclHuK9ZhegZAFikpZbnjPIyO2n0db1GP2vecfTekvWOb3i2uoWjelwSBKQ3W_k
Message-ID: <CADWMC-b0frJJKc+jO5b=yvMVKsg1MU3t3vvSe0-5tGG2kBbXEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] igt-gpu-tools: fix build on non-x86 platforms
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000d4e5bb065ee959aa"
X-Proofpoint-ORIG-GUID: DYv3RMRUT3YffCL7jshmoLZZU11cY-7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX6e1A43wUyjos
 Uvajd37P3//wiNK69Du1uH5ULns/4b0SH7cBl+PG/wJkkreZgf6HNR6m3mScfw7N9jPFkj+VrJ9
 39+ccVuncX4lw/a0H94EmzfL18hJ5s+5+qvmN58bHsEm5kx1rU28zE/UEa7CApj0I7F3jrjNdyl
 CLfQLicOC9weiA+fnLM/vqtiUsfBc5HlGq/1XH0AW0lFANBdh0RM/6vDmI8COhxzSlbQjvOQfb4
 Emczqc4VTw9oahKlZMBsFm7FDMaWqkX1h+fktsXMJAcLvGrorWQ4N2Gkc2MiMefvM75rZBzDxoi
 yRIs/tOv7/0x6/3I054w7j2RZ+GVB1KfWoU28R6huC/ZmYWi9kvLt8V4q42tw2Tds3BedgfFHoN
 QAQ0qwB33C3aGUfhbwsBJxnOC+fXPyJW3brV7dU4UsWAWQNWRZEti487Bi61Swq8l44LB2IsnqD
 +9lhUP+5njC/AyUOd5w==
X-Proofpoint-GUID: DYv3RMRUT3YffCL7jshmoLZZU11cY-7_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX2xjUK2tDLOrZ
 /waK5pNX+6eb2iOnWEu2WJJzT4sAROjfApSfyoRSqywLK+26nD3xVR9YocAzCZePzOqLPqCuepz
 LE/SRExtDEydKfwANxly/SZCWhXieKo=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae227ad cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=UFKLzQNB0MTDeCobVZYA:9 a=QEXdDO2ut3YA:10 a=834pNgbnQRmnIXBexW8A:9
 a=ki8Df650gYVWZF0v:21 a=lqcHg5cX4UMA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248822

--000000000000d4e5bb065ee959aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:29=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Wed, 28 Oct 2026 at 11:11, Jose Quaresma via lists.openembedded.org
> <jose.quaresma=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
>> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> +Date: Fri, 26 Jun 2026 22:34:06 +0300
>> +Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
>> + platforms
>> +
>> +The "pause" assembly mnemonic is only available on IA-32 platforms,
>> +breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
>> +assembly with the preprocessor checks, making sure that other platforms
>> +don't see the invalid assembly.
>> +
>> +FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
>> +Assembler messages:
>> +{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>> +
>> +Upstream-Status: Pending [for internal clearance]
>
>
> So what's taking so long with this 'internal clearance'? Will it be
> cleared, and why does it need clearance for upstream submission, but not
> for oe-core submission?
>

My fault, forget to update the Upstream-Status to backport as it is already
merged

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba=
7ee376ea1d8aabd2ff5afdc

Jose


>
> Alex
>

--000000000000d4e5bb065ee959aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 28,=
 2026 at 10:29=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2026 at 11:11, J=
ose Quaresma via <a href=3D"http://lists.openembedded.org" target=3D"_blank=
">lists.openembedded.org</a> &lt;jose.quaresma=3D<a href=3D"mailto:oss.qual=
comm.com@lists.openembedded.org" target=3D"_blank">oss.qualcomm.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">+From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshk=
ov@oss.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a=
>&gt;<br>
+Date: Fri, 26 Jun 2026 22:34:06 +0300<br>
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64<br=
>
+ platforms<br>
+<br>
+The &quot;pause&quot; assembly mnemonic is only available on IA-32 platfor=
ms,<br>
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline<br>
+assembly with the preprocessor checks, making sure that other platforms<br=
>
+don&#39;t see the invalid assembly.<br>
+<br>
+FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o<br>
+Assembler messages:<br>
+{standard input}:3702: Error: unknown mnemonic `pause&#39; -- `pause&#39;<=
br>
+<br>
+Upstream-Status: Pending [for internal clearance]</blockquote><div><br></d=
iv><div>So what&#39;s taking so long with this &#39;internal clearance&#39;=
? Will it be cleared, and why does it need clearance for upstream submissio=
n, but not for oe-core submission?</div></div></div></blockquote><div><br><=
/div><div>My fault, forget to update the Upstream-Status to backport as it =
is already merged<br><br></div><div><a href=3D"https://gitlab.freedesktop.o=
rg/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc">htt=
ps://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee=
376ea1d8aabd2ff5afdc</a></div><div><br></div><div>Jose</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div><br></div><div>Alex=C2=A0</div></div></div>
</blockquote></div></div>

--000000000000d4e5bb065ee959aa--

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17140.1793102634674037591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 05:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RrZKJGOh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bMe2KXAE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeC6C3026388
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 12:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AbBfrZRGp1mT6GkUPhD1Rj6i
	OYf1aQ98bLm/TS+IsHk=; b=RrZKJGOhPZzakb8uB9H6pLbm472cSqJx8P0Sqm3k
	JGH4BdJqoD+PxnFO/DjkKWTPdUtcOohliemquJoYEa85TrDws1MR/oz0uWTYwdao
	Rmy9zdAYKcaOQLO8WHKL9eimmczgXWxMpJ6CO3HBRQeralqV7ZO2hSkJ8uGHKF2j
	5FR93WIxG4RBo1yVqWRI1HPV6pIrTESBs4OV6ivyHBpVJVWRCZuDPdpmKcSa57/b
	OvXWaZUsFAgomAt75PvZgxREXExav6AmjDdmbIFTXI5v90uTdr3fn7Vq1WxSPSda
	mlfcsA52/+sEgtPVSep7mubHmNu6zXEGgZl4PSb40Crxtw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91abcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 12:03:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53395d51187so70245031cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 05:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793102632; cv=none;
        d=google.com; s=arc-20260327;
        b=pvcTKkXB4BiTTHK8o1iny620cgf03J5HIBhjlhUigtX6Vo7FaY2gZvYpCDKQu/JKwf
         ksDKHBVmr8zpw/pZuBfMfmAmV9xrE7QuIJA9acgsaENLZBRk33B040pxTqEflbWigjKP
         Sd9/qPAT8IATiNiQhDKj/r84/eAsG/gdGJ+iGR8+n60GYG6+Zbs6235XGadP/1RRP56R
         Ok5dMXXfDhwnUQL18sX5gU0SQXOTRopRCgx1Kzf9V4WasAJiGWxFHJro06B4So0eh3F3
         oTIl0UdHUsToZfJU6fsbL3kAAPDnmgWPw7m3amnvyAxmQat7tRciKT2vEX5kH91gR6B9
         u28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AbBfrZRGp1mT6GkUPhD1Rj6iOYf1aQ98bLm/TS+IsHk=;
        fh=16XcNlPqxr1myujANuqU/28Ci643iY2s5DLosrYwWgs=;
        b=Q1smCiWhPjsVba0fygoQW4NGhnW8e1ZqODy9F9YX2Ar1zX0xVH1lQ1GI43qe+QODCq
         uS9dgf51A9te8qYnKzs1MgXVMJokv49ljG2Xz9xFRPUh5Mlvi5C6vrCYJ76qlDu5ncZT
         OE9h4nvQCVCieez0IGxlGRhCXsipGzJjXccU1rbDOhhKipTvUSKXE9xnKCPOVNjQlRff
         qlgAdxlRbs1nLbcOcJINzp+fsxW6uAopzpmhOZRoVtQaCG3VIXpAdzIK2UK+LNt2me8S
         FlS6XbFeOJqvtLXJCABZgu41boBCesreGGQ2MyA8jCBcA8l8JEyFXG46sjZislHOaLte
         fwzg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102632; x=1793707432; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbBfrZRGp1mT6GkUPhD1Rj6iOYf1aQ98bLm/TS+IsHk=;
        b=bMe2KXAEMoemMv5nAyrasIkbUMR/Rt4MXuJ9cxdh7t1s7dS+Y+fgS6tD68lFKIXO4X
         OHQAPp0kMv3PCwlqayjvnsV031oJUaaxX3fO4XxGD7RiJNzIeQs8bGKSD27sWognd5K7
         dCoYKRridjHfDDGl0AC5bUt2M18XtV/OSqyZASd18wzSeCH9aHvnv6QgZK7sNfeAAeAX
         5mmOAz1mdgZgXLxFqtpq6AgFeJ76w+aLAKaFBwfor391p7cxRnlF6SXhrgQV34S8Q/KN
         CM3tmxppLVhAUkboHNaJyDpBAl8u33SMDcMm1/GRxZT4FZIj7Vi3a+CL9mYkYOn+7P7V
         W2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102632; x=1793707432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AbBfrZRGp1mT6GkUPhD1Rj6iOYf1aQ98bLm/TS+IsHk=;
        b=EXkALPMhv3c//hqphxMfMhAG8jFWqMArZ/7DQK6tJPhtBmr3BcYbUvqBzdzvkg3G0f
         ddSiKAuK8Bz3JWNlEynrlLpTDAWtxxbDAdvmKo3yaq9vXy74mr2zi+ukZY7ATGywi9Xb
         mcmRH/PVE41ULp/oDV7FwkTXOxsbbQHoCb9vzrS35EVZyUWsZ4G2tCuCV7klyJM23XZS
         cZZWqUMxMXqASm1MNADtosN8W8mkKCgtvYet8+5eptQ9mtmXBvd0adx2MaNJI65ualaT
         8oCcca6jmE2Dj/wR3yXamX4zINCOecfu3gPS1wISI/jLW7QkxiXptnLNLqx+BRr9VXE/
         ak6g==
X-Forwarded-Encrypted: i=1; AKwUvBzayu4QhnHsHPRGFTYN60EfCDge1t9Kt+aOTYXQ0lIVjQjOr2lQFVgG+/RtskSGPPiDAaKZ6dVN5UkvF9nRUswnnA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYISEgtpYxJUs7NVgv42tWVq90XdTeR6dyXqXeNSZrY3puDv2z/C
	I0Ev7q5t5rQ15DM+knkm6rHa7HFnZTrW+fCT79GBGKsjYBG59lY6LHLMI+8BNqrg6TkKpFmN3bW
	EBW2tdjrm9PBNw+FfqItoqLkA5NRgsydNLFoblcMgE253w5s/ZSlW6DW+LQAbzhAsLJLbhjl2CJ
	/rlDnldXICEUOLEasIDpFKJrMt4SyN5XeNUOXjmrQ/jizt31WrpRsBrvdcMA==
X-Gm-Gg: AYBFou1XRiJo8DMHb52i1XliUd09/Gh5YVxwDFJsy796Jgf2xRHPhPTF8jlHNWGK6bo
	7XCt4j0e1adpSji1typZ0ujacIQli/lJFItmnybV1pNCH0dclCtDCjX9auzYxAvE9o6x6DXz4H3
	CS2i9h/KF3pATk+8n6hBhlkp7g2fZmF+L0FgvL5lSTFF+OslQiIR73fwD1bSk=
X-Received: by 2002:a05:622a:5594:b0:535:a5fb:644c with SMTP id d75a77b69052e-5383b60d7a2mr153283061cf.70.1793102632472;
        Tue, 27 Oct 2026 05:03:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5594:b0:535:a5fb:644c with SMTP id
 d75a77b69052e-5383b60d7a2mr153282041cf.70.1793102631730; Tue, 27 Oct 2026
 05:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com> <20261026214627.2388650-6-JPEWhacker@gmail.com>
 <auBRnwhMKmTkFpQB@nuoska>
In-Reply-To: <auBRnwhMKmTkFpQB@nuoska>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:03:40 +0000
X-Gm-Features: AclHuK86rq5ZpesjB3rbRo2TuH7cmz6SLud7XfBz2vIA-633-hZ_GbS9DYaAZ2s
Message-ID: <CADWMC-ZECNTJQ8MZBB+=2sNPj1qJUZrx2tZ8HmEDNiAAnG0LSw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 5/6] Add SPDX deploy tasks to various recipes
To: mikko.rapeli@linaro.org
Cc: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000691178065ed13d8b"
X-Proofpoint-ORIG-GUID: 0VzSZvH-41wI-ObrR3tDzEcqPEKjAt9d
X-Proofpoint-GUID: 0VzSZvH-41wI-ObrR3tDzEcqPEKjAt9d
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae09329 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9G7XuZTAXjNdWuc7j9UA:9
 a=itNntiE7ACGd12bT:21 a=QEXdDO2ut3YA:10 a=7zkKd5b7AAAA:8 a=cUW-zQj0AAAA:8
 a=ZNlaEDT0AAAA:8 a=Fu06Ql7JPlQw16eo4bkA:9 a=_yT_fBkxTa9gTHfT:21
 a=lqcHg5cX4UMA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=s4142C9f8xt5yEUcTmgt:22 a=2fd0wjtG6IkNllS7Rezt:22 a=ze7DwQU8YSsHxv14-ET4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+TodIWlMzwBr
 w8HQ/tTTLCO/V6cTeLZCJgbqSB1v5zWXeLN/YBwi4bGd2PPP0sGzIdnCjxAqCPozgIl37OGAn+0
 CMKCE/qywX2nRNIPXniiKAVOomXYijdmDe8VDR3JlPjNWtj9S5IDHrqV6zuycJ8IcUVZnvKhrMQ
 sjad8fdKLazyz0mUgC3/iErWFuJ3yP3C8g2ZsSeJCqxPIbPBt0iD1Zy8Uu2o2lNhqCiBZcBE52m
 NBzAAaoUqBXzPTB7W5F+GyvRs2xoNxzXKOXoFVQ9r9LCRHZOnIWk1yMR7wr+phpNRKwn/NTw4Zu
 geXu8U4Z96hElmhHGc/uCFMJGsed3+QLGPK+QrvMxH9TWYd+bWXWoHsEolneRu3AZLLSDwGy2lj
 Fkq/rq4S1lWYkSocRYU+jaVmkEsUUnIzs/E/RF3GRgDDjMTnY4Mg1St9NKCwegnug0WcK4vNdpI
 6+0lj0qAf8t2aGtAB8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX4OJMlXokIZp0
 6oGRNwitv+2E/t/tJXTa0ikaBhDhvdw7e3FWH91vr/2f6DHP+1DKOCG92leYSv+dCvFLEvmRTFE
 BMpL+asUUdfiLpyiM+yuWhSjdaBvVtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 12:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248743

--000000000000691178065ed13d8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:24=E2=80=AFAM Mikko Rapeli via lists.openembedded=
.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> On Mon, Oct 26, 2026 at 03:45:25PM -0600, Joshua Watt via
> lists.openembedded.org wrote:
> > Adds SPDX deploy tasks to many recipes to record their output when
> > consumed in an SBoM
>
> I think this should be the default in deploy.bbclass.
>

I also think that would be preferable, rather than having to spread the
SPDX_DEPLOY_TASKS all over the place.
Everything that will use SPDX_DEPLOY_TASKS must already be using
the deploy.bbclass.

Jose


> The class is used to deploy files to "build output". A lot of BSP etc
> recipes use the class for this purpose and they are currently missing in
> SPDX
> output unless some output packages go to image rootfs.
>
> I think capturing too much data in SPDX is less of a problem than not
> capturing
> enough. Thus deploy.bbclass should support SPDX output by default, when
> SPDX
> is enabled.
>
> If there are other very good reasons for not enabling this by default, th=
en
> I think the commit message should say that.
>
> Cheers,
>
> -Mikko
>
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes-recipe/barebox.bbclass           | 1 +
> >  meta/classes-recipe/devicetree.bbclass        | 1 +
> >  meta/classes-recipe/kernel-fit-image.bbclass  | 1 +
> >  meta/classes-recipe/kernel.bbclass            | 1 +
> >  meta/recipes-bsp/grub/grub-efi_2.14.bb        | 1 +
> >  meta/recipes-bsp/opensbi/opensbi_1.9.bb       | 1 +
> >  meta/recipes-bsp/u-boot/u-boot.inc            | 1 +
> >  meta/recipes-core/systemd/systemd-boot_262.bb | 2 +-
> >  8 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/barebox.bbclass
> b/meta/classes-recipe/barebox.bbclass
> > index 3980849b53..252e97fa65 100644
> > --- a/meta/classes-recipe/barebox.bbclass
> > +++ b/meta/classes-recipe/barebox.bbclass
> > @@ -165,5 +165,6 @@ barebox_do_deploy () {
> >          fi
> >  }
> >  addtask deploy after do_compile
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> > diff --git a/meta/classes-recipe/devicetree.bbclass
> b/meta/classes-recipe/devicetree.bbclass
> > index 4fe389bed8..affbf115c2 100644
> > --- a/meta/classes-recipe/devicetree.bbclass
> > +++ b/meta/classes-recipe/devicetree.bbclass
> > @@ -166,6 +166,7 @@ devicetree_do_deploy() {
> >      done
> >  }
> >  addtask deploy before do_build after do_install
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  EXPORT_FUNCTIONS do_compile do_install do_deploy
> >
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> b/meta/classes-recipe/kernel-fit-image.bbclass
> > index 7b2bcd4673..d0f7274e70 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -260,3 +260,4 @@ do_deploy() {
> >      fi
> >  }
> >  addtask deploy after do_compile before do_build
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index 0a6d754108..14c71dec54 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -840,6 +840,7 @@ kernel_do_deploy() {
> >  do_deploy[prefuncs] +=3D "read_subpackage_metadata"
> >
> >  addtask deploy after do_install do_populate_sysroot do_packagedata
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  EXPORT_FUNCTIONS do_deploy
> >
> > diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > index d19b33b504..8d8671614a 100644
> > --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> > @@ -99,6 +99,7 @@ do_deploy() {
> >  }
> >
> >  addtask deploy after do_install before do_build
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  FILES:${PN} =3D "${libdir}/grub/${GRUB_TARGET}-efi \
> >                 ${datadir}/grub \
> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> > index 96167f7c73..bb35f906b2 100644
> > --- a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> > @@ -49,6 +49,7 @@ do_deploy () {
> >  }
> >
> >  addtask deploy before do_build after do_install
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> >
> >  FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.=
*"
> >  FILES:${PN} +=3D
> "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> > index b9f61a185c..1c9911ff6e 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -474,3 +474,4 @@ uboot_deploy_spl () {
> >  }
> >
> >  addtask deploy before do_build after do_compile
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb
> b/meta/recipes-core/systemd/systemd-boot_262.bb
> > index bab2e7ae27..c9bc3e2a91 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_262.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_262.bb
> > @@ -71,4 +71,4 @@ do_deploy () {
> >  }
> >
> >  addtask deploy before do_build after do_compile
> > -
> > +SPDX_DEPLOY_TASKS +=3D "do_deploy"
> > --
> > 2.56.0
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248711):
> https://lists.openembedded.org/g/openembedded-core/message/248711
> Mute This Topic: https://lists.openembedded.org/mt/121950655/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000691178065ed13d8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27,=
 2026 at 7:24=E2=80=AFAM Mikko Rapeli via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:li=
naro.org@lists.openembedded.org">linaro.org@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, O=
ct 26, 2026 at 03:45:25PM -0600, Joshua Watt via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> wrote:<br>
&gt; Adds SPDX deploy tasks to many recipes to record their output when<br>
&gt; consumed in an SBoM<br>
<br>
I think this should be the default in deploy.bbclass.<br></blockquote><div>=
<br></div><div>I also think that would be preferable, rather than having to=
 spread the</div><div>SPDX_DEPLOY_TASKS=C2=A0all over the place.</div><div>=
Everything that will use SPDX_DEPLOY_TASKS=C2=A0must already be using</div>=
<div>the deploy.bbclass.</div><div><br></div><div>Jose</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The class is used to deploy files to &quot;build output&quot;. A lot of BSP=
 etc<br>
recipes use the class for this purpose and they are currently missing in SP=
DX<br>
output unless some output packages go to image rootfs.<br>
<br>
I think capturing too much data in SPDX is less of a problem than not captu=
ring<br>
enough. Thus deploy.bbclass should support SPDX output by default, when SPD=
X<br>
is enabled.<br>
<br>
If there are other very good reasons for not enabling this by default, then=
<br>
I think the commit message should say that.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/barebox.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 meta/classes-recipe/devicetree.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 meta/classes-recipe/kernel-fit-image.bbclass=C2=A0 | 1 +<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 1 +<br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a> | 2 +-<br>
&gt;=C2=A0 8 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe=
/barebox.bbclass<br>
&gt; index 3980849b53..252e97fa65 100644<br>
&gt; --- a/meta/classes-recipe/barebox.bbclass<br>
&gt; +++ b/meta/classes-recipe/barebox.bbclass<br>
&gt; @@ -165,5 +165,6 @@ barebox_do_deploy () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 addtask deploy after do_compile<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy<br=
>
&gt; diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-rec=
ipe/devicetree.bbclass<br>
&gt; index 4fe389bed8..affbf115c2 100644<br>
&gt; --- a/meta/classes-recipe/devicetree.bbclass<br>
&gt; +++ b/meta/classes-recipe/devicetree.bbclass<br>
&gt; @@ -166,6 +166,7 @@ devicetree_do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 addtask deploy before do_build after do_install<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_compile do_install do_deploy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/class=
es-recipe/kernel-fit-image.bbclass<br>
&gt; index 7b2bcd4673..d0f7274e70 100644<br>
&gt; --- a/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; @@ -260,3 +260,4 @@ do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 addtask deploy after do_compile before do_build<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index 0a6d754108..14c71dec54 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -840,6 +840,7 @@ kernel_do_deploy() {<br>
&gt;=C2=A0 do_deploy[prefuncs] +=3D &quot;read_subpackage_metadata&quot;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy after do_install do_populate_sysroot do_packageda=
ta<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_deploy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a> b/meta/recipes-b=
sp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D"noreferrer" target=3D"_b=
lank">grub-efi_2.14.bb</a><br>
&gt; index d19b33b504..8d8671614a 100644<br>
&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a><br>
&gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.14.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.14.bb</a><br>
&gt; @@ -99,6 +99,7 @@ do_deploy() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy after do_install before do_build<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN} =3D &quot;${libdir}/grub/${GRUB_TARGET}-efi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir=
}/grub \<br>
&gt; diff --git a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb=
" rel=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a> b/meta/recipes-bs=
p/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=3D"noreferrer" target=3D"_b=
lank">opensbi_1.9.bb</a><br>
&gt; index 96167f7c73..bb35f906b2 100644<br>
&gt; --- a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a><br>
&gt; +++ b/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.9.bb</a><br>
&gt; @@ -49,6 +49,7 @@ do_deploy () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_install<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN} +=3D &quot;/share/opensbi/*/${RISCV_SBI_PLAT}/firmwa=
re/fw_jump.*&quot;<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot;/share/opensbi/*/${RISCV_SBI_PLAT}/firmwa=
re/fw_payload.*&quot;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-b=
oot/u-boot.inc<br>
&gt; index b9f61a185c..1c9911ff6e 100644<br>
&gt; --- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; +++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
&gt; @@ -474,3 +474,4 @@ uboot_deploy_spl () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_compile<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_=
262.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-boot_262.bb</a><br>
&gt; index bab2e7ae27..c9bc3e2a91 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_262.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-boot_262.bb</a><br>
&gt; @@ -71,4 +71,4 @@ do_deploy () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_compile<br>
&gt; -<br>
&gt; +SPDX_DEPLOY_TASKS +=3D &quot;do_deploy&quot;<br>
&gt; -- <br>
&gt; 2.56.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248711): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248711" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248711</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121950655/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121950655/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000691178065ed13d8b--

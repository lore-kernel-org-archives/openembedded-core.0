Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2736.1792531990138807041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 14:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=K81PVRjD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=P8b5NrFZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtb3l2222518
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 21:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMIrYeoevvA4s9oKZqiugykCQQXoegD3rrT1eRwC0is=; b=K81PVRjDOZwD+LhD
	pOe6pDaBI/JYAIQ7KH7uvcsfdlN0g2jo4U+8r5o2h1C/jWPdQ2v4vBIcmoLMY9c/
	BiliUqgcSl4lL7mzKvqsmqWj1nH+LnitHpT/BY/Q99Jv2u0nJVaKgsDNhPPvM661
	mYQ7Wu72T9rN5mvrMQI72VtQuYcK0nIQA+z5yD2ufbLOzAYKgkfIYnqkeQGOBiz6
	1Y+nbvCWkEZNpZiY7sYmEbaQbztWTgO8AUk7DLzsYEpP1tAsZoOpEM3g7Mn9C9il
	ePf78WOyzhmR5VKiG2WdmFlgILta/tQdfyjm4dyaeBqd2G3j67kC9rwPSovl8CaS
	w2vN4A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0gpj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 21:33:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso13051a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 14:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792531987; cv=none;
        d=google.com; s=arc-20260327;
        b=libByQ24Sf80r8x7ldrMpuFOHi/kFH7gz75mgt/slm8hmb8ihXyp5/6+uzFLi2Uaiy
         h5fNVI+FmNAe3XVXOBAeaWVD1jrD0s+3ZaRQwluQIsIAmjsv5K4zyzlmwi3aU99rYY7N
         qfVfB2qrj+5WfZTX7kHe/lOr5XRzs1lh0DdnM6+pThdaFAuV848LsiHqGfHVkXw5d6Vn
         0MA2NNIaRO+Q0eA8aa7E3Cw9FxBOTN+Y3moo6mBFA9KWzoMbZb7s/RAWCLUuMK2CMm1Y
         Stb0IuiztX+BoelJjG8YjBGXDjv7wse443ifKugmUtGCW1nSUwImVm7xO0L0Q4QxFXwk
         b+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GMIrYeoevvA4s9oKZqiugykCQQXoegD3rrT1eRwC0is=;
        fh=WC8oM0jbj1pGGyUaLpIoYYWujctzZur9XvWcqW8E9gE=;
        b=KzI8CrgJEDnXuduJOMwCy3QEIN+m6CPUwKogPlQ7z5O1lLTHcczZ/vFkdmIQM+7Uyb
         teTQ6wBXdz1Gbs24Z+Rm84eSwMrD8n9Ar5fScsW8rt5TiXxQd91WoF3IpN0NOYypBuHJ
         6iEuUXXmkbHcC7nRwjdpV8k3oUhUZV/uTEGLK/GJOOkg6rUI2Z9CYi1cdNxQcc1cBoTC
         o29dQTMwly+/RjO1Di/NmPzKzrhj/TQSOXl139cqgHwU+qwyCHYHHRk4f7inbRzCxu8k
         4lS/urwyywIZI77HSL3V3CtGdgAr9hDmDv92xEQ5TgSdMPlewwj05XUPAXIyFZ7wdEZi
         b/yQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792531987; x=1793136787; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMIrYeoevvA4s9oKZqiugykCQQXoegD3rrT1eRwC0is=;
        b=P8b5NrFZzePQYgXGSSBaBjVcIa2pY3da71fyy7g9Aa5efBuXN4afKYv+uAL7Kwfelm
         43kW4Bglh64AqYh5QlYjdrMMwvzcW976QVwKqRsE/zaH0hUOv0b+YZSZCNDetu92tloM
         4R9BzklYVqc0S4O7+Ip1484wPjAzEiWTHROpOf8zOxIJ+n2wCoqJiTbsGVVYJ3d1sKBM
         Hs70aOWZ4deEYUbeL76+h7zT0f8pEGpq+PS7dpmXdBOCZy8//SYP+tcS+FugaZFaVNSQ
         yjdZLd7EtecHrStauNt0EN+mJnZUVXuJdxWIRLZ8nLAydzZ1lG1lHgIEytM6FEQyFTih
         OPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531987; x=1793136787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMIrYeoevvA4s9oKZqiugykCQQXoegD3rrT1eRwC0is=;
        b=A6ZuWg0uLjWQXiK5PWNO9P0LCCNupKa5ABEuJ1R74HCAzNMbK8dpU46rUObv7HiNzP
         rvh8diHXx3rOMd76TMRWM8NZRNYCJZw91XI6HPUev5eK0nTZT26TXbd6vlWRTnJVfQ9V
         5u8cR0vkBiOIfhaao9aXxzAi6suXIjhXNhpguV462AS4nQaqquPbVkHI+QkhVsZBrHk+
         ouUcaFZYFc1mKBfz3rcu4xFhSznWjSxYVZ0eexJedgYCugdH6w94fBthj56Ng1ltyoL5
         aQlygTFSrXY3H29YLQbLcslOFKec2J5kXVJSQG5x5l44C6R29/mU9o24At67tApckW0L
         A8fA==
X-Gm-Message-State: AFq9FYIh3BJF9GxpmcIagaJ9vMnqU3oYTUYJTK33nvwxfHUDza45Rm+L
	L5xB3ADqnvWNMxkqd+fuEekcPrkHVIrYho+t5xO4qGpt1kWMuXB8SEMub/4YopiRRaqRcR6EAnt
	IJeTVb/4fC5Z2lYrXn8a4c6Kq/oMYh89WMD18YxUFlbNC5GnNDDejyFApC2M9+wPtQ5k9DCrXi7
	HyrD4Ajd5qmIPfkZHJJ2Uzi+zqvDlREr14t85M8BDfTZk+tpKE2fEfpL7xZPvqMBneMgu5
X-Gm-Gg: AYBFou2EZ8qzday9ZgG/bhUyzwSI2Rp9NEymO3w5NTdBAN/PzF2R2b4+DRTaCAdWHWw
	QWD2GMlRLazosRWfR0y57NBHx9dkL+1r9YOPxSD0xbm3ldmdzSKAowV8iUswCJyduRWQvTA9wzk
	6VJMvqeBJ23XidL5bwrw4t+jWzYDrrn4SMvee18g2VqppCYMvzx7NULrs=
X-Received: by 2002:a05:6a21:6116:b0:3e2:3392:53f8 with SMTP id adf61e73a8af0-3e287dd5be9mr110635637.12.1792531987354;
        Tue, 20 Oct 2026 14:33:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6116:b0:3e2:3392:53f8 with SMTP id
 adf61e73a8af0-3e287dd5be9mr110618637.12.1792531986738; Tue, 20 Oct 2026
 14:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260905224403.152831-1-ricardo.salveti@oss.qualcomm.com>
 <ca796be26f7848304079f52c3a17f42aef210114.camel@gmail.com>
 <CAA_5youCKSC_=QGGwnMAvcqXEAf1aWn=27ekMzYL_S8RdeC9Ag@mail.gmail.com> <13e27d0dd254337f30ada3542eb8c785ce046c25.camel@gmail.com>
In-Reply-To: <13e27d0dd254337f30ada3542eb8c785ce046c25.camel@gmail.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 18:32:29 -0300
X-Gm-Features: AclHuK99gpZPTCeO2ovKPAUR7IhqRot6j-BKADis2yGwvNz0kRZDco4aBSb_MlA
Message-ID: <CAA_5yosj8sLF2sW5gRdEDi2jAd_w39=tQ0nQgzFZthorEnhkng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: keep the SPL BSS padding when
 reassembling the SPL binary
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NSBTYWx0ZWRfX2jGqL/O44Icm
 cGaDEIMyP2MCl6Z8nDPguMKsS5oPLvPSWCPX9Ir7GxNduY4PLgnaN+DmljMU+Qsi8ZKOhiwf6LN
 HHM3o/0lsz0NXhXvc5Z1YAp3Ze9UxJLNrPnZDIcakRHokKc9cs0r78xuRE5TDWR+bRJ1ZnPz/iI
 S8M4cLNC1DOS8/zGB60/ZKM7DRyCNoN0MdUTShTCLflUWrLqfDlzlL10Q53m48rbRiM1jyClBBO
 X50/Z3jqujRT/gM5ZS/ui/OtTBIO8oFKMgboeA0SRN+VV6KGKqbPUGgVAJgwCuHbGfF2WMDIGpN
 l8c47TOfTHPPblcXU6+DS3uqKqqrcRAaem5dsNww/qWDADzUsnucb1CJsRvrgBQC4fl08QsuIRg
 0NnruBPtkVcUlrzOaa1F4oCuWu3sTXvmAPnVd+VL6SF9ULTpzKWWnIl0Oues2uKpgF80ZdlagKs
 VgXxeC8gTJMt+rp6ASw==
X-Proofpoint-ORIG-GUID: -6kyOlBh-BcE9qpboqZ3iPJXbwNpisAt
X-Proofpoint-GUID: -6kyOlBh-BcE9qpboqZ3iPJXbwNpisAt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NSBTYWx0ZWRfX0Z0hVP9itack
 RlMtE9yP7sPRwDHxXtZcyZllI5tEOHFYj/y3tQEahC5GVnOTTTJ68U6wVN91LfgjlCCtIKUUNO1
 cvReu7JLaQXoBWUmtqhuqgcByhgMfxw=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7de15 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=apn0q0EWAAAA:20 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=haw-Pmro1ug6-7fVoY0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 21:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248310

Hi,

Sorry for the late reply, lost track of this one due travels.

On Wed, Sep 9, 2026 at 4:08=E2=80=AFPM <adrian.freihofer@gmail.com> wrote:
>
> On Tue, 2026-09-08 at 17:12 -0300, Ricardo Salveti wrote:
> > Hi,
> >
> > On Mon, Sep 7, 2026 at 1:28=E2=80=AFPM <adrian.freihofer@gmail.com> wro=
te:
> > >
> > > On Sat, 2026-09-05 at 22:44 +0000, Ricardo Salveti via
> > > lists.openembedded.org wrote:
> > > > concat_spl_dtb() rebuilds the SPL as a plain concatenation of the
> > > > nodtb
> > > > image and the signed device tree. U-Boot only assembles it that
> > > > way
> > > > with
> > > > SPL_SEPARATE_BSS; otherwise BSS is part of the image and it pads
> > > > between
> > > > the two, so that clearing BSS cannot overwrite the appended
> > > > device
> > > > tree.
> > > > Platforms loading the SPL as one contiguous image, such as
> > > > Qualcomm
> > > > SoCs,
> > > > need that layout: without the padding the device tree ends up
> > > > inside
> > > > BSS
> > > > and spl_early_init() finds none, before the console is up.
> > > >
> > > > Reassemble at the offset U-Boot used, taken from its own image as
> > > > SPL_WITH_DTB_BINARY, and fall back to the current behaviour when
> > > > it
> > > > did
> > > > not pad.
> > > >
> > > > AI-Generated: Uses Claude Code
> > > > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > > > ---
> > > >  meta/classes-recipe/uboot-sign.bbclass | 20 +++++++++++++++++++-
> > > >  1 file changed, 19 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes-recipe/uboot-sign.bbclass
> > > > b/meta/classes-
> > > > recipe/uboot-sign.bbclass
> > > > index 236d19925e..4743b86dd4 100644
> > > > --- a/meta/classes-recipe/uboot-sign.bbclass
> > > > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > > > @@ -57,6 +57,8 @@ SPL_DTB_SYMLINK ?=3D "u-boot-spl-${MACHINE}.dtb"
> > > >  SPL_NODTB_IMAGE ?=3D "u-boot-spl-nodtb-${MACHINE}-${PV}-${PR}.bin"
> > > >  SPL_NODTB_BINARY ?=3D "u-boot-spl-nodtb.bin"
> > > >  SPL_NODTB_SYMLINK ?=3D "u-boot-spl-nodtb-${MACHINE}.bin"
> > > > +# The SPL image as assembled by U-Boot, before signing.
> > > > +SPL_WITH_DTB_BINARY ?=3D "u-boot-spl-dtb.bin"
> > >
> > > This looks like a MACHINE specific variable. Should it default to
> > > empty
> > > string and be assigned only in machine conf files which need it?
> > > And
> > > then...
> >
> > The file itself exists for every configuration with an SPL device
> > tree, so while it depends on the configuration used by the machine,
> > it
> > is generic and widely used.
>
> To be honest, I did not look into all these details. I'm trying to
> understand if this new variable can have a negative impact on other
> MACHINEs. Usually the review is easy if the code looks like:
>
> NEW_VARIABLE ?=3D ""
>
> ...
>
> if [ -n "${NEW_VARIABLE}" ] ; then
>     new opt-in feature...
> fi
>
> Sure, there's no logic or rule that says new features can always be
> implemented that easily and well isolated. But we also need to prevent
> from commits that potentially have a negative impact on existing
> boards.
>
> If I correctly understand your response, I do not understand that you
> are 100% sure the this is 100% always right and there is no risk for
> other MACHINEs. Or am I misunderstanding?

The file itself is always there: with OF_REAL and OF_SEPARATE (which
this class already requires) U-Boot always builds u-boot-spl-dtb.bin,
and its own u-boot-spl.bin is a copy of it. With SPL_SEPARATE_BSS the
computed offset equals the nodtb size, so the output is identical to
today.

That just doesn't work with SPL_MULTI_DTB_FIT, where U-Boot appends
the multi-DTB FIT rather than u-boot-spl.dtb, so the offset
calculation would be off. But SPL_MULTI_DTB_FIT isn't supported by
this class yet anyway: concat_spl_dtb() replaces the FIT with the
single signed u-boot-spl.dtb. Having a variable that names the image
U-Boot assembled,
and checking for that file, also leaves room to support multi-DTB FIT
later on. With that I'm fine making it opt-in as you suggest.

> > From u-boot sources (depends on OF_REAL and OF_SEPARATE /
> > OF_HOSTFILE,
> > and this class already depends on OF_SEPARATE for signing support):
> > https://github.com/u-boot/u-boot/blob/main/scripts/Makefile.xpl#L323
> >
> > > >  # U-Boot fitImage description
> > > >  UBOOT_FIT_DESC ?=3D "U-Boot fitImage for
> > > > ${DISTRO_NAME}/${PV}/${MACHINE}"
> > > > @@ -249,7 +251,23 @@ deploy_dtb() {
> > > >
> > > >  concat_spl_dtb() {
> > > >       if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" ] && [ -e
> > > > "${SPL_DIR}/${SPL_DTB_BINARY}" ] ; then
> > > > -             cat ${SPL_DIR}/${SPL_NODTB_BINARY}
> > > > ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL_BINARY}"
> > > > +             # U-Boot pads behind BSS before appending the
> > > > device
> > > > tree
> > > > +             # ($(SPL_BIN)-pad.bin in scripts/Makefile.xpl);
> > > > keep
> > > > that offset.
> > > > +             nodtb_size=3D$(stat -Lc %s
> > > > ${SPL_DIR}/${SPL_NODTB_BINARY})
> > > > +             dtb_offset=3D${nodtb_size}
> > > > +
> > > > +             if [ -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" ]; then
> > >
> > > ... this -e could fail fatal if the variable is non-empty string
> > > and
> > > the file does not exist rather than fail silently?
> > >
> > > Further, would it be less risky if all the special handling of
> > > SPL_WITH_DTB_BINARY would be in the if block?
> >
> > A board that does not define OF_SEPARATE would cause issues even
> > before this function is executed, but we can separate into another if
> > block if preferred, something like:
> >
> > +               if [ -n "${SPL_WITH_DTB_BINARY}" ] ; then
> > +                       if [ ! -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}"
> > ] ; then
>
> I think we should not write -e in bitbake code. There are many reasons
> why a file can be there by accident (e.g. previous build with different
> configuration) or not there by accident (e.g. a bug that the file is
> just not built). In general it's more robust if the code looks like:
>
> if [ -n "${NEW_VARIABLE}" ] ; then
>     test -e "${SPL_DIR}/${SPL_WITH_DTB_BINARY}" || bbfatal "file not
> there".
>     ...
> fi

That's fair, will send a v2.

Thanks!

Ricardo

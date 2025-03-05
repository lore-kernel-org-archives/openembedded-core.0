Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A68AC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 12:08:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11710.1741176492754887944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 04:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=OzFYjtrG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_bpothuno@quicinc.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525Ax8UD024327;
	Wed, 5 Mar 2025 12:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWrkKI5x0Wq5KHHAIno6JdDN68JSP+TnNit0lKVoYCk=; b=OzFYjtrGfVXuIGzp
	agFmCB1qfgpoBhp73xm2TAyjM/m2yKPVLeE2dZ6RT7s02nCQLAIJOrfHgUFVkJ2R
	fxx7UyDYdcxwlNnUsOt8Qim7pmXtGVjxwut/ULoLb+NhLuLkwQWbEgaG/aypWjmD
	fDmMajmMCm4grd4SFqbKJuqMnzU8rMrJ0l4YTL0SvV33nR0F6sEJVqG727Is4shV
	Qam9Mv69bkJbBLnr/HzJAbKstfQCF2v8Py0Lf+M1SAYMQ67gwbgrSGNNmt8QCAfE
	CFNn2nrlmd068M6t5X21kL2PqnII0Xp3AXg9ROfQrIPGiDdBX9mBfk/wEmEOkGKG
	ltkxhg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p9357hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 12:08:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525C89WO007938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 12:08:09 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 04:08:09 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::fc0a:7737:fa2e:7315]) by
 nalasex01a.na.qualcomm.com ([fe80::fc0a:7737:fa2e:7315%4]) with mapi id
 15.02.1544.009; Wed, 5 Mar 2025 04:08:09 -0800
From: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Balaji
 Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0 version
Thread-Topic: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0
 version
Thread-Index: AQHbjZprIMo8wosOm0iDED4MfmJdgLNkwRkA//96WCA=
Date: Wed, 5 Mar 2025 12:08:09 +0000
Message-ID: <88cc44853dc94eb3b5b7a0c9abfa4ff3@quicinc.com>
References: <20250305064101.4065316-1-quic_bpothuno@quicinc.com>
 <kxtt4okxjormycbnwxffxqadztn2mgzthuu6btjlkzqsdhihhc@deieyeztitxj>
In-Reply-To: <kxtt4okxjormycbnwxffxqadztn2mgzthuu6btjlkzqsdhihhc@deieyeztitxj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.51.80]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c83eaa cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=xqWC_Br6kY4A:10 a=_REmwED879gA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=29iXaaDHAAAA:8 a=TaTpU2FGWGMs38_uX8IA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=IKEkoQGeIXdUWEBz-oOH:22
X-Proofpoint-GUID: sCHdgBkHXf2k0hTMsMMP36LiU3f6Tn2p
X-Proofpoint-ORIG-GUID: sCHdgBkHXf2k0hTMsMMP36LiU3f6Tn2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 12:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212305

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Wednesday, March 5, 2025 2:17 PM
> To: Balaji Pothunoori (QUIC) <quic_bpothuno@quicinc.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0 ve=
rsion
>=20
> On Wed, Mar 05, 2025 at 12:11:01PM +0530, Balaji Pothunoori wrote:
> > Current dhcpcd (version 10.1.0) service crashes on the WiFi (wlan0)
> > interface with the following error:
>=20
> There are newer releases, which already have this patch. Any reason for n=
ot
> upgrading? For example there was an AUH message from March 1st.

Few patches are applied as OE Specific in https://git.openembedded.org/open=
embedded-core/tree/meta/recipes-connectivity/dhcpcd/files=20
Hence, I can't perform end to end testing for upgrade, So proceeded with pa=
tch BACKPORT for 10.1.0 version.

>=20
> >
> > "ps_seccomp_violation: unexpected syscall 135"
> >
> > This update pulls in fix #421 for dhcpcd 10.1.0 to address this issue.
> >
> > Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> > ---
> >  .../dhcpcd/dhcpcd_10.1.0.bb                   |  1 +
> >  ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30
> > +++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644
> > meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_si
> > gprocmask-syscall.patch
> >
> > diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > index 3f806bb18783..99b72852bf34 100644
> > --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> > @@ -15,6 +15,7 @@ SRC_URI =3D
> "git://github.com/NetworkConfiguration/dhcpcd;protocol=3Dhttps;branch=3Dm=
a
> >             file://dhcpcd.service \
> >             file://dhcpcd@.service \
> >
> > file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
> > +
> > + file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
> >             "
> >
> >  SRCREV =3D "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
> > diff --git
> > a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_
> > sigprocmask-syscall.patch
> > b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_
> > sigprocmask-syscall.patch
> > new file mode 100644
> > index 000000000000..7058330165f3
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR
> > +++ _rt_sigprocmask-syscall.patch
> > @@ -0,0 +1,30 @@
> > +From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17
> 00:00:00
> > +2001
> > +From: Scott Shambarger <devel@shambarger.net>
> > +Date: Sat, 7 Dec 2024 16:37:28 +0000
> > +Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
> > +
> > +Fixes recent glibc changes to getrandom() used by arc4random().
> > +Fixes #421.
> > +
> > +Upstream-Status: Backport
> > +See details in
> > +https://github.com/NetworkConfiguration/dhcpcd/issues/421
>=20
> This doesn't follow the established standard. I doubt that it will not tr=
igger QA
> error.

Validated the patch using " patchtest --patch <patch_name>"

>=20
> --
> With best wishes
> Dmitry

Regards,
Balaji.


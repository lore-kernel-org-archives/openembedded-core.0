Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7209.1792573191508364151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 01:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E5j1pD3K;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fE5duqwx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jA623711584
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N6Nxu0awK4m549vjaNSpWLag
	7+A65ZB0eqFudlD9NPg=; b=E5j1pD3KcfGvHtJnftkn1dONLlH+GqvbOklJm/7y
	r4HmaHuAILssF59pfw9GnchC6DJp/jq61Ei9cgP98d+6/ZYAIxGDVUp2v9t4tfWc
	sLdH2rj/EA2StVGJEGcMqaqXN4E7nj/I9Av02VVDAs6PxVEK7Z8v+ShBmmuH8isG
	ctt1Frb/pOsVd4nuTbUG1E8yVWP3hCn25SMdM6t8HfwX4aVreBS/DWan2LSYDfFb
	3rCklf1feg90Hly9/hYa82gZs+XiU+jpjIVNyWeYkCLBZ4uCRD6kV1EvrMII7ZcP
	6ot82zl2b96I96xpWulWpbl7GgII2/NhnG0bzKw2Mz3wvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v367r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:59:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so159521585a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 01:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792573189; cv=none;
        d=google.com; s=arc-20260327;
        b=FILtR5KoCBVemlW2jV0LrmQOk0h8OKM2vAIHOKB9XrBGy95lU2JEMLDA9719Df64Kw
         5kSiW0lbtR63EKeoZZYr8uYZIuGBF1SkXgUwRP+vjpz8nx9XG2LAF2jKzVj07nLMZkI3
         ZOidUIleagctM6pnUpYOiWzRqjWM9rWU2ui1SJPpdX+aD+uxvEtHZ9hk7TRBJfOV/Af8
         RN+iCpMr9vYvADDpoOcWcaPVIf2xPbFpVfzoMtZEz35M0i0HFo8c2+t1C7UoxVZN6MbN
         u17AEBLiT+9R+2Iiy8W3zjMFZ1p50BG9kmny0ne40jWv/+p7N+dmirr755z5yk9YXver
         BlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N6Nxu0awK4m549vjaNSpWLag7+A65ZB0eqFudlD9NPg=;
        fh=pTInZ4NOA183XGSB6U2PUvDAAJLH7lrlNQARXe3Cbr4=;
        b=DJrKjj4+iXRhSpgJ9JieEfReisibTYkMsNL4p3gAiG2zVRHzSFhIdD3HDaGvH55KgA
         uITWjjxRjmWqVBcyvCgDafOwYU1IObog5oAy9rvvaUgu4T2pDD5Sv95QRhnd/aRnYJ+E
         Lulr9GusMHt8pIIZL/2LnBKayX0Fw1cFlKV49sx0CJx7i86/u1fiUnDdaD353nSsACh+
         1V4r/J+8ZzY71ETkzutBRZ16FPmVYnTKe9UnYHX5Li8szKv3ZZ4bCm7mv4T+kbPuZxjU
         rxUrbloI0ffQJDwJ2/UdP60zO7Xi9UJ/Jp6Meu4trc2m0MinxTbe5Lsvl3B1jnKaLACE
         tbMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573189; x=1793177989; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6Nxu0awK4m549vjaNSpWLag7+A65ZB0eqFudlD9NPg=;
        b=fE5duqwxtRMBKfM5sBXSsoZCEkSZy5fCd92ihwa/pOwXeLE4EGZt00vLlOUgciZUQ/
         WxxRh0XoEhB5z0mu9gHwvIv76JE+5DNqxMDJmM6LCXxWE2yzdxdBo0Ic6l7RdEwP79Y+
         gHepOJNeJNa76lXM3HCVGKE9UzKXDVlh/eh69WKgIiTbYwMY3h+OOTlcTYFpuFPyWX2f
         AFccvfr5EDBNQlCf076g66n81dS8Qc3GZ+PmvErT403vqQ+bbDzna8v/IK6shE8eJDC4
         KybUomHlo2q294DL7i2ySl3s05ez03dVGInSSdclR2nzgHbbp6tFiS+F7+BhKGVkTyft
         j0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573189; x=1793177989;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N6Nxu0awK4m549vjaNSpWLag7+A65ZB0eqFudlD9NPg=;
        b=NonEq960Th6g6k4CQ+veUU27Xv5tcLMY3vLwQMoXMg68ZbS1Gmv8071m1odCuWntyv
         WN2GXiUFr5U11Sb0vcm3ULLNM1MMU93TPrkgo8ZL/yQCpnIisrYsujPilkzFNQoswWYL
         An8Y4avoaF5jHRRppSkdKcHYW73TGSa1d2EX/01hRQq08ysV/KsD0FWANkL2oK0PvdLT
         Piq0VsgiGF79LtSjd29lE5FBrLefE1G8Kmrt4ft/EYMVO54KhUeU2xTmhUqi5gk0/9Jn
         xBV+pCRSoiinw4TnsM7vUvJG8zaHZx8akPN7UQ1buqvm47tal8TTF0Gjh/6hWnjBpOys
         cVjg==
X-Forwarded-Encrypted: i=1; AKwUvBwDBfbYAn0UWufPZlzJftQT/Mg3pfq0YE5egv1seJNvviJ5pczHvgzNaN6RUDNyHmSBfSc16St6B9UhqV1vyDHd0g==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI3Y1y6Fxlxl2VBkh8ny1+hTLtNo9Vmz2rMVAFQh+owXNIJBGP/
	yEj/VCzL9pUOpDssKBy5uLymK6aqq3GHBaNpDpWKYFloJCS2MEs2s2mpRNr6kknm07C983yeYeZ
	UMDfToUeDxHeTZei+3vrUHRNEVhHC4zBuoEndmn4n08TN1VdqdP+F4qarbk0/QJMBXEJMpDDr/U
	og1KoxuYXvy6ICAC3+JN44gJmN5Z6A3m5vfZAxHXsCBKW0Qr7qAiq7otCnQA==
X-Gm-Gg: AYBFou3Yln8gO8AFvRsd+WrDiX1xhZC01H1vrCsu36SxBAYCgOodsQ+tMiHtIgl0Cpp
	Q9/CY03CIOnd6g172Nw4lsvVZPp+IIIFUzFry8bvVFfu2m+RJZjbc/ZcQlw3ii/hg0sjrs16Esb
	FrreJXkrQSD00koOzuN/RwFWDi6j5dwgWuZ+GL+S4NBzTI7fesYWz/3q8krVI=
X-Received: by 2002:a05:620a:84c9:b0:93e:d7f0:497a with SMTP id af79cd13be357-93f57f1ecffmr282039085a.16.1792573188888;
        Wed, 21 Oct 2026 01:59:48 -0700 (PDT)
X-Received: by 2002:a05:620a:84c9:b0:93e:d7f0:497a with SMTP id
 af79cd13be357-93f57f1ecffmr282036385a.16.1792573188308; Wed, 21 Oct 2026
 01:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261021-ca-certs-v1-1-b12c7c3bf7c2@pbarker.dev> <DB5PR02MB10213E52B6D3A99BB7A0CF37CEF662@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E52B6D3A99BB7A0CF37CEF662@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:59:37 +0100
X-Gm-Features: AclHuK_ibDMKO52-vRyiq6sZ-sVNuhgOQLVd2JKgA8rGmJAYYYV34GEpo78gt5c
Message-ID: <CADWMC-YZyOhhhkri6fWD5Rc6gS8amsO-LAj2zdNxX29wx+62Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ca-certificates: Disable compromised CA certificates
To: peter.kjellerstedt@axis.com
Cc: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f93be065e55f853"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX8ETrb5+3bxt+
 guofRKO+syQFeOOEjnSWeLQr+OWo1xkHJgYXdAqTXGGKyBv89hGoxPJs6kwIXZd/oMQIm3i9Sbi
 djCvVuY2HYlEGdpra8Ryl2F8QNcCnNk=
X-Proofpoint-ORIG-GUID: uAWdWGQtEkn7ObKn7ijQneHvnDS9LHT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX2q/uFwLAbbqX
 c6yepnMslXifwQF0h3IwtoO+BISKP3Z5cbr/ezZfUKr+akUj0hkXVanvU/K2Fi71BpLBmAH3Y5g
 cSE1Mfz7nV0IhCaS911g56qZy4BaRJkpZbUN7xigvXa8AsZkh5fAXxO82CtxZgWzX312bTcjZBp
 48YmhKWqpv/84fKzaPLw/Or7Yjx2NRhH0E6WF5pNdE/5F4/LqFC6w6idVZ4NwmskPgBu5fDafXX
 Lf1lbK8YbEB60JExckMuG3aRqSZ69kq1e8Qya3gZyOqVIcLF4Gy4x1bXzCsAr7/lU/bTH+bKB1J
 hKP/Ro0u7DSVrT+svn9H5wx06debT53ZViuw5pXC8Xl8mtKbWFWXjg+4OzJWeKn2aa/ST8BIu8W
 j2ZjcJ2Vo0NpNvn0fb8LigWHGbavxu8usWBRRO5+r0fTGEMgdMA0vgr/4e4zmbhSFyb8NnqWfyT
 7qu5wqFy8Xc2DubUn9A==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad87f05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=-VINok9lAAAA:8 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=nCp6ePDHGM70vd_j_uQA:9 a=QEXdDO2ut3YA:10 a=utMW0t27AAAA:8
 a=AzXGCbznKDFZbcgObKkA:9 a=y49ZSkKj_xq4V9cY:21 a=lqcHg5cX4UMA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=u5lqgLRgOhU_413jC3zP:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=og0ZNMpbOFHgjJQd6y5y:22
X-Proofpoint-GUID: uAWdWGQtEkn7ObKn7ijQneHvnDS9LHT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248376

--0000000000001f93be065e55f853
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:56=E2=80=AFAM Peter Kjellerstedt via
lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.or=
g>
wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Paul Barker
> > Sent: den 21 oktober 2026 09:00
> > To: openembedded-core@lists.openembedded.org
> > Cc: Paul Barker <paul@pbarker.dev>
> > Subject: [OE-core] [PATCH] ca-certificates: Disable compromised CA
> certificates
> >
> > Backported a patch to address the eMudhra Intermediate CA Compromise
> > disclosed at https://emudhra.we-have-a-problem.com. As this is a
> > certificate authority compromise rather than a software flaw it doesn't
> > have a CVE number, but this should be treated like a CVE fix.
> >
> > This is a backport rather than a version bump as Debian did a
> > "non-maintainer upload" 20260816+nmu1 instead of a typical new version
> > release.
> >
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35
> ++++++++++++++++++++++
> >  .../ca-certificates/ca-certificates_20260816.bb    |  1 +
> >  2 files changed, 36 insertions(+)
> >
> > diff --git
> a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emS=
ign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
> b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emS=
ign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
> > new file mode 100644
> > index 000000000000..9a0258919aa6
> > --- /dev/null
> > +++
> b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emS=
ign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
> > @@ -0,0 +1,35 @@
> > +From d5e08f63b1ca6746a51e62cda4df5483c0d3e2ec Mon Sep 17 00:00:00 2001
> > +From: Paul Barker <paul@pbarker.dev>
> > +Date: Wed, 21 Oct 2026 07:16:23 +0100
> > +Subject: [PATCH] Blacklist "emSign ECC Root CA - G3" and "Comodo AAA
> Services
> > + root"
> > +
> > +[PB: Backported to address the eMudhra Intermediate CA Compromise
> > +     disclosed at https://emudhra.we-have-a-problem.com. As this is a
> > +     certificate authority compromise rather than a software flaw it
> > +     doesn't have a CVE number, but this should be treated like a CVE
> > +     fix.]
> > +
> > +Upstream-Status: Backport [
> https://salsa.debian.org/debian/ca-certificates/-/commit/4a0203e5ce4ce1a0=
64b97387f52ca6a00c97185c
> ]
> > +Signed-off-by: Paul Barker <paul@pbarker.dev>
> > +---
> > + mozilla/blacklist.txt | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt
> > +index d84ceb919906..ba3635f7af87 100644
> > +--- a/mozilla/blacklist.txt
> > ++++ b/mozilla/blacklist.txt
> > +@@ -3,4 +3,9 @@
> > + # Blacklist explicitly distrusted certificates to explicitly ignore
> them and prevent build errors
> > + "Explicitly Distrust DigiNotar Root CA"
> > +
> > ++# Blacklist "emSign ECC Root CA - G3" (cf. #1151413)
> > ++"emSign ECC Root CA - G3"
> > ++# Blacklist "Comodo AAA Services root" (cf. #1151413)
> > ++"Comodo AAA Services root"
> > ++
> > + # Expired CAs
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-support/ca-certificates/
> ca-certificates_20260816.bb b/meta/recipes-support/ca-certificates/
> ca-certificates_20260816.bb
> > index c9702d545a1c..be1ffeae4f54 100644
> > --- a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
> > +++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
> > @@ -19,6 +19,7 @@ SRC_URI =3D
> "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
> >
>  file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
> >
>  file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
> >
>  file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
> > +
>  file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch \
> >             "
> >  S =3D "${UNPACKDIR}/ca-certificates"
> >  inherit allarch
> >
> > ---
> > base-commit: 94fd491210b5269f7242df59db1541379e25754f
> > change-id: 20261021-ca-certs-dff9f0ace701
> >
> > Best regards,
> > --
> > Paul Barker
>
> There is a related CVE, CVE-2026-111943, for golang.
>

Peter Marko already sent it yesterday
https://lists.openembedded.org/g/openembedded-core/message/248308

Jose


>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248375):
> https://lists.openembedded.org/g/openembedded-core/message/248375
> Mute This Topic: https://lists.openembedded.org/mt/121863200/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001f93be065e55f853
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Oct 21, 2026 at 9:56=E2=80=AFAM Peter Kjellerstedt via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;peter.kjellerstedt=3D<=
a href=3D"mailto:axis.com@lists.openembedded.org">axis.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Paul Barker<br>
&gt; Sent: den 21 oktober 2026 09:00<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=3D"_bla=
nk">paul@pbarker.dev</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] ca-certificates: Disable compromised CA cer=
tificates<br>
&gt; <br>
&gt; Backported a patch to address the eMudhra Intermediate CA Compromise<b=
r>
&gt; disclosed at <a href=3D"https://emudhra.we-have-a-problem.com" rel=3D"=
noreferrer" target=3D"_blank">https://emudhra.we-have-a-problem.com</a>. As=
 this is a<br>
&gt; certificate authority compromise rather than a software flaw it doesn&=
#39;t<br>
&gt; have a CVE number, but this should be treated like a CVE fix.<br>
&gt; <br>
&gt; This is a backport rather than a version bump as Debian did a<br>
&gt; &quot;non-maintainer upload&quot; 20260816+nmu1 instead of a typical n=
ew version<br>
&gt; release.<br>
&gt; <br>
&gt; Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" tar=
get=3D"_blank">paul@pbarker.dev</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 ++++++++=
++++++++++++++<br>
&gt;=C2=A0 .../ca-certificates/<a href=3D"http://ca-certificates_20260816.b=
b" rel=3D"noreferrer" target=3D"_blank">ca-certificates_20260816.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 36 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001=
-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch b/meta/recipes-=
support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G=
3-and-Comodo-AAA-Servi.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..9a0258919aa6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blackl=
ist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From d5e08f63b1ca6746a51e62cda4df5483c0d3e2ec Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" target=3D"_=
blank">paul@pbarker.dev</a>&gt;<br>
&gt; +Date: Wed, 21 Oct 2026 07:16:23 +0100<br>
&gt; +Subject: [PATCH] Blacklist &quot;emSign ECC Root CA - G3&quot; and &q=
uot;Comodo AAA Services<br>
&gt; + root&quot;<br>
&gt; +<br>
&gt; +[PB: Backported to address the eMudhra Intermediate CA Compromise<br>
&gt; +=C2=A0 =C2=A0 =C2=A0disclosed at <a href=3D"https://emudhra.we-have-a=
-problem.com" rel=3D"noreferrer" target=3D"_blank">https://emudhra.we-have-=
a-problem.com</a>. As this is a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0certificate authority compromise rather than a so=
ftware flaw it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0doesn&#39;t have a CVE number, but this should be=
 treated like a CVE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fix.]<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://salsa.debian.org/debian=
/ca-certificates/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c" rel=3D"=
noreferrer" target=3D"_blank">https://salsa.debian.org/debian/ca-certificat=
es/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c</a>]<br>
&gt; +Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" ta=
rget=3D"_blank">paul@pbarker.dev</a>&gt;<br>
&gt; +---<br>
&gt; + mozilla/blacklist.txt | 5 +++++<br>
&gt; + 1 file changed, 5 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt<br>
&gt; +index d84ceb919906..ba3635f7af87 100644<br>
&gt; +--- a/mozilla/blacklist.txt<br>
&gt; ++++ b/mozilla/blacklist.txt<br>
&gt; +@@ -3,4 +3,9 @@<br>
&gt; + # Blacklist explicitly distrusted certificates to explicitly ignore =
them and prevent build errors<br>
&gt; + &quot;Explicitly Distrust DigiNotar Root CA&quot;<br>
&gt; +<br>
&gt; ++# Blacklist &quot;emSign ECC Root CA - G3&quot; (cf. #1151413)<br>
&gt; ++&quot;emSign ECC Root CA - G3&quot;<br>
&gt; ++# Blacklist &quot;Comodo AAA Services root&quot; (cf. #1151413)<br>
&gt; ++&quot;Comodo AAA Services root&quot;<br>
&gt; ++<br>
&gt; + # Expired CAs<br>
&gt; +--<br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/ca-certificates/<a href=3D"http://ca=
-certificates_20260816.bb" rel=3D"noreferrer" target=3D"_blank">ca-certific=
ates_20260816.bb</a> b/meta/recipes-support/ca-certificates/<a href=3D"http=
://ca-certificates_20260816.bb" rel=3D"noreferrer" target=3D"_blank">ca-cer=
tificates_20260816.bb</a><br>
&gt; index c9702d545a1c..be1ffeae4f54 100644<br>
&gt; --- a/meta/recipes-support/ca-certificates/<a href=3D"http://ca-certif=
icates_20260816.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_20=
260816.bb</a><br>
&gt; +++ b/meta/recipes-support/ca-certificates/<a href=3D"http://ca-certif=
icates_20260816.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_20=
260816.bb</a><br>
&gt; @@ -19,6 +19,7 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/c/ca-certifi=
cates/${BPN}_${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-update-ca-c=
ertificates-don-t-use-Debianisms-in-run-p.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-update-ca-c=
ertificates-use-relative-symlinks-from-ET.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-mozi=
lla-certdata2pem.py-print-a-warning-for-e.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Blacklist-emSign=
-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 S =3D &quot;${UNPACKDIR}/ca-certificates&quot;<br>
&gt;=C2=A0 inherit allarch<br>
&gt; <br>
&gt; ---<br>
&gt; base-commit: 94fd491210b5269f7242df59db1541379e25754f<br>
&gt; change-id: 20261021-ca-certs-dff9f0ace701<br>
&gt; <br>
&gt; Best regards,<br>
&gt; --<br>
&gt; Paul Barker<br>
<br>
There is a related CVE, CVE-2026-111943, for golang.<br></blockquote><div><=
br></div><div>Peter Marko already sent it yesterday<br><a href=3D"https://l=
ists.openembedded.org/g/openembedded-core/message/248308">https://lists.ope=
nembedded.org/g/openembedded-core/message/248308</a></div><div><br></div><d=
iv>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248375): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248375" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248375</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121863200/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121863200/10043485</a><br>
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

--0000000000001f93be065e55f853--

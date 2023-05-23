Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F84C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 19:43:02 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web10.11042.1684867695262469547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 11:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=M5MXP8bH;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: stefanb@linux.ibm.com)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NIjGHN028689;
	Tue, 23 May 2023 18:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Q+YCuWj9pgJ3DOMLewiuml86BEEvWqofQsAdVn0+M7E=;
 b=M5MXP8bHDFbvcN46nrcoghFklXcrDLUHs+sLUE2n5a+LZ2lxrGP+1p+T23p10FCPSl3n
 3LPTtELXJ/eN/stB85ll7qM5DJwQ/in9ealcKaqgZUSbbewCIzsh7IX8juIbLeqjahPE
 9VcubcesO61bbzsarOZ4aNK/v/OknLA6cD03cVg2i4pqu/P6iTomQxiz96LljYjeNfdJ
 A1+cRtfM/JmGCsA10O8GWe/DL4txv1U3hkgXpv2RCe4On4OKoEF+M3pBv0AFySp2FySy
 o1xpgX1Vh+qu+IiYs9ojoa6dQNectd/YEu0ILSV9eko34AoHMUSmJwDnu6UNxq/keJus xg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qs0u1b63u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 18:48:12 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34NHphR9016541;
	Tue, 23 May 2023 18:48:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3qppdsvfgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 18:48:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34NIm9Kp52363576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 18:48:09 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 834E058052;
	Tue, 23 May 2023 18:48:09 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5580A58056;
	Tue, 23 May 2023 18:48:09 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 May 2023 18:48:09 +0000 (GMT)
Message-ID: <d5169294-8477-5606-89ae-5e6b6964baef@linux.ibm.com>
Date: Tue, 23 May 2023 14:48:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] attr: Package attr, getfattr, and setfattr into attr-tools
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230520022553.3768155-1-stefanb@linux.ibm.com>
 <1E3EE49B-CC70-4A0A-8371-D7902BD18B51@arm.com>
From: "Stefan Berger" <stefanb@linux.ibm.com>
In-Reply-To: <1E3EE49B-CC70-4A0A-8371-D7902BD18B51@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5foEwoffrCnoiPxfOTdUCmi0I-0_cYSZ
X-Proofpoint-ORIG-GUID: 5foEwoffrCnoiPxfOTdUCmi0I-0_cYSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=681
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305230150
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-001b2d01.pphosted.com id 34NIjGHN028689
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 19:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181655



On 5/23/23 12:46, Ross Burton wrote:
> What=E2=80=99s the rationale for this?
>=20
> attr:
> 	/etc/xattr.conf
> 	/usr/bin/attr
> 	/usr/bin/getfattr
> 	/usr/bin/setfattr.attr
>=20
> libattr:
> 	/usr/lib/libattr.so.1
> 	/usr/lib/libattr.so.1.1.2501
>=20
> The library is already split out so what does this gain?

I must have missed that attr package already exists.So, I am dropping thi=
s patch.

    Stefan

>=20
> Also, the idiom for library packages which have binaries is to inherit =
lib_package.
>=20
> Ross


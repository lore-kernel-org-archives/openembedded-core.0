Return-Path: <jrey@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759D4C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:39:58 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.web08.4435.1645141197282560374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1
 header.b=QdmH5Tmc;
 spf=pass (domain: linux.ibm.com, ip: 148.163.156.1,
 mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HN9Orb016878
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : references : to : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5x73GKeml59KprnKEs1Rq5e29hpi6Im4FuCkFzawizI=;
 b=QdmH5Tmc32M4AaRUQRdXLw9FsWWN7/mt64kyhVh+ZqneqB2Fg7K1vKAudmvlGnzaO8Q1
 loAPenl+SrAeSjRvizxGPWHbPVBpc3JEyChCXNJXpGLSqBjIK75q1zYa7ai945KrqYnL
 x8KtYas32IpGAnFMi60rHfZhhslP0Wvpcl3dMYNRie9aZMyQu13DtW+kP43i2umtcYv0
 5wO3TlRK932xzdtXh5iTTgt2uoGeQV1cmK6jinjfx3tD30uQBSmUzxnEYRUXOUj0IZ/h
 TjlcgMlkxqLPm2RLRwV77nuj/l1RnTADUc4AsUgg45gsDVwZAkmSTJ78bJAPwTx3x9qF MQ==
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3e9uxad8g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 23:39:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HNMWNj025945
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:39:54 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
	by ppma03wdc.us.ibm.com with ESMTP id 3e64hcgmqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 23:39:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HNdsAQ36045238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:39:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2145CAC068
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 23:39:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E79F2AC05B
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 23:39:53 +0000 (GMT)
Received: from [9.160.49.180] (unknown [9.160.49.180])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 23:39:53 +0000 (GMT)
Message-ID: <67a1e2bb-bc0b-7540-5a76-fd6e1107955e@linux.ibm.com>
Date: Thu, 17 Feb 2022 17:39:52 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Typo in comment (was: tool to list source files)
References: 
 <303c5e534acf18e74f7a80bf43a9a07127d9fed9.camel@linuxfoundation.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: 
 <303c5e534acf18e74f7a80bf43a9a07127d9fed9.camel@linuxfoundation.org>
X-Forwarded-Message-Id: 
 <303c5e534acf18e74f7a80bf43a9a07127d9fed9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8hDS5hnITW4hauNkC3XsKyW7Fqbx10UB
X-Proofpoint-GUID: 8hDS5hnITW4hauNkC3XsKyW7Fqbx10UB
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_09,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170113
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 21HN9Orb016878
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:39:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161873


There seems to a typo in a comment in archiver.bbclass; ARCHIVE_MODE=20
should be ARCHIVER_MODE for "mirror" (letter R is missing).

https://github.com/openembedded/openembedded-core/blob/master/meta/classe=
s/archiver.bbclass#L8

Joseph

P.S. The archiver class is awesome.=C2=A0 Thank you!


-------- Forwarded Message --------
Subject: 	Re: [yocto-security] Unicode Bidi CVE-2021-42574 - tool to=20
list source files?
Date: 	Wed, 02 Feb 2022 09:39:06 +0000
From: 	Richard Purdie <richard.purdie@linuxfoundation.org>
To: 	Joseph Reynolds <jrey@linux.ibm.com>, Mark Hatle=20
<mark.hatle@kernel.crashing.org>, yocto-security@lists.yoctoproject.org,=20
Armin Kuster <akuster808@gmail.com>



On Tue, 2022-02-01 at 21:20 -0600, Joseph Reynolds wrote:
> On 1/23/22 5:34 PM, Joseph Reynolds wrote:
> > On 1/20/22 4:16 PM, Mark Hatle wrote:
> > > Any protection on the compiler side would come from the compiler=20
> of > > choice.=C2=A0 It is my understanding this has not yet been merge=
d=20
> into the > > included GCC version.
> > > > > But in the end, the issue is someone hiding code via unicode >=20
> > characters so...
> > > Mark and Richard,
> > > Thanks for your detailed review of Bitbake/OE/Yocto capabilities=20
> in > this area, and for your guidance.
> > I have no further questions at this time, and will let you know if=20
> we > come up with a scanner for this.
>
> Does OE/bitbakle have best practices, guidelines, or tooling for=20
> developers who perform a bitbake build and then want the get a list of=20
> all the (fetched, unpacked, and patched) source code which was used in=20
> that build?=C2=A0 Would it be something like iterating all packages=20
> included in the build, and looking through the "S" directory?
> Algorithm (sketch):
> >=C2=A0 for package in allPackagesInMyBuild:
> >=C2=A0 =C2=A0 cd to the `S` directory for the package
> >=C2=A0 =C2=A0 find . -type '*.cpp'

Have a look at archiver.bbclass. I think it has some documentation in=20
the manual
too.

Cheers,

Richard



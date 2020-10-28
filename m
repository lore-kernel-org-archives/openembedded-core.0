Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web10.188.1603924444906402443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 15:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=cEhsX6ny;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09SMV0jQ022912
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 18:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=2YttHMig+oLShv3zL7e7TrDM4uVq+2qR70SnkfpcrnA=;
 b=cEhsX6ny39JH20ZSDLl7hoRaFmaB9kgT4Fn3FCS1IluXz7B6aygL5U4+vRLxlUWGxzrf
 YkAwxdzgXmr6VGK4Oa+PlETFNHJNwVVOcENSJw5SEFulFWgnYI8lZgI4YsNFzSzN2H2Q
 kH1MIYPmA1Tvny5z6mWjdu++yq40mWxjAnWN9dgGLuqMknZOgC7rZzay4c8a+ll94KUA
 G6PEQ8fl/6g0hfGjmTkJ9sEtYqErG8BqT9n5BeX82fwlBtTdlrC/JKl0HN8JknhbMeNU
 ekKuIEAHV80eVlFbR18ugGuvltyPPAFJPFcyFBtbB37I0b5XmcjAPkPzyfHt6jNxhN5+ qQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com with ESMTP id 34f6ufq8sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 18:34:04 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SMS2sh025389
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 22:34:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01wdc.us.ibm.com with ESMTP id 34cbw93gv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 22:34:03 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09SMXutm30081746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 22:33:57 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B6A913604F
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 22:34:02 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2E4F136051
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 22:34:01 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.156.122])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 22:34:01 +0000 (GMT)
From: "Joseph Reynolds" <jrey@linux.ibm.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Experiences using livepatch?
Message-ID: <ae256b5e-012f-26ea-4f91-259a6309b0f1@linux.ibm.com>
Date: Wed, 28 Oct 2020 17:34:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-28_09:2020-10-28,2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010280134
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-001b2d01.pphosted.com id 09SMV0jQ022912
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I am re-asking a question from the OpenBMC community.

Does anyone have experience using Linux kernel livepatch with embedded=20
systems and is willing to share experiences or best practices?

Members of the OpenBMC community discussed a use case that involves many=20
thousands of systems that all need to be updated as quickly as=20
possible.=C2=A0 Specifically, downloading a new firmware image, performin=
g=20
firmware update, and rebooting the BMC would be too disruptive and take=20
too long.=C2=A0 The idea is to livepatch the systems as quickly as possib=
le.=C2=A0=20
The livepatch would be in-memory only and would be followed up with a=20
normal firmware code update.=C2=A0 Details are in the OpenBMC security=20
working group minutes, referenced below.

We are less interested in the mechanics of building kpatch into the=20
kernel or in building patches, and more interested in the overall=20
experience, including how well deploying and applying patches works in=20
practice.

- Joseph

_________

References:

OpenBMC email:=20
https://lists.ozlabs.org/pipermail/openbmc/2020-October/023723.html

Discussed in OpenBMC security working group dated 2020-10-28 agenda item =
5
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsD=
UWmAOI

BMC firmware code update:=20
https://github.com/openbmc/docs/blob/master/architecture/code-update/code=
-update.md

Ubuntu livepatch wiki: https://wiki.ubuntu.com/Kernel/Livepatch.kpatch

Bitbake recipe for livepatch in meta-oe/recipes-kernel/kpatch.

Questions about how to create and apply patches.=C2=A0 For example asked=20
here:=20
https://stackoverflow.com/questions/34175786/how-to-install-kernel-patch-=
locally-in-yocto

Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web08.9029.1612978060960001010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 09:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=GDl5sHQc;
 spf=pass (domain: linux.ibm.com, ip: 148.163.158.5, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 11AH51rR083700;
	Wed, 10 Feb 2021 12:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=6DnGBlJWL+ri3VQSMmPuqLlww8hxngB0DgTJls4yt5E=;
 b=GDl5sHQcUcvpLst2AugN+udkr4+0j9xs4wNOBxYSATH/WmFnw88vAVXjJypjhyajtThA
 eHigqDkDrm7vn/NN2MbC/AvtWLyYiRD1hRyFd65a9jKJKZyNlx34ORjR3L+XrUmH+TYu
 bEOq5TIrrcxmioFy2Mu7AImq61XdFdg4TukfzoRmAG7LTUbOrbIyDo5mxXbGBxl+fMG2
 swhnBAo0yJTxYzFKDIy3KX1KXO5Syk7Z8S2lpdhziVB8kSbkX36hZFw5jjOc7rZ54VVE
 F94C+hjRkeWkdHqfCv1N2LGHN506Q5U6rRimevlWlIgrOR0E+4a+2hRIJRdrYxjbljs3 kw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com with ESMTP id 36mk8esng4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Feb 2021 12:27:40 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11AHMHOo031850;
	Wed, 10 Feb 2021 17:27:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma02dal.us.ibm.com with ESMTP id 36hjra7ke9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Feb 2021 17:27:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11AHRcgE27394460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Feb 2021 17:27:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F7E66A04D;
	Wed, 10 Feb 2021 17:27:38 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAA1F6A047;
	Wed, 10 Feb 2021 17:27:37 +0000 (GMT)
Received: from demeter.local (unknown [9.85.132.132])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Feb 2021 17:27:37 +0000 (GMT)
To: OE-core <openembedded-core@lists.openembedded.org>,
        Kai Kang <kai.kang@windriver.com>
From: "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: Next steps for extrausers passwd-expire PR 63?
Message-ID: <837699ce-eb4d-3610-8069-8e93d87b7be4@linux.ibm.com>
Date: Wed, 10 Feb 2021 11:27:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-10_06:2021-02-10,2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=936 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100153
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-001b2d01.pphosted.com id 11AH51rR083700
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

What are the next steps for this?=20
https://github.com/openembedded/openembedded-core/pull/63

 >This enhances extrausers with a new passwd-expire command that causes=20
a local user's password to be expired as if the |passwd --expire|=20
command was run, so the password needs to be changed on initial login.
 > Example: EXTRA_USERS_PARAMS +=3D " useradd ... USER; passwd-expire USE=
R;"

This change works for me.=C2=A0 Does it need more testing?=C2=A0 Testing =
in=20
configurations without a shadow file?

- Joseph



Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.web08.17791.1612906034228098370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 13:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=pflIZGy9;
 spf=pass (domain: linux.ibm.com, ip: 148.163.156.1, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 119L4oUm075348
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Feb 2021 16:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Td7dmvpHPCI/QEmWLTVobRqJ2fDeInCeHyz+W46Eli4=;
 b=pflIZGy97LOy1r18RgBjijslGHP7W+bxY2IrRO5OR7CJNMTnOB2gwNIVoRNNBOWXKR7e
 yKHEEbpxrWoWgr+IVv4/enphksyme3i1nnr9DJSBb6Q974o9W1JYyNw9aObhbe3U7lzY
 u8+HLFNVh5IqpKyj3KCKgnvpknwFHTi+sENQjTOtdxP5jLKNrG2Bi9tM17WWDEXoGdsR
 bQU6A+0SfxhRzWG8cjFB35TIEWBHxMFolnm4AYWSy0CdBptxfFA7RmNTOS62WT41hoH1
 xjuV2hC6bCKoJK18/2Ca3V6VscjySFSLP7TrqjhKPMq8bg3sbVnMAXd2oiC9WOhBkJZX Fg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 36m1tcgtpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 16:27:13 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119LCMYp018585
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Feb 2021 21:27:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 36hjr9yv19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 21:27:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 119LRBRS38470110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Feb 2021 21:27:11 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F5ABC6059
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Feb 2021 21:27:11 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED859C6055
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Feb 2021 21:27:10 +0000 (GMT)
Received: from demeter.local (unknown [9.80.197.32])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Feb 2021 21:27:10 +0000 (GMT)
From: "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: Build libpwquality without distutils3
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <f8302620-913a-2e91-b118-7881437aaeb0@linux.ibm.com>
Date: Tue, 9 Feb 2021 15:27:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-09_07:2021-02-09,2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=3
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=3 clxscore=1011 priorityscore=1501 phishscore=0 mlxlogscore=608
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090107
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-001b2d01.pphosted.com id 119L4oUm075348
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Dear openembedded-core members,

How can I avoid bringing Python into my image via libpwquality?=C2=A0 I n=
eed=20
to keep my image size small.=C2=A0 My bbappend uses EXTRA_OECONF +=3D=20
"--enable-python-bindings=3Dno" to take advantage of the source project's=
=20
configuration option [1], but because libpwquality_1.4.4.bb [2] imports=20
distutil3-base, my image gets Python.=C2=A0 I built a working proof of=20
concept that libpwquality does not need Python here: [3].

I tried enhancing libpwquality_1.4.4.bb with PACKAGECONFIG=20
"python-bindings" (so my bbappend can use=20
PACKAGECONFIG_remove=3D"python-bindings") but can't find a way to get the=
=20
final value of PACKAGECONFIG to conditionally `inherit=20
distutils3-base`.=C2=A0 So I am asking for help.

How can I avoid bringing in Python via libpwquality?

I am also curious if anyone else is interested in changing the default=20
install location for libpwquality.so to /lib/security/ (where Yocto/Poky=20
defaults to /usr/lib/security).

- Joseph

[1]:=20
https://github.com/libpwquality/libpwquality/blob/master/configure.ac#L11=
9
[2]:=20
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-exten=
ded/libpwquality/libpwquality_1.4.4.bb
[3]:=20
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40102/4..5/meta-op=
enembedded/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb#21


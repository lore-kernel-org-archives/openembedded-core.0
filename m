Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.web08.752.1603840798748997351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 16:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ibm.com header.s=pp1 header.b=GHixTIVJ;
 spf=pass (domain: linux.ibm.com, ip: 148.163.156.1, mailfrom: jrey@linux.ibm.com)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09RN3ZCU128182;
	Tue, 27 Oct 2020 19:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=py8S7+GkS3sRO6XqVTpit9pDkna18RBpOUkpBRsmBGM=;
 b=GHixTIVJ6gd31gPC+EeGYm7ORllRqpdZLmliL2PtrO5v/epZeV6z9sald/RPG/rZFohj
 DqWHMJAZSHc3TL7Yg1eX9ZFq2Y+P0CMgKigC9Ui/r+3GkVX+ybnWBgDyuE4adQkd8S6T
 ldcI83+13yXNekhmwzhtQ5QvBaJ/PjT90t7OWSQU4M4pNDzo5yKC6ytNMRedaWGy0jDY
 YeKqacT6N3jQ7MDgMrYuryyZ7cBmGIMCpVUN3+aaCuTBQclIRgtn9+OAMJ5z2UJR+aNo
 77P1xZyfN/0EAD0q8OceHkDGcUaJwcxvHMDeeUWiFOZKQ95N66oU+MFG0Bn8azQu32E5 uQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 34e4jwssgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2020 19:19:57 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09RNCJh3028102;
	Tue, 27 Oct 2020 23:19:56 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma04dal.us.ibm.com with ESMTP id 34cbw9ajmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2020 23:19:56 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09RNJlaO38404494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 23:19:47 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8211D136061;
	Tue, 27 Oct 2020 23:19:55 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23356136053;
	Tue, 27 Oct 2020 23:19:54 +0000 (GMT)
Received: from [9.85.157.1] (unknown [9.85.157.1])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Tue, 27 Oct 2020 23:19:54 +0000 (GMT)
Subject: Re: [OE-core] [PATCH] add new extrausers command passwd-expire - moved to PR 63
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <978bccd7-a2f4-9aa0-9c77-9c10c81e068f@linux.ibm.com>
 <f154c498c88dfc436d4b9547b889e3aa8436fc41.camel@linuxfoundation.org>
From: "Joseph Reynolds" <jrey@linux.ibm.com>
Message-ID: <4fb6f623-c811-0593-dc89-877f128439a3@linux.ibm.com>
Date: Tue, 27 Oct 2020 18:19:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <f154c498c88dfc436d4b9547b889e3aa8436fc41.camel@linuxfoundation.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-27_15:2020-10-26,2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270129
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-001b2d01.pphosted.com id 09RN3ZCU128182
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/27/20 2:41 PM, Richard Purdie wrote:
> Hi Joseph,
>
> On Mon, 2020-10-26 at 15:41 -0500, Joseph Reynolds wrote:
>> This enhances extrausers with a new passwd-expire command that causes
>> a local user's password to be expired as if the `passwd --expire`
>> command was run, so the password needs to be changed on initial
>> login.
>>
>> Example: EXTRA_USERS_PARAMS +=3D " useradd ... sofia; passwd-expire
>> sofia;"
>>
>> Tested: on useradd accounts
>> When configured with Linux-PAM, console login prompts for and can
>> successfully change the password.  OpenSSH server works.  Dropbear
>> SSH server notes the password must be changed but does not offer a
>> password change dialog and rejects the login request.
>>
>> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
>> ---
>>    meta/classes/extrausers.bbclass   |  3 +++
>>    meta/classes/useradd_base.bbclass | 18 ++++++++++++++++++
>>    2 files changed, 21 insertions(+)
>>
>> diff --git a/meta/classes/extrausers.bbclass
>> b/meta/classes/extrausers.bbclass
>> index 32569e9..90811bf 100644
>> --- a/meta/classes/extrausers.bbclass
>> +++ b/meta/classes/extrausers.bbclass
>> @@ -46,6 +46,9 @@ set_user_group () {
>>                usermod)
>>                    perform_usermod "${IMAGE_ROOTFS}" "-R
>> ${IMAGE_ROOTFS}
>> $opts"
> Unfortunately this patch is coming through line wrapped which makes it
> hard to apply. Can you resend it without the line wrapping, or point at
> a git tree with the patch in please?

Thanks.=C2=A0 The PR work flow is much easier for me.=C2=A0 I didn't real=
ize OE=20
was on github.com.
I hereby withdraw & abandon my email patch request and replace it with:
https://github.com/openembedded/openembedded-core/pull/63

- Joseph

>
> I do remember the patch from the last time around and I think this was
> the issue last time as well, I couldn't get it to apply. It does seem
> like a reasonable addition and it would be good to work with openBMC on
> common issues like this!
>
> Cheers,
>
> Richard
>


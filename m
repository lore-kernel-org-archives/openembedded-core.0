Return-Path: <jrey@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id C7B4B7CED3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 18:52:01 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x61Ipw8q107095; Mon, 1 Jul 2019 14:52:01 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
	[169.62.189.11])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2tfnsgnafe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 01 Jul 2019 14:51:59 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x61IiOnw016403; Mon, 1 Jul 2019 18:48:14 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
	[9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 2tdym6rsm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 01 Jul 2019 18:48:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
	[9.57.199.110])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x61ImD2B48300454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 1 Jul 2019 18:48:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10804AE067;
	Mon,  1 Jul 2019 18:48:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9880BAE05C;
	Mon,  1 Jul 2019 18:48:12 +0000 (GMT)
Received: from demeter.local (unknown [9.80.206.251])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon,  1 Jul 2019 18:48:12 +0000 (GMT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, joseph.reynolds1@ibm.com
References: <5add2d28-a846-e555-b2a3-bae8835125b0@linux.ibm.com>
	<0221a7bd0f40bddd3fdfd624f75cabce3eb9fda1.camel@linuxfoundation.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <376bb28c-8947-c9c2-ee81-b67fcc275359@linux.ibm.com>
Date: Mon, 1 Jul 2019 13:48:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0221a7bd0f40bddd3fdfd624f75cabce3eb9fda1.camel@linuxfoundation.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-01_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907010221
Subject: Re: [PATCH v2] dropbear: new feature: disable-weak-ciphers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jul 2019 18:52:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/30/19 4:58 PM, Richard Purdie wrote:
> On Fri, 2019-06-28 at 18:03 -0500, Joseph Reynolds wrote:
>>   From 587a9e5c637ad3e70b8e35a3ca66013693ce7ac7 Mon Sep 17 00:00:00
>> 2001
>> From: Joseph Reynolds <joseph.reynolds1@ibm.com>
>> Date: Wed, 19 Jun 2019 20:16:40 -0500
>> Subject: [PATCH v2] dropbear: new feature: disable-weak-ciphers
>>
>> Enhances dropbear with a new feature "disable-weak-ciphers", on by
>> default.
>> This feature disables all CBC, SHA1, and diffie-hellman group1
>> ciphers in
>> the dropbear ssh server and client.
>>
>> Disable this feature if you need to connect to the ssh server from
>> older
>> clients.  Additional customization can be done with local_options.h
>> as
>> usual.
>>
>> Tested: On github.com/openbmc/openbmc using dropbear_2019.78.
>>
>> Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
>> ---
>>    meta/recipes-core/dropbear/dropbear.inc            |  6 ++-
>>    .../0007-dropbear-disable-weak-ciphers.patch       | 57
>> ++++++++++++++++++++++
>>    2 files changed, 61 insertions(+), 2 deletions(-)
>>    create mode 100644
>> meta/recipes-core/dropbear/dropbear/0007-dropbear-disable-weak-
>> ciphers.patch
> I merged v1 of this patch previously. What was different in this
> version?

The v2 patch had the same content with fixed up commit messages. You can 
ignore it.
Thanks for handling this.
>
> Also, the patch was still line wrapped so very hard to apply (had to be
> manually fixed).
>
> Cheers,
>
> Richard
>



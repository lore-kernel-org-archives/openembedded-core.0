Return-Path: <jrey@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8257D5B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 21:08:23 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6FL7BQk044766; Mon, 15 Jul 2019 17:08:23 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
	[169.53.41.122])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2trwqrh4np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 17:08:23 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x6FL5ESB001114; Mon, 15 Jul 2019 21:08:22 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
	[9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2trtmqtd0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 15 Jul 2019 21:08:22 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
	[9.57.199.106])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x6FL8LWK5898932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 15 Jul 2019 21:08:21 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EFDC2805C;
	Mon, 15 Jul 2019 21:08:21 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 489D928059;
	Mon, 15 Jul 2019 21:08:21 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Jul 2019 21:08:21 +0000 (GMT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190715203857.65119-1-jrey@linux.ibm.com>
	<20190715205842.GA14808@localhost>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <f6e26cd5-887e-4c1f-18c5-3c257a888932@linux.ibm.com>
Date: Mon, 15 Jul 2019 16:08:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715205842.GA14808@localhost>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=973 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907150242
Cc: Joseph Reynolds <joseph.reynolds1@ibm.com>, yocto-security@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Mon, 15 Jul 2019 21:08:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 7/15/19 3:58 PM, Adrian Bunk wrote:
> On Mon, Jul 15, 2019 at 03:38:57PM -0500, Joseph Reynolds wrote:
>> Enhances dropbear with a new feature "disable-weak-ciphers", on by default.
>> This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers in
>> the dropbear ssh server and client.
>>
>> Disable this feature if you need to connect to the ssh server from older
>> clients.  Additional customization can be done with local_options.h as usual.
>> ...
> Changing the default behaviour in a stable series does not sound
> appropriate to me.

Although this patch is for security, it is a config change and not a 
fix.  I understand if you don't want to add it to a release branch, and 
I am am okay with that.  I just want to know one way or the other.  If 
this is the answer, we'll put the patch into our downstream project 
(github.com/openbmc/openbmc branch=warrior) ... waiting for more 
opinions ....

Thanks!
- Joseph
>
> cu
> Adrian
>



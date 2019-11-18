Return-Path: <jrey@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8AA7F8A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:07:13 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAIFvTZM023826; Mon, 18 Nov 2019 11:07:14 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
	[169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2way8mdptx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Nov 2019 11:07:14 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	xAIG6lCU008896; Mon, 18 Nov 2019 16:07:12 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
	[9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2wa8r63psr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Nov 2019 16:07:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	xAIG7Buj45285646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Nov 2019 16:07:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94B66AC05E;
	Mon, 18 Nov 2019 16:07:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F667AC05B;
	Mon, 18 Nov 2019 16:07:11 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon, 18 Nov 2019 16:07:11 +0000 (GMT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
	<bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
	<afda9a22-8075-93c2-64db-91061bee6a11@intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <9694aec4-8eb1-ab59-9831-474a58a88cfa@linux.ibm.com>
Date: Mon, 18 Nov 2019 10:07:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <afda9a22-8075-93c2-64db-91061bee6a11@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-18_04:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
	adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
	mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911180146
Subject: Re: How to add build date?
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
X-List-Received-Date: Mon, 18 Nov 2019 16:07:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/18/19 3:53 AM, Ross Burton wrote:
> On 16/11/2019 21:56, Joseph Reynolds wrote:
>>
>> Is there a best practice for folks who want to put the build date 
>> into their generated os-release file?  I've seen this question come 
>> up at least 3 times in my brief involvement with OE.  I could perhaps 
>> add comment to the OpenBMC os-release.bbappend file to provide the 
>> proper guidance.  I would like to hear your ideas.
>
> There's an image-buildinfo class that can inject build-specific 
> information of your chosing into the image.

Thank you, I was not aware of that.  That makes perfect sense.  I've 
added that to my answer in the OpenBMC email list, and hope to have a 
answer I can just refer to, for the next time someone asks this question.

Link to OpenBMC email thread: 
https://lists.ozlabs.org/pipermail/openbmc/2019-November/019479.html

- Joseph

>
> Ross
>



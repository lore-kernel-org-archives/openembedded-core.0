Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web08.2164.1614023846968153971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 11:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=HvSpcd/1;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.158.5, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11MJlBfn028359;
	Mon, 22 Feb 2021 14:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WE+7uYcfYG52mHy0puYuhUCp8PkwsC4Yts+e7WDQpFI=;
 b=HvSpcd/1aJdo+7ynaaVP1dwwQz6ZEQHJCW+hM8MXCEfK5ZznXd97sEjKEQ+T5zWdlXbL
 1K4/x+rJzJvq+MLeKXOChS0Gb7GWf+7xPmXBvK2O2aPZ6OIY3DnWasebxu6loJlsh+Ir
 qG+8DTPGDmcwFT4A9wyBGCYh4TRaDCGvrnRY/CJTAn8xva3MLO+FdR+uY/RhwVPPc6d5
 9ctY7+6kYKwH1Clv+RApohHdk1X0jW5wHircIyAhIj8HVGPrChS9ixaZCsGl7rulwLSK
 ro3NmWlfIrwZJ8LwIiccexRIAkrzP3gxSG/LlqEX8KbR/ebYJSEzBR46gkaPX0Gtra1w 9Q== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com with ESMTP id 36vk2wgh3f-20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Feb 2021 14:57:25 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MIfk5e025953;
	Mon, 22 Feb 2021 18:42:14 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03dal.us.ibm.com with ESMTP id 36v5y8nb4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Feb 2021 18:42:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11MIgERl34013472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Feb 2021 18:42:14 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CBD3AE05C;
	Mon, 22 Feb 2021 18:42:14 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86106AE060;
	Mon, 22 Feb 2021 18:42:13 +0000 (GMT)
Received: from [9.85.139.253] (unknown [9.85.139.253])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 22 Feb 2021 18:42:13 +0000 (GMT)
Subject: Re: [OE-core] [PATCH] kernel-fitimage: Don't use unit addresses on FIT
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20210221192210.5070-1-klaus@linux.vnet.ibm.com>
 <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
Message-ID: <0c16761e-61bc-a90c-a137-fb127d04450b@linux.vnet.ibm.com>
Date: Mon, 22 Feb 2021 15:42:12 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-22_07:2021-02-22,2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220173
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


> 
> This caused some tests to fail:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1855/steps/15/logs/stdio
> 
> Do we need to update the tests as well?

Thanks, I missed that completely. Adjusted the testcases for V2 and, even if locally I'm
seeing a strange FAIL on the sign test with UBOOT_MKIMAGE_SIGN_ARGS not showing-up, I think
it is unrelated and perhaps something of my environment (tested on another environment
that succeeded).

Sent a V2.
  
  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 37113 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 May 2019 08:43:12 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
	by mail.openembedded.org (Postfix) with ESMTP id 9F16E6D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 08:43:12 +0000 (UTC)
Received: from DM6PR02MB6025.namprd02.prod.outlook.com (10.141.164.11) by
	BY5PR02MB6018.namprd02.prod.outlook.com (10.255.245.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.12; Tue, 7 May 2019 22:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jPKl6qrpWgLRT1/CPb168GOUyUcOoB1ronTl715VhZI=;
	b=xB+gZbKjxCD7Fyy18L8er8PFSN5iglmxf9ncKpLRV5lFUi2VC8OJ6nVrC8EJD9kyCFfHhnyP96UqOVZV7CfPJ+A1f2SY6zKd79zNWDgz/zgNaZwwvUkEURVL57HSEOivcBrKNPt+QxB4iSLTwEwaYFSekkucxxM/z6LIVhD7S8c=
Received: from SN4PR0201CA0036.namprd02.prod.outlook.com
	(2603:10b6:803:2e::22) by DM6PR02MB6025.namprd02.prod.outlook.com
	(2603:10b6:5:1f5::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10;
	Tue, 7 May 2019 17:32:39 +0000
Received: from BL2NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0036.outlook.office365.com
	(2603:10b6:803:2e::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via
	Frontend Transport; Tue, 7 May 2019 17:32:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT053.mail.protection.outlook.com (10.152.76.225) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
	via Frontend Transport; Tue, 7 May 2019 17:32:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36975
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hO3xF-0007d2-UG; Tue, 07 May 2019 10:32:37 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hO3xA-0007w9-QF; Tue, 07 May 2019 10:32:32 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hO3xA-0007w6-Dj; Tue, 07 May 2019 10:32:32 -0700
To: Alex Kiernan <alex.kiernan@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <20190503164734.130778-1-alex.kiernan@gmail.com>
	<CAJTo0La=VGkcFe+EZ49ki9Bb2-z7kVoOGDN7i8wcVcc6iVitMg@mail.gmail.com>
	<CAO5Uq5QRMd8w+apv6vYiOKAdvDdkFSB2oz1bWZfyX8G=hs2Vqw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <bfef53ce-94ad-a99c-120c-ae89320d6fa1@xilinx.com>
Date: Tue, 7 May 2019 10:32:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5QRMd8w+apv6vYiOKAdvDdkFSB2oz1bWZfyX8G=hs2Vqw@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(189003)(199004)(356004)(4326008)(336012)(9786002)(2616005)(64126003)(8676002)(81166006)(81156014)(476003)(486006)(186003)(316002)(26005)(53546011)(106002)(23676004)(2486003)(58126008)(67846002)(5660300002)(8936002)(11346002)(110136005)(47776003)(65956001)(65806001)(229853002)(230700001)(2906002)(6246003)(426003)(76176011)(478600001)(77096007)(446003)(50466002)(70206006)(31696002)(126002)(305945005)(31686004)(65826007)(70586007)(36756003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6025; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7917aee-2b0f-4ac5-8c82-08d6d3120044
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:DM6PR02MB6025; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB6025:|DM6PR02MB6025:|BY5PR02MB6018:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB60253A4C716437AF6955ED35AC310@DM6PR02MB6025.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: egknucr76mqJ4AldGvXJ1hsq8bpFJjafHMUY+zC8wMeOfIU9fufxT7hS4SFksa4ZdjSq/oF3BC8YFcaI6VJjv94gdAoWQ+tcNiG2ycxxmXVBMdQmWfC3Su0YBsGQPo73fKnZ+qWfJo0rG1Gxlba91PBpQdNlvHVnKAbyE38t/CGnRjofDNC3hVke125NlkgeJPlvzvISLfRMY1JV99kf09vcUOiJMXrKvvyJHKtO8kYzn8oq6EjRBc3yS40g1kuXRCDiM8zQF91jgmqdQchX8ryiajEt5xfLJ61hRpvHgZsCoQy4MSAJWHW5JzL4u1OlY/Z9bjKQQuVdQ3lOq/kBS/4AJQsIwOD47M/iPxFBhWPR6p/3MliXvDfmSL1rcc0ucWZ4cWZVU6iCsTJFtwBQfoG+y9bAKjJEY/TBXvZ7fwk=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 17:32:38.5136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7917aee-2b0f-4ac5-8c82-08d6d3120044
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6025
X-OriginatorOrg: xilinx.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: Add RDEPENDS on python3-misc
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
X-List-Received-Date: Wed, 08 May 2019 08:43:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/3/19 11:32 AM, Alex Kiernan wrote:
> On Fri, May 3, 2019 at 6:34 PM Burton, Ross <ross.burton@intel.com> wrote:
>> On Fri, 3 May 2019 at 17:48, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>> The newer python3 recipe no longer includes python3-misc in target by
>>> default, leading to failures:

This statement isn't true, the python3 package does include 
python3-misc, but the bmap-tools recipe

does not RDEPEND on python3, it RDEPENDS on python3-core (which is not 
the same).

>>>
>>>    Traceback (most recent call last):
>>>      File "/usr/bin/bmaptool", line 6, in <module>
>>>        from pkg_resources import load_entry_point
>>>      File "/usr/lib/python3.7/site-packages/pkg_resources/__init__.py", line 42, in <module>
>>>        import ntpath
>>>    ModuleNotFoundError: No module named 'ntpath'
>> Looks like ntpath should be in a different package if pkg_resources
>> won't run without it.
>>
> Sorry, should've looked more closely... I'll take a look at it.
Yeah, it might be worth checking if ntpath either belongs on its own 
package or in another one.
>
>>>   RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
>>> +RDEPENDS_${PN}_append_class-target = " python3-misc"
>> Why class-target only?
>>
> It doesn't exist for native (which was a surprise).

I think you're looking at this incorrectly, the python3-misc package 
does not exists for python3-native (because python3-native isn't split),

but, here, the class override you are using is stating that only 
bmap-tools(target) should RDEPEND on python3-misc, which I don't think

it should be the case, its likely that bmap-tools-native should RDEPEND 
on python3-misc-native, which although it doesn't actually exists

python3-native should be able to RPROVIDE.


Cheers,

Alejandro


>


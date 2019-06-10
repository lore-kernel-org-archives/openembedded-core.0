Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 46707 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Jun 2019 10:22:43 UTC
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690072.outbound.protection.outlook.com [40.107.69.72])
	by mail.openembedded.org (Postfix) with ESMTP id 159307D718
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3ID/CELA9K9dxnAn99Vv6eAaeZBbBfZEefqcPM2iG4o=;
	b=MHVfNVC+McZTuqA+oiD6vTKjtK5gZygsC52YTL8B7yXvjHgtLeLrVe8xJ6bgsdBuuZI33v6uNOkeSLjE5ROnpLL1qwIyyUzt9Au7sReMwtdem2Rmjqnke9sQvpKqxJKjBNYRnxEYL2yPM+ddhZuqg0CmD2YFgfR9Au7uHb2UiCQ=
Received: from SN4PR0201CA0044.namprd02.prod.outlook.com
	(2603:10b6:803:2e::30) by CY4PR02MB2678.namprd02.prod.outlook.com
	(2603:10b6:903:124::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17;
	Mon, 10 Jun 2019 17:53:29 +0000
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by SN4PR0201CA0044.outlook.office365.com
	(2603:10b6:803:2e::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via
	Frontend Transport; Mon, 10 Jun 2019 17:53:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
	via Frontend Transport; Mon, 10 Jun 2019 17:53:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1haOU4-0005Kh-F3; Mon, 10 Jun 2019 10:53:28 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1haOTz-0001CU-Co; Mon, 10 Jun 2019 10:53:23 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x5AHrMnP001092; Mon, 10 Jun 2019 10:53:22 -0700
Received: from [10.31.117.78] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1haOTy-0001CM-Ji; Mon, 10 Jun 2019 10:53:22 -0700
To: Joshua Watt <jpewhacker@gmail.com>, richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
	<ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
	<c0cb96272d5dd5dddfe61dfbee2f428156b124d9.camel@linuxfoundation.org>
	<8c1918e6-9b46-393a-5a11-a4ee64290091@gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <b950d0d5-6ef3-37fc-29de-15bd0fed7c7a@xilinx.com>
Date: Mon, 10 Jun 2019 10:53:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8c1918e6-9b46-393a-5a11-a4ee64290091@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(199004)(189003)(53546011)(426003)(336012)(5660300002)(4744005)(446003)(316002)(9786002)(356004)(478600001)(65826007)(67846002)(2906002)(76176011)(230700001)(11346002)(52146003)(23676004)(2486003)(486006)(58126008)(106002)(31696002)(476003)(2616005)(126002)(77096007)(70206006)(26005)(63266004)(31686004)(6246003)(186003)(70586007)(229853002)(64126003)(50466002)(8936002)(36756003)(47776003)(65806001)(65956001)(305945005)(81156014)(8676002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2678; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a31f2c19-67c3-4e6e-03c9-08d6edcc8b91
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:CY4PR02MB2678; 
X-MS-TrafficTypeDiagnostic: CY4PR02MB2678:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB26783B1556C286FABC72629DAC130@CY4PR02MB2678.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0064B3273C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VJ7iLQAq0BvDbWV1rwEu5H9vU741cvsM6Whgx8qOrO9Ix84oN/m2s6z+SFIIqy+VLUHUDo+dV1EYXYNVyOXj4dbRr4P+EEchkgPTzvWsQo6red48OwTUQ4YPEXNp53Mh7smy29ZuVeo2pEkoNAtW28tiKcjga1dqmnE5CmJgFbGuw9Sw8KZsOqWSu2GzNIeoWJ5TDIO/gzmEmFQKobJ8HEK2S/n5BePUTUb+KTPgvHX44GwKbS2T5JHQSytCw7qJjmbcujKo/Imy+yqwXT3bsrg2Jv4BLed5SykPQ6NRfRg6MGEswxwbJmZyUq5nzDfcx6g+x+Bzuua9E4M0XEvSXca9MLSfuHXw6A4wurqjnFBL+c9EmKuWNLO8IuK9l3d9pgWlDpVWWaZed9sDPDkwJzyq7ZNnEPvMwXevX/ed/A8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2019 17:53:28.8640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a31f2c19-67c3-4e6e-03c9-08d6edcc8b91
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2678
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Tue, 11 Jun 2019 10:22:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/7/2019 9:30 AM, Joshua Watt wrote:
> On 6/7/19 11:23 AM, richard.purdie@linuxfoundation.org wrote:
>> On Fri, 2019-06-07 at 10:51 -0500, Joshua Watt wrote:
>>> Is there a reason for this change other than aesthetics?
>> I have had a lot of complaints and in real world use I can understand
>> why...
>>
>>> FWIW, we maintain some recipes across several versions of poky, so
>>> this rename is going to cause me some headaches
>> The mcdepends code is tollerant of either naming. We could teach cooker
>> to translate any commandline references so both worked there. Would
>> that be good enough to work for you?
>
> Ya, that would be sufficient. I'll work up a patch for that.

I believe that I originally named it 'multiconfig' to try to make it 
more explicit for users,

but if people think its more intuitive to use 'mc' I'm not against it, 
using either also

works for me.


Cheers,

Alejandro


>
>>
>> Cheers,
>>
>> Richard
>>


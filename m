Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 74623 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 May 2019 03:40:31 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
	by mail.openembedded.org (Postfix) with ESMTP id 96FAA7E075
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 03:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rYIsAFeSpLqgFxvToyMAGFT8U81vVK6ov6UQCGk6T0k=;
	b=1qEjSwxUbOlCIL8JaVmdsbnABUooScxQvkik9SVJMfJWRhiqMOGTmVSx3XBIJis0IibuBFw9UVfERWUdT7gk1/kDLhomyVdQ9QguW9Iho21aDQlN0/bpVHtFvpkHP7+ZBlN448H3773sLP3BPFjfTlU90V0VZauDhm4krRZEV6Q=
Received: from CY4PR02CA0035.namprd02.prod.outlook.com (2603:10b6:903:117::21)
	by DM5PR02MB2683.namprd02.prod.outlook.com (2603:10b6:3:10e::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.18;
	Mon, 20 May 2019 06:56:48 +0000
Received: from SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by CY4PR02CA0035.outlook.office365.com
	(2603:10b6:903:117::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16 via
	Frontend Transport; Mon, 20 May 2019 06:56:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT013.mail.protection.outlook.com (10.152.72.98) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1900.16
	via Frontend Transport; Mon, 20 May 2019 06:56:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51915
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hScE3-000391-Lx; Sun, 19 May 2019 23:56:47 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hScDy-0005xl-IO; Sun, 19 May 2019 23:56:42 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x4K6uaAr024891; Sun, 19 May 2019 23:56:36 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hScDs-0005xI-Ff; Sun, 19 May 2019 23:56:36 -0700
To: Khem Raj <raj.khem@gmail.com>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
	<d77e4aca-3f48-5acf-058e-8dc3ffba5cf2@gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <fc518454-2565-ec27-8f0b-8c1c5832c2df@xilinx.com>
Date: Sun, 19 May 2019 23:56:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d77e4aca-3f48-5acf-058e-8dc3ffba5cf2@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(39850400004)(136003)(2980300002)(199004)(189003)(106002)(305945005)(446003)(2486003)(52146003)(50466002)(70206006)(70586007)(11346002)(76176011)(229853002)(58126008)(336012)(110136005)(476003)(65826007)(126002)(316002)(478600001)(9786002)(63266004)(486006)(356004)(5660300002)(36756003)(81166006)(81156014)(36386004)(67846002)(8676002)(8936002)(64126003)(426003)(53546011)(47776003)(65956001)(65806001)(77096007)(2870700001)(31696002)(6246003)(2906002)(31686004)(2616005)(26005)(186003)(23676004)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2683; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4d5112-5e85-4662-9005-08d6dcf05423
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:DM5PR02MB2683; 
X-MS-TrafficTypeDiagnostic: DM5PR02MB2683:|DM5PR02MB2683:|DM5PR02MB2683:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB2683836468AFD5192DEE5F4BAC060@DM5PR02MB2683.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 004395A01C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uiVsobwHliBGT/pdvxSCTCuyf4eMmT3lOJaE/u+gjCXjx9b9UPj2kB2ZkTuhVbUn00wrlU38VklqazA4NlQKXPd1XtYusWppvcNUkogKC7wITHOWJ17p61gIAGsl5LsGTlB+Paa5s6D2xvXWIPko9y1ov51YG7PyGL9F4IeblhIaMZonXzr04IOksEdK0w168+CMqDdnH4sjVZOH9p9iL+IEdUom+7zHE3idF7ip980jdvfAmjSmXF16SP/Y0MWoD05EGM9rIWQTkLngWBkkdY3IbOinjSDlxUfDciopwbaHbFDkhR1GghGNDUhGg5qh5e7z2i0SA7hSGzkywQymfiZrpxWohNWtYcDW8/h/7WNCekfBAiqmzLHQjbywb8CL7JYNRyoyZ4pEklrEFbnE8oniAofTvwPgsiu8hHf/piM=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2019 06:56:48.0251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4d5112-5e85-4662-9005-08d6dcf05423
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2683
X-OriginatorOrg: xilinx.com
Subject: Re: [PATCH] python-numpy: Avoid installing copy of f2py script
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
X-List-Received-Date: Tue, 21 May 2019 03:40:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hey Khem,


On 5/18/19 10:09 PM, Khem Raj wrote:
>
>
> On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wrote:
>> Both python-numpy and python3-numpy try to install the file:
>>
>> ${D}/${bindir}/f2py
>>
>> which causes an error during do_rootfs since the package manager 
>> complains about that.
>>
>> The numpy packages create basically copies of f2py script with the 
>> following names:
>> f2py (on both)
>> f2py2 (on python 2)
>> f2py2.7 (on python 2)
>> f2py3 (on python 3)
>> f2py3.7 (on python 3)
>>
>> Remove the copy of f2py from python-numpy in favor of using the one 
>> from python3
>> to avoid installation issues at do_rootfs().
>>
>
> what if one does not install py3 ?


If you only install py2, you could still execute f2py2 or f2py2.7, I'm 
simply

favoring the py3 installation by default but it should be mostly harmless

since there's still two other copies of the script with different names.

Cheers,

Alejandro

>
>> Signed-off-by: Alejandro Enedino Hernandez Samaniego 
>> <alejandr@xilinx.com>
>> ---
>>   meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git 
>> a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb 
>> b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
>> index 5013789..a1133da 100644
>> --- a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
>> +++ b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
>> @@ -4,3 +4,7 @@ require python-numpy.inc
>>   RDEPENDS_${PN}_class-target_append = " \
>>       ${PYTHON_PN}-subprocess \
>>   "
>> +
>> +do_install_append(){
>> +        rm ${D}/${bindir}/f2py
>> +}
>>


Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 14330 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Jul 2018 03:38:23 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0051.outbound.protection.outlook.com [104.47.33.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0C2607DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NZJuo4xmYV1ZRCA8FuN3VsAdcTULrZGFURY7bY2Ngzg=;
	b=WT327lzB521EbCsVCBrbrTSqcrSg7J/+Vx2Bdg5AhkgwRhYoBXx0Wy+uJFnpPOynUeI6O0/delz1Uoo90DHdJVB/4MEpOmTWPzKOhF3aFG3svkLmr4mVwWhGHM4VYQGbbw/TvALsGMmz7FPhIQ/28/KDNoPW9O6EkiGInoYL7qY=
Received: from MWHPR02CA0015.namprd02.prod.outlook.com (2603:10b6:300:4b::25)
	by SN6PR02MB4462.namprd02.prod.outlook.com (2603:10b6:805:a8::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.17;
	Mon, 30 Jul 2018 22:06:08 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by MWHPR02CA0015.outlook.office365.com
	(2603:10b6:300:4b::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.995.16 via
	Frontend Transport; Mon, 30 Jul 2018 22:06:07 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Mon, 30 Jul 2018 22:06:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49943
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fkGIn-0001dv-E8; Mon, 30 Jul 2018 15:06:05 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fkGIi-0005PA-Au; Mon, 30 Jul 2018 15:06:00 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w6UM5xCk025670; Mon, 30 Jul 2018 15:05:59 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fkGIh-0005OE-1J; Mon, 30 Jul 2018 15:05:59 -0700
To: Khem Raj <raj.khem@gmail.com>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
	<72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <2d0aedb8-fdb0-ad21-bdcc-e82f352570c3@xilinx.com>
Date: Mon, 30 Jul 2018 15:05:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(76176011)(478600001)(14444005)(2906002)(336012)(53546011)(65806001)(65826007)(65956001)(229853002)(106466001)(5660300001)(64126003)(36386004)(106002)(2486003)(23676004)(36756003)(63266004)(31686004)(47776003)(50466002)(67846002)(11346002)(39060400002)(305945005)(6346003)(77096007)(9786002)(316002)(26005)(31696002)(6246003)(110136005)(8676002)(81166006)(58126008)(426003)(81156014)(8936002)(230700001)(186003)(126002)(356003)(446003)(486006)(2616005)(476003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4462; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT047;
	1:NZ9r0OAwiGpW0ubSj8K3SsRhRHvu4qJUJl+Hgem5pWdBVKWgaK0XCJ32jHFQclId0lBfkUXC35QwJXSZD+8+XIbRc5W2t5qDC6IfOzCJBK5XETlPaxs1lLzNI670nWsT
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a041b7c-cb32-46e1-7e50-08d5f668a64d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:SN6PR02MB4462; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	3:EeQovFDtArWp5wsqfQ5ByezCJZPKa5R2LSzG4iN+s/wQnatG59qWcbuRE/nBJ9QGt1cNX1fbI9XGekh7Lg+E2RThxAHYvCgB/UP9pOx+R+F/W6cSeEjjCSxt4Kn3r+aOQoB6hH6vcHoNSZhN0KRUr5nfCgiCZwxP9NIKwjQsTOGu8VYsRVR824dn9N3AE3TlQIHfzATHvdHbevQBxSsIno6yszOONqZ7JbuocnWrULkIFaSZEBRg7R+EA8eK4NGSzeuLn/leS0/sPSqGT+u8h5ELNW3DXnRAPehWIAgJ7gGUwV0Sy0uXk7fHIKYb2ZC2Rt/ob1flXIyPpsjepp6DyCUjWFkbhTKxOCQfnka4j+Q=;
	25:+sRABWPwxJ0TJMtqoKD8AVmzAu7fMn66YCIAC6jATYDvnk7qQ2ZUgvsf+215L57lKSL6kIajH87BC2brXT/WD/t+WExHdM6NZWARM2Xml2S3FKPq6wJncz/f0fOsWUqb6tQKq1iS0LxGMImmY6VLZfcSXRpcDXaw2JHN5bWflCn4LYdm8FbRVt0xHoK81isTmIYDYHsA7K9vW0xsrjAXBrQoDjxYdAaebsbCmXprwSN61CoZ37IuAtr15iuhsxTOq5xaC5S/oL5sRhpb4wyzocDUVTZ+eW0/XG7AvX3+grNC6i4CBFJaIU9tJcwG4Mqwt4qLxaM6xjrOFqHchIqE2A==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4462:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	31:q4zeYZVjQbo7x7EIBCRPJ26AwPn51ZyGBzeJOwJmEqC1CPBzlstic/skRpYWC9Ray6fA2ltk/vEEw9K6AjezcqogO7a9hHcmA/Qbhh5P8cp05YT4cMIcytdxjotgGCd6zb6h0smozkVNX+9oRbKaYiOQBUzwPohedb/ZYp/4DC9Dex8XBKqLVa4vfNmOv/+JWISR5fAXpJxdcdPhxsEtPSNE3Hod2f4FvNgvOcrxLK8=;
	20:kRzueahN8U1x05X9XxTsO1GTZMV4WBrbYx8oxJ6H15UpbZwCAOFqA9M/ciK4V6F96fXxDK3hlgNsYC5b3tIWf6SyJc0rgON/KnL3v6kXj2Gue8EV53BUu5NpJOdlv+/q7iwYXtLKdU6kTHTM3BF7P7YZFGS0fBs6KDiZSoVq7Jk0WLiXY04qpqy+8AZk70ftStIb2slwI6VMNC8tbosktAKEWQGgkTGkK5HqrRzTajrZ3PJd19QFtW55UV+qp3dd6rlAfaZL1fGLJA5mdbp+rmTKUzEyozrWTz4OHSxzFtQaNf5+GNsBKxpIi7AT8EbZUe83q/3g3ZZ9GN9IY0oLUIG8Z3SbVa29F9lA/llUOfGSFSsRQyQVknn+WhRaHIiS3tAN7dwV7ItnXUETn//BxRk+kRGEJcnzQHmqMR6xpiJpK01bJD40XQHAF9xtyH9IdXXygYEiabmo8xRRvGahQDwaW1GO1sfBX00svMgWb74Z/x4ACq+SanzI0goA0Mzy
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4462D53C83981FB4DFE0CC5CAC2F0@SN6PR02MB4462.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:SN6PR02MB4462; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4462; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	4:z3zStWyHgIi0uGXCjAhQ0n46J4yZaQPcj12Vd/dunNed+4bSyH3qP05e71RjRR/dLzqW+cAUHMpvkIFa6cQwHoOtfVIyobNl7h0JXjWVfzPoS5pLkI7Dzp17REQ+0rkGmZWZC80Qpvt0+w/R9PQQFFZgQEWWEooJ0OlhPXgB8chPsdr69lRxg0KQ3Bxi8usWlwDyjaO785f+I09f3ME1CTFP1Q/B7xMWIHYj76ePCA6Tro741QO0fgnWlHP3zTejZklBb9sjjefUeK84jrXBc/Y4DaT8NbdLRDhontDZi9kxVlTBa4ln54izWhZ0LJXt
X-Forefront-PRVS: 0749DC2CE6
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjAyTUI0NDYyOzIzOmx5V1R0U3d5ZnphR3N1eVhCbnhSTFBweHdw?=
	=?utf-8?B?d0psSERxQTZvRHU2N1dkcEduOUJtdC9DQUtFL0tQSDR2cHZCcHV6Kzdocnht?=
	=?utf-8?B?YjZ1RVltR084RzV4ZDNWRENmREw0MVZwZXRRRThVRksycDEycmI0bVkzYlNE?=
	=?utf-8?B?SFdObFp4VlZ1K2RiaVNoT3JTOHVDbE5iOGtJUTY5SDJSaWNnMWVYT2d4OWJn?=
	=?utf-8?B?Wm1Ca1N0WGxWQTBaQnNMS1FpdjlBWlBjL21oU2M2c3R4K3c0RStiNUcrUitQ?=
	=?utf-8?B?dUswN2k2R2xXMHBWdU9oR0JGT0Jxc3JEaFFVWEpPU0xVRUt1TWpLTGpvajZN?=
	=?utf-8?B?T2IwZVQ4Y3NFcExHb1Rmc0VmSWdObTJiTVJwTG1YdEFUTWhPOHpZd2x1TE1I?=
	=?utf-8?B?Y1pTSHpIZGE4SGJjTXBab2ViOHljc2J6QmhzajJFUlB2RkFOMmtxbHN0aGlF?=
	=?utf-8?B?RThsVnF6ZDlhakRkY1N2OVhDQnNqY0RvOHhMMFlIN284anZWRXcydS9DSVVW?=
	=?utf-8?B?VHdnbmNNOTF0TDl0cGQwYWRpNW9xcjZpWGMzTzJGYmpoWmZTTGhHQnpMN25V?=
	=?utf-8?B?Ylk1K2tGWFNtUzBCWDQ2eUdIeXd4bUwrQ0wwM0dmU1VCNUs4QVUrQlpYMDRX?=
	=?utf-8?B?cHltRVVxUS9WbCtOZWxxaUpaSzVwbE9DZ2M4VTZzcnhJdTh0YnM0WjFFNlFF?=
	=?utf-8?B?cTJMTXRpRUo2NTY0YlVCRHJSZS84YnArS3NUTGo1S2NxemN2Q2FJcUhHUjhH?=
	=?utf-8?B?cVpJbnJqbkJCcEcxT1NiQlozbmlZUU4zWllrenh6MjBCNXRuQ0V3ejhqSWNF?=
	=?utf-8?B?TG9pSEpabzRPc1czS3JuM3M2bENoTEJPZVpPbTdPM25QMWdaSk4yN2llek41?=
	=?utf-8?B?K0lpZjRQWjVrWjBlTWFhb01WRk9tREtDa3RhMmVFRFNOb3E2Mm5QbkRlOXVM?=
	=?utf-8?B?Y1ZIUm9vMXN2c0RhUjVSZ1hIUjRwWlI2NlFXM1ByWmZNdkt5cXh4VkF6dTg4?=
	=?utf-8?B?UXBubWtFK0JYSGF0TkhHWXFOVE9tak1vOEY3RGwvcTdKbXZOcFpvb1duOExY?=
	=?utf-8?B?b2NSTkJiTjh0WmEyWFVzbi9xUUh2dDREeklnQ1A0STZMRXV6dEVhN1UzRWgv?=
	=?utf-8?B?WDVKS0wxc0tDaUNSUmF6R25rejVXZzVDa3g4WURta1VjWWRNN3BUdE8vMENh?=
	=?utf-8?B?VFRUU3ZwaldocERqYmtTTENTc29tbUkrandncTk4cGlBZHFNVkE4Mlo4T3Fl?=
	=?utf-8?B?d0NDcGswdHR4QWhTSGl0dzN4SlBLcjlMNU9UUlpwQjgzU21ES1BsZW5pWUkw?=
	=?utf-8?B?ZDNMa2NJY3Q3Vk43dzB2TllkRTM5MXR3TFp3emJUcnFkTmMzdUt5Tk1QTUZK?=
	=?utf-8?B?eURSUS9JQmNFQ2g2cXNrR1Fub1VVeERxMWhLbEtkd2lJcHdnMUc0YjhxUFB6?=
	=?utf-8?B?ZlFGUkYyTldYMm4xSUxJaEtsWXZSOGllUW5DcXJobDQ3SS9ERkk1OHJ2R0FF?=
	=?utf-8?B?RW9SSGk5YUtJR1dQcy8rZXVqZzdoaU11eUppT0FPaWIvYjdZTUtoZ1N2Qll6?=
	=?utf-8?B?RnNYU0oyVWYrcC8ydHpRK0JCTXMxa2hsbDczUXNPcG1KbkwySUlhb2JYVjNj?=
	=?utf-8?B?b0h3a0hzc2dTM0xCbWFpMG41VDQrOGcxeWF5QW95Z2dOTjlaRWFSMWZyRGZJ?=
	=?utf-8?B?MTY5RS9ERDZyelh5Z1hOR3c3VStmNlRwVzM1akh1RFg0Z2lrTVJsWGFiSEVN?=
	=?utf-8?Q?13L3Kl95aNEqHEtPJ2wk1lefiy3jptJfrVILE=3D?=
X-Microsoft-Antispam-Message-Info: RSNLFQREkdIQWdlXFSSNOS5uiQcQVVKZFXhKfdG6fqAPNCeqoiaw4VP/ffwaiT+9vtOJPYYklm89Lhp6eH4YC/juQ+0OQJtRq0Lz1FtKmDfTOU/bMN8zliXOT4JKHpeAvOREe0Hwrn2WQerGuFO+NVtdGExzxj532KnVP8Wx4vmRzS7j8/348ARxBtgzRZiyWaZni7BJFbNtKs7zGDZIWxQG6dlyuBGSTzt6c/o8n7gXVsECNwWD5GC97aIqG4UY4GMANidgsgC59X9S5M3I7b2VUYIGI6p0q6pFLJk+nU5yVYVsn4W3QezyUU6t3rF0qlnSvMSBB64X3oFNl3BVoUXo7+0GJB/i8Oc3W0ZE7cY=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	6:db6GmEbZBMYBoxuzXYwYo57A3uAQ7EKbGPKQC6ylCUByuoZ/4ah66CbQbn/x2UIaE0BSdyqF1pun6HNtOao2UecpI8BmeNxnFum1iurUzVe26j90JMpUzbAw6l2OTX2oilHMa4nUr68SZnPLGEXcZNfoPrRg7IwMcM1Xyfq0r+Rs+F8iyTlNGd1SZbHA3vcHGfZVoZNJtDycretin/a2ZDlqbTnyWbpjLSel9gF9D8eNRdY+EfiJp4zPc78rPJ7zM8qvwrhqm9LnhQDwo/jLkQxMj0rS2uax+i60HXRZCS2LB6DPETS8VFNPyWNnYjFKQVp+pUBVcmM2NQh4CnJYP/FGeL+pCb2LmWOjwK5HqlrtQZuTvPCliF1LSdoJSOgPZIzrdEjLXv5BcYWOa+frfN/aMa0Oia4yPTNfryOik9ZjpNlbqkF+i9Z0UP7slT5PjL7tyVJonPLhPq77IILSEQ==;
	5:f6BO9Mw4QGFRx1wQucP312jS9t8nZj1wP5DyH28f3V9Ghab649VKpxEAX5+z5imPNNGQrb6oW22DVcxvb8Y6eVczJYZ8pP3gLozqBhGMzX6BUhW15F7iie2MQoZFc453ZMHvJtvaAdbE/gVWgyFIyJmTRxOR0zJqPUa8soUd0V4=;
	7:sSiEJb4JcwHkNAEe+BecRY/s9pJW6qIcvkxS3rr0ZrB638s2F5Z/uAdsfeOWbVbLAOXFaH+eq0BYDj6ZAL8DpfMgxtg6+krFSInfDinYc7Ouumdte79UDJRLeoK/DvusZQBfqAkjyEWicqkf9aSXl9fNKXZYqkc6LZSw69AzFejOpEnDQrASfyeGl+Wi9oFRv7xe5BSscj0K/3HkBSSrcSPrWHXfOmVkFsEiXWBKPoC2CYh7z+Uedvjxu2Yq6DXx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2018 22:06:06.1639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a041b7c-cb32-46e1-7e50-08d5f668a64d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4462
Subject: Re: [PATCH 2/2] multiconfig: Enable multiconfig dependencies on oe-core
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
X-List-Received-Date: Tue, 31 Jul 2018 03:38:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Khem,


On 07/26/2018 08:36 PM, Khem Raj wrote:
>
> On 7/25/18 9:05 AM, Alejandro Enedino Hernandez Samaniego wrote:
>> This patch enables multiconfig dependencies (mcdepends) to be used on
>> recipes using the following format:
>>
>> task[mcdepends] = "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-on"
>>
>> For the sake of simplicity consider the following example:
>>
>> Assuming we have set up multiconfig builds, one for qemux86 and one for
>> qemuarm, named x86 and arm respectively.
>>
>> Adding the following line to an image recipe (core-image-sato):
>> do_image[mcdepends] = "multiconfig:x86:arm:core-image-minimal:do_rootfs"
>>
> Do we really need to add multiconfig to keyword namespace ? can we
> deduce this from "arch1:arch2:..."
Bitbake already uses this and I believed adopting it would make it 
easier for the user to understand its usage.

For example, since the multiconfig names are also provided during setup, 
if you assume that someone set up
the build and a different user is going through the recipe, arch1:arch2 
wouldn't mean a lot for that user
because they may not map 1:1 to MACHINE names.

>
> secondy, this need to be well documented, with examples for users
I agree we could add more documentation to it, where do you think it 
should go?

>> Would state that core-image-sato:do_image from x86 will depend on
>> core-image-minimal:do_rootfs from arm so it can be executed.
>>
>> This patch makes modifications to bitbake.conf to enable mcdepends, and
>> to sstatesig and staging.bbclass to avoid conflicts between packages from
>> different multiconfigs.
>>
>> [YOCTO #10681]
>>
>> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
>> ---
>>   meta/classes/staging.bbclass | 8 +++++++-
>>   meta/conf/bitbake.conf       | 2 +-
>>   meta/lib/oe/sstatesig.py     | 9 ++++++++-
>>   3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
>> index 41df883..27b012e 100644
>> --- a/meta/classes/staging.bbclass
>> +++ b/meta/classes/staging.bbclass
>> @@ -256,7 +256,7 @@ python extend_recipe_sysroot() {
>>       workdir = d.getVar("WORKDIR")
>>       #bb.warn(str(taskdepdata))
>>       pn = d.getVar("PN")
>> -
>> +    mc = d.getVar("BB_CURRENT_MC")
>>       stagingdir = d.getVar("STAGING_DIR")
>>       sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
>>       recipesysroot = d.getVar("RECIPE_SYSROOT")
>> @@ -443,7 +443,13 @@ python extend_recipe_sysroot() {
>>   
>>       msg_exists = []
>>       msg_adding = []
>> +
>>       for dep in configuredeps:
>> +        if mc != 'default':
>> +            # We should not care about other multiconfigs
>> +            depmc = dep.split(':')[1]
>> +            if depmc != mc:
>> +                continue
>>           c = setscenedeps[dep][0]
>>           if c not in installed:
>>               continue
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index e28f3c7..f68954c 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -877,7 +877,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
>>       file-checksums python func task export unexport noexec nostamp dirs cleandirs \
>>       sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
>>       recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
>> -    progress"
>> +    progress mcdepends"
>>   
>>   MLPREFIX ??= ""
>>   MULTILIB_VARIANTS ??= ""
>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>> index 5dcc2f5..18c5a35 100644
>> --- a/meta/lib/oe/sstatesig.py
>> +++ b/meta/lib/oe/sstatesig.py
>> @@ -150,16 +150,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>           if recipename in self.unlockedrecipes:
>>               unlocked = True
>>           else:
>> +            def get_mc(tid):
>> +                tid = tid.rsplit('.', 1)[0]
>> +                if tid.startswith('multiconfig:'):
>> +                    elems = tid.split(':')
>> +                    return elems[1]
>>               def recipename_from_dep(dep):
>>                   # The dep entry will look something like
>>                   # /path/path/recipename.bb.task, virtual:native:/p/foo.bb.task,
>>                   # ...
>> +
>>                   fn = dep.rsplit('.', 1)[0]
>>                   return dataCache.pkg_fn[fn]
>>   
>> +            mc = get_mc(fn)
>>               # If any unlocked recipe is in the direct dependencies then the
>>               # current recipe should be unlocked as well.
>> -            depnames = [ recipename_from_dep(x) for x in deps ]
>> +            depnames = [ recipename_from_dep(x) for x in deps if mc == get_mc(x)]
>>               if any(x in y for y in depnames for x in self.unlockedrecipes):
>>                   self.unlockedrecipes[recipename] = ''
>>                   unlocked = True
>>
Cheers,

Alejandro


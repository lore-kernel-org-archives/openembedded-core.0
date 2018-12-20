Return-Path: <alejandr@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
	by mail.openembedded.org (Postfix) with ESMTP id 669CB60116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=z04vL5y9DEIcSSmErAXhR/3a3di55buh6o80KDjVnzw=;
	b=qC0YCYMolTqjPod6XMspdwaLTFKrY6uApmiwoObJGY3u3wStURvZj+fNOQrAd6/DgEuCOKbt0HkkyRZQ08ioG8xdeUygmEJt45OjzSIZjoIg9l3yBcybGPPH7Sw40zpPb0vacG/lYjn7NbI32CBWhEJdZKBGK7dTwaXVQbk5qN4=
Received: from SN4PR0201CA0023.namprd02.prod.outlook.com
	(2603:10b6:803:2b::33) by CY1PR0201MB0730.namprd02.prod.outlook.com
	(2a01:111:e400:4c28::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.22;
	Thu, 20 Dec 2018 02:04:51 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by SN4PR0201CA0023.outlook.office365.com
	(2603:10b6:803:2b::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1446.17 via
	Frontend Transport; Thu, 20 Dec 2018 02:04:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1446.11
	via Frontend Transport; Thu, 20 Dec 2018 02:04:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39522
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gZnhi-0007Ae-D6; Wed, 19 Dec 2018 18:04:50 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gZnhd-0000f6-9g; Wed, 19 Dec 2018 18:04:45 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wBK24iGr000842; Wed, 19 Dec 2018 18:04:44 -0800
Received: from [10.23.119.94] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gZnhc-0000ey-E7; Wed, 19 Dec 2018 18:04:44 -0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20181219181309.8320-1-raj.khem@gmail.com>
	<20181219181309.8320-2-raj.khem@gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <b42bfdc9-7c69-f6cf-0b46-c5d7ac40c053@xilinx.com>
Date: Wed, 19 Dec 2018 18:04:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20181219181309.8320-2-raj.khem@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(189003)(199004)(67846002)(81156014)(81166006)(229853002)(5660300001)(50466002)(65826007)(14444005)(356004)(106002)(478600001)(31696002)(476003)(126002)(486006)(26005)(305945005)(6246003)(76176011)(36756003)(53546011)(77096007)(39060400002)(31686004)(106466001)(186003)(11346002)(8676002)(2616005)(2906002)(63266004)(230700001)(446003)(110136005)(64126003)(58126008)(8936002)(316002)(65956001)(65806001)(47776003)(2486003)(426003)(23676004)(9786002)(336012)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB0730;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT003;
	1:jP/EMd5GXtHgahbvLJ2LEuxyTYR+dxOClDJeU8MjGJ/TnUMR6ko3sSQ4+gXoyvfnHhuiw66So+TcZ6YD2c/mWAjBGtM5Uc/o0s7Tr6kzoAeQx5tMDQxaMlWg4gZ3dLpS
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac4ba5f4-dc94-4e2a-7b99-08d6661f86c9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY1PR0201MB0730; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB0730;
	3:zFQC36ozZLwN/YE1bzwcmgJH9TsJpJqFuNNbTL0D1JJ47fBwiku7v1Y5c4WKd8xcZMVrXza/tmaWwb9/7RNzyLPzfdkI4ftmRvePcKyYNZizDAyFQg+peLzz5RPQJY9H8Vr36OIQb7kmYd6HXD9RiJdKxQkqeTCQV/CfKN3CAHP59m0kUKpO2Addv9Y0xfK5TIa9EiOSPoPJT2HiLWOGkOCcTOIOc3uV8B4OHq8uQZKPlmGYWL82FL66OMDc0MeUgd+SoRUO/N6d374B5aUZb9Dvd1y0BVa+NC2pD41qW5E8wHtg9K+PqLU7CFCDD1K3CG6N/uIofYTDjc22q0rxwwKIz/P3q/gKbwUGUBsam7Y=;
	25:ucPwlwutdXqFj7wkms1+/tHshQb5Tf0etIVqD7caYPM5ZUUnIj3ZFw+njNhz/mt+S2iv08ZdDYsLm6OTSS2dlB60T4jIE58jjGbtFQn0W0L6zgBDOHanMZtIHHnY7R4cQ3wF2FKqcbwub0k0PlXBo7GgCz6iEIK1fibA3zvfmRNAcQ8ANxMd5CndGb/TTshQyGYqsEw60mRKSpMLtcX1g+2DHo458rcjGaRfMs8Ts1rJ+7fgqlJ6/LH5vDtBxBRgjWz2XW1DaWx28z2IwsNruHE+zT0WfHFj0J1uAcPA/d4Q0oHF+NsIKMPA2bLB7LFL6L8NTMNwo2yURdolnqtA1fpgpmkjqnfTY/bPDrKOtYc=
X-MS-TrafficTypeDiagnostic: CY1PR0201MB0730:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB0730;
	31:GuPDEtTjWi+mt3P1kucNo87C5NLD6/IUnGGutbn3qOld/Le8+sJsaQ7m8YkAMi6xuWk9EzAjwUav2M2fAAx8Y8USGVQYAuHqjqCbQDlsMRZAcCK5WlM277YbCWIH3DGDzF5CTKC8Gf/PczUcBup8SjbUo2zVtTcL8Ebze+pIckXPypbfBJyS+PQ2phJhJ6tXOKobFiU22xM/HUVYRQInJqvmJ0A8CJF7tI+ybw8OIkM=;
	20:NDx9TyIyGpA7HAc0yfC41gwiFKOYR1W0sorQpUGOf41sy/Xd6NEJ7d8hUUyXAxZCHA5F2fJvwOJgiWZSETOsD+m3CxHUaDL41ysjTFZyQfjjqACRuj+O76zFSjcTeF11x0BsYzvNR9GVsUE6guwhTfW+s2zpvV+iZH7b/ZxXr5xgrp2Nd8O3xmLaEmt6D+5Ox9fiR2Syr3nvj9Z9P/FEomBpjekwZNnhi26fPWSOVQ5+PybDVcqI1QjEyuGPpW8s8LyAlzR6AbQUjl1KOBy24oEsSR7Bp4qf+qN7JhOpxDjAwjXROohJdxte36cAEk6unKZeOaPWIIIiuwSCPrRqHryTCQo4jmrn02dn0bR50U11TgKUpiTxuIt30lpxxaUWld0ZrChpk9nuI1AciJHIfaSP0hosqwK6wWhtbLAGWPrA6UrThutrn2v3YyecO8Glfo/823rlJ379VOdaCOME6j/DDtZIYFz4MfdNRCpawgo5SNvKPsIvxakd+tDwdDiG
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR0201MB0730C69CAFF84D0C4B656582ACBF0@CY1PR0201MB0730.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(10201501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93004095)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:CY1PR0201MB0730; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0201MB0730; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB0730;
	4:zplHTbUCM5YORTOOf9Og7YRldOtXcSQeybaLBdNXPKS2JIDoUu5JC3lYIjXxmJAW6r0hS0btKUv61Vb3s0eqTO7zSj+CI7IfM9a83WblRY3g/lOiri1rU6fQH76Ng6iRTU4HGkqmiB1MjJ4gYK2MBFZZgRHVqadMnrd+fvC9UoLUW7NQMjOFRuqm22SETqOWmAB+HbXzXzm83eQt5e3a7Z4kYKuofX+xdQkm1s5LgQ4l3TZkWgABUrx7IeaHOkg9dypD2r1n3f4oFvKsNWKuTQ==
X-Forefront-PRVS: 0892FA9A88
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAyMDFNQjA3MzA7MjM6M1kvalE4RzBuaVBlcXBVMzNXcTFtbncx?=
	=?utf-8?B?YjdGdGJFdWFSQmZHVDd0UkpzZ3FQajh2OUpyRzNJNlorK2RKYzBPRFFzZElm?=
	=?utf-8?B?NnRTQ3YrZzFHVGtSdklROGpGOFFHSzZsbFFYOWtOQkZUZEdlNE1UNURwdFRZ?=
	=?utf-8?B?OW56cGZoc2JEbjlHZ2ozZnczUVk1VUtNcnlqQWdBcGJMQjl4dG1iN0NFSUlB?=
	=?utf-8?B?ZnZqZTErc3RYRTdPQmZtUXJzUzJQR2hiY3g1Wk5hTlN2eU1hVjBBY0FITk9U?=
	=?utf-8?B?T3l6SjQrQThBRU1BNmRDWWI5Y1kvamxJN3c0WDAzdzhMekVYNE5vUHNMNlhS?=
	=?utf-8?B?TGMzY2UwOENOZmU2U2lOZkQrYWMvZDd2M3p0bkFYNnkvTlYyV1FIOFFkdUFG?=
	=?utf-8?B?ak0vTm00a2QyMEdsYytISnBkVWR6WTU0UHRCanIrdklYaUlXSjVJbjdiY2h5?=
	=?utf-8?B?KzhWSEtVczI3R0JDVzFRWW5HWHRpMHIrcVJXYXk0dFovYUxZZ1BPazlOVWhR?=
	=?utf-8?B?K2hVaUFBSk02VVk5bjZ6TjhqRTN3TnVmMEFoTmY5NjVGQjJHVkljK0xqc0Vx?=
	=?utf-8?B?M2ZSSUhXamxML0g5UVBxVFVXQ1B1ZzhOMGNVbi9Vb29DMXYwVTRod1ZmMktH?=
	=?utf-8?B?QUtkaTBnOVNlRnJsWndvaDZFLzJ1ekhEd3ZIeXQrQUlMdEw3WDdZalg2MnZ3?=
	=?utf-8?B?QUFLRWhCNDB3UldyU3cwRzVDcFdvRUM3YktPQkpsREhXVUdwbnR3ZE1sL0Uz?=
	=?utf-8?B?Q04raGpxYUVlTkVDeUUyQSs4QjVOaFZ2QXN0MWx5YmIxNnhkeTY0aEF3YURQ?=
	=?utf-8?B?RUd2QkNMb1NyRHlPQTdCKzZtNFNpMXNLRSttMU9ScXQ2MUtKZk1kTTUzV2Fl?=
	=?utf-8?B?VnZJZGpvZDc4dmxXLzNnOWNpSTUzQVY2NDVVYS9ycXNza01zNlBPVTlxajEr?=
	=?utf-8?B?OVRTUTUzS0RlZEN2Uk9vV0Q3UUpVSGRhREVWb1B2d0o3RUQ0bUlOK2FZUEZx?=
	=?utf-8?B?eGxEVkN2aTl6KzhoWk1iOTdVbFdXNWpoNW1IM1pRL3VSVVFJZHNMNHRROE12?=
	=?utf-8?B?cHJTNlM3QmhuQW1leW5PV1lQVE82cXpqNjBLTjZGQ2M0OENuMkZOWEpZVFJQ?=
	=?utf-8?B?dWh5SEVzWlZ4d1diZUlmZnpQcEI5Y2EweG1BemcxQkNDd3RUMWZTRU9KUStw?=
	=?utf-8?B?ZkFDdS9HZWtmMUhUNkFheG5sc0xqRXR3YzUyLytIZ2l2ajBQekdjS2d3eHNs?=
	=?utf-8?B?NUF0WUgrNVlZMHhuK0QwMFBkUW5VV3I5YUVQQVd0akl6MnVJU0xPT3RIV3Rq?=
	=?utf-8?B?MktzQjg5L0svcXFLWU12WHl6NnhrM3BEVEhFb1hvTGJzcURpN1pJVHRlUjZJ?=
	=?utf-8?B?R1ZIai9sNGNtTmtheklGRCtVdHdEeVBmNFhGL29aSm1FdnFoMEYxVmNQeVZP?=
	=?utf-8?B?dStnK0pocnlWVmJvdENVc21abDZ6YzJMNEFYc0pMY0xhdm9GQXZKOFVPV1M5?=
	=?utf-8?B?bHpMcitCR3pmVkZzM1dweDhpL2I5S082eDhibHE3dkgzZ1RqRVV4b05ESVhH?=
	=?utf-8?B?Qy9VSjFVTGhzdmlCdFI4SWdDMUo2MVJkNmVvdGtuNEZmQXM2OENlY29RbDJH?=
	=?utf-8?B?WnRxbXVqNEQrK0NoekowcjByQVU4SFVGRGNsTHgzZ3lwd0hJcGxDZFdjZklo?=
	=?utf-8?Q?ok02gvfomK18sYpWYQYo=3D?=
X-Microsoft-Antispam-Message-Info: v8NBsOssEH4zdB0rJQtX9bWnI1G2YnffBTHGyWoYeHPNEgHAS9wnM3fOkEh++cxWsaYzt/lRD2XePAAfFnkY0XOMW9/FTLCehCdnXNQ03cxmy59FYItBKXCjPlTFEyiuasHbIBvPH4s143yuZAR7ZIzDAhXa5N7dQV9fbmKKZfkx8k5D2dewmH5M4zXH5DUpjEKGmUF3Y+a6S24CvZU6j+//LqNSvKixUFAeoshtphRxxYoPQrrfCX63o5uJbryM1QLDhXRrK4YwlWEix1tAcmGlgKqxUYL4fb8UkNASSgfmt2dIB0KJVQBdgHfTz0zB
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB0730;
	6:7KA4PVzjJjlzZRHK2ez3BE63H84maWd9CY7aEIZ5ma3eQW40FT3wA69yOOxXpX3CpJ3rlnV4AaRKz4PgYvh7u86hRnbM5ZI/SeqJ8FPjjr3rkfp8j5RmsE2iupIaROzAYqtgPljsCw2vRs2DZ8zKXBIDuzpdY1X3iPBfBPayobQW4rNyDigLSV4ZSaJy10I2t9OgfU6mtCwmlM/+RpjCBfsaO4g3Q51dcj/9f+fVpihRMu2TUCa/1g/qYGBEn+no9HhOiZdXzKmfZ+O9nU3ZvZQw1UwlbDkzjFbz3JU7EmMM3OwcgMeMqMCWjaTBYDZh8/sML2Ya7Hm8/48X0VPcqm7aHKg21/1bWznekDvoPmCsUpKUIiIc5HsAdby3dFgrlz10P5N6a9k9p/yyGPvytMzJv6yREm5p0gPlmLv8vjuGg5Lbw5cAzmswDqlEfYt8P3etmQfBc74DqD380ZYgaA==;
	5:0pngaiscyiKJ3CAQCAQWVk+EoqJZw4iDgMys46zG+9a57akLCjBT4UnVjPzTBxSANVFOUukmVfs9onQ+171AVDJKCF47fXTmtvfJBeUPVrei2gTHwVAueq1zrkWIhcHmnoKnI9xovJyoa2Dz7llCWlq/Hh+/cbqnyfCXs/4Dyos=;
	7:KB88h0m8D3BxBSb2d3B062YDY1AIgvtK+FmWHaVrQoVKt7/uLuGgb7u6wBgvhW+vOQKjpHGIMyJv5aj7mYvD4fkhOl4Aw9iCW2o+UHPGu11Kto1gqk5XradVB+yyq+Cy+7M8ouikLIDIOh33xIrtDA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2018 02:04:50.9155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4ba5f4-dc94-4e2a-7b99-08d6661f86c9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB0730
Subject: Re: [PATCH 2/5] newlib: Move away from gcc-initial dependency
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
X-List-Received-Date: Thu, 20 Dec 2018 09:35:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 12/19/2018 10:13 AM, Khem Raj wrote:
> gcc-initial step is no more needed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-core/newlib/newlib.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> index c97c7c276b..c68c163266 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -20,7 +20,7 @@ SRC_URI[md5sum] = "81ec873108b8593c586f91ca65963952"
>   SRC_URI[sha256sum] = "c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332"
>   
>   INHIBIT_DEFAULT_DEPS = "1"
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc"
>   
>   PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
>   STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"

Thanks Khem.

Acked-by: Alejandro Hernandez <alejandr@xilinx.com>



Return-Path: <alejandr@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0068.outbound.protection.outlook.com [104.47.41.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC41278544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 19:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=h8Ae0cLh7IAkSSLUs67Wp5Z+1y0ohaqnVS34Qq9c9/g=;
	b=3JJ3vdRmeVSZOaFB092OB1c0XDvE343vmg7y9FF26hjjODMqC6pBSODrwD6Qc2OVTxGnTPWEsQW7PmMyzcKLMgEqqK8bFjbwwevPvysbOjFAEzrX2ZXA0QlBph9eNMHgbSlDqcZ5Yg9UFWxw/SCCMf+z+ORWaqbhOnVBQ1wP9tY=
Received: from SN4PR0201CA0049.namprd02.prod.outlook.com (10.171.31.139) by
	BY2PR02MB1331.namprd02.prod.outlook.com (10.162.79.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Mon, 29 Jan 2018 19:23:25 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by SN4PR0201CA0049.outlook.office365.com
	(2603:10b6:803:20::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.444.14 via
	Frontend Transport; Mon, 29 Jan 2018 19:23:25 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Mon, 29 Jan 2018 19:23:24 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53613
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egF1Y-0004bO-5U; Mon, 29 Jan 2018 11:23:24 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egF1Y-0006QO-3E; Mon, 29 Jan 2018 11:23:24 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1egF1X-0006QL-Op; Mon, 29 Jan 2018 11:23:23 -0800
To: Derek Straka <derek@asterius.io>,
	<openembedded-core@lists.openembedded.org>
References: <1516994731-20440-1-git-send-email-derek@asterius.io>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <339ae59d-fd5e-47e1-9b4a-3fd9e5195877@xilinx.com>
Date: Mon, 29 Jan 2018 11:23:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1516994731-20440-1-git-send-email-derek@asterius.io>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(396003)(39380400002)(2980300002)(438002)(5423002)(199004)(189003)(110136005)(64126003)(53546011)(59450400001)(316002)(58126008)(106002)(36756003)(81156014)(8676002)(81166006)(8936002)(50466002)(6246003)(229853002)(106466001)(230700001)(65826007)(31686004)(6306002)(9786002)(478600001)(575784001)(356003)(2906002)(2486003)(67846002)(47776003)(23676004)(336011)(5660300001)(65806001)(76176011)(65956001)(186003)(31696002)(26005)(2950100002)(83506002)(305945005)(77096007)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1331; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT008;
	1:JwLhM9LWDBAnKApvY0pWw5RRCosV6wvIp34R1opazmjJqg8RIobHKHID4YKki+7OS+XWkAZEEgI/KkJ9VN7i5xFULnKypxh5uHSxdApJoDoli1H/ocOGR9FspfS3h933
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecfc834f-47e7-4708-b183-08d5674dc48e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	3:XQJBCJ+b5yhArkssBf+68gm4krM9x9dV735Ukcm0aRrVYN+D+vVuWVafxZhfyVePJBKgrTLMkZJKGQLRCYfpWavdbbu3PpBJZrnBk0mu0vkOc7vQgk/cyZH8o6VdprseyfF4Gx82665qguV4QXFJcp0myfkF5bmKbop8CfJ6b/fhT7ii6UNZB7os1BWx1hr4cghOP+uKJk3a7rXWjxnTkrWCSrdohfFCgNRlggW6pkAJfGnRbh823wQnGXMQwc3Am5lfKTXl9QFJwtg5XI5rN1GFA/BoklHh3zs2QDtVwIcb9VTprG1xIea1Dx96zmpXYm6/agQnZL7PHUBsU45FsujBsuiVCza+NpBUPOhcoC4=;
	25:xSJ9+W8Hq7kyJOmj/uedYOVJrZKG+nPz4Qg5EPi7lvPPWhYalUTXHEprEDJ9mBZdCEn9WjA+Kfn6DkKQbrEkoCiXAamgqzjeqW21t09WNQrWBD44tgFNxtEUQKv5sx9CqR5FM8Zv/OyM9BsH14cK7c1E/PRt87cxX89BCnabrI9d9Iq3p5uodvMwLHMlDFMMUey1iTgG+3QAs+c1B0o9cz8jjxLbaLvUrhjPssZFKiwwGDXR6bvbplSZrdFjHqFu37bOHbiJNttLEe5lJ8She1uDLrhuypmtbVmgYzeFk+ywFjkBdCPBSmzYNQXZBFXPicfpa27qJzT5z5vZTtCkdg==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1331:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	31:XHepGA8QLExDcAG2b1yMNZt7kmrwvl2BmjzWG2moqLm+IloLniIBMAw4YtWYkn3TBUtvFGzeH0WLztNGDGsdJp/8mIzA6pgyl22iF66ELxfLApNSG3oLgWg1uQs9c7J7qW3lgvgvhPsxDzsrTs1Mos+YOgssdB9lLRbEXyjPvUt6nD0GxHA0ik1h3k8YLDknVO/tKlAX9fyYfu4CcBjk9M2wgcOa4MdTHgOgB/JeofE=;
	20:Lyh2agTISV+Au94kLp82VuxrNB/ANc8Sdg0Q8AxZa5BZI0eeH82eOZudE7LfLqSuycBdfrxCGv/aZuHKeMndleXssqtbzbhQm4mu49TNABD0h1EnhtJcutDhPek3/VAmgq0tPcqI7S+y2+gzdMUCBtbuINHDKOPWoTRYh4w5HLiC7qyBaIlnIjnIBCsRYLJ0rLxw9i3hdtVOUJ8NhgQ+UHHkZJSRc2Hk7xaqPpUgrjGEO65i2ymZile6/7CCo8790QiGgtQZhg17QNZPHo9xVlyMWfUxROu/v5L/FHDTeou6ki8C5adcggyY92lhMu4wriFuO5q7De7vqdM127HSDD60KAZLAoNMrdanvsP5/4Jfquvgr9y3Yr1OmZkfg6JyyhZ9+wDLPNnQZYK6eVnuP61lR/jtK+oaBUuVkWVbAt5XZwad2WWmmRLtO+pH2C9vW/2wDMtcv7cQSAH3thV0FFLs8R/LhUbgZa+6vcxXfuBa4AKQgXVHP1k3S9BwjFr+
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1331DCD81DB94CB4B95227FCACE50@BY2PR02MB1331.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231101)(944501161)(3002001)(10201501046)(6055026)(6041288)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB1331; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	4:+Rx+6fdRnUODTc3ug3hOr+0MNz+Qsqt+7G2b3F5MYUAZ16d0SenHxxGeNHZy2xheMK+wUGF2mCptDbj2G9f2McSLZNrxwtpNo2y2AWI7HDdQ3EsVJYQsgf2UZZrvpewIoxqS3ICdftLfDxSW91XlclGkaOpkRjQqAgbtq/j/IjP2otjTu/oymilwt2lvfdI/9EwFjHCR/jXJH05QNWIGbkxdPPyx2547ymFpO930YQmgLNUPosG5BhYxP0eMXVURviUkKDJ98cfOG18rrTSwUZIvv/pgdXaIZWKPLMj9klm2hWElcCzm0TEXJbYspvPWHxfXxrw5+8PPxiN+XlQiS2YOIr02KGMUgiPB/O/7Kc4=
X-Forefront-PRVS: 0567A15835
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyTUIxMzMxOzIzOmIxRHVSWGltUVR0eVZZRmMzQklwclpmTHlX?=
	=?utf-8?B?SCtYZDV0Mi9QSXBEQ2Q1d3hWazV5aGp4RFY5YmZoUEN4S25QcmNBZUdvWFdV?=
	=?utf-8?B?NWxmNlc3a0hDam5VaXFtU1VRQjd3ZXdYaC9naG1pV2NIVjN1QXJXclUwYXZo?=
	=?utf-8?B?YWlNZno1V1k0QkxVajA3MGJ5M0FKaHI4ZkpoNDRQVTE1VCsxeEoza0VkZTMv?=
	=?utf-8?B?UkxvUFFsUlovakhUeGNZZ3UzVFp1amJYbUtYam0xMFNkdyszVkNoOHphNWp1?=
	=?utf-8?B?WkV5Kzg4NlBGWmZTeGJxaU9XOWZjOERYMmdxT21EcTd6T2gxREdSc3V1djZT?=
	=?utf-8?B?REd6aWF3YzVqYUF5VEN0OUJMaHNUalhLSXlzaWVmM2tTM2M2UVhPYUF5K1E5?=
	=?utf-8?B?VWlqd1NTSGtqc3lZd1hGV2ZlbC9MbGZ6d2xWTmk3QmFOT1BFZEFvM3dXeGZL?=
	=?utf-8?B?eTUwcGhvbjd2M09mVkpDdk9zN2pnNTB6OXpaanQ5b2lzZzNCZlcrMzJka0dP?=
	=?utf-8?B?YjZFeGNsL0RVN0hsQk9tZlgwc2JrMHNnL3h3ZEdCYVd1M2NCekxYdGMrVlZZ?=
	=?utf-8?B?T3M1Q0RIZ2l0MWZkZlhUOEtrM1Q1bjFONWtNOXF4RGh1bTY1a2c3bEJzeUYx?=
	=?utf-8?B?VDlIQ3oxNUU2Ny81SjhRUTc4enNMTVVXalNHdDJKZDhLd2NRRnF5UDZEVFNR?=
	=?utf-8?B?VUMxamNIS3NtYlJxcVVRR1RwRVM1M2xLVG5aTDlFVGRVblVKcElqNjRlMnJD?=
	=?utf-8?B?OTBKLy9kSjZ1cEhQTk52elJPT3lCeTV3aFQ4M0hUNmpxN3JEaUxnMEU3K2t2?=
	=?utf-8?B?OHA0WHJjK2g4NU1XeEIyM2FCSGp2Q3Urd2dWZ2VpWkxzbjJCOVB1c2xHczc4?=
	=?utf-8?B?M2pNVHhZaW56R3YzaDBwNFp5aXdVaGlOeERvdFRCZTRxTlJERnpnWUlyOXEv?=
	=?utf-8?B?V09ucnVRUGh0Q0xRTkxmek9nNHJ5cTJBN1Y0K0RMYndwNUlVZS83Z3pCM0NX?=
	=?utf-8?B?citZc3F2dld0NUxUbDBXNlMzdDBEOXQ2blhFR0F4WVFydmRPekVtSUJuRmtu?=
	=?utf-8?B?MXY0L1Z3V2N4dXFjZEFIU3JVWEo1Wm1HbEQ0TzlFNE0wK0U4c1VZOHJFYzhO?=
	=?utf-8?B?U3grWWFDSTdiT1JCbGJTeUNuQWZDUWJvbEFmTkVUTUpmRC9OeTFvakk0K0dO?=
	=?utf-8?B?YlJicFh5SDFBVVl2ZlYySkF4ZFZFTk5ZTlBXQThwUlplUXl1VG83REZIZHdH?=
	=?utf-8?B?Mjk1ZVlUUGFiMUMzRUpmbWxZRytHVkZOZ3VqUDUwVDRvZGE1NTlDcUlCaFc1?=
	=?utf-8?B?Rnp0ZzA5emJ5L1ZvMFZtdG04Q0lSeUlDaGY1WHA4TmJqVVR3c2RYdllpMjRT?=
	=?utf-8?B?SFQ1ZnJ1LzBBSGlSTW9oaHFpZ1VVam9pS0hPMGUwZG1mVzBubmprNEtveThB?=
	=?utf-8?B?Wm9kTzk0elZUcTBtR1dGMENIVnpGdGkzSjVSY3V6U2FodVlzUzNzS1haSFdj?=
	=?utf-8?B?UC9jU3o0cm1XaDZ3dWpaRzBTVVhjelZpZkl2Y2IrRGZ1N0N1d2hNWktycmRv?=
	=?utf-8?B?WnBiRVBBdnlyWTZxOCtESnFQWDZMT3dlMmZ6cXBLVVltRC9MQXFBYUFRT00x?=
	=?utf-8?B?VXdjM0NER1NnQnQ5MDlXVWcrMmlFWVoxR1JubzJpVlpTcEVWWEU2ZldRPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	6:0M/zdVhZKxVDldCmL/+r3NB/xwSVXpIXGYHhw7dy7TvqOkavQtxz0hkGJhUaKFm7eyMabxGVzSymh+3tAAKontNvQBoqOh31/m+mYSBDp8/Y26ZY0TQHsTRPcd+JI/fhhJeqfrKrYJ4HpU8dgIdvlAfKNSWDL0bpjizISQfFh62uxShANDfnTHqJgYL+YFXDtMD7Lqtxar27kHRgFosBWeR91B+TNY+kCo53SX/TyYvoIqbnVDncZNJuXzGLwHDC/cRSsL63XSVON816pXk2lYhcnmdS4Gylg9vdL5PdmoPtrjlpxFscAqTD3QQfNw0fazShYmtuu2fiCMhk63PGn4TYy9zO2wfCuSjsxppplt0=;
	5:IWiaXtCkMz5ZwWC3zw6m2VEoKQLRW9LjAUcPToOO8QXfXaInWQZng3niqZJlb197RkaSeIFoA2VRrSCTJrHp0CHn7TxTVqNbfQPgOdLUc0hPwB3kcYYXxdO5//G2xI7lpj4l+hDB2xvIoHOFiLRLQlJ0xqiDmFzyx+/w9vyTjFc=;
	24:Er/KW460ZBABdGQhYX17nysHvwJrC2/hFA5/kSKJw4WiQnqUCkrUu/S9MLxIUubTYl7tx6aslaLk7LG4z7C6Y+VEryzkoNM1lEf4C7u9n1U=;
	7:OsifWAMuJkUYUgF/SMiu3fO4/UiJiuMu2fr6istUIT5Oecyfjb/jfSPnXLP1rLaRpnktpGzSJoV2Vxff7B6eo8JAAoT0evI1QeW+oc7xRnAWWpPtUlOpgWtdj3t+yJ2N7hrOTloxFlalgY0e6F5jIG2Z1/MtIAAi/vATpYE5MWd0NK/1vSnJUnJRO+PKtMnQa2EvEEcmE26F4Ij3DgEFj/gGuptNoVuI/dlKx6ZYzE0QnTOBIAa/+7jdc/TFw3Fw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2018 19:23:24.7809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfc834f-47e7-4708-b183-08d5674dc48e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1331
Subject: Re: [PATCH] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 19:23:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Derek,


Just a quick question, did you run the create manifest task along with 
the upgrade?


Cheers,


Alejandro


On 01/26/2018 11:25 AM, Derek Straka wrote:
> Rebased:
>    - python/01-use-proper-tools-for-cross-build.patch
>    - python/fix-makefile-for-ptest.patch
>    - python/parallel-makeinst-create-bindir.patch
>
> Removed Upstreamed Patch:
>    - python/Don-t-use-getentropy-on-Linux.patch
>
> Updated license checksum for changes in the copyright date.  The license
> terms remain unchanged
>
> Added an extra do_compile item to create the native pgen that no longer
> gets compiled by default
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   ...on-native_2.7.13.bb => python-native_2.7.14.bb} |  6 ++++
>   meta/recipes-devtools/python/python.inc            |  6 ++--
>   .../01-use-proper-tools-for-cross-build.patch      | 17 +++++----
>   .../python/Don-t-use-getentropy-on-Linux.patch     | 41 ----------------------
>   .../python/python/fix-makefile-for-ptest.patch     |  6 ++--
>   .../python/parallel-makeinst-create-bindir.patch   | 12 +++----
>   .../python/{python_2.7.13.bb => python_2.7.14.bb}  |  1 -
>   7 files changed, 28 insertions(+), 61 deletions(-)
>   rename meta/recipes-devtools/python/{python-native_2.7.13.bb => python-native_2.7.14.bb} (94%)
>   delete mode 100644 meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>   rename meta/recipes-devtools/python/{python_2.7.13.bb => python_2.7.14.bb} (99%)
>
> diff --git a/meta/recipes-devtools/python/python-native_2.7.13.bb b/meta/recipes-devtools/python/python-native_2.7.14.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python-native_2.7.13.bb
> rename to meta/recipes-devtools/python/python-native_2.7.14.bb
> index 2b74003..622cb38 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.14.bb
> @@ -36,6 +36,12 @@ do_configure_append() {
>   	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
>   }
>   
> +# Regenerate all of the generated files
> +# This ensures that pgen and friends get created during the compile phase
> +do_compile_prepend() {
> +    oe_runmake regen-all
> +}
> +
>   do_install() {
>   	oe_runmake 'DESTDIR=${D}' install
>   	install -d ${D}${bindir}/${PN}
> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
> index b40f551..979b601 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -5,12 +5,12 @@ SECTION = "devel/python"
>   # bump this on every change in contrib/python/generate-manifest-2.7.py
>   INC_PR = "r1"
>   
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
>   
>   SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
>   
> -SRC_URI[md5sum] = "53b43534153bb2a0363f08bae8b9d990"
> -SRC_URI[sha256sum] = "35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff98f731"
> +SRC_URI[md5sum] = "1f6db41ad91d9eb0a6f0c769b8613c5b"
> +SRC_URI[sha256sum] = "71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66"
>   
>   # python recipe is actually python 2.x
>   # also, exclude pre-releases for both python 2.x and 3.x
> diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
> index 366ce3e..e795a74 100644
> --- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
> +++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
> @@ -9,6 +9,9 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>   Rebased for python-2.7.9
>   Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>   
> +Rebased for python-2.7.14
> +Signed-off-by: Derek Straka <derek@asterius.io>
> +
>   Index: Python-2.7.13/Makefile.pre.in
>   ===================================================================
>   --- Python-2.7.13.orig/Makefile.pre.in
> @@ -30,14 +33,14 @@ Index: Python-2.7.13/Makefile.pre.in
>    
>    # Create build directory and generate the sysconfig build-time data there.
>    # pybuilddir.txt contains the name of the build dir and is used for
> -@@ -681,7 +682,7 @@ Modules/pwdmodule.o: $(srcdir)/Modules/p
> -
> - $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
> +@@ -663,7 +663,7 @@
> + 	# Regenerate Include/graminit.h and Python/graminit.c
> + 	# from Grammar/Grammar using pgen
>    	@$(MKDIR_P) Include
> --	$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> -+	$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> - $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
> - 	touch $(GRAMMAR_C)
> +-	$(PGEN) $(srcdir)/Grammar/Grammar \
> ++	$(HOSTPGEN) $(srcdir)/Grammar/Grammar \
> + 		$(srcdir)/Include/graminit.h \
> + 		$(srcdir)/Python/graminit.c
>    
>   @@ -1121,27 +1122,27 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
>    			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
> diff --git a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch b/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
> deleted file mode 100644
> index 38e5377..0000000
> --- a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Upstream-Status: Backport
> -
> -Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> -
> -From 905d1b30ac7cb0e31c57cec0533825c8f170b942 Mon Sep 17 00:00:00 2001
> -From: Victor Stinner <victor.stinner@gmail.com>
> -Date: Mon, 9 Jan 2017 11:10:41 +0100
> -Subject: [PATCH] Don't use getentropy() on Linux
> -
> -Issue #29188: Support glibc 2.24 on Linux: don't use getentropy() function but
> -read from /dev/urandom to get random bytes, for example in os.urandom().  On
> -Linux, getentropy() is implemented which getrandom() is blocking mode, whereas
> -os.urandom() should not block.
> -
> -(cherry picked from commit 2687486756721e39164fa9f597e468c35d495227)
> ----
> - Python/random.c | 11 +++++++++--
> - 1 file changed, 9 insertions(+), 2 deletions(-)
> -
> -diff --git a/Python/random.c b/Python/random.c
> -index b4bc1f3..f3f5d14 100644
> ---- a/Python/random.c
> -+++ b/Python/random.c
> -@@ -94,8 +94,15 @@ win32_urandom(unsigned char *buffer, Py_ssize_t size, int raise)
> - }
> -
> - /* Issue #25003: Don't use getentropy() on Solaris (available since
> -- * Solaris 11.3), it is blocking whereas os.urandom() should not block. */
> --#elif defined(HAVE_GETENTROPY) && !defined(sun)
> -+   Solaris 11.3), it is blocking whereas os.urandom() should not block.
> -+
> -+   Issue #29188: Don't use getentropy() on Linux since the glibc 2.24
> -+   implements it with the getrandom() syscall which can fail with ENOSYS,
> -+   and this error is not supported in py_getentropy() and getrandom() is called
> -+   with flags=0 which blocks until system urandom is initialized, which is not
> -+   the desired behaviour to seed the Python hash secret nor for os.urandom():
> -+   see the PEP 524 which was only implemented in Python 3.6. */
> -+#elif defined(HAVE_GETENTROPY) && !defined(sun) && !defined(linux)
> - #define PY_GETENTROPY 1
> -
> - /* Fill buffer with size pseudo-random bytes generated by getentropy().
> diff --git a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
> index 669112d..90dcd57 100644
> --- a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
> +++ b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
> @@ -15,7 +15,7 @@ diff -ruN a/Makefile.pre.in b/Makefile.pre.in
>   +TESTOPTS=	-l -v $(EXTRATESTOPTS)
>    TESTPROG=	$(srcdir)/Lib/test/regrtest.py
>   -TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) -Wd -3 -E -tt $(TESTPYTHONOPTS)
> --test:		all platform
> +-test:		@DEF_MAKE_RULE@ platform
>   -		-find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
>   +TESTPYTHON=	$(RUNSHARED) $(BUILDPYTHON) -Wd -3 -E -tt $(TESTPYTHONOPTS)
>   +test:		build-test
> @@ -26,8 +26,8 @@ diff -ruN a/Makefile.pre.in b/Makefile.pre.in
>    		-$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
>    		$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
>    
> -+build-test:	all platform
> ++build-test:	@DEF_MAKE_RULE@ platform
>   +
> - testall:	all platform
> + testall:	@DEF_MAKE_RULE@ platform
>    		-find $(srcdir)/Lib -name '*.py[co]' -print | xargs rm -f
>    		$(TESTPYTHON) $(srcdir)/Lib/compileall.py
> diff --git a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
> index 951cb46..abab41e 100644
> --- a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
> +++ b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
> @@ -8,12 +8,12 @@ Upstream-Status: Pending
>   
>   --- Python-2.7.3.orig/Makefile.pre.in
>   +++ Python-2.7.3/Makefile.pre.in
> -@@ -1008,7 +1008,7 @@ LIBPL=		$(LIBP)/config
> +@@ -1187,7 +1187,7 @@
>    LIBPC=		$(LIBDIR)/pkgconfig
> -
> - libainstall:	all python-config
> +
> + libainstall:	@DEF_MAKE_RULE@ python-config
>   -	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); \
>   +	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC) $(BINDIR); \
> -	do \
> -		if test ! -d $(DESTDIR)$$i; then \
> -			echo "Creating directory $$i"; \
> + 	do \
> + 		if test ! -d $(DESTDIR)$$i; then \
> + 			echo "Creating directory $$i"; \
> diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.14.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python_2.7.13.bb
> rename to meta/recipes-devtools/python/python_2.7.14.bb
> index dbafb95..13455ff 100644
> --- a/meta/recipes-devtools/python/python_2.7.13.bb
> +++ b/meta/recipes-devtools/python/python_2.7.14.bb
> @@ -28,7 +28,6 @@ SRC_URI += "\
>     file://parallel-makeinst-create-bindir.patch \
>     file://use_sysroot_ncurses_instead_of_host.patch \
>     file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
> -  file://Don-t-use-getentropy-on-Linux.patch \
>     file://pass-missing-libraries-to-Extension-for-mul.patch \
>     file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
>   "



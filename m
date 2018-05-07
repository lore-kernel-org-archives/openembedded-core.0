Return-Path: <alejandr@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0083.outbound.protection.outlook.com [104.47.42.83])
	by mail.openembedded.org (Postfix) with ESMTP id 3774C71AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=t2G4UQDJmyrXbw6YVF11NxsXwE4b+hLQJ5J6TFmolus=;
	b=Tm4dcJ+uvuGFeWCO4hNoQR8kDsmWvvv+vlfqTFIijR1vXR8/vder2m7WrdG+5ZVI+npc8xa/J2P88TubZQrKrhVEC6zr3dmBjoQdvg5mmokoWjsI2Mv6m50W+DVcWIvQkUvsR8VXhiwN2a1M6+n+NHo7EatI1D+Oh3NH/fBF0+E=
Received: from CY4PR02CA0014.namprd02.prod.outlook.com (2603:10b6:903:18::24)
	by BY2PR02MB1671.namprd02.prod.outlook.com (2a01:111:e400:58f4::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.19;
	Mon, 7 May 2018 21:28:06 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by CY4PR02CA0014.outlook.office365.com
	(2603:10b6:903:18::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.735.17 via
	Frontend Transport; Mon, 7 May 2018 21:28:06 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.735.16
	via Frontend Transport; Mon, 7 May 2018 21:28:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fFnfx-0002aB-6b; Mon, 07 May 2018 14:28:05 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fFnfs-0001ag-3P; Mon, 07 May 2018 14:28:00 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w47LRxhV006337; Mon, 7 May 2018 14:27:59 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fFnfr-0001ac-AY; Mon, 07 May 2018 14:27:59 -0700
To: Francesco Giancane <francescogiancane8@gmail.com>
References: <CAEQ58sjQvtnCH1h20y8D6H3NVSbnCTqLe=pSLj6X8=xTL6KWbQ@mail.gmail.com>
	<CY4PR02MB3334657A081A9A23510452D1AC860@CY4PR02MB3334.namprd02.prod.outlook.com>
	<CAEQ58sj_699mSB4zaZ2e6APP7aKR2siZ7+j3qyxfCanPNZSgDw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <3ad68764-e349-9816-b579-b335f3724ba4@xilinx.com>
Date: Mon, 7 May 2018 14:27:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAEQ58sj_699mSB4zaZ2e6APP7aKR2siZ7+j3qyxfCanPNZSgDw@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(39860400002)(396003)(2980300002)(438002)(53754006)(189003)(199004)(11346002)(31696002)(39060400002)(6246003)(26005)(65806001)(65956001)(356003)(270700001)(6346003)(33964004)(77096007)(16586007)(106002)(37036004)(58126008)(186003)(53546011)(4326008)(336012)(426003)(486006)(446003)(316002)(36756003)(59450400001)(76176011)(2616005)(476003)(126002)(106466001)(63266004)(31686004)(84326002)(8936002)(345774005)(229853002)(2906002)(478600001)(5660300001)(65826007)(54896002)(6916009)(5890100001)(81166006)(8676002)(64126003)(9786002)(81156014)(236005)(1411001)(37363001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1671; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT007;
	1:P7kuiRypJmpKG9KjDXfCeITd7M+irvexesvik0bQh0Q984nOQOwTeNQNYRmVL8rvslRunDUY2ttUx/3CKjNNIlVORjEV3OU8LDxS1XuxcittT7LRoldG/Y7QlXYfTxmN
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY2PR02MB1671; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1671;
	3:mSw6UY/akQCmtdo4O4TGE0U2kr8HvN+HN9jrqOieE8hM9YLwkNlZ5A2T8NsON/+qe6vvR7GbflDvasiX3NUd1/sSkUlgiLz+D/VxiV/wCdQQAChP05NzZUlsXssb6d2XDtktPY26rzEvXioDEko6Q/c3uNIOVLan4pmy1i75QnrxGrTM2gCKvhBBVXZmBLoPWwNM/OK5ADfUJBVqaqH56YDD7ixvu2wWLIphPXGroMpq/xw2xgzTyRvc8CzKTyXg6de+KgX1kZZu2sS4b1xFT/fhhOq/OzKWV1f7jDG7Pi7AZO5tFlH9KvWu8EopfTap33b5mt8p4ZsY9XatvVK0maaESn/qrqVuzVRmL4Aq994=;
	25:oznOCHcNGHyAh+k1FtEPv6FUaev4/prfev2QXKbPnJHQj2ZTHU6o32a337LrVSZoTblqwH35IcIG4ugoG4lR961yi1O1520fHeUNbpfLzuPocdIpsvmC8k3CzLn2QRnycz9RVSfGULXaTSjXAn97eSzWciHvqplZylWknUTS9z2Zc+UzAKJP9rHyP0U5L05QhEJZf6j9dzL5c3COEneagmo30jjH13tPB5owLsj7/P0MkwDcK9fVVC0WRexXM10Y/2FMm0giwq9y2pjvU1R/zez5MYqlBSK7E+hSxzEFnqG/uxgw+GiO9cgq0/LpfNYYW9cGlqihO4e/wQyV5WMDmA==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1671:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1671;
	31:7ghAo9Qz8TrrmaPqCknObFvjZMIaNpQyIIJvy8BZ+X53UgYWQc9WZTlL7G6fxeg3mwoEaw+bOj05XoniSg798dHvfE1b7YS++AB9LvB6w1BygvwrX34OVdoarnEtUtdfBjaqEtkkhZpdymQrd1M7fA6JdqPp33F8LKCwRLqNHnKIrlJXHKCq0LrnOi86dDECEfpqydT4GeuODrbAzRO5j6x/obVs3+vtTmkwoUbgyNs=;
	20:Py1z7/orx7twFdlvy1pMBS1QuZXWQ2rLtEP7kLIz3KLcj/kw+tfPZfjYJA88G6uSOwHNzQv7pLa0wJ0U7Uvk4UlM4ttdSy2Yrg7kI2SWiRR1T1tW5X0aDPRo7zGcxfunSlYm8l3hnO/gctt0ac/1iBf1mTp0PZ6oDVBbMj781+tvmPZardlEw1wnpsacVwfiDTftx5gK7AQedTlYmnBM0MkFY9c0ySCOCuLuUFRXJqp7wDLNpVI/bAU4zpyjckibHiYJqxab02xDHonOYL+SLFC5ZeujG0r5Js4bdYI0VyjL8557YzpDqw1MBZHdJQg0Qwx//gjd46gBRunP4xD+ebWLbG08qlUMuqit9QZfrvryu4xoNRaf3veu2Y+7RUnzHo+ny8tMhUdjv9HwuN22sdt+j6w8YKjDNejrG0FqAnM9c5MN7vXCHd4oLaw689SDs7keDVCoDWXkKtQw0qwgbueL665lH++cA9HoT99MiSfKZ7AA1Icd2Asjf5T514XX
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1671B3A5387E23CDFB6A03B9AC9B0@BY2PR02MB1671.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(48706222282353)(85827821059158)(264703809997249)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(93006095)(93004095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1671; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1671; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1671;
	4:xsNUK3aAeH802ORSmP3BmSIeLzozYlLcDsZ8VlNSAaMUV0lw7jCIN6QRjxmejXz5YwaBcPO6DyerQa98c6WRuepuoSjW8hem0HCOZ1Ik001sSLetceHOYdLsl+Fy5fDtJx4lZYkTklF2XPfCb5R1d0tTPmaibKhpvIPlJPalAnzOnhRFOE5Iianjp1rXPZyrkR2Xy7UgGcFVDWEiey8aZfkZQ/3gIh5fDXPduIYhNlMQWRvrGG1bgasNH1ccc4cm/HLNnFU1Ior/lvjAQWT9FmHjbknURMPXAx6LVi8Cs7+4QADKeGFZigI/Wt1sPWtIaAJFs1Y1gLKGLCTyVXZdOoyDFwc9AwUMe7JHVwN9Ky9h4OqCiW+EmCeEOrODsxQu7uDRSP2hBA5RgS25zFx0YdoA0gW2ySjUsuVkn8k4hGc=
X-Forefront-PRVS: 066517B35B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1671;
	23:kjS0+x6Xt3O7YufhCjmWI7esoHkleESRqsTEovvtq?=
	=?us-ascii?Q?O59eHzcv2kv4Q8U2aR1jJzqz4VQMu2G3nYKcTsdjIhs0x3ArNCFYAZEmBSeM?=
	=?us-ascii?Q?bMYzFVVusR9IxtdHL2BnBeFFOkzMOfpMXugqeVzQVeAxj1/CshwsyOY3pGPv?=
	=?us-ascii?Q?5g/IB4T5qhArwnh5+JciiFXzT9J+jK1wuffGcJsRwb75QU2hTQjviPzzjg/J?=
	=?us-ascii?Q?HPcxh61UdByW9YDriOnphFmIPfkw6d3HFOGr+9fCKDMl7xfnZrDXCJ9yeQI9?=
	=?us-ascii?Q?tqyBkUAu4MC7u45QuZPjNlgcf9LbhntKsmx/A6mzqhf0tpxuDrCrJXu6yzHP?=
	=?us-ascii?Q?6KteP43BUVW38AyiVhWMk24XvxCAdhafEEsThGQJEH5sY5ZJaQS8pxK73sNp?=
	=?us-ascii?Q?5urBARR4orMcUSwkMsVJ7MSfhPP04q0SvtxpcMnqsnXIs6nSwOGvlkkpIWJV?=
	=?us-ascii?Q?DdfRodmA1mm1TONoJ49RonjJYHt3syhopThQukRtTZZiP1dPrMovCWqYHJ8z?=
	=?us-ascii?Q?0mfNEEfQnEbYWGISkL7Rv9VPIE2PmxXKjg54EdPriMc7Mimxz7HKjWJaChqX?=
	=?us-ascii?Q?mN/nre/3iAkgLSleECftvGIoCz2PNdR7+E0vrzj3tAPrxyzkOBLNz0dFfPd3?=
	=?us-ascii?Q?cPpodGU0yGeH2oVVCwtxkDc7eaF4TCPSrgsoGK7NGzRTz5dwyCgIaAje92St?=
	=?us-ascii?Q?vtCIZmN4S1B2QFzw7wWv8+r3hBdcKaAYQDE0QHOpfgpplmKB/yTU+DQo5q3r?=
	=?us-ascii?Q?QYVuFX5ED/xrCQYUxWZw6lwziDrRzyBQwOBJIeA0xChefNrQ3WsmuSYodruX?=
	=?us-ascii?Q?lL0Ctk9Bqv5GtJKxkzs4WyBdEaSUSo7S2K6/QPV90ag5aYbIIYY6KHumR8sJ?=
	=?us-ascii?Q?bsaflvT34vb6h3vfc7+qq8Vv5fSOCXitd/+eSri3SzXBnYUB7v9aKwy2JH+M?=
	=?us-ascii?Q?OgYwSwJFqI/djPLET95kp0v01oh/a6a/1h9o5cbmQyC1TWqNrowGf8q4FTEr?=
	=?us-ascii?Q?Ogbiby7TuGvIUwBN9cdHpbTJFuOo/x7lJtHIcQh+Mi318jRWbGM9BgDAStq8?=
	=?us-ascii?Q?ebsb344Rw01Fy9daPVqwUEt23pYlJbS6/44TM9rb2ywyE8zrnvgG7gIsqg4N?=
	=?us-ascii?Q?0/v07UhC2HDK4WmP82iKNCBoDwlpCOo3WVC2eC5FAA7Kl/yedrIzqx0J3uCg?=
	=?us-ascii?Q?Aa17DmA480k+h8XGB8YV/ft2dt8/Bh3f88ikaOPwc9FLv0Eb3ny4XO8+/YA0?=
	=?us-ascii?Q?KBpkP9YMuaCDiLgUqYWz0D1CMQkLM24tYt/w2yWpG+dhuXlzLboL5cyVYesk?=
	=?us-ascii?Q?EPSFEzxaTMci8xJuFM0bOJacC048yCwZ2eGpRkXAUBQFGxYm3PjT9dSTIwUG?=
	=?us-ascii?Q?o8BHNMjPt084p3Z3LIke3gBmSkwI2GHEJaAhjI3BLVhnWl+?=
X-Microsoft-Antispam-Message-Info: cLW5R0Rm7poyMFliGhVw3P0On+QH71KiM3dDH8mEgkEpn0VpD/ayjo0lkTim2scvLO1nGdcwtqsoBvUjcJuJ6aMeYmcuiST9XLno3XV1OmbwNrjHn6gQmOZlMhEUynG4ZQhw/FfSETVbC0nYo2hEvO5Rz+sVqNrpz1C00j+UvF7m9/4aU5pEWBTvyGb7cJYv
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1671;
	6:SwTbn1ltGf4X8VLenupe9xD+VOfxUxNAEOzaMLkJLWxqFnzVzrcdhXsY97nFO7Gl8lDEjmGwWpgKcJaY4rUEXuGKJ4rFjdTDUyE2xa5Ua/rJNfmnqgMx5X6GoeLmprEXnsTdh3XEHJ/1xSBlY9khZtjc+b7/NhnfgmC1rkHziyLpsFyksu8Zy+nW5KN/by2VJpHyaYMBrbWshyApRsWMnZv8Jx5DGtF/ynCuEy8Tbw1TEqX9Q722ZUdefNlLDdK6f1ZV1+DT1BkRSuGGD8hsbaNF1DK9F7Q86MQKleQ5DZraXy2QSok0ItyB7O//90k0wKNqQprf4XZrJou6BDnzVnsw9+kGU+mtuCvMK9wZ5USePRsACvwtqqfCe+8X4aTdH2qf2seBqE7MqtYISfYCsHk84eqkxwfhks8uOVJxm6ctkcRnYrYwjAoeqUVPlSO0rji0uLu/8l48q0WCraa2NA==;
	5:pQbjf/bvUfNKadykb4Jniplp+u8Nv8FUVkgyBF93Be9sYQZEIyZrCbc1PPQvteti4dOAd+oFVh4rF7rrW7H2G9E6g33ERtBhhVnsGlBNTY28MfJf1xLADblHqeDy3PANoXjAlx7bDLMLMxy9HxJ0vukBldXacC8KuGLVJDNEJjQ=;
	24:q/LEwOGMIImPGK+6yg1NwHlG5WjFHxUNmfvZMfPRMws1s/N8B4bCZ6R4bE9DbnHg2TkFQo9+EbjEiaEwFVVGh0AIC0YIMOgi/MSCcON4bag=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1671;
	7:cE8BQqAD5NwVAKIvkmoaE7VAdwJizV26CHUVlI/bOjeuYOBIqJxmDmXOYUXa88Vgmrbh4sFxLPPHfOrB4bak5po8vltZLIgmnl2NvPm7i1lslTrkfUFbu6Uw/SkTT4UdKkfWsvERizimxVj1lMePblZkrB5QlzcEAKdiLu1gqm7MD3bezAqBlLy8C4GBKpdP0+LQkmJLFRcLX+HgHc/QL/Ovd3AXE+ldoAF23VkN67YssCkDNTck0+M4NjSstVnX
X-MS-Office365-Filtering-Correlation-Id: b0278672-b9d3-49f1-e03b-08d5b4616c21
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2018 21:28:05.8029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0278672-b9d3-49f1-e03b-08d5b4616c21
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1671
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python recipes with extensions fail to find/link with proper libraries
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
X-List-Received-Date: Mon, 07 May 2018 21:42:47 -0000
Content-Type: multipart/alternative;
	boundary="------------F0D4731457C79CF853E9B6C7"
Content-Language: en-US

--------------F0D4731457C79CF853E9B6C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Francesco,


Please hit the reply-all button, otherwise I wont be getting notified 
when you reply.


I think you're doing something very specific since you're building on 
target and tweaking the build system so to help you more I would need to 
take a look at the recipes you are using.


Alejandro


On 05/04/2018 01:19 AM, Francesco Giancane wrote:
> Hi Alejandro,
>
> Thank you for your response.
> I know that openblas recipe is a pain, given that its Makefile is not 
> correctly written with respect to cross-compilation. However, the 
> library has been built locally on the target (sigh!) and then it is 
> being deployed with a recipe which unpacks the built binary and copy 
> them into the sys root.
>
> So, from the openblas side, everything is OK.
>
> What is actually wrong is the configuration step for python3-numpy and 
> python3-scipy: in the setup.py they are instructed to search for some 
> libraries (namely, openblas amongst them) but they fail to search for 
> them given that the path they are searching for is the sysroot-native, 
> rather than sysroot. (you can see it clearly from the logs attached in 
> the first message).
>
> Installing the packages using pip3 install scipy numpy on the target 
> results on a correct execution (and libraries are properly found and 
> linked).
>
> Thank you,
> Francesco Giancane
>
>
>
>
> Il giorno ven 4 mag 2018 alle ore 03:01 Alejandro Enedino Hernandez 
> Samaniego <alejandr@xilinx.com <mailto:alejandr@xilinx.com>> ha scritto:
>
>     Hello Francesco,
>
>     It would be helpful if you could provide more information about
>     this, e.g. access to your layer or your recipes, to make sure they
>     are actually being built correctly, also I would start by manually
>     linking it against the built library to see if the error is just
>     not having them on the correct path, but I seem to remember a lot
>     of issues when trying to cross compile openblas, specially for an
>     arm MACHINE.
>
>     Alejandro
>
>     *From:* openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>     [mailto:openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>] *On
>     Behalf Of *Francesco Giancane
>     *Sent:* Wednesday, May 2, 2018 2:33 PM
>     *To:* OE-core <openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>>
>     *Subject:* [OE-core] python recipes with extensions fail to
>     find/link with proper libraries
>
>     Hi Everyone,
>
>     I found a problem working with python(3) and C extensions.
>
>     The use-case is the recipe for python(3)-numpy, which can be
>     linked against a BLAS/LAPACK library to use accelerated matricial
>     and vectorial operations.
>
>     As it is currently shipped, the recipe fails to find any proper
>     library and then does not use extensions.
>
>     I wrote a custom recipe for openblas which is correctly built &
>     deploy using standard commands.
>
>     openblas is also added as a DEPENDS in a bbappend file for numpy.
>
>     However, the do_compile phase cannot find the aforementioned library.
>
>     Log attached:
>
>     DEBUG: Executing shell function do_compile
>
>     blas_opt_info:
>
>     blas_mkl_info:
>
>     customize UnixCCompiler
>
>       libraries mkl_rt not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     blis_info:
>
>     customize UnixCCompiler
>
>       libraries blis not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     openblas_info:
>
>     customize UnixCCompiler
>
>     customize UnixCCompiler
>
>       libraries openblas not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     atlas_3_10_blas_threads_info:
>
>     Setting PTATLAS=ATLAS
>
>     customize UnixCCompiler
>
>       libraries tatlas not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     atlas_3_10_blas_info:
>
>     customize UnixCCompiler
>
>       libraries satlas not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     atlas_blas_threads_info:
>
>     Setting PTATLAS=ATLAS
>
>     customize UnixCCompiler
>
>       libraries ptf77blas,ptcblas,atlas not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     atlas_blas_info:
>
>     customize UnixCCompiler
>
>       libraries f77blas,cblas,atlas not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     blas_info:
>
>     customize UnixCCompiler
>
>       libraries blas not found in
>     ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>
>       NOT AVAILABLE
>
>     blas_src_info:
>
>       NOT AVAILABLE
>
>       NOT AVAILABLE
>
>     ...And it is correct for it to fail as it is searching for
>     openblas in the wrong path (sysroot-native vs sysroot).
>
>     I would assume that this is a setuptools.bbclass issue, does
>     anyone know what to do? Is it trivial to fix?
>
>     I noticed that all the shipped python extensions were built as if
>     we were building for x86, even though the MACHINE is an arm target.
>
>     Thank you for your attention,
>
>
>     Francesco Giancane
>


--------------F0D4731457C79CF853E9B6C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hello Francesco,</p>
    <p><br>
    </p>
    <p>Please hit the reply-all button, otherwise I wont be getting
      notified when you reply.</p>
    <p><br>
    </p>
    <p>I think you're doing something very specific since you're
      building on target and tweaking the build system so to help you
      more I would need to take a look at the recipes you are using.<br>
    </p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 05/04/2018 01:19 AM, Francesco
      Giancane wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEQ58sj_699mSB4zaZ2e6APP7aKR2siZ7+j3qyxfCanPNZSgDw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Hi Alejandro,
        <div><br>
        </div>
        <div>Thank you for your response.</div>
        <div>I know that openblas recipe is a pain, given that its
          Makefile is not correctly written with respect to
          cross-compilation. However, the library has been built locally
          on the target (sigh!) and then it is being deployed with a
          recipe which unpacks the built binary and copy them into the
          sys root.</div>
        <div><br>
        </div>
        <div>So, from the openblas side, everything is OK.</div>
        <div><br>
        </div>
        <div>What is actually wrong is the configuration step for
          python3-numpy and python3-scipy: in the setup.py they are
          instructed to search for some libraries (namely, openblas
          amongst them) but they fail to search for them given that the
          path they are searching for is the sysroot-native, rather than
          sysroot. (you can see it clearly from the logs attached in the
          first message).</div>
        <div><br>
        </div>
        <div>Installing the packages using pip3 install scipy numpy on
          the target results on a correct execution (and libraries are
          properly found and linked).</div>
        <div><br>
        </div>
        <div>Thank you,</div>
        <div>
          <div>
            <div dir="ltr" class="gmail_signature"
              data-smartmail="gmail_signature">
              <div dir="ltr">
                <div dir="ltr">
                  <div>
                    <div dir="ltr">Francesco Giancane</div>
                    <div dir="ltr"><br>
                    </div>
                  </div>
                  <div><dd
style="margin:0px;padding:0px;border:0px;font-style:inherit;font-family:inherit;vertical-align:top;line-height:inherit;display:inline-block"><span
style="margin:0px;padding:0px;border:0px;font-style:inherit;font-family:inherit;vertical-align:baseline;line-height:inherit;direction:ltr"><br>
                      </span></dd>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">Il giorno ven 4 mag 2018 alle ore 03:01 Alejandro
          Enedino Hernandez Samaniego &lt;<a
            href="mailto:alejandr@xilinx.com" moz-do-not-send="true">alejandr@xilinx.com</a>&gt;
          ha scritto:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div link="#0563C1" vlink="#954F72" lang="EN-US">
            <div class="m_-8611667753301666364WordSection1">
              <p class="MsoNormal">Hello Francesco,</p>
              <p class="MsoNormal"> </p>
              <p class="MsoNormal">It would be helpful if you could
                provide more information about this, e.g. access to your
                layer or your recipes, to make sure they are actually
                being built correctly, also I would start by manually
                linking it against the built library to see if the error
                is just not having them on the correct path, but I seem
                to remember a lot of issues when trying to cross compile
                openblas, specially for an arm MACHINE.</p>
              <p class="MsoNormal"> </p>
              <p class="MsoNormal">Alejandro</p>
              <p class="MsoNormal"><a
                  name="m_-8611667753301666364__MailEndCompose"
                  moz-do-not-send="true"> </a></p>
              <span></span>
              <p class="MsoNormal"><b>From:</b> <a
                  href="mailto:openembedded-core-bounces@lists.openembedded.org"
                  target="_blank" moz-do-not-send="true">openembedded-core-bounces@lists.openembedded.org</a>
                [mailto:<a
                  href="mailto:openembedded-core-bounces@lists.openembedded.org"
                  target="_blank" moz-do-not-send="true">openembedded-core-bounces@lists.openembedded.org</a>]
                <b>On Behalf Of </b>Francesco Giancane<br>
                <b>Sent:</b> Wednesday, May 2, 2018 2:33 PM<br>
                <b>To:</b> OE-core &lt;<a
                  href="mailto:openembedded-core@lists.openembedded.org"
                  target="_blank" moz-do-not-send="true">openembedded-core@lists.openembedded.org</a>&gt;<br>
                <b>Subject:</b> [OE-core] python recipes with extensions
                fail to find/link with proper libraries</p>
              <p class="MsoNormal"> </p>
              <div>
                <p class="MsoNormal">Hi Everyone,</p>
                <div>
                  <p class="MsoNormal">I found a problem working with
                    python(3) and C extensions.</p>
                </div>
                <div>
                  <p class="MsoNormal"> </p>
                </div>
                <div>
                  <p class="MsoNormal">The use-case is the recipe for
                    python(3)-numpy, which can be linked against a
                    BLAS/LAPACK library to use accelerated matricial and
                    vectorial operations.</p>
                </div>
                <div>
                  <p class="MsoNormal"> </p>
                </div>
                <div>
                  <p class="MsoNormal">As it is currently shipped, the
                    recipe fails to find any proper library and then
                    does not use extensions.</p>
                </div>
                <div>
                  <p class="MsoNormal"> </p>
                </div>
                <div>
                  <p class="MsoNormal">I wrote a custom recipe for
                    openblas which is correctly built &amp; deploy using
                    standard commands.</p>
                </div>
                <div>
                  <p class="MsoNormal">openblas is also added as a
                    DEPENDS in a bbappend file for numpy.</p>
                </div>
                <div>
                  <p class="MsoNormal"> </p>
                </div>
                <div>
                  <p class="MsoNormal">However, the do_compile phase
                    cannot find the aforementioned library.</p>
                </div>
                <div>
                  <p class="MsoNormal"> </p>
                </div>
                <div>
                  <p class="MsoNormal">Log attached:</p>
                </div>
                <div>
                  <p class="MsoNormal"> </p>
                </div>
                <div>
                  <div>
                    <p class="MsoNormal">DEBUG: Executing shell function
                      do_compile</p>
                  </div>
                  <div>
                    <p class="MsoNormal">blas_opt_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">blas_mkl_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries mkl_rt not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">blis_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries blis not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">openblas_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries openblas not found
                      in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">atlas_3_10_blas_threads_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">Setting PTATLAS=ATLAS</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries tatlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">atlas_3_10_blas_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries satlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">atlas_blas_threads_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">Setting PTATLAS=ATLAS</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries
                      ptf77blas,ptcblas,atlas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">atlas_blas_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries f77blas,cblas,atlas
                      not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">blas_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  libraries blas not found in
['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">blas_src_info:</p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">  NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">...And it is correct for it to
                      fail as it is searching for openblas in the wrong
                      path (sysroot-native vs sysroot).</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">I would assume that this is a
                      setuptools.bbclass issue, does anyone know what to
                      do? Is it trivial to fix?</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">I noticed that all the shipped
                      python extensions were built as if we were
                      building for x86, even though the MACHINE is an
                      arm target.</p>
                  </div>
                  <div>
                    <p class="MsoNormal"> </p>
                  </div>
                  <div>
                    <p class="MsoNormal">Thank you for your attention,</p>
                  </div>
                  <div>
                    <p class="MsoNormal"><br clear="all">
                    </p>
                    <div>
                      <div>
                        <div>
                          <div>
                            <div>
                              <div>
                                <p class="MsoNormal">Francesco Giancane</p>
                              </div>
                            </div>
                            <div>
                              <p class="MsoNormal"
                                style="margin-left:.5in;vertical-align:top"><span
style="font-family:&quot;inherit&quot;,serif"> </span></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F0D4731457C79CF853E9B6C7--

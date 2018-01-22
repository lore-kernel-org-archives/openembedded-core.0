Return-Path: <alejandr@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0074.outbound.protection.outlook.com [104.47.41.74])
	by mail.openembedded.org (Postfix) with ESMTP id 17F7A6025F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=l9VQaKzve5p0UeSJokBC2t/PcjVr+W6WVsLw2IUFeII=;
	b=4thAb69tCf0FsxMBxlv/c0hk3wt18/AdkxcUaxRF722VjSQMWVD2PRQFvJBiTs+UXwUMK2YAh3oZ+6S51te8SUkhG2cqBMnj5evfksVMlzl71AlSjq5xs2FvpTpNrIr7JI5ofLeVPYTangYyyaPCFRPbMFWatWTzpTaQru/Ds6Q=
Received: from MWHPR0201CA0024.namprd02.prod.outlook.com (10.167.160.165) by
	MWHPR02MB3279.namprd02.prod.outlook.com (10.164.187.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Mon, 22 Jan 2018 19:02:10 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by MWHPR0201CA0024.outlook.office365.com
	(2603:10b6:301:74::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.428.17 via
	Frontend Transport; Mon, 22 Jan 2018 19:02:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.428.12
	via Frontend Transport; Mon, 22 Jan 2018 19:02:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1edhM8-0001JV-If; Mon, 22 Jan 2018 11:02:08 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1edhM8-0001PK-Gg; Mon, 22 Jan 2018 11:02:08 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1edhM8-0001PE-0P; Mon, 22 Jan 2018 11:02:08 -0800
To: <openembedded-core@lists.openembedded.org>
References: <151648753376.31338.5162580593839986526@git.openembedded.org>
	<20180120223214.154D0235ED4@git.openembedded.org>
	<CA+chaQfjbbdUsuvpBrmz2R9fo0A98p7dPo9LzYxYA+fwX+8KNQ@mail.gmail.com>
	<CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <bf7a1c1e-1414-3c2f-e9f6-a4e690a9d8d6@xilinx.com>
Date: Mon, 22 Jan 2018 11:02:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23612.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(39860400002)(39380400002)(2980300002)(438002)(52314003)(199004)(189003)(81166006)(2351001)(5660300001)(966005)(8676002)(83506002)(4326008)(65826007)(2950100002)(1720100001)(106002)(36756003)(336011)(8936002)(84326002)(6916009)(236005)(16586007)(64126003)(54896002)(6306002)(37036004)(31696002)(316002)(76176011)(33964004)(59450400001)(53546011)(81156014)(16200700003)(39060400002)(270700001)(478600001)(106466001)(93886005)(6246003)(58126008)(2906002)(53946003)(229853002)(65956001)(356003)(26005)(606006)(9786002)(65806001)(77096007)(31686004)(53386004)(107986001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3279; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT056;
	1:6Ib0i6kY3A5tdeZk7Me8pG0go4uMLAQRQDNRFOH3UvfyEDPJCzID+KMcHIY2JmrW78ZBe9pZNhSl7ODYbYy8wE6y/SobTgPENntHM4d/1qX2WfjkxwSt+fK3AAVgVSbW
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32d388c1-c81b-476e-54db-08d561caa36d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:MWHPR02MB3279; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	3:NyOw/0iYgP9xElV/M1rz5Re8t0YkhsvY52MVLg5+JU9HtVlVrtE0uQ1Crzyfqxyfa5lstvBIR0JIkppmG+MvnCp8dVRRdhMCSpiI12ZW8YZl6M3prUma4sEavGKIHJpjwLb7u6WtQQCT5eg63M7rCaqabiiaUTpJexuHv7LZnsosnXQnTHo1R5tPN5EbT8rrNUDvtU8bCOuK5r+GhavXZF0NQm1ZMXQnLzhpVR8nLOCjS9139wkVL0mZSwjw2lkn8gUWlBrqGjNJ4WijXnx1fDHqTA0BQfXo+/vEJjbA6J1qt3ENdd7bdH5MvX42y+e8HB1bIazgv8pU/ei13spSAozSKGA7ZBJ6qfzR08Ehqms=;
	25:foREdITZQqC46qHg6U3E7JqeexplBNxnPwQhZJX0AAyvVsjyHV3yaj36Hgf5bZtVl8R9GDNDeC/6mWYDa6vvg/zhKSwZpdjbQpuOrbDA+tFFJVWNYreA3i2Fx759O556KBEEh8RtHC0iKPEm6sFieBqOCou6UlkXktVRdkL2fZYfDWd742+PfTVijr2ZPjIp1U+miQj3M1kUj/MEDEtPO8y3IZmo2joRt2dbHAyjY3+1BqEHPtgaA8ryMt9RLk2xp0DPMutZcfJkDzNXYHo73vNyfZObC8vhiIU25jT7oMV8RjgAwhhGmiroICVg8PJ+APrsDde5KKyRMG7wA99aIA==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3279:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	31:PRTI/6HhckYpV/p5tNlUsDXkELyiLclkvMRAQKVesEWNLgZtsGFdzmOQB4jveNKr7RtlwDfcmJT/4v4VH+FsxmaxsduLlnN9pzO2bp+fk6tjB47LMIQZY5k6nUZ5LEC6tLsh7IW06lToglIBcliE9Ry//O80QyWW2iBgCoJdJlPxVrk9vT5XsXEgJfJnDb1DEqarqbzJeOi/9tUbi8QpalUr2KGZcCc2y9BO6UiRiYQ=;
	20:t94JRODTG8uwY4rZSz744ONlAMZmviAehD8fr/StsFqn2KWs9o48V36iQnSEVhHVzkx/W1Q+7fIUMVbO9W+C4e+5j9XXD3jwZOBb8I6P7gM6pjlDRSImbahlYpoEVLT9Ola4g5xt0jJ2rqej5+TJ+niGFtbfhUu8lf/JemsSjk4Uwrf6w/Gj02vcG4VfJaS853f+/aaXtpvzDrEX7HYC93lUl0AKjZw/G2D79IJEW1d7874MOaA637jjxPmW6pvVCj0Z8Zp0HlBQLMww+J4VRxZdWo+jWPpDIBpXliA3C7AuR8BZiaW/2vbVjKk1LOAfgvANK4qerYgmL1a8QgHVtxrI3fuJtfLVRknkMnMBYgFKUOyXpzpKhxqZ6/btFm3GQPjSnPRK3Q2hns1JRwNlPoXV096ir8KUus17un5RnS2I2WpX1t/UbBjkwws2CLtpv859lA5X07Ox4ehIUf+h94/Rek/afXxcBmWQnHb/E8rC1Gc+XReniI6++l/T6rAF
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB32799A42D3D401B9BBB39BA1ACEC0@MWHPR02MB3279.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(788757137089)(264703809997249)(48300812402016)(228905959029699)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231023)(2400081)(944501161)(3002001)(10201501046)(93006095)(93004095)(6055026)(6041288)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(6072148)(201708071742011);
	SRVR:MWHPR02MB3279; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR02MB3279; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	4:lCatYLvC+EnsgU81tXPvzJdEu2XCL+iZomkt3cMOjum+ml21fUQuudZ+2KPnwv5pZFaisrdiqIjUY5vNw0lfwXwK0Uod3ZCkBTfHhy5267yLej0gJ9G2QgaFDpG7WtiS6DSQ6CQ7iOPt1s04q0kIvk4JhZ3JjARL6plJrEd/FYmMSPlK2XSn6r8yjEH5Hfj0fwyfqyqUHnja3pNjbADToi0dtVqZoqD5E/TE5V/TY+tlRhBbkQD2amtiPtFyTfdM849GVlCiL0TWteKLriYw7WzniwVgFLvzFD2hjjeq5fGC+lEvANXxP2ZSjci3dZnnbGKrSep9gkDCLiiV9WJwKfTaTPPbaZ0vFWnXAUKq62/qpLrQ33y6hO7d2FO8u8/XHOkLRlI/0kfYcpLKhqk5ee2jAf/wR2YKS61SfChwFeR0Yx2SMZ2huFmC2pBKtxf0N4h0HzcJ0FYQ8L1C+bjGqFcqqRua9w2/y5hGa/ISAFU=
X-Forefront-PRVS: 0560A2214D
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3279;
	23:JW6vFSLpPmdHpJJjg/2JfV8r+e5UE3HPxHYld/gKv?=
	=?us-ascii?Q?E8VstA7IAbbk/ExrzXLinrrAqPpQbrvano1XmMVokCUQW5wgcrYv9DQEo4ZO?=
	=?us-ascii?Q?ISPoZiVjBmZtKBI3n4I4lPuBywkcN1Ot+yXh5DXoglGA1tPVyOtp4/zVyGdx?=
	=?us-ascii?Q?tHYuPy41xyaVxo3x4ypJH4ROrNd2Da9y2a9PFp1IviQpf4Uiyms6jS4yxZCa?=
	=?us-ascii?Q?K4rG8sGy0YTMREgAptAhMy6b+JerXPi9MDkqWEYaPwlc26eIYunPL8aLpyU8?=
	=?us-ascii?Q?PVXFSBKCR8RJnrqoObzA+Qyk5OvC8PBb8FTn1Wqk7qRlwCSx4aOOAqD6d1+3?=
	=?us-ascii?Q?PuCmu2q2YoCgLnsSWpLvYf1kt1tfAnoMhq4BxneAawTINcQduTN9FMZZG55Z?=
	=?us-ascii?Q?GQPGqXr8EwQ7UJibBesFEJumn2SUnCCz1N6KNQ8Klpnu3KleCFUb77zpN+6i?=
	=?us-ascii?Q?xwEuaZ9YZNejhlfD7DrHLtjZkT5dzZMACTms4+BFvDOisx8spAMZzykRHwdh?=
	=?us-ascii?Q?Ii8/HUgwDIDbh0c/rjUNJg7mK9h6+f+T+XPKzHGF537KylQpQljsCo+frEnE?=
	=?us-ascii?Q?3gdBWJdePi22kIucASPMY+acVuEgYwycbCTLumexOK87mTdnXmqPUZ+XDv3u?=
	=?us-ascii?Q?mN/7gzmnc+ZIK37dzqMH0ySlo1iKA89EnfSICwI71pbeEV+KG/sKpCpJ72uN?=
	=?us-ascii?Q?Pu1iU5SckDr2BqyWIcL7M6EnUEqJobqg4Yr4Q+TFn+493oKP7WUBnLqeDvpM?=
	=?us-ascii?Q?Y6pvik9ngU9nKsHTQJNVYP0xeMXgL8DnDsMHcAZnhNDbIh00rns5yCoCDR7r?=
	=?us-ascii?Q?Zcvg9fGh8CqGcyy79g4TIFFNuPKIz2MtnfYzDwn4saYjVw5nXP9eaOeWhRHZ?=
	=?us-ascii?Q?daF6LdQdp7t/7jLf/BVCQFwd7ynO1+jPiOZPpgIBKexDVvuCkUL899MfuIQc?=
	=?us-ascii?Q?IoZmp00AAA0dAELIrYufFcUIDtyCzAycyZ0ZA9sJORJIy3iR6wd89cbJAq87?=
	=?us-ascii?Q?ZZKOYJNiijiZiBKYuGPhlCbLLi6/qCohidDFZuPMT31TZmz96F9h4FCplXwp?=
	=?us-ascii?Q?nCkXWg2CxfdsnwY5TMVryBfr9ehoQ8c8ETYB50O8fe+QmqS/2YqkU6G+MLih?=
	=?us-ascii?Q?Z6+TptWreBYXmLtdY4BbRQgTkyTpQmc9q7/hnKaTjNEt/nkm+aicA4HBKG6J?=
	=?us-ascii?Q?76aZRIpImmdt/UvrFhDT9VQoo6mAUhkGv8lfU1XwxZ6xN7avwsTWVxl2Fhah?=
	=?us-ascii?Q?1J8fsS0CyFLsPnO4l49ee3qHius+IOry8Xn9fzKyHOD8jOAde2dwCBzkOXzn?=
	=?us-ascii?Q?ZCcRjAe95YoIDCQGsA4T4aCotru9tE4KLxi2J5PXfGreFrzoBecFlYigHTzL?=
	=?us-ascii?Q?mi13LXlt4KB8q9s0InH4buUAT8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	6:OzuITCHZgf6r4sjc6LGP313UYafURiOQdql9clIXxXYN62bpz87zjA6jDAwsDdcdQlOeh0SCUASes8vo65BgVP/gObMqdUQGesp1uSM6UAx1eEnNZhz2+AtPJ4yMDvZ3vrEhLAyYhM4UewigFRAtB/AnHutMMD9gbe1XYGgrYyZ8O6TTdfZ0OLRjjXE6C07VhGxPNwgIh8D7xxNWe85NKnCghaj2IDfAKvJs76E1LrtjDDgT+IoaRBnLQT8kDDY3/w3OsdM4Ld2NAWxL8/SELqK9KcGsB0jj8aQRxlVcdvMM6nd6k8psVOkWzPpJMPEiEhGGawl1S/KpfRW7dqbPQZ1Zu+LiWmjWGL5nK8MnBaw=;
	5:XSNIm6lFoiJtVL3YNf1+50VTAJ+tbgI8NVZ+lCveMABwdCup1aL1G5BZIbHYj0/rQ0kl2Y84fotA//nl8sQun7DRE1fr5+WBRbg0uTmu+rP3WEpH/a3TSLzzGIxEDX19GcatQhzKDMkh7LSoNnN38UoYOLBxkrw+AZrxeS3wiLU=;
	24:aZRR1u6SpjQd31Uy3DZjtEMAiPYv1yvbgzuIS+Guqvo2xRi1Z06ptNcmV8asghkkdaJpBjT9V8BWFBw5jYkX6qBK6BVwjFyL2PbOnKZkzRE=;
	7:1BpoTbAlU4eycX/X8KawD48ESp21VelEaCYguBreLXHkhzfkW3mx/e11KB5WTryCjrZOGL3R5ZceHIdjyXnCAfal1Mc8j3PLV+h0092KyRiFs/vnk0xN1NlODuS6+3nCFBhfmIcaO5cDwe2QqY9Lc6aqGQVJWxNp+eaX6qX7GMkQ2lQdsEZ9lbb8xZ7SMFaFc6e/pQPkwY0cY+0tuPQuzx4zmkYQ2CDTxGeo7exiNGVe4SOwP1/VG9N1WfneOr5j
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2018 19:02:09.0463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d388c1-c81b-476e-54db-08d561caa36d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3279
Subject: Re: [oe-commits] [openembedded-core] 01/06: python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Mon, 22 Jan 2018 19:16:56 -0000
Content-Type: multipart/alternative;
	boundary="------------7D93273BE0C84CD862606270"
Content-Language: en-US

--------------7D93273BE0C84CD862606270
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Martin,


On 01/21/2018 07:13 AM, Martin Jansa wrote:
> And few more detected in test-signatures.sh:
>
> ERROR: Nothing RPROVIDES 'python3-enum' (but 
> meta-oe/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb 
> <http://python3-automat_0.6.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb 
> <http://python3-asn1crypto_0.24.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-pymongo_3.6.0.bb 
> <http://python3-pymongo_3.6.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb 
> <http://python3-netaddr_0.7.19.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb 
> <http://python3-pyserial_3.4.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-langtable_0.0.38.bb 
> <http://python3-langtable_0.0.38.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb 
> <http://python3-hyperlink_17.3.1.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-click_6.7.bb 
> <http://python3-click_6.7.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb 
> <http://python3-prompt-toolkit_1.0.15.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-decorator_4.1.2.bb 
> <http://python3-decorator_4.1.2.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-serpent_1.23.bb 
> <http://python3-serpent_1.23.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-dnspython_1.15.0.bb 
> <http://python3-dnspython_1.15.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb 
> <http://python3-jsonpatch_1.21.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb 
> <http://python3-sqlalchemy_1.1.15.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb 
> <http://python3-ntplib_0.3.3.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb 
> <http://python3-whoosh_2.7.4.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-ply_3.10.bb 
> <http://python3-ply_3.10.bb> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-enum' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-enum']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable 
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 
> 'python3-automat', 'python3-enum']
>
> ERROR: Nothing RPROVIDES 'python3-importlib' (but 
> meta-oe/meta-python/recipes-devtools/python/python3-django_1.11.9.bb 
> <http://python3-django_1.11.9.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb 
> <http://python3-pyroute2_0.4.21.bb>
> meta-oe/meta-python/recipes-devtools/python/python3-can_2.0.0.bb 
> <http://python3-can_2.0.0.bb> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-importlib' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-importlib']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable 
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 
> 'python3-django', 'python3-importlib']
>
> ERROR: Nothing RPROVIDES 'python-importlib' (but 
> meta-oe/meta-python/recipes-devtools/python/python-django_1.11.9.bb 
> <http://python-django_1.11.9.bb>
> meta-oe/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb 
> <http://python-pyroute2_0.4.21.bb>
> meta-oe/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb 
> <http://python-pandas_0.22.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb 
> <http://python-astroid_1.6.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb 
> <http://python-dbusmock_0.16.7.bb>
> meta-oe/meta-python/recipes-devtools/python/python-can_2.0.0.bb 
> <http://python-can_2.0.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python-pyserial_3.4.bb 
> <http://python-pyserial_3.4.bb>
> meta-oe/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb 
> <http://python-pygobject_3.22.0.bb>
> meta-oe/meta-python/recipes-devtools/python/python-behave_1.2.5.bb 
> <http://python-behave_1.2.5.bb> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python-importlib' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-importlib']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable 
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 
> 'python-django', 'python-importlib']
>
>
> On Sun, Jan 21, 2018 at 10:00 AM, Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     Hello,
>
>     The last paragraph in commit message looks like it should be
>     backwards compatible right?
>
>     Then there might be some bug somewhere, because in my builds
>     (which use only very few python packages) there are few runtime
>     dependencies which cannot be satisfied anymore:
>     python-man
>     python-readline
>     python3-textutils
>

Its backwards compatible, in the way that the usage should be the same, 
in this case, this sort of failures are expected, since the mentioned 
packages: enum, readline, textutils no longer exist, and they should 
never have existed in the first place, they were always required to get 
a minimal python working, so they are now part of python(3)-core, which 
means the dependencies are actually met but recipes which RDEPEND on 
them should be modified , please see 
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7aaffbede46ce352b91c7a5c5f825a6f3b5b1c2e 
regarding some of the RDEPEND fixes on oe-core, I expect there should be 
several like this for meta-python.

>
>     Also probably related to this I've seen python(3)-smbus recipes
>     failing to build now with:
>     smbusmodule.c:192:48: error: 'I2C_SMBUS_WRITE' undeclared (first
>     use in this function); did you mean 'I2C_SMBUS'?
>

I dont know if the same applies for smbus but I will check.

Cheers,

Alejandro

>
>     Regards,
>
>     On Sat, Jan 20, 2018 at 11:32 PM, <git@git.openembedded.org
>     <mailto:git@git.openembedded.org>> wrote:
>
>         This is an automated email from the git hooks/post-receive script.
>
>         rpurdie pushed a commit to branch master
>         in repository openembedded-core.
>
>         commit 6959e2e4dba5bbfa6ffd49c44e738cc1c38bc280
>         Author: Alejandro Hernandez
>         <alejandro.hernandez@linux.intel.com
>         <mailto:alejandro.hernandez@linux.intel.com>>
>         AuthorDate: Tue Jun 20 14:11:44 2017 -0700
>
>             python: Restructure python packaging and replace it with
>         autopackaging
>
>             The reason we have a manifest file for python is that our
>         goal is to
>             keep python-core as small as posible and add other python
>         packages only
>             when the user needs them, hence why we split upstream
>         python into several
>             packages.
>
>             Although our manifest file has several issues:
>              - Its unorganized and hard to read and understand it for
>         an average
>                human being.
>              - When a new package needs to be added, the user actually
>         has to modify
>                the script that creates the manifest, then call the
>         script to create
>                a new manifest, and then submit a patch for both the
>         script and the
>                manifest, so its a little convoluted.
>              - Git complains every single time a patch is submitted to
>         the manifest,
>                since it violates some of its guidelines.
>              - It changes or may change with every release of python,
>         its impossible
>                to know if the required files for a certain package
>         have changed
>                (it could have more or less dependencies), the only way
>         of doing so
>                would be to install and test them all one by one on
>         separate individual
>                images, and even then we wouldnt know if they require
>         less dependencies,
>                we would just know if an extra dependency is required
>         since it would
>                complain, lets face it, this isnt feasible.
>              - The same thing happens for new packages, if someone
>         wants to add a
>                new package, its dependencies need to be checked
>         manually one by one.
>
>             This patch fixes those issues, while adding some
>         additional features.
>
>             Features/Fixes:
>
>              - A new manifest format is used (JSON), easy to read and
>         understand.
>                This file is parsed by the python recipe and python
>         packages read
>                from here are passed directly to bitbake during parsing
>         time.
>              - It provides an automatic manifest creation task
>         (explained below),
>                which automagically checks for every package
>         dependencies and adds
>                them to the new manifest, hence we will have on each
>         package exactly
>                what that package needs to be run, providing finer
>         granularity.
>              - Dependencies are also checked automagically for new
>         packages (explained below).
>              - Fixes the manifest in the following ways:
>                * python-core should be base and all packages should
>         depend on it,
>                  fixes lang, string, codecs, etc.
>                * Fixes packages with repeated files (e.g. bssdb and db, or
>                  netclient and mime, and many others).
>              - Sitecustomize was fixed since encoding was deprecated.
>              - The JSON manifest file invalidates bitbake's cache, so
>         if it changes
>                the python package will be rebuilt.
>              - It creates a solution for users that want precompiled
>         bytecode files
>                (*.pyc) INCLUDE_PYCS = "1" can be set by the user on
>         their local.conf to
>                include such files, some argument they get faster boot
>         time, even when the
>                files would be created on their first run?, but they
>         also sometimes give a
>                magic number error and take up space, so we leave it to
>         the user to
>                decide if they want them or not.
>              - Fixes python-core dependencies, e.g.
>                When python is run on an image, it TRIES to import
>         everything it needs,
>                but it doesnt necessarily fails when it doesnt find
>         something, so even if
>                we didnt know, we had errors like (trimmed on purpose):
>                # trying /usr/lib/python2.7/_locale.so
>                # trying /usr/lib/python2.7/lib-dynload/_locale.so
>                # trying /usr/lib/python2.7/_sysconfigdata.so
>
>                while it didnt complain about _locale it should have
>         imported it,
>                after creating a new manifest with the automated script
>         we get:
>
>                # trying /usr/lib/python2.7/lib-dynload/_locale.so
>                dlopen("/usr/lib/python2.7/lib-dynload/_locale.so", 2);
>                import _locale # dynamically loaded from
>         /usr/lib/python2.7/lib-dynload/_locale.so
>
>             How to use (after a new release of python, or maybe before
>         every OE
>             release):
>              - A new task called create_manifest was added to the
>         python package,
>                which may be invoked via:
>
>              $ bitbake python -c create_manifest
>
>              This task runs a script on native python on our HOST
>         system, and since
>              the python and python-native packages come from the same
>         source, we can
>              use it to know the dependencies of each module as if we
>         were doing it
>              on an image, this script is called create_manifest.py and
>         in a very
>              simplistic way it does the following:
>
>              1. Reads the JSON manifest file and creates a dictionary
>         data structure
>                 with all of our python packages, their FILES, RDEPENDS
>         and SUMMARY.
>              2. Loops through all of them and runs every module listed
>         on them
>                 asynchronously, determining every dependency that they
>         have.
>              3. These module dependencies are then handled, to be able
>         to know which
>                 packages contain those files and which should RDEPEND
>         on one another.
>              4. The data structure that comes out of this, is then
>         used to create a
>                 new manifest file which is automatically copied onto
>         the user's python
>                 directory replacing the old one.
>
>              Create_manifest script features:
>              - Handles modules which dont exist anymore (new release
>         for example).
>              - Handles modules that are builtin.
>              - Deals with modules which were not compiled (e.g. bsddb
>         or ossaudiodev)
>              - Deals with packages which include folders.
>              - Deals with packages which include FILES with a wildcard.
>              - The manifest can be constructed on a multilib
>         environment as well.
>              - This method works for both python modules and shared
>         libraries used
>                by python.
>
>             How to add a new package:
>              - If a user wants to add a new package all that has to be
>         done is
>                modify the python2-manifest.json file, and add the
>         required file(s)
>                to the FILES list, the script should handle all the rest.
>                Real example:
>                We want to add a web browser package, including the
>         file webbrowser.py
>                which at the moment is on python-misc.
>                "webbrowser": {
>                    "files":
>         ["${libdir}/python2.7/lib-dynload/webbrowser.py"],
>                    "rdepends": [],
>                    "summary": "Python Web Browser support"}
>
>              Run bitbake python -c create_manifest and the resulting
>         manifest
>              should  be completed after a few seconds, showing
>         something like:
>                "webbrowser": {
>                   "files": ["${libdir}/python2.7/webbrowser.py"],
>                   "rdepends":
>         ["core","fcntl","io","pickle","shell","subprocess"],
>                   "summary": "Python Web Browser support"}
>
>             Known errors/issues:
>              - Some special packages are handled differently: core, misc,
>                modules,dev, staticdev.
>                All these should be handled manually, because they
>         either include
>                binaries, static libraries, include files, etc.
>         (something that we
>                cant import).
>                Specifically static libraries are not not supported by
>         this method
>                and have to be handled by the user.
>              - The change should be transparent to the user, other
>         than the fact
>                that now we CANT build python-foo (it was pretty dumb
>         anyway, since
>                what building python-foo actually did was building the
>         whole python
>                package anyway), but doing IMAGE_INSTALL_append = "
>         python-foo"
>                would create an image with the requested package with
>         no issues.
>
>             [YOCTO #11510] [YOCTO #11694] [YOCTO #11695]
>
>             Signed-off-by: Alejandro Hernandez
>         <alejandro.hernandez@linux.intel.com
>         <mailto:alejandro.hernandez@linux.intel.com>>
>             Signed-off-by: Ross Burton <ross.burton@intel.com
>         <mailto:ross.burton@intel.com>>
>         ---
>          .../python/python-2.7-manifest.inc    |  840 ----------------
>          .../python/python-native-2.7-manifest.inc   |    9 -
>          .../python/python-native_2.7.13.bb
>         <http://python-native_2.7.13.bb>                |   24 +-
>          .../python/python/create_manifest2.py   |  277 ++++++
>          .../python/python/get_module_deps2.py   |  112 +++
>          .../python/python/python2-manifest.json   | 1032
>         ++++++++++++++++++++
>          .../python/python/sitecustomize.py    |    8 -
>          meta/recipes-devtools/python/python_2.7.13.bb
>         <http://python_2.7.13.bb>     |   88 +-
>          scripts/contrib/python/generate-manifest-2.7.py
>         <http://generate-manifest-2.7.py>   |  426 --------
>          9 files changed, 1528 insertions(+), 1288 deletions(-)
>
>         diff --git
>         a/meta/recipes-devtools/python/python-2.7-manifest.inc
>         b/meta/recipes-devtools/python/python-2.7-manifest.inc
>         deleted file mode 100644
>         index 7c3fc1b..0000000
>         --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
>         +++ /dev/null
>         @@ -1,840 +0,0 @@
>         -
>         -# WARNING: This file is AUTO GENERATED: Manual edits will be
>         lost next time I regenerate the file.
>         -# Generator:
>         './scripts/contrib/python/generate-manifest-2.7.py
>         <http://generate-manifest-2.7.py>' Version 20110222.2 (C)
>         2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de
>         <mailto:mlauer@vanille-media.de>>
>         -
>         -
>         -
>         -PROVIDES+=" \
>         -  ${PN}-2to3 \
>         -  ${PN}-argparse \
>         -  ${PN}-audio \
>         -  ${PN}-bsddb \
>         -  ${PN}-codecs \
>         -  ${PN}-compile \
>         -  ${PN}-compiler \
>         -  ${PN}-compression \
>         -  ${PN}-contextlib \
>         -  ${PN}-core \
>         -  ${PN}-crypt \
>         -  ${PN}-ctypes \
>         -  ${PN}-curses \
>         -  ${PN}-datetime \
>         -  ${PN}-db \
>         -  ${PN}-debugger \
>         -  ${PN}-dev \
>         -  ${PN}-difflib \
>         -  ${PN}-distutils \
>         -  ${PN}-distutils-staticdev \
>         -  ${PN}-doctest \
>         -  ${PN}-email \
>         -  ${PN}-fcntl \
>         -  ${PN}-gdbm \
>         -  ${PN}-hotshot \
>         -  ${PN}-html \
>         -  ${PN}-idle \
>         -  ${PN}-image \
>         -  ${PN}-importlib \
>         -  ${PN}-io \
>         -  ${PN}-json \
>         -  ${PN}-lang \
>         -  ${PN}-logging \
>         -  ${PN}-mailbox \
>         -  ${PN}-math \
>         -  ${PN}-mime \
>         -  ${PN}-mmap \
>         -  ${PN}-multiprocessing \
>         -  ${PN}-netclient \
>         -  ${PN}-netserver \
>         -  ${PN}-numbers \
>         -  ${PN}-pickle \
>         -  ${PN}-pkgutil \
>         -  ${PN}-plistlib \
>         -  ${PN}-pprint \
>         -  ${PN}-profile \
>         -  ${PN}-pydoc \
>         -  ${PN}-re \
>         -  ${PN}-readline \
>         -  ${PN}-resource \
>         -  ${PN}-robotparser \
>         -  ${PN}-runpy \
>         -  ${PN}-shell \
>         -  ${PN}-smtpd \
>         -  ${PN}-sqlite3 \
>         -  ${PN}-sqlite3-tests \
>         -  ${PN}-stringold \
>         -  ${PN}-subprocess \
>         -  ${PN}-syslog \
>         -  ${PN}-terminal \
>         -  ${PN}-tests \
>         -  ${PN}-textutils \
>         -  ${PN}-threading \
>         -  ${PN}-tkinter \
>         -  ${PN}-unittest \
>         -  ${PN}-unixadmin \
>         -  ${PN}-xml \
>         -  ${PN}-xmlrpc \
>         -  ${PN}-zlib \
>         -"
>         -
>         -PACKAGES=" \
>         -  ${PN}-dbg \
>         -  ${PN}-2to3 \
>         -  ${PN}-argparse \
>         -  ${PN}-audio \
>         -  ${PN}-bsddb \
>         -  ${PN}-codecs \
>         -  ${PN}-compile \
>         -  ${PN}-compiler \
>         -  ${PN}-compression \
>         -  ${PN}-contextlib \
>         -  ${PN}-core \
>         -  ${PN}-crypt \
>         -  ${PN}-ctypes \
>         -  ${PN}-curses \
>         -  ${PN}-datetime \
>         -  ${PN}-db \
>         -  ${PN}-debugger \
>         -  ${PN}-dev \
>         -  ${PN}-difflib \
>         -  ${PN}-distutils-staticdev ${PN}-distutils \
>         -  ${PN}-doctest \
>         -  ${PN}-email \
>         -  ${PN}-fcntl \
>         -  ${PN}-gdbm \
>         -  ${PN}-hotshot \
>         -  ${PN}-html \
>         -  ${PN}-idle \
>         -  ${PN}-image \
>         -  ${PN}-importlib \
>         -  ${PN}-io \
>         -  ${PN}-json \
>         -  ${PN}-lang \
>         -  ${PN}-logging \
>         -  ${PN}-mailbox \
>         -  ${PN}-math \
>         -  ${PN}-mime \
>         -  ${PN}-mmap \
>         -  ${PN}-multiprocessing \
>         -  ${PN}-netclient \
>         -  ${PN}-netserver \
>         -  ${PN}-numbers \
>         -  ${PN}-pickle \
>         -  ${PN}-pkgutil \
>         -  ${PN}-plistlib \
>         -  ${PN}-pprint \
>         -  ${PN}-profile \
>         -  ${PN}-pydoc \
>         -  ${PN}-re \
>         -  ${PN}-readline \
>         -  ${PN}-resource \
>         -  ${PN}-robotparser \
>         -  ${PN}-runpy \
>         -  ${PN}-shell \
>         -  ${PN}-smtpd \
>         -  ${PN}-sqlite3 \
>         -  ${PN}-sqlite3-tests \
>         -  ${PN}-stringold \
>         -  ${PN}-subprocess \
>         -  ${PN}-syslog \
>         -  ${PN}-terminal \
>         -  ${PN}-tests \
>         -  ${PN}-textutils \
>         -  ${PN}-threading \
>         -  ${PN}-tkinter \
>         -  ${PN}-unittest \
>         -  ${PN}-unixadmin \
>         -  ${PN}-xml \
>         -  ${PN}-xmlrpc \
>         -  ${PN}-zlib \
>         -  ${PN}-modules\
>         -"
>         -
>         -SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code
>         translator"
>         -RDEPENDS_${PN}-2to3="${PN}-core"
>         -FILES_${PN}-2to3=" \
>         -    ${bindir}/2to3 \
>         -    ${libdir}/python2.7/lib2to3 \
>         -"
>         -
>         -SUMMARY_${PN}-argparse="Python command line argument parser"
>         -RDEPENDS_${PN}-argparse="${PN}-core ${PN}-codecs ${PN}-textutils"
>         -FILES_${PN}-argparse=" \
>         -    ${libdir}/python2.7/argparse.* \
>         -"
>         -
>         -SUMMARY_${PN}-audio="Python Audio Handling"
>         -RDEPENDS_${PN}-audio="${PN}-core"
>         -FILES_${PN}-audio=" \
>         -    ${libdir}/python2.7/wave.* \
>         -    ${libdir}/python2.7/chunk.* \
>         -    ${libdir}/python2.7/sndhdr.* \
>         -    ${libdir}/python2.7/lib-dynload/ossaudiodev.so \
>         -    ${libdir}/python2.7/lib-dynload/audioop.so \
>         -    ${libdir}/python2.7/audiodev.* \
>         -    ${libdir}/python2.7/sunaudio.* \
>         -    ${libdir}/python2.7/sunau.* \
>         -    ${libdir}/python2.7/toaiff.* \
>         -"
>         -
>         -SUMMARY_${PN}-bsddb="Python bindings for the Berkeley Database"
>         -RDEPENDS_${PN}-bsddb="${PN}-core"
>         -FILES_${PN}-bsddb=" \
>         -    ${libdir}/python2.7/bsddb \
>         -    ${libdir}/python2.7/lib-dynload/_bsddb.so \
>         -"
>         -
>         -SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
>         -RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
>         -FILES_${PN}-codecs=" \
>         -    ${libdir}/python2.7/codecs.* \
>         -    ${libdir}/python2.7/encodings \
>         -    ${libdir}/python2.7/gettext.* \
>         -    ${libdir}/python2.7/locale.* \
>         -    ${libdir}/python2.7/lib-dynload/_locale.so \
>         -    ${libdir}/python2.7/lib-dynload/_codecs* \
>         -    ${libdir}/python2.7/lib-dynload/_multibytecodec.so \
>         -    ${libdir}/python2.7/lib-dynload/unicodedata.so \
>         -    ${libdir}/python2.7/stringprep.* \
>         -    ${libdir}/python2.7/xdrlib.* \
>         -"
>         -
>         -SUMMARY_${PN}-compile="Python bytecode compilation support"
>         -RDEPENDS_${PN}-compile="${PN}-core"
>         -FILES_${PN}-compile=" \
>         -    ${libdir}/python2.7/py_compile.* \
>         -    ${libdir}/python2.7/compileall.* \
>         -"
>         -
>         -SUMMARY_${PN}-compiler="Python compiler support"
>         -RDEPENDS_${PN}-compiler="${PN}-core"
>         -FILES_${PN}-compiler=" \
>         -    ${libdir}/python2.7/compiler \
>         -"
>         -
>         -SUMMARY_${PN}-compression="Python high-level compression support"
>         -RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
>         -FILES_${PN}-compression=" \
>         -    ${libdir}/python2.7/gzip.* \
>         -    ${libdir}/python2.7/zipfile.* \
>         -    ${libdir}/python2.7/tarfile.* \
>         -    ${libdir}/python2.7/lib-dynload/bz2.so \
>         -"
>         -
>         -SUMMARY_${PN}-contextlib="Python utilities for
>         with-statementcontexts."
>         -RDEPENDS_${PN}-contextlib="${PN}-core"
>         -FILES_${PN}-contextlib=" \
>         -    ${libdir}/python${PYTHON_MAJMIN}/contextlib.* \
>         -"
>         -
>         -SUMMARY_${PN}-core="Python interpreter and core modules"
>         -RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
>         -FILES_${PN}-core=" \
>         -    ${libdir}/python2.7/__future__.* \
>         -    ${libdir}/python2.7/_abcoll.* \
>         -    ${libdir}/python2.7/abc.* \
>         -    ${libdir}/python2.7/ast.* \
>         -    ${libdir}/python2.7/copy.* \
>         -    ${libdir}/python2.7/copy_reg.* \
>         -    ${libdir}/python2.7/ConfigParser.* \
>         -    ${libdir}/python2.7/genericpath.* \
>         -    ${libdir}/python2.7/getopt.* \
>         -    ${libdir}/python2.7/linecache.* \
>         -    ${libdir}/python2.7/new.* \
>         -    ${libdir}/python2.7/os.* \
>         -    ${libdir}/python2.7/posixpath.* \
>         -    ${libdir}/python2.7/struct.* \
>         -    ${libdir}/python2.7/warnings.* \
>         -    ${libdir}/python2.7/site.* \
>         -    ${libdir}/python2.7/stat.* \
>         -    ${libdir}/python2.7/UserDict.* \
>         -    ${libdir}/python2.7/UserList.* \
>         -    ${libdir}/python2.7/UserString.* \
>         -    ${libdir}/python2.7/lib-dynload/binascii.so \
>         -    ${libdir}/python2.7/lib-dynload/_struct.so \
>         -    ${libdir}/python2.7/lib-dynload/time.so \
>         -    ${libdir}/python2.7/lib-dynload/xreadlines.so \
>         -    ${libdir}/python2.7/types.* \
>         -    ${libdir}/python2.7/platform.* \
>         -    ${bindir}/python* \
>         -    ${libdir}/python2.7/_weakrefset.* \
>         -    ${libdir}/python2.7/sysconfig.* \
>         -    ${libdir}/python2.7/_sysconfigdata.* \
>         -    ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h \
>         -    ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py \
>         -"
>         -
>         -SUMMARY_${PN}-crypt="Python basic cryptographic and hashing
>         support"
>         -RDEPENDS_${PN}-crypt="${PN}-core"
>         -FILES_${PN}-crypt=" \
>         -    ${libdir}/python2.7/hashlib.* \
>         -    ${libdir}/python2.7/md5.* \
>         -    ${libdir}/python2.7/sha.* \
>         -    ${libdir}/python2.7/lib-dynload/crypt.so \
>         -    ${libdir}/python2.7/lib-dynload/_hashlib.so \
>         -    ${libdir}/python2.7/lib-dynload/_sha256.so \
>         -    ${libdir}/python2.7/lib-dynload/_sha512.so \
>         -"
>         -
>         -SUMMARY_${PN}-ctypes="Python C types support"
>         -RDEPENDS_${PN}-ctypes="${PN}-core"
>         -FILES_${PN}-ctypes=" \
>         -    ${libdir}/python2.7/ctypes \
>         -    ${libdir}/python2.7/lib-dynload/_ctypes.so \
>         -    ${libdir}/python2.7/lib-dynload/_ctypes_test.so \
>         -"
>         -
>         -SUMMARY_${PN}-curses="Python curses support"
>         -RDEPENDS_${PN}-curses="${PN}-core"
>         -FILES_${PN}-curses=" \
>         -    ${libdir}/python2.7/curses \
>         -    ${libdir}/python2.7/lib-dynload/_curses.so \
>         -    ${libdir}/python2.7/lib-dynload/_curses_panel.so \
>         -"
>         -
>         -SUMMARY_${PN}-datetime="Python calendar and time support"
>         -RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
>         -FILES_${PN}-datetime=" \
>         -    ${libdir}/python2.7/_strptime.* \
>         -    ${libdir}/python2.7/calendar.* \
>         -    ${libdir}/python2.7/lib-dynload/datetime.so \
>         -"
>         -
>         -SUMMARY_${PN}-db="Python file-based database support"
>         -RDEPENDS_${PN}-db="${PN}-core"
>         -FILES_${PN}-db=" \
>         -    ${libdir}/python2.7/anydbm.* \
>         -    ${libdir}/python2.7/dumbdbm.* \
>         -    ${libdir}/python2.7/whichdb.* \
>         -"
>         -
>         -SUMMARY_${PN}-debugger="Python debugger"
>         -RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang
>         ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
>         -FILES_${PN}-debugger=" \
>         -    ${libdir}/python2.7/bdb.* \
>         -    ${libdir}/python2.7/pdb.* \
>         -"
>         -
>         -SUMMARY_${PN}-dev="Python development package"
>         -RDEPENDS_${PN}-dev="${PN}-core"
>         -FILES_${PN}-dev=" \
>         -    ${includedir} \
>         -    ${libdir}/lib*${SOLIBSDEV} \
>         -    ${libdir}/*.la \
>         -    ${libdir}/*.a \
>         -    ${libdir}/*.o \
>         -    ${libdir}/pkgconfig \
>         -    ${base_libdir}/*.a \
>         -    ${base_libdir}/*.o \
>         -    ${datadir}/aclocal \
>         -    ${datadir}/pkgconfig \
>         -    ${libdir}/python2.7/config/Makefile \
>         -"
>         -
>         -SUMMARY_${PN}-difflib="Python helpers for computing deltas
>         between objects"
>         -RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
>         -FILES_${PN}-difflib=" \
>         -    ${libdir}/python2.7/difflib.* \
>         -"
>         -
>         -SUMMARY_${PN}-distutils="Python Distribution Utilities"
>         -RDEPENDS_${PN}-distutils="${PN}-core ${PN}-email"
>         -FILES_${PN}-distutils=" \
>         -    ${libdir}/python2.7/config \
>         -    ${libdir}/python2.7/distutils \
>         -"
>         -
>         -SUMMARY_${PN}-distutils-staticdev="Python distribution
>         utilities (static libraries)"
>         -RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
>         -FILES_${PN}-distutils-staticdev=" \
>         -    ${libdir}/python2.7/config/lib*.a \
>         -"
>         -
>         -SUMMARY_${PN}-doctest="Python framework for running examples
>         in docstrings"
>         -RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io
>         ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
>         -FILES_${PN}-doctest=" \
>         -    ${libdir}/python2.7/doctest.* \
>         -"
>         -
>         -SUMMARY_${PN}-email="Python email support"
>         -RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime
>         ${PN}-audio ${PN}-image ${PN}-netclient"
>         -FILES_${PN}-email=" \
>         -    ${libdir}/python2.7/imaplib.* \
>         -    ${libdir}/python2.7/email \
>         -"
>         -
>         -SUMMARY_${PN}-fcntl="Python's fcntl interface"
>         -RDEPENDS_${PN}-fcntl="${PN}-core"
>         -FILES_${PN}-fcntl=" \
>         -    ${libdir}/python2.7/lib-dynload/fcntl.so \
>         -"
>         -
>         -SUMMARY_${PN}-gdbm="Python GNU database support"
>         -RDEPENDS_${PN}-gdbm="${PN}-core"
>         -FILES_${PN}-gdbm=" \
>         -    ${libdir}/python2.7/lib-dynload/gdbm.so \
>         -"
>         -
>         -SUMMARY_${PN}-hotshot="Python hotshot performance profiler"
>         -RDEPENDS_${PN}-hotshot="${PN}-core"
>         -FILES_${PN}-hotshot=" \
>         -    ${libdir}/python2.7/hotshot \
>         -    ${libdir}/python2.7/lib-dynload/_hotshot.so \
>         -"
>         -
>         -SUMMARY_${PN}-html="Python HTML processing support"
>         -RDEPENDS_${PN}-html="${PN}-core"
>         -FILES_${PN}-html=" \
>         -    ${libdir}/python2.7/formatter.* \
>         -    ${libdir}/python2.7/htmlentitydefs.* \
>         -    ${libdir}/python2.7/htmllib.* \
>         -    ${libdir}/python2.7/markupbase.* \
>         -    ${libdir}/python2.7/sgmllib.* \
>         -    ${libdir}/python2.7/HTMLParser.* \
>         -"
>         -
>         -SUMMARY_${PN}-idle="Python Integrated Development Environment"
>         -RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
>         -FILES_${PN}-idle=" \
>         -    ${bindir}/idle \
>         -    ${libdir}/python2.7/idlelib \
>         -"
>         -
>         -SUMMARY_${PN}-image="Python graphical image handling"
>         -RDEPENDS_${PN}-image="${PN}-core"
>         -FILES_${PN}-image=" \
>         -    ${libdir}/python2.7/colorsys.* \
>         -    ${libdir}/python2.7/imghdr.* \
>         -    ${libdir}/python2.7/lib-dynload/imageop.so \
>         -    ${libdir}/python2.7/lib-dynload/rgbimg.so \
>         -"
>         -
>         -SUMMARY_${PN}-importlib="Python import implementation library"
>         -RDEPENDS_${PN}-importlib="${PN}-core"
>         -FILES_${PN}-importlib=" \
>         -    ${libdir}/python2.7/importlib \
>         -"
>         -
>         -SUMMARY_${PN}-io="Python low-level I/O"
>         -RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils
>         ${PN}-netclient ${PN}-contextlib"
>         -FILES_${PN}-io=" \
>         -    ${libdir}/python2.7/lib-dynload/_socket.so \
>         -    ${libdir}/python2.7/lib-dynload/_io.so \
>         -    ${libdir}/python2.7/lib-dynload/_ssl.so \
>         -    ${libdir}/python2.7/lib-dynload/select.so \
>         -    ${libdir}/python2.7/lib-dynload/termios.so \
>         -    ${libdir}/python2.7/lib-dynload/cStringIO.so \
>         -    ${libdir}/python2.7/pipes.* \
>         -    ${libdir}/python2.7/socket.* \
>         -    ${libdir}/python2.7/ssl.* \
>         -    ${libdir}/python2.7/tempfile.* \
>         -    ${libdir}/python2.7/StringIO.* \
>         -    ${libdir}/python2.7/io.* \
>         -    ${libdir}/python2.7/_pyio.* \
>         -"
>         -
>         -SUMMARY_${PN}-json="Python JSON support"
>         -RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re ${PN}-codecs"
>         -FILES_${PN}-json=" \
>         -    ${libdir}/python2.7/json \
>         -    ${libdir}/python2.7/lib-dynload/_json.so \
>         -"
>         -
>         -SUMMARY_${PN}-lang="Python low-level language support"
>         -RDEPENDS_${PN}-lang="${PN}-core"
>         -FILES_${PN}-lang=" \
>         -    ${libdir}/python2.7/lib-dynload/_bisect.so \
>         -    ${libdir}/python2.7/lib-dynload/_collections.so \
>         -    ${libdir}/python2.7/lib-dynload/_heapq.so \
>         -    ${libdir}/python2.7/lib-dynload/_weakref.so \
>         -    ${libdir}/python2.7/lib-dynload/_functools.so \
>         -    ${libdir}/python2.7/lib-dynload/array.so \
>         -    ${libdir}/python2.7/lib-dynload/itertools.so \
>         -    ${libdir}/python2.7/lib-dynload/operator.so \
>         -    ${libdir}/python2.7/lib-dynload/parser.so \
>         -    ${libdir}/python2.7/atexit.* \
>         -    ${libdir}/python2.7/bisect.* \
>         -    ${libdir}/python2.7/code.* \
>         -    ${libdir}/python2.7/codeop.* \
>         -    ${libdir}/python2.7/collections.* \
>         -    ${libdir}/python2.7/dis.* \
>         -    ${libdir}/python2.7/functools.* \
>         -    ${libdir}/python2.7/heapq.* \
>         -    ${libdir}/python2.7/inspect.* \
>         -    ${libdir}/python2.7/keyword.* \
>         -    ${libdir}/python2.7/opcode.* \
>         -    ${libdir}/python2.7/symbol.* \
>         -    ${libdir}/python2.7/repr.* \
>         -    ${libdir}/python2.7/token.* \
>         -    ${libdir}/python2.7/tokenize.* \
>         -    ${libdir}/python2.7/traceback.* \
>         -    ${libdir}/python2.7/weakref.* \
>         -"
>         -
>         -SUMMARY_${PN}-logging="Python logging support"
>         -RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang
>         ${PN}-pickle ${PN}-stringold"
>         -FILES_${PN}-logging=" \
>         -    ${libdir}/python2.7/logging \
>         -"
>         -
>         -SUMMARY_${PN}-mailbox="Python mailbox format support"
>         -RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
>         -FILES_${PN}-mailbox=" \
>         -    ${libdir}/python2.7/mailbox.* \
>         -"
>         -
>         -SUMMARY_${PN}-math="Python math support"
>         -RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
>         -FILES_${PN}-math=" \
>         -    ${libdir}/python2.7/lib-dynload/cmath.so \
>         -    ${libdir}/python2.7/lib-dynload/math.so \
>         -    ${libdir}/python2.7/lib-dynload/_random.so \
>         -    ${libdir}/python2.7/random.* \
>         -    ${libdir}/python2.7/sets.* \
>         -"
>         -
>         -SUMMARY_${PN}-mime="Python MIME handling APIs"
>         -RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
>         -FILES_${PN}-mime=" \
>         -    ${libdir}/python2.7/mimetools.* \
>         -    ${libdir}/python2.7/uu.* \
>         -    ${libdir}/python2.7/quopri.* \
>         -    ${libdir}/python2.7/rfc822.* \
>         -    ${libdir}/python2.7/MimeWriter.* \
>         -"
>         -
>         -SUMMARY_${PN}-mmap="Python memory-mapped file support"
>         -RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
>         -FILES_${PN}-mmap=" \
>         -    ${libdir}/python2.7/lib-dynload/mmap.so \
>         -"
>         -
>         -SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
>         -RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io
>         ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
>         -FILES_${PN}-multiprocessing=" \
>         -    ${libdir}/python2.7/lib-dynload/_multiprocessing.so \
>         -    ${libdir}/python2.7/multiprocessing \
>         -"
>         -
>         -SUMMARY_${PN}-netclient="Python Internet Protocol clients"
>         -RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt
>         ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
>         -FILES_${PN}-netclient=" \
>         -    ${libdir}/python2.7/*Cookie*.* \
>         -    ${libdir}/python2.7/base64.* \
>         -    ${libdir}/python2.7/cookielib.* \
>         -    ${libdir}/python2.7/ftplib.* \
>         -    ${libdir}/python2.7/gopherlib.* \
>         -    ${libdir}/python2.7/hmac.* \
>         -    ${libdir}/python2.7/httplib.* \
>         -    ${libdir}/python2.7/mimetypes.* \
>         -    ${libdir}/python2.7/nntplib.* \
>         -    ${libdir}/python2.7/poplib.* \
>         -    ${libdir}/python2.7/smtplib.* \
>         -    ${libdir}/python2.7/telnetlib.* \
>         -    ${libdir}/python2.7/urllib.* \
>         -    ${libdir}/python2.7/urllib2.* \
>         -    ${libdir}/python2.7/urlparse.* \
>         -    ${libdir}/python2.7/uuid.* \
>         -    ${libdir}/python2.7/rfc822.* \
>         -    ${libdir}/python2.7/mimetools.* \
>         -"
>         -
>         -SUMMARY_${PN}-netserver="Python Internet Protocol servers"
>         -RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient
>         ${PN}-shell ${PN}-threading"
>         -FILES_${PN}-netserver=" \
>         -    ${libdir}/python2.7/cgi.* \
>         -    ${libdir}/python2.7/*HTTPServer.* \
>         -    ${libdir}/python2.7/SocketServer.* \
>         -"
>         -
>         -SUMMARY_${PN}-numbers="Python number APIs"
>         -RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
>         -FILES_${PN}-numbers=" \
>         -    ${libdir}/python2.7/decimal.* \
>         -    ${libdir}/python2.7/fractions.* \
>         -    ${libdir}/python2.7/numbers.* \
>         -"
>         -
>         -SUMMARY_${PN}-pickle="Python serialisation/persistence support"
>         -RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
>         -FILES_${PN}-pickle=" \
>         -    ${libdir}/python2.7/pickle.* \
>         -    ${libdir}/python2.7/shelve.* \
>         -    ${libdir}/python2.7/lib-dynload/cPickle.so \
>         -    ${libdir}/python2.7/pickletools.* \
>         -"
>         -
>         -SUMMARY_${PN}-pkgutil="Python package extension utility support"
>         -RDEPENDS_${PN}-pkgutil="${PN}-core"
>         -FILES_${PN}-pkgutil=" \
>         -    ${libdir}/python2.7/pkgutil.* \
>         -"
>         -
>         -SUMMARY_${PN}-plistlib="Generate and parse Mac OS X .plist files"
>         -RDEPENDS_${PN}-plistlib="${PN}-core ${PN}-datetime ${PN}-io"
>         -FILES_${PN}-plistlib=" \
>         -    ${libdir}/python2.7/plistlib.* \
>         -"
>         -
>         -SUMMARY_${PN}-pprint="Python pretty-print support"
>         -RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
>         -FILES_${PN}-pprint=" \
>         -    ${libdir}/python2.7/pprint.* \
>         -"
>         -
>         -SUMMARY_${PN}-profile="Python basic performance profiling
>         support"
>         -RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
>         -FILES_${PN}-profile=" \
>         -    ${libdir}/python2.7/profile.* \
>         -    ${libdir}/python2.7/pstats.* \
>         -    ${libdir}/python2.7/cProfile.* \
>         -    ${libdir}/python2.7/lib-dynload/_lsprof.so \
>         -"
>         -
>         -SUMMARY_${PN}-pydoc="Python interactive help support"
>         -RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold
>         ${PN}-re"
>         -FILES_${PN}-pydoc=" \
>         -    ${bindir}/pydoc \
>         -    ${libdir}/python2.7/pydoc.* \
>         -    ${libdir}/python2.7/pydoc_data \
>         -"
>         -
>         -SUMMARY_${PN}-re="Python Regular Expression APIs"
>         -RDEPENDS_${PN}-re="${PN}-core"
>         -FILES_${PN}-re=" \
>         -    ${libdir}/python2.7/re.* \
>         -    ${libdir}/python2.7/sre.* \
>         -    ${libdir}/python2.7/sre_compile.* \
>         -    ${libdir}/python2.7/sre_constants* \
>         -    ${libdir}/python2.7/sre_parse.* \
>         -"
>         -
>         -SUMMARY_${PN}-readline="Python readline support"
>         -RDEPENDS_${PN}-readline="${PN}-core"
>         -FILES_${PN}-readline=" \
>         -    ${libdir}/python2.7/lib-dynload/readline.so \
>         -    ${libdir}/python2.7/rlcompleter.* \
>         -"
>         -
>         -SUMMARY_${PN}-resource="Python resource control interface"
>         -RDEPENDS_${PN}-resource="${PN}-core"
>         -FILES_${PN}-resource=" \
>         -    ${libdir}/python2.7/lib-dynload/resource.so \
>         -"
>         -
>         -SUMMARY_${PN}-robotparser="Python robots.txt parser"
>         -RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
>         -FILES_${PN}-robotparser=" \
>         -    ${libdir}/python2.7/robotparser.* \
>         -"
>         -
>         -SUMMARY_${PN}-runpy="Python script for locating/executing
>         scripts in module namespace"
>         -RDEPENDS_${PN}-runpy="${PN}-core ${PN}-pkgutil"
>         -FILES_${PN}-runpy=" \
>         -    ${libdir}/python2.7/runpy.* \
>         -"
>         -
>         -SUMMARY_${PN}-shell="Python shell-like functionality"
>         -RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
>         -FILES_${PN}-shell=" \
>         -    ${libdir}/python2.7/cmd.* \
>         -    ${libdir}/python2.7/commands.* \
>         -    ${libdir}/python2.7/dircache.* \
>         -    ${libdir}/python2.7/fnmatch.* \
>         -    ${libdir}/python2.7/glob.* \
>         -    ${libdir}/python2.7/popen2.* \
>         -    ${libdir}/python2.7/shlex.* \
>         -    ${libdir}/python2.7/shutil.* \
>         -"
>         -
>         -SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
>         -RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email
>         ${PN}-mime"
>         -FILES_${PN}-smtpd=" \
>         -    ${bindir}/smtpd.* \
>         -    ${libdir}/python2.7/smtpd.* \
>         -"
>         -
>         -SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
>         -RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang
>         ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib"
>         -FILES_${PN}-sqlite3=" \
>         -    ${libdir}/python2.7/lib-dynload/_sqlite3.so \
>         -    ${libdir}/python2.7/sqlite3/dbapi2.* \
>         -    ${libdir}/python2.7/sqlite3/__init__.* \
>         -    ${libdir}/python2.7/sqlite3/dump.* \
>         -"
>         -
>         -SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support
>         tests"
>         -RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
>         -FILES_${PN}-sqlite3-tests=" \
>         -    ${libdir}/python2.7/sqlite3/test \
>         -"
>         -
>         -SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
>         -RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
>         -FILES_${PN}-stringold=" \
>         -    ${libdir}/python2.7/lib-dynload/strop.so \
>         -    ${libdir}/python2.7/string.* \
>         -    ${libdir}/python2.7/stringold.* \
>         -"
>         -
>         -SUMMARY_${PN}-subprocess="Python subprocess support"
>         -RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re
>         ${PN}-fcntl ${PN}-pickle"
>         -FILES_${PN}-subprocess=" \
>         -    ${libdir}/python2.7/subprocess.* \
>         -"
>         -
>         -SUMMARY_${PN}-syslog="Python syslog interface"
>         -RDEPENDS_${PN}-syslog="${PN}-core"
>         -FILES_${PN}-syslog=" \
>         -    ${libdir}/python2.7/lib-dynload/syslog.so \
>         -"
>         -
>         -SUMMARY_${PN}-terminal="Python terminal controlling support"
>         -RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
>         -FILES_${PN}-terminal=" \
>         -    ${libdir}/python2.7/pty.* \
>         -    ${libdir}/python2.7/tty.* \
>         -"
>         -
>         -SUMMARY_${PN}-tests="Python tests"
>         -RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules"
>         -FILES_${PN}-tests=" \
>         -    ${libdir}/python2.7/test \
>         -"
>         -
>         -SUMMARY_${PN}-textutils="Python option parsing, text wrapping
>         and CSV support"
>         -RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re
>         ${PN}-stringold"
>         -FILES_${PN}-textutils=" \
>         -    ${libdir}/python2.7/lib-dynload/_csv.so \
>         -    ${libdir}/python2.7/csv.* \
>         -    ${libdir}/python2.7/optparse.* \
>         -    ${libdir}/python2.7/textwrap.* \
>         -"
>         -
>         -SUMMARY_${PN}-threading="Python threading & synchronization
>         support"
>         -RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
>         -FILES_${PN}-threading=" \
>         -    ${libdir}/python2.7/_threading_local.* \
>         -    ${libdir}/python2.7/dummy_thread.* \
>         -    ${libdir}/python2.7/dummy_threading.* \
>         -    ${libdir}/python2.7/mutex.* \
>         -    ${libdir}/python2.7/threading.* \
>         -    ${libdir}/python2.7/Queue.* \
>         -"
>         -
>         -SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
>         -RDEPENDS_${PN}-tkinter="${PN}-core"
>         -FILES_${PN}-tkinter=" \
>         -    ${libdir}/python2.7/lib-dynload/_tkinter.so \
>         -    ${libdir}/python2.7/lib-tk \
>         -"
>         -
>         -SUMMARY_${PN}-unittest="Python unit testing framework"
>         -RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold
>         ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
>         -FILES_${PN}-unittest=" \
>         -    ${libdir}/python2.7/unittest/ \
>         -"
>         -
>         -SUMMARY_${PN}-unixadmin="Python Unix administration support"
>         -RDEPENDS_${PN}-unixadmin="${PN}-core"
>         -FILES_${PN}-unixadmin=" \
>         -    ${libdir}/python2.7/lib-dynload/nis.so \
>         -    ${libdir}/python2.7/lib-dynload/grp.so \
>         -    ${libdir}/python2.7/lib-dynload/pwd.so \
>         -    ${libdir}/python2.7/getpass.* \
>         -"
>         -
>         -SUMMARY_${PN}-xml="Python basic XML support"
>         -RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
>         -FILES_${PN}-xml=" \
>         -    ${libdir}/python2.7/lib-dynload/_elementtree.so \
>         -    ${libdir}/python2.7/lib-dynload/pyexpat.so \
>         -    ${libdir}/python2.7/xml \
>         -    ${libdir}/python2.7/xmllib.* \
>         -"
>         -
>         -SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
>         -RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver
>         ${PN}-lang"
>         -FILES_${PN}-xmlrpc=" \
>         -    ${libdir}/python2.7/xmlrpclib.* \
>         -    ${libdir}/python2.7/SimpleXMLRPCServer.* \
>         -    ${libdir}/python2.7/DocXMLRPCServer.* \
>         -"
>         -
>         -SUMMARY_${PN}-zlib="Python zlib compression support"
>         -RDEPENDS_${PN}-zlib="${PN}-core"
>         -FILES_${PN}-zlib=" \
>         -    ${libdir}/python2.7/lib-dynload/zlib.so \
>         -"
>         -
>         -SUMMARY_${PN}-modules="All Python modules"
>         -RDEPENDS_${PN}-modules=" \
>         -  ${PN}-2to3 \
>         -  ${PN}-argparse \
>         -  ${PN}-audio \
>         -  ${PN}-bsddb \
>         -  ${PN}-codecs \
>         -  ${PN}-compile \
>         -  ${PN}-compiler \
>         -  ${PN}-compression \
>         -  ${PN}-contextlib \
>         -  ${PN}-core \
>         -  ${PN}-crypt \
>         -  ${PN}-ctypes \
>         -  ${PN}-curses \
>         -  ${PN}-datetime \
>         -  ${PN}-db \
>         -  ${PN}-debugger \
>         -  ${PN}-difflib \
>         -  ${PN}-distutils \
>         -  ${PN}-doctest \
>         -  ${PN}-email \
>         -  ${PN}-fcntl \
>         -  ${PN}-gdbm \
>         -  ${PN}-hotshot \
>         -  ${PN}-html \
>         -  ${PN}-idle \
>         -  ${PN}-image \
>         -  ${PN}-importlib \
>         -  ${PN}-io \
>         -  ${PN}-json \
>         -  ${PN}-lang \
>         -  ${PN}-logging \
>         -  ${PN}-mailbox \
>         -  ${PN}-math \
>         -  ${PN}-mime \
>         -  ${PN}-mmap \
>         -  ${PN}-multiprocessing \
>         -  ${PN}-netclient \
>         -  ${PN}-netserver \
>         -  ${PN}-numbers \
>         -  ${PN}-pickle \
>         -  ${PN}-pkgutil \
>         -  ${PN}-plistlib \
>         -  ${PN}-pprint \
>         -  ${PN}-profile \
>         -  ${PN}-pydoc \
>         -  ${PN}-re \
>         -  ${PN}-readline \
>         -  ${PN}-resource \
>         -  ${PN}-robotparser \
>         -  ${PN}-runpy \
>         -  ${PN}-shell \
>         -  ${PN}-smtpd \
>         -  ${PN}-sqlite3 \
>         -  ${PN}-sqlite3-tests \
>         -  ${PN}-stringold \
>         -  ${PN}-subprocess \
>         -  ${PN}-syslog \
>         -  ${PN}-terminal \
>         -  ${PN}-textutils \
>         -  ${PN}-threading \
>         -  ${PN}-tkinter \
>         -  ${PN}-unittest \
>         -  ${PN}-unixadmin \
>         -  ${PN}-xml \
>         -  ${PN}-xmlrpc \
>         -  ${PN}-zlib \
>         -"
>         -ALLOW_EMPTY_${PN}-modules = "1"
>         -
>         -
>         diff --git
>         a/meta/recipes-devtools/python/python-native-2.7-manifest.inc
>         b/meta/recipes-devtools/python/python-native-2.7-manifest.inc
>         deleted file mode 100644
>         index b05aae0..0000000
>         --- a/meta/recipes-devtools/python/python-native-2.7-manifest.inc
>         +++ /dev/null
>         @@ -1,9 +0,0 @@
>         -
>         -# WARNING: This file is AUTO GENERATED: Manual edits will be
>         lost next time I regenerate the file.
>         -# Generator:
>         '../scripts/contrib/python/generate-manifest-2.7.py
>         <http://generate-manifest-2.7.py> --native' Version 20110222.2
>         (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de
>         <mailto:mlauer@vanille-media.de>>
>         -
>         -
>         -
>         -RPROVIDES += "python-modules-native python-2to3-native
>         python-argparse-native python-audio-native python-bsddb-native
>         python-codecs-native python-compile-native
>         python-compiler-native python-compression-native
>         python-contextlib-native python-core-native
>         python-crypt-native python-ctypes-native python-curses-native
>         python-datetime-native python-db-native python-debugger-native
>         python-dev-native python-difflib-native
>         python-distutils-native python-distutils-staticdev-native
>         python-doctest- [...]
>         -
>         -
>         diff --git
>         a/meta/recipes-devtools/python/python-native_2.7.13.bb
>         <http://python-native_2.7.13.bb>
>         b/meta/recipes-devtools/python/python-native_2.7.13.bb
>         <http://python-native_2.7.13.bb>
>         index 7edf153..2b74003 100644
>         --- a/meta/recipes-devtools/python/python-native_2.7.13.bb
>         <http://python-native_2.7.13.bb>
>         +++ b/meta/recipes-devtools/python/python-native_2.7.13.bb
>         <http://python-native_2.7.13.bb>
>         @@ -1,5 +1,4 @@
>          require python.inc
>         -
>          EXTRANATIVEPATH += "bzip2-native"
>          DEPENDS = "openssl-native bzip2-replacement-native
>         zlib-native readline-native sqlite3-native expat-native"
>          PR = "${INC_PR}.1"
>         @@ -25,8 +24,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
>
>          inherit native
>
>         -require python-native-${PYTHON_MAJMIN}-manifest.inc
>         -
>          EXTRA_OECONF_append = " --bindir=${bindir}/${PN}
>         --with-system-expat=${STAGING_DIR_HOST}"
>
>          EXTRA_OEMAKE = '\
>         @@ -59,3 +56,24 @@ do_install() {
>                 # installed in the native sysroot, so disable user
>         site support.
>                 sed -i -e 's,^\(ENABLE_USER_SITE = \).*,\1False,'
>         ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
>          }
>         +
>         +python(){
>         +
>         +    # Read JSON manifest
>         +    import json
>         +    pythondir = d.getVar('THISDIR',True)
>         +    with open(pythondir+'/python/python2-manifest.json') as
>         manifest_file:
>         +        python_manifest=json.load(manifest_file)
>         +
>         +    rprovides = d.getVar('RPROVIDES').split()
>         +
>         +    # Hardcoded since it cant be python-native-foo, should be
>         python-foo-native
>         +    pn = 'python'
>         +
>         +    for key in python_manifest:
>         +        pypackage = pn + '-' + key + '-native'
>         +        if pypackage not in rprovides:
>         +              rprovides.append(pypackage)
>         +
>         +    d.setVar('RPROVIDES', ' '.join(rprovides))
>         +}
>         diff --git
>         a/meta/recipes-devtools/python/python/create_manifest2.py
>         b/meta/recipes-devtools/python/python/create_manifest2.py
>         new file mode 100644
>         index 0000000..bd64ec3
>         --- /dev/null
>         +++ b/meta/recipes-devtools/python/python/create_manifest2.py
>         @@ -0,0 +1,277 @@
>         +# This script is used as a bitbake task to create a new
>         python manifest
>         +# $ bitbake python -c create_manifest
>         +#
>         +# Our goal is to keep python-core as small as posible and add
>         other python
>         +# packages only when the user needs them, hence why we split
>         upstream python
>         +# into several packages.
>         +#
>         +# In a very simplistic way what this does is:
>         +# Launch python and see specifically what is required for it
>         to run at a minimum
>         +#
>         +# Go through the python-manifest file and launch a separate
>         task for every single
>         +# one of the files on each package, this task will check what
>         was required for that
>         +# specific module to run, these modules will be called
>         dependencies.
>         +# The output of such task will be a list of the modules or
>         dependencies that were
>         +# found for that file.
>         +#
>         +# Such output will be parsed by this script, we will look for
>         each dependency on the
>         +# manifest and if we find that another package already
>         includes it, then we will add
>         +# that package as an RDEPENDS to the package we are currently
>         checking; in case we dont
>         +# find the current dependency on any other package we will
>         add it to the current package
>         +# as part of FILES.
>         +#
>         +#
>         +# This way we will create a new manifest from the data
>         structure that was built during
>         +# this process, ont this new manifest each package will
>         contain specifically only
>         +# what it needs to run.
>         +#
>         +# There are some caveats which we try to deal with, such as
>         repeated files on different
>         +# packages, packages that include folders, wildcards, and
>         special packages.
>         +# Its also important to note that this method only works for
>         python files, and shared
>         +# libraries. Static libraries, header files and binaries need
>         to be dealt with manually.
>         +#
>         +# Author: Alejandro Enedino Hernandez Samaniego "aehs29"
>         <aehs29@gmail.com <mailto:aehs29@gmail.com>>
>         +
>         +
>         +import sys
>         +import subprocess
>         +import json
>         +import os
>         +
>         +# Hack to get native python search path (for folders), not
>         fond of it but it works for now
>         +pivot='recipe-sysroot-native'
>         +for p in sys.path:
>         +  if pivot in p:
>         +    nativelibfolder=p[:p.find(pivot)+len(pivot)]
>         +
>         +# Empty dict to hold the whole manifest
>         +new_manifest = {}
>         +
>         +# Check for repeated files, folders and wildcards
>         +allfiles=[]
>         +repeated=[]
>         +wildcards=[]
>         +
>         +hasfolders=[]
>         +allfolders=[]
>         +
>         +def isFolder(value):
>         +  if
>         os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib'))
>         or
>         os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64'))
>         or
>         os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
>         +    return True
>         +  else:
>         +    return False
>         +
>         +# Read existing JSON manifest
>         +with open('python2-manifest.json') as manifest:
>         +  old_manifest=json.load(manifest)
>         +
>         +
>         +# First pass to get core-package functionality, because we
>         base everything on the fact that core is actually working
>         +# Not exactly the same so it should not be a function
>         +print ("Getting dependencies for core package:")
>         +
>         +# Special call to check for core package
>         +output = subprocess.check_output([sys.executable,
>         'get_module_deps2.py', 'python-core-package'])
>         +for item in output.split():
>         +    # We append it so it doesnt hurt what we currently have:
>         +    if item not in old_manifest['core']['files']:
>         +        # We use the same data structure since its the one
>         which will be used to check
>         +        # dependencies for other packages
>         +        old_manifest['core']['files'].append(item)
>         +
>         +for value in old_manifest['core']['files']:
>         +  # Ignore folders, since we don't import those, difficult to
>         handle multilib
>         +  if isFolder(value):
>         +    # Pass it directly
>         +    if value not in old_manifest['core']['files']:
>         +      old_manifest['core']['files'].append(value)
>         +  # Ignore binaries, since we don't import those, assume it
>         was added correctly (manually)
>         +  if '${bindir}' in value:
>         +    # Pass it directly
>         +    if value not in old_manifest['core']['files']:
>         +      old_manifest['core']['files'].append(value)
>         +    continue
>         +  # Ignore empty values
>         +  if value == '':
>         +    continue
>         +  if '${includedir}' in value:
>         +    if value not in old_manifest['core']['files']:
>         +      old_manifest['core']['files'].append(value)
>         +    continue
>         +  # Get module name , shouldnt be affected by libdir/bindir
>         +  value =
>         os.path.splitext(os.path.basename(os.path.normpath(value)))[0]
>         +
>         +
>         +  # Launch separate task for each module for deterministic
>         behavior
>         +  # Each module will only import what is necessary for it to
>         work in specific
>         +  print ('Getting dependencies for module: %s' % value)
>         +  output = subprocess.check_output([sys.executable,
>         'get_module_deps2.py', '%s' % value])
>         +  for item in output.split():
>         +    # We append it so it doesnt hurt what we currently have:
>         +    if item not in old_manifest['core']['files']:
>         +      old_manifest['core']['files'].append(item)
>         +
>         +# We check which packages include folders
>         +for key in old_manifest:
>         +    for value in old_manifest[key]['files']:
>         +        # Ignore folders, since we don't import those,
>         difficult to handle multilib
>         +        if isFolder(value):
>         +            print ('%s is a folder' % value)
>         +            if key not in hasfolders:
>         +                hasfolders.append(key)
>         +            if value not in allfolders:
>         +                allfolders.append(value)
>         +
>         +for key in old_manifest:
>         +    # Use an empty dict as data structure to hold data for
>         each package and fill it up
>         +    new_manifest[key]={}
>         +    new_manifest[key]['files']=[]
>         +    new_manifest[key]['rdepends']=[]
>         +    # All packages should depend on core
>         +    if key != 'core':
>         +         new_manifest[key]['rdepends'].append('core')
>         +    new_manifest[key]['summary']=old_manifest[key]['summary']
>         +
>         +    # Handle special cases, we assume that when they were
>         manually added
>         +    # to the manifest we knew what we were doing.
>         +    print ('Handling package %s' % key)
>         +    special_packages=['misc', 'modules', 'dev']
>         +    if key in special_packages or 'staticdev' in key:
>         +        print('Passing %s package directly' % key)
>         +        new_manifest[key]=old_manifest[key]
>         +        continue
>         +
>         +    for value in old_manifest[key]['files']:
>         +        # We already handled core on the first pass
>         +        if key == 'core':
>         +            new_manifest[key]['files'].append(value)
>         +            continue
>         +        # Ignore folders, since we don't import those,
>         difficult to handle multilib
>         +        if isFolder(value):
>         +            # Pass folders directly
>         +            new_manifest[key]['files'].append(value)
>         +        # Ignore binaries, since we don't import those
>         +        if '${bindir}' in value:
>         +            # Pass it directly to the new manifest data structure
>         +            if value not in new_manifest[key]['files']:
>         +                new_manifest[key]['files'].append(value)
>         +            continue
>         +        # Ignore empty values
>         +        if value == '':
>         +            continue
>         +        if '${includedir}' in value:
>         +            if value not in new_manifest[key]['files']:
>         +                new_manifest[key]['files'].append(value)
>         +            continue
>         +        # Get module name , shouldnt be affected by libdir/bindir
>         +        value =
>         os.path.splitext(os.path.basename(os.path.normpath(value)))[0]
>         +
>         +        # Launch separate task for each module for
>         deterministic behavior
>         +        # Each module will only import what is necessary for
>         it to work in specific
>         +        print ('Getting dependencies for module: %s' % value)
>         +        output = subprocess.check_output([sys.executable,
>         'get_module_deps2.py', '%s' % value])
>         +
>         +        # We can print dependencies for debugging purposes
>         +        #print (output)
>         +        # Output will have all dependencies
>         +        for item in output.split():
>         +
>         +            # Warning: This first part is ugly
>         +            # One of the dependencies that was found, could
>         be inside of one of the folders included by another package
>         +            # We need to check if this happens so we can add
>         the package containing the folder as an RDEPENDS
>         +            # e.g. Folder encodings contained in codecs
>         +            # This would be solved if no packages included
>         any folders
>         +
>         +            # This can be done in two ways:
>         +            # 1 - We assume that if we take out the filename
>         from the path we would get
>         +            #   the folder string, then we would check if
>         folder string is in the list of folders
>         +            #   This would not work if a package contains a
>         folder which contains another folder
>         +            #   e.g. path/folder1/folder2/filename
>         folder_string= path/folder1/folder2
>         +            #   folder_string would not match any value
>         contained in the list of folders
>         +            #
>         +            # 2 - We do it the other way around, checking if
>         the folder is contained in the path
>         +            #   e.g. path/folder1/folder2/filename
>         folder_string= path/folder1/folder2
>         +            #   is folder_string inside
>         path/folder1/folder2/filename?,
>         +            #   Yes, it works, but we waste a couple of
>         milliseconds.
>         +
>         +            inFolders=False
>         +            for folder in allfolders:
>         +                if folder in item:
>         +                    inFolders = True # Did we find a folder?
>         +                    folderFound = False # Second flag to
>         break inner for
>         +                    # Loop only through packages which
>         contain folders
>         +                    for keyfolder in hasfolders:
>         +                        if (folderFound == False):
>         +                            #print("Checking folder %s on
>         package %s" % (item,keyfolder))
>         +                            for file_folder in
>         old_manifest[keyfolder]['files']:
>         +                                if file_folder==folder:
>         +                                    print ('%s found in %s' %
>         (folder, keyfolder))
>         +                                    folderFound = True
>         +                                    if keyfolder not in
>         new_manifest[key]['rdepends'] and keyfolder != key:
>         + new_manifest[key]['rdepends'].append(keyfolder)
>         +                        else:
>         +                            break
>         +
>         +            # A folder was found so we're done with this
>         item, we can go on
>         +            if inFolders:
>         +                continue
>         +
>         +            # We might already have it on the dictionary
>         since it could depend on a (previously checked) module
>         +            if item not in new_manifest[key]['files']:
>         +                # Handle core as a special package, we
>         already did it so we pass it to NEW data structure directly
>         +                if key=='core':
>         +                  print('Adding %s to %s FILES' % (item, key))
>         +                  if item.endswith('*'):
>         +                      wildcards.append(item)
>         +                  new_manifest[key]['files'].append(item)
>         +
>         +                  # Check for repeated files
>         +                  if item not in allfiles:
>         +                      allfiles.append(item)
>         +                  else:
>         +                      repeated.append(item)
>         +
>         +                else:
>         +
>         +                    # Check if this dependency is already
>         contained on another package, so we add it
>         +                    # as an RDEPENDS, or if its not, it means
>         it should be contained on the current
>         +                    # package, so we should add it to FILES
>         +                    for newkey in old_manifest:
>         +                        # Debug
>         +                        #print("Checking %s " % item + " in
>         %s" % newkey)
>         +                        if item in old_manifest[newkey]['files']:
>         +                                # Since were nesting, we need
>         to check its not the same key
>         +                                if(newkey!=key):
>         +                                    if newkey not in
>         new_manifest[key]['rdepends']:
>         +                                       # Add it to the new
>         manifest data struct
>         +                                       # Debug
>         +                                       print('Adding %s to %s
>         RDEPENDS, because it contains %s' % (newkey, key, item))
>         +  new_manifest[key]['rdepends'].append(newkey)
>         +                                    break
>         +                    else:
>         +                      # Debug
>         +                      print('Adding %s to %s FILES' % (item,
>         key))
>         +                      # Since it wasnt found on another
>         package, its not an RDEP, so add it to FILES for this package
>         +                      new_manifest[key]['files'].append(item)
>         +                      if item.endswith('*'):
>         +                          wildcards.append(item)
>         +                      if item not in allfiles:
>         +                          allfiles.append(item)
>         +                      else:
>         +                          repeated.append(item)
>         +
>         +print ('The following files are repeated (contained in more
>         than one package), please check which package should get it:')
>         +print (repeated)
>         +print('The following files contain wildcards, please check
>         they are necessary')
>         +print(wildcards)
>         +print('The following files contain folders, please check they
>         are necessary')
>         +print(hasfolders)
>         +
>         +# Sort it just so it looks nice
>         +for key in new_manifest:
>         +    new_manifest[key]['files'].sort()
>         +    new_manifest[key]['rdepends'].sort()
>         +
>         +# Create the manifest from the data structure that was built
>         +with open('python2-manifest.json.ne
>         <http://python2-manifest.json.ne>w','w') as outfile:
>         +    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
>         diff --git
>         a/meta/recipes-devtools/python/python/get_module_deps2.py
>         b/meta/recipes-devtools/python/python/get_module_deps2.py
>         new file mode 100644
>         index 0000000..73e7c6f
>         --- /dev/null
>         +++ b/meta/recipes-devtools/python/python/get_module_deps2.py
>         @@ -0,0 +1,112 @@
>         +# This script is launched on separate task for each python module
>         +# It checks for dependencies for that specific module and prints
>         +# them out, the output of this execution will have all
>         dependencies
>         +# for a specific module, which will be parsed an dealt on
>         create_manifest.py
>         +#
>         +# Author: Alejandro Enedino Hernandez Samaniego "aehs29"
>         <aehs29@gmail.com <mailto:aehs29@gmail.com>>
>         +
>         +
>         +# We can get a log per module, for all the dependencies that
>         were found, but its messy.
>         +debug=False
>         +
>         +import sys
>         +
>         +# We can get a list of the modules which are currently
>         required to run python
>         +# so we run python-core and get its modules, we then import
>         what we need
>         +# and check what modules are currently running, if we
>         substract them from the
>         +# modules we had initially, we get the dependencies for the
>         module we imported.
>         +
>         +# We use importlib to achieve this, so we also need to know
>         what modules importlib needs
>         +import importlib
>         +
>         +core_deps=set(sys.modules)
>         +
>         +def fix_path(dep_path):
>         +    import os
>         +    # We DONT want the path on our HOST system
>         +    pivot='recipe-sysroot-native'
>         +    dep_path=dep_path[dep_path.find(pivot)+len(pivot):]
>         +
>         +    if '/usr/bin' in dep_path:
>         +        dep_path = dep_path.replace('/usr/bin''${bindir}')
>         +
>         +    # Handle multilib, is there a better way?
>         +    if '/usr/lib32' in dep_path:
>         +        dep_path = dep_path.replace('/usr/lib32','${libdir}')
>         +    if '/usr/lib64' in dep_path:
>         +        dep_path = dep_path.replace('/usr/lib64','${libdir}')
>         +    if '/usr/lib' in dep_path:
>         +        dep_path = dep_path.replace('/usr/lib','${libdir}')
>         +    if '/usr/include' in dep_path:
>         +        dep_path =
>         dep_path.replace('/usr/include','${includedir}')
>         +    if '__init__.' in dep_path:
>         +        dep_path =  os.path.split(dep_path)[0]
>         +
>         +    # If a *.pyc file was imported, we replace it with *.py
>         (since we deal with PYCs on create_manifest)
>         +    if '.pyc' in dep_path:
>         +        dep_path = dep_path.replace('.pyc','.py')
>         +
>         +    return dep_path
>         +
>         +# Module to import was passed as an argument
>         +current_module =  str(sys.argv[1]).rstrip()
>         +if(debug==True):
>         +       log = open('log_%s' % current_module,'w')
>         +        log.write('Module %s generated the following
>         dependencies:\n' % current_module)
>         +try:
>         +    importlib.import_module('%s' % current_module)
>         +except ImportError as e:
>         +    if (debug==True):
>         +        log.write('Module was not found')
>         +    pass
>         +
>         +
>         +# Get current module dependencies, dif will contain a list of
>         specific deps for this module
>         +module_deps=set(sys.modules)
>         +
>         +# We handle the core package (1st pass on create_manifest.py)
>         as a special case
>         +if current_module == 'python-core-package':
>         +    dif = core_deps
>         +else:
>         +    dif = module_deps-core_deps
>         +
>         +
>         +# Check where each dependency came from
>         +for item in dif:
>         +    dep_path=''
>         +    try:
>         +        if (debug==True):
>         +            log.write('Calling: sys.modules[' + '%s' % item +
>         '].__file__\n')
>         +        dep_path = sys.modules['%s' % item].__file__
>         +    except AttributeError as e:
>         +        # Deals with thread (builtin module) not having
>         __file__ attribute
>         +       if debug==True:
>         +            log.write(item + ' ')
>         +            log.write(str(e))
>         +           log.write('\n')
>         +            pass
>         +    except NameError as e:
>         +        # Deals with NameError: name 'dep_path' is not defined
>         +        # because module is not found (wasn't compiled?),
>         e.g. bddsm
>         +        if (debug==True):
>         +            log.write(item+' ')
>         +            log.write(str(e))
>         +        pass
>         +
>         +    # Site-customize is a special case since we
>         (OpenEmbedded) put it there manually
>         +    if 'sitecustomize' in dep_path:
>         +        dep_path = '${libdir}/python2.7/sitecustomize.py'
>         +        # Prints out result, which is what will be used by
>         create_manifest
>         +        print (dep_path)
>         +        continue
>         +
>         +    dep_path = fix_path(dep_path)
>         +
>         +    if (debug==True):
>         +        log.write(dep_path+'\n')
>         +
>         +    # Prints out result, which is what will be used by
>         create_manifest
>         +    print (dep_path)
>         +
>         +if debug==True:
>         +    log.close()
>         diff --git
>         a/meta/recipes-devtools/python/python/python2-manifest.json
>         b/meta/recipes-devtools/python/python/python2-manifest.json
>         new file mode 100644
>         index 0000000..8ebc715
>         --- /dev/null
>         +++ b/meta/recipes-devtools/python/python/python2-manifest.json
>         @@ -0,0 +1,1032 @@
>         +{
>         +    "2to3": {
>         +        "files": [
>         +            "${bindir}/2to3",
>         +            "${libdir}/python2.7/lib2to3"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python automated Python 2 to 3 code
>         translator"
>         +    },
>         +    "argparse": {
>         +        "files": [
>         +            "${libdir}/python2.7/argparse.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "core",
>         +            "lang",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python command line argument parser"
>         +    },
>         +    "audio": {
>         +        "files": [
>         +            "${libdir}/python2.7/audiodev.py",
>         +            "${libdir}/python2.7/chunk.py",
>         +            "${libdir}/python2.7/lib-dynload/audioop.so",
>         +            "${libdir}/python2.7/lib-dynload/ossaudiodev.so",
>         +            "${libdir}/python2.7/sndhdr.py",
>         +            "${libdir}/python2.7/sunau.py",
>         +            "${libdir}/python2.7/sunaudio.py",
>         +            "${libdir}/python2.7/toaiff.py",
>         +            "${libdir}/python2.7/wave.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "crypt",
>         +            "fcntl",
>         +            "io",
>         +            "math"
>         +        ],
>         +        "summary": "Python Audio Handling"
>         +    },
>         +    "bsddb": {
>         +        "files": [
>         +            "${libdir}/python2.7/bsddb",
>         +            "${libdir}/python2.7/lib-dynload/_bsddb.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python bindings for the Berkeley Database"
>         +    },
>         +    "codecs": {
>         +        "files": [
>         +            "${libdir}/python2.7/gettext.py",
>         +            "${libdir}/python2.7/lib-dynload/_codecs_cn.so",
>         +            "${libdir}/python2.7/lib-dynload/_codecs_hk.so",
>         +            "${libdir}/python2.7/lib-dynload/_codecs_iso2022.so",
>         +            "${libdir}/python2.7/lib-dynload/_codecs_jp.so",
>         +            "${libdir}/python2.7/lib-dynload/_codecs_kr.so",
>         +            "${libdir}/python2.7/lib-dynload/_codecs_tw.so",
>         +            "${libdir}/python2.7/lib-dynload/_multibytecodec.so",
>         +            "${libdir}/python2.7/lib-dynload/unicodedata.so",
>         +            "${libdir}/python2.7/locale.py",
>         +            "${libdir}/python2.7/stringprep.py",
>         +            "${libdir}/python2.7/xdrlib.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io",
>         +            "lang"
>         +        ],
>         +        "summary": "Python codec"
>         +    },
>         +    "compile": {
>         +        "files": [
>         +            "${libdir}/python2.7/compileall.py",
>         +            "${libdir}/python2.7/py_compile.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python bytecode compilation support"
>         +    },
>         +    "compiler": {
>         +        "files": [
>         +            "${libdir}/python2.7/compiler"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io",
>         +            "lang"
>         +        ],
>         +        "summary": "Python compiler support"
>         +    },
>         +    "compression": {
>         +        "files": [
>         +            "${libdir}/python2.7/gzip.py",
>         +            "${libdir}/python2.7/lib-dynload/bz2.so",
>         +            "${libdir}/python2.7/tarfile.py",
>         +            "${libdir}/python2.7/zipfile.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io",
>         +            "shell",
>         +            "unixadmin",
>         +            "zlib"
>         +        ],
>         +        "summary": "Python high-level compression support"
>         +    },
>         +    "contextlib": {
>         +        "files": [
>         +            "${libdir}/python2.7/contextlib.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "lang"
>         +        ],
>         +        "summary": "Python utilities for with-statementcontexts."
>         +    },
>         +    "core": {
>         +        "files": [
>         +            "${bindir}/python*",
>         +            "${includedir}/python2.7/pyconfig*.h",
>         +            "${libdir}/python2.7/ConfigParser.py",
>         +            "${libdir}/python2.7/UserDict.py",
>         +            "${libdir}/python2.7/UserList.py",
>         +            "${libdir}/python2.7/UserString.py",
>         +            "${libdir}/python2.7/__future__.py",
>         +            "${libdir}/python2.7/_abcoll.py",
>         +            "${libdir}/python2.7/_sysconfigdata.py",
>         +            "${libdir}/python2.7/_weakrefset.py",
>         +            "${libdir}/python2.7/abc.py",
>         +            "${libdir}/python2.7/ast.py",
>         +            "${libdir}/python2.7/atexit.py",
>         +            "${libdir}/python2.7/codecs.py",
>         +            "${libdir}/python2.7/collections.py",
>         +            "${libdir}/python2.7/copy.py",
>         +            "${libdir}/python2.7/copy_reg.py",
>         +            "${libdir}/python2.7/encodings",
>         +            "${libdir}/python2.7/encodings/aliases.py",
>         +            "${libdir}/python2.7/encodings/utf_8.py",
>         +            "${libdir}/python2.7/genericpath.py",
>         +            "${libdir}/python2.7/getopt.py",
>         +            "${libdir}/python2.7/heapq.py",
>         +            "${libdir}/python2.7/importlib",
>         +            "${libdir}/python2.7/keyword.py",
>         +            "${libdir}/python2.7/lib-dynload/_collections.so",
>         +            "${libdir}/python2.7/lib-dynload/_heapq.so",
>         +            "${libdir}/python2.7/lib-dynload/_locale.so",
>         +            "${libdir}/python2.7/lib-dynload/_struct.so",
>         +            "${libdir}/python2.7/lib-dynload/binascii.so",
>         +            "${libdir}/python2.7/lib-dynload/itertools.so",
>         +            "${libdir}/python2.7/lib-dynload/operator.so",
>         +            "${libdir}/python2.7/lib-dynload/readline.so",
>         +            "${libdir}/python2.7/lib-dynload/strop.so",
>         +            "${libdir}/python2.7/lib-dynload/time.so",
>         +            "${libdir}/python2.7/lib-dynload/xreadlines.so",
>         +            "${libdir}/python2.7/linecache.py",
>         +            "${libdir}/python2.7/new.py",
>         +            "${libdir}/python2.7/os.py",
>         +            "${libdir}/python2.7/platform.py",
>         +            "${libdir}/python2.7/posixpath.py",
>         +            "${libdir}/python2.7/re.py",
>         +            "${libdir}/python2.7/rlcompleter.py",
>         +            "${libdir}/python2.7/site.py",
>         +            "${libdir}/python2.7/sitecustomize.py",
>         +            "${libdir}/python2.7/sre_compile.py",
>         +            "${libdir}/python2.7/sre_constants.py",
>         +            "${libdir}/python2.7/sre_parse.py",
>         +            "${libdir}/python2.7/stat.py",
>         +            "${libdir}/python2.7/string.py",
>         +            "${libdir}/python2.7/struct.py",
>         +            "${libdir}/python2.7/sysconfig.py",
>         +            "${libdir}/python2.7/traceback.py",
>         +            "${libdir}/python2.7/types.py",
>         +            "${libdir}/python2.7/warnings.py",
>         +            "${libdir}/python2.7/weakref.py"
>         +        ],
>         +        "rdepends": [],
>         +        "summary": "Python interpreter and core modules"
>         +    },
>         +    "crypt": {
>         +        "files": [
>         +            "${libdir}/python2.7/hashlib.py",
>         +            "${libdir}/python2.7/lib-dynload/_hashlib.so",
>         +            "${libdir}/python2.7/lib-dynload/crypt.so",
>         +            "${libdir}/python2.7/md5.py",
>         +            "${libdir}/python2.7/sha.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python basic cryptographic and hashing
>         support"
>         +    },
>         +    "ctypes": {
>         +        "files": [
>         +            "${libdir}/python2.7/ctypes",
>         +            "${libdir}/python2.7/lib-dynload/_ctypes.so",
>         +            "${libdir}/python2.7/lib-dynload/_ctypes_test.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python C types support"
>         +    },
>         +    "curses": {
>         +        "files": [
>         +            "${libdir}/python2.7/curses",
>         +            "${libdir}/python2.7/lib-dynload/_curses.so",
>         +            "${libdir}/python2.7/lib-dynload/_curses_panel.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python curses support"
>         +    },
>         +    "datetime": {
>         +        "files": [
>         +            "${libdir}/python2.7/_strptime.py",
>         +            "${libdir}/python2.7/calendar.py",
>         +            "${libdir}/python2.7/lib-dynload/datetime.so"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "core",
>         +            "lang"
>         +        ],
>         +        "summary": "Python calendar and time support"
>         +    },
>         +    "db": {
>         +        "files": [
>         +            "${libdir}/python2.7/anydbm.py",
>         +            "${libdir}/python2.7/dbhash.py",
>         +            "${libdir}/python2.7/dumbdbm.py",
>         +            "${libdir}/python2.7/lib-dynload/dbm.so",
>         +            "${libdir}/python2.7/whichdb.py"
>         +        ],
>         +        "rdepends": [
>         +            "bsddb",
>         +            "core",
>         +            "gdbm"
>         +        ],
>         +        "summary": "Python file-based database support"
>         +    },
>         +    "debugger": {
>         +        "files": [
>         +            "${libdir}/python2.7/bdb.py",
>         +            "${libdir}/python2.7/pdb.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io",
>         +            "lang",
>         +            "pprint",
>         +            "shell"
>         +        ],
>         +        "summary": "Python debugger"
>         +    },
>         +    "dev": {
>         +        "files": [
>         +            "${base_libdir}/*.a",
>         +            "${base_libdir}/*.o",
>         +            "${datadir}/aclocal",
>         +            "${datadir}/pkgconfig",
>         +            "${includedir}",
>         +            "${libdir}/*.a",
>         +            "${libdir}/*.la",
>         +            "${libdir}/*.o",
>         +            "${libdir}/lib*${SOLIBSDEV}",
>         +            "${libdir}/pkgconfig",
>         +            "${libdir}/python2.7/config/Makefile"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python development package"
>         +    },
>         +    "difflib": {
>         +        "files": [
>         +            "${libdir}/python2.7/difflib.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "lang"
>         +        ],
>         +        "summary": "Python helpers for computing deltas
>         between objects"
>         +    },
>         +    "distutils": {
>         +        "files": [
>         +            "${libdir}/python2.7/config",
>         +            "${libdir}/python2.7/distutils"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python Distribution Utilities"
>         +    },
>         +    "distutils-staticdev": {
>         +        "files": [
>         +            "${libdir}/python2.7/config/lib*.a"
>         +        ],
>         +        "rdepends": [
>         +            "distutils"
>         +        ],
>         +        "summary": "Python distribution utilities (static
>         libraries)"
>         +    },
>         +    "doctest": {
>         +        "files": [
>         +            "${libdir}/python2.7/doctest.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "crypt",
>         +            "debugger",
>         +            "difflib",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "pprint",
>         +            "shell",
>         +            "unittest"
>         +        ],
>         +        "summary": "Python framework for running examples in
>         docstrings"
>         +    },
>         +    "email": {
>         +        "files": [
>         +            "${libdir}/python2.7/email",
>         +            "${libdir}/python2.7/imaplib.py"
>         +        ],
>         +        "rdepends": [
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "netclient",
>         +            "pickle",
>         +            "subprocess",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python email support"
>         +    },
>         +    "fcntl": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/fcntl.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python's fcntl interface"
>         +    },
>         +    "gdbm": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/gdbm.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python GNU database support"
>         +    },
>         +    "hotshot": {
>         +        "files": [
>         +            "${libdir}/python2.7/hotshot",
>         +            "${libdir}/python2.7/lib-dynload/_hotshot.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python hotshot performance profiler"
>         +    },
>         +    "html": {
>         +        "files": [
>         +            "${libdir}/python2.7/HTMLParser.py",
>         +            "${libdir}/python2.7/formatter.py",
>         +            "${libdir}/python2.7/htmlentitydefs.py",
>         +            "${libdir}/python2.7/htmllib.py",
>         +            "${libdir}/python2.7/markupbase.py",
>         +            "${libdir}/python2.7/sgmllib.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python HTML processing support"
>         +    },
>         +    "idle": {
>         +        "files": [
>         +            "${bindir}/idle",
>         +            "${libdir}/python2.7/idlelib"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python Integrated Development Environment"
>         +    },
>         +    "image": {
>         +        "files": [
>         +            "${libdir}/python2.7/colorsys.py",
>         +            "${libdir}/python2.7/imghdr.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python graphical image handling"
>         +    },
>         +    "io": {
>         +        "files": [
>         +            "${libdir}/python2.7/StringIO.py",
>         +            "${libdir}/python2.7/_pyio.py",
>         +            "${libdir}/python2.7/io.py",
>         +            "${libdir}/python2.7/lib-dynload/_io.so",
>         +            "${libdir}/python2.7/lib-dynload/_socket.so",
>         +            "${libdir}/python2.7/lib-dynload/_ssl.so",
>         +            "${libdir}/python2.7/lib-dynload/cStringIO.so",
>         +            "${libdir}/python2.7/lib-dynload/select.so",
>         +            "${libdir}/python2.7/lib-dynload/termios.so",
>         +            "${libdir}/python2.7/pipes.py",
>         +            "${libdir}/python2.7/socket.py",
>         +            "${libdir}/python2.7/ssl.py",
>         +            "${libdir}/python2.7/tempfile.py"
>         +        ],
>         +        "rdepends": [
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "fcntl",
>         +            "lang",
>         +            "math",
>         +            "netclient",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python low-level I/O"
>         +    },
>         +    "json": {
>         +        "files": [
>         +            "${libdir}/python2.7/json",
>         +            "${libdir}/python2.7/lib-dynload/_json.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python JSON support"
>         +    },
>         +    "lang": {
>         +        "files": [
>         +            "${libdir}/python2.7/bisect.py",
>         +            "${libdir}/python2.7/code.py",
>         +            "${libdir}/python2.7/codeop.py",
>         +            "${libdir}/python2.7/dis.py",
>         +            "${libdir}/python2.7/functools.py",
>         +            "${libdir}/python2.7/inspect.py",
>         +            "${libdir}/python2.7/lib-dynload/_bisect.so",
>         +            "${libdir}/python2.7/lib-dynload/_functools.so",
>         +            "${libdir}/python2.7/lib-dynload/array.so",
>         +            "${libdir}/python2.7/lib-dynload/parser.so",
>         +            "${libdir}/python2.7/opcode.py",
>         +            "${libdir}/python2.7/repr.py",
>         +            "${libdir}/python2.7/symbol.py",
>         +            "${libdir}/python2.7/token.py",
>         +            "${libdir}/python2.7/tokenize.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python low-level language support"
>         +    },
>         +    "logging": {
>         +        "files": [
>         +            "${libdir}/python2.7/logging"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io",
>         +            "threading"
>         +        ],
>         +        "summary": "Python logging support"
>         +    },
>         +    "mailbox": {
>         +        "files": [
>         +            "${libdir}/python2.7/mailbox.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "datetime",
>         +            "email",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "mime",
>         +            "netclient",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python mailbox format support"
>         +    },
>         +    "math": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/_random.so",
>         +            "${libdir}/python2.7/lib-dynload/cmath.so",
>         +            "${libdir}/python2.7/lib-dynload/math.so",
>         +            "${libdir}/python2.7/random.py",
>         +            "${libdir}/python2.7/sets.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "crypt"
>         +        ],
>         +        "summary": "Python math support"
>         +    },
>         +    "mime": {
>         +        "files": [
>         +            "${libdir}/python2.7/MimeWriter.py",
>         +            "${libdir}/python2.7/mimetools.py",
>         +            "${libdir}/python2.7/mimetypes.py",
>         +            "${libdir}/python2.7/quopri.py",
>         +            "${libdir}/python2.7/rfc822.py",
>         +            "${libdir}/python2.7/uu.py"
>         +        ],
>         +        "rdepends": [
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "netclient",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python MIME handling APIs"
>         +    },
>         +    "mmap": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/mmap.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python memory-mapped file support"
>         +    },
>         +    "modules": {
>         +        "files": [],
>         +        "rdepends": [
>         +            "2to3",
>         +            "argparse",
>         +            "audio",
>         +            "bsddb",
>         +            "codecs",
>         +            "compile",
>         +            "compiler",
>         +            "compression",
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "ctypes",
>         +            "curses",
>         +            "datetime",
>         +            "db",
>         +            "debugger",
>         +            "difflib",
>         +            "distutils",
>         +            "doctest",
>         +            "email",
>         +            "fcntl",
>         +            "gdbm",
>         +            "hotshot",
>         +            "html",
>         +            "idle",
>         +            "image",
>         +            "io",
>         +            "json",
>         +            "lang",
>         +            "logging",
>         +            "mailbox",
>         +            "math",
>         +            "mime",
>         +            "mmap",
>         +            "multiprocessing",
>         +            "netclient",
>         +            "netserver",
>         +            "numbers",
>         +            "pickle",
>         +            "pkgutil",
>         +            "plistlib",
>         +            "pprint",
>         +            "profile",
>         +            "pydoc",
>         +            "re",
>         +            "resource",
>         +            "robotparser",
>         +            "shell",
>         +            "smtpd",
>         +            "sqlite3",
>         +            "sqlite3",
>         +            "stringold",
>         +            "subprocess",
>         +            "syslog",
>         +            "terminal",
>         +            "textutils",
>         +            "threading",
>         +            "tkinter",
>         +            "unittest",
>         +            "unixadmin",
>         +            "xml",
>         +            "xmlrpc",
>         +            "zlib"
>         +        ],
>         +        "summary": "All Python modules"
>         +    },
>         +    "multiprocessing": {
>         +        "files": [
>         +           
>         "${libdir}/python2.7/lib-dynload/_multiprocessing.so",
>         +            "${libdir}/python2.7/multiprocessing"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "fcntl",
>         +            "io",
>         +            "pickle",
>         +            "subprocess",
>         +            "threading"
>         +        ],
>         +        "summary": "Python multiprocessing support"
>         +    },
>         +    "netclient": {
>         +        "files": [
>         +            "${libdir}/python2.7/Cookie.py",
>         +            "${libdir}/python2.7/_LWPCookieJar.py",
>         +            "${libdir}/python2.7/_MozillaCookieJar.py",
>         +            "${libdir}/python2.7/base64.py",
>         +            "${libdir}/python2.7/cookielib.py",
>         +            "${libdir}/python2.7/ftplib.py",
>         +            "${libdir}/python2.7/hmac.py",
>         +            "${libdir}/python2.7/httplib.py",
>         +            "${libdir}/python2.7/nntplib.py",
>         +            "${libdir}/python2.7/poplib.py",
>         +            "${libdir}/python2.7/smtplib.py",
>         +            "${libdir}/python2.7/telnetlib.py",
>         +            "${libdir}/python2.7/urllib.py",
>         +            "${libdir}/python2.7/urllib2.py",
>         +            "${libdir}/python2.7/urlparse.py",
>         +            "${libdir}/python2.7/uuid.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "ctypes",
>         +            "datetime",
>         +            "email",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "mime",
>         +            "pickle",
>         +            "subprocess",
>         +            "textutils",
>         +            "threading"
>         +        ],
>         +        "summary": "Python Internet Protocol clients"
>         +    },
>         +    "netserver": {
>         +        "files": [
>         +            "${libdir}/python2.7/BaseHTTPServer.py",
>         +            "${libdir}/python2.7/CGIHTTPServer.py",
>         +            "${libdir}/python2.7/SimpleHTTPServer.py",
>         +            "${libdir}/python2.7/SocketServer.py",
>         +            "${libdir}/python2.7/cgi.py"
>         +        ],
>         +        "rdepends": [
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "mime",
>         +            "netclient",
>         +            "shell",
>         +            "textutils",
>         +            "threading",
>         +            "unixadmin"
>         +        ],
>         +        "summary": "Python Internet Protocol servers"
>         +    },
>         +    "numbers": {
>         +        "files": [
>         +            "${libdir}/python2.7/decimal.py",
>         +            "${libdir}/python2.7/fractions.py",
>         +            "${libdir}/python2.7/numbers.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "core",
>         +            "lang",
>         +            "math",
>         +            "threading"
>         +        ],
>         +        "summary": "Python number APIs"
>         +    },
>         +    "pickle": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/cPickle.so",
>         +            "${libdir}/python2.7/pickle.py",
>         +            "${libdir}/python2.7/pickletools.py",
>         +            "${libdir}/python2.7/shelve.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io"
>         +        ],
>         +        "summary": "Python serialisation/persistence support"
>         +    },
>         +    "pkgutil": {
>         +        "files": [
>         +            "${libdir}/python2.7/pkgutil.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python package extension utility support"
>         +    },
>         +    "plistlib": {
>         +        "files": [
>         +            "${libdir}/python2.7/plistlib.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "datetime",
>         +            "io"
>         +        ],
>         +        "summary": "Generate and parse Mac OS X .plist files"
>         +    },
>         +    "pprint": {
>         +        "files": [
>         +            "${libdir}/python2.7/pprint.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io"
>         +        ],
>         +        "summary": "Python pretty-print support"
>         +    },
>         +    "profile": {
>         +        "files": [
>         +            "${libdir}/python2.7/cProfile.py",
>         +            "${libdir}/python2.7/lib-dynload/_lsprof.so",
>         +            "${libdir}/python2.7/profile.py",
>         +            "${libdir}/python2.7/pstats.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "core",
>         +            "lang",
>         +            "resource",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python basic performance profiling support"
>         +    },
>         +    "pydoc": {
>         +        "files": [
>         +            "${bindir}/pydoc",
>         +            "${libdir}/python2.7/pydoc.py",
>         +            "${libdir}/python2.7/pydoc_data"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "core",
>         +            "lang",
>         +            "pkgutil"
>         +        ],
>         +        "summary": "Python interactive help support"
>         +    },
>         +    "re": {
>         +        "files": [
>         +            "${libdir}/python2.7/sre.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python Regular Expression APIs"
>         +    },
>         +    "resource": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/resource.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python resource control interface"
>         +    },
>         +    "robotparser": {
>         +        "files": [
>         +            "${libdir}/python2.7/robotparser.py"
>         +        ],
>         +        "rdepends": [
>         +            "contextlib",
>         +            "core",
>         +            "io",
>         +            "lang",
>         +            "netclient",
>         +            "textutils"
>         +        ],
>         +        "summary": "Python robots.txt parser"
>         +    },
>         +    "shell": {
>         +        "files": [
>         +            "${libdir}/python2.7/cmd.py",
>         +            "${libdir}/python2.7/commands.py",
>         +            "${libdir}/python2.7/dircache.py",
>         +            "${libdir}/python2.7/fnmatch.py",
>         +            "${libdir}/python2.7/glob.py",
>         +            "${libdir}/python2.7/popen2.py",
>         +            "${libdir}/python2.7/shlex.py",
>         +            "${libdir}/python2.7/shutil.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io",
>         +            "unixadmin"
>         +        ],
>         +        "summary": "Python shell-like functionality"
>         +    },
>         +    "smtpd": {
>         +        "files": [
>         +            "${bindir}/smtpd.py",
>         +            "${libdir}/python2.7/asynchat.py",
>         +            "${libdir}/python2.7/asyncore.py",
>         +            "${libdir}/python2.7/smtpd.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "fcntl",
>         +            "io",
>         +            "lang"
>         +        ],
>         +        "summary": "Python Simple Mail Transport Daemon"
>         +    },
>         +    "sqlite3": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/_sqlite3.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python Sqlite3 database support"
>         +    },
>         +    "sqlite3-tests": {
>         +        "files": [
>         +            "${libdir}/python2.7/sqlite3/test"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "tests"
>         +        ],
>         +        "summary": "Python Sqlite3 database support tests"
>         +    },
>         +    "stringold": {
>         +        "files": [
>         +            "${libdir}/python2.7/stringold.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python string APIs [deprecated]"
>         +    },
>         +    "subprocess": {
>         +        "files": [
>         +            "${libdir}/python2.7/subprocess.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "fcntl",
>         +            "io",
>         +            "pickle"
>         +        ],
>         +        "summary": "Python subprocess support"
>         +    },
>         +    "syslog": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/syslog.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python syslog interface"
>         +    },
>         +    "terminal": {
>         +        "files": [
>         +            "${libdir}/python2.7/pty.py",
>         +            "${libdir}/python2.7/tty.py"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io"
>         +        ],
>         +        "summary": "Python terminal controlling support"
>         +    },
>         +    "tests": {
>         +        "files": [
>         +            "${libdir}/python2.7/test"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python tests"
>         +    },
>         +    "textutils": {
>         +        "files": [
>         +            "${libdir}/python2.7/csv.py",
>         +            "${libdir}/python2.7/lib-dynload/_csv.so",
>         +            "${libdir}/python2.7/optparse.py",
>         +            "${libdir}/python2.7/textwrap.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "core",
>         +            "io",
>         +            "lang"
>         +        ],
>         +        "summary": "Python option parsin"
>         +    },
>         +    "threading": {
>         +        "files": [
>         +            "${libdir}/python2.7/Queue.py",
>         +            "${libdir}/python2.7/_threading_local.py",
>         +            "${libdir}/python2.7/dummy_thread.py",
>         +            "${libdir}/python2.7/dummy_threading.py",
>         +            "${libdir}/python2.7/mutex.py",
>         +            "${libdir}/python2.7/threading.py"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python threading & synchronization support"
>         +    },
>         +    "tkinter": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-tk"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python Tcl/Tk bindings"
>         +    },
>         +    "unittest": {
>         +        "files": [
>         +            "${libdir}/python2.7/unittest"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "difflib",
>         +            "io",
>         +            "lang",
>         +            "pprint",
>         +            "shell"
>         +        ],
>         +        "summary": "Python unit testing framework"
>         +    },
>         +    "unixadmin": {
>         +        "files": [
>         +            "${libdir}/python2.7/getpass.py",
>         +            "${libdir}/python2.7/lib-dynload/grp.so",
>         +            "${libdir}/python2.7/lib-dynload/nis.so"
>         +        ],
>         +        "rdepends": [
>         +            "core",
>         +            "io"
>         +        ],
>         +        "summary": "Python Unix administration support"
>         +    },
>         +    "xml": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/_elementtree.so",
>         +            "${libdir}/python2.7/lib-dynload/pyexpat.so",
>         +            "${libdir}/python2.7/xml"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python basic XML support"
>         +    },
>         +    "xmlrpc": {
>         +        "files": [
>         +            "${libdir}/python2.7/DocXMLRPCServer.py",
>         +            "${libdir}/python2.7/SimpleXMLRPCServer.py"
>         +        ],
>         +        "rdepends": [
>         +            "codecs",
>         +            "compression",
>         +            "contextlib",
>         +            "core",
>         +            "crypt",
>         +            "datetime",
>         +            "fcntl",
>         +            "io",
>         +            "lang",
>         +            "math",
>         +            "mime",
>         +            "netclient",
>         +            "netserver",
>         +            "pkgutil",
>         +            "pydoc",
>         +            "textutils",
>         +            "threading",
>         +            "xml",
>         +            "zlib"
>         +        ],
>         +        "summary": "Python XML-RPC support"
>         +    },
>         +    "zlib": {
>         +        "files": [
>         +            "${libdir}/python2.7/lib-dynload/zlib.so"
>         +        ],
>         +        "rdepends": [
>         +            "core"
>         +        ],
>         +        "summary": "Python zlib compression support"
>         +    }
>         +}
>         \ No newline at end of file
>         diff --git
>         a/meta/recipes-devtools/python/python/sitecustomize.py
>         b/meta/recipes-devtools/python/python/sitecustomize.py
>         index 2739018..4c8b5e2 100644
>         --- a/meta/recipes-devtools/python/python/sitecustomize.py
>         +++ b/meta/recipes-devtools/python/python/sitecustomize.py
>         @@ -27,19 +27,11 @@ def __enableReadlineSupport():
>              except IOError:
>                  pass
>
>         -def __enableDefaultEncoding():
>         -    import sys
>         -    try:
>         -        sys.setdefaultencoding( "utf8" )
>         -    except LookupError:
>         -        pass
>         -
>          import sys
>          try:
>              import rlcompleter, readline
>          except ImportError:
>              pass
>          else:
>         -    __enableDefaultEncoding()
>              __registerExitHandler()
>              __enableReadlineSupport()
>         diff --git a/meta/recipes-devtools/python/python_2.7.13.bb
>         <http://python_2.7.13.bb>
>         b/meta/recipes-devtools/python/python_2.7.13.bb
>         <http://python_2.7.13.bb>
>         index 754c029..dbafb95 100644
>         --- a/meta/recipes-devtools/python/python_2.7.13.bb
>         <http://python_2.7.13.bb>
>         +++ b/meta/recipes-devtools/python/python_2.7.13.bb
>         <http://python_2.7.13.bb>
>         @@ -1,5 +1,7 @@
>          require python.inc
>         +
>          DEPENDS = "python-native libffi bzip2 gdbm openssl readline
>         sqlite3 zlib"
>         +
>          PR = "${INC_PR}"
>
>          DISTRO_SRC_URI ?= "file://sitecustomize.py"
>         @@ -145,11 +147,9 @@ py_package_preprocess () {
>              python -m py_compile
>         ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
>          }
>
>         -require python-${PYTHON_MAJMIN}-manifest.inc
>
>          # manual dependency additions
>          RPROVIDES_${PN}-core = "${PN}"
>         -RRECOMMENDS_${PN}-core = "${PN}-readline"
>          RRECOMMENDS_${PN}-core_append_class-nativesdk = "
>         nativesdk-python-modules"
>          RRECOMMENDS_${PN}-crypt = "openssl"
>
>         @@ -193,3 +193,87 @@ FILES_${PN}-man = "${datadir}/man"
>          RDEPENDS_${PN}-modules_remove =
>         "${@bb.utils.contains('PACKAGECONFIG', 'bdb', '',
>         '${PN}-bsddb', d)}"
>
>          BBCLASSEXTEND = "nativesdk"
>         +
>         +RPROVIDES_${PN} += "${PN}-modules"
>         +
>         +# We want bytecode precompiled .py files (.pyc's) by default
>         +# but the user may set it on their own conf
>         +
>         +INCLUDE_PYCS ?= "1"
>         +
>         +python(){
>         +
>         +    pythondir = d.getVar('THISDIR',True)
>         +
>         +    # Read JSON manifest
>         +    import json
>         +    with open(pythondir+'/python/python2-manifest.json') as
>         manifest_file:
>         +        python_manifest=json.load(manifest_file)
>         +
>         +    include_pycs = d.getVar('INCLUDE_PYCS')
>         +
>         +    packages = d.getVar('PACKAGES').split()
>         +    pn = d.getVar('PN')
>         +
>         +
>         +    newpackages=[]
>         +
>         +    for key in python_manifest:
>         +        pypackage= pn + '-' + key
>         +
>         +        if pypackage not in packages:
>         +            # We need to prepend, otherwise python-misc gets
>         everything
>         +            # so we use a new variable
>         +            newpackages.append(pypackage)
>         +
>         +        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
>         +        d.setVar('FILES_' + pypackage, '')
>         +        for value in python_manifest[key]['files']:
>         +            d.appendVar('FILES_' + pypackage, ' ' + value)
>         +            if include_pycs == '1':
>         +                if value.endswith('.py'):
>         +                    d.appendVar('FILES_' + pypackage, ' ' +
>         value + 'c')
>         +
>         +        d.setVar('RDEPENDS_' + pypackage, '')
>         +        for value in python_manifest[key]['rdepends']:
>         +            # Make it work with or without $PN
>         +            if '${PN}' in value:
>         +                value=value.split('-')[1]
>         +            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn +
>         '-' + value)
>         +        d.setVar('SUMMARY_' + pypackage,
>         python_manifest[key]['summary'])
>         +
>         +    # We need to ensure staticdev packages match for files
>         first so we sort in reverse
>         +    newpackages.sort(reverse=True)
>         +    # Prepending so to avoid python-misc getting everything
>         +    packages = newpackages + packages
>         +    d.setVar('PACKAGES', ' '.join(packages))
>         +    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
>         +}
>         +
>         +do_split_packages[file-checksums] +=
>         "${THISDIR}/python/python2-manifest.json:True"
>         +
>         +# Files needed to create a new manifest
>         +SRC_URI += "file://create_manifest2.py
>         file://get_module_deps2.py file://python2-manifest.json"
>         +
>         +do_create_manifest() {
>         +
>         +# This task should be run with every new release of Python.
>         +# We must ensure that PACKAGECONFIG enables everything when
>         creating
>         +# a new manifest, this is to base our new manifest on a complete
>         +# native python build, containing all dependencies, otherwise
>         the task
>         +# wont be able to find the required files.
>         +# e.g. BerkeleyDB is an optional build dependency so it may
>         or may not
>         +# be present, we must ensure it is.
>         +
>         +cd ${WORKDIR}
>         +# This needs to be executed by python-native and NOT by
>         HOST's python
>         +nativepython create_manifest2.py
>         +cp python2-manifest.json.new
>         ${THISDIR}/python/python2-manifest.json
>         +}
>         +
>         +# bitbake python -c create_manifest
>         +addtask do_create_manifest
>         +
>         +# Make sure we have native python ready when we create a new
>         manifest
>         +do_create_manifest[depends] += "python:do_prepare_recipe_sysroot"
>         +do_create_manifest[depends] += "python:do_patch"
>         diff --git a/scripts/contrib/python/generate-manifest-2.7.py
>         <http://generate-manifest-2.7.py>
>         b/scripts/contrib/python/generate-manifest-2.7.py
>         <http://generate-manifest-2.7.py>
>         deleted file mode 100755
>         index ee75403..0000000
>         --- a/scripts/contrib/python/generate-manifest-2.7.py
>         <http://generate-manifest-2.7.py>
>         +++ /dev/null
>         @@ -1,426 +0,0 @@
>         -#!/usr/bin/env python
>         -
>         -# generate Python Manifest for the OpenEmbedded build system
>         -# (C) 2002-2010 Michael 'Mickey' Lauer
>         <mlauer@vanille-media.de <mailto:mlauer@vanille-media.de>>
>         -# (C) 2007 Jeremy Laine
>         -# licensed under MIT, see COPYING.MIT
>         -#
>         -# June 22, 2011 -- Mark Hatle <mark.hatle@windriver.com
>         <mailto:mark.hatle@windriver.com>>
>         -#  * Updated to no longer generate special -dbg package,
>         instead use the
>         -#    single system -dbg
>         -#  * Update version with ".1" to indicate this change
>         -#
>         -# February 26, 2017 -- Ming Liu
>         <peter.x.liu@external.atlascopco.com
>         <mailto:peter.x.liu@external.atlascopco.com>>
>         -#  * Updated to support generating manifest for native python
>         -
>         -import os
>         -import sys
>         -import time
>         -import argparse
>         -
>         -VERSION = "2.7.2"
>         -
>         -__author__ = "Michael 'Mickey' Lauer <mlauer@vanille-media.de
>         <mailto:mlauer@vanille-media.de>>"
>         -__version__ = "20110222.2"
>         -
>         -class MakefileMaker:
>         -
>         -    def __init__( self, outfile, isNative ):
>         -        """initialize"""
>         -        self.packages = {}
>         -        self.excluded_pkgs = []
>         -        self.targetPrefix = "${libdir}/python%s/" % VERSION[:3]
>         -        self.isNative = isNative
>         -        self.output = outfile
>         -        self.out( """
>         -# WARNING: This file is AUTO GENERATED: Manual edits will be
>         lost next time I regenerate the file.
>         -# Generator: '%s%s' Version %s (C) 2002-2010 Michael 'Mickey'
>         Lauer <mlauer@vanille-media.de <mailto:mlauer@vanille-media.de>>
>         -""" % ( sys.argv[0], ' --native' if isNative else '',
>         __version__ ) )
>         -
>         -    #
>         -    # helper functions
>         -    #
>         -
>         -    def out( self, data ):
>         -        """print a line to the output file"""
>         -        self.output.write( "%s\n" % data )
>         -
>         -    def setPrefix( self, targetPrefix ):
>         -        """set a file prefix for addPackage files"""
>         -        self.targetPrefix = targetPrefix
>         -
>         -    def doProlog( self ):
>         -        self.out( """ """ )
>         -        self.out( "" )
>         -
>         -    def addPackage( self, name, description, dependencies,
>         filenames, mod_exclude = False ):
>         -        """add a package to the Makefile"""
>         -        if type( filenames ) == type( "" ):
>         -            filenames = filenames.split()
>         -        fullFilenames = []
>         -        for filename in filenames:
>         -            if filename[0] != "$":
>         -                fullFilenames.append( "%s%s" % (
>         self.targetPrefix, filename ) )
>         -            else:
>         -                fullFilenames.append( filename )
>         -        if mod_exclude:
>         -            self.excluded_pkgs.append( name )
>         -        self.packages[name] = description, dependencies,
>         fullFilenames
>         -
>         -    def doBody( self ):
>         -        """generate body of Makefile"""
>         -
>         -        global VERSION
>         -
>         -        #
>         -        # generate rprovides line for native
>         -        #
>         -
>         -        if self.isNative:
>         -            pkglist = []
>         -            for name in ['${PN}-modules'] +
>         sorted(self.packages):
>         -                pkglist.append('%s-native' %
>         name.replace('${PN}', 'python'))
>         -
>         -            self.out('RPROVIDES += "%s"' % " ".join(pkglist))
>         -            return
>         -
>         -        #
>         -        # generate provides line
>         -        #
>         -
>         -        provideLine = 'PROVIDES+=" \\\n'
>         -        for name in sorted(self.packages):
>         -            provideLine += "  %s \\\n" % name
>         -        provideLine += '"'
>         -
>         -        self.out( provideLine )
>         -        self.out( "" )
>         -
>         -        #
>         -        # generate package line
>         -        #
>         -
>         -        packageLine = 'PACKAGES=" \\\n'
>         -        packageLine += '  ${PN}-dbg \\\n'
>         -        for name in sorted(self.packages):
>         -            if name.startswith("${PN}-distutils"):
>         -                if name == "${PN}-distutils":
>         -                    packageLine += "  %s-staticdev %s \\\n" %
>         (name, name)
>         -            elif name != '${PN}-dbg':
>         -                packageLine += "  %s \\\n" % name
>         -        packageLine += '  ${PN}-modules\\\n"'
>         -
>         -        self.out( packageLine )
>         -        self.out( "" )
>         -
>         -        #
>         -        # generate package variables
>         -        #
>         -
>         -        for name, data in sorted(self.packages.items()):
>         -            desc, deps, files = data
>         -
>         -            #
>         -            # write out the description, revision and
>         dependencies
>         -            #
>         -            self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
>         -            self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
>         -
>         -            line = 'FILES_%s=" \\\n' % name
>         -
>         -            #
>         -            # check which directories to make in the
>         temporary directory
>         -            #
>         -
>         -            dirset = {} # if python had a set-datatype this
>         would be sufficient. for now, we're using a dict instead.
>         -            for target in files:
>         -                dirset[os.path.dirname( target )] = True
>         -
>         -            #
>         -            # generate which files to copy for the target
>         (-dfR because whole directories are also allowed)
>         -            #
>         -
>         -            for target in files:
>         -                line += "    %s \\\n" % target
>         -
>         -            line += '"'
>         -            self.out( line )
>         -            self.out( "" )
>         -
>         -        self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
>         -        line = 'RDEPENDS_${PN}-modules=" \\\n'
>         -
>         -        for name, data in sorted(self.packages.items()):
>         -            if name not in ['${PN}-dev',
>         '${PN}-distutils-staticdev'] and name not in self.excluded_pkgs:
>         -                line += "  %s \\\n" % name
>         -
>         -        line += '"'
>         -        self.out( line )
>         -        self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )
>         -
>         -    def doEpilog( self ):
>         -        self.out( """""" )
>         -        self.out( "" )
>         -
>         -    def make( self ):
>         -        self.doProlog()
>         -        self.doBody()
>         -        self.doEpilog()
>         -
>         -if __name__ == "__main__":
>         -    parser = argparse.ArgumentParser( description='generate
>         python manifest' )
>         -    parser.add_argument( '-n', '--native', help='generate
>         manifest for native python', action='store_true' )
>         -    parser.add_argument( 'outfile', metavar='OUTPUT_FILE',
>         nargs='?', default='', help='Output file (defaults to stdout)' )
>         -    args = parser.parse_args()
>         -
>         -    if args.outfile:
>         -        try:
>         -            os.unlink( args.outfile )
>         -        except Exception:
>         -            sys.exc_clear()
>         -        outfile = open( args.outfile, "w" )
>         -    else:
>         -        outfile = sys.stdout
>         -
>         -    m = MakefileMaker( outfile, args.native )
>         -
>         -    # Add packages here. Only specify dlopen-style library
>         dependencies here, no ldd-style dependencies!
>         -    # Parameters: revision, name, description, dependencies,
>         filenames
>         -    #
>         -
>         -    m.addPackage( "${PN}-core", "Python interpreter and core
>         modules", "${PN}-lang ${PN}-re",
>         -    "__future__.* _abcoll.* abc.* ast.* copy.* copy_reg.*
>         ConfigParser.* " +
>         -    "genericpath.* getopt.* linecache.* new.* " +
>         -    "os.* posixpath.* struct.* " +
>         -    "warnings.* site.* stat.* " +
>         -    "UserDict.* UserList.* UserString.* " +
>         -    "lib-dynload/binascii.so lib-dynload/_struct.so
>         lib-dynload/time.so " +
>         -    "lib-dynload/xreadlines.so types.* platform.*
>         ${bindir}/python* "  +
>         -    "_weakrefset.* sysconfig.* _sysconfigdata.* " +
>         -    "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
>         -    "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
>         -
>         -    m.addPackage( "${PN}-dev", "Python development package",
>         "${PN}-core",
>         -    "${includedir} " +
>         -    "${libdir}/lib*${SOLIBSDEV} " +
>         -    "${libdir}/*.la " +
>         -    "${libdir}/*.a " +
>         -    "${libdir}/*.o " +
>         -    "${libdir}/pkgconfig " +
>         -    "${base_libdir}/*.a " +
>         -    "${base_libdir}/*.o " +
>         -    "${datadir}/aclocal " +
>         -    "${datadir}/pkgconfig " +
>         -    "config/Makefile ")
>         -
>         -    m.addPackage( "${PN}-2to3", "Python automated Python 2 to
>         3 code translator", "${PN}-core",
>         -    "${bindir}/2to3 lib2to3" ) # package
>         -
>         -    m.addPackage( "${PN}-idle", "Python Integrated
>         Development Environment", "${PN}-core ${PN}-tkinter",
>         -    "${bindir}/idle idlelib" ) # package
>         -
>         -    m.addPackage( "${PN}-pydoc", "Python interactive help
>         support", "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
>         -    "${bindir}/pydoc pydoc.* pydoc_data" )
>         -
>         -    m.addPackage( "${PN}-smtpd", "Python Simple Mail
>         Transport Daemon", "${PN}-core ${PN}-netserver ${PN}-email
>         ${PN}-mime",
>         -    "${bindir}/smtpd.* smtpd.*" )
>         -
>         -    m.addPackage( "${PN}-audio", "Python Audio Handling",
>         "${PN}-core",
>         -    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so
>         lib-dynload/audioop.so audiodev.* sunaudio.* sunau.* toaiff.*" )
>         -
>         -    m.addPackage( "${PN}-bsddb", "Python bindings for the
>         Berkeley Database", "${PN}-core",
>         -    "bsddb lib-dynload/_bsddb.so" ) # package
>         -
>         -    m.addPackage( "${PN}-codecs", "Python codecs, encodings &
>         i18n support", "${PN}-core ${PN}-lang",
>         -    "codecs.* encodings gettext.* locale.*
>         lib-dynload/_locale.so lib-dynload/_codecs*
>         lib-dynload/_multibytecodec.so lib-dynload/unicodedata.so
>         stringprep.* xdrlib.*" )
>         -
>         -    m.addPackage( "${PN}-compile", "Python bytecode
>         compilation support", "${PN}-core",
>         -    "py_compile.* compileall.*" )
>         -
>         -    m.addPackage( "${PN}-compiler", "Python compiler
>         support", "${PN}-core",
>         -    "compiler" ) # package
>         -
>         -    m.addPackage( "${PN}-compression", "Python high-level
>         compression support", "${PN}-core ${PN}-zlib",
>         -    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )
>         -
>         -    m.addPackage( "${PN}-crypt", "Python basic cryptographic
>         and hashing support", "${PN}-core",
>         -    "hashlib.* md5.* sha.* lib-dynload/crypt.so
>         lib-dynload/_hashlib.so lib-dynload/_sha256.so
>         lib-dynload/_sha512.so" )
>         -
>         -    m.addPackage( "${PN}-textutils", "Python option parsing,
>         text wrapping and CSV support", "${PN}-core ${PN}-io ${PN}-re
>         ${PN}-stringold",
>         -    "lib-dynload/_csv.so csv.* optparse.* textwrap.*" )
>         -
>         -    m.addPackage( "${PN}-curses", "Python curses support",
>         "${PN}-core",
>         -    "curses lib-dynload/_curses.so
>         lib-dynload/_curses_panel.so" ) # directory + low level module
>         -
>         -    m.addPackage( "${PN}-ctypes", "Python C types support",
>         "${PN}-core",
>         -    "ctypes lib-dynload/_ctypes.so
>         lib-dynload/_ctypes_test.so" ) # directory + low level module
>         -
>         -    m.addPackage( "${PN}-datetime", "Python calendar and time
>         support", "${PN}-core ${PN}-codecs",
>         -    "_strptime.* calendar.* lib-dynload/datetime.so" )
>         -
>         -    m.addPackage( "${PN}-db", "Python file-based database
>         support", "${PN}-core",
>         -    "anydbm.* dumbdbm.* whichdb.* " )
>         -
>         -    m.addPackage( "${PN}-debugger", "Python debugger",
>         "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold
>         ${PN}-shell ${PN}-pprint",
>         -    "bdb.* pdb.*" )
>         -
>         -    m.addPackage( "${PN}-difflib", "Python helpers for
>         computing deltas between objects", "${PN}-lang ${PN}-re",
>         -    "difflib.*" )
>         -
>         -    m.addPackage( "${PN}-distutils-staticdev", "Python
>         distribution utilities (static libraries)", "${PN}-distutils",
>         -    "config/lib*.a" ) # package
>         -
>         -    m.addPackage( "${PN}-distutils", "Python Distribution
>         Utilities", "${PN}-core ${PN}-email",
>         -    "config distutils" ) # package
>         -
>         -    m.addPackage( "${PN}-doctest", "Python framework for
>         running examples in docstrings", "${PN}-core ${PN}-lang
>         ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
>         -    "doctest.*" )
>         -
>         -    m.addPackage( "${PN}-email", "Python email support",
>         "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio
>         ${PN}-image ${PN}-netclient",
>         -    "imaplib.* email" ) # package
>         -
>         -    m.addPackage( "${PN}-fcntl", "Python's fcntl interface",
>         "${PN}-core",
>         -    "lib-dynload/fcntl.so" )
>         -
>         -    m.addPackage( "${PN}-hotshot", "Python hotshot
>         performance profiler", "${PN}-core",
>         -    "hotshot lib-dynload/_hotshot.so" )
>         -
>         -    m.addPackage( "${PN}-html", "Python HTML processing
>         support", "${PN}-core",
>         -    "formatter.* htmlentitydefs.* htmllib.* markupbase.*
>         sgmllib.* HTMLParser.* " )
>         -
>         -    m.addPackage( "${PN}-importlib", "Python import
>         implementation library", "${PN}-core",
>         -    "importlib" )
>         -
>         -    m.addPackage( "${PN}-gdbm", "Python GNU database
>         support", "${PN}-core",
>         -    "lib-dynload/gdbm.so" )
>         -
>         -    m.addPackage( "${PN}-image", "Python graphical image
>         handling", "${PN}-core",
>         -    "colorsys.* imghdr.* lib-dynload/imageop.so
>         lib-dynload/rgbimg.so" )
>         -
>         -    m.addPackage( "${PN}-io", "Python low-level I/O",
>         "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient
>         ${PN}-contextlib",
>         -    "lib-dynload/_socket.so lib-dynload/_io.so
>         lib-dynload/_ssl.so lib-dynload/select.so
>         lib-dynload/termios.so lib-dynload/cStringIO.so " +
>         -    "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
>         -
>         -    m.addPackage( "${PN}-json", "Python JSON support",
>         "${PN}-core ${PN}-math ${PN}-re ${PN}-codecs",
>         -    "json lib-dynload/_json.so" ) # package
>         -
>         -    m.addPackage( "${PN}-lang", "Python low-level language
>         support", "${PN}-core",
>         -    "lib-dynload/_bisect.so lib-dynload/_collections.so
>         lib-dynload/_heapq.so lib-dynload/_weakref.so
>         lib-dynload/_functools.so " +
>         -    "lib-dynload/array.so lib-dynload/itertools.so
>         lib-dynload/operator.so lib-dynload/parser.so " +
>         -    "atexit.* bisect.* code.* codeop.* collections.* dis.*
>         functools.* heapq.* inspect.* keyword.* opcode.* symbol.*
>         repr.* token.* " +
>         -    "tokenize.* traceback.* weakref.*" )
>         -
>         -    m.addPackage( "${PN}-logging", "Python logging support",
>         "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
>         -    "logging" ) # package
>         -
>         -    m.addPackage( "${PN}-mailbox", "Python mailbox format
>         support", "${PN}-core ${PN}-mime",
>         -    "mailbox.*" )
>         -
>         -    m.addPackage( "${PN}-math", "Python math support",
>         "${PN}-core ${PN}-crypt",
>         -    "lib-dynload/cmath.so lib-dynload/math.so
>         lib-dynload/_random.so random.* sets.*" )
>         -
>         -    m.addPackage( "${PN}-mime", "Python MIME handling APIs",
>         "${PN}-core ${PN}-io",
>         -    "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
>         -
>         -    m.addPackage( "${PN}-mmap", "Python memory-mapped file
>         support", "${PN}-core ${PN}-io",
>         -    "lib-dynload/mmap.so " )
>         -
>         -    m.addPackage( "${PN}-multiprocessing", "Python
>         multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang
>         ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
>         -    "lib-dynload/_multiprocessing.so multiprocessing" ) # package
>         -
>         -    m.addPackage( "${PN}-netclient", "Python Internet
>         Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime
>         ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
>         -    "*Cookie*.* " +
>         -    "base64.* cookielib.* ftplib.* gopherlib.* hmac.*
>         httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.*
>         urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
>         -
>         -    m.addPackage( "${PN}-netserver", "Python Internet
>         Protocol servers", "${PN}-core ${PN}-netclient ${PN}-shell
>         ${PN}-threading",
>         -    "cgi.* *HTTPServer.* SocketServer.*" )
>         -
>         -    m.addPackage( "${PN}-numbers", "Python number APIs",
>         "${PN}-core ${PN}-lang ${PN}-re",
>         -    "decimal.* fractions.* numbers.*" )
>         -
>         -    m.addPackage( "${PN}-pickle", "Python
>         serialisation/persistence support", "${PN}-core ${PN}-codecs
>         ${PN}-io ${PN}-re",
>         -    "pickle.* shelve.* lib-dynload/cPickle.so pickletools.*" )
>         -
>         -    m.addPackage( "${PN}-pkgutil", "Python package extension
>         utility support", "${PN}-core",
>         -    "pkgutil.*")
>         -
>         -    m.addPackage( "${PN}-plistlib", "Generate and parse Mac
>         OS X .plist files", "${PN}-core ${PN}-datetime ${PN}-io",
>         -    "plistlib.*")
>         -
>         -    m.addPackage( "${PN}-pprint", "Python pretty-print
>         support", "${PN}-core ${PN}-io",
>         -    "pprint.*" )
>         -
>         -    m.addPackage( "${PN}-profile", "Python basic performance
>         profiling support", "${PN}-core ${PN}-textutils",
>         -    "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
>         -
>         -    m.addPackage( "${PN}-re", "Python Regular Expression
>         APIs", "${PN}-core",
>         -    "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) #
>         _sre is builtin
>         -
>         -    m.addPackage( "${PN}-readline", "Python readline
>         support", "${PN}-core",
>         -    "lib-dynload/readline.so rlcompleter.*" )
>         -
>         -    m.addPackage( "${PN}-resource", "Python resource control
>         interface", "${PN}-core",
>         -    "lib-dynload/resource.so" )
>         -
>         -    m.addPackage( "${PN}-shell", "Python shell-like
>         functionality", "${PN}-core ${PN}-re",
>         -    "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.*
>         shlex.* shutil.*" )
>         -
>         -    m.addPackage( "${PN}-robotparser", "Python robots.txt
>         parser", "${PN}-core ${PN}-netclient",
>         -    "robotparser.*")
>         -
>         -    m.addPackage( "${PN}-runpy", "Python script for
>         locating/executing scripts in module namespace", "${PN}-core
>         ${PN}-pkgutil",
>         -    "runpy.*")
>         -
>         -    m.addPackage( "${PN}-subprocess", "Python subprocess
>         support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
>         -    "subprocess.*" )
>         -
>         -    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database
>         support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt
>         ${PN}-io ${PN}-threading ${PN}-zlib",
>         -    "lib-dynload/_sqlite3.so sqlite3/dbapi2.*
>         sqlite3/__init__.* sqlite3/dump.*" )
>         -
>         -    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3
>         database support tests", "${PN}-core ${PN}-sqlite3",
>         -    "sqlite3/test" )
>         -
>         -    m.addPackage( "${PN}-stringold", "Python string APIs
>         [deprecated]", "${PN}-core ${PN}-re",
>         -    "lib-dynload/strop.so string.* stringold.*" )
>         -
>         -    m.addPackage( "${PN}-syslog", "Python syslog interface",
>         "${PN}-core",
>         -    "lib-dynload/syslog.so" )
>         -
>         -    m.addPackage( "${PN}-terminal", "Python terminal
>         controlling support", "${PN}-core ${PN}-io",
>         -    "pty.* tty.*" )
>         -
>         -    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core
>         ${PN}-modules",
>         -    "test", True ) # package
>         -
>         -    m.addPackage( "${PN}-threading", "Python threading &
>         synchronization support", "${PN}-core ${PN}-lang",
>         -    "_threading_local.* dummy_thread.* dummy_threading.*
>         mutex.* threading.* Queue.*" )
>         -
>         -    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings",
>         "${PN}-core",
>         -    "lib-dynload/_tkinter.so lib-tk" ) # package
>         -
>         -    m.addPackage( "${PN}-unittest", "Python unit testing
>         framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io
>         ${PN}-difflib ${PN}-pprint ${PN}-shell",
>         -    "unittest/" )
>         -
>         -    m.addPackage( "${PN}-unixadmin", "Python Unix
>         administration support", "${PN}-core",
>         -    "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so
>         getpass.*" )
>         -
>         -    m.addPackage( "${PN}-xml", "Python basic XML support",
>         "${PN}-core ${PN}-re",
>         -    "lib-dynload/_elementtree.so lib-dynload/pyexpat.so xml
>         xmllib.*" ) # package
>         -
>         -    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support",
>         "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
>         -    "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.*" )
>         -
>         -    m.addPackage( "${PN}-zlib", "Python zlib compression
>         support", "${PN}-core",
>         -    "lib-dynload/zlib.so" )
>         -
>         -    m.addPackage( "${PN}-mailbox", "Python mailbox format
>         support", "${PN}-core ${PN}-mime",
>         -    "mailbox.*" )
>         -
>         -    m.addPackage( "${PN}-argparse", "Python command line
>         argument parser", "${PN}-core ${PN}-codecs ${PN}-textutils",
>         -    "argparse.*" )
>         -
>         -    m.addPackage( "${PN}-contextlib", "Python utilities for
>         with-statement" +
>         -    "contexts.", "${PN}-core",
>         -    "${libdir}/python${PYTHON_MAJMIN}/contextlib.*" )
>         -
>         -    m.make()
>
>         --
>         To stop receiving notification emails like this one, please
>         contact
>         the administrator of this repository.
>         --
>         _______________________________________________
>         Openembedded-commits mailing list
>         Openembedded-commits@lists.openembedded.org
>         <mailto:Openembedded-commits@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-commits>
>
>
>
>
>


--------------7D93273BE0C84CD862606270
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Martin,</p>
    <br>
    <div class="moz-cite-prefix">On 01/21/2018 07:13 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">And few more detected in test-signatures.sh:
        <div><br>
        </div>
        <div>
          <div>ERROR: Nothing RPROVIDES 'python3-enum' (but
            meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-automat_0.6.0.bb"
              moz-do-not-send="true">python3-automat_0.6.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-asn1crypto_0.24.0.bb"
              moz-do-not-send="true">python3-asn1crypto_0.24.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-pymongo_3.6.0.bb"
              moz-do-not-send="true">python3-pymongo_3.6.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-netaddr_0.7.19.bb"
              moz-do-not-send="true">python3-netaddr_0.7.19.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-pyserial_3.4.bb"
              moz-do-not-send="true">python3-pyserial_3.4.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-langtable_0.0.38.bb"
              moz-do-not-send="true">python3-langtable_0.0.38.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-hyperlink_17.3.1.bb"
              moz-do-not-send="true">python3-hyperlink_17.3.1.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-click_6.7.bb" moz-do-not-send="true">python3-click_6.7.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-prompt-toolkit_1.0.15.bb"
              moz-do-not-send="true">python3-prompt-toolkit_1.0.15.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-decorator_4.1.2.bb"
              moz-do-not-send="true">python3-decorator_4.1.2.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-serpent_1.23.bb"
              moz-do-not-send="true">python3-serpent_1.23.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-dnspython_1.15.0.bb"
              moz-do-not-send="true">python3-dnspython_1.15.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-jsonpatch_1.21.bb"
              moz-do-not-send="true">python3-jsonpatch_1.21.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-sqlalchemy_1.1.15.bb"
              moz-do-not-send="true">python3-sqlalchemy_1.1.15.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-ntplib_0.3.3.bb"
              moz-do-not-send="true">python3-ntplib_0.3.3.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-whoosh_2.7.4.bb"
              moz-do-not-send="true">python3-whoosh_2.7.4.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-ply_3.10.bb" moz-do-not-send="true">python3-ply_3.10.bb</a>
            RDEPENDS on or otherwise requires it)</div>
        </div>
        <div>NOTE: Runtime target 'python3-enum' is unbuildable,
          removing...<br>
        </div>
        <div>
          <div>Missing or unbuildable dependency chain was:
            ['python3-enum']</div>
          <div>ERROR: Required build target 'meta-world-pkgdata' has no
            buildable providers.</div>
          <div>Missing or unbuildable dependency chain was:
            ['meta-world-pkgdata', 'python3-automat', 'python3-enum']</div>
        </div>
        <div><br>
        </div>
        <div>
          <div>ERROR: Nothing RPROVIDES 'python3-importlib' (but
            meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-django_1.11.9.bb"
              moz-do-not-send="true">python3-django_1.11.9.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-pyroute2_0.4.21.bb"
              moz-do-not-send="true">python3-pyroute2_0.4.21.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python3-can_2.0.0.bb" moz-do-not-send="true">python3-can_2.0.0.bb</a>
            RDEPENDS on or otherwise requires it)</div>
        </div>
        <div>NOTE: Runtime target 'python3-importlib' is unbuildable,
          removing...<br>
        </div>
        <div>
          <div>Missing or unbuildable dependency chain was:
            ['python3-importlib']</div>
          <div>ERROR: Required build target 'meta-world-pkgdata' has no
            buildable providers.</div>
          <div>Missing or unbuildable dependency chain was:
            ['meta-world-pkgdata', 'python3-django',
            'python3-importlib']</div>
        </div>
        <div><br>
        </div>
        <div>
          <div>ERROR: Nothing RPROVIDES 'python-importlib' (but
            meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-django_1.11.9.bb"
              moz-do-not-send="true">python-django_1.11.9.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-pyroute2_0.4.21.bb"
              moz-do-not-send="true">python-pyroute2_0.4.21.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-pandas_0.22.0.bb"
              moz-do-not-send="true">python-pandas_0.22.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-astroid_1.6.0.bb"
              moz-do-not-send="true">python-astroid_1.6.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-dbusmock_0.16.7.bb"
              moz-do-not-send="true">python-dbusmock_0.16.7.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-can_2.0.0.bb" moz-do-not-send="true">python-can_2.0.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-pyserial_3.4.bb"
              moz-do-not-send="true">python-pyserial_3.4.bb</a></div>
          <div>meta-oe/meta-oe/recipes-devtools/python/<a
              href="http://python-pygobject_3.22.0.bb"
              moz-do-not-send="true">python-pygobject_3.22.0.bb</a></div>
          <div>meta-oe/meta-python/recipes-devtools/python/<a
              href="http://python-behave_1.2.5.bb"
              moz-do-not-send="true">python-behave_1.2.5.bb</a> RDEPENDS
            on or otherwise requires it)</div>
        </div>
        <div>NOTE: Runtime target 'python-importlib' is unbuildable,
          removing...<br>
        </div>
        <div>
          <div>Missing or unbuildable dependency chain was:
            ['python-importlib']</div>
          <div>ERROR: Required build target 'meta-world-pkgdata' has no
            buildable providers.</div>
          <div>Missing or unbuildable dependency chain was:
            ['meta-world-pkgdata', 'python-django', 'python-importlib']</div>
        </div>
        <div><br>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Sun, Jan 21, 2018 at 10:00 AM,
          Martin Jansa <span dir="ltr">&lt;<a
              href="mailto:martin.jansa@gmail.com" target="_blank"
              moz-do-not-send="true">martin.jansa@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">Hello,
              <div><br>
              </div>
              <div>The last paragraph in commit message looks like it
                should be backwards compatible right?</div>
              <div><br>
              </div>
              <div>Then there might be some bug somewhere, because in my
                builds (which use only very few python packages) there
                are few runtime dependencies which cannot be satisfied
                anymore:</div>
              <div>python-man</div>
              <div>python-readline</div>
              <div>python3-textutils</div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
    <p>Its backwards compatible, in the way that the usage should be the
      same, in this case, this sort of failures are expected, since the
      mentioned packages: enum, readline, textutils no longer exist, and
      they should never have existed in the first place, they were
      always required to get a minimal python working, so they are now
      part of python(3)-core, which means the dependencies are actually
      met but recipes which RDEPEND on them should be modified , please
      see
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7aaffbede46ce352b91c7a5c5f825a6f3b5b1c2e">https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7aaffbede46ce352b91c7a5c5f825a6f3b5b1c2e</a>
      regarding some of the RDEPEND fixes on oe-core, I expect there
      should be several like this for meta-python.</p>
    <blockquote type="cite"
cite="mid:CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com">
      <div class="gmail_extra">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div><br>
              </div>
              <div>Also probably related to this I've seen
                python(3)-smbus recipes failing to build now with:</div>
              <div>smbusmodule.c:192:48: error: 'I2C_SMBUS_WRITE'
                undeclared (first use in this function); did you mean
                'I2C_SMBUS'?<br>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
    I dont know if the same applies for smbus but I will check.<br>
    <br>
    <p>Cheers,</p>
    <p>Alejandro</p>
    <blockquote type="cite"
cite="mid:CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com">
      <div class="gmail_extra">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div><br>
              </div>
              <div>Regards,</div>
            </div>
            <div class="gmail_extra"><br>
              <div class="gmail_quote">On Sat, Jan 20, 2018 at 11:32 PM,
                <span dir="ltr">&lt;<a
                    href="mailto:git@git.openembedded.org"
                    target="_blank" moz-do-not-send="true">git@git.openembedded.org</a>&gt;</span>
                wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">This
                  is an automated email from the git hooks/post-receive
                  script.<br>
                  <br>
                  rpurdie pushed a commit to branch master<br>
                  in repository openembedded-core.<br>
                  <br>
                  commit 6959e2e4dba5bbfa6ffd49c44e738c<wbr>c1c38bc280<br>
                  Author: Alejandro Hernandez &lt;<a
                    href="mailto:alejandro.hernandez@linux.intel.com"
                    target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.int<wbr>el.com</a>&gt;<br>
                  AuthorDate: Tue Jun 20 14:11:44 2017 -0700<br>
                  <br>
                      python: Restructure python packaging and replace
                  it with autopackaging<br>
                  <br>
                      The reason we have a manifest file for python is
                  that our goal is to<br>
                      keep python-core as small as posible and add other
                  python packages only<br>
                      when the user needs them, hence why we split
                  upstream python into several<br>
                      packages.<br>
                  <br>
                      Although our manifest file has several issues:<br>
                       - Its unorganized and hard to read and understand
                  it for an average<br>
                         human being.<br>
                       - When a new package needs to be added, the user
                  actually has to modify<br>
                         the script that creates the manifest, then call
                  the script to create<br>
                         a new manifest, and then submit a patch for
                  both the script and the<br>
                         manifest, so its a little convoluted.<br>
                       - Git complains every single time a patch is
                  submitted to the manifest,<br>
                         since it violates some of its guidelines.<br>
                       - It changes or may change with every release of
                  python, its impossible<br>
                         to know if the required files for a certain
                  package have changed<br>
                         (it could have more or less dependencies), the
                  only way of doing so<br>
                         would be to install and test them all one by
                  one on separate individual<br>
                         images, and even then we wouldnt know if they
                  require less dependencies,<br>
                         we would just know if an extra dependency is
                  required since it would<br>
                         complain, lets face it, this isnt feasible.<br>
                       - The same thing happens for new packages, if
                  someone wants to add a<br>
                         new package, its dependencies need to be
                  checked manually one by one.<br>
                  <br>
                      This patch fixes those issues, while adding some
                  additional features.<br>
                  <br>
                      Features/Fixes:<br>
                  <br>
                       - A new manifest format is used (JSON), easy to
                  read and understand.<br>
                         This file is parsed by the python recipe and
                  python packages read<br>
                         from here are passed directly to bitbake during
                  parsing time.<br>
                       - It provides an automatic manifest creation task
                  (explained below),<br>
                         which automagically checks for every package
                  dependencies and adds<br>
                         them to the new manifest, hence we will have on
                  each package exactly<br>
                         what that package needs to be run, providing
                  finer granularity.<br>
                       - Dependencies are also checked automagically for
                  new packages (explained below).<br>
                       - Fixes the manifest in the following ways:<br>
                         * python-core should be base and all packages
                  should depend on it,<br>
                           fixes lang, string, codecs, etc.<br>
                         * Fixes packages with repeated files (e.g.
                  bssdb and db, or<br>
                           netclient and mime, and many others).<br>
                       - Sitecustomize was fixed since encoding was
                  deprecated.<br>
                       - The JSON manifest file invalidates bitbake's
                  cache, so if it changes<br>
                         the python package will be rebuilt.<br>
                       - It creates a solution for users that want
                  precompiled bytecode files<br>
                         (*.pyc) INCLUDE_PYCS = "1" can be set by the
                  user on their local.conf to<br>
                         include such files, some argument they get
                  faster boot time, even when the<br>
                         files would be created on their first run?, but
                  they also sometimes give a<br>
                         magic number error and take up space, so we
                  leave it to the user to<br>
                         decide if they want them or not.<br>
                       - Fixes python-core dependencies, e.g.<br>
                         When python is run on an image, it TRIES to
                  import everything it needs,<br>
                         but it doesnt necessarily fails when it doesnt
                  find something, so even if<br>
                         we didnt know, we had errors like (trimmed on
                  purpose):<br>
                         # trying /usr/lib/python2.7/_locale.so<br>
                         # trying /usr/lib/python2.7/lib-dynload<wbr>/_locale.so<br>
                         # trying /usr/lib/python2.7/_sysconfigd<wbr>ata.so<br>
                  <br>
                         while it didnt complain about _locale it should
                  have imported it,<br>
                         after creating a new manifest with the
                  automated script we get:<br>
                  <br>
                         # trying /usr/lib/python2.7/lib-dynload<wbr>/_locale.so<br>
                         dlopen("/usr/lib/python2.7/li<wbr>b-dynload/_locale.so",
                  2);<br>
                         import _locale # dynamically loaded from
                  /usr/lib/python2.7/lib-dynload<wbr>/_locale.so<br>
                  <br>
                      How to use (after a new release of python, or
                  maybe before every OE<br>
                      release):<br>
                       - A new task called create_manifest was added to
                  the python package,<br>
                         which may be invoked via:<br>
                  <br>
                       $ bitbake python -c create_manifest<br>
                  <br>
                       This task runs a script on native python on our
                  HOST system, and since<br>
                       the python and python-native packages come from
                  the same source, we can<br>
                       use it to know the dependencies of each module as
                  if we were doing it<br>
                       on an image, this script is called
                  create_manifest.py and in a very<br>
                       simplistic way it does the following:<br>
                  <br>
                       1. Reads the JSON manifest file and creates a
                  dictionary data structure<br>
                          with all of our python packages, their FILES,
                  RDEPENDS and SUMMARY.<br>
                       2. Loops through all of them and runs every
                  module listed on them<br>
                          asynchronously, determining every dependency
                  that they have.<br>
                       3. These module dependencies are then handled, to
                  be able to know which<br>
                          packages contain those files and which should
                  RDEPEND on one another.<br>
                       4. The data structure that comes out of this, is
                  then used to create a<br>
                          new manifest file which is automatically
                  copied onto the user's python<br>
                          directory replacing the old one.<br>
                  <br>
                       Create_manifest script features:<br>
                       - Handles modules which dont exist anymore (new
                  release for example).<br>
                       - Handles modules that are builtin.<br>
                       - Deals with modules which were not compiled
                  (e.g. bsddb or ossaudiodev)<br>
                       - Deals with packages which include folders.<br>
                       - Deals with packages which include FILES with a
                  wildcard.<br>
                       - The manifest can be constructed on a multilib
                  environment as well.<br>
                       - This method works for both python modules and
                  shared libraries used<br>
                         by python.<br>
                  <br>
                      How to add a new package:<br>
                       - If a user wants to add a new package all that
                  has to be done is<br>
                         modify the python2-manifest.json file, and add
                  the required file(s)<br>
                         to the FILES list, the script should handle all
                  the rest.<br>
                         Real example:<br>
                         We want to add a web browser package, including
                  the file webbrowser.py<br>
                         which at the moment is on python-misc.<br>
                         "webbrowser": {<br>
                             "files": ["${libdir}/python2.7/lib-dynl<wbr>oad/webbrowser.py"],<br>
                             "rdepends": [],<br>
                             "summary": "Python Web Browser support"}<br>
                  <br>
                       Run bitbake python -c create_manifest and the
                  resulting manifest<br>
                       should  be completed after a few seconds, showing
                  something like:<br>
                         "webbrowser": {<br>
                            "files": ["${libdir}/python2.7/webbrows<wbr>er.py"],<br>
                            "rdepends": ["core","fcntl","io","pickle",<wbr>"shell","subprocess"],<br>
                            "summary": "Python Web Browser support"}<br>
                  <br>
                      Known errors/issues:<br>
                       - Some special packages are handled differently:
                  core, misc,<br>
                         modules,dev, staticdev.<br>
                         All these should be handled manually, because
                  they either include<br>
                         binaries, static libraries, include files, etc.
                  (something that we<br>
                         cant import).<br>
                         Specifically static libraries are not not
                  supported by this method<br>
                         and have to be handled by the user.<br>
                       - The change should be transparent to the user,
                  other than the fact<br>
                         that now we CANT build python-foo (it was
                  pretty dumb anyway, since<br>
                         what building python-foo actually did was
                  building the whole python<br>
                         package anyway), but doing IMAGE_INSTALL_append
                  = " python-foo"<br>
                         would create an image with the requested
                  package with no issues.<br>
                  <br>
                      [YOCTO #11510] [YOCTO #11694] [YOCTO #11695]<br>
                  <br>
                      Signed-off-by: Alejandro Hernandez &lt;<a
                    href="mailto:alejandro.hernandez@linux.intel.com"
                    target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.int<wbr>el.com</a>&gt;<br>
                      Signed-off-by: Ross Burton &lt;<a
                    href="mailto:ross.burton@intel.com" target="_blank"
                    moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
                  ---<br>
                   .../python/python-2.7-manifes<wbr>t.inc             
                     |  840 ----------------<br>
                   .../python/python-native-2.7-<wbr>manifest.inc       
                    |    9 -<br>
                   .../python/<a href="http://python-native_2.7.13.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">python-native_2.7.<wbr>13.bb</a> 
                                 |   24 +-<br>
                   .../python/python/create_mani<wbr>fest2.py           
                    |  277 ++++++<br>
                   .../python/python/get_module_<wbr>deps2.py           
                    |  112 +++<br>
                   .../python/python/python2-man<wbr>ifest.json         
                    | 1032 ++++++++++++++++++++<br>
                   .../python/python/sitecustomi<wbr>ze.py             
                     |    8 -<br>
                   meta/recipes-devtools/python/<a
                    href="http://python_2.7.13.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true"><wbr>python_2.7.13.bb</a> 
                      |   88 +-<br>
                   scripts/contrib/python/<a
                    href="http://generate-manifest-2.7.py"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">genera<wbr>te-manifest-2.7.py</a> 
                    |  426 --------<br>
                   9 files changed, 1528 insertions(+), 1288
                  deletions(-)<br>
                  <br>
                  diff --git a/meta/recipes-devtools/python<wbr>/python-2.7-manifest.inc
                  b/meta/recipes-devtools/python<wbr>/python-2.7-manifest.inc<br>
                  deleted file mode 100644<br>
                  index 7c3fc1b..0000000<br>
                  --- a/meta/recipes-devtools/python<wbr>/python-2.7-manifest.inc<br>
                  +++ /dev/null<br>
                  @@ -1,840 +0,0 @@<br>
                  -<br>
                  -# WARNING: This file is AUTO GENERATED: Manual edits
                  will be lost next time I regenerate the file.<br>
                  -# Generator: './scripts/contrib/python/<a
                    href="http://generate-manifest-2.7.py"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gene<wbr>rate-manifest-2.7.py</a>'
                  Version 20110222.2 (C) 2002-2010 Michael 'Mickey'
                  Lauer &lt;<a href="mailto:mlauer@vanille-media.de"
                    target="_blank" moz-do-not-send="true">mlauer@vanille-media.de</a>&gt;<br>
                  -<br>
                  -<br>
                  -<br>
                  -PROVIDES+=" \<br>
                  -  ${PN}-2to3 \<br>
                  -  ${PN}-argparse \<br>
                  -  ${PN}-audio \<br>
                  -  ${PN}-bsddb \<br>
                  -  ${PN}-codecs \<br>
                  -  ${PN}-compile \<br>
                  -  ${PN}-compiler \<br>
                  -  ${PN}-compression \<br>
                  -  ${PN}-contextlib \<br>
                  -  ${PN}-core \<br>
                  -  ${PN}-crypt \<br>
                  -  ${PN}-ctypes \<br>
                  -  ${PN}-curses \<br>
                  -  ${PN}-datetime \<br>
                  -  ${PN}-db \<br>
                  -  ${PN}-debugger \<br>
                  -  ${PN}-dev \<br>
                  -  ${PN}-difflib \<br>
                  -  ${PN}-distutils \<br>
                  -  ${PN}-distutils-staticdev \<br>
                  -  ${PN}-doctest \<br>
                  -  ${PN}-email \<br>
                  -  ${PN}-fcntl \<br>
                  -  ${PN}-gdbm \<br>
                  -  ${PN}-hotshot \<br>
                  -  ${PN}-html \<br>
                  -  ${PN}-idle \<br>
                  -  ${PN}-image \<br>
                  -  ${PN}-importlib \<br>
                  -  ${PN}-io \<br>
                  -  ${PN}-json \<br>
                  -  ${PN}-lang \<br>
                  -  ${PN}-logging \<br>
                  -  ${PN}-mailbox \<br>
                  -  ${PN}-math \<br>
                  -  ${PN}-mime \<br>
                  -  ${PN}-mmap \<br>
                  -  ${PN}-multiprocessing \<br>
                  -  ${PN}-netclient \<br>
                  -  ${PN}-netserver \<br>
                  -  ${PN}-numbers \<br>
                  -  ${PN}-pickle \<br>
                  -  ${PN}-pkgutil \<br>
                  -  ${PN}-plistlib \<br>
                  -  ${PN}-pprint \<br>
                  -  ${PN}-profile \<br>
                  -  ${PN}-pydoc \<br>
                  -  ${PN}-re \<br>
                  -  ${PN}-readline \<br>
                  -  ${PN}-resource \<br>
                  -  ${PN}-robotparser \<br>
                  -  ${PN}-runpy \<br>
                  -  ${PN}-shell \<br>
                  -  ${PN}-smtpd \<br>
                  -  ${PN}-sqlite3 \<br>
                  -  ${PN}-sqlite3-tests \<br>
                  -  ${PN}-stringold \<br>
                  -  ${PN}-subprocess \<br>
                  -  ${PN}-syslog \<br>
                  -  ${PN}-terminal \<br>
                  -  ${PN}-tests \<br>
                  -  ${PN}-textutils \<br>
                  -  ${PN}-threading \<br>
                  -  ${PN}-tkinter \<br>
                  -  ${PN}-unittest \<br>
                  -  ${PN}-unixadmin \<br>
                  -  ${PN}-xml \<br>
                  -  ${PN}-xmlrpc \<br>
                  -  ${PN}-zlib \<br>
                  -"<br>
                  -<br>
                  -PACKAGES=" \<br>
                  -  ${PN}-dbg \<br>
                  -  ${PN}-2to3 \<br>
                  -  ${PN}-argparse \<br>
                  -  ${PN}-audio \<br>
                  -  ${PN}-bsddb \<br>
                  -  ${PN}-codecs \<br>
                  -  ${PN}-compile \<br>
                  -  ${PN}-compiler \<br>
                  -  ${PN}-compression \<br>
                  -  ${PN}-contextlib \<br>
                  -  ${PN}-core \<br>
                  -  ${PN}-crypt \<br>
                  -  ${PN}-ctypes \<br>
                  -  ${PN}-curses \<br>
                  -  ${PN}-datetime \<br>
                  -  ${PN}-db \<br>
                  -  ${PN}-debugger \<br>
                  -  ${PN}-dev \<br>
                  -  ${PN}-difflib \<br>
                  -  ${PN}-distutils-staticdev ${PN}-distutils \<br>
                  -  ${PN}-doctest \<br>
                  -  ${PN}-email \<br>
                  -  ${PN}-fcntl \<br>
                  -  ${PN}-gdbm \<br>
                  -  ${PN}-hotshot \<br>
                  -  ${PN}-html \<br>
                  -  ${PN}-idle \<br>
                  -  ${PN}-image \<br>
                  -  ${PN}-importlib \<br>
                  -  ${PN}-io \<br>
                  -  ${PN}-json \<br>
                  -  ${PN}-lang \<br>
                  -  ${PN}-logging \<br>
                  -  ${PN}-mailbox \<br>
                  -  ${PN}-math \<br>
                  -  ${PN}-mime \<br>
                  -  ${PN}-mmap \<br>
                  -  ${PN}-multiprocessing \<br>
                  -  ${PN}-netclient \<br>
                  -  ${PN}-netserver \<br>
                  -  ${PN}-numbers \<br>
                  -  ${PN}-pickle \<br>
                  -  ${PN}-pkgutil \<br>
                  -  ${PN}-plistlib \<br>
                  -  ${PN}-pprint \<br>
                  -  ${PN}-profile \<br>
                  -  ${PN}-pydoc \<br>
                  -  ${PN}-re \<br>
                  -  ${PN}-readline \<br>
                  -  ${PN}-resource \<br>
                  -  ${PN}-robotparser \<br>
                  -  ${PN}-runpy \<br>
                  -  ${PN}-shell \<br>
                  -  ${PN}-smtpd \<br>
                  -  ${PN}-sqlite3 \<br>
                  -  ${PN}-sqlite3-tests \<br>
                  -  ${PN}-stringold \<br>
                  -  ${PN}-subprocess \<br>
                  -  ${PN}-syslog \<br>
                  -  ${PN}-terminal \<br>
                  -  ${PN}-tests \<br>
                  -  ${PN}-textutils \<br>
                  -  ${PN}-threading \<br>
                  -  ${PN}-tkinter \<br>
                  -  ${PN}-unittest \<br>
                  -  ${PN}-unixadmin \<br>
                  -  ${PN}-xml \<br>
                  -  ${PN}-xmlrpc \<br>
                  -  ${PN}-zlib \<br>
                  -  ${PN}-modules\<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-2to3="Python automated Python 2 to 3
                  code translator"<br>
                  -RDEPENDS_${PN}-2to3="${PN}-co<wbr>re"<br>
                  -FILES_${PN}-2to3=" \<br>
                  -    ${bindir}/2to3 \<br>
                  -    ${libdir}/python2.7/lib2to3 \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-argparse="Pytho<wbr>n command line
                  argument parser"<br>
                  -RDEPENDS_${PN}-argparse="${PN<wbr>}-core ${PN}-codecs
                  ${PN}-textutils"<br>
                  -FILES_${PN}-argparse=" \<br>
                  -    ${libdir}/python2.7/argparse.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-audio="Python Audio Handling"<br>
                  -RDEPENDS_${PN}-audio="${PN}-c<wbr>ore"<br>
                  -FILES_${PN}-audio=" \<br>
                  -    ${libdir}/python2.7/wave.* \<br>
                  -    ${libdir}/python2.7/chunk.* \<br>
                  -    ${libdir}/python2.7/sndhdr.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/ossaudiodev.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/audioop.so \<br>
                  -    ${libdir}/python2.7/audiodev.* \<br>
                  -    ${libdir}/python2.7/sunaudio.* \<br>
                  -    ${libdir}/python2.7/sunau.* \<br>
                  -    ${libdir}/python2.7/toaiff.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-bsddb="Python bindings for the Berkeley
                  Database"<br>
                  -RDEPENDS_${PN}-bsddb="${PN}-c<wbr>ore"<br>
                  -FILES_${PN}-bsddb=" \<br>
                  -    ${libdir}/python2.7/bsddb \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_bsddb.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-codecs="Python codecs, encodings &amp;
                  i18n support"<br>
                  -RDEPENDS_${PN}-codecs="${PN}-<wbr>core ${PN}-lang"<br>
                  -FILES_${PN}-codecs=" \<br>
                  -    ${libdir}/python2.7/codecs.* \<br>
                  -    ${libdir}/python2.7/encodings \<br>
                  -    ${libdir}/python2.7/gettext.* \<br>
                  -    ${libdir}/python2.7/locale.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_locale.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_codecs* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_multibytecodec.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/unicodedata.so
                  \<br>
                  -    ${libdir}/python2.7/stringprep<wbr>.* \<br>
                  -    ${libdir}/python2.7/xdrlib.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-compile="Python bytecode compilation
                  support"<br>
                  -RDEPENDS_${PN}-compile="${PN}<wbr>-core"<br>
                  -FILES_${PN}-compile=" \<br>
                  -    ${libdir}/python2.7/py_compile<wbr>.* \<br>
                  -    ${libdir}/python2.7/compileall<wbr>.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-compiler="Pytho<wbr>n compiler support"<br>
                  -RDEPENDS_${PN}-compiler="${PN<wbr>}-core"<br>
                  -FILES_${PN}-compiler=" \<br>
                  -    ${libdir}/python2.7/compiler \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-compression="Py<wbr>thon high-level
                  compression support"<br>
                  -RDEPENDS_${PN}-compression="$<wbr>{PN}-core
                  ${PN}-zlib"<br>
                  -FILES_${PN}-compression=" \<br>
                  -    ${libdir}/python2.7/gzip.* \<br>
                  -    ${libdir}/python2.7/zipfile.* \<br>
                  -    ${libdir}/python2.7/tarfile.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/bz2.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-contextlib="Pyt<wbr>hon utilities for
                  with-statementcontexts."<br>
                  -RDEPENDS_${PN}-contextlib="${<wbr>PN}-core"<br>
                  -FILES_${PN}-contextlib=" \<br>
                  -    ${libdir}/python${PYTHON_MAJMI<wbr>N}/contextlib.*
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-core="Python interpreter and core
                  modules"<br>
                  -RDEPENDS_${PN}-core="${PN}-la<wbr>ng ${PN}-re"<br>
                  -FILES_${PN}-core=" \<br>
                  -    ${libdir}/python2.7/__future__<wbr>.* \<br>
                  -    ${libdir}/python2.7/_abcoll.* \<br>
                  -    ${libdir}/python2.7/abc.* \<br>
                  -    ${libdir}/python2.7/ast.* \<br>
                  -    ${libdir}/python2.7/copy.* \<br>
                  -    ${libdir}/python2.7/copy_reg.* \<br>
                  -    ${libdir}/python2.7/ConfigPars<wbr>er.* \<br>
                  -    ${libdir}/python2.7/genericpat<wbr>h.* \<br>
                  -    ${libdir}/python2.7/getopt.* \<br>
                  -    ${libdir}/python2.7/linecache.<wbr>* \<br>
                  -    ${libdir}/python2.7/new.* \<br>
                  -    ${libdir}/python2.7/os.* \<br>
                  -    ${libdir}/python2.7/posixpath.<wbr>* \<br>
                  -    ${libdir}/python2.7/struct.* \<br>
                  -    ${libdir}/python2.7/warnings.* \<br>
                  -    ${libdir}/python2.7/site.* \<br>
                  -    ${libdir}/python2.7/stat.* \<br>
                  -    ${libdir}/python2.7/UserDict.* \<br>
                  -    ${libdir}/python2.7/UserList.* \<br>
                  -    ${libdir}/python2.7/UserString<wbr>.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/binascii.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_struct.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/time.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/xreadlines.so
                  \<br>
                  -    ${libdir}/python2.7/types.* \<br>
                  -    ${libdir}/python2.7/platform.* \<br>
                  -    ${bindir}/python* \<br>
                  -    ${libdir}/python2.7/_weakrefse<wbr>t.* \<br>
                  -    ${libdir}/python2.7/sysconfig.<wbr>* \<br>
                  -    ${libdir}/python2.7/_sysconfig<wbr>data.* \<br>
                  -    ${includedir}/python${PYTHON_M<wbr>AJMIN}/pyconfig*.h
                  \<br>
                  -    ${libdir}/python${PYTHON_MAJMI<wbr>N}/sitecustomize.py
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-crypt="Python basic cryptographic and
                  hashing support"<br>
                  -RDEPENDS_${PN}-crypt="${PN}-c<wbr>ore"<br>
                  -FILES_${PN}-crypt=" \<br>
                  -    ${libdir}/python2.7/hashlib.* \<br>
                  -    ${libdir}/python2.7/md5.* \<br>
                  -    ${libdir}/python2.7/sha.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/crypt.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_hashlib.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_sha256.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_sha512.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-ctypes="Python C types support"<br>
                  -RDEPENDS_${PN}-ctypes="${PN}-<wbr>core"<br>
                  -FILES_${PN}-ctypes=" \<br>
                  -    ${libdir}/python2.7/ctypes \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_ctypes.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_ctypes_test.so
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-curses="Python curses support"<br>
                  -RDEPENDS_${PN}-curses="${PN}-<wbr>core"<br>
                  -FILES_${PN}-curses=" \<br>
                  -    ${libdir}/python2.7/curses \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_curses.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_curses_panel.so
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-datetime="Pytho<wbr>n calendar and time
                  support"<br>
                  -RDEPENDS_${PN}-datetime="${PN<wbr>}-core
                  ${PN}-codecs"<br>
                  -FILES_${PN}-datetime=" \<br>
                  -    ${libdir}/python2.7/_strptime.<wbr>* \<br>
                  -    ${libdir}/python2.7/calendar.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/datetime.so
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-db="Python file-based database support"<br>
                  -RDEPENDS_${PN}-db="${PN}-core<wbr>"<br>
                  -FILES_${PN}-db=" \<br>
                  -    ${libdir}/python2.7/anydbm.* \<br>
                  -    ${libdir}/python2.7/dumbdbm.* \<br>
                  -    ${libdir}/python2.7/whichdb.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-debugger="Pytho<wbr>n debugger"<br>
                  -RDEPENDS_${PN}-debugger="${PN<wbr>}-core ${PN}-io
                  ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell
                  ${PN}-pprint"<br>
                  -FILES_${PN}-debugger=" \<br>
                  -    ${libdir}/python2.7/bdb.* \<br>
                  -    ${libdir}/python2.7/pdb.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-dev="Python development package"<br>
                  -RDEPENDS_${PN}-dev="${PN}-cor<wbr>e"<br>
                  -FILES_${PN}-dev=" \<br>
                  -    ${includedir} \<br>
                  -    ${libdir}/lib*${SOLIBSDEV} \<br>
                  -    ${libdir}/*.la \<br>
                  -    ${libdir}/*.a \<br>
                  -    ${libdir}/*.o \<br>
                  -    ${libdir}/pkgconfig \<br>
                  -    ${base_libdir}/*.a \<br>
                  -    ${base_libdir}/*.o \<br>
                  -    ${datadir}/aclocal \<br>
                  -    ${datadir}/pkgconfig \<br>
                  -    ${libdir}/python2.7/config/Mak<wbr>efile \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-difflib="Python helpers for computing
                  deltas between objects"<br>
                  -RDEPENDS_${PN}-difflib="${PN}<wbr>-lang ${PN}-re"<br>
                  -FILES_${PN}-difflib=" \<br>
                  -    ${libdir}/python2.7/difflib.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-distutils="Pyth<wbr>on Distribution
                  Utilities"<br>
                  -RDEPENDS_${PN}-distutils="${P<wbr>N}-core
                  ${PN}-email"<br>
                  -FILES_${PN}-distutils=" \<br>
                  -    ${libdir}/python2.7/config \<br>
                  -    ${libdir}/python2.7/distutils \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-distutils-stati<wbr>cdev="Python
                  distribution utilities (static libraries)"<br>
                  -RDEPENDS_${PN}-distutils-stat<wbr>icdev="${PN}-distutils"<br>
                  -FILES_${PN}-distutils-staticd<wbr>ev=" \<br>
                  -    ${libdir}/python2.7/config/lib<wbr>*.a \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-doctest="Python framework for running
                  examples in docstrings"<br>
                  -RDEPENDS_${PN}-doctest="${PN}<wbr>-core ${PN}-lang
                  ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger
                  ${PN}-difflib"<br>
                  -FILES_${PN}-doctest=" \<br>
                  -    ${libdir}/python2.7/doctest.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-email="Python email support"<br>
                  -RDEPENDS_${PN}-email="${PN}-c<wbr>ore ${PN}-io
                  ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image
                  ${PN}-netclient"<br>
                  -FILES_${PN}-email=" \<br>
                  -    ${libdir}/python2.7/imaplib.* \<br>
                  -    ${libdir}/python2.7/email \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-fcntl="Python's fcntl interface"<br>
                  -RDEPENDS_${PN}-fcntl="${PN}-c<wbr>ore"<br>
                  -FILES_${PN}-fcntl=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/fcntl.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-gdbm="Python GNU database support"<br>
                  -RDEPENDS_${PN}-gdbm="${PN}-co<wbr>re"<br>
                  -FILES_${PN}-gdbm=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/gdbm.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-hotshot="Python hotshot performance
                  profiler"<br>
                  -RDEPENDS_${PN}-hotshot="${PN}<wbr>-core"<br>
                  -FILES_${PN}-hotshot=" \<br>
                  -    ${libdir}/python2.7/hotshot \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_hotshot.so
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-html="Python HTML processing support"<br>
                  -RDEPENDS_${PN}-html="${PN}-co<wbr>re"<br>
                  -FILES_${PN}-html=" \<br>
                  -    ${libdir}/python2.7/formatter.<wbr>* \<br>
                  -    ${libdir}/python2.7/htmlentity<wbr>defs.* \<br>
                  -    ${libdir}/python2.7/htmllib.* \<br>
                  -    ${libdir}/python2.7/markupbase<wbr>.* \<br>
                  -    ${libdir}/python2.7/sgmllib.* \<br>
                  -    ${libdir}/python2.7/HTMLParser<wbr>.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-idle="Python Integrated Development
                  Environment"<br>
                  -RDEPENDS_${PN}-idle="${PN}-co<wbr>re ${PN}-tkinter"<br>
                  -FILES_${PN}-idle=" \<br>
                  -    ${bindir}/idle \<br>
                  -    ${libdir}/python2.7/idlelib \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-image="Python graphical image handling"<br>
                  -RDEPENDS_${PN}-image="${PN}-c<wbr>ore"<br>
                  -FILES_${PN}-image=" \<br>
                  -    ${libdir}/python2.7/colorsys.* \<br>
                  -    ${libdir}/python2.7/imghdr.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/imageop.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/rgbimg.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-importlib="Pyth<wbr>on import
                  implementation library"<br>
                  -RDEPENDS_${PN}-importlib="${P<wbr>N}-core"<br>
                  -FILES_${PN}-importlib=" \<br>
                  -    ${libdir}/python2.7/importlib \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-io="Python low-level I/O"<br>
                  -RDEPENDS_${PN}-io="${PN}-core ${PN}-math
                  ${PN}-textutils ${PN}-netclient ${PN}-contextlib"<br>
                  -FILES_${PN}-io=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_socket.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_io.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_ssl.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/select.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/termios.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/cStringIO.so
                  \<br>
                  -    ${libdir}/python2.7/pipes.* \<br>
                  -    ${libdir}/python2.7/socket.* \<br>
                  -    ${libdir}/python2.7/ssl.* \<br>
                  -    ${libdir}/python2.7/tempfile.* \<br>
                  -    ${libdir}/python2.7/StringIO.* \<br>
                  -    ${libdir}/python2.7/io.* \<br>
                  -    ${libdir}/python2.7/_pyio.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-json="Python JSON support"<br>
                  -RDEPENDS_${PN}-json="${PN}-co<wbr>re ${PN}-math
                  ${PN}-re ${PN}-codecs"<br>
                  -FILES_${PN}-json=" \<br>
                  -    ${libdir}/python2.7/json \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_json.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-lang="Python low-level language
                  support"<br>
                  -RDEPENDS_${PN}-lang="${PN}-co<wbr>re"<br>
                  -FILES_${PN}-lang=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_bisect.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_collections.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_heapq.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_weakref.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_functools.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/array.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/itertools.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/operator.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/parser.so \<br>
                  -    ${libdir}/python2.7/atexit.* \<br>
                  -    ${libdir}/python2.7/bisect.* \<br>
                  -    ${libdir}/python2.7/code.* \<br>
                  -    ${libdir}/python2.7/codeop.* \<br>
                  -    ${libdir}/python2.7/collection<wbr>s.* \<br>
                  -    ${libdir}/python2.7/dis.* \<br>
                  -    ${libdir}/python2.7/functools.<wbr>* \<br>
                  -    ${libdir}/python2.7/heapq.* \<br>
                  -    ${libdir}/python2.7/inspect.* \<br>
                  -    ${libdir}/python2.7/keyword.* \<br>
                  -    ${libdir}/python2.7/opcode.* \<br>
                  -    ${libdir}/python2.7/symbol.* \<br>
                  -    ${libdir}/python2.7/repr.* \<br>
                  -    ${libdir}/python2.7/token.* \<br>
                  -    ${libdir}/python2.7/tokenize.* \<br>
                  -    ${libdir}/python2.7/traceback.<wbr>* \<br>
                  -    ${libdir}/python2.7/weakref.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-logging="Python logging support"<br>
                  -RDEPENDS_${PN}-logging="${PN}<wbr>-core ${PN}-io
                  ${PN}-lang ${PN}-pickle ${PN}-stringold"<br>
                  -FILES_${PN}-logging=" \<br>
                  -    ${libdir}/python2.7/logging \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-mailbox="Python mailbox format support"<br>
                  -RDEPENDS_${PN}-mailbox="${PN}<wbr>-core ${PN}-mime"<br>
                  -FILES_${PN}-mailbox=" \<br>
                  -    ${libdir}/python2.7/mailbox.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-math="Python math support"<br>
                  -RDEPENDS_${PN}-math="${PN}-co<wbr>re ${PN}-crypt"<br>
                  -FILES_${PN}-math=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/cmath.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/math.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_random.so \<br>
                  -    ${libdir}/python2.7/random.* \<br>
                  -    ${libdir}/python2.7/sets.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-mime="Python MIME handling APIs"<br>
                  -RDEPENDS_${PN}-mime="${PN}-co<wbr>re ${PN}-io"<br>
                  -FILES_${PN}-mime=" \<br>
                  -    ${libdir}/python2.7/mimetools.<wbr>* \<br>
                  -    ${libdir}/python2.7/uu.* \<br>
                  -    ${libdir}/python2.7/quopri.* \<br>
                  -    ${libdir}/python2.7/rfc822.* \<br>
                  -    ${libdir}/python2.7/MimeWriter<wbr>.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-mmap="Python memory-mapped file
                  support"<br>
                  -RDEPENDS_${PN}-mmap="${PN}-co<wbr>re ${PN}-io"<br>
                  -FILES_${PN}-mmap=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/mmap.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-multiprocessing<wbr>="Python
                  multiprocessing support"<br>
                  -RDEPENDS_${PN}-multiprocessin<wbr>g="${PN}-core
                  ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading
                  ${PN}-ctypes ${PN}-mmap"<br>
                  -FILES_${PN}-multiprocessing=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_multiprocessing.so
                  \<br>
                  -    ${libdir}/python2.7/multiproce<wbr>ssing \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-netclient="Pyth<wbr>on Internet
                  Protocol clients"<br>
                  -RDEPENDS_${PN}-netclient="${P<wbr>N}-core ${PN}-crypt
                  ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging
                  ${PN}-mime"<br>
                  -FILES_${PN}-netclient=" \<br>
                  -    ${libdir}/python2.7/*Cookie*.* \<br>
                  -    ${libdir}/python2.7/base64.* \<br>
                  -    ${libdir}/python2.7/cookielib.<wbr>* \<br>
                  -    ${libdir}/python2.7/ftplib.* \<br>
                  -    ${libdir}/python2.7/gopherlib.<wbr>* \<br>
                  -    ${libdir}/python2.7/hmac.* \<br>
                  -    ${libdir}/python2.7/httplib.* \<br>
                  -    ${libdir}/python2.7/mimetypes.<wbr>* \<br>
                  -    ${libdir}/python2.7/nntplib.* \<br>
                  -    ${libdir}/python2.7/poplib.* \<br>
                  -    ${libdir}/python2.7/smtplib.* \<br>
                  -    ${libdir}/python2.7/telnetlib.<wbr>* \<br>
                  -    ${libdir}/python2.7/urllib.* \<br>
                  -    ${libdir}/python2.7/urllib2.* \<br>
                  -    ${libdir}/python2.7/urlparse.* \<br>
                  -    ${libdir}/python2.7/uuid.* \<br>
                  -    ${libdir}/python2.7/rfc822.* \<br>
                  -    ${libdir}/python2.7/mimetools.<wbr>* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-netserver="Pyth<wbr>on Internet
                  Protocol servers"<br>
                  -RDEPENDS_${PN}-netserver="${P<wbr>N}-core
                  ${PN}-netclient ${PN}-shell ${PN}-threading"<br>
                  -FILES_${PN}-netserver=" \<br>
                  -    ${libdir}/python2.7/cgi.* \<br>
                  -    ${libdir}/python2.7/*HTTPServe<wbr>r.* \<br>
                  -    ${libdir}/python2.7/SocketServ<wbr>er.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-numbers="Python number APIs"<br>
                  -RDEPENDS_${PN}-numbers="${PN}<wbr>-core ${PN}-lang
                  ${PN}-re"<br>
                  -FILES_${PN}-numbers=" \<br>
                  -    ${libdir}/python2.7/decimal.* \<br>
                  -    ${libdir}/python2.7/fractions.<wbr>* \<br>
                  -    ${libdir}/python2.7/numbers.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-pickle="Python
                  serialisation/persistence support"<br>
                  -RDEPENDS_${PN}-pickle="${PN}-<wbr>core ${PN}-codecs
                  ${PN}-io ${PN}-re"<br>
                  -FILES_${PN}-pickle=" \<br>
                  -    ${libdir}/python2.7/pickle.* \<br>
                  -    ${libdir}/python2.7/shelve.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/cPickle.so \<br>
                  -    ${libdir}/python2.7/pickletool<wbr>s.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-pkgutil="Python package extension
                  utility support"<br>
                  -RDEPENDS_${PN}-pkgutil="${PN}<wbr>-core"<br>
                  -FILES_${PN}-pkgutil=" \<br>
                  -    ${libdir}/python2.7/pkgutil.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-plistlib="Gener<wbr>ate and parse Mac
                  OS X .plist files"<br>
                  -RDEPENDS_${PN}-plistlib="${PN<wbr>}-core
                  ${PN}-datetime ${PN}-io"<br>
                  -FILES_${PN}-plistlib=" \<br>
                  -    ${libdir}/python2.7/plistlib.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-pprint="Python pretty-print support"<br>
                  -RDEPENDS_${PN}-pprint="${PN}-<wbr>core ${PN}-io"<br>
                  -FILES_${PN}-pprint=" \<br>
                  -    ${libdir}/python2.7/pprint.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-profile="Python basic performance
                  profiling support"<br>
                  -RDEPENDS_${PN}-profile="${PN}<wbr>-core
                  ${PN}-textutils"<br>
                  -FILES_${PN}-profile=" \<br>
                  -    ${libdir}/python2.7/profile.* \<br>
                  -    ${libdir}/python2.7/pstats.* \<br>
                  -    ${libdir}/python2.7/cProfile.* \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_lsprof.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-pydoc="Python interactive help support"<br>
                  -RDEPENDS_${PN}-pydoc="${PN}-c<wbr>ore ${PN}-lang
                  ${PN}-stringold ${PN}-re"<br>
                  -FILES_${PN}-pydoc=" \<br>
                  -    ${bindir}/pydoc \<br>
                  -    ${libdir}/python2.7/pydoc.* \<br>
                  -    ${libdir}/python2.7/pydoc_data \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-re="Python Regular Expression APIs"<br>
                  -RDEPENDS_${PN}-re="${PN}-core<wbr>"<br>
                  -FILES_${PN}-re=" \<br>
                  -    ${libdir}/python2.7/re.* \<br>
                  -    ${libdir}/python2.7/sre.* \<br>
                  -    ${libdir}/python2.7/sre_compil<wbr>e.* \<br>
                  -    ${libdir}/python2.7/sre_consta<wbr>nts* \<br>
                  -    ${libdir}/python2.7/sre_parse.<wbr>* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-readline="Pytho<wbr>n readline support"<br>
                  -RDEPENDS_${PN}-readline="${PN<wbr>}-core"<br>
                  -FILES_${PN}-readline=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/readline.so
                  \<br>
                  -    ${libdir}/python2.7/rlcomplete<wbr>r.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-resource="Pytho<wbr>n resource control
                  interface"<br>
                  -RDEPENDS_${PN}-resource="${PN<wbr>}-core"<br>
                  -FILES_${PN}-resource=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/resource.so
                  \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-robotparser="Py<wbr>thon robots.txt
                  parser"<br>
                  -RDEPENDS_${PN}-robotparser="$<wbr>{PN}-core
                  ${PN}-netclient"<br>
                  -FILES_${PN}-robotparser=" \<br>
                  -    ${libdir}/python2.7/robotparse<wbr>r.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-runpy="Python script for
                  locating/executing scripts in module namespace"<br>
                  -RDEPENDS_${PN}-runpy="${PN}-c<wbr>ore ${PN}-pkgutil"<br>
                  -FILES_${PN}-runpy=" \<br>
                  -    ${libdir}/python2.7/runpy.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-shell="Python shell-like functionality"<br>
                  -RDEPENDS_${PN}-shell="${PN}-c<wbr>ore ${PN}-re"<br>
                  -FILES_${PN}-shell=" \<br>
                  -    ${libdir}/python2.7/cmd.* \<br>
                  -    ${libdir}/python2.7/commands.* \<br>
                  -    ${libdir}/python2.7/dircache.* \<br>
                  -    ${libdir}/python2.7/fnmatch.* \<br>
                  -    ${libdir}/python2.7/glob.* \<br>
                  -    ${libdir}/python2.7/popen2.* \<br>
                  -    ${libdir}/python2.7/shlex.* \<br>
                  -    ${libdir}/python2.7/shutil.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-smtpd="Python Simple Mail Transport
                  Daemon"<br>
                  -RDEPENDS_${PN}-smtpd="${PN}-c<wbr>ore ${PN}-netserver
                  ${PN}-email ${PN}-mime"<br>
                  -FILES_${PN}-smtpd=" \<br>
                  -    ${bindir}/smtpd.* \<br>
                  -    ${libdir}/python2.7/smtpd.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-sqlite3="Python Sqlite3 database
                  support"<br>
                  -RDEPENDS_${PN}-sqlite3="${PN}<wbr>-core
                  ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io
                  ${PN}-threading ${PN}-zlib"<br>
                  -FILES_${PN}-sqlite3=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_sqlite3.so
                  \<br>
                  -    ${libdir}/python2.7/sqlite3/db<wbr>api2.* \<br>
                  -    ${libdir}/python2.7/sqlite3/__<wbr>init__.* \<br>
                  -    ${libdir}/python2.7/sqlite3/du<wbr>mp.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-sqlite3-tests="<wbr>Python Sqlite3
                  database support tests"<br>
                  -RDEPENDS_${PN}-sqlite3-tests=<wbr>"${PN}-core
                  ${PN}-sqlite3"<br>
                  -FILES_${PN}-sqlite3-tests=" \<br>
                  -    ${libdir}/python2.7/sqlite3/te<wbr>st \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-stringold="Pyth<wbr>on string APIs
                  [deprecated]"<br>
                  -RDEPENDS_${PN}-stringold="${P<wbr>N}-core ${PN}-re"<br>
                  -FILES_${PN}-stringold=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/strop.so \<br>
                  -    ${libdir}/python2.7/string.* \<br>
                  -    ${libdir}/python2.7/stringold.<wbr>* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-subprocess="Pyt<wbr>hon subprocess
                  support"<br>
                  -RDEPENDS_${PN}-subprocess="${<wbr>PN}-core ${PN}-io
                  ${PN}-re ${PN}-fcntl ${PN}-pickle"<br>
                  -FILES_${PN}-subprocess=" \<br>
                  -    ${libdir}/python2.7/subprocess<wbr>.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-syslog="Python syslog interface"<br>
                  -RDEPENDS_${PN}-syslog="${PN}-<wbr>core"<br>
                  -FILES_${PN}-syslog=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/syslog.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-terminal="Pytho<wbr>n terminal
                  controlling support"<br>
                  -RDEPENDS_${PN}-terminal="${PN<wbr>}-core ${PN}-io"<br>
                  -FILES_${PN}-terminal=" \<br>
                  -    ${libdir}/python2.7/pty.* \<br>
                  -    ${libdir}/python2.7/tty.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-tests="Python tests"<br>
                  -RDEPENDS_${PN}-tests="${PN}-c<wbr>ore ${PN}-modules"<br>
                  -FILES_${PN}-tests=" \<br>
                  -    ${libdir}/python2.7/test \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-textutils="Pyth<wbr>on option parsing,
                  text wrapping and CSV support"<br>
                  -RDEPENDS_${PN}-textutils="${P<wbr>N}-core ${PN}-io
                  ${PN}-re ${PN}-stringold"<br>
                  -FILES_${PN}-textutils=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_csv.so \<br>
                  -    ${libdir}/python2.7/csv.* \<br>
                  -    ${libdir}/python2.7/optparse.* \<br>
                  -    ${libdir}/python2.7/textwrap.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-threading="Pyth<wbr>on threading &amp;
                  synchronization support"<br>
                  -RDEPENDS_${PN}-threading="${P<wbr>N}-core ${PN}-lang"<br>
                  -FILES_${PN}-threading=" \<br>
                  -    ${libdir}/python2.7/_threading<wbr>_local.* \<br>
                  -    ${libdir}/python2.7/dummy_thre<wbr>ad.* \<br>
                  -    ${libdir}/python2.7/dummy_thre<wbr>ading.* \<br>
                  -    ${libdir}/python2.7/mutex.* \<br>
                  -    ${libdir}/python2.7/threading.<wbr>* \<br>
                  -    ${libdir}/python2.7/Queue.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"<br>
                  -RDEPENDS_${PN}-tkinter="${PN}<wbr>-core"<br>
                  -FILES_${PN}-tkinter=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_tkinter.so
                  \<br>
                  -    ${libdir}/python2.7/lib-tk \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-unittest="Pytho<wbr>n unit testing
                  framework"<br>
                  -RDEPENDS_${PN}-unittest="${PN<wbr>}-core
                  ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib
                  ${PN}-pprint ${PN}-shell"<br>
                  -FILES_${PN}-unittest=" \<br>
                  -    ${libdir}/python2.7/unittest/ \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-unixadmin="Pyth<wbr>on Unix
                  administration support"<br>
                  -RDEPENDS_${PN}-unixadmin="${P<wbr>N}-core"<br>
                  -FILES_${PN}-unixadmin=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/nis.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/grp.so \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/pwd.so \<br>
                  -    ${libdir}/python2.7/getpass.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-xml="Python basic XML support"<br>
                  -RDEPENDS_${PN}-xml="${PN}-cor<wbr>e ${PN}-re"<br>
                  -FILES_${PN}-xml=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/_elementtree.so
                  \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/pyexpat.so \<br>
                  -    ${libdir}/python2.7/xml \<br>
                  -    ${libdir}/python2.7/xmllib.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-xmlrpc="Python XML-RPC support"<br>
                  -RDEPENDS_${PN}-xmlrpc="${PN}-<wbr>core ${PN}-xml
                  ${PN}-netserver ${PN}-lang"<br>
                  -FILES_${PN}-xmlrpc=" \<br>
                  -    ${libdir}/python2.7/xmlrpclib.<wbr>* \<br>
                  -    ${libdir}/python2.7/SimpleXMLR<wbr>PCServer.* \<br>
                  -    ${libdir}/python2.7/DocXMLRPCS<wbr>erver.* \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-zlib="Python zlib compression support"<br>
                  -RDEPENDS_${PN}-zlib="${PN}-co<wbr>re"<br>
                  -FILES_${PN}-zlib=" \<br>
                  -    ${libdir}/python2.7/lib-dynloa<wbr>d/zlib.so \<br>
                  -"<br>
                  -<br>
                  -SUMMARY_${PN}-modules="All Python modules"<br>
                  -RDEPENDS_${PN}-modules=" \<br>
                  -  ${PN}-2to3 \<br>
                  -  ${PN}-argparse \<br>
                  -  ${PN}-audio \<br>
                  -  ${PN}-bsddb \<br>
                  -  ${PN}-codecs \<br>
                  -  ${PN}-compile \<br>
                  -  ${PN}-compiler \<br>
                  -  ${PN}-compression \<br>
                  -  ${PN}-contextlib \<br>
                  -  ${PN}-core \<br>
                  -  ${PN}-crypt \<br>
                  -  ${PN}-ctypes \<br>
                  -  ${PN}-curses \<br>
                  -  ${PN}-datetime \<br>
                  -  ${PN}-db \<br>
                  -  ${PN}-debugger \<br>
                  -  ${PN}-difflib \<br>
                  -  ${PN}-distutils \<br>
                  -  ${PN}-doctest \<br>
                  -  ${PN}-email \<br>
                  -  ${PN}-fcntl \<br>
                  -  ${PN}-gdbm \<br>
                  -  ${PN}-hotshot \<br>
                  -  ${PN}-html \<br>
                  -  ${PN}-idle \<br>
                  -  ${PN}-image \<br>
                  -  ${PN}-importlib \<br>
                  -  ${PN}-io \<br>
                  -  ${PN}-json \<br>
                  -  ${PN}-lang \<br>
                  -  ${PN}-logging \<br>
                  -  ${PN}-mailbox \<br>
                  -  ${PN}-math \<br>
                  -  ${PN}-mime \<br>
                  -  ${PN}-mmap \<br>
                  -  ${PN}-multiprocessing \<br>
                  -  ${PN}-netclient \<br>
                  -  ${PN}-netserver \<br>
                  -  ${PN}-numbers \<br>
                  -  ${PN}-pickle \<br>
                  -  ${PN}-pkgutil \<br>
                  -  ${PN}-plistlib \<br>
                  -  ${PN}-pprint \<br>
                  -  ${PN}-profile \<br>
                  -  ${PN}-pydoc \<br>
                  -  ${PN}-re \<br>
                  -  ${PN}-readline \<br>
                  -  ${PN}-resource \<br>
                  -  ${PN}-robotparser \<br>
                  -  ${PN}-runpy \<br>
                  -  ${PN}-shell \<br>
                  -  ${PN}-smtpd \<br>
                  -  ${PN}-sqlite3 \<br>
                  -  ${PN}-sqlite3-tests \<br>
                  -  ${PN}-stringold \<br>
                  -  ${PN}-subprocess \<br>
                  -  ${PN}-syslog \<br>
                  -  ${PN}-terminal \<br>
                  -  ${PN}-textutils \<br>
                  -  ${PN}-threading \<br>
                  -  ${PN}-tkinter \<br>
                  -  ${PN}-unittest \<br>
                  -  ${PN}-unixadmin \<br>
                  -  ${PN}-xml \<br>
                  -  ${PN}-xmlrpc \<br>
                  -  ${PN}-zlib \<br>
                  -"<br>
                  -ALLOW_EMPTY_${PN}-modules = "1"<br>
                  -<br>
                  -<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/python-native-2.7-manifest.<wbr>inc
                  b/meta/recipes-devtools/python<wbr>/python-native-2.7-manifest.<wbr>inc<br>
                  deleted file mode 100644<br>
                  index b05aae0..0000000<br>
                  --- a/meta/recipes-devtools/python<wbr>/python-native-2.7-manifest.<wbr>inc<br>
                  +++ /dev/null<br>
                  @@ -1,9 +0,0 @@<br>
                  -<br>
                  -# WARNING: This file is AUTO GENERATED: Manual edits
                  will be lost next time I regenerate the file.<br>
                  -# Generator: '../scripts/contrib/python/<a
                    href="http://generate-manifest-2.7.py"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gen<wbr>erate-manifest-2.7.py</a>
                  --native' Version 20110222.2 (C) 2002-2010 Michael
                  'Mickey' Lauer &lt;<a
                    href="mailto:mlauer@vanille-media.de"
                    target="_blank" moz-do-not-send="true">mlauer@vanille-media.de</a>&gt;<br>
                  -<br>
                  -<br>
                  -<br>
                  -RPROVIDES += "python-modules-native
                  python-2to3-native python-argparse-native
                  python-audio-native python-bsddb-native
                  python-codecs-native python-compile-native
                  python-compiler-native python-compression-native
                  python-contextlib-native python-core-native
                  python-crypt-native python-ctypes-native
                  python-curses-native python-datetime-native
                  python-db-native python-debugger-native
                  python-dev-native python-difflib-native
                  python-distutils-native python-distutils-staticdev-nat<wbr>ive
                  python-doctest- [...]<br>
                  -<br>
                  -<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/<a
                    href="http://python-native_2.7.13.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">python-native_2.7.13.bb</a>
                  b/meta/recipes-devtools/python<wbr>/<a
                    href="http://python-native_2.7.13.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">python-native_2.7.13.bb</a><br>
                  index 7edf153..2b74003 100644<br>
                  --- a/meta/recipes-devtools/python<wbr>/<a
                    href="http://python-native_2.7.13.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">python-native_2.7.13.bb</a><br>
                  +++ b/meta/recipes-devtools/python<wbr>/<a
                    href="http://python-native_2.7.13.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">python-native_2.7.13.bb</a><br>
                  @@ -1,5 +1,4 @@<br>
                   require python.inc<br>
                  -<br>
                   EXTRANATIVEPATH += "bzip2-native"<br>
                   DEPENDS = "openssl-native bzip2-replacement-native
                  zlib-native readline-native sqlite3-native
                  expat-native"<br>
                   PR = "${INC_PR}.1"<br>
                  @@ -25,8 +24,6 @@ FILESEXTRAPATHS =.
                  "${FILE_DIRNAME}/${PN}:"<br>
                  <br>
                   inherit native<br>
                  <br>
                  -require python-native-${PYTHON_MAJMIN}<wbr>-manifest.inc<br>
                  -<br>
                   EXTRA_OECONF_append = " --bindir=${bindir}/${PN}
                  --with-system-expat=${STAGING_<wbr>DIR_HOST}"<br>
                  <br>
                   EXTRA_OEMAKE = '\<br>
                  @@ -59,3 +56,24 @@ do_install() {<br>
                          # installed in the native sysroot, so disable
                  user site support.<br>
                          sed -i -e 's,^\(ENABLE_USER_SITE =
                  \).*,\1False,' ${D}${libdir}/python${PYTHON_M<wbr>AJMIN}/site.py<br>
                   }<br>
                  +<br>
                  +python(){<br>
                  +<br>
                  +    # Read JSON manifest<br>
                  +    import json<br>
                  +    pythondir = d.getVar('THISDIR',True)<br>
                  +    with open(pythondir+'/python/python<wbr>2-manifest.json')
                  as manifest_file:<br>
                  +        python_manifest=json.load(mani<wbr>fest_file)<br>
                  +<br>
                  +    rprovides = d.getVar('RPROVIDES').split()<br>
                  +<br>
                  +    # Hardcoded since it cant be python-native-foo,
                  should be python-foo-native<br>
                  +    pn = 'python'<br>
                  +<br>
                  +    for key in python_manifest:<br>
                  +        pypackage = pn + '-' + key + '-native'<br>
                  +        if pypackage not in rprovides:<br>
                  +              rprovides.append(pypackage)<br>
                  +<br>
                  +    d.setVar('RPROVIDES', ' '.join(rprovides))<br>
                  +}<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/python/create_manifest2.py
                  b/meta/recipes-devtools/python<wbr>/python/create_manifest2.py<br>
                  new file mode 100644<br>
                  index 0000000..bd64ec3<br>
                  --- /dev/null<br>
                  +++ b/meta/recipes-devtools/python<wbr>/python/create_manifest2.py<br>
                  @@ -0,0 +1,277 @@<br>
                  +# This script is used as a bitbake task to create a
                  new python manifest<br>
                  +# $ bitbake python -c create_manifest<br>
                  +#<br>
                  +# Our goal is to keep python-core as small as posible
                  and add other python<br>
                  +# packages only when the user needs them, hence why
                  we split upstream python<br>
                  +# into several packages.<br>
                  +#<br>
                  +# In a very simplistic way what this does is:<br>
                  +# Launch python and see specifically what is required
                  for it to run at a minimum<br>
                  +#<br>
                  +# Go through the python-manifest file and launch a
                  separate task for every single<br>
                  +# one of the files on each package, this task will
                  check what was required for that<br>
                  +# specific module to run, these modules will be
                  called dependencies.<br>
                  +# The output of such task will be a list of the
                  modules or dependencies that were<br>
                  +# found for that file.<br>
                  +#<br>
                  +# Such output will be parsed by this script, we will
                  look for each dependency on the<br>
                  +# manifest and if we find that another package
                  already includes it, then we will add<br>
                  +# that package as an RDEPENDS to the package we are
                  currently checking; in case we dont<br>
                  +# find the current dependency on any other package we
                  will add it to the current package<br>
                  +# as part of FILES.<br>
                  +#<br>
                  +#<br>
                  +# This way we will create a new manifest from the
                  data structure that was built during<br>
                  +# this process, ont this new manifest each package
                  will contain specifically only<br>
                  +# what it needs to run.<br>
                  +#<br>
                  +# There are some caveats which we try to deal with,
                  such as repeated files on different<br>
                  +# packages, packages that include folders, wildcards,
                  and special packages.<br>
                  +# Its also important to note that this method only
                  works for python files, and shared<br>
                  +# libraries. Static libraries, header files and
                  binaries need to be dealt with manually.<br>
                  +#<br>
                  +# Author: Alejandro Enedino Hernandez Samaniego
                  "aehs29" &lt;<a href="mailto:aehs29@gmail.com"
                    target="_blank" moz-do-not-send="true">aehs29@gmail.com</a>&gt;<br>
                  +<br>
                  +<br>
                  +import sys<br>
                  +import subprocess<br>
                  +import json<br>
                  +import os<br>
                  +<br>
                  +# Hack to get native python search path (for
                  folders), not fond of it but it works for now<br>
                  +pivot='recipe-sysroot-native'<br>
                  +for p in sys.path:<br>
                  +  if pivot in p:<br>
                  +    nativelibfolder=p[:p.find(pivo<wbr>t)+len(pivot)]<br>
                  +<br>
                  +# Empty dict to hold the whole manifest<br>
                  +new_manifest = {}<br>
                  +<br>
                  +# Check for repeated files, folders and wildcards<br>
                  +allfiles=[]<br>
                  +repeated=[]<br>
                  +wildcards=[]<br>
                  +<br>
                  +hasfolders=[]<br>
                  +allfolders=[]<br>
                  +<br>
                  +def isFolder(value):<br>
                  +  if os.path.isdir(value.replace('$<wbr>{libdir}',nativelibfolder+'/us<wbr>r/lib'))
                  or os.path.isdir(value.replace('$<wbr>{libdir}',nativelibfolder+'/us<wbr>r/lib64'))
                  or os.path.isdir(value.replace('$<wbr>{libdir}',nativelibfolder+'/us<wbr>r/lib32')):<br>
                  +    return True<br>
                  +  else:<br>
                  +    return False<br>
                  +<br>
                  +# Read existing JSON manifest<br>
                  +with open('python2-manifest.json') as manifest:<br>
                  +  old_manifest=json.load(manifes<wbr>t)<br>
                  +<br>
                  +<br>
                  +# First pass to get core-package functionality,
                  because we base everything on the fact that core is
                  actually working<br>
                  +# Not exactly the same so it should not be a function<br>
                  +print ("Getting dependencies for core package:")<br>
                  +<br>
                  +# Special call to check for core package<br>
                  +output = subprocess.check_output([sys.e<wbr>xecutable,
                  'get_module_deps2.py', 'python-core-package'])<br>
                  +for item in output.split():<br>
                  +    # We append it so it doesnt hurt what we
                  currently have:<br>
                  +    if item not in old_manifest['core']['files']:<br>
                  +        # We use the same data structure since its
                  the one which will be used to check<br>
                  +        # dependencies for other packages<br>
                  +        old_manifest['core']['files'].<wbr>append(item)<br>
                  +<br>
                  +for value in old_manifest['core']['files']:<br>
                  +  # Ignore folders, since we don't import those,
                  difficult to handle multilib<br>
                  +  if isFolder(value):<br>
                  +    # Pass it directly<br>
                  +    if value not in old_manifest['core']['files']:<br>
                  +      old_manifest['core']['files'].<wbr>append(value)<br>
                  +  # Ignore binaries, since we don't import those,
                  assume it was added correctly (manually)<br>
                  +  if '${bindir}' in value:<br>
                  +    # Pass it directly<br>
                  +    if value not in old_manifest['core']['files']:<br>
                  +      old_manifest['core']['files'].<wbr>append(value)<br>
                  +    continue<br>
                  +  # Ignore empty values<br>
                  +  if value == '':<br>
                  +    continue<br>
                  +  if '${includedir}' in value:<br>
                  +    if value not in old_manifest['core']['files']:<br>
                  +      old_manifest['core']['files'].<wbr>append(value)<br>
                  +    continue<br>
                  +  # Get module name , shouldnt be affected by
                  libdir/bindir<br>
                  +  value = os.path.splitext(os.path.basen<wbr>ame(os.path.normpath(value)))[<wbr>0]<br>
                  +<br>
                  +<br>
                  +  # Launch separate task for each module for
                  deterministic behavior<br>
                  +  # Each module will only import what is necessary
                  for it to work in specific<br>
                  +  print ('Getting dependencies for module: %s' %
                  value)<br>
                  +  output = subprocess.check_output([sys.e<wbr>xecutable,
                  'get_module_deps2.py', '%s' % value])<br>
                  +  for item in output.split():<br>
                  +    # We append it so it doesnt hurt what we
                  currently have:<br>
                  +    if item not in old_manifest['core']['files']:<br>
                  +      old_manifest['core']['files'].<wbr>append(item)<br>
                  +<br>
                  +# We check which packages include folders<br>
                  +for key in old_manifest:<br>
                  +    for value in old_manifest[key]['files']:<br>
                  +        # Ignore folders, since we don't import
                  those, difficult to handle multilib<br>
                  +        if isFolder(value):<br>
                  +            print ('%s is a folder' % value)<br>
                  +            if key not in hasfolders:<br>
                  +                hasfolders.append(key)<br>
                  +            if value not in allfolders:<br>
                  +                allfolders.append(value)<br>
                  +<br>
                  +for key in old_manifest:<br>
                  +    # Use an empty dict as data structure to hold
                  data for each package and fill it up<br>
                  +    new_manifest[key]={}<br>
                  +    new_manifest[key]['files']=[]<br>
                  +    new_manifest[key]['rdepends']=<wbr>[]<br>
                  +    # All packages should depend on core<br>
                  +    if key != 'core':<br>
                  +         new_manifest[key]['rdepends']<wbr>.append('core')<br>
                  +    new_manifest[key]['summary']=o<wbr>ld_manifest[key]['summary']<br>
                  +<br>
                  +    # Handle special cases, we assume that when they
                  were manually added<br>
                  +    # to the manifest we knew what we were doing.<br>
                  +    print ('Handling package %s' % key)<br>
                  +    special_packages=['misc', 'modules', 'dev']<br>
                  +    if key in special_packages or 'staticdev' in key:<br>
                  +        print('Passing %s package directly' % key)<br>
                  +        new_manifest[key]=old_manifest<wbr>[key]<br>
                  +        continue<br>
                  +<br>
                  +    for value in old_manifest[key]['files']:<br>
                  +        # We already handled core on the first pass<br>
                  +        if key == 'core':<br>
                  +            new_manifest[key]['files'].app<wbr>end(value)<br>
                  +            continue<br>
                  +        # Ignore folders, since we don't import
                  those, difficult to handle multilib<br>
                  +        if isFolder(value):<br>
                  +            # Pass folders directly<br>
                  +            new_manifest[key]['files'].app<wbr>end(value)<br>
                  +        # Ignore binaries, since we don't import
                  those<br>
                  +        if '${bindir}' in value:<br>
                  +            # Pass it directly to the new manifest
                  data structure<br>
                  +            if value not in
                  new_manifest[key]['files']:<br>
                  +                new_manifest[key]['files'].app<wbr>end(value)<br>
                  +            continue<br>
                  +        # Ignore empty values<br>
                  +        if value == '':<br>
                  +            continue<br>
                  +        if '${includedir}' in value:<br>
                  +            if value not in
                  new_manifest[key]['files']:<br>
                  +                new_manifest[key]['files'].app<wbr>end(value)<br>
                  +            continue<br>
                  +        # Get module name , shouldnt be affected by
                  libdir/bindir<br>
                  +        value = os.path.splitext(os.path.basen<wbr>ame(os.path.normpath(value)))[<wbr>0]<br>
                  +<br>
                  +        # Launch separate task for each module for
                  deterministic behavior<br>
                  +        # Each module will only import what is
                  necessary for it to work in specific<br>
                  +        print ('Getting dependencies for module: %s'
                  % value)<br>
                  +        output = subprocess.check_output([sys.e<wbr>xecutable,
                  'get_module_deps2.py', '%s' % value])<br>
                  +<br>
                  +        # We can print dependencies for debugging
                  purposes<br>
                  +        #print (output)<br>
                  +        # Output will have all dependencies<br>
                  +        for item in output.split():<br>
                  +<br>
                  +            # Warning: This first part is ugly<br>
                  +            # One of the dependencies that was found,
                  could be inside of one of the folders included by
                  another package<br>
                  +            # We need to check if this happens so we
                  can add the package containing the folder as an
                  RDEPENDS<br>
                  +            # e.g. Folder encodings contained in
                  codecs<br>
                  +            # This would be solved if no packages
                  included any folders<br>
                  +<br>
                  +            # This can be done in two ways:<br>
                  +            # 1 - We assume that if we take out the
                  filename from the path we would get<br>
                  +            #   the folder string, then we would
                  check if folder string is in the list of folders<br>
                  +            #   This would not work if a package
                  contains a folder which contains another folder<br>
                  +            #   e.g. path/folder1/folder2/filename 
                  folder_string= path/folder1/folder2<br>
                  +            #   folder_string would not match any
                  value contained in the list of folders<br>
                  +            #<br>
                  +            # 2 - We do it the other way around,
                  checking if the folder is contained in the path<br>
                  +            #   e.g. path/folder1/folder2/filename 
                  folder_string= path/folder1/folder2<br>
                  +            #   is folder_string inside
                  path/folder1/folder2/filename?<wbr>,<br>
                  +            #   Yes, it works, but we waste a couple
                  of milliseconds.<br>
                  +<br>
                  +            inFolders=False<br>
                  +            for folder in allfolders:<br>
                  +                if folder in item:<br>
                  +                    inFolders = True # Did we find a
                  folder?<br>
                  +                    folderFound = False # Second flag
                  to break inner for<br>
                  +                    # Loop only through packages
                  which contain folders<br>
                  +                    for keyfolder in hasfolders:<br>
                  +                        if (folderFound == False):<br>
                  +                            #print("Checking folder
                  %s on package %s" % (item,keyfolder))<br>
                  +                            for file_folder in
                  old_manifest[keyfolder]['files<wbr>']:<br>
                  +                                if
                  file_folder==folder:<br>
                  +                                    print ('%s found
                  in %s' % (folder, keyfolder))<br>
                  +                                    folderFound =
                  True<br>
                  +                                    if keyfolder not
                  in new_manifest[key]['rdepends'] and keyfolder != key:<br>
                  +                                       
                  new_manifest[key]['rdepends'].<wbr>append(keyfolder)<br>
                  +                        else:<br>
                  +                            break<br>
                  +<br>
                  +            # A folder was found so we're done with
                  this item, we can go on<br>
                  +            if inFolders:<br>
                  +                continue<br>
                  +<br>
                  +            # We might already have it on the
                  dictionary since it could depend on a (previously
                  checked) module<br>
                  +            if item not in
                  new_manifest[key]['files']:<br>
                  +                # Handle core as a special package,
                  we already did it so we pass it to NEW data structure
                  directly<br>
                  +                if key=='core':<br>
                  +                  print('Adding %s to %s FILES' %
                  (item, key))<br>
                  +                  if item.endswith('*'):<br>
                  +                      wildcards.append(item)<br>
                  +                  new_manifest[key]['files'].app<wbr>end(item)<br>
                  +<br>
                  +                  # Check for repeated files<br>
                  +                  if item not in allfiles:<br>
                  +                      allfiles.append(item)<br>
                  +                  else:<br>
                  +                      repeated.append(item)<br>
                  +<br>
                  +                else:<br>
                  +<br>
                  +                    # Check if this dependency is
                  already contained on another package, so we add it<br>
                  +                    # as an RDEPENDS, or if its not,
                  it means it should be contained on the current<br>
                  +                    # package, so we should add it to
                  FILES<br>
                  +                    for newkey in old_manifest:<br>
                  +                        # Debug<br>
                  +                        #print("Checking %s " % item
                  + " in %s" % newkey)<br>
                  +                        if item in
                  old_manifest[newkey]['files']:<br>
                  +                                # Since were nesting,
                  we need to check its not the same key<br>
                  +                                if(newkey!=key):<br>
                  +                                    if newkey not in
                  new_manifest[key]['rdepends']:<br>
                  +                                       # Add it to
                  the new manifest data struct<br>
                  +                                       # Debug<br>
                  +                                       print('Adding
                  %s to %s RDEPENDS, because it contains %s' % (newkey,
                  key, item))<br>
                  +                                     
                   new_manifest[key]['rdepends']<wbr>.append(newkey)<br>
                  +                                    break<br>
                  +                    else:<br>
                  +                      # Debug<br>
                  +                      print('Adding %s to %s FILES' %
                  (item, key))<br>
                  +                      # Since it wasnt found on
                  another package, its not an RDEP, so add it to FILES
                  for this package<br>
                  +                      new_manifest[key]['files'].app<wbr>end(item)<br>
                  +                      if item.endswith('*'):<br>
                  +                          wildcards.append(item)<br>
                  +                      if item not in allfiles:<br>
                  +                          allfiles.append(item)<br>
                  +                      else:<br>
                  +                          repeated.append(item)<br>
                  +<br>
                  +print ('The following files are repeated (contained
                  in more than one package), please check which package
                  should get it:')<br>
                  +print (repeated)<br>
                  +print('The following files contain wildcards, please
                  check they are necessary')<br>
                  +print(wildcards)<br>
                  +print('The following files contain folders, please
                  check they are necessary')<br>
                  +print(hasfolders)<br>
                  +<br>
                  +# Sort it just so it looks nice<br>
                  +for key in new_manifest:<br>
                  +    new_manifest[key]['files'].sor<wbr>t()<br>
                  +    new_manifest[key]['rdepends'].<wbr>sort()<br>
                  +<br>
                  +# Create the manifest from the data structure that
                  was built<br>
                  +with open('<a href="http://python2-manifest.json.ne"
                    moz-do-not-send="true">python2-manifest.json.ne</a><wbr>w','w')
                  as outfile:<br>
                  +    json.dump(new_manifest,outfile<wbr>,sort_keys=True,
                  indent=4)<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/python/get_module_deps2.py
                  b/meta/recipes-devtools/python<wbr>/python/get_module_deps2.py<br>
                  new file mode 100644<br>
                  index 0000000..73e7c6f<br>
                  --- /dev/null<br>
                  +++ b/meta/recipes-devtools/python<wbr>/python/get_module_deps2.py<br>
                  @@ -0,0 +1,112 @@<br>
                  +# This script is launched on separate task for each
                  python module<br>
                  +# It checks for dependencies for that specific module
                  and prints<br>
                  +# them out, the output of this execution will have
                  all dependencies<br>
                  +# for a specific module, which will be parsed an
                  dealt on create_manifest.py<br>
                  +#<br>
                  +# Author: Alejandro Enedino Hernandez Samaniego
                  "aehs29" &lt;<a href="mailto:aehs29@gmail.com"
                    target="_blank" moz-do-not-send="true">aehs29@gmail.com</a>&gt;<br>
                  +<br>
                  +<br>
                  +# We can get a log per module, for all the
                  dependencies that were found, but its messy.<br>
                  +debug=False<br>
                  +<br>
                  +import sys<br>
                  +<br>
                  +# We can get a list of the modules which are
                  currently required to run python<br>
                  +# so we run python-core and get its modules, we then
                  import what we need<br>
                  +# and check what modules are currently running, if we
                  substract them from the<br>
                  +# modules we had initially, we get the dependencies
                  for the module we imported.<br>
                  +<br>
                  +# We use importlib to achieve this, so we also need
                  to know what modules importlib needs<br>
                  +import importlib<br>
                  +<br>
                  +core_deps=set(sys.modules)<br>
                  +<br>
                  +def fix_path(dep_path):<br>
                  +    import os<br>
                  +    # We DONT want the path on our HOST system<br>
                  +    pivot='recipe-sysroot-native'<br>
                  +    dep_path=dep_path[dep_path.fin<wbr>d(pivot)+len(pivot):]<br>
                  +<br>
                  +    if '/usr/bin' in dep_path:<br>
                  +        dep_path = dep_path.replace('/usr/bin''${<wbr>bindir}')<br>
                  +<br>
                  +    # Handle multilib, is there a better way?<br>
                  +    if '/usr/lib32' in dep_path:<br>
                  +        dep_path = dep_path.replace('/usr/lib32',<wbr>'${libdir}')<br>
                  +    if '/usr/lib64' in dep_path:<br>
                  +        dep_path = dep_path.replace('/usr/lib64',<wbr>'${libdir}')<br>
                  +    if '/usr/lib' in dep_path:<br>
                  +        dep_path = dep_path.replace('/usr/lib','$<wbr>{libdir}')<br>
                  +    if '/usr/include' in dep_path:<br>
                  +        dep_path = dep_path.replace('/usr/include<wbr>','${includedir}')<br>
                  +    if '__init__.' in dep_path:<br>
                  +        dep_path =  os.path.split(dep_path)[0]<br>
                  +<br>
                  +    # If a *.pyc file was imported, we replace it
                  with *.py (since we deal with PYCs on create_manifest)<br>
                  +    if '.pyc' in dep_path:<br>
                  +        dep_path = dep_path.replace('.pyc','.py')<br>
                  +<br>
                  +    return dep_path<br>
                  +<br>
                  +# Module to import was passed as an argument<br>
                  +current_module =  str(sys.argv[1]).rstrip()<br>
                  +if(debug==True):<br>
                  +       log = open('log_%s' % current_module,'w')<br>
                  +        log.write('Module %s generated the following
                  dependencies:\n' % current_module)<br>
                  +try:<br>
                  +    importlib.import_module('%s' % current_module)<br>
                  +except ImportError as e:<br>
                  +    if (debug==True):<br>
                  +        log.write('Module was not found')<br>
                  +    pass<br>
                  +<br>
                  +<br>
                  +# Get current module dependencies, dif will contain a
                  list of specific deps for this module<br>
                  +module_deps=set(sys.modules)<br>
                  +<br>
                  +# We handle the core package (1st pass on
                  create_manifest.py) as a special case<br>
                  +if current_module == 'python-core-package':<br>
                  +    dif = core_deps<br>
                  +else:<br>
                  +    dif = module_deps-core_deps<br>
                  +<br>
                  +<br>
                  +# Check where each dependency came from<br>
                  +for item in dif:<br>
                  +    dep_path=''<br>
                  +    try:<br>
                  +        if (debug==True):<br>
                  +            log.write('Calling: sys.modules[' + '%s'
                  % item + '].__file__\n')<br>
                  +        dep_path = sys.modules['%s' % item].__file__<br>
                  +    except AttributeError as e:<br>
                  +        # Deals with thread (builtin module) not
                  having __file__ attribute<br>
                  +       if debug==True:<br>
                  +            log.write(item + ' ')<br>
                  +            log.write(str(e))<br>
                  +           log.write('\n')<br>
                  +            pass<br>
                  +    except NameError as e:<br>
                  +        # Deals with NameError: name 'dep_path' is
                  not defined<br>
                  +        # because module is not found (wasn't
                  compiled?), e.g. bddsm<br>
                  +        if (debug==True):<br>
                  +            log.write(item+' ')<br>
                  +            log.write(str(e))<br>
                  +        pass<br>
                  +<br>
                  +    # Site-customize is a special case since we
                  (OpenEmbedded) put it there manually<br>
                  +    if 'sitecustomize' in dep_path:<br>
                  +        dep_path = '${libdir}/python2.7/sitecusto<wbr>mize.py'<br>
                  +        # Prints out result, which is what will be
                  used by create_manifest<br>
                  +        print (dep_path)<br>
                  +        continue<br>
                  +<br>
                  +    dep_path = fix_path(dep_path)<br>
                  +<br>
                  +    if (debug==True):<br>
                  +        log.write(dep_path+'\n')<br>
                  +<br>
                  +    # Prints out result, which is what will be used
                  by create_manifest<br>
                  +    print (dep_path)<br>
                  +<br>
                  +if debug==True:<br>
                  +    log.close()<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/python/python2-manifest.json
                  b/meta/recipes-devtools/python<wbr>/python/python2-manifest.json<br>
                  new file mode 100644<br>
                  index 0000000..8ebc715<br>
                  --- /dev/null<br>
                  +++ b/meta/recipes-devtools/python<wbr>/python/python2-manifest.json<br>
                  @@ -0,0 +1,1032 @@<br>
                  +{<br>
                  +    "2to3": {<br>
                  +        "files": [<br>
                  +            "${bindir}/2to3",<br>
                  +            "${libdir}/python2.7/lib2to3"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python automated Python 2 to 3
                  code translator"<br>
                  +    },<br>
                  +    "argparse": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/argparse.<wbr>py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "core",<br>
                  +            "lang",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python command line argument
                  parser"<br>
                  +    },<br>
                  +    "audio": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/audiodev.<wbr>py",<br>
                  +            "${libdir}/python2.7/chunk.py"<wbr>,<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/audioop.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/ossaudiodev.so",<br>
                  +            "${libdir}/python2.7/sndhdr.py<wbr>",<br>
                  +            "${libdir}/python2.7/sunau.py"<wbr>,<br>
                  +            "${libdir}/python2.7/sunaudio.<wbr>py",<br>
                  +            "${libdir}/python2.7/toaiff.py<wbr>",<br>
                  +            "${libdir}/python2.7/wave.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "math"<br>
                  +        ],<br>
                  +        "summary": "Python Audio Handling"<br>
                  +    },<br>
                  +    "bsddb": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/bsddb",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_bsddb.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python bindings for the Berkeley
                  Database"<br>
                  +    },<br>
                  +    "codecs": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/gettext.p<wbr>y",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_codecs_cn.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_codecs_hk.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_codecs_iso2022.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_codecs_jp.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_codecs_kr.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_codecs_tw.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_multibytecodec.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/unicodedata.so",<br>
                  +            "${libdir}/python2.7/locale.py<wbr>",<br>
                  +            "${libdir}/python2.7/stringpre<wbr>p.py",<br>
                  +            "${libdir}/python2.7/xdrlib.py<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python codec"<br>
                  +    },<br>
                  +    "compile": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/compileal<wbr>l.py",<br>
                  +            "${libdir}/python2.7/py_compil<wbr>e.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python bytecode compilation
                  support"<br>
                  +    },<br>
                  +    "compiler": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/compiler"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python compiler support"<br>
                  +    },<br>
                  +    "compression": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/gzip.py",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/bz2.so",<br>
                  +            "${libdir}/python2.7/tarfile.p<wbr>y",<br>
                  +            "${libdir}/python2.7/zipfile.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "shell",<br>
                  +            "unixadmin",<br>
                  +            "zlib"<br>
                  +        ],<br>
                  +        "summary": "Python high-level compression
                  support"<br>
                  +    },<br>
                  +    "contextlib": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/contextli<wbr>b.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python utilities for
                  with-statementcontexts."<br>
                  +    },<br>
                  +    "core": {<br>
                  +        "files": [<br>
                  +            "${bindir}/python*",<br>
                  +            "${includedir}/python2.7/pycon<wbr>fig*.h",<br>
                  +            "${libdir}/python2.7/ConfigPar<wbr>ser.py",<br>
                  +            "${libdir}/python2.7/UserDict.<wbr>py",<br>
                  +            "${libdir}/python2.7/UserList.<wbr>py",<br>
                  +            "${libdir}/python2.7/UserStrin<wbr>g.py",<br>
                  +            "${libdir}/python2.7/__future_<wbr>_.py",<br>
                  +            "${libdir}/python2.7/_abcoll.p<wbr>y",<br>
                  +            "${libdir}/python2.7/_sysconfi<wbr>gdata.py",<br>
                  +            "${libdir}/python2.7/_weakrefs<wbr>et.py",<br>
                  +            "${libdir}/python2.7/abc.py",<br>
                  +            "${libdir}/python2.7/ast.py",<br>
                  +            "${libdir}/python2.7/atexit.py<wbr>",<br>
                  +            "${libdir}/python2.7/codecs.py<wbr>",<br>
                  +            "${libdir}/python2.7/collectio<wbr>ns.py",<br>
                  +            "${libdir}/python2.7/copy.py",<br>
                  +            "${libdir}/python2.7/copy_reg.<wbr>py",<br>
                  +            "${libdir}/python2.7/encodings<wbr>",<br>
                  +            "${libdir}/python2.7/encodings<wbr>/aliases.py",<br>
                  +            "${libdir}/python2.7/encodings<wbr>/utf_8.py",<br>
                  +            "${libdir}/python2.7/genericpa<wbr>th.py",<br>
                  +            "${libdir}/python2.7/getopt.py<wbr>",<br>
                  +            "${libdir}/python2.7/heapq.py"<wbr>,<br>
                  +            "${libdir}/python2.7/importlib<wbr>",<br>
                  +            "${libdir}/python2.7/keyword.p<wbr>y",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_collections.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_heapq.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_locale.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_struct.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/binascii.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/itertools.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/operator.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/readline.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/strop.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/time.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/xreadlines.so",<br>
                  +            "${libdir}/python2.7/linecache<wbr>.py",<br>
                  +            "${libdir}/python2.7/new.py",<br>
                  +            "${libdir}/python2.7/os.py",<br>
                  +            "${libdir}/python2.7/platform.<wbr>py",<br>
                  +            "${libdir}/python2.7/posixpath<wbr>.py",<br>
                  +            "${libdir}/python2.7/re.py",<br>
                  +            "${libdir}/python2.7/rlcomplet<wbr>er.py",<br>
                  +            "${libdir}/python2.7/site.py",<br>
                  +            "${libdir}/python2.7/sitecusto<wbr>mize.py",<br>
                  +            "${libdir}/python2.7/sre_compi<wbr>le.py",<br>
                  +            "${libdir}/python2.7/sre_const<wbr>ants.py",<br>
                  +            "${libdir}/python2.7/sre_parse<wbr>.py",<br>
                  +            "${libdir}/python2.7/stat.py",<br>
                  +            "${libdir}/python2.7/string.py<wbr>",<br>
                  +            "${libdir}/python2.7/struct.py<wbr>",<br>
                  +            "${libdir}/python2.7/sysconfig<wbr>.py",<br>
                  +            "${libdir}/python2.7/traceback<wbr>.py",<br>
                  +            "${libdir}/python2.7/types.py"<wbr>,<br>
                  +            "${libdir}/python2.7/warnings.<wbr>py",<br>
                  +            "${libdir}/python2.7/weakref.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [],<br>
                  +        "summary": "Python interpreter and core
                  modules"<br>
                  +    },<br>
                  +    "crypt": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/hashlib.p<wbr>y",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_hashlib.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/crypt.so",<br>
                  +            "${libdir}/python2.7/md5.py",<br>
                  +            "${libdir}/python2.7/sha.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python basic cryptographic and
                  hashing support"<br>
                  +    },<br>
                  +    "ctypes": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/ctypes",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_ctypes.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_ctypes_test.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python C types support"<br>
                  +    },<br>
                  +    "curses": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/curses",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_curses.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_curses_panel.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python curses support"<br>
                  +    },<br>
                  +    "datetime": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/_strptime<wbr>.py",<br>
                  +            "${libdir}/python2.7/calendar.<wbr>py",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/datetime.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "core",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python calendar and time support"<br>
                  +    },<br>
                  +    "db": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/anydbm.py<wbr>",<br>
                  +            "${libdir}/python2.7/dbhash.py<wbr>",<br>
                  +            "${libdir}/python2.7/dumbdbm.p<wbr>y",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/dbm.so",<br>
                  +            "${libdir}/python2.7/whichdb.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "bsddb",<br>
                  +            "core",<br>
                  +            "gdbm"<br>
                  +        ],<br>
                  +        "summary": "Python file-based database
                  support"<br>
                  +    },<br>
                  +    "debugger": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/bdb.py",<br>
                  +            "${libdir}/python2.7/pdb.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "pprint",<br>
                  +            "shell"<br>
                  +        ],<br>
                  +        "summary": "Python debugger"<br>
                  +    },<br>
                  +    "dev": {<br>
                  +        "files": [<br>
                  +            "${base_libdir}/*.a",<br>
                  +            "${base_libdir}/*.o",<br>
                  +            "${datadir}/aclocal",<br>
                  +            "${datadir}/pkgconfig",<br>
                  +            "${includedir}",<br>
                  +            "${libdir}/*.a",<br>
                  +            "${libdir}/*.la",<br>
                  +            "${libdir}/*.o",<br>
                  +            "${libdir}/lib*${SOLIBSDEV}",<br>
                  +            "${libdir}/pkgconfig",<br>
                  +            "${libdir}/python2.7/config/Ma<wbr>kefile"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python development package"<br>
                  +    },<br>
                  +    "difflib": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/difflib.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python helpers for computing
                  deltas between objects"<br>
                  +    },<br>
                  +    "distutils": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/config",<br>
                  +            "${libdir}/python2.7/distutils<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python Distribution Utilities"<br>
                  +    },<br>
                  +    "distutils-staticdev": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/config/li<wbr>b*.a"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "distutils"<br>
                  +        ],<br>
                  +        "summary": "Python distribution utilities
                  (static libraries)"<br>
                  +    },<br>
                  +    "doctest": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/doctest.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "debugger",<br>
                  +            "difflib",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "pprint",<br>
                  +            "shell",<br>
                  +            "unittest"<br>
                  +        ],<br>
                  +        "summary": "Python framework for running
                  examples in docstrings"<br>
                  +    },<br>
                  +    "email": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/email",<br>
                  +            "${libdir}/python2.7/imaplib.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "netclient",<br>
                  +            "pickle",<br>
                  +            "subprocess",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python email support"<br>
                  +    },<br>
                  +    "fcntl": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/fcntl.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python's fcntl interface"<br>
                  +    },<br>
                  +    "gdbm": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/gdbm.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python GNU database support"<br>
                  +    },<br>
                  +    "hotshot": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/hotshot",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_hotshot.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python hotshot performance
                  profiler"<br>
                  +    },<br>
                  +    "html": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/HTMLParse<wbr>r.py",<br>
                  +            "${libdir}/python2.7/formatter<wbr>.py",<br>
                  +            "${libdir}/python2.7/htmlentit<wbr>ydefs.py",<br>
                  +            "${libdir}/python2.7/htmllib.p<wbr>y",<br>
                  +            "${libdir}/python2.7/markupbas<wbr>e.py",<br>
                  +            "${libdir}/python2.7/sgmllib.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python HTML processing support"<br>
                  +    },<br>
                  +    "idle": {<br>
                  +        "files": [<br>
                  +            "${bindir}/idle",<br>
                  +            "${libdir}/python2.7/idlelib"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python Integrated Development
                  Environment"<br>
                  +    },<br>
                  +    "image": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/colorsys.<wbr>py",<br>
                  +            "${libdir}/python2.7/imghdr.py<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python graphical image handling"<br>
                  +    },<br>
                  +    "io": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/StringIO.<wbr>py",<br>
                  +            "${libdir}/python2.7/_pyio.py"<wbr>,<br>
                  +            "${libdir}/python2.7/io.py",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_io.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_socket.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_ssl.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/cStringIO.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/select.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/termios.so",<br>
                  +            "${libdir}/python2.7/pipes.py"<wbr>,<br>
                  +            "${libdir}/python2.7/socket.py<wbr>",<br>
                  +            "${libdir}/python2.7/ssl.py",<br>
                  +            "${libdir}/python2.7/tempfile.<wbr>py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "fcntl",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "netclient",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python low-level I/O"<br>
                  +    },<br>
                  +    "json": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/json",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_json.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python JSON support"<br>
                  +    },<br>
                  +    "lang": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/bisect.py<wbr>",<br>
                  +            "${libdir}/python2.7/code.py",<br>
                  +            "${libdir}/python2.7/codeop.py<wbr>",<br>
                  +            "${libdir}/python2.7/dis.py",<br>
                  +            "${libdir}/python2.7/functools<wbr>.py",<br>
                  +            "${libdir}/python2.7/inspect.p<wbr>y",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_bisect.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_functools.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/array.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/parser.so",<br>
                  +            "${libdir}/python2.7/opcode.py<wbr>",<br>
                  +            "${libdir}/python2.7/repr.py",<br>
                  +            "${libdir}/python2.7/symbol.py<wbr>",<br>
                  +            "${libdir}/python2.7/token.py"<wbr>,<br>
                  +            "${libdir}/python2.7/tokenize.<wbr>py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python low-level language
                  support"<br>
                  +    },<br>
                  +    "logging": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/logging"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "threading"<br>
                  +        ],<br>
                  +        "summary": "Python logging support"<br>
                  +    },<br>
                  +    "mailbox": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/mailbox.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "datetime",<br>
                  +            "email",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "mime",<br>
                  +            "netclient",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python mailbox format support"<br>
                  +    },<br>
                  +    "math": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_random.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/cmath.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/math.so",<br>
                  +            "${libdir}/python2.7/random.py<wbr>",<br>
                  +            "${libdir}/python2.7/sets.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "crypt"<br>
                  +        ],<br>
                  +        "summary": "Python math support"<br>
                  +    },<br>
                  +    "mime": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/MimeWrite<wbr>r.py",<br>
                  +            "${libdir}/python2.7/mimetools<wbr>.py",<br>
                  +            "${libdir}/python2.7/mimetypes<wbr>.py",<br>
                  +            "${libdir}/python2.7/quopri.py<wbr>",<br>
                  +            "${libdir}/python2.7/rfc822.py<wbr>",<br>
                  +            "${libdir}/python2.7/uu.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "netclient",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python MIME handling APIs"<br>
                  +    },<br>
                  +    "mmap": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/mmap.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python memory-mapped file
                  support"<br>
                  +    },<br>
                  +    "modules": {<br>
                  +        "files": [],<br>
                  +        "rdepends": [<br>
                  +            "2to3",<br>
                  +            "argparse",<br>
                  +            "audio",<br>
                  +            "bsddb",<br>
                  +            "codecs",<br>
                  +            "compile",<br>
                  +            "compiler",<br>
                  +            "compression",<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "ctypes",<br>
                  +            "curses",<br>
                  +            "datetime",<br>
                  +            "db",<br>
                  +            "debugger",<br>
                  +            "difflib",<br>
                  +            "distutils",<br>
                  +            "doctest",<br>
                  +            "email",<br>
                  +            "fcntl",<br>
                  +            "gdbm",<br>
                  +            "hotshot",<br>
                  +            "html",<br>
                  +            "idle",<br>
                  +            "image",<br>
                  +            "io",<br>
                  +            "json",<br>
                  +            "lang",<br>
                  +            "logging",<br>
                  +            "mailbox",<br>
                  +            "math",<br>
                  +            "mime",<br>
                  +            "mmap",<br>
                  +            "multiprocessing",<br>
                  +            "netclient",<br>
                  +            "netserver",<br>
                  +            "numbers",<br>
                  +            "pickle",<br>
                  +            "pkgutil",<br>
                  +            "plistlib",<br>
                  +            "pprint",<br>
                  +            "profile",<br>
                  +            "pydoc",<br>
                  +            "re",<br>
                  +            "resource",<br>
                  +            "robotparser",<br>
                  +            "shell",<br>
                  +            "smtpd",<br>
                  +            "sqlite3",<br>
                  +            "sqlite3",<br>
                  +            "stringold",<br>
                  +            "subprocess",<br>
                  +            "syslog",<br>
                  +            "terminal",<br>
                  +            "textutils",<br>
                  +            "threading",<br>
                  +            "tkinter",<br>
                  +            "unittest",<br>
                  +            "unixadmin",<br>
                  +            "xml",<br>
                  +            "xmlrpc",<br>
                  +            "zlib"<br>
                  +        ],<br>
                  +        "summary": "All Python modules"<br>
                  +    },<br>
                  +    "multiprocessing": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_multiprocessing.so",<br>
                  +            "${libdir}/python2.7/multiproc<wbr>essing"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "pickle",<br>
                  +            "subprocess",<br>
                  +            "threading"<br>
                  +        ],<br>
                  +        "summary": "Python multiprocessing support"<br>
                  +    },<br>
                  +    "netclient": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/Cookie.py<wbr>",<br>
                  +            "${libdir}/python2.7/_LWPCooki<wbr>eJar.py",<br>
                  +            "${libdir}/python2.7/_MozillaC<wbr>ookieJar.py",<br>
                  +            "${libdir}/python2.7/base64.py<wbr>",<br>
                  +            "${libdir}/python2.7/cookielib<wbr>.py",<br>
                  +            "${libdir}/python2.7/ftplib.py<wbr>",<br>
                  +            "${libdir}/python2.7/hmac.py",<br>
                  +            "${libdir}/python2.7/httplib.p<wbr>y",<br>
                  +            "${libdir}/python2.7/nntplib.p<wbr>y",<br>
                  +            "${libdir}/python2.7/poplib.py<wbr>",<br>
                  +            "${libdir}/python2.7/smtplib.p<wbr>y",<br>
                  +            "${libdir}/python2.7/telnetlib<wbr>.py",<br>
                  +            "${libdir}/python2.7/urllib.py<wbr>",<br>
                  +            "${libdir}/python2.7/urllib2.p<wbr>y",<br>
                  +            "${libdir}/python2.7/urlparse.<wbr>py",<br>
                  +            "${libdir}/python2.7/uuid.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "ctypes",<br>
                  +            "datetime",<br>
                  +            "email",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "mime",<br>
                  +            "pickle",<br>
                  +            "subprocess",<br>
                  +            "textutils",<br>
                  +            "threading"<br>
                  +        ],<br>
                  +        "summary": "Python Internet Protocol clients"<br>
                  +    },<br>
                  +    "netserver": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/BaseHTTPS<wbr>erver.py",<br>
                  +            "${libdir}/python2.7/CGIHTTPSe<wbr>rver.py",<br>
                  +            "${libdir}/python2.7/SimpleHTT<wbr>PServer.py",<br>
                  +            "${libdir}/python2.7/SocketSer<wbr>ver.py",<br>
                  +            "${libdir}/python2.7/cgi.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "mime",<br>
                  +            "netclient",<br>
                  +            "shell",<br>
                  +            "textutils",<br>
                  +            "threading",<br>
                  +            "unixadmin"<br>
                  +        ],<br>
                  +        "summary": "Python Internet Protocol servers"<br>
                  +    },<br>
                  +    "numbers": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/decimal.p<wbr>y",<br>
                  +            "${libdir}/python2.7/fractions<wbr>.py",<br>
                  +            "${libdir}/python2.7/numbers.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "core",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "threading"<br>
                  +        ],<br>
                  +        "summary": "Python number APIs"<br>
                  +    },<br>
                  +    "pickle": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/cPickle.so",<br>
                  +            "${libdir}/python2.7/pickle.py<wbr>",<br>
                  +            "${libdir}/python2.7/pickletoo<wbr>ls.py",<br>
                  +            "${libdir}/python2.7/shelve.py<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io"<br>
                  +        ],<br>
                  +        "summary": "Python serialisation/persistence
                  support"<br>
                  +    },<br>
                  +    "pkgutil": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/pkgutil.p<wbr>y"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python package extension utility
                  support"<br>
                  +    },<br>
                  +    "plistlib": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/plistlib.<wbr>py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "datetime",<br>
                  +            "io"<br>
                  +        ],<br>
                  +        "summary": "Generate and parse Mac OS X
                  .plist files"<br>
                  +    },<br>
                  +    "pprint": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/pprint.py<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io"<br>
                  +        ],<br>
                  +        "summary": "Python pretty-print support"<br>
                  +    },<br>
                  +    "profile": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/cProfile.<wbr>py",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_lsprof.so",<br>
                  +            "${libdir}/python2.7/profile.p<wbr>y",<br>
                  +            "${libdir}/python2.7/pstats.py<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "core",<br>
                  +            "lang",<br>
                  +            "resource",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python basic performance
                  profiling support"<br>
                  +    },<br>
                  +    "pydoc": {<br>
                  +        "files": [<br>
                  +            "${bindir}/pydoc",<br>
                  +            "${libdir}/python2.7/pydoc.py"<wbr>,<br>
                  +            "${libdir}/python2.7/pydoc_dat<wbr>a"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "core",<br>
                  +            "lang",<br>
                  +            "pkgutil"<br>
                  +        ],<br>
                  +        "summary": "Python interactive help support"<br>
                  +    },<br>
                  +    "re": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/sre.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python Regular Expression APIs"<br>
                  +    },<br>
                  +    "resource": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/resource.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python resource control
                  interface"<br>
                  +    },<br>
                  +    "robotparser": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/robotpars<wbr>er.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "netclient",<br>
                  +            "textutils"<br>
                  +        ],<br>
                  +        "summary": "Python robots.txt parser"<br>
                  +    },<br>
                  +    "shell": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/cmd.py",<br>
                  +            "${libdir}/python2.7/commands.<wbr>py",<br>
                  +            "${libdir}/python2.7/dircache.<wbr>py",<br>
                  +            "${libdir}/python2.7/fnmatch.p<wbr>y",<br>
                  +            "${libdir}/python2.7/glob.py",<br>
                  +            "${libdir}/python2.7/popen2.py<wbr>",<br>
                  +            "${libdir}/python2.7/shlex.py"<wbr>,<br>
                  +            "${libdir}/python2.7/shutil.py<wbr>"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "unixadmin"<br>
                  +        ],<br>
                  +        "summary": "Python shell-like functionality"<br>
                  +    },<br>
                  +    "smtpd": {<br>
                  +        "files": [<br>
                  +            "${bindir}/smtpd.py",<br>
                  +            "${libdir}/python2.7/asynchat.<wbr>py",<br>
                  +            "${libdir}/python2.7/asyncore.<wbr>py",<br>
                  +            "${libdir}/python2.7/smtpd.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python Simple Mail Transport
                  Daemon"<br>
                  +    },<br>
                  +    "sqlite3": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_sqlite3.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python Sqlite3 database support"<br>
                  +    },<br>
                  +    "sqlite3-tests": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/sqlite3/t<wbr>est"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "tests"<br>
                  +        ],<br>
                  +        "summary": "Python Sqlite3 database support
                  tests"<br>
                  +    },<br>
                  +    "stringold": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/stringold<wbr>.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python string APIs [deprecated]"<br>
                  +    },<br>
                  +    "subprocess": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/subproces<wbr>s.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "pickle"<br>
                  +        ],<br>
                  +        "summary": "Python subprocess support"<br>
                  +    },<br>
                  +    "syslog": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/syslog.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python syslog interface"<br>
                  +    },<br>
                  +    "terminal": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/pty.py",<br>
                  +            "${libdir}/python2.7/tty.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io"<br>
                  +        ],<br>
                  +        "summary": "Python terminal controlling
                  support"<br>
                  +    },<br>
                  +    "tests": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/test"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python tests"<br>
                  +    },<br>
                  +    "textutils": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/csv.py",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_csv.so",<br>
                  +            "${libdir}/python2.7/optparse.<wbr>py",<br>
                  +            "${libdir}/python2.7/textwrap.<wbr>py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "core",<br>
                  +            "io",<br>
                  +            "lang"<br>
                  +        ],<br>
                  +        "summary": "Python option parsin"<br>
                  +    },<br>
                  +    "threading": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/Queue.py"<wbr>,<br>
                  +            "${libdir}/python2.7/_threadin<wbr>g_local.py",<br>
                  +            "${libdir}/python2.7/dummy_thr<wbr>ead.py",<br>
                  +            "${libdir}/python2.7/dummy_thr<wbr>eading.py",<br>
                  +            "${libdir}/python2.7/mutex.py"<wbr>,<br>
                  +            "${libdir}/python2.7/threading<wbr>.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python threading &amp;
                  synchronization support"<br>
                  +    },<br>
                  +    "tkinter": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-tk"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python Tcl/Tk bindings"<br>
                  +    },<br>
                  +    "unittest": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/unittest"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "difflib",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "pprint",<br>
                  +            "shell"<br>
                  +        ],<br>
                  +        "summary": "Python unit testing framework"<br>
                  +    },<br>
                  +    "unixadmin": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/getpass.p<wbr>y",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/grp.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/nis.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core",<br>
                  +            "io"<br>
                  +        ],<br>
                  +        "summary": "Python Unix administration
                  support"<br>
                  +    },<br>
                  +    "xml": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/_elementtree.so",<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/pyexpat.so",<br>
                  +            "${libdir}/python2.7/xml"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python basic XML support"<br>
                  +    },<br>
                  +    "xmlrpc": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/DocXMLRPC<wbr>Server.py",<br>
                  +            "${libdir}/python2.7/SimpleXML<wbr>RPCServer.py"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "codecs",<br>
                  +            "compression",<br>
                  +            "contextlib",<br>
                  +            "core",<br>
                  +            "crypt",<br>
                  +            "datetime",<br>
                  +            "fcntl",<br>
                  +            "io",<br>
                  +            "lang",<br>
                  +            "math",<br>
                  +            "mime",<br>
                  +            "netclient",<br>
                  +            "netserver",<br>
                  +            "pkgutil",<br>
                  +            "pydoc",<br>
                  +            "textutils",<br>
                  +            "threading",<br>
                  +            "xml",<br>
                  +            "zlib"<br>
                  +        ],<br>
                  +        "summary": "Python XML-RPC support"<br>
                  +    },<br>
                  +    "zlib": {<br>
                  +        "files": [<br>
                  +            "${libdir}/python2.7/lib-dynlo<wbr>ad/zlib.so"<br>
                  +        ],<br>
                  +        "rdepends": [<br>
                  +            "core"<br>
                  +        ],<br>
                  +        "summary": "Python zlib compression support"<br>
                  +    }<br>
                  +}<br>
                  \ No newline at end of file<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/python/sitecustomize.py
                  b/meta/recipes-devtools/python<wbr>/python/sitecustomize.py<br>
                  index 2739018..4c8b5e2 100644<br>
                  --- a/meta/recipes-devtools/python<wbr>/python/sitecustomize.py<br>
                  +++ b/meta/recipes-devtools/python<wbr>/python/sitecustomize.py<br>
                  @@ -27,19 +27,11 @@ def __enableReadlineSupport():<br>
                       except IOError:<br>
                           pass<br>
                  <br>
                  -def __enableDefaultEncoding():<br>
                  -    import sys<br>
                  -    try:<br>
                  -        sys.setdefaultencoding( "utf8" )<br>
                  -    except LookupError:<br>
                  -        pass<br>
                  -<br>
                   import sys<br>
                   try:<br>
                       import rlcompleter, readline<br>
                   except ImportError:<br>
                       pass<br>
                   else:<br>
                  -    __enableDefaultEncoding()<br>
                       __registerExitHandler()<br>
                       __enableReadlineSupport()<br>
                  diff --git a/meta/recipes-devtools/python<wbr>/<a
                    href="http://python_2.7.13.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">python_2.7.13.bb</a>
                  b/meta/recipes-devtools/python<wbr>/<a
                    href="http://python_2.7.13.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">python_2.7.13.bb</a><br>
                  index 754c029..dbafb95 100644<br>
                  --- a/meta/recipes-devtools/python<wbr>/<a
                    href="http://python_2.7.13.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">python_2.7.13.bb</a><br>
                  +++ b/meta/recipes-devtools/python<wbr>/<a
                    href="http://python_2.7.13.bb" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">python_2.7.13.bb</a><br>
                  @@ -1,5 +1,7 @@<br>
                   require python.inc<br>
                  +<br>
                   DEPENDS = "python-native libffi bzip2 gdbm openssl
                  readline sqlite3 zlib"<br>
                  +<br>
                   PR = "${INC_PR}"<br>
                  <br>
                   DISTRO_SRC_URI ?= <a class="moz-txt-link-rfc2396E" href="file://sitecustomize.py">"file://sitecustomize.py"</a><br>
                  @@ -145,11 +147,9 @@ py_package_preprocess () {<br>
                       python -m py_compile
                  ${PKGD}/${libdir}/python${PYTH<wbr>ON_MAJMIN}/_sysconfigdata.py<br>
                   }<br>
                  <br>
                  -require python-${PYTHON_MAJMIN}-manife<wbr>st.inc<br>
                  <br>
                   # manual dependency additions<br>
                   RPROVIDES_${PN}-core = "${PN}"<br>
                  -RRECOMMENDS_${PN}-core = "${PN}-readline"<br>
                   RRECOMMENDS_${PN}-core_<wbr>append_class-nativesdk =
                  " nativesdk-python-modules"<br>
                   RRECOMMENDS_${PN}-crypt = "openssl"<br>
                  <br>
                  @@ -193,3 +193,87 @@ FILES_${PN}-man =
                  "${datadir}/man"<br>
                   RDEPENDS_${PN}-modules_remove =
                  "${@bb.utils.contains('PACKAGE<wbr>CONFIG', 'bdb', '',
                  '${PN}-bsddb', d)}"<br>
                  <br>
                   BBCLASSEXTEND = "nativesdk"<br>
                  +<br>
                  +RPROVIDES_${PN} += "${PN}-modules"<br>
                  +<br>
                  +# We want bytecode precompiled .py files (.pyc's) by
                  default<br>
                  +# but the user may set it on their own conf<br>
                  +<br>
                  +INCLUDE_PYCS ?= "1"<br>
                  +<br>
                  +python(){<br>
                  +<br>
                  +    pythondir = d.getVar('THISDIR',True)<br>
                  +<br>
                  +    # Read JSON manifest<br>
                  +    import json<br>
                  +    with open(pythondir+'/python/python<wbr>2-manifest.json')
                  as manifest_file:<br>
                  +        python_manifest=json.load(mani<wbr>fest_file)<br>
                  +<br>
                  +    include_pycs = d.getVar('INCLUDE_PYCS')<br>
                  +<br>
                  +    packages = d.getVar('PACKAGES').split()<br>
                  +    pn = d.getVar('PN')<br>
                  +<br>
                  +<br>
                  +    newpackages=[]<br>
                  +<br>
                  +    for key in python_manifest:<br>
                  +        pypackage= pn + '-' + key<br>
                  +<br>
                  +        if pypackage not in packages:<br>
                  +            # We need to prepend, otherwise
                  python-misc gets everything<br>
                  +            # so we use a new variable<br>
                  +            newpackages.append(pypackage)<br>
                  +<br>
                  +        # "Build" python's manifest FILES, RDEPENDS
                  and SUMMARY<br>
                  +        d.setVar('FILES_' + pypackage, '')<br>
                  +        for value in python_manifest[key]['files']:<br>
                  +            d.appendVar('FILES_' + pypackage, ' ' +
                  value)<br>
                  +            if include_pycs == '1':<br>
                  +                if value.endswith('.py'):<br>
                  +                    d.appendVar('FILES_' + pypackage,
                  ' ' + value + 'c')<br>
                  +<br>
                  +        d.setVar('RDEPENDS_' + pypackage, '')<br>
                  +        for value in python_manifest[key]['rdepends<wbr>']:<br>
                  +            # Make it work with or without $PN<br>
                  +            if '${PN}' in value:<br>
                  +                value=value.split('-')[1]<br>
                  +            d.appendVar('RDEPENDS_' + pypackage, ' '
                  + pn + '-' + value)<br>
                  +        d.setVar('SUMMARY_' + pypackage,
                  python_manifest[key]['summary'<wbr>])<br>
                  +<br>
                  +    # We need to ensure staticdev packages match for
                  files first so we sort in reverse<br>
                  +    newpackages.sort(reverse=True)<br>
                  +    # Prepending so to avoid python-misc getting
                  everything<br>
                  +    packages = newpackages + packages<br>
                  +    d.setVar('PACKAGES', ' '.join(packages))<br>
                  +    d.setVar('ALLOW_EMPTY_${PN}-mo<wbr>dules', '1')<br>
                  +}<br>
                  +<br>
                  +do_split_packages[file-checks<wbr>ums] +=
                  "${THISDIR}/python/python2-man<wbr>ifest.json:True"<br>
                  +<br>
                  +# Files needed to create a new manifest<br>
                  +SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://create_manifest2.pyfile://get_module_deps2.pyfile://python2-manifest.json">"file://create_manifest2.py
                  file://get_module_deps2.py
                  file://python2-manifest.json"</a><br>
                  +<br>
                  +do_create_manifest() {<br>
                  +<br>
                  +# This task should be run with every new release of
                  Python.<br>
                  +# We must ensure that PACKAGECONFIG enables
                  everything when creating<br>
                  +# a new manifest, this is to base our new manifest on
                  a complete<br>
                  +# native python build, containing all dependencies,
                  otherwise the task<br>
                  +# wont be able to find the required files.<br>
                  +# e.g. BerkeleyDB is an optional build dependency so
                  it may or may not<br>
                  +# be present, we must ensure it is.<br>
                  +<br>
                  +cd ${WORKDIR}<br>
                  +# This needs to be executed by python-native and NOT
                  by HOST's python<br>
                  +nativepython create_manifest2.py<br>
                  +cp python2-manifest.json.new
                  ${THISDIR}/python/python2-mani<wbr>fest.json<br>
                  +}<br>
                  +<br>
                  +# bitbake python -c create_manifest<br>
                  +addtask do_create_manifest<br>
                  +<br>
                  +# Make sure we have native python ready when we
                  create a new manifest<br>
                  +do_create_manifest[depends] +=
                  "python:do_prepare_recipe_sysr<wbr>oot"<br>
                  +do_create_manifest[depends] += "python:do_patch"<br>
                  diff --git a/scripts/contrib/python/<a
                    href="http://generate-manifest-2.7.py"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gener<wbr>ate-manifest-2.7.py</a>
                  b/scripts/contrib/python/<a
                    href="http://generate-manifest-2.7.py"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gener<wbr>ate-manifest-2.7.py</a><br>
                  deleted file mode 100755<br>
                  index ee75403..0000000<br>
                  --- a/scripts/contrib/python/<a
                    href="http://generate-manifest-2.7.py"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gener<wbr>ate-manifest-2.7.py</a><br>
                  +++ /dev/null<br>
                  @@ -1,426 +0,0 @@<br>
                  -#!/usr/bin/env python<br>
                  -<br>
                  -# generate Python Manifest for the OpenEmbedded build
                  system<br>
                  -# (C) 2002-2010 Michael 'Mickey' Lauer &lt;<a
                    href="mailto:mlauer@vanille-media.de"
                    target="_blank" moz-do-not-send="true">mlauer@vanille-media.de</a>&gt;<br>
                  -# (C) 2007 Jeremy Laine<br>
                  -# licensed under MIT, see COPYING.MIT<br>
                  -#<br>
                  -# June 22, 2011 -- Mark Hatle &lt;<a
                    href="mailto:mark.hatle@windriver.com"
                    target="_blank" moz-do-not-send="true">mark.hatle@windriver.com</a>&gt;<br>
                  -#  * Updated to no longer generate special -dbg
                  package, instead use the<br>
                  -#    single system -dbg<br>
                  -#  * Update version with ".1" to indicate this change<br>
                  -#<br>
                  -# February 26, 2017 -- Ming Liu &lt;<a
                    href="mailto:peter.x.liu@external.atlascopco.com"
                    target="_blank" moz-do-not-send="true">peter.x.liu@external.atlascop<wbr>co.com</a>&gt;<br>
                  -#  * Updated to support generating manifest for
                  native python<br>
                  -<br>
                  -import os<br>
                  -import sys<br>
                  -import time<br>
                  -import argparse<br>
                  -<br>
                  -VERSION = "2.7.2"<br>
                  -<br>
                  -__author__ = "Michael 'Mickey' Lauer &lt;<a
                    href="mailto:mlauer@vanille-media.de"
                    target="_blank" moz-do-not-send="true">mlauer@vanille-media.de</a>&gt;"<br>
                  -__version__ = "20110222.2"<br>
                  -<br>
                  -class MakefileMaker:<br>
                  -<br>
                  -    def __init__( self, outfile, isNative ):<br>
                  -        """initialize"""<br>
                  -        self.packages = {}<br>
                  -        self.excluded_pkgs = []<br>
                  -        self.targetPrefix = "${libdir}/python%s/" %
                  VERSION[:3]<br>
                  -        self.isNative = isNative<br>
                  -        self.output = outfile<br>
                  -        self.out( """<br>
                  -# WARNING: This file is AUTO GENERATED: Manual edits
                  will be lost next time I regenerate the file.<br>
                  -# Generator: '%s%s' Version %s (C) 2002-2010 Michael
                  'Mickey' Lauer &lt;<a
                    href="mailto:mlauer@vanille-media.de"
                    target="_blank" moz-do-not-send="true">mlauer@vanille-media.de</a>&gt;<br>
                  -""" % ( sys.argv[0], ' --native' if isNative else '',
                  __version__ ) )<br>
                  -<br>
                  -    #<br>
                  -    # helper functions<br>
                  -    #<br>
                  -<br>
                  -    def out( self, data ):<br>
                  -        """print a line to the output file"""<br>
                  -        self.output.write( "%s\n" % data )<br>
                  -<br>
                  -    def setPrefix( self, targetPrefix ):<br>
                  -        """set a file prefix for addPackage files"""<br>
                  -        self.targetPrefix = targetPrefix<br>
                  -<br>
                  -    def doProlog( self ):<br>
                  -        self.out( """ """ )<br>
                  -        self.out( "" )<br>
                  -<br>
                  -    def addPackage( self, name, description,
                  dependencies, filenames, mod_exclude = False ):<br>
                  -        """add a package to the Makefile"""<br>
                  -        if type( filenames ) == type( "" ):<br>
                  -            filenames = filenames.split()<br>
                  -        fullFilenames = []<br>
                  -        for filename in filenames:<br>
                  -            if filename[0] != "$":<br>
                  -                fullFilenames.append( "%s%s" % (
                  self.targetPrefix, filename ) )<br>
                  -            else:<br>
                  -                fullFilenames.append( filename )<br>
                  -        if mod_exclude:<br>
                  -            self.excluded_pkgs.append( name )<br>
                  -        self.packages[name] = description,
                  dependencies, fullFilenames<br>
                  -<br>
                  -    def doBody( self ):<br>
                  -        """generate body of Makefile"""<br>
                  -<br>
                  -        global VERSION<br>
                  -<br>
                  -        #<br>
                  -        # generate rprovides line for native<br>
                  -        #<br>
                  -<br>
                  -        if self.isNative:<br>
                  -            pkglist = []<br>
                  -            for name in ['${PN}-modules'] +
                  sorted(self.packages):<br>
                  -                pkglist.append('%s-native' %
                  name.replace('${PN}', 'python'))<br>
                  -<br>
                  -            self.out('RPROVIDES += "%s"' % "
                  ".join(pkglist))<br>
                  -            return<br>
                  -<br>
                  -        #<br>
                  -        # generate provides line<br>
                  -        #<br>
                  -<br>
                  -        provideLine = 'PROVIDES+=" \\\n'<br>
                  -        for name in sorted(self.packages):<br>
                  -            provideLine += "  %s \\\n" % name<br>
                  -        provideLine += '"'<br>
                  -<br>
                  -        self.out( provideLine )<br>
                  -        self.out( "" )<br>
                  -<br>
                  -        #<br>
                  -        # generate package line<br>
                  -        #<br>
                  -<br>
                  -        packageLine = 'PACKAGES=" \\\n'<br>
                  -        packageLine += '  ${PN}-dbg \\\n'<br>
                  -        for name in sorted(self.packages):<br>
                  -            if name.startswith("${PN}-distuti<wbr>ls"):<br>
                  -                if name == "${PN}-distutils":<br>
                  -                    packageLine += "  %s-staticdev %s
                  \\\n" % (name, name)<br>
                  -            elif name != '${PN}-dbg':<br>
                  -                packageLine += "  %s \\\n" % name<br>
                  -        packageLine += '  ${PN}-modules\\\n"'<br>
                  -<br>
                  -        self.out( packageLine )<br>
                  -        self.out( "" )<br>
                  -<br>
                  -        #<br>
                  -        # generate package variables<br>
                  -        #<br>
                  -<br>
                  -        for name, data in
                  sorted(self.packages.items()):<br>
                  -            desc, deps, files = data<br>
                  -<br>
                  -            #<br>
                  -            # write out the description, revision and
                  dependencies<br>
                  -            #<br>
                  -            self.out( 'SUMMARY_%s="%s"' % ( name,
                  desc ) )<br>
                  -            self.out( 'RDEPENDS_%s="%s"' % ( name,
                  deps ) )<br>
                  -<br>
                  -            line = 'FILES_%s=" \\\n' % name<br>
                  -<br>
                  -            #<br>
                  -            # check which directories to make in the
                  temporary directory<br>
                  -            #<br>
                  -<br>
                  -            dirset = {} # if python had a
                  set-datatype this would be sufficient. for now, we're
                  using a dict instead.<br>
                  -            for target in files:<br>
                  -                dirset[os.path.dirname( target )] =
                  True<br>
                  -<br>
                  -            #<br>
                  -            # generate which files to copy for the
                  target (-dfR because whole directories are also
                  allowed)<br>
                  -            #<br>
                  -<br>
                  -            for target in files:<br>
                  -                line += "    %s \\\n" % target<br>
                  -<br>
                  -            line += '"'<br>
                  -            self.out( line )<br>
                  -            self.out( "" )<br>
                  -<br>
                  -        self.out( 'SUMMARY_${PN}-modules="All Python
                  modules"' )<br>
                  -        line = 'RDEPENDS_${PN}-modules=" \\\n'<br>
                  -<br>
                  -        for name, data in
                  sorted(self.packages.items()):<br>
                  -            if name not in ['${PN}-dev',
                  '${PN}-distutils-staticdev'] and name not in
                  self.excluded_pkgs:<br>
                  -                line += "  %s \\\n" % name<br>
                  -<br>
                  -        line += '"'<br>
                  -        self.out( line )<br>
                  -        self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )<br>
                  -<br>
                  -    def doEpilog( self ):<br>
                  -        self.out( """""" )<br>
                  -        self.out( "" )<br>
                  -<br>
                  -    def make( self ):<br>
                  -        self.doProlog()<br>
                  -        self.doBody()<br>
                  -        self.doEpilog()<br>
                  -<br>
                  -if __name__ == "__main__":<br>
                  -    parser = argparse.ArgumentParser(
                  description='generate python manifest' )<br>
                  -    parser.add_argument( '-n', '--native',
                  help='generate manifest for native python',
                  action='store_true' )<br>
                  -    parser.add_argument( 'outfile',
                  metavar='OUTPUT_FILE', nargs='?', default='',
                  help='Output file (defaults to stdout)' )<br>
                  -    args = parser.parse_args()<br>
                  -<br>
                  -    if args.outfile:<br>
                  -        try:<br>
                  -            os.unlink( args.outfile )<br>
                  -        except Exception:<br>
                  -            sys.exc_clear()<br>
                  -        outfile = open( args.outfile, "w" )<br>
                  -    else:<br>
                  -        outfile = sys.stdout<br>
                  -<br>
                  -    m = MakefileMaker( outfile, args.native )<br>
                  -<br>
                  -    # Add packages here. Only specify dlopen-style
                  library dependencies here, no ldd-style dependencies!<br>
                  -    # Parameters: revision, name, description,
                  dependencies, filenames<br>
                  -    #<br>
                  -<br>
                  -    m.addPackage( "${PN}-core", "Python interpreter
                  and core modules", "${PN}-lang ${PN}-re",<br>
                  -    "__future__.* _abcoll.* abc.* ast.* copy.*
                  copy_reg.* ConfigParser.* " +<br>
                  -    "genericpath.* getopt.* linecache.* new.* " +<br>
                  -    "os.* posixpath.* struct.* " +<br>
                  -    "warnings.* site.* stat.* " +<br>
                  -    "UserDict.* UserList.* UserString.* " +<br>
                  -    "lib-dynload/binascii.so lib-dynload/_struct.so
                  lib-dynload/time.so " +<br>
                  -    "lib-dynload/xreadlines.so types.* platform.*
                  ${bindir}/python* "  +<br>
                  -    "_weakrefset.* sysconfig.* _sysconfigdata.* " +<br>
                  -    "${includedir}/python${PYTHON_<wbr>MAJMIN}/pyconfig*.h
                  " +<br>
                  -    "${libdir}/python${PYTHON_MAJM<wbr>IN}/sitecustomize.py
                  ")<br>
                  -<br>
                  -    m.addPackage( "${PN}-dev", "Python development
                  package", "${PN}-core",<br>
                  -    "${includedir} " +<br>
                  -    "${libdir}/lib*${SOLIBSDEV} " +<br>
                  -    "${libdir}/*.la " +<br>
                  -    "${libdir}/*.a " +<br>
                  -    "${libdir}/*.o " +<br>
                  -    "${libdir}/pkgconfig " +<br>
                  -    "${base_libdir}/*.a " +<br>
                  -    "${base_libdir}/*.o " +<br>
                  -    "${datadir}/aclocal " +<br>
                  -    "${datadir}/pkgconfig " +<br>
                  -    "config/Makefile ")<br>
                  -<br>
                  -    m.addPackage( "${PN}-2to3", "Python automated
                  Python 2 to 3 code translator", "${PN}-core",<br>
                  -    "${bindir}/2to3 lib2to3" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-idle", "Python Integrated
                  Development Environment", "${PN}-core ${PN}-tkinter",<br>
                  -    "${bindir}/idle idlelib" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-pydoc", "Python interactive
                  help support", "${PN}-core ${PN}-lang ${PN}-stringold
                  ${PN}-re",<br>
                  -    "${bindir}/pydoc pydoc.* pydoc_data" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-smtpd", "Python Simple Mail
                  Transport Daemon", "${PN}-core ${PN}-netserver
                  ${PN}-email ${PN}-mime",<br>
                  -    "${bindir}/smtpd.* smtpd.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-audio", "Python Audio
                  Handling", "${PN}-core",<br>
                  -    "wave.* chunk.* sndhdr.*
                  lib-dynload/ossaudiodev.so lib-dynload/audioop.so
                  audiodev.* sunaudio.* sunau.* toaiff.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-bsddb", "Python bindings for
                  the Berkeley Database", "${PN}-core",<br>
                  -    "bsddb lib-dynload/_bsddb.so" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-codecs", "Python codecs,
                  encodings &amp; i18n support", "${PN}-core
                  ${PN}-lang",<br>
                  -    "codecs.* encodings gettext.* locale.*
                  lib-dynload/_locale.so lib-dynload/_codecs*
                  lib-dynload/_multibytecodec.so
                  lib-dynload/unicodedata.so stringprep.* xdrlib.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-compile", "Python bytecode
                  compilation support", "${PN}-core",<br>
                  -    "py_compile.* compileall.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-compiler", "Python compiler
                  support", "${PN}-core",<br>
                  -    "compiler" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-compression", "Python
                  high-level compression support", "${PN}-core
                  ${PN}-zlib",<br>
                  -    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-crypt", "Python basic
                  cryptographic and hashing support", "${PN}-core",<br>
                  -    "hashlib.* md5.* sha.* lib-dynload/crypt.so
                  lib-dynload/_hashlib.so lib-dynload/_sha256.so
                  lib-dynload/_sha512.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-textutils", "Python option
                  parsing, text wrapping and CSV support", "${PN}-core
                  ${PN}-io ${PN}-re ${PN}-stringold",<br>
                  -    "lib-dynload/_csv.so csv.* optparse.* textwrap.*"
                  )<br>
                  -<br>
                  -    m.addPackage( "${PN}-curses", "Python curses
                  support", "${PN}-core",<br>
                  -    "curses lib-dynload/_curses.so
                  lib-dynload/_curses_panel.so" ) # directory + low
                  level module<br>
                  -<br>
                  -    m.addPackage( "${PN}-ctypes", "Python C types
                  support", "${PN}-core",<br>
                  -    "ctypes lib-dynload/_ctypes.so
                  lib-dynload/_ctypes_test.so" ) # directory + low level
                  module<br>
                  -<br>
                  -    m.addPackage( "${PN}-datetime", "Python calendar
                  and time support", "${PN}-core ${PN}-codecs",<br>
                  -    "_strptime.* calendar.* lib-dynload/datetime.so"
                  )<br>
                  -<br>
                  -    m.addPackage( "${PN}-db", "Python file-based
                  database support", "${PN}-core",<br>
                  -    "anydbm.* dumbdbm.* whichdb.* " )<br>
                  -<br>
                  -    m.addPackage( "${PN}-debugger", "Python
                  debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re
                  ${PN}-stringold ${PN}-shell ${PN}-pprint",<br>
                  -    "bdb.* pdb.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-difflib", "Python helpers
                  for computing deltas between objects", "${PN}-lang
                  ${PN}-re",<br>
                  -    "difflib.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-distutils-staticdev",
                  "Python distribution utilities (static libraries)",
                  "${PN}-distutils",<br>
                  -    "config/lib*.a" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-distutils", "Python
                  Distribution Utilities", "${PN}-core ${PN}-email",<br>
                  -    "config distutils" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-doctest", "Python framework
                  for running examples in docstrings", "${PN}-core
                  ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest
                  ${PN}-debugger ${PN}-difflib",<br>
                  -    "doctest.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-email", "Python email
                  support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime
                  ${PN}-audio ${PN}-image ${PN}-netclient",<br>
                  -    "imaplib.* email" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-fcntl", "Python's fcntl
                  interface", "${PN}-core",<br>
                  -    "lib-dynload/fcntl.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-hotshot", "Python hotshot
                  performance profiler", "${PN}-core",<br>
                  -    "hotshot lib-dynload/_hotshot.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-html", "Python HTML
                  processing support", "${PN}-core",<br>
                  -    "formatter.* htmlentitydefs.* htmllib.*
                  markupbase.* sgmllib.* HTMLParser.* " )<br>
                  -<br>
                  -    m.addPackage( "${PN}-importlib", "Python import
                  implementation library", "${PN}-core",<br>
                  -    "importlib" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-gdbm", "Python GNU database
                  support", "${PN}-core",<br>
                  -    "lib-dynload/gdbm.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-image", "Python graphical
                  image handling", "${PN}-core",<br>
                  -    "colorsys.* imghdr.* lib-dynload/imageop.so
                  lib-dynload/rgbimg.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-io", "Python low-level I/O",
                  "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient
                  ${PN}-contextlib",<br>
                  -    "lib-dynload/_socket.so lib-dynload/_io.so
                  lib-dynload/_ssl.so lib-dynload/select.so
                  lib-dynload/termios.so lib-dynload/cStringIO.so " +<br>
                  -    "pipes.* socket.* ssl.* tempfile.* StringIO.*
                  io.* _pyio.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-json", "Python JSON
                  support", "${PN}-core ${PN}-math ${PN}-re
                  ${PN}-codecs",<br>
                  -    "json lib-dynload/_json.so" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-lang", "Python low-level
                  language support", "${PN}-core",<br>
                  -    "lib-dynload/_bisect.so
                  lib-dynload/_collections.so lib-dynload/_heapq.so
                  lib-dynload/_weakref.so lib-dynload/_functools.so " +<br>
                  -    "lib-dynload/array.so lib-dynload/itertools.so
                  lib-dynload/operator.so lib-dynload/parser.so " +<br>
                  -    "atexit.* bisect.* code.* codeop.* collections.*
                  dis.* functools.* heapq.* inspect.* keyword.* opcode.*
                  symbol.* repr.* token.* " +<br>
                  -    "tokenize.* traceback.* weakref.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-logging", "Python logging
                  support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle
                  ${PN}-stringold",<br>
                  -    "logging" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-mailbox", "Python mailbox
                  format support", "${PN}-core ${PN}-mime",<br>
                  -    "mailbox.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-math", "Python math
                  support", "${PN}-core ${PN}-crypt",<br>
                  -    "lib-dynload/cmath.so lib-dynload/math.so
                  lib-dynload/_random.so random.* sets.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-mime", "Python MIME handling
                  APIs", "${PN}-core ${PN}-io",<br>
                  -    "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*"
                  )<br>
                  -<br>
                  -    m.addPackage( "${PN}-mmap", "Python memory-mapped
                  file support", "${PN}-core ${PN}-io",<br>
                  -    "lib-dynload/mmap.so " )<br>
                  -<br>
                  -    m.addPackage( "${PN}-multiprocessing", "Python
                  multiprocessing support", "${PN}-core ${PN}-io
                  ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes
                  ${PN}-mmap",<br>
                  -    "lib-dynload/_multiprocessing.<wbr>so
                  multiprocessing" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-netclient", "Python Internet
                  Protocol clients", "${PN}-core ${PN}-crypt
                  ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging
                  ${PN}-mime",<br>
                  -    "*Cookie*.* " +<br>
                  -    "base64.* cookielib.* ftplib.* gopherlib.* hmac.*
                  httplib.* mimetypes.* nntplib.* poplib.* smtplib.*
                  telnetlib.* urllib.* urllib2.* urlparse.* uuid.*
                  rfc822.* mimetools.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-netserver", "Python Internet
                  Protocol servers", "${PN}-core ${PN}-netclient
                  ${PN}-shell ${PN}-threading",<br>
                  -    "cgi.* *HTTPServer.* SocketServer.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-numbers", "Python number
                  APIs", "${PN}-core ${PN}-lang ${PN}-re",<br>
                  -    "decimal.* fractions.* numbers.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-pickle", "Python
                  serialisation/persistence support", "${PN}-core
                  ${PN}-codecs ${PN}-io ${PN}-re",<br>
                  -    "pickle.* shelve.* lib-dynload/cPickle.so
                  pickletools.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-pkgutil", "Python package
                  extension utility support", "${PN}-core",<br>
                  -    "pkgutil.*")<br>
                  -<br>
                  -    m.addPackage( "${PN}-plistlib", "Generate and
                  parse Mac OS X .plist files", "${PN}-core
                  ${PN}-datetime ${PN}-io",<br>
                  -    "plistlib.*")<br>
                  -<br>
                  -    m.addPackage( "${PN}-pprint", "Python
                  pretty-print support", "${PN}-core ${PN}-io",<br>
                  -    "pprint.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-profile", "Python basic
                  performance profiling support", "${PN}-core
                  ${PN}-textutils",<br>
                  -    "profile.* pstats.* cProfile.*
                  lib-dynload/_lsprof.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-re", "Python Regular
                  Expression APIs", "${PN}-core",<br>
                  -    "re.* sre.* sre_compile.* sre_constants*
                  sre_parse.*" ) # _sre is builtin<br>
                  -<br>
                  -    m.addPackage( "${PN}-readline", "Python readline
                  support", "${PN}-core",<br>
                  -    "lib-dynload/readline.so rlcompleter.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-resource", "Python resource
                  control interface", "${PN}-core",<br>
                  -    "lib-dynload/resource.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-shell", "Python shell-like
                  functionality", "${PN}-core ${PN}-re",<br>
                  -    "cmd.* commands.* dircache.* fnmatch.* glob.*
                  popen2.* shlex.* shutil.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-robotparser", "Python
                  robots.txt parser", "${PN}-core ${PN}-netclient",<br>
                  -    "robotparser.*")<br>
                  -<br>
                  -    m.addPackage( "${PN}-runpy", "Python script for
                  locating/executing scripts in module namespace",
                  "${PN}-core ${PN}-pkgutil",<br>
                  -    "runpy.*")<br>
                  -<br>
                  -    m.addPackage( "${PN}-subprocess", "Python
                  subprocess support", "${PN}-core ${PN}-io ${PN}-re
                  ${PN}-fcntl ${PN}-pickle",<br>
                  -    "subprocess.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-sqlite3", "Python Sqlite3
                  database support", "${PN}-core ${PN}-datetime
                  ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading
                  ${PN}-zlib",<br>
                  -    "lib-dynload/_sqlite3.so sqlite3/dbapi2.*
                  sqlite3/__init__.* sqlite3/dump.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-sqlite3-tests", "Python
                  Sqlite3 database support tests", "${PN}-core
                  ${PN}-sqlite3",<br>
                  -    "sqlite3/test" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-stringold", "Python string
                  APIs [deprecated]", "${PN}-core ${PN}-re",<br>
                  -    "lib-dynload/strop.so string.* stringold.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-syslog", "Python syslog
                  interface", "${PN}-core",<br>
                  -    "lib-dynload/syslog.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-terminal", "Python terminal
                  controlling support", "${PN}-core ${PN}-io",<br>
                  -    "pty.* tty.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-tests", "Python tests",
                  "${PN}-core ${PN}-modules",<br>
                  -    "test", True ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-threading", "Python
                  threading &amp; synchronization support", "${PN}-core
                  ${PN}-lang",<br>
                  -    "_threading_local.* dummy_thread.*
                  dummy_threading.* mutex.* threading.* Queue.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk
                  bindings", "${PN}-core",<br>
                  -    "lib-dynload/_tkinter.so lib-tk" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-unittest", "Python unit
                  testing framework", "${PN}-core ${PN}-stringold
                  ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint
                  ${PN}-shell",<br>
                  -    "unittest/" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-unixadmin", "Python Unix
                  administration support", "${PN}-core",<br>
                  -    "lib-dynload/nis.so lib-dynload/grp.so
                  lib-dynload/pwd.so getpass.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-xml", "Python basic XML
                  support", "${PN}-core ${PN}-re",<br>
                  -    "lib-dynload/_elementtree.so
                  lib-dynload/pyexpat.so xml xmllib.*" ) # package<br>
                  -<br>
                  -    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC
                  support", "${PN}-core ${PN}-xml ${PN}-netserver
                  ${PN}-lang",<br>
                  -    "xmlrpclib.* SimpleXMLRPCServer.*
                  DocXMLRPCServer.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-zlib", "Python zlib
                  compression support", "${PN}-core",<br>
                  -    "lib-dynload/zlib.so" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-mailbox", "Python mailbox
                  format support", "${PN}-core ${PN}-mime",<br>
                  -    "mailbox.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-argparse", "Python command
                  line argument parser", "${PN}-core ${PN}-codecs
                  ${PN}-textutils",<br>
                  -    "argparse.*" )<br>
                  -<br>
                  -    m.addPackage( "${PN}-contextlib", "Python
                  utilities for with-statement" +<br>
                  -    "contexts.", "${PN}-core",<br>
                  -    "${libdir}/python${PYTHON_MAJM<wbr>IN}/contextlib.*"
                  )<br>
                  -<br>
                  -    m.make()<span class="HOEnZb"><font
                      color="#888888"><br>
                      <span class="m_-3638696497346695351HOEnZb"><font
                          color="#888888"><br>
                          --<br>
                          To stop receiving notification emails like
                          this one, please contact<br>
                          the administrator of this repository.<br>
                          --<br>
                          ______________________________<wbr>_________________<br>
                          Openembedded-commits mailing list<br>
                          <a
                            href="mailto:Openembedded-commits@lists.openembedded.org"
                            target="_blank" moz-do-not-send="true">Openembedded-commits@lists.ope<wbr>nembedded.org</a><br>
                          <a
href="http://lists.openembedded.org/mailman/listinfo/openembedded-commits"
                            rel="noreferrer" target="_blank"
                            moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>commits</a><br>
                        </font></span></font></span></blockquote>
              </div>
              <br>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------7D93273BE0C84CD862606270--

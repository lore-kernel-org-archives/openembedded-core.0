Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 71504 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Aug 2018 20:55:45 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0043.outbound.protection.outlook.com [104.47.32.43])
	by mail.openembedded.org (Postfix) with ESMTP id 603366FF56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UrB4BAhurzwzu/5FeLtraxeWQWMT+POsg2V8QMA1c8Q=;
	b=QXXAFanMz+qYWTOk1jk51igAhSG0qCJDh0/bjNH6kx1O7HITe7qi4x/fikK7I6KhO++/eaWREbtEY4Ntb+fq0l8OpmlNXHF4h8QZpg/gAjMvQu+84X8IUcGlRBKO3WU8e9HoBTzScloSBVSc0a/UqQPQCHGKewBWmfWoX1PyWv4=
Received: from SN4PR0201CA0070.namprd02.prod.outlook.com
	(2603:10b6:803:20::32) by SN6PR02MB4333.namprd02.prod.outlook.com
	(2603:10b6:805:a4::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1017.15;
	Thu, 2 Aug 2018 20:55:45 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by SN4PR0201CA0070.outlook.office365.com
	(2603:10b6:803:20::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1017.15 via
	Frontend Transport; Thu, 2 Aug 2018 20:55:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Thu, 2 Aug 2018 20:55:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1flKdK-0005SV-Ou; Thu, 02 Aug 2018 13:55:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1flKdF-0002uy-Kv; Thu, 02 Aug 2018 13:55:37 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w72KtUXG014364; Thu, 2 Aug 2018 13:55:30 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1flKd8-0002uM-J4; Thu, 02 Aug 2018 13:55:30 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Anuj Mittal
	<anuj.mittal@intel.com>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
	<ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
	<12364d4c-2863-18da-1d8f-f74a80683447@xilinx.com>
	<257beb90-8a7d-2310-9c0e-ea18466fe1a6@intel.com>
	<92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <430488c7-2efc-2e6e-fafe-bf8795864f42@xilinx.com>
Date: Thu, 2 Aug 2018 13:55:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(2980300002)(438002)(189003)(199004)(356003)(126002)(33964004)(65956001)(53546011)(270700001)(486006)(65806001)(9786002)(77096007)(5660300001)(36756003)(8936002)(64126003)(11346002)(14444005)(31686004)(236005)(65826007)(446003)(8676002)(186003)(426003)(2616005)(16586007)(478600001)(31696002)(106466001)(110136005)(37036004)(6246003)(966005)(2906002)(106002)(36386004)(81166006)(63266004)(81156014)(26005)(229853002)(84326002)(6306002)(606006)(54896002)(476003)(58126008)(336012)(76176011)(93886005)(316002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4333; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT003;
	1:GaYA/NoD1QmIIS7KkfvPGHvsrtZxmKbjbo4Wj5Hf9at7SMhMAbJsYPE4c7fZOLpWmZSRVW4WdfLMMBwzxETIKdKzCll4s8IB/Pxke7IW8TzOMlEKC/8zH9G4kpjItbHe
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5a8d65b-04fb-4372-13bd-08d5f8ba50de
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4333; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	3:61ONj1qhc0UmaJet+wNgf5QwbliagGg8w9TMQJisG+AeA98HmqHF5cdoUDqcUm15GHtlGdqH2ipFhSjY1P5kMR5bfndzpvQyWexpO0tRCG5l5qvQMC7IQevq4Izu+lHo+UReMnn92W8d/nK5CXLCcyjIZqRDUe1+AEbQwQtgCM2qVqojl1iZfrc9wheEoJbPxAZFExUuqB91no3X4VCppOeypWdQ3HW6mTxagBFFsWph+ADNBm55Vl3eHhLeUs3cO30tQ0c+sXpA/ptCUE4qLUnaRJJ1ruJJLO1Bi4wrbXfpemJTDkeGRZr9k5qc/c6yxt+WDehwDRc6JdQwT3QEhKVZ5nJskmmbHj9UatqCn5E=;
	25:Ntw3RaxsmyEgdg+dgn4aakAqglu16x7bwIbIKwrYR5sG+UikmwN9u9ukO5Seh3e3utdPBl+izEIrF1sUTjMRX4kGPmQmqP5ZPAqnREr8D/gQUVih3SlBdcFHODsmhbufD1zzmY4Okw71O5q1vdVuI8QHwFDGNeE18jlShMJ94lRbelcDblEQJZrenL2RjpZcAwV7zWFnsCPavy1+WjuwTDrThM06/KrOL/KPkL1BnoZcXgfcU5UEUInoF8cHMiuU/N1b3Xfp3amK+1Uwa/X4zuzc3lZqe8QgCYL772WACpIlenFrcqaX56KYHhNUV7xpNlOTa3xsA+3E76qHh92WZQ==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4333:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	31:i2RJv0PzUo1bcPAo0u6dgjhJ4gLjwZsdEkn88KdXLt0P/goCfbngLlvCoK6FKMWyyhyPmg5QGhD14Rb1jFh4JHzWaK74S5z9/eABFM9pnVL5dMA8mhPwmT/XvItgrBYRfLBjA+p75ue0l0kbKRfG5qV+yMA9U2Nm5gfi4cGhS6zJLO/NPG2kPh1dCst6Kc4xlmlk4hc6qUZoUmBq14D7uYobCthDwPejjctyw/OIl4g=;
	20:XndwLBEtUDraYYJmmqc0+x/ElwsugbrGwr9YXJi8XKNtuOVOShQlvLeg2pPpLCDPhqnUVTa+D86zVC1ZdX3ClBRQRvg3PQrlkK/Id50RxzLURh2npABxWmmUQrb/F/6AWLoThB/06FoRi64yTgKK26oueaB/Z1P4AWQQDFULytX4ZQcrjszSTsD+wzhWyLUfxY5WMarXjeKH3z0FfEtCCqosvtnB1aYiVpUkbVThB6YF21MFc5iB7OH67KGFYNA0mCuM1JEuhWqHZ8KNFvRZ1dXARgXG0qBWDQ62kWy0FuF82B/nP1xc+WESoFpQ2/Il5ot8SFbFo6Fj7wbzkgGyEMI1vqBx4mJBJTRxvKnoOtpqBJGrGTIO0HYk5HDsCHV8WtFsKgLHJe4Gd1T70VtoybshqJqmBW9HsXe8yAben9ULtljCQuU0x3vJk8mjnO/KcUBVNyHsvDVlJgQJC8pdg4YdBb2Sfvgnfk6Wsc0ZYDUMOja1jPB6NceCTPnJVKmR
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4333FD0937C4892E47095B76AC2C0@SN6PR02MB4333.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(10201501046)(3002001)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:SN6PR02MB4333; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4333; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	4:9AVxajmZd6iSda2a8tNI5OHRfJoZddC0oJ+p0UOgF75krERgOzUmbKVHBgUvmT78cQen5o1JUGdG97vd1SY3G3P9wOpa0R8YMdlpswsTACW36VwIzrNx2Yu0NixQmnXvvSDanrdwOxEjtnIRcbqEhjuF2fM4aSViK69xtp3V+NnU3I5+3pcX3JBp5Fwse2kiiulfjCQdPx0xuzMoQr0f6hv76eg4JRLqeycWqTQgudQAqAkOz2exnlPehyV3LDUwKfhh80yQcoUAEW0Q2NvgAh+BADiQI5xk58gDadpF9mRFdIvEivzXFACf81mUpxSP
X-Forefront-PRVS: 07521929C1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4333;
	23:9DaSvfCygUcimfKgfu2DM+EX+XOPl51xVrcpc8mD9?=
	=?us-ascii?Q?w11foDUACUc45m/16S5o/AWk+DRU4VzeONYcQudcyBqz2JeMMyhUvtTzUb5A?=
	=?us-ascii?Q?9Zzr2jRJX0Z/NNa/nU0A1Mqr+HenmTHWdwMFDRp32rcodqdXMM06+OcxmCxP?=
	=?us-ascii?Q?1MJubEKWeQWHs4lvjdomdxRXm7LQEDmW8PdqywZPgYl/d2REf4uEey3BksHP?=
	=?us-ascii?Q?6WnOzIAcSqUKoIbn7esEL4lxMBv+buy1y9GAPGQqJLfzF+nYxEVI7Gch3VkY?=
	=?us-ascii?Q?6VP+pD06DOpWr8uzHSrV95klayOAHnygi1iPoCfP7Dg1o3Z6a4Q1FYFj7aVY?=
	=?us-ascii?Q?msOBg+ZtxZYdwQUgM4T63X8I0QZO4+YyKnHrqa7KIWSlxhKV4epCse7EDBNi?=
	=?us-ascii?Q?gMHWYzUAGiL+4qB+NXWTeeGN4ZhqFpf2a2JZRlRSEo8Q0cNZMSnEca1gbcdH?=
	=?us-ascii?Q?s22dWAKt9THtdveJ1xZawxL7z4V8hIof3pWd/DF+BwCaffVcZangohXL/+Dd?=
	=?us-ascii?Q?ZHy69fKjUuo6KI6CQO9XbFeBacO0E+wyhEedgrllm7PPsyFneAwOV8JmfquK?=
	=?us-ascii?Q?+JHFP7UE3P6pL23aVgRbqz8huhg4lKVlj4k2L6BmXFcgcM4czvOi2WFJoJyu?=
	=?us-ascii?Q?MHh4pcvc3uTiy1ATE+FEgAgoX/1KGzHdwhV4Cht3K4jliYV0GLIvlspabfn0?=
	=?us-ascii?Q?csCyiu1bG8USL8pwn2OpM7HiLQ9xD553lCzQzKBIdp5D03yAbnhfGnO0mfHe?=
	=?us-ascii?Q?Ez7FNmpqxnKf2V2kBkjkD0fCug9UR7tYCtRCHbDMfBQSfjgwv78m22BPHsAK?=
	=?us-ascii?Q?cBojRgNM3jw48/R1aIeBCpqQz+7+u5pnPSwRx8cFbnPMWpyG5iaRvOUZsNzh?=
	=?us-ascii?Q?CjvDjy1qbAIEQ6Wg3XcDVxYz4L2aZisXdBX91OokX2a0PNfWgywBMAkFVTp7?=
	=?us-ascii?Q?1QFl85++h+UdjK19exnwRht+Hv2aauODa3IWxATBEkJ9PpgEIV/EPwrIREYo?=
	=?us-ascii?Q?6WFmduJ+BOfzLxQRIOxWfNJlSz7IQOyz1rMqu6M4ut7qBvOeiDUSe92XTBRa?=
	=?us-ascii?Q?e0uXFU2Y5KdssusP2SZb1dmah24mw3PeN557GM02qyxrrGj0aHiSQt40bQjR?=
	=?us-ascii?Q?bS5ZknS98oTDJubYOT7FIftqlQzZlzjf0LYscrRlBvgnltZdQ2Sxa6gN8PEe?=
	=?us-ascii?Q?ObyDpbUkljSs4/Wbq4iNtJaOfA1/UsPAvwQzauljuxjpimlmGMStOjypjYxV?=
	=?us-ascii?Q?psR1Ox+/ioDuBj5FyV5jkJVruL2XF6wDqw2wHvznOL/c4TMzlT9TCXCjbbcC?=
	=?us-ascii?Q?ALeGVf+H7Lh9qpINHLc44A=3D?=
X-Microsoft-Antispam-Message-Info: Wna2ii6ZX149P/d885Igv9PKZNy3Vj9qKUdC4xL9MrEAnAAK2nr1GBYTQb3lExmPUwRGKm5EGP4EhNhdYRjWYh5zxo7c7hRq+J0ldUAiy+7xnzAYRihlR7hBxiVg1KvFp1Dc8XQz1rdk1B924ZZ9Rhsq55IO7Rs6RaFypQSg971DSmlEyuD0w+bBQa07w9TswUoD7mgjEKiftPUyBfDW8WJYgK4IBl/E3QXo2YiL52Z/B7Jl3CtYD3wdPLrAMRlg5+Brz0XBoPPQo6lkyRnQ7KLkSRSQTCGDPdzH8e7vvO3xtMMJWrfVJPUkB7UawJGtQzQjX7dognDvk9Lx323jUswSM3Yusql9RR2ZPkD7QM4=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	6:cDJuCjFc6IoqSsDsw2ej6oln3861WLKDCwih/JraGcj30KDd+2Pb7rX7WvcFVsUWfW/DBoxJfgE6j3pCLMWQq+w8kjZQgELUjKBvrnyHYe4lsyVNkJAAZIYPJqAH6x9sOq4sLwmj84lFwP7v9gg5Y5umFsF3jJVU2ZZsco11zV3tWw8tsLoubOf8R9Xq8R+eAwmsOW72ElbfJ/c9kSHsUZM23r9AUhKoqb/fOXoOvWW2roEZH8rzdIUtO/n/AEIifd/kI1hxkQ9HEKSzI0OGN0b3Bo7OjTU6HVsu7NPUYSt7+/ggBC1dMO03vt7v+N+P7daisidDWXenJGuJYreFbwo8KfdJVIE/4iPcPLMYEN6MMRy8RoeLU6Px+7n98Dbk83rQNMKOBVckh7KCotPwUyhm++toqbMPT7kZxybwdGve1WArJ/qein7tBFOPG2o9pIK8fw/CIWe+AxeMDordXg==;
	5:yeAzoDSKJb2nBo9uVqRIu6vtpjmQcYAHxbQjKUJ2ljKGwc+jpiKchTPqJ0CCPyKH8gw4OEhlmjMIgeAZuPBljhVcjVR13DbScKxeejdndV9Z5yXXMHlQyzkpoQ5HCHj5210RMQFN/lgNumnjrIy2alDi7qJepwxmC9pglNg9R3A=;
	7:AXNTEsTYpRRQeOj9wLFSIhSmmy5y1h9XQCu+R/MRlENH4DlwOMaJwrnbVycDrJCwvJ79afBccXGf8vMKzKtPwrfilV1pRJX8aTK4qzL9Rwi+yt58I6xNkrhFT3roVwJzAOq96Oy/cn0/VNlNn+26lrqII19ekT0gsrOZQElmWusdXOlXLyTLvKFrn8X0nKdn6KROviroXCANAz79VQjq2rgVaiQyeQKVAz9rARBkN1cIdnWdffV09pbVqY8+u9aM
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2018 20:55:43.4472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a8d65b-04fb-4372-13bd-08d5f8ba50de
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4333
Subject: Re: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Thu, 02 Aug 2018 20:55:45 -0000
Content-Type: multipart/alternative;
	boundary="------------B779C37A342767E20A3ADBC2"
Content-Language: en-US

--------------B779C37A342767E20A3ADBC2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/02/2018 01:53 AM, Richard Purdie wrote:
> On Thu, 2018-08-02 at 10:55 +0800, Anuj Mittal wrote:
>> On 08/02/2018 07:30 AM, Alejandro Enedino Hernandez Samaniego wrote:
>>> Hey Anuj,
>>>
>>>
>>> On 08/01/2018 04:25 AM, Anuj Mittal wrote:
>>>> On 07/31/2018 05:21 AM, Jaewon Lee wrote:
>>>>> When using a recipe space kernel-meta, scc files are added
>>>>> through
>>>>> SRC_URI, but they may include corresponding kernel fragments
>>>>> that are
>>>>> not necessarily in SRC_URI.
>>>>>
>>>>> For bitbake, this is not a problem because the kernel-yocto
>>>>> class adds
>>>>> the path where the .scc file was found to includes which
>>>>> consequentially
>>>>> makes the .cfg file available to the kernel build.
>>>>>
>>>>> However, when using devtool, only files specified in SRC_URI
>>>>> are copied
>>>>> to oe-local-files in devtool's workspace. So if the cfg file is
>>>>> not in
>>>>> SRC_URI, it won't be copied, causing a kernel build failure
>>>>> when trying
>>>>> to find it.
>>>>>
>>>>> This fix parses local .scc files in SRC_URI, copies the
>>>>> corresponding .cfg
>>>>> file to devtool's workdir, and also adds it to local_files so
>>>>> it is
>>>>> available when doing a devtool build for the kernel.
>>>>>
>>>>> [YOCTO #12858]
>>>>>
>>>>> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
>>>>> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@
>>>>> xilinx.com>
>>>>> ---
>>>>>    meta/classes/devtool-source.bbclass | 12 ++++++++++++
>>>>>    1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/meta/classes/devtool-source.bbclass
>>>>> b/meta/classes/devtool-source.bbclass
>>>>> index 56882a4..c70fea2 100644
>>>>> --- a/meta/classes/devtool-source.bbclass
>>>>> +++ b/meta/classes/devtool-source.bbclass
>>>>> @@ -90,11 +90,23 @@ python devtool_post_unpack() {
>>>>>                            fname in files])
>>>>>            return ret
>>>>>    
>>>>> +    is_kernel_yocto = bb.data.inherits_class('kernel-yocto',
>>>>> d)
>>>>>        # Move local source files into separate subdir
>>>>>        recipe_patches = [os.path.basename(patch) for patch in
>>>>>                            oe.recipeutils.get_recipe_patches(d)]
>>>>>        local_files = oe.recipeutils.get_recipe_local_files(d)
>>>>>    
>>>>> +    if is_kernel_yocto:
>>>>> +      for key in local_files.copy():
>>>>> +        if key.endswith('scc'):
>>>>> +          sccfile = open(local_files[key], 'r')
>>>>> +          for l in sccfile:
>>>>> +            line = l.split()
>>>>> +            if line and line[0] == 'kconf' and line[-
>>>>> 1].endswith('.cfg'):
>>>>> +              local_files[line[-1]] =
>>>>> os.path.join(os.path.dirname(local_files[key]), line[-1])
>>>>> +              shutil.copy2(os.path.join(os.path.dirname(local_
>>>>> files[key]), line[-1]), workdir)
>>>>> +          sccfile.close()
>>>>> +
>>>> Would the patches included in these .scc files also need to be
>>>> handled
>>>> in the same way? Would this also work if there are other scc
>>>> files
>>>> included in a scc file?
>>> Yes, I believe that the same mechanism should be used for patch
>>> files as
>>> well,
>>> basically anything that may be needed to build but that its not
>>> necessarily
>>> explicitly listed on SRC_URI.
>>>
>>> I believe it will work for other scc files and it doesnt have to
>>> be
>>> recursive,
>>> because while cfg files arent required to be in SRC_URI , scc files
>>> ARE
>>> required
>>> to be SRC_URI, which means that this will eventually find the other
>>> scc
>>> file on the list
>> I don't think they are required to be specified except for the top
>> level
>> one. At least, when I test it, I see problems. kernel-tools spp
>> script
>> parses them recursively and looks for a nested scc even if it is not
>> specified as part of SRC_URI. That is how the top level sccs from
>> kernel-cache are parsed too. Can you give it a try please?
Hey Anuj,
We can give it a try but do you have a specific example of how it fails 
for you?
Because I know theres lots of nested sccs on the yocto kernel cache, but 
in that case
it wouldn't be a problem since this bug is specifically introduced by 
devtool when it
copies local files from SRC_URI to a oe-local-files directory, it misses 
the corresponding cfg files (or patch files)
since they're not listed in SRC_URI and it fails to build, in the case 
of the yocto kernel cache, it
does not contain local files, so they wont be moved hence why it 
wouldn't be an issue.

 From the kernel dev manual:
https://www.yoctoproject.org/docs/latest/kernel-dev/kernel-dev.html#recipe-space-metadata 
:
It is only necessary to specify the|.scc|files on the|SRC_URI| 
<http://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SRC_URI>.

It specifies that only the scc files need to be on SRC_URI, which is why 
I'm saying the script
will eventually run into them from the list.

I want to be clear that I'm not against doing this recursively, I just 
want to understand your testcase better.
> What would be really great here would be some test cases in the qa
> framework! It'd be a good way to both illustrate the problems and then
> test we've fixed it and that it stays fixed.
Hey Richard,
Sure that sounds like a good idea, well work on adding a testcase (or 
adding to the existing one) for devtool when
it is using a recipe-space kernel -meta.

Alejandro
>
> Cheers,
>
> Richard
>


--------------B779C37A342767E20A3ADBC2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/02/2018 01:53 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org">
      <pre wrap="">On Thu, 2018-08-02 at 10:55 +0800, Anuj Mittal wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 08/02/2018 07:30 AM, Alejandro Enedino Hernandez Samaniego wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hey Anuj,


On 08/01/2018 04:25 AM, Anuj Mittal wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">On 07/31/2018 05:21 AM, Jaewon Lee wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="">When using a recipe space kernel-meta, scc files are added
through
SRC_URI, but they may include corresponding kernel fragments
that are
not necessarily in SRC_URI.

For bitbake, this is not a problem because the kernel-yocto
class adds
the path where the .scc file was found to includes which
consequentially
makes the .cfg file available to the kernel build.

However, when using devtool, only files specified in SRC_URI
are copied
to oe-local-files in devtool's workspace. So if the cfg file is
not in
SRC_URI, it won't be copied, causing a kernel build failure
when trying
to find it.

This fix parses local .scc files in SRC_URI, copies the
corresponding .cfg
file to devtool's workdir, and also adds it to local_files so
it is
available when doing a devtool build for the kernel.

[YOCTO #12858]

Signed-off-by: Jaewon Lee <a class="moz-txt-link-rfc2396E" href="mailto:jaewon.lee@xilinx.com">&lt;jaewon.lee@xilinx.com&gt;</a>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alejandr@xilinx.com">&lt;alejandr@
xilinx.com&gt;</a>
---
  meta/classes/devtool-source.bbclass | 12 ++++++++++++
  1 file changed, 12 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass
b/meta/classes/devtool-source.bbclass
index 56882a4..c70fea2 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -90,11 +90,23 @@ python devtool_post_unpack() {
                          fname in files])
          return ret
  
+    is_kernel_yocto = bb.data.inherits_class('kernel-yocto',
d)
      # Move local source files into separate subdir
      recipe_patches = [os.path.basename(patch) for patch in
                          oe.recipeutils.get_recipe_patches(d)]
      local_files = oe.recipeutils.get_recipe_local_files(d)
  
+    if is_kernel_yocto:
+      for key in local_files.copy():
+        if key.endswith('scc'):
+          sccfile = open(local_files[key], 'r')
+          for l in sccfile:
+            line = l.split()
+            if line and line[0] == 'kconf' and line[-
1].endswith('.cfg'):
+              local_files[line[-1]] =
os.path.join(os.path.dirname(local_files[key]), line[-1])
+              shutil.copy2(os.path.join(os.path.dirname(local_
files[key]), line[-1]), workdir)
+          sccfile.close()
+
</pre>
            </blockquote>
            <pre wrap="">
Would the patches included in these .scc files also need to be
handled
in the same way? Would this also work if there are other scc
files
included in a scc file?
</pre>
          </blockquote>
          <pre wrap="">
Yes, I believe that the same mechanism should be used for patch
files as 
well,
basically anything that may be needed to build but that its not
necessarily
explicitly listed on SRC_URI.

I believe it will work for other scc files and it doesnt have to
be 
recursive,
because while cfg files arent required to be in SRC_URI , scc files
ARE 
required
to be SRC_URI, which means that this will eventually find the other
scc 
file on the list
</pre>
        </blockquote>
        <pre wrap="">
I don't think they are required to be specified except for the top
level
one. At least, when I test it, I see problems. kernel-tools spp
script
parses them recursively and looks for a nested scc even if it is not
specified as part of SRC_URI. That is how the top level sccs from
kernel-cache are parsed too. Can you give it a try please?</pre>
      </blockquote>
    </blockquote>
    Hey Anuj,<br>
    We can give it a try but do you have a specific example of how it
    fails for you?<br>
    Because I know theres lots of nested sccs on the yocto kernel cache,
    but in that case<br>
    it wouldn't be a problem since this bug is specifically introduced
    by devtool when it<br>
    copies local files from SRC_URI to a oe-local-files directory, it
    misses the corresponding cfg files (or patch files)<br>
    since they're not listed in SRC_URI and it fails to build, in the
    case of the yocto kernel cache, it<br>
    does not contain local files, so they wont be moved hence why it
    wouldn't be an issue.<br>
    <br>
    From the kernel dev manual:<br>
<a class="moz-txt-link-freetext" href="https://www.yoctoproject.org/docs/latest/kernel-dev/kernel-dev.html#recipe-space-metadata">https://www.yoctoproject.org/docs/latest/kernel-dev/kernel-dev.html#recipe-space-metadata</a>
    :<br>
    <span style="color: rgb(51, 51, 51); font-family: Verdana, Sans,
      sans-serif; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">It is only necessary to specify the<span> </span></span><code
      class="filename" style="font-size: medium; font-family: Courier,
      monospace; color: rgb(51, 51, 51); font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">.scc</code><span
      style="color: rgb(51, 51, 51); font-family: Verdana, Sans,
      sans-serif; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"><span> </span>files on the<span> </span></span><a
      class="ulink"
href="http://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SRC_URI"
      target="_top" style="text-decoration: underline; color: rgb(68,
      68, 68); background: rgb(255, 255, 255); font-family: Verdana,
      Sans, sans-serif; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px;"><code class="filename" style="font-size: medium;
        font-family: Courier, monospace;">SRC_URI</code></a><span
      style="color: rgb(51, 51, 51); font-family: Verdana, Sans,
      sans-serif; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">.<span> <br>
        <br>
      </span></span>It specifies that only the scc files need to be on
    SRC_URI, which is why I'm saying the script<br>
    will eventually run into them from the list.<br>
    <br>
    I want to be clear that I'm not against doing this recursively, I
    just want to understand your testcase better.<br>
    <span style="color: rgb(51, 51, 51); font-family: Verdana, Sans,
      sans-serif; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"><span></span></span>
    <blockquote type="cite"
cite="mid:92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org">
      <blockquote type="cite">
        <pre wrap="">
</pre>
      </blockquote>
      <pre wrap="">
What would be really great here would be some test cases in the qa
framework! It'd be a good way to both illustrate the problems and then
test we've fixed it and that it stays fixed.</pre>
    </blockquote>
    Hey Richard,<br>
    Sure that sounds like a good idea, well work on adding a testcase
    (or adding to the existing one) for devtool when<br>
    it is using a recipe-space kernel -meta.<br>
    <br>
    Alejandro<br>
    <blockquote type="cite"
cite="mid:92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org">
      <pre wrap="">

Cheers,

Richard

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------B779C37A342767E20A3ADBC2--

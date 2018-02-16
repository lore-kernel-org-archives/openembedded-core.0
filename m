Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0080.outbound.protection.outlook.com [104.47.34.80])
	by mail.openembedded.org (Postfix) with ESMTP id EF70660616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RJRc/T9j8rN6mm98sg+RwAxC1qHu5iB7yNlTM6uWuaA=;
	b=rpNu9b6R4TUvHxY/S7eanB9kJUirQyFefpgijTe/yTx74MI/a++f9Q+Yh4FcGsPMstZcwRuJeQT5DFu1WMWKbaxKfOAHmS/XSEuszGYR+52PPadDlqhqFXO9wP5Ksm5rF2EYYX+BvA53QqdoxFeoyCzR7LuDB+YKV5H3B0WQSSA=
Received: from SN4PR0201CA0034.namprd02.prod.outlook.com (10.162.76.20) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.506.18; Fri, 16 Feb 2018 19:56:05 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0034.outlook.office365.com
	(2603:10b6:803:2e::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.506.18 via
	Frontend Transport; Fri, 16 Feb 2018 19:56:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.485.14
	via Frontend Transport; Fri, 16 Feb 2018 19:56:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48066
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1emm71-0003Ot-Pc for openembedded-core@lists.openembedded.org;
	Fri, 16 Feb 2018 11:56:03 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1emm71-000187-MI for openembedded-core@lists.openembedded.org;
	Fri, 16 Feb 2018 11:56:03 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1emm70-00015P-Vx
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Feb 2018 11:56:03 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1518620874-23886-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <909c5fbb-7bec-2f15-d2f9-40ff78913bf4@xilinx.com>
Date: Fri, 16 Feb 2018 11:56:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1518620874-23886-1-git-send-email-richard.purdie@linuxfoundation.org>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(39860400002)(376002)(346002)(2980300002)(438002)(189003)(199004)(106002)(76176011)(6916009)(58126008)(2906002)(316002)(9786002)(36756003)(83506002)(8676002)(478600001)(31686004)(5660300001)(2351001)(2486003)(106466001)(356003)(81156014)(26005)(6246003)(81166006)(31696002)(67846002)(65806001)(65956001)(336011)(23676004)(230700001)(47776003)(8936002)(186003)(64126003)(53546011)(2950100002)(229853002)(305945005)(50466002)(65826007)(77096007)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT055;
	1:hjmWZxlMJRks7b7PViYxetiCx6Jjlfs4Z2Sx00RtSsWGpKMRiPuAmun5nW8PFlKdeYdFXmPmvmX5kZne7JkNH4JY2nke9H9pG+Doq+UKhQsd6QheclzoI6dhzNe5HX+l
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ce1bf8-0d6c-48a3-1df4-08d57577502b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:SKmMZCJkFaV/ByGUM2xZYo/3kSb0MUnpYHLcap6bK7ITeHg6uXgEKTN60UlFH33RTF/5AG+2ltEm414WBLtE0FjlCIKhZFyedWCwm5ekXrRoPiGI3dGwNiO3cLTdPAk2w68hXcUPvRe5F8r4lS24ATozge66E2XkSaTZlAxIHxUcUn5CXY6iEVmQ3rjrCPtjdWYwuRnX3s+KaJ0W81wCqEBhW7xEph6IvVhhho/Wxt3QFK6ebD+nxZZO/o/fHOXoaj/N5uSZirZ3cc1FCH2m9tTRSg+NfY99gPUpH+I3iMgn8jAwxbK00oL1qZy8Q6hwcdnf3LssT8bsr96bShpNWT8Gf+fupqcW7BdRXPbRw64=;
	25:SixfPK5HxbGSkwt/Yra6CrIs1r5op1spXTI8yErWJEFqLVOz5rdjBe00EUgd7xmN5SCq96sGPpG7bV1DAYtUuZDsmcW9NFbKKI2KNRV3KJvkjp8zXqvTsAl9IxlXP0AKyEnAuZ2SF2azmFq5ngIksjyowTVhrGs0oKcOnA9573PVZvdR3WCD6uIbf+sVJ0izxCNT4/3+3vAV8JdFB7f3J5XJk7aC+xGhZx3uONAiHK0lfFBDGyO1+Byh7np1DsICS+osmjvytXqr2rh+4U1ZhEvpLIA9vmj5T1LiVrVg6BJYDOLJkDBeLe7+c0yNJg/+SpRabcO3j9674le5cFuTPQ==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:VQBKCLt/rhuJ07JFqVfp19Pq8Xep7+mBGShG/c/84fP76MC0j4GIQjE3//aFuqgMGz4DLFgJvpao/4Cn86M7FQ9/0UavSEchyV9lDPeE6NUWQU6J7G57Bnh2lFbkbsv9M1L989LZFzzaofqISc3lym7KIbYBWBmXHU+2GQIYsKX1du7A33IhUlADRa85oB+dGAY6vVz5/QkJrfsaiNLjUQGvYXLGMKmIu4+f/w7UnDs=;
	20:nuegubchBvtXpyWiibV5geP8cXs1diR52S7+4vN/6nx36vKdH6bl+9GvF8K5ypaxJIaJR68bmawuqN6+SLhd6ZO6Yh04rqWzKoqCmInPc4UsBfXRQX5WUbBtTjahlk+JKQn3VqPv4BRuM7A0zKy7FiXY0eIxAKKMrDz8qPSVcYoAgra+A7ip3tfZK5kSkO/8bdUXs4M93GyFvSreMNrqzMKQmHW3CBPMzV6Lx9r4om4nE6NixDzuY4vnH3EwgA2QLDQGYexuOr1t3fxsaa4aEZyTf36ExYDAduaiM5U/mknxag4gB7i8CVNvHFIjX10iJdpTdSBrHZaLqCwZduXrDemZbxzBfHNIaAcOylB+BcrDxcriI9fyAIvlJUf7MCDxG2qXxXwYSZAo1H3gf+hE113aTly8q5RITWaqeJpPIYfDtvqm3aLOne9Eer6qBYBUGYl/ZhDTsHQViawDBj22WmCfofLnlNEGuL07Q0xlD4L5itrTUHauNyhxuO8XSeGF
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB3379FF89AED7EDD95FE6E81EACCB0@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(10201501046)(3231101)(944501161)(6055026)(6041288)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:s54mReY/KcojEpwI6/4h+2AUGv5rsd6xH2sXpxvyrjqS29Vr/4dUDYtFqQuQPsSWtsCD60rIKR1/t1fD/WRu7jEeN7rBIRTwsovoqN9Bp9/WqwWM1URn6b/YJyblkHq7PqR+TM2Fr9Gnzdv0luSUc5vPOjfgKsOZl8GemKsshscDH/rcTNBCt0IsLlje2YfqV2LmczloclhfdiNiVecEp6wmLb/gZDB5kXePe8QBq5FQs7Aam8YLmp8vqRXo37eW0MQWu15+aSIG0ioy9NiFfw==
X-Forefront-PRVS: 0585417D7B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIzMzc5OzIzOmtxME1MQ3oxcGNwV2Z3OTFIclFLdlpkL0Qz?=
	=?utf-8?B?RU03aFlXQnhJeHpJTS9kNHZ6ZStLMVpjNVlUOFd4ODgyazlIUmF6NVliMSt3?=
	=?utf-8?B?MlJsbDE5R0tEYloxV0hpMGRaSDJHR2xFUGRzZmV5dzlUVXZDYUZvd0lmdDdo?=
	=?utf-8?B?c1dWK2FXTEs1cHYwUFBTeWh1bE9DSWJFUWovOHIxOTU4SUlOa2xFeCtDeERk?=
	=?utf-8?B?b2FPK1hjTWhqK0ZzWWhmZXhJWm1XT0JOL1BmdGwvOWZDTWRocXFxeXJrU0xC?=
	=?utf-8?B?QmxFN1EreDhZdU5uNmZGUEJaTTlaWlpuem1sZ2lDTTZONlBlS1h3dElUdCtZ?=
	=?utf-8?B?S0ZOZTE2VGw5c3hkaXM3N2RjQjNZdkx5dWdoa0hOeXVIaWdpcWdiQTZuQlFv?=
	=?utf-8?B?RW1JS2VHM3VnMUNVL3FCYUNLMVQyNFhBUGlqVWx0RTNIb0RKU21kQ2ovOVEy?=
	=?utf-8?B?VlhXN1FEc0dobDR6dCtONFJwajhGKzdIUXkrMDYxd3BYSVFYRC8zNWdmYUM0?=
	=?utf-8?B?ZnpFSWhCSklGampZWFlvc1ovampPSmkySWdTbTltVUpJd0dmWVpBMkNjdWps?=
	=?utf-8?B?cGFScjZWM3R4NE9IV05BMUVaZ1RWQlpZNUltL2pGQVUvOS85akVrTUZWUS9B?=
	=?utf-8?B?czlwSm5FRnB3OTdpckYyVGwyZjE5ZVRkRk0yOXdnOTVzNlVYVE4ydG5ZVHRD?=
	=?utf-8?B?Vm5yeEdNLzc1dGxRMWFkSCtJaXNvSXkzdEU2M3k3S1NLbW5QL3E1MSt3ZUE0?=
	=?utf-8?B?RUNlanRYTHNGUXdtV0RhdUoySm9XN0poY3dRaGRLZFQyVnVoeG9hRmZ5QXBK?=
	=?utf-8?B?WlQ3RG8wNGo5ZmtXWERURExpbmIyUnVvZXFpdDdva1g5VVNaeXA5WVlSL2lJ?=
	=?utf-8?B?TEJVbXpubWhKajZzMGdRdHJtRWZnSW4wS1h5OWhpeXMrZGJFb29od1RzT3Vy?=
	=?utf-8?B?R0FIamFReEZZOE02d3kyODdJUGYzSGt2SEYwRTRDRllLU2VxVW1UZjVlQ0VD?=
	=?utf-8?B?NUhhcEQ0WXJLMHhkTW9YMDQxY1hXcEUvUEpWR01zNXQ1cFYrSFdHeDZXWE9q?=
	=?utf-8?B?VFFCR0hqYXVoV2g0YmVEdGYva1NQUWlQUUx2c1l3UExLcmZkQXdpTll0akls?=
	=?utf-8?B?bFBDY3BUTGcwNngrM2c5em1LdDJrNTBHajQwOXBiRzRSTmNaSzgrcmZIZFJt?=
	=?utf-8?B?aDNFWG53bWVGTGU4U3h1bUpKTmFldWFud2taUHc3NUtjRWVVaE83UE84V1Nx?=
	=?utf-8?B?S2xhVTZrejRjRHl6WUVSeTFOWmkzMERFaDBrZlNyRzUxYzFHZi9Gc1gvTjZG?=
	=?utf-8?B?OHY5VWc2U0VSbG9VakViVFpVTDUzSVhpU2JsbXhlcHowUXVESFVINWxGVTZu?=
	=?utf-8?B?VDkzMXR0TGYyU08rQ1hkUldJcDFkZzMwRjA1MDl5VVVOWU92aUNmWkVpSUFX?=
	=?utf-8?B?Q1NlN29RcGNFUkZIYkV6YzVZdkwxMG45a29UeFIvVm5EWkpYZ3NjUGxmSFRT?=
	=?utf-8?B?bW5WQmt1NWdxMDBTQUhaQ3lBd2tYalhNTFJGd0tBb3JoNW9RaEsrU2FrbVNk?=
	=?utf-8?B?NUxwSWN3ekl2bS9iVkdOUGlPVm80dXc9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:JHjd+uwhBe33oonEQqdup7FqGbIImxeBLzZGFjNdgcERoqEoyVimbsGlr4IceOm3QeXRrKZDFtJQ20Dz2XwR59AQpIO5abRBl43GTcJdmWqNTxgUCZU3bnL4XrQgOGNJOHItQxrYJ3px8n1WzdMB3ov+NyPyGA5x0IXUPXYoZSJ59e+tF0ZmSJdg3Ni2JxZn/gwlR2mgYJFF0tIPULhNSas1U2NvbAw0yW0kQKIb6aPIyhSU/I2cSZozavOPtW04PWHyW+mrg3S3wONB0cwxPC3lFfQ77GUSbXd+m6nOHemyfSCQjD7G1sZgXC02qxwsyL+SKEzJAKjH6bs2UDhKTZ7+XMeycs2vOZzjwZdWteY=;
	5:J65sSejKsBxkDHnOe3Gt96ZzfXDOTH8MzKQHE2GAqLX/6KWVVAxR73KETxGFOnXAX1Ungqov4lp10lMpBQfl6W5mejVBfhUdn5konKUYGkqZ+QtR/6ZIshfGKwOcSiaeJIgqECbIjf32/wcGIDa5+hAXlchxYxx626o0XclXltM=;
	24:Nr3SDXaVtxT5geGDR7c6dCH9YpKGO4cWYGCTHgwjGWkmYcqRNAcL6UnqGaEsAivTJR8MIk8qoqlMYmvFx8uuhAXcKmzgagzhVp466ZlKqHA=;
	7:oAXzqn4kES/LKnU+oi+znUbNkvdnCuxdPuJArtac+RiZJD7yS6NQ03Xs07+4XKLSd5HLno8bAiQNUV5tlCpMlDyphLV2+V8A8u8BDwFfo1K1+nSp7jQa1g3nnT9dOwJW5/LZBgBGkCpqkPij6ADlgfyI483wcMnxFmAwivH73M6z+SNc5sJW8ekqtN0iE/ekAH2idGO4xCqIw2bhm0L+dAvpANzilHur2Py/G3omNK3n+qfuRb9LwGAZeMTspXSW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2018 19:56:04.7322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ce1bf8-0d6c-48a3-1df4-08d57577502b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
Subject: Re: [PATCH 1/2] package: Add INHIBIT_PACKAGE_STRIP_FILES to allow files to remain unstripped
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
X-List-Received-Date: Fri, 16 Feb 2018 20:10:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Richard,


Do we expect to backport this to older releases?


Cheers,


Alejandro


On 02/14/2018 07:07 AM, Richard Purdie wrote:
> There are cases where its useful to allow only a select few files
> to be excluded from the package stripping mechanism. Currently
> this isn't possible so add a variable to allow this.
>
> This is to be used sparingly as in general the core code should be
> doing the right thing. This is better than the alternative of leaving the whole
> package unstripped.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/package.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 6a7f35a..90e5236 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -946,6 +946,7 @@ python split_and_strip_files () {
>       inodes = {}
>       libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
>       baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
> +    skipfiles = (d.getVar("INHIBIT_PACKAGE_STRIP_FILES") or "").split()
>       if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1' or \
>               d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
>           for root, dirs, files in cpath.walk(dvar):
> @@ -961,6 +962,9 @@ python split_and_strip_files () {
>                   if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
>                       continue
>   
> +                if file in skipfiles:
> +                    continue
> +
>                   try:
>                       ltarget = cpath.realpath(file, dvar, False)
>                       s = cpath.lstat(ltarget)



Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0073.outbound.protection.outlook.com [104.47.36.73])
	by mail.openembedded.org (Postfix) with ESMTP id E632A70034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 00:53:17 +0000 (UTC)
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
	(10.152.72.56) by SN1NAM02HT231.eop-nam02.prod.protection.outlook.com
	(10.152.72.204) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.567.7;
	Tue, 16 Aug 2016 00:53:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.567.7
	via Frontend Transport; Tue, 16 Aug 2016 00:53:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZSd1-0005gV-UM for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2016 17:53:15 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZSd2-0003EX-Ch for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2016 17:53:16 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7G0rFuL030789 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:53:16 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZSd1-0003EU-Sm for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2016 17:53:15 -0700
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
To: OE-core <openembedded-core@lists.openembedded.org>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <edcd29bb-7b7f-f8e1-88ae-ae33bc1413c0@xilinx.com>
Date: Mon, 15 Aug 2016 17:50:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22514.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(24454002)(377454003)(189002)(199003)(81166006)(2906002)(77096005)(83506001)(65806001)(19580405001)(4001350100001)(31696002)(50986999)(230700001)(81156014)(76176999)(8936002)(54356999)(92566002)(47776003)(8676002)(189998001)(63266004)(65956001)(230783001)(2950100001)(586003)(107886002)(450100001)(64126003)(86362001)(305945005)(50466002)(33646002)(36756003)(7846002)(23746002)(19580395003)(626004)(356003)(110136002)(106466001)(87936001)(11100500001)(9786002)(31686004)(65826006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT231; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT008;
	1:RwLm9AQE2ghfNdemOuoqSu9TpICxeiGldPwm4tnPTHWbR8TDbiVAPpbyE0n0wM6KWv70DuJeBd8NN9ztmI52hCgc8tBpi0Mak/ZYlmbJ7ffBah58ipqnZPB3d7qsW9TtFCrOePdJepuvE+TAtlbWkVaZmE9EqfOYvUcI+H7h727Zg18BJuane7C6ekAu1t6wzdV4pLGOI2Yl2dqkpLQfiOzK1M+SnD/SnfuP/OP7HPwqe8NHeiogCQmFWg9/+RFS6kuF1hVbtrnYSa7yEfPNhx2EJ9eEvkxHX/ZEcbxYc6nbkmGjho6/R1DDu0D1sg80S4mmYv5dvLtDvJRe/rgVhDbFyA5bv2aORaak7DUnawuCQkh5TiDmZuLJBQPhgNoWKGvks26fTCLEJgzECO0omz9GA+jWx/H4TKBEn3Vy7qU/xDdU2VdRhkTuNV9ZcCW80DGf0JJ7B2H31GeM0msE0rDFOdhGjx8Ra4CqLCqjLPqMv1jLiLkcbLg5Nov17Vd7C71sy8n/I/7Jl+w8tLSIhvPmUQQIHpYizyTREs5Ig6bOlcVA9Jo+krJKvnluYgNo
X-MS-Office365-Filtering-Correlation-Id: a1e06697-eade-44f4-96ee-08d3c56fb5d1
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT231;
	2:d42Uxz27+1SgFvHtzLTIyN7SGsVEq/4QCZw2yUo7OEahIZOi5/B4tJ77nBdgK4GKPxmZ3p1aWoOwbg5FFPU3fWQJaibSQ/zOrfLXfYg5vWeNJLUxvacKIp6poPuRwMbCD45ipZaou0aTcxe/a//OfeMNrsKue8D1YTjJiarI6ehbqRZusjDRlVV1VhhKFYD3;
	3:wI5m5N3CfX9axNQBsVWcF4xqGYQoNqycWAXo15WfuEWY2gmkEno5H08LoQQG51OSYVRPWgU8+sAtB98Gd9VShuCm9HJDE9ZLPbFq4RpecCCyyyb7vltMlh2+v/aAD8QwAEUvYc/cF50eSYGia3ghlBQcADrUR5AU1mn+sp8HK797+mjDhrBsth7XzOCFPU6BsEyAPLeJJnXZjIf3Juj8qoUaIJRMsv9eso06i7q4Oa/QS0ik5dWFwetLHQLnh0RgsX+QomjVfJIpg01+cf7FaQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT231; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT231;
	25:0buMFQA+CZGRW5S1XXnAFmmXH5h7qMowBOCm+ETYi6o2xTGcnCjMmMbwGMhchbeMwB+5YZp5bfkNToi7T2KwwYTJkY1+v3Mo1bmPa7y7lNRW2iaMxioiNBBj8jtAw0FqPwpzWJzXXGKEdy2u69esu2f5uBp+lbCeFp7A/M6OjPoHdhPmmlB24O0v7CcJknJC+Hc3cXh67p82J08S+GeG/IJz+aXUvAHDU2nbAg/Mp1f7Q3kR5iHcJurimOc02hXmUP39HwrdqPRGbF50GhqHlzgr4+fUTmjW1y3kLKc1J/el8IbwhLTaFISRDZaOroZes6hLnSfQV6v6wJ7RkX4umSzeTeiPZeBP1gVtkf8uVM7/D+MFJFrxwy8np/1Sx74Tj3FKP0jUR3gYCzScIS3zHw6XrDy1/2ALzNtze4Ov/7Aivw+enWNwiJ3wcXHEH5XFpoDv+Hd74iX+NkAPjbOktN+wt7sVcaI6bAJ4SOh4OTg8zGPKTHXUs4R1rLWNCGrGWwa+z43V4mtQhgSUgOynvVQVoDTBZKc4I5Cwvsr86k74eipLwIwBtPDx/VWF2dYapUhg81rjBfkXIim0yeGALtX4G96jXb0ot/7ToBKFFVoenm9A0d1qwHUbw+N183MKIMsGz14wd4Ms14EyIfOwWsncF8o6Qgg7cXBiDgcBxnkJdsHnGnj+Q3ncM1mRdnPCHTlLQ8RjwJdZGZGS1d0//MQte0zRX68RW8pu2t7BIf9vw1ElbMGbHni88YguEahsn14zkx+pgj+d6a0prkQLaQ==
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT231;
	31:WWvjVzNOM/isjqz5TwhSEhGQKVLdvqiBT/QslNw5h4/oMEmn9PIws+/y2K3l/PBQxvDYZhtPXEyJeSWi/D17oCu977KzxkapCz4NwmzAC+r3MB7lrgXR0MxDJWNqwgVWeSS1bolRk1Y0lTUn55Euf8KT3F41ZNK+VjwbX5SKkjRlm5yWDLCLw/HcVcznVng7Kj3aaYZxqfBwe51tPeQZ4ccmTTrG8Q2MHSA2oLDtqRA=;
	20:gDqs8QHG5RaUaBOg3P0/cjfVR39yFdFfZvQ3rZGzbEjel6q8m6HLfwUqjQU2ge/ROBmsBs7/YeYPKNQX4WoboIXWSKVMOa+YF+uSS+0dV85ODB4yUAga6eGhQMOrq+SgeMWw1z4mpr498ExG/S3eOD2JD7ztvjgt21hkVF4c4jgLfzJHnzwE4J0bhws42RPXdev2voWaJVXkUADNuP5ecFouKhbI4JAZukNpvHc0sS7XqNxvehWdDAJHYFFBGJMf4HS2Ot35QOuOZvqGZ1wgW+7Q1rzO+PI2Z4mwYHyozARsB1z2yi0Rn8bO36koKPSlmblHKQzTxP+h1oXb4OSlkdbjJWSphg0cwRSbk2dKXOFEN6KgDvcB5l5vfDmMsl7qxGrjlHp6hGaypLOXD1gZlL84WYS+cNG/Qxbz1i+6c/A8CB9rhKc64MEM9irliCmH2Ngf8vFcxUFetdgr3EbucZ3aamJ7T233r0XbeUu8Lu1Jjsh1EtvFvBQlhk1Gy4H/
X-Microsoft-Antispam-PRVS: <3b1874ced4ef4ecdb4ac09a23fa48e0a@SN1NAM02HT231.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(8121501046)(5005006)(13015025)(13023025)(13018025)(13024025)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT231; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT231; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT231;
	4:Pm4UPJPGbErmebi6hdles1vFaLQ2uW1QVB0aeBIKCguiVsvmfT4sZ37WsYoZX/0VD4svN8MTcaW/2XV+TGJXBFwGJNnCQFHVNPZtpo3I66bAs11+wHC444dO701THcDIKq4Xno/ornAuILkBSKVXhZAuomODLIWZgrMTYZfnGPgoG6u/0Gtbcv9pSRQDzGACvrNRTC+Ao4B3XCcTj4Rx6dCZd6w4JnM7PmQUJCScgHEecwKBAj+DOW0pykddOZCmIRhNGN0zWMBIt565kVDFqDH3jv98/y9Dmx/DeUiSNkp0ZFr0Zo4ufsGogngpjVrR6G3Cy99oY5dJXLVKIQD5OhdPelXDfhtgU6teUPiUnHgJEoYZbv1i08tJxS63xmeB/K1DPgnS2Lja4Xaz3kZFzBusKdyXYlPeL/Tyv7LHSasYHouwJwr1+wdrBRCHvUUWd9w13SPoBkwJuAIa2xM6n65K8SR2/ISpocMm0W/s0X9+fwiTUepLscxndCv1TRikMl3LjabDYFeKJQCCq05UnpGsd0I5YltRIOhNzeEYtyg=
X-Forefront-PRVS: 0036736630
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; SN1NAM02HT231;
	23:LSDciOI7jvZbONPNgnBy792f7/BcRosXWztlY?=
	=?Windows-1252?Q?CfBbWYna31YSCFXFq8WCUE14Kjgs+WEVLCZI+minBtKtws2mF0uTW+IH?=
	=?Windows-1252?Q?DfFj5/M25h0WU50CBkpMVhwDkeS3oSF+Jw3aY8tfQQ7JC86fCK157Xx0?=
	=?Windows-1252?Q?pr8V4ReYQDTiVTrPfm8kGBnb32djknHsCWkv2bN8YLUbctbGId70FDAo?=
	=?Windows-1252?Q?akrBYghsWAKYT1t2dW6J13M0N11kNl4pBg3KKKp8kWvpQb7fEaGHkOwZ?=
	=?Windows-1252?Q?wXaTuXsvv8mUakkO9iOLMadIOI4q2M+1A2UL40p+62JMzvzatiIQO7g6?=
	=?Windows-1252?Q?zE3vdp2B+BnF2Rv7C12J5vMFXzcnHor1HTROAPOKc2JyA2jTJyOYCFBS?=
	=?Windows-1252?Q?P/ZkQsO14q5zUWIJ6AhHUuI1hIK+rlXMsAXYvUrBdJNDn/Vcj9yULPZd?=
	=?Windows-1252?Q?LLUIXV4iypi2WYwZwCjB6RePMHJQdIEs8F2ZDfC1Y5KdSvJtLDgb2rdi?=
	=?Windows-1252?Q?1Fij3McPDsdN5L1C1o6CZwQgnW5d+VjN4Byo0LGWRG0IjzDMQdQ6XEk4?=
	=?Windows-1252?Q?UqKbPpqwcgq1QQq17Sjm7mYPJkSTzefNRH9sQIgTZm6P/LFVFyUxG/un?=
	=?Windows-1252?Q?M+r1cjrOM+jIEXYLTc6RK3u8rCsowZ8LYcfgpJ9tyzkNYwqDViJVCvqt?=
	=?Windows-1252?Q?34iQw5kd7vW2Ufs8lhVLtvf9ySzAvkU35kvgRZYwbE0YSZDnCxL7PK0T?=
	=?Windows-1252?Q?muS5EsNbuOBxVdBcjqBEm3Zal1ag4nOqseweCIumvhBK5pxraa1HN/r9?=
	=?Windows-1252?Q?JTHszCErT7w+kUyxhbvHffGmy6pg470iUIPxns+X3RXhmNLrxVi01mlY?=
	=?Windows-1252?Q?2payeReHe+9I4+y3YZofT/8Q0BCx7YtJq/IIhWWl4S62N0kyHSvePcHg?=
	=?Windows-1252?Q?WkP6gxoj3IoWz6m0hK36XnGjC1q23Vgrgm+0wp4+Ky3tf+vBHDpGXtHC?=
	=?Windows-1252?Q?Y81Z/h3qVf/BMFj1uBPZoAaRz86TKRwVXoDb8WssvrNGLUfJBxi2PeJ+?=
	=?Windows-1252?Q?etg/1gsr+imtn35XyUXs9RY9U7vf+dKmIHq8fmIq2wDWdMiYu/jj+Z27?=
	=?Windows-1252?Q?yM3OcHCHZDR0Qlqqj6t8s1E6SwVWWtDOQNLAcW4Phkkgf2su/j9IWQdd?=
	=?Windows-1252?Q?Iqh67SDvf4F0UADUe0z1b4isbJTjKBwvC6LbZZKhhlj7UX0/HE7bt8jW?=
	=?Windows-1252?Q?fr7EYrnb0IoJYDIpL4qQ4qV7cNQqNDyFV8W+IU9iJJwdydFgxVD2rUpw?=
	=?Windows-1252?Q?02lHm6JuwuBOo2LI/c4wqP5D6SbwhLlonio59Cipv1l0n0y2uPQfW+gw?=
	=?Windows-1252?Q?+o41x7u78xKI6NQ5Rd8fYPezqwKAhLNdg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT231;
	6:t5r8bmO7GOMJ8nOQa8cw0xBpgg8Zvx2gNwhC9Zmfsfi8kX8qxV7cu/vv4is0scK8NHS/btbznfEyCaQkye1/PaQc8qtBXzh2mrIpTH2utddQ/vrb7SvfIU0UI++7l2e23Fr2PpUrKBkjUp+9/AsEd1XTIKIv/gubSG+S1KHOY43UnqgpHqTKHQ3woTXk6ekhSGKudiAg3K66fjj7QuIfqSS5KwcKVdQxk1SYBTbAQ5fSW8f6zR2PwwMurwip2sc8D6T1lKSLgymi3jcCzgtK4fV2WgfIgML6YGgc29DPTzD11Uh6+7/4XBgZBDiO+QJ3/NVQ+J24qXjkPzC+O9xR2w==;
	5:uCw+K51zGio7rX8gL9uDSauRk0nSewJlchiIzxa83pm6pBasORwbFehi7GAX/Eft/hMuwMnAOO72VcZ9Tdn+sFvFPMWvtFHfDzhTzjit8DDeSLDTXpsCXN1fqacaud1YNnQF8/jzGISw3yd/8pOoIA==;
	24:O+RtqG28g7fb+SsaycYenbY5pAflz0U++hwi6BFZ4Yl3Ih4hoMHJhxnsDy8WlB/ZFlpGsXIQf1JI/23cYfsuWRs7s7ghf2o3xxolbI42i48=;
	7:UnmipLgKoRphJ7AakF1KAp+eAfhanUQulZG+bz/8oACKR7erOCLZYjHs58fAqhPbKAdyFvYAXw4kICeXWP+8JVNRtX8XxAFqrDcreiL3Ie3IlFFF5x/69CsHSwDY3F+h+ymSi/chlgLsGnwH6oCvIJsn5XaB7x0qJ2kkV21M9UnXWlYrBOZLnZQwh+fbP0UsBXOMM21mI2BVjkRMIGDJ2jI8dhwpbJqHyBgOR5DWHlUyx0r4JDkMGgW9N6viq5JY
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2016 00:53:16.9637 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT231
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 16 Aug 2016 00:53:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/09/2016 10:15 AM, Manjukumar Matha wrote:
> This patch enabled out-of-tree builds for u-boot. This also helps building
> u-boot using EXTERNALSRC flow
>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 1f64faa..9e19c4f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>
>  S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> @@ -88,12 +89,12 @@ do_compile () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    oe_runmake O=${config} ${config}
> -                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
> +                    oe_runmake -C ${S} O=${B}/${config} ${config}
> +                    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
>                      for binary in ${UBOOT_BINARIES}; do
>                          k=$(expr $k + 1);
>                          if [ $k -eq $i ]; then
> -                            cp ${S}/${config}/${binary} ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
> +                            cp ${B}/${config}/${binary} ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
>                          fi
>                      done
>                      unset k
> @@ -103,8 +104,8 @@ do_compile () {
>          done
>          unset  i
>      else
> -        oe_runmake ${UBOOT_MACHINE}
> -        oe_runmake ${UBOOT_MAKE_TARGET}
> +        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
> +        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
>      fi
>
>  }
> @@ -119,7 +120,7 @@ do_install () {
>                  if [ $j -eq $i ]
>                  then
>                      install -d ${D}/boot
> -                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
>                  fi
> @@ -129,7 +130,7 @@ do_install () {
>          unset  i
>      else
>          install -d ${D}/boot
> -        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +        install ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>          ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>      fi
>
> @@ -143,7 +144,7 @@ do_install () {
>                      j=$(expr $j + 1);
>                      if [ $j -eq $i ]
>                      then
> -                        install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
> +                        install ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
>                          ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
>                          ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
>                      fi
> @@ -152,7 +153,7 @@ do_install () {
>              done
>              unset i
>          else
> -            install ${S}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
> +            install ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
>              ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
>          fi
>      fi
> @@ -172,7 +173,7 @@ do_install () {
>                      j=$(expr $j + 1);
>                      if [ $j -eq $i ]
>                      then
> -                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
> +                         install ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
>                           ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}-${type}
>                           ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
>                      fi
> @@ -181,7 +182,7 @@ do_install () {
>              done
>              unset  i
>          else
> -            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
> +            install ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
>              ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
>          fi
>      fi
> @@ -205,7 +206,7 @@ do_deploy () {
>                  if [ $j -eq $i ]
>                  then
>                      install -d ${DEPLOYDIR}
> -                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
>                      cd ${DEPLOYDIR}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
> @@ -218,7 +219,7 @@ do_deploy () {
>          unset  i
>      else
>          install -d ${DEPLOYDIR}
> -        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +        install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>          cd ${DEPLOYDIR}
>          rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>          ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> @@ -235,7 +236,7 @@ do_deploy () {
>                      j=$(expr $j + 1);
>                      if [ $j -eq $i ]
>                      then
> -                        install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
> +                        install ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
>                          ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
>                          ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
>                          ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
> @@ -246,7 +247,7 @@ do_deploy () {
>              done
>              unset i
>          else
> -            install ${S}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
> +            install ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
>              ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
>              ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
>          fi
> @@ -263,7 +264,7 @@ do_deploy () {
>                       j=$(expr $j + 1);
>                       if [ $j -eq $i ]
>                       then
> -                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
> +                         install ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
>                           rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
>                           ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}
>                           ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}
> @@ -275,7 +276,7 @@ do_deploy () {
>               done
>               unset  i
>           else
> -             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> +             install ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
>               rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
>               ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
>               ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
>
Ping

Is there something fundamentally broken with this patch? It just enables 
out of tree build for u-boot source.

Thanks
Manju


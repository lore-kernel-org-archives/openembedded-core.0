Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0051.outbound.protection.outlook.com [104.47.36.51])
	by mail.openembedded.org (Postfix) with ESMTP id BDBCE60132
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 18:16:17 +0000 (UTC)
Received: from SN1NAM02FT020.eop-nam02.prod.protection.outlook.com
	(10.152.72.57) by SN1NAM02HT016.eop-nam02.prod.protection.outlook.com
	(10.152.72.168) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.8;
	Tue, 2 Aug 2016 18:16:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; konsulko.com; dkim=none (message not signed)
	header.d=none;konsulko.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT020.mail.protection.outlook.com (10.152.72.139) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.557.8
	via Frontend Transport; Tue, 2 Aug 2016 18:16:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUeEh-0003IO-Kf; Tue, 02 Aug 2016 11:16:15 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUeEh-00044f-MM; Tue, 02 Aug 2016 11:16:15 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u72IGEpR008870; Tue, 2 Aug 2016 11:16:14 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUeEg-00044J-Ii; Tue, 02 Aug 2016 11:16:14 -0700
To: Tom Rini <trini@konsulko.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
	<20160728132014.GH5926@bill-the-cat>
	<CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
	<20160728134732.GM5926@bill-the-cat>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <b4c92879-346c-5b0c-e678-fe2eb922259b@xilinx.com>
Date: Tue, 2 Aug 2016 11:13:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160728134732.GM5926@bill-the-cat>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22488.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(377454003)(189002)(24454002)(11100500001)(31686004)(4326007)(9786002)(305945005)(92566002)(2906002)(63266004)(81156014)(83506001)(36756003)(23746002)(93886004)(106466001)(19580395003)(8676002)(50466002)(230700001)(7846002)(19580405001)(5001770100001)(31696002)(87936001)(4001350100001)(77096005)(586003)(356003)(65956001)(189998001)(33646002)(8936002)(76176999)(54356999)(81166006)(86362001)(50986999)(47776003)(64126003)(2950100001)(65806001)(65826006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT016; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT020;
	1:nWmXaj62SCJkDE7QiLloAg1HX6utqK1uUHP/HsXU0+j/Ssxz+wC4+chQw2gY9uM5tMyvh5IZdeMA/HFaIOyxUYdh9L9ZBGRlboUaF7TUv2A4465VieHbKSEYS/RiZjL1CuT1MMQoAxJkIRWFyfrCGC7K/DDCQxoKbRHygx07s9CvwNi6Y2FLcRviPS31pAh+IcX0Rm8ftrpGE+7zlDJRTyYYnkmCvspsrVJ4wo0wikm3gIfDnuz6VMVXdJbp5BkPV1TaqMj87B419Jit48uRMl+4+ABl1Fxpr7QllmCgMlBRkK5d5EI4YiMzYHYevjTeZI4rHaYUPWtJvcV8NBHbuT6BGpPFOHQZ7+dQHSngD0cmkNPr8yfqpwPmAAyk0pVhV3MfxoM62Az8yUSA10Roy897jH19sABH/VmH8PNieCjdaTFlc20a2dmRWfdixOPlP5ESFgdsv66sxmvi0VUv0AlUQXVidPB5qJP17aqP7glG24d/RbJbDP6Gtf7dYadyo7pkhDgQRmCXDugh/duL2r9TVQ88AR0/8ntqVZyqkpyiY8jnO1RfCuVHaM7XjQuq6Szba53rAyWJ/GvF3z3nQsL+OGi6UokcxM0ZLQKsoN0=
X-MS-Office365-Filtering-Correlation-Id: 39b46cf9-ac61-4741-29e3-08d3bb01184f
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT016;
	2:9pqL8aQonPlvY33auufumRjVhZh7tATJ9XYPuABGdI8jK6TJKW1SO7ce41VB6e2y4LPYSMEmU4vHTSJTkCjLd+XVSL+g2j/4cnj1710zrz2cF6WiI/8MCGTp6+TxlAacBpR+H6kAzHJD1GzThfefkoGlrUElf9O86MDKVoD+wstQm5EWUvWyALT+i0pcFYuG;
	3:yiCxkzh2wZExUMgnGTqXrJJKFNsDkpnd0190uObbxestq68Dq4G6yGvhoExu2mI436UM8ik3Lewqi+4QO9YYV79KD/Lv1XJUAXACvcfJz1cFsZuMQARMa5/VNpNX+pvO17w8wiAS1D3miGGZn6Ttoj7IDyyWAZN4qYyOYZzM3DOCB36ECeISz6T3RzBe5oaLhR0+LbOziLTqRMV30Q44JPTZHpxpD1lfg41gZMav24ySBk4iPek7l262cxJwbJW0KkjQMJe6wtEKuci59BDSgg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT016; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT016;
	25:IO1G7EsEnbS5w0SmOA2ZYZgBECxc6NooYoXn7Uv1QmeQnaccvT6qscgCKJX3b0q8kVndVWlOdslH2Y8pKeSBsI2b5RjaCaWqB6/wfPcgSpq9ytRMIrazaj/qp4/5k/hk20VftIWEaOWFr/dwchjYapxNprEZnuMkKf4DIsTW8d9lggZnCfQwvv00tRmDdh8guuAaPShN584C1hv9qxPMgHgOskEFMksXRT7nNzixvd6nHcNh4vLR+qADLrSrnyYlz2IW2vXAPfG7O+R3WYmTATdu3qE0OGQYX4+zDu6StGgCczwCNEXRARrUR46TjRG0kSn8P93uVGsjbvX0CQGPE+H6WzRgEldk4dGbr62JnJBqbCnnYGhLUH33dFMwP+ZlZML/QdqlioVW/PBQcjcdByj6+3wXzpUMCZ/DRhOEpBfqZVse5RKigvTibxXTTjmQPL3jO9cmah57khgTSmFo+hyz9E+xBqSlOhqf/H3pGgZFsnTf5gNoEH/oBFc2QfxoZB+jpG2+CYzJv+spKvnAF8L1Mm8nZLU3LyrNNU2m1zu/ZjUp5BlfUSOgnDYax4C54POtBuTAjm15B+EyU2T3V5b8qwEbRQq45hkbRB6S52EKp3inktiKp1dkQ6BWD60LtCfBEEWbOu2GBe/ujKzrtQQ02umVEnQpPNSxevFH9tSWie9pgD2qquINJ4ZoTfBSFk8B+svngQVHZX+mwQaFZyE+VMDu/GpCrWvX4za1qpMSVnK4aQ0+mp2bpLs3XkK3DAQcNlZ0j8z10C7yPNgaxfxPwtn3I92gOJQNzavY7cc=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT016;
	31:akhAON4jGpWEspRzuV7EpSQ0MdblMzCJpFqNDVW6tAS/XTajXkU38JL6Za4eZVFImPJbQXWRV1cWVb4KBUwISJ1UdeZkmcgjd9gIo1BI55TsuOIwWlNi+8OgZU1Ty4CHZVF3+Rv7O9zy8/9AhuaQK6dTEfViRs8nM4IbR/i7DC46Ngc+cScDPrNzAqdQV4WS1d2SJUlrNeHPXzvlILlrEZ7OiECe+47UzlvakLzSnfk=;
	20:rCJxraeAB4WnxHQUkI42R31NnwJACfONeqPhhKCFcIC6Ij4E+2IHPXWEaTIyjhYWL9JycMOwkNwjrDMFd32/pP0fDrMDWcuSZe9LL3wJ2tQbbn7fNX3KXYtTTJ30YmAgJKAkaj1yuFc4puyFcV832i8PzhAVIB0NZkDxqRoVWei+R0uwxDYdWZbvBLq0DESSSCY7bv/j1koW8wtzx4nIAikGx6psK0LsvXPrXnWUooPjymVCWfAPmQh1f9XVyue58WKcIncq2jys5AKr7OGJFaP/wFQlk2/5JEHO44619jJxz8oFCYOiDpaM1N52QlIFZJEQtWPoRK46+L6/R1PFPfLOdQrypj4KmW8A1pLoo9iSzozuCBpDSdGVRVNnWnxnHoa7wkpvB866eMZtRQjmJKTP0X4Nrq3Osd5Ndi9Js5OdPwn59gUWBcDxmZzRbQsyUMZHVlCBH1ZfsrYnz6Jr50pu2rjcRAkor6rIvjS9nAQC1u13XpPo5lAr2x49kAIq
X-Microsoft-Antispam-PRVS: <f0e3675ac1184f0f9f3c29c7ca8b2aac@SN1NAM02HT016.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13023025)(13024025)(13015025)(13017025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT016; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT016; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT016;
	4:mIIDE8AH2SQAVeaLdaRhoUSPY+38545DfuPIMPhgMIqB6r3VtSJe36RDj6LLFQjF57MEy0vAcOQTebl2eAN9CJfGWRvJIGArX9i7jBmxIxgQ9V99FjLv5SJPxhN18V5RPK65ezROS7El84QY4/c14zwP/T6sMrD7exnKRccT9tpg9vWEYDRPQ9mG+F6y49QojYqitLovfk97NTuzigYx0JNT+rnqWLXGsDYpEwaFv9PbQlQAET+1QwkycqrTPU3/HCrA8xs+UZXevMCpJRd9rxrRo9zJn3ByaOamWAf2R6JNzFqLuk46tqHIIOG9mv0p3vJkMGG6ofE8CFxo7YWRNebcpV+JOusrvt5wL0mjzQF1tJWNhAKMwUkwerLe4RZAOlpy6QMkKfv2bP1Q1enEnq30bwUVJuYh5LM3gfeQoh78P5oA3dUoEkfAPRzJUM+ihbDk/+ro12Dum7fB6NssKUErzai/HyRb8n1DxCe/y0Rl+dsrGJ5sVon/JLP3aTFp
X-Forefront-PRVS: 0022134A87
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; SN1NAM02HT016;
	23:nzZO59m/kHrA8ASZEQREiQERE3dTaahK8x79O?=
	=?Windows-1252?Q?QvfbBdr+NP1ngSATbfYO7ZNX9+xX6n68hWbX0syRWvm8JvUmzLBYsJJg?=
	=?Windows-1252?Q?GET3yeXX/o5pOMTCqS9zXGUz1BdeZwFiXd/KONKYVE/7hI4N7cYFHFvK?=
	=?Windows-1252?Q?URLSzp6TmJJg+wqANIhNcI6Hs3ubXkfvii7jbAcWWuatbKF/gi+prFSe?=
	=?Windows-1252?Q?8Q5INERkhMF4edQKDxXAxASjJ/fOEp7zFHeMlTaZ/4YVwzanE+8S3GI1?=
	=?Windows-1252?Q?ugiTym3k8SamZz4zXNZdbuHJa18B7g9HJmeToVS1C8JovZt3EvYKyvgH?=
	=?Windows-1252?Q?5EcNKH/OekoQNHALz6PedWTet3ZhoSko81UUsiRpxncIY++4uYtNQvVf?=
	=?Windows-1252?Q?duQXtuzX5f5FWeKbjoxqy+8cFXtrrdIz8U9p2r8uveAiUOyg62vgh3yB?=
	=?Windows-1252?Q?IwBJByC4k/4fYd369XgYcVU2hUDuSiP4n/R2GqJdA13/wG5vFLCRoWyJ?=
	=?Windows-1252?Q?7wWKyypEtnrBYSaCuHT/Fe/ynaLoo+0F8peDNiUhrkAJyuz846EQTsUa?=
	=?Windows-1252?Q?4rBSZ//CUU/G53n4wFJf0Uxt2m93C0B1lB/Xg1LluXjSxiiPTUcCsVPV?=
	=?Windows-1252?Q?n7zxgJ/G3YRzT0jB8ftf/ABJtJUtq1kU9NqfnF6Pvl/C9Qh4jLowC9mc?=
	=?Windows-1252?Q?Fawik4ahsPgnCsQAGrWT1p4/aDOXAl5TgwKnH7DJ/fh+jGIGLQS5Xcg5?=
	=?Windows-1252?Q?95szO5O+8OUU8EitaxUQUHB+uKZoT7oY9NsQloVs4zjzEO3nqdUf5OZF?=
	=?Windows-1252?Q?2amjdcvqDch6b6Sl62dXnrDgLPWwuxRi/LbXFdYOQk4rMPvdhsEuDVC1?=
	=?Windows-1252?Q?qTt4uXldF7J1ImCdVnKZLG7+vlPXPvjbOPfTLPB2Rzp58G71rV1TsAyq?=
	=?Windows-1252?Q?CR9S1Ff4NdYzJNeG20jXLl3nzrdnhoEWB8i64IaQgzLYV40cWB4RuDV+?=
	=?Windows-1252?Q?pGzM1bO9UJV8zsxikfnUMDOpnGQWn+90rSaD11W4BmdghKbyybuUrpSn?=
	=?Windows-1252?Q?6d7g4tCC/f83qoylsaDwUXZo0aF7RhtPs5DumnhHH8SUGyiFlrWZYqHw?=
	=?Windows-1252?Q?yA/NIXTOTz4P9KI2G3pBf2uOZeFCbFd0a1tXkQXUhUY3Muj8zhRfMDUy?=
	=?Windows-1252?Q?sEDNHgfK0XuGVjRsmztgdJLx9c8woDyLwzIcBPbfH2JepbIMEs8+MIj+?=
	=?Windows-1252?Q?axTND+UKxRcgceU8hqIjVP5oxJisLiX1hk2UuF4XyZObAM9jPxzTlkyw?=
	=?Windows-1252?Q?CB9TsXt9N3FiN/6NaIs3hpGPTbVm56LcXzqIkVzoA/ObNs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT016;
	6:yp1iJWFOz1uBLX4lq2QLtDNdOlFthLOviju9mdAi8q0QKLDjUF8GHWIEyBlz22Fc1ucUlnMwVpXmEvc6orNpDhmh8sbxaIPScTpbboiMh5VECe1zTN8+hyF545id1g9zMTn2WPNg2whEQ10r6Vgee8IwAW5IAyWRhptcykxqpp5a8UChsB/6gHFaG7j/31B4iSXXWKp18ys13DJD7dDLPNwNquTldmMewFA7AxWzEHPMw3H4JkgXN6SkQednDQARN77b7sxic0tOp/B8vpXVq4kV9ksXoftUYaZpVvEsXDjsq0YogMLcE1J3Um+1QHk4+Ln9GdIwhhS0Y6j3Vz3yjA==;
	5:GDb6zSb3+mcgSE26BngoixDECsnXuNGPR66PZZI1t6hc1YgsV5+TzPnAIR8Ed54qhGQIOsYkvbYDK1z59aPHfWIeiU4swPmmxt5TOwpU/kDwRAN/1W4j+ow2NhDZEuv65DXyWvicgOberThAmgYo5w==;
	24:rUc7Y6YpQUxgeFku2ok5A89/RvPeYlpSexqO6Vz+1jbV2+zSkDdNOIRr+nFU6nfkvNGiF+pqxiNTfQ04PjPdnYRLREVcWYceI/oRFYBxYgM=;
	7:VCIfv+GwELE8jAGzk3ULR/ybZcN4egwfr38TWHGqQg1TionlwsDGVL26Fsy/MPSznzi7Daa9MhuKzaBiXxGORfvXg9658/Edy7GGjCVDnLCwCXqb8FLeeZDLRA2WHF+0kpHL5UkHit942faH1jWbdfZD4DLIqBZhtkUlm1PGhkyKsxrD3Yz6bVka09gUne+aGEKP+EpO9rMjuxowXj68xukkIdVaQdqQqVlh+GHQBjZNjcxRdaL7+DI9z+knFpDP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2016 18:16:16.4386 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT016
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Tue, 02 Aug 2016 18:16:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

On 07/28/2016 06:47 AM, Tom Rini wrote:
> On Thu, Jul 28, 2016 at 02:24:41PM +0100, Burton, Ross wrote:
>> On 28 July 2016 at 14:20, Tom Rini <trini@konsulko.com> wrote:
>>
>>> So ARCH and a bunch of other stuff isn't set and things blow up.  Just
>>> how large of a -j value are you using here as I would have sworn we had
>>> gotten this problem fixed.
>>
>> 20.  Before applying the patch I did a build to verify that the patch
>> introduced no changes, and that worked fine.
>
> Can you do some O= builds outside of OE to see if it's an every time
> thing?  Also, what version of make is being used?  Thanks!

I tried building master (poky and meta-ti) with this patch, it does 
work, but needs change in u-boot-ti.inc (for do_install_append and 
do_deploy_append, changing ${S} references to ${B})

Git cloned ti-u-boot and used ti-u-boot-2016.05 branch

I added these in my local.conf

INHERIT += "externalsrc"
EXTERNALSRC_pn-u-boot-ti-staging = "/<path>/ti-u-boot"

Thanks
Manju



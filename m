Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0107.outbound.protection.outlook.com [104.47.2.107])
	by mail.openembedded.org (Postfix) with ESMTP id 14011605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LqGOs2c9GfmpGu/oy51C2enzxzzCtRe29RePKVtgxrY=;
	b=jb7O4cFeGnyXthkwsx8/Mxftst6ikEQb9c/vn02Le+RqHjAErZ1sqGTrEKB76KGRcyXkEXXUWmfcigH+FK/6NoEt4gyEUHQLueTh8zePqXZhEnAOAm6WiBUo+DcX7k3sWpiwJpolEYNmqC3yPSTYeRzz0sc/ove4lQdhqNzePj8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.16.11.2] (81.216.59.226) by
	VI1PR10MB0126.EURPRD10.PROD.OUTLOOK.COM (2a01:111:e400:c54a::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.715.22;
	Mon, 30 Apr 2018 06:50:27 +0000
To: Lukasz Majewski <lukma@denx.de>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>, Marek Vasut <marex@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <69bd71c5-a14a-2687-3f5d-52083043a131@prevas.dk>
Date: Mon, 30 Apr 2018 08:50:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427145139.30732-1-lukma@denx.de>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR05CA0229.eurprd05.prod.outlook.com
	(2603:10a6:3:fa::29) To VI1PR10MB0126.EURPRD10.PROD.OUTLOOK.COM
	(2a01:111:e400:c54a::24)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB0126; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0126;
	3:gZ/IgZoDEjd5cev2aJEhEPlhct+NskL5iA4FFwSg9XXA1cJ6KTen0CCWl6MWqMHf+nCY1wdfs/iTW+NQz6lwy4CCcKpQpPbXGFrFudDDWxSBQQr4SL3QXd/OOseKu0WcWEt+NXX9h8QsWJaWXIAO1hgiiedzJg+1ldb0D+8NHEOq18woNdFNAEmE3MmIcSGUZRrHNH8/RtUs9rkOR29lmVTzvJpdTkzt2428iNTjZLICLS9278yDrHATRsDb9uNQ;
	25:VnN6TcywdVbW+Aoywa+bRmBVztXuD8aELYtiJhPxE/nlgkn7XukwdnsAn1x8dnhFJjCA7OGAkPE7ThiI9PCCMbE9oeJzbM4TDQkg9jhtqUwKvJ+tKJ0oHbNCgeds7/0k/wBUOHUk4zHo4FPsBqSo5NhdEWMGLKgjouBpFsbf4dwk8ahjKmsgrBz0+DVk4BRgBgFp7aGv3pTVAmFuJRPLGc91Je5A6vOz66ryBqqWnkYXlIkhM5nhiIbuZitAYibDH9utSfaEAKYJOj2LMQ+c+GHkylp/DFeij4yKExg+4nePGFwupn+iH7+O0ed1AAtgAx0IszoWFKMwb49mbOg10w==;
	31:vN00G32dX7Lc2h7D8Nqx1bxFc7Tlcr3ATrdw48BUkLY/PYV3Ut4acNWe74YVnZExvIP20TroDPhRAL4w4Cxp2oA7o3oZr4x9e34K+QbxMoAU/kJDejD7FAL+lxeO2wbBSea8zp6FzAJvq9w3ewMiGQJkxhKUMFaAtOh9/hmkaTrfNOv9ON0Ft8AUccyzSsOtYLHVFLCKPmy/Z/Bvda56YFVQnCqDHpiFNErmw5IOY7U=
X-MS-TrafficTypeDiagnostic: VI1PR10MB0126:
X-Microsoft-Antispam-PRVS: <VI1PR10MB0126DE74E32DBDEA85CAF0659D820@VI1PR10MB0126.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(3231254)(944501410)(52105095)(10201501046)(3002001)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:VI1PR10MB0126; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB0126; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0126;
	4:bXqNpOEimWvVvqTjatD/2AHIWRV8lxYdQvoQ7RROVUnb7OUyfYWy0MaCQb39+YmWBTj5v1poJvkq2KR7DBXHIuB22uR1/cTZ8B+kMcH0qbIgRtSIv0nuuhHY5Y50n4CFCQ4bN+oy844lVD10+n2zYVlcW7awNyYZoTV7RpADcsuUDvhV87noSziG7RRa0OF0CnALBoNjq3oRTaT/AAzpGkVULBRN6q0HYrVS2chxPGczGQhBFGrP4uNEGkVEaNLitI1Qzy8JQFuuGAII21nE8Q==
X-Forefront-PRVS: 0658BAF71F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(39840400004)(366004)(346002)(396003)(376002)(39380400002)(377424004)(189003)(199004)(42882007)(65956001)(478600001)(23676004)(26005)(2486003)(6306002)(966005)(52146003)(6246003)(58126008)(316002)(305945005)(16576012)(36756003)(52116002)(72206003)(53936002)(54906003)(31686004)(77096007)(230700001)(110136005)(229853002)(186003)(81166006)(4326008)(31696002)(6486002)(5660300001)(50466002)(66066001)(16526019)(81156014)(8676002)(6666003)(65806001)(11346002)(65826007)(106356001)(68736007)(8976002)(7736002)(8936002)(67846002)(446003)(64126003)(53546011)(476003)(76176011)(956004)(2616005)(47776003)(97736004)(386003)(486006)(3846002)(2906002)(105586002)(74482002)(6116002)(25786009)(59450400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0126; H:[172.16.11.2];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjEwTUIwMTI2OzIzOk4rMlh0eWo4WlZyZDhEZDQrRVV1SElWVkZk?=
	=?utf-8?B?UW4zMCtLZExUK1FCTmJvVy9PTmozeVgwM0JSd1cxclgrNDNTeG1wUmlPZ2cz?=
	=?utf-8?B?WkEyVU1SRlFDT2t2c2djbThRVUlmcUlxeUZGNlNvQjM5c1hSNjc5Z0ZSOGZ1?=
	=?utf-8?B?U1N6ZGJNcFN3SGlGckxyd0VpZEZ0U0xiNE00dFNNMDFJK3J3YU5xM29UT3Rz?=
	=?utf-8?B?UDJOVWRpTlg1bDExM2lHclZlQk1McGhyTWN3YnBCcFZhdFlPYU43cEhBd24z?=
	=?utf-8?B?ZUE5eFJYbnAzbnFjRitkaUFMcEk2elhFeG1LSVcvcy9OMG5rVnYvbjdVdUNx?=
	=?utf-8?B?bTRZcDNJYnZQMUZ5QWJPdlpYQTlpQnl4SFpUOUtRY2EzdDZrV0FJU0ZHRzBY?=
	=?utf-8?B?VG5HYUo2aktuajl6eTZEZHRvcmh0VjJjbndDY2hPMWpqMnNIcDJLYjdwTlZC?=
	=?utf-8?B?eHJ2ajRLOWRDOElVQTcrTjZNOTVyRkJyc1V0WVRJcnJZcGFjYVlZMEZUSVJp?=
	=?utf-8?B?ejVlZEJnTXUvLytwQW9WaDlsK1RSY05nTncwWXE1dDdZUGVsVFlTYUp1VnNi?=
	=?utf-8?B?eWV4OGJkVXl2V1RpVEdiRDhpUy9QMG1GZDkzVGZsdVkzVXJ0aGhqTHliNmRI?=
	=?utf-8?B?a3BRWFlwYjJVV0VxTFBJZ0hqeXNIckhzOVZrMUk1V2xUSDhPZEJtb295cE52?=
	=?utf-8?B?UVViWFdRbjJLZjRQODA1RnhvL3FaYXZQR1IramoybnJXRkRVR2d5SzJuUG9z?=
	=?utf-8?B?K1cybE9YMGU1RCs3bjkwc2VXWmM4RWt3eWg3QzJoRHRreUVybXFGT3JWV21X?=
	=?utf-8?B?Ym8vRHBYZUd5YmZnbEJSMVMvT3JZYXpkSnF2RmlVSFl4K3JYMS9ZaEhuYzZh?=
	=?utf-8?B?YU9kZk9rVXo5QUYwYmpWN2haNDRoUkZOTUlMSDllbFF2ckR1SXE3L041NDdV?=
	=?utf-8?B?STAvY3dRQ1M2WTkxcHdZQURCZFJxUnJvTHR1aGJEQzB5Q0JTV2FXT3dLWmZ4?=
	=?utf-8?B?amk5N0Vvd294SzV6VC9CSWFhSGozTDZrWEpsTXJxeWFwRDdtZUkybmhSTUNz?=
	=?utf-8?B?YU9IM3VyTmJGWDVBbE5rQ2tsR2RNeFNjWDhOY0I2WWI5enlscmJ6WEVHODJl?=
	=?utf-8?B?eHQ2M2VlSFBHWUUycUJHYmFkdkVTdE1acGQ0RjJhUzhRU3VrbldBUFVjTkNx?=
	=?utf-8?B?N1pjMUJrSGN1WnNaUmtla2VLaXRPNjJWeTNjN3VsQUdEdHdDZHFKV0UvRndh?=
	=?utf-8?B?V2FOcW9mRER2TExCWXd2dXhhaWVoSW9Sd3VTbVc5clN0ZDVzUDZEOW5XU3JP?=
	=?utf-8?B?L3Nob0Vpb2oxdURHajNRNlFXVDJKSDlTbDBtUHVnbTUxUS80Q2hIbVpLeGxG?=
	=?utf-8?B?TjhCSVhSUmJ0ckVwaTdFaGJKcWFrdmtvNHRvNVZRcHM2MHYxc0ZOT0hvbVNM?=
	=?utf-8?B?emNBUnowQ0dlTFJaTllOd1BCUitCWEFSd2tsTXc0dXB4UWVVMDlDcXd2OGNn?=
	=?utf-8?B?MmNTZGVhd2RMTDZmUGpKbXAzTDZxWjV0dEtGL2NEZDA5V1UxZ2Yxd1psZ2hu?=
	=?utf-8?B?TFk2aWpBbW1YVlJaTkNzZzhtS08wR0U5U0JENmt2VG5FZXRwZnV6MWo5MUM2?=
	=?utf-8?B?YkVabFNHTjhzWlBMazNCZ0N1ZzJQbWk4dmszNEZVM205RmQ4VVgxQnN5YSts?=
	=?utf-8?B?bWxkSVZ3WjZOYjF0WnBxdUkvOC8vVnFkTDBzY0JacU8vQTlRSzhScGNuUnc3?=
	=?utf-8?B?MjNhZ0ptR3lvaStTTitod2d6ZlA2TU5nbVpOVlVHYzNVakVEbGZvdVJlc0dz?=
	=?utf-8?B?TTd4VkdmMTNCeFRLckJCNXF6R2kvMjRDeW9XWXFiRm1id0ZKbDBqUS9aNkZj?=
	=?utf-8?B?SXk4ZitkSk80cVJMTk9RZWxDN2hTcDlNMWJrTS9iVktVb3BqRFhac0twNDJj?=
	=?utf-8?B?ZkFmRlM1dFdnbFVCL0JlelVDSzMwNEdrN1RySUUrZGg1dzNIMUlkeEFzdGtU?=
	=?utf-8?B?cHhyeDhZY2pJdE0yZmpzb1hQMVEvdVpmcnZoVFVTekNtbXk4VUtoUHJDamxa?=
	=?utf-8?B?Q1ZnRElJYm9TQjlCeUZ1VzRqZDBDMnMxUkRvMVJKL1IzcHRCYWlPM3Rha2xZ?=
	=?utf-8?B?bFF3Z0kwUEsxdXJXeTU0azZRMlpHZ0ZJOXZpSFVqN09RRS9INDNmN1FybFp1?=
	=?utf-8?B?TkpRYUQvQlowdG1XdUpWNzRTa3hnPT0=?=
X-Microsoft-Antispam-Message-Info: FWkB+f4vjGeKv4cJ+yOCxQzX/CF7n6pYWQKoxXupWHa25VF1tNKpQVanQu/mB/7fTFYLxP4/uQQlEv9U5esxFfCsx4c5nPstGs5o2YMkMCZUtvdWyC3I+T13wyziB1LORJeyP8xHnmkCygpXyVKPaRV4EnkK7PVEkRuOZDtSqSqi2xSyTI4UNegDNpqBOqBb
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0126;
	6:3Jnf+qet67SnZ0DYZVi50yKAy1MoR82OPDwRmTPCIO/jkyx5E2EP3p5ayW0UkbM67Ieck8flmQI0Hd6MmWrJt91RyWYKYhPgtCY2uTgeX07e0nPZNeQdtdKXfqk+2QRsXvGt3n/75Yc5Tx/uAHXaWDu4ZprhOOfuCCJrglD3UGpR69ZbAJrIZb8V5mO6BQbEvnbC201MkVbVU2TK0k6c2gAH2f35gZy/KQgG7tuTMZvw+qNnG8pgmqQdE5qzeG/eItmRKy5sTrCAp8DzPRD/4xo2ONja5W+N5+PGlNrR9jUXuSbHiaQ2jVF3jmgqO1+LV/Ar6Mjs05C7PN2d9gZUysRzMRjgWcs82pyQ7IeXyfvcswa4Slhgvae0t5dXY5T8FVLapPq30Tytg0RTQSxQiJv3R/dD9sr6OvIKUs94dmm0KsHKZM74KlNmwhuetXUkjSi2c4S7L2TjrU2sX2xRDA==;
	5:jJYrCM5+BmtXcORoIukGYOWmmSzNjgPoP+YFwp0gxGyyFxLpwsChvIc16ONOoxiUNo/XdrCF0Uy7v9TX8nSDA+BkEaL49j155z34immV4rZJF+XQJ0aVsLs19Fjpv2qit2jfMTcGfUAi/C5Ne2a2vV2CebqJW9oH8UfEuoVOWiA=;
	24:o1SNc8nP7FYykqrx5m6mLNKHjeL0NKYzDwnoGFKIGW662VKVfztR3riunMg9WaaB1LjUmP4ZHEBqf6DCSYYBe20YgDfDMg8dRubfXYQHKu0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0126;
	7:gUYSPFaVgQhu/1RuI4CMEFKUblIhyE9UN2J7oT8hqcwdqVeVvzSa09KZ8P5hqgUfu8wriFv9T0C8tNG7+K9Gk6OHaJQioaY9huFRIirrLB/w9kKASqujAht1MT0RsANIsWykqLsEfGRZdO49qZfFbLSmOIjxvXPDmUPJwGoW2R4DDFz3uOQ3I4/N4YGTxKxu6jD/sYSkQ38zEh8Si5PPY7wb7oPsNXRNN+HW2MHDXL6VO1a/3hkXMUfm1jZ48VRS
X-MS-Office365-Filtering-Correlation-Id: bc04c2e2-1f30-484a-0753-08d5ae66a8a5
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2018 06:50:27.7390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc04c2e2-1f30-484a-0753-08d5ae66a8a5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0126
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
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
X-List-Received-Date: Mon, 30 Apr 2018 07:06:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Lukasz,

On 2018-04-27 16:51, Lukasz Majewski wrote:
> This commit provides the ability to generate u-boot environment(s) as
> images, which afterwards can be used to produce image (with wic) for
> flashing (eMMC or SPI-NOR).
> 
> This change removes the need to run "env default" during production phase,
> as proper environment (including redundant one) is already stored on
> persistent memory (the CRC is also correct).

I think we should create a separate recipe to install the native 
mkenvimage binary (e.g. u-boot-mkenvimage_%.bb) or update 
u-boot-mkimage_%.bb install it.

Then a new recipe to create the environment images can depend on 
u-boot-mkenvimage-native.

Also note the recently added upstream support for external environment 
definitions:
http://git.denx.de/?p=u-boot.git;a=commit;h=f3d8f7dd73ac5dde258eb786d4a01869395b56d7

For our usecase we need the ability to generate environment images in 
yocto from such external definitions.

// Martin

> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> This patch depends on "u-boot: Upgrade to 2018.03 release"
> https://patchwork.openembedded.org/patch/149998/
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index c2bcf99840..2796e503cf 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -305,3 +305,38 @@ do_deploy () {
>   }
>   
>   addtask deploy before do_build after do_compile
> +
> +# Create new rules to extract default envs
> +UBOOT_ENVS_DEFAULT ?= "uboot-envs-default"
> +DEFAULT_ENVS ?= "u-boot-env-default.txt"
> +DEFAULT_ENVS_SIZE ?= "65536"
> +
> +# Generate default environment
> +do_gen_default_envs[doc] = "Generate image with default U-Boot environment(s)"
> +do_gen_default_envs () {
> +	${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS}
> +
> +	# Generate env image
> +	${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
> +
> +	# Generate redundant env image
> +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
> +
> +	rm ${B}/${DEFAULT_ENVS}
> +}
> +
> +addtask gen_default_envs before do_deploy_default_envs after do_compile
> +
> +# Deploy default environment
> +do_deploy_default_envs[doc] = "Copy images with default U-Boot environment to deployment directory"
> +do_deploy_default_envs () {
> +	install -d ${DEPLOYDIR}
> +
> +	install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> +	install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
> +
> +	rm ${B}/${UBOOT_ENVS_DEFAULT}
> +	rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> +}
> +
> +addtask deploy_default_envs before do_deploy after do_gen_default_envs
> 


Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0115.outbound.protection.outlook.com [104.47.2.115])
	by mail.openembedded.org (Postfix) with ESMTP id B922575457
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vLQ6gGpZvcBjoNKNTlXAnBqwH9Rrj2kX6iMwXYCssYE=;
	b=aSjALc5rtkqYZDMNQYb785q3JKGI2KE3jq4LtS4zrypjGJoy2yearrBeHmuxlHWXWWfGxLI+s0nVd+L3d2EHVjWN9I4j3oaALyzxQ5oSQH4shW3FmdIVn8uXP6DXyMDUxYtGN9OjBQDN5vSqXuCTgQr5/UcV9NpWtrLzZrsSA1k=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.21.2.157] (87.54.42.112) by
	DB5PR10MB0118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:0:15::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.631.10;
	Fri, 6 Apr 2018 05:52:14 +0000
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
To: openembedded-core@lists.openembedded.org
References: <20180405104813.10173-1-nathan@nathanrossi.com>
Message-ID: <8282f9a3-007e-2936-faea-80a76eb8b4b2@prevas.dk>
Date: Fri, 6 Apr 2018 07:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180405104813.10173-1-nathan@nathanrossi.com>
X-Originating-IP: [87.54.42.112]
X-ClientProxiedBy: HE1PR05CA0233.eurprd05.prod.outlook.com
	(2603:10a6:3:fa::33) To DB5PR10MB0118.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:0:15::25)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76e215d-a65e-40db-8f11-08d59b828c5a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR10MB0118; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	3:/mjBZQjHRabi4sHPVLxp6utewT0tgXSKTaN7n3KskxnUuS4zLHbzUxgwcXtBdP7lEcZUl56lg1j9sfKbJ6a88rPRUARKbu1QvORM3BepgZFywDJp8rYGuelFw8cO8ozAAkTpcDGyqpTrCTy6fad584q02FZNY25K3wIYc+WrQpVmaJ8YksrY6UVZ57GHzjSzDhZTJ3EA2q8quPdDFIRJACKEUU0HXMIX8VUvdbKTv2R/13Sld2pspsRmmfFRx96o;
	25:Q33qpjif7jNU2+DlYWswLZuQnpwSjYGXyagGmH8ZvGww1RDYufFf+NrM2N9TwvK54K5+UiV6lJZpVKwHi/FJjD8BY6k8N6Pl49AGIhuxcbTxxBgoga8AJJJOaGzP6MhdRYYpZqHsPcPpD3+hEJCkkGrLNKg8TVPpNiEXsYdvcDFRU9okJUSos8Supe3q1WQCnVvKwm6daxALjSmQNZgXYgeYpO0gfYSG2MRkDZUTIIcRYeQrJpjH3olzTg02Vz2nIuMIwY3Sp0qh5oF/19rwJi9f5N0uTRlHplSJfznJCnzMKjdpzX0Pd9u8sZY8vb4If/SaYnW4wIQLQOki3jCGbA==;
	31:3klgakUNwqlIYjSZqD6/369AG+L9XPfsfOcLLmC5udWkzFHNUauhI4ia22RqXNGlYx/1oDfKgEwze829DHQ1s/WdFug7jNcpXVsbYXt3ioLyteDvrKKkAakbiPnbkLQT5UKjkOBKP5VGPWsZmU2qPoc1WQmF/lv4rESF1RhAiW/6NTOCO5l08JxjomzRhbUKMN7d53l3y9vSEnBjbJRwhcu5udN2sHqud/byWz5Zh9k=
X-MS-TrafficTypeDiagnostic: DB5PR10MB0118:
X-Microsoft-Antispam-PRVS: <DB5PR10MB0118B113BFDE8D23FCB2A0EF9DBA0@DB5PR10MB0118.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(10201501046)(3231221)(944501327)(52105095)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:DB5PR10MB0118; BCL:0; PCL:0; RULEID:; SRVR:DB5PR10MB0118; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	4:cHnOJyYfIO4ut6sBqcLOMFZLrtpmVe3LCJIn9fROTpuwDnGzYk09oeTCJEq0zAbwOcYLUlACZLbFxKv/Mvy+XPMSs3ZhRlLcS4mwIaF5r41/HY9FlL98v86qQinx0WQ5RhXFzZF6SeAhvpMZM2os7YNYYW7CQGGs4OyLp93iYgh1478e7qGS7TolVhARM2tRNBsxz3IN1d4wQCoy2uHt1zEVe92avXs1AcqYYdTFabEEqsgkFoLDCT+gc/19smOLkjyaQrKNot2BY+dy92Qg4M7IHBK8FxNUKXsh9Tk0mFLGCch+Lpx295U7gxuLeD0f
X-Forefront-PRVS: 0634F37BFF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(39380400002)(366004)(346002)(396003)(376002)(39850400004)(189003)(199004)(377424004)(52116002)(64126003)(6486002)(47776003)(25786009)(36756003)(105586002)(7736002)(6666003)(68736007)(65956001)(65806001)(106356001)(66066001)(229853002)(31686004)(6246003)(97736004)(6116002)(6916009)(478600001)(305945005)(966005)(50466002)(81166006)(72206003)(8936002)(81156014)(2361001)(65826007)(956004)(16576012)(8676002)(58126008)(8976002)(3846002)(486006)(316002)(5660300001)(11346002)(6306002)(53936002)(53546011)(23676004)(2486003)(2351001)(67846002)(386003)(59450400001)(2616005)(446003)(2870700001)(476003)(186003)(26005)(15974865002)(42882007)(16526019)(74482002)(52146003)(77096007)(31696002)(76176011)(2906002)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR10MB0118; H:[172.21.2.157];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjEwTUIwMTE4OzIzOnpSYm9zRW5LeTFPdGhIY1hqQkd6R3orMWxi?=
	=?utf-8?B?Snp6WjgvemI3UEExY241WFdzYS9maUNUdW93N0hjYyt4bjJ3UnRXZUhST2c3?=
	=?utf-8?B?Z2VzaWNEZTV2UTQvd0I3VGZiMUNtZU5vaFhQek51dmRZUjUxSGwrSkNlWW9E?=
	=?utf-8?B?UnJYQjR0U2cwVUVqR2RrQVVTTXlkZC9haGZqVmNnMEtzNWczZEU4OFdjNEti?=
	=?utf-8?B?R1pYZlFQbmxoRVBhbG1QWE80ZTBvNUtMZUpTdkJwUEpRTWpjN1UyNlR6a2Uz?=
	=?utf-8?B?RCtSbEtud0tMZWs5dWk1WGpFb0gvazIxZ3R1by9tOVZjVUxCcDQrRmprVkJ5?=
	=?utf-8?B?N1pSOFMrNGVxNzV5N1M4dk9mL21ML0VUaTRUaSs4Z3h5SEpzbzZBdXBpem14?=
	=?utf-8?B?TmpMaCtKYVpHdVFXQ1dUaktnc3RldXU5N2VNV1dwRVhMRWRqMTJrUE9LQUEz?=
	=?utf-8?B?SitmbnhWYlpvZnRZWmJIWFE0VHU3ZDlxQ2txdmRYOWN2SStjVUlSNXRjU0JZ?=
	=?utf-8?B?ZFJGQVZuN1I0MUVLdVdSd1FsVUVqUUxYa3ZwLzRuRFdVazhGdkVndDlTZTJz?=
	=?utf-8?B?Wk00WEU3VENkSzJic3lDR2hzV2hzazNydEw5OUM5UGZaSWd1d20wSGFEaEFv?=
	=?utf-8?B?aGJlNE05SmRCUng4UlphczRLMEtUdTdQZVlIZE56REpqbEgxTnVjNWV5NGJt?=
	=?utf-8?B?SXg1Q1BYdDVWMVBoSGNGSlpBTGpMSWppaldTNWFhZHBjMEgzL1pkd3BBZ1N4?=
	=?utf-8?B?aWN1RW5JazhXTTdaNHphM1RjMUk3VkpNVUZubnRSY1RkU1lsNGp3Z3N0QmU5?=
	=?utf-8?B?QjAvT1pnNUdkTUdNK3R0bytJaXp0dzVsVHJBWGdNZFpXOHJyZXQ1OHdaamMw?=
	=?utf-8?B?TXhJbUV4MkdRSGFsQ2cvcytzNkFaZGptS1E3aWIvZWJuWW55NWY2TnUxcFVQ?=
	=?utf-8?B?SThEZkk5VVpWUGZJV2tYZ21DMlRWL01xek1VQm1EbmVodlJJc3Nrb21BU1hl?=
	=?utf-8?B?ZXc5T2FBZkMvVWFCRld5TDJKbDh2cEU0STFMQ0k4RzRpV1E2Y0ROdDFvVmdh?=
	=?utf-8?B?SVZpQWZCYzlDYU81c1R5enVjbjhiMmpJWS9YNWt0dGFCOFBOYUhHV3RrYXZF?=
	=?utf-8?B?V0N4MVZiRXhTR0VsMzVBZitmaWZDR2wvU1p4NTNPL2NnQldhVExpNHBmMzZH?=
	=?utf-8?B?dTB5VXMxcHkwbXNZWlgydkJuYXh5RWxTUGRtam1vTnI1QU1MQzFDTEdDSmcx?=
	=?utf-8?B?L1VYaWd0aXAzdm9ZOFd6RzcvZVM1QVVTcFZXN0ZscSsyMU9ybWdtL0dGdk1y?=
	=?utf-8?B?UWJ2aFpHU3NTb1l1UkVKcmh4aDNURDgvbGN5cnBIVXhHQURpRUZ3UndTYk9E?=
	=?utf-8?B?T0xGU3VhNmJtRnpHSDJUbEtDZEZEODhBMld2UG1BTFg0c2RTR1RVY3FYUDFo?=
	=?utf-8?B?aG5aUjJSUCsvdG5XN2dwbXRidEs1TDZYUVh1bmp6R2tuZnlGemlza2h6SWla?=
	=?utf-8?B?STV4OENOOXVQbDB5VTVRWktoR29sa0xQWjErbm96QXFGY0t5QnVTZjIyRXd6?=
	=?utf-8?B?cVd3ZUpuWWJmTis4bUIxZmZ1bkpiOThXQXlUc3VKS1NNZ2JaVkgwcncrRmZh?=
	=?utf-8?B?MjJXeXlPUjJ3dkxwbDVKTDhRdHNMMEpUYUo2NmgyQU1CLzMwU2d1Nlc5b04y?=
	=?utf-8?B?UmlhN0d3VnRiZ1liKy9nc2c2UWV6d1VNVkwrOGFxSXFZSmxxMFRxeWhxcklQ?=
	=?utf-8?B?bkRZc2R5Tkg3ZjJMMGduVmExbGRLUUxrSDVjTFphcTM0TzlGbk5zWWtHNFlV?=
	=?utf-8?B?bEhzOGJyOE1STFFudCthN2hVSGRNcTk5YjdMaWVITUdyazhRZllwc2JKQ2dr?=
	=?utf-8?B?RkY3aXdXdXpDWk10RXpxVjQ5cXZ1NXVlYUFWaGxaSUJzMTd1dWpIQy8wcmJo?=
	=?utf-8?B?R2REMHF5MGp5dVR0TFpSSHQ2dXlBT2J2WE5JTEJJYURENmRLRE5ML3E2U3Zh?=
	=?utf-8?B?cGJ4TWI3dElueWp4R0NQNS9WWkRiazRnYm5kdEtpSkRGS3VYZXh4djlBRWxG?=
	=?utf-8?B?dFp3SG0wQTJRMzZ4ZDhLUGV3TmVNRHA4bXZzMU1vcmk0QmpmQ2d3SGdJRGJs?=
	=?utf-8?B?emFWUytQVFExYlYwMWtDRWFPazdZSXp4bG5xMHFuZHloUHZBMTMzdC9HeWhr?=
	=?utf-8?B?R3ZKY0QydG14NU13ZWNxcUs0bmZyRVZZcWlkaDRNeGxpSkp1Ymp6WVJRSDdN?=
	=?utf-8?Q?SAsw3phjOAabvdnO63?=
X-Microsoft-Antispam-Message-Info: wfzyrwZfycapMWbFhV0rVsKAxWZ2xIWVk5ZvZ5mjMBwjEgGXew3LPIm2zt09xuVO4zb5FgJ5Wmi4dNMo5gLhjO9yFvf8d4/cem0P4GkqPyxGZXmpqKa3TqPb1qVHU8uiMHfGIfrj6XmbxfimHnxpJyK5CADyanVlafni8WNXTcNrp9sHstCHbOvPGTIWSaeh
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	6:BVPAqBgnTgXKeC8akvq6VgdtRAmefKfXWhvMu/LOno8Oz1UCMO3RStemzD1VZmvlcrgzrb2N9CdiBWuBwK+48OooTIQ46mCWB7HsVh0skI5jnN6WvIORnZPOyihQY/FKfhPIzn9DndHXCmmgpcAI6uP1wmaDf8RgO7N0rD8LlM4cZo1xHmg720vhs81b+hiECRpOX5jTUmkm/GG0MXYl3Ca95XJuknDL2ntT1fJdBiM0goX1NPZwZ5xEr+tyjLdzlzZhh3KLAj2NUrzvOYMhZ6GP/xt/qw3vx7p0ZoGwyB3jyJ3bjyiI3qZxj/JaU6IiNZTuupgTmS1Yk8F6n3ZaHGaSUz9Yz3979nyi0sOGq7+ntJE3JOsALtze23rK3wR6928rOLfDMVBE3cWERRDh3Ycg7bjxaQoWsaXVlhyfZ/q79vpo2x7OT+bmTQkjmxSPI9tghZEHGKFN0lbNd3CGGw==;
	5:W6ZSYI9qSh1YdSBsvjlPpRYbJ6j0byryekKin30GZBDusicF3Qd8TTzFe4Y28ArCMSlCOTIStqLPz9Iov9NgTbippeXdK3jR3cCWGC0T7I949PHy0zNHKRyBflFPOCkvNKMex+gwuLacPMAYhZ4mfOcF62FxMwzBzd+4ScSt7Ws=;
	24:3O1Y2OrEtQAtOy+H3u9Od8gylIlivvQaIu227JGnNrSw+VpAGuReypL2ZIf8iQgK2XsbsRH25bwD8VcqqE0rKN6wpjSU3pfavbNPoyS/KrE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	7:emK3ECy+6BB1Hq3h3GaDjjgi8yLx1JTWOolF6g/1E4+3zelnHNinme0R7kenLEjrGhUWP/0xl3k6qoMnWdZEnt7i/yU82ZDEBGFeYKq4DYnU8aKnldbgCc7J/v7n+3+DgsvBvbMeDVEE/fvu1PBMpqrgGaeFr3tTOxEtSZjQd9N+y5vdtFp74Bk1orXdVRc+H6UiUDbb0wzQaZCxJm5cBFlVIJHHvuDMDGQ9WxU/LwrUuW73UNwGaoHnt685+0SW
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2018 05:52:14.3248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76e215d-a65e-40db-8f11-08d59b828c5a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB0118
Subject: Re: [RFC PATCH] devicetree.bbclass: User/BSP device tree source compilation class
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
X-List-Received-Date: Fri, 06 Apr 2018 23:26:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Acked-by: Martin Hundebøll <mnhu@prevas.dk>

Thanks Nathan; this could be very useful for us.

// Martin

On 2018-04-05 12:48, Nathan Rossi wrote:
> This bbclass implements the device tree compilation for user provided
> device trees. In order to use this class, it should be inherited in a
> BSP recipe which provides the sources. The default setup enables
> inclusion of kernel device tree sources (though can be disabled by the
> recipe by overriding DT_INCLUDE or KERNEL_INCLUDE).
> 
> This provides an additional mechanism for BSPs to provide device trees
> and device tree overlays for their target machines. Whilst still
> enabling access to the kernel device trees for base SoC includes and
> headers.
> 
> This approach to providing device trees has benefits for certain use
> cases over patching the device trees into the kernel source.
> 
> * device trees are separated from kernel source, allows for selection of
> kernel and or kernel versions without needing to explicitly patch the
> kernel (or appending to the kernel recipes).
> 
> * providing device trees from separate sources, from the layer,
> generated by the recipe or other recipes.
> 
> This class also implements some additional features that are not
> available in the kernel-devicetree flow. This includes population of
> device tree blobs into the sysroot which allows for other recipes to
> consume built dtbs (e.g. U-Boot with EXT_DTB compilation), device tree
> overlay compilation and customizing DTC compilation args (boot
> cpu/padding/etc.).
> ---
> This patch is an RFC for adding devicetree.bbclass to oe-core. With the
> plan to submit it for inclusion in the next release.
> 
> In addition to these changes it is my intention to also submit
> documentation to the Yocto BSP guide that covers both methods (kernel
> source patch and this bbclass) for how to provide user device trees for a
> BSP layer.
> 
> The meta-xilinx layer has a recipe (device-tree.bb) that behaves exactly
> like this class for some time. It has been very useful for out-of-kernel
> device tree compilation as well as for a mechanism so that users of
> Xilinx SoCs can provide their customizations (FPGA devices) and board
> specific configuration. This compilation flow also makes sense for other
> BSPs, which is the reason for creating this bbclass for common shared
> use by other BSPs.
> 
> Examples of this classes usage can be seen for meta-xilinx:
> https://github.com/nathanrossi/meta-xilinx/blob/nrossi/devicetree-classify/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb
> 
> And for a custom BSP:
> https://github.com/nathanrossi/gps-clock-project/blob/wip-devicetree-classify/meta-gps-clock/recipes/device-tree/device-tree.bb
> ---
>   meta/classes/devicetree.bbclass | 140 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 140 insertions(+)
>   create mode 100644 meta/classes/devicetree.bbclass
> 
> diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
> new file mode 100644
> index 0000000000..dbc83f2a1d
> --- /dev/null
> +++ b/meta/classes/devicetree.bbclass
> @@ -0,0 +1,140 @@
> +# This bbclass implements device tree compliation for user provided device tree
> +# sources. The compilation of the device tree sources is the same as the kernel
> +# device tree compilation process, this includes being able to include sources
> +# from the kernel such as soc dtsi files or header files such as gpio.h. In
> +# addition to device trees this bbclass also handles compilation of device tree
> +# overlays.
> +#
> +# The output of this class behaves similar to how kernel-devicetree.bbclass
> +# operates in that the output files are installed into /boot/devicetree.
> +# However this class on purpose separates the deployed device trees into the
> +# 'devicetree' subdirectory. This prevents clashes with the kernel-devicetree
> +# output. Additionally the device trees are populated into the sysroot for
> +# access via the sysroot from within other recipes.
> +
> +SECTION ?= "bsp"
> +
> +# The default inclusion of kernel device tree includes and headers means that
> +# device trees built with them are at least GPLv2 (and in some cases dual
> +# licensed). Default to GPLv2 if the recipe does not specify a license.
> +LICENSE ?= "GPLv2"
> +LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +DEPENDS += "dtc-native"
> +
> +inherit deploy kernel-arch
> +
> +COMPATIBLE_MACHINE ?= "^$"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SYSROOT_DIRS += "/boot/devicetree"
> +FILES_${PN} = "/boot/devicetree/*.dtb /boot/devicetree/*.dtbo"
> +
> +S = "${WORKDIR}"
> +B = "${WORKDIR}/build"
> +
> +# Default kernel includes, these represent what are normally used for in-kernel
> +# sources.
> +KERNEL_INCLUDE ??= " \
> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts \
> +        ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/* \
> +        ${STAGING_KERNEL_DIR}/scripts/dtc/include-prefixes \
> +        "
> +
> +DT_INCLUDE[doc] = "Search paths to be made available to both the device tree compiler and preprocessor for inclusion."
> +DT_INCLUDE ?= "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> +DT_FILES_PATH[doc] = "Defaults to source directory, can be used to select dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH ?= "${S}"
> +
> +DT_PADDING_SIZE[doc] = "Size of padding on the device tree blob, used as extra space typically for additional properties during boot."
> +DT_PADDING_SIZE ??= "0x3000"
> +DT_RESERVED_MAP[doc] = "Number of reserved map entires."
> +DT_RESERVED_MAP ??= "8"
> +DT_BOOT_CPU[doc] = "The boot cpu, defaults to 0"
> +DT_BOOT_CPU ??= "0"
> +
> +DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -p ${DT_PADDING_SIZE} -b ${DT_BOOT_CPU}"
> +DTC_PPFLAGS ?= "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
> +DTC_OFLAGS ?= "-@ -H epapr"
> +
> +python () {
> +    if d.getVar("KERNEL_INCLUDE"):
> +        # auto add dependency on kernel tree, but only if kernel include paths
> +        # are specified.
> +        d.appendVarFlag("do_compile", "depends", " virtual/kernel:do_configure")
> +}
> +
> +def expand_includes(varname, d):
> +    import glob
> +    includes = set()
> +    # expand all includes with glob
> +    for i in (d.getVar(varname) or "").split():
> +        for g in glob.glob(i):
> +            if os.path.isdir(g): # only add directories to include path
> +                includes.add(g)
> +    return includes
> +
> +def devicetree_source_is_overlay(path):
> +    # determine if a dts file is an overlay by checking if it uses "/plugin/;"
> +    with open(path, "r") as f:
> +        for i in f:
> +            if i.startswith("/plugin/;"):
> +                return True
> +    return False
> +
> +def devicetree_compile(dtspath, includes, d):
> +    import subprocess
> +    dts = os.path.basename(dtspath)
> +    dtname = os.path.splitext(dts)[0]
> +    bb.note("Processing {0} [{1}]".format(dtname, dts))
> +
> +    # preprocess
> +    ppargs = d.getVar("BUILD_CPP").split()
> +    ppargs += (d.getVar("DTC_PPFLAGS") or "").split()
> +    for i in includes:
> +        ppargs.append("-I{0}".format(i))
> +    ppargs += ["-o", "{0}.pp".format(dts), dtspath]
> +    bb.note("Running {0}".format(" ".join(ppargs)))
> +    subprocess.run(ppargs, check = True)
> +
> +    # determine if the file is an overlay or not (using the preprocessed file)
> +    isoverlay = devicetree_source_is_overlay("{0}.pp".format(dts))
> +
> +    # compile
> +    dtcargs = ["dtc"] + (d.getVar("DTC_FLAGS") or "").split()
> +    if isoverlay:
> +        dtcargs += (d.getVar("DTC_OFLAGS") or "").split()
> +    for i in includes:
> +        dtcargs += ["-i", i]
> +    dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
> +    dtcargs += ["-I", "dts", "-O", "dtb", "{0}.pp".format(dts)]
> +    bb.note("Running {0}".format(" ".join(dtcargs)))
> +    subprocess.run(dtcargs, check = True)
> +
> +python devicetree_do_compile() {
> +    includes = expand_includes("DT_INCLUDE", d)
> +    listpath = d.getVar("DT_FILES_PATH")
> +    for dts in os.listdir(listpath):
> +        if not dts.endswith(".dts"):
> +            continue # skip non-.dts files
> +        dtspath = os.path.join(listpath, dts)
> +        devicetree_compile(dtspath, includes, d)
> +}
> +
> +devicetree_do_install() {
> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
> +        install -Dm 0644 ${B}/${DTB_FILE} ${D}/boot/devicetree/${DTB_FILE}
> +    done
> +}
> +
> +devicetree_do_deploy() {
> +    for DTB_FILE in `ls *.dtb *.dtbo`; do
> +        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/devicetree/${DTB_FILE}
> +    done
> +}
> +addtask deploy before do_build after do_install
> +
> +EXPORT_FUNCTIONS do_compile do_install do_deploy
> +
> 

-- 
MARTIN HUNDEBØLL, Prevas A/S
Software Developer

Hedeager 3, DK-8200 Aarhus N
Phone +45 87438070
Mobile +45 25562438
Martin.Hundeboll@prevas.dk
www.prevas.com


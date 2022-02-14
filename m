X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2c8eff7c-2752-7109-3552-dfa5e29ecc16@bootlin.com>
Date: Mon, 14 Feb 2022 18:10:41 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] dev-manual: update example from kernel.bbclass
References: <20220214161732.15475-1-ceggers@arri.de>
 <07212849-0549-232f-f139-2c561e1828fe@theobroma-systems.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
In-Reply-To: <07212849-0549-232f-f139-2c561e1828fe@theobroma-systems.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Christian Eggers <ceggers@arri.de>, openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org


On 2/14/22 17:24, Quentin Schulz wrote:
> Hi Christian,
>
> On 2/14/22 17:17, Christian Eggers wrote:
>> Since f7485646534e ("kernel: provide virtual/kernel for all kernels"),
>> all recipes which inherit kernel.bbclass provide "virtual/kernel",
>> independent of the value of `KERNEL_PACKAGE_NAME`.
>>
>> Signed-off-by: Christian Eggers <ceggers@arri.de>
>> ---
>>   documentation/dev-manual/common-tasks.rst | 2 +-
>
> Documentation patches have a different mailing list:
> docs@lists.yoctoproject.org
>
> I've added it to the Cc recipients now so there's probably no need to
> resend this patch :)
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Indeed. Thanks to Quentin´s review I merged your patch into the
"master-next" branch of the yocto-docs repository.
Many thanks for the update!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


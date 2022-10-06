X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e54ff20f-1d75-2e28-e0a9-4ebd5b8f9ffd@bootlin.com>
Date: Thu, 6 Oct 2022 11:01:16 +0200
MIME-Version: 1.0
Subject: Re: [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
References: <1719DC05CA23710A.18826@lists.openembedded.org>
 <MAXPR01MB43275C9203484CFC733FFA929D599@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
In-Reply-To: <MAXPR01MB43275C9203484CFC733FFA929D599@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: virendra.thakur@kpit.com
Cc: "steve@sakoman.com" <steve@sakoman.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

Hi Virendra


Thanks for the patch!

On 01.10.22 07:52, Virendra Thakur via lists.openembedded.org wrote:
> Attached patch file also.
> ------------------------------------------------------------------------
> *From:* openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org> on behalf of Virendra 
> Thakur via lists.openembedded.org 
> <virendra.thakur=kpit.com@lists.openembedded.org>
> *Sent:* Saturday, October 1, 2022 11:20 AM
> *To:* openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org>
> *Cc:* steve@sakoman.com <steve@sakoman.com>
> *Subject:* [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
> Caution: This email originated from outside of the KPIT. Do not click 
> links or open attachments unless you recognize the sender and know the 
> content is safe.
>
> Add patch to fix CVE-2021-3750
>
> Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   3 +
>  .../qemu/qemu/CVE-2021-3750-1.patch           |  59 +++++++
>  .../qemu/qemu/CVE-2021-3750-2.patch           |  65 ++++++++
>  .../qemu/qemu/CVE-2021-3750-3.patch           | 156 ++++++++++++++++++
>  4 files changed, 283 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc 
> b/meta/recipes-devtools/qemu/qemu.inc
> index a493ac8add..816f9a7eac 100644


Unfortunately, your patch doesn't apply. Would you mind updating it 
according to the current master branch and send it again, please?
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


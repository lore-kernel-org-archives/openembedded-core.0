Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C13246FFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:18:44 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id A181668A019; Thu, 16 Feb 2017 02:18:43 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 3FEE668A019;
	Thu, 16 Feb 2017 02:18:43 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 7108667401E9;
	Thu, 16 Feb 2017 03:18:42 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <c68cce74-5173-2a86-84ed-438a42b9dce3@mlbassoc.com>
Date: Thu, 16 Feb 2017 03:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
Subject: Re: [PATCH v2 0/3] Permit to install files from an overlay in images recipes
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
X-List-Received-Date: Thu, 16 Feb 2017 02:18:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-15 18:33, Geoffrey Levillain wrote:
> Hi,
>
> These patches introduce a capability to install overlay into image after
> fetching them.
>
> There is actually a need to add image-specific configurations files into
> image recipes, and these patches are a way to standardize this process as
> well as simplify it by re-enabling fetching when image_overlay is
> inherited, and by providing a task that copy every files in directories
> listed in OVERLAY_ROOT_DIRS into IMAGE_ROOTFS directory.
>
> Geoffrey Levillain (3):
>   image.bbclass: No need to force image licence on MIT
>   image_overlay.bbclass: Add possibility to install overlays to image
>   rm_work.bbclass: Do not remove fetching and install_overlay stamps
>
>  meta/classes/image.bbclass         |  2 +-
>  meta/classes/image_overlay.bbclass | 24 ++++++++++++++++++++++++
>  meta/classes/rm_work.bbclass       |  4 ++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/image_overlay.bbclass

Can you give an example where this approach is better than just
having the image include some [possibly optional] packages that
contain these image-specific configuration files?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1258E7292E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 14:19:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJEJk27014855
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 19 Dec 2014 06:19:46 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 19 Dec 2014 06:19:46 -0800
Message-ID: <549433FB.8020201@windriver.com>
Date: Fri, 19 Dec 2014 09:19:39 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1418998363.13316.24.camel@linuxfoundation.org>
In-Reply-To: <1418998363.13316.24.camel@linuxfoundation.org>
Subject: Re: [PATCH] kernel-devsrc: Inherit module-base
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
X-List-Received-Date: Fri, 19 Dec 2014 14:19:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-12-19 09:12 AM, Richard Purdie wrote:
> As a "normal" recipe, mulitlib would try and extend it for multilibs.
> By inheriting module-base, we can avoid this since we now look more
> 'kernel' like.

Also looks good. I didn't trigger the multilib issues here, but looking
at the arch settings in module-base .. I see it now.

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index facc235..2872f17 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425
>
>   inherit linux-kernel-base
>
> +# Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
> +inherit module-base
> +
>   # We need the kernel to be staged (unpacked, patched and configured) before
>   # we can grab the source and make the kernel-devsrc package
>   do_install[depends] += "virtual/kernel:do_populate_sysroot"
>
>



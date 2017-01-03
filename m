Return-Path: <mats.dev.list@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 433F0607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 13:56:10 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x140so28183774lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=zotfCKcQewL/oVskYdNWSYlreojSwBKiZKsvZ/lwqJE=;
	b=nV6otrsZmOnP6UMAaVL2rVq+luq54qxW6FCOdkVSao9DHJslBbRw/b5TGYMgO6320O
	gWvTNOj48DmjXH7dxISe0L2jdwNRMSOGYawNk2oOXe7sp2zX9rJKRFheiGPixTI07mAk
	6LCz9qWqnX5epAOdm5Ewcrtr64hylkCRfLjH7Lee0LD3Cflz8DLddj9PlfocKxWMf1kC
	siKhNIHlNVL5uT9iyVic7MJOZLRicPebCVOZa3Be6SxlK3aRCaadCkf5pQ3rRfYHTEr0
	ScnzWCKT2ukSIOybxGAqQQz7CQov9Bh4N/YjAHLr25Zm1B2Br10mVf3ESyJ2kDMkh6Ix
	69TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=zotfCKcQewL/oVskYdNWSYlreojSwBKiZKsvZ/lwqJE=;
	b=Hb/wVZ7bt7iOCQgx98/JAxORE/XHGLQS7Z9mxAU6XGDrH3WF875oyrXECWrpyJfM3R
	qHSOeXUHUFnEhlXnb99Je4eb75p274tK0RsaqR3adXcwSnuF5CJ8z8RUMLcF4h0lhGBr
	iSSrCyAqFKHxNnMDhw5ABywKa1D6gV7gkNTx9W8VhwoEIg0PvH2E3LyjqQn95DiLK51q
	+vkBK3Px1JP0lokaosyS7wJLQZEV06FADNN1KlJJJ3VBfGwLMbiprQlOxHrWYCWAISSS
	e8PDiGlC17sSBVAJXUQbPBq0bcnjhx0rftsYkB647UsPvoZtt5Dhyaws5TUwNsaOEJ89
	yy5A==
X-Gm-Message-State: AIkVDXK9fmmSvPq3CD5eJHIc5rVqKSqMEpN7RDXgPVtU8sMOI8hxHdVM6Cg2qRY+Ga/tlg==
X-Received: by 10.25.132.6 with SMTP id g6mr2922695lfd.158.1483451770749;
	Tue, 03 Jan 2017 05:56:10 -0800 (PST)
Received: from [192.168.1.216] ([195.84.96.49])
	by smtp.gmail.com with ESMTPSA id
	n124sm14742386lfn.5.2017.01.03.05.56.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 05:56:10 -0800 (PST)
To: ola.redell@gmail.com, openembedded-core@lists.openembedded.org
References: <1483450976-22741-1-git-send-email-ola.redell@retotech.se>
	<1483450976-22741-2-git-send-email-ola.redell@retotech.se>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <2be3f63c-6e0b-27a9-970e-718ba4afe58c@gmail.com>
Date: Tue, 3 Jan 2017 14:56:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483450976-22741-2-git-send-email-ola.redell@retotech.se>
Subject: Re: [PATCH] Append KERNEL_VERSION string to kernel module package names
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
X-List-Received-Date: Tue, 03 Jan 2017 13:56:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/03/2017 02:42 PM, ola.redell@gmail.com wrote:
> From: Ola Redell <ola.redell@retotech.se>
>
> The KERNEL_VERSION string is added to kernel module package names in order to
> make the kernel modules for different kernel versions distinct packages instead
> of different versions of the same package. With this change, when a new kernel
> is installed together with its kernel modules (e.g. by upgrade of the packages
> kernel and kernel-modules) using some package manager such as apt-get or rpm,
> the kernel modules for the older kernel will not be removed. This enables a
> fall back to the older kernel if the new one fails.
>
> Signed-off-by: Ola Redell <ola.redell@retotech.se>
> ---
>   meta/classes/kernel-module-split.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> index efe1b42..8365448 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -122,7 +122,7 @@ python split_kernel_module_packages () {
>       module_regex = '^(.*)\.k?o$'
>   
>       module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> -    module_pattern = module_pattern_prefix + 'kernel-module-%s'
> +    module_pattern = 'kernel-module-%s-' + d.getVar("KERNEL_VERSION", True)
Why did you drop 'module_pattern_prefix'?
>   
>       postinst = d.getVar('pkg_postinst_modules')
>       postrm = d.getVar('pkg_postrm_modules')



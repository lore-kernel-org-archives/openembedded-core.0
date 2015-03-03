Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 882DF6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 17:52:12 +0000 (UTC)
Received: by labgd6 with SMTP id gd6so39168878lab.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 09:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pp4bNPOnFN6Tj5litfw69FUvo3zR3cYMCqgB1GBpCew=;
	b=QUGNxJnycGJ2+KN0HZ7cIaoS/1wmvwduFSk3Wgk0vHUSNkTtA7w4KzSP9Urn0bQHAq
	DbwrGIL1mDI7rPYe4rwAPz8i6BB9wrcNXh64+moDDeJ5TNw157QwhWNx7xefJq4yjdE4
	BkenTIyJqt6mYQc+05BeJImehvIkurdW3RaA4AjCOxQ63bXKpcpomKEBDp4Wu611JTje
	eVnp7fZ6S8aWVTyjAxSGuwMlT5Umrya3JjL44Efliu9EhdvK/Y03MmKW63NVMnwWccKO
	dOuLbgZHJx1I4l4FfOxR/z4v1RhaAx9ZtsguGyhU3PsEGIV9uapcvQFbmedLKBYP+BOh
	FNfg==
MIME-Version: 1.0
X-Received: by 10.112.161.229 with SMTP id xv5mr29409007lbb.43.1425405132721; 
	Tue, 03 Mar 2015 09:52:12 -0800 (PST)
Received: by 10.152.111.200 with HTTP; Tue, 3 Mar 2015 09:52:12 -0800 (PST)
In-Reply-To: <1425397584-5154-2-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-2-git-send-email-naresh.bhat@linaro.org>
Date: Tue, 3 Mar 2015 18:52:12 +0100
Message-ID: <CAC1BbcSV76Gd0HQZx0TzadSD7Nd+NSUecjaDmA2C9M_-aat-mA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 1/4] grub-efi: Add to support to install grubaa64 efi
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
X-List-Received-Date: Tue, 03 Mar 2015 17:52:16 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> Add to support to install grubaa64.efi binary for aarch64
>
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/classes/grub-efi.bbclass |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 47bd35e..455dc8d 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -37,6 +37,9 @@ efi_populate() {
>         if [ "${TARGET_ARCH}" = "x86_64" ]; then
>                 GRUB_IMAGE="bootx64.efi"
>         fi
> +       if [ "${TARGET_ARCH}" = "aarch64" ]; then
> +                GRUB_IMAGE="grubaa64.efi"
> +        fi

Assuming you're adding at least the second call to test(1) in a row
I'd have switched the whole thing to a case statement.
This would be easier to read, fewer lines and on some shells fewer
forks of test(1), fwiw.

thanks,


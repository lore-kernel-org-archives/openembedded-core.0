Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 20B4F71633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 19:49:50 +0000 (UTC)
Received: by yhaf73 with SMTP id f73so11886321yha.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=VZlL9Bsdto0MNWOQdGp1K+LaVI4Tqj1JmEprm0AN+F0=;
	b=jeCBstkDIhwErRYsadtIRBnmlJhrg5LZYXr3e9GiFAj+Hf9Z2RTn5C4K4QOqXFF9Vu
	BoxYMwE9KfW9FMfuhZZ7DWpVlm3DyVuhP+1vwE+w36sFjBeQv5gN50eLnwu0Iv+V0XQc
	9veUt0OegCbIuKYuWNDCqw7H2y6XQws5iZnrlmF+aXPafyf29TVSA9PQSgfoENr8Yrek
	9h7yGayI3u2D4dLnZUjsr7P7BAciSDJl72Ims4SQ/CzbGkf0iYoYU/UvOnmdJk0Gn3Io
	gZsMecXb6DaiGG87bqLfW7E6L6mDNL+M/rf3trK6KHHjfppwwC9mN/mMVOQsZSRTu7ht
	fvHA==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr11280218yha.105.1424720991498;
	Mon, 23 Feb 2015 11:49:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 23 Feb 2015 11:49:51 -0800 (PST)
In-Reply-To: <1424718281-9133-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1424718281-9133-1-git-send-email-alejandro.hernandez@linux.intel.com>
Date: Mon, 23 Feb 2015 16:49:51 -0300
X-Google-Sender-Auth: bGSJEbuPjNXxIqQOG9VUpsK-4yQ
Message-ID: <CAP9ODKr+kp=+yez1ibVBuwUyuc1V1D0gitaANhgBoGp8=rRXAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Mon, 23 Feb 2015 19:49:51 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 4:04 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> Adds symlink-to-sysroot check to the QA_WARN, Changes filerdepends
> from set() to dict(), hence methodsfor adding or deleting items had

methods for

> to change, keeps track of the key:value relationship, flags the
> issue along with the offending file accordingly.
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/classes/insane.bbclass | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 143ec46..542346a 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -34,7 +34,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>              split-strip packages-list pkgv-undefined var-undefined \
> -            version-going-backwards \
> +            version-going-backwards  symlink-to-sysroot\

Is this a 'development change' which should be dropped or another
change which should go in another commit?

Please take a look on the 'sed'  warning when building with ptest. It
is a 'false-positive' failure.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


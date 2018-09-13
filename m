Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D70C798DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:00:23 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id i12-v6so1724276otl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=69Y6iv372WKrj7Z0iSxpl0D29z6+cXHmCGDCvu6KesM=;
	b=aDzIcxc4dGTK0u/pgdjmIV4mju/QsM8m7bWXbwgwWiQe0+jj5ufHP4D0JzCL4t8fNg
	GLJRTl+XHFyY3aYD6+rUNih0m5xjO4v9PyZs+zdlC5yFSi5Cj+mltAkDmVikbXfDrq3Z
	k6lLiA59r2pzM/F19nx8zcWhigXDJWsy64geA44g+RShkI/12Wf+32F7Fxs4JANXfEIA
	iYW1W7bsb8ksiUqEwVnq5zZXW0ZANUkyuzKghCYCjVhjJN2HbBXhPoKR7xev/q9/f1fb
	zk4vTzAlywdEN+d4s1DAMCi0rpqvrRL8VVYWyMhvfTRfIfB+P1xC/d9xJi+w+ThLix/T
	yGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=69Y6iv372WKrj7Z0iSxpl0D29z6+cXHmCGDCvu6KesM=;
	b=ckEpiOqcA70bLds6MGfA7RhSlNVwumf2KKDbBUfWaYxM4EzYOjiD4IRUnX3KZsEY7/
	DUsvP+1pDh/XP3/Esh8Fo10fAIGk7ZTeCaeINiqqbnJubVmCKqhhHPGmpoOCkHpckkjq
	1oDUC5zthu+4/OYaP5S046rrwjJbq6YqHIKNYWV1h+J2ByeEqOp9DLSiTfEs2dFqLMiT
	QQJVmJK4xz1N0+o34Hwl22pU2TRJ38stda8jdUpCP3CA+JoqTJlHzqURsa2dt7R5PMNG
	EqMU1koX44dNQAhUQ5PkuMR0EnWe7XaX+AS+ey5RxvWygA3vww+ics3Q43yZjFoo5bYV
	ZS0A==
X-Gm-Message-State: APzg51CClqOPyypnrnzx5sN+slMpBEKzkkytv/n0ZcbkVho7kRLFeU8F
	1sLoHOu+xCrAuBKFKUrmyQ3X8TLqrBJaUt074OSw1w==
X-Google-Smtp-Source: ANB0VdZ4dLK8OqHwQYI3Z7gzfhKSgDheNGfPwC6tpCljW9/tXFonNcnCOuXUygDPd8G1P8AbKhmP7Kmg1zlxjQYkcwo=
X-Received: by 2002:a9d:4ea:: with SMTP id 97-v6mr1534207otm.99.1536854424436; 
	Thu, 13 Sep 2018 09:00:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Thu, 13 Sep 2018 09:00:03 -0700 (PDT)
In-Reply-To: <alw21y00P0lLAyC01lw2NN@charter.net>
References: <alw21y00P0lLAyC01lw2NN@charter.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Sep 2018 17:00:03 +0100
Message-ID: <CAJTo0LYgS39aSN5djToJ+xqh=tyGxWnr7DZg-sS_b6RntXAn2w@mail.gmail.com>
To: joseph-reynolds@charter.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dropbear: disable medium-strength ssh ciphers
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
X-List-Received-Date: Thu, 13 Sep 2018 16:00:23 -0000
Content-Type: text/plain; charset="UTF-8"

This still can't be actually used, because dropbear won't be looking
in the recipe folder and nothing puts that file into the source tree.
Put a #error in it if you don't believe me. :)

Ross

On 12 September 2018 at 22:56,  <joseph-reynolds@charter.net> wrote:
> This changes the Dropbear SSH server configuration so it will not
> accept medium-strength encryption ciphers including: CBC mode, MD5,
> 96-bit MAC, and triple DES.  This is consistent with the default
> supported OpenSSH ciphers.
>
> Upstream-Status: Pending
>
> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
> ---
>  meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/localoptions.h
>
> diff --git a/meta/recipes-core/dropbear/dropbear/localoptions.h
> b/meta/recipes-core/dropbear/dropbear/localoptions.h
> new file mode 100644
> index 0000000..ec48c26
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/localoptions.h
> @@ -0,0 +1,8 @@
> +/* Customize dropbear per default_options.h in the dropbear project */
> +
> +/* Disable insecure ciphers */
> +#define DROPBEAR_TWOFISH256 0
> +#define DROPBEAR_TWOFISH128 0
> +#define DROPBEAR_ENABLE_CBC_MODE 0
> +#define DROPBEAR_SHA1_HMAC 0
> +#define DROPBEAR_SHA1_96_HMAC 0
> --
> 1.8.3.1
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


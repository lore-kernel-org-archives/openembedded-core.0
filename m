Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD8261222
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 11:52:58 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wp18so3593589obc.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SYMy59xdB5M5KkJkg7lit6RY7AK4PYAfkeNvMWnAUQ4=;
	b=iQG6L3wnkjFKkUCg+e4yzKHNvz1xSkE2VerYjIpvtwGZ8OGVOpvuOEGiAH4+eD5iS6
	+RBNuVZRI2kA76Prywsc0zwbJpRm1I3oWVzNwUnKzhmxkj9YW+PUgk1tpQ0xc5v5sKU8
	aveqWp2TDstuUnBMYPKjh1ZZGKQwHpMC2VM967QZXFUslDBKwZu+RLN8cPecPdeyFoIo
	RkL45ZfkZj8ya5tnjbBvxhzu+v0WRqv5VCWU+tyFf6NVC4DeOoG472Piv0oqfoS3UkHq
	ujolka7dKKRCSCorf+4XufWg/sgnwLI7wZPYaxZq3EkCoi+jTetJzE9sn9/WhQqQAExb
	Pkrw==
MIME-Version: 1.0
X-Received: by 10.182.74.137 with SMTP id t9mr803038obv.79.1386589977334; Mon,
	09 Dec 2013 03:52:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 9 Dec 2013 03:52:57 -0800 (PST)
In-Reply-To: <c20f79f4a812a4e007413751e3cabf63a4f5e6ec.1386558973.git.Qi.Chen@windriver.com>
References: <cover.1386558973.git.Qi.Chen@windriver.com>
	<c20f79f4a812a4e007413751e3cabf63a4f5e6ec.1386558973.git.Qi.Chen@windriver.com>
Date: Mon, 9 Dec 2013 09:52:57 -0200
X-Google-Sender-Auth: l8AZNw4pj9PoSPZtEu-_kz8hgO4
Message-ID: <CAP9ODKpv76jtiMqmg3eCJ1TYzvrhBESQMfQF5rVeT2XgJHR0tw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: default USE_DEVFS to '1'
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
X-List-Received-Date: Mon, 09 Dec 2013 11:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I agree with the commit but ...

On Mon, Dec 9, 2013 at 1:17 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Default USE_DEVFS to "1" so that the `makedevs' command is not run
> at rootfs time by default. There are mainly two reasons to do so.
> 1. This will fix a build failure with initramfs-kexecboot-klibc-image.

Can you elaborate this error? is it something we can/should fix?

> 2. Most of our images use a filesystem over /dev. Most of the time, it's
>    just devtmpfs. So we actually are using a filesystem over /dev.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index cc65e35..b8bd462 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -77,7 +77,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>  # Images are generally built explicitly, do not need to be part of world.
>  EXCLUDE_FROM_WORLD = "1"
>
> -USE_DEVFS ?= "0"
> +USE_DEVFS ?= "1"
>
>  PID = "${@os.getpid()}"
>
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


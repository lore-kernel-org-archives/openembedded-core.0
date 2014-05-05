Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id AA917601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 03:04:15 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so7258586iec.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 20:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wo3mp1+VVFlD1RlOA5o5c8YiHgjkO6kesZt+oCEps0M=;
	b=Qwow/XDXUw0be9rNMYNdJSGe50mlU+ES3IiPrZXQNPC1Sqdf1zNxpJHHGQOliV5pJW
	6R+/fs8rc2R2THkDbUcFTf3XUHU3Ytl20cUsTeyrzn5Ae4saAyfUrYVc2HzS+taHbLVw
	Q7ZZW7ToPYf1u4geZVQqf9kEDFOTLLX4hc8/uGTMILRl6d5pry5aNA5ODXrZAi89cZF3
	2zLTZC1ApzwiY6Z8IOeh4zmdjfCR7NoAP2uNrRkgwRAYtt3zQ4ecTjytLu48H0or/yM/
	EJv1C0JeH+nVvcSbyItt/pmWEHR04lrnHPlPFXMrRPwRckDApNgSZ4lx6cv4MS1D31yS
	gGfw==
X-Received: by 10.42.196.73 with SMTP id ef9mr2046139icb.25.1399259056105;
	Sun, 04 May 2014 20:04:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 20:03:46 -0700 (PDT)
In-Reply-To: <1399243070-25365-1-git-send-email-tylerwhall@gmail.com>
References: <1399243070-25365-1-git-send-email-tylerwhall@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 20:03:46 -0700
Message-ID: <CAMKF1soiXoaBN=vLXXXUVDf7fUATaL7deScP8epRt+cyK7jVTw@mail.gmail.com>
To: Tyler Hall <tylerwhall@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Substitute correct python version in shebang
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
X-List-Received-Date: Mon, 05 May 2014 03:04:15 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 3:37 PM, Tyler Hall <tylerwhall@gmail.com> wrote:
> If python2 and python3 are both available, scripts that are subject to
> this substitution can possibly run with the wrong python version.
> python3-config is one such script.
>
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>

Thanks looks good to me.

> ---
>  meta/recipes-devtools/python/python3-native_3.3.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
> index 7238eaf..0fd7349 100644
> --- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
> @@ -71,6 +71,6 @@ do_install() {
>
>         # Make sure we use /usr/bin/env python
>         for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
> -               sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
> +               sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>         done
>  }
> --
> 1.9.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


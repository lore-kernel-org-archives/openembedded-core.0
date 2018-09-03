Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0A97B75129
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 16:51:34 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id t39-v6so1171512qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jViAY8aio7qYeSsZ76X8hNx8uXb2+4FZgDntEeIX3y0=;
	b=Em+DSr6WypGcFlOr9wGS/fCJshNwpxPap0zeWSMAypYH45Ismz5vRFr1BeK9iY/1O4
	cK5Bw/yb4jM76Ct8E26Kxiyj7FjUpElZ0+yggFBx/Adri5VuWp98q5IKGCh4N/Vk9N5L
	w44dkqmoEpU4ZYsaH2+1tgJPODFBxZ/sCasnjcmf5lb9Ne8VMeciTdgrciEBxmYEBbXw
	086dY4F7Ma7DzrLA5606Udi/JBvfoGd60Uz+wFJRFplJnpIZ2nYCQx9noTM9Gm12G5Nk
	cuAecU8Yac0tNPPCBLQxp4IoLHQnAEX3rhNNUfJuAQmSwEZYxmWuOs40UD4+zmja9mPP
	jIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jViAY8aio7qYeSsZ76X8hNx8uXb2+4FZgDntEeIX3y0=;
	b=fAyO7401nBCUkDlnkSSSH3Iatiyr93oyu3XWhiOEvgKWJIj9yk3GStew3nUQZDqN7X
	Vkg7N88cesk1VV9hNVjIGiWAzHtYzyzZRML3DSkaPkUohmwaaMqjZYuiNSR4mwnmGDBT
	ZOfoAqbbuJ1c03B5kxNkeewHPVf9fofotKzi/fYVUqVLWu1R16T+orHHXBMrf233CPTr
	d7viQO3MsDzBhe1OYmeXcW6wC9rf/26nH/hP+2u8PgWd1kJVEoNCnVst03MNNKVUAd3c
	q/dNE0oP/ttnoDB/lvzjSiO9sjiGVatT4JI7gxdESC8bNi1kAyN06/gJkvgmMj5LdJO/
	j1bA==
X-Gm-Message-State: APzg51CshjokC0jJ5zeGvr/sLKdZFQibhQg9af70FW4nP+d8SSgAULcS
	mQBssiTSgoPutrGs7bAFtnfTCuORHrY+7RCf6Lo=
X-Google-Smtp-Source: ANB0VdYXjBpxtx7Ea4ThNdLI+ROWa9sKU2rcsBdjItgRKYI3HVuWXbBZ6L3XCPZQwQ/hb+trcw5nitMoY9fZoc7l0UY=
X-Received: by 2002:a0c:f208:: with SMTP id
	h8-v6mr25984747qvk.55.1535993495658; 
	Mon, 03 Sep 2018 09:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Sep 2018 09:51:09 -0700
Message-ID: <CAMKF1spEwtdDg+K+u-kY27zLz=f=UgA3AUmxqZFpAsTpWSbv+w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 03 Sep 2018 16:51:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 3, 2018 at 2:35 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> They can't be built without opengl in DISTRO_FEATURES.
> [snip]
> |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
> fatal error: GL/gl.h: No such file or directory
> [snip]
>

whichever source file is including OpenGLShims.h should ensure that
openGL is enabled
before including this header. you can check that with #if USE(OPENGL)
and keep in mind
that webkit has enable_opengl which means both openGL and openGLES support but
use_opengl and use_opengles are mutually exclusive. So if the
component where its failing
might be only supported with opengles2 then we need to ensure that we
check for that before
including the above header  e.g.

if !USE(OPENGL_ES_2)
 #include "OpenGLShims.h"
 #endif



> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.20.3.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> index a528c5d..93d74bb 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> @@ -29,8 +29,7 @@ SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>
> -# depends on libxt
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
>  DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>             gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
> --
> 2.7.4
>


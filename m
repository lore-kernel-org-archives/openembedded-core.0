Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 879866D7C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 11:37:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m125so2649430wmm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8cgiRlB3mG+cCrskFgS9/W6cw1LgJR3b08Wylr5anJ0=;
	b=RdxASkQKwtXHKPuUhT2/cP1RKw19NVS35aSEQunC+4NOW4bcyQJM0lZDpiqZUI9w+O
	MbQvnkIGfQR1MzTdcVM0HLrpzHCWzNW1ZW29lOvACHEmlXO6Kltc0XSBZgnRDdfEEn44
	H8QsGbPsLqUBeXe2ybC6dHz4uEDivMChdUMTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8cgiRlB3mG+cCrskFgS9/W6cw1LgJR3b08Wylr5anJ0=;
	b=I9hiBvISf8sLNkv5TpT7PuB7zAZKXowQmFYFup/m5s7OQRFzvpWhY3PhC3HWHjAeJE
	EqG7Ki+fy/uuYliO39mL3DGy+AGh/PEUSOF2i1XutBMKtY+H1PXQi57fSDF3jW/5OXS5
	rU5QKOtuWYXKvWKPj+dUOCMWLt2ItaNtmaUyl3Z2+i2K0pWDl0THUKK24eL1rXjrP+3m
	chXs3UwMo3ErXYrVHCUz7IKSZxsN67hKu/vxHGpJR+w2+9yjha6cIWkkBmyQttYiyY5X
	vOKAZ9+BPSFEBUL3k9DZHxma50qr2B/VD0BU+0uJXN0YzyJ3RV9UPJOy25+FYr9gh2Ow
	tazA==
X-Gm-Message-State: APjAAAUr9JFwOVrsuYgFs0nupjYL8amLZd020FIjKGRu5z/+uBiIIcek
	f+obxomvETHVjh+gFyFxAEXTHw==
X-Google-Smtp-Source: APXvYqyXEJe91MV45WtHViP2+2dXv8NJ+YTIS5dhGEImyEHzBFK3M1+LRdMPNS1gwDfKujmGe2ReiA==
X-Received: by 2002:a05:600c:218d:: with SMTP id
	e13mr28183582wme.29.1566905855136; 
	Tue, 27 Aug 2019 04:37:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v124sm2107671wmf.23.2019.08.27.04.37.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 04:37:34 -0700 (PDT)
Message-ID: <5a1eb3164dda6d0fac071fb443a14c9af72931f8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 12:37:32 +0100
In-Reply-To: <5f8198b68f123e1e47451a70d8bc3bb5ae893ac2.1566872499.git.Qi.Chen@windriver.com>
References: <cover.1566872499.git.Qi.Chen@windriver.com>
	<5f8198b68f123e1e47451a70d8bc3bb5ae893ac2.1566872499.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gettext: avoid useless RPATH QA issue
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
X-List-Received-Date: Tue, 27 Aug 2019 11:37:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 10:22 +0800, Chen Qi wrote:
> We are getting useless rpath QA error when enabling libunistring
> and msgcat-curses PACKAGECONFIG. Use chrpath to delete the redundant
> RPATH in binaries.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index 30121ad..4ce47a6 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -118,6 +118,14 @@ FILES_gettext-runtime-doc =
> "${mandir}/man1/gettext.* \
>  
>  do_install_append() {
>      rm -f ${D}${libdir}/preloadable_libintl.so
> +    # remove useless rpath to avoid QA issue
> +    useless_rpath_list="${D}${libdir}/gettext/urlget
> ${D}${libdir}/gettext/cldr-plurals \
> +                        ${D}${libdir}/gettext/hostname
> ${D}${bindir}/recode-sr-latin"
> +    for f in $useless_rpath_list; do
> +	if [ -e $f ]; then
> +	    chrpath -d $f
> +	fi
> +    done
>  }
>  
>  do_install_append_class-native () {
> @@ -163,6 +171,8 @@ do_install_ptest() {
>          find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
>          chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala
> ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-
> tcl-4 \
>                     ${D}${PTEST_PATH}/tests/xgettext-vala-
> 1  ${D}${PTEST_PATH}/tests/xgettext-po-2
> +        # avoid useless rpath
> +        [ -e ${D}${PTEST_PATH}/src/cldr-plurals ] && chrpath -d
> ${D}${PTEST_PATH}/src/cldr-plurals
>      fi
>  }

In general we try and fix the reason they're getting included in the
first place as it means the compiler flags are incorrect. Any idea why
that is happening and if we can fix it?

Cheers,

Richard





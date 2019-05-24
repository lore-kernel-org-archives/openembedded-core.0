Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EC30E7E4BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:31:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w13so2436692wru.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1XmoKNdhCy0xJvYcVvMGW9UUitGz/BQhcKMLqFx3e8Y=;
	b=iZYtwcvilxL1PEl0M0YL+g10zFDmY/9LFc2998jCZnEbvEqglkh1VSPHLZJvjNsSye
	WtqU67QpKv98uhVNm8u//MMHRhB1W1HUSZ7b0aJl0jBiSNBj4YnDA3aJ6oQX8406ZK9l
	c2ODVldFfLx6BA5PLQix3uZ/w3T37X7S+Y8t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1XmoKNdhCy0xJvYcVvMGW9UUitGz/BQhcKMLqFx3e8Y=;
	b=Ra6tOgz+4KaF7V11ZZz8oYWXzRJqW9OmQDJq48xEc5wWjpu58xgTQLBzUjrWEEEY6v
	2i8qNdV6KmvlNom4/hQIOjqWqz4XZ1IIzC1ZGEFLSXUo+UUWbFf/jZO/5Ufpyh9p8XkC
	FVNfKrgj6mLuUh74eX0ewm5/+gFnJEVhhsVq+KvxwTipR60tIcRRkgHiR6YoKhqkol6F
	ZnC39d1iAqNMOViw9SIIugSj5xv8kj3Flb5uVUahvRNw0n1iJDFDK5KM9q4aBD3+AtLl
	NY1hV2QRezL8eqFss+P74iO5CaWSWHMIuYfV06ddG4H4dj77ZjRGOYKKojwNoCJAKN+0
	tP3w==
X-Gm-Message-State: APjAAAW4/yhdYiglhmTXQhtPi8zMsUbGfgWG4CKWAm96zhGJokkcprEr
	F8Y7OZyOXGuf7tSETuYCgPEM7Q==
X-Google-Smtp-Source: APXvYqww5Tc5Ck0jGUDu4+mk5h8UDaBN32ZR77Sc41N+UaS38psXEsA3nOcDpXBo54UP8CZ+HQhcIg==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr59539760wrl.140.1558719108803;
	Fri, 24 May 2019 10:31:48 -0700 (PDT)
Received: from hex ([85.255.233.241]) by smtp.gmail.com with ESMTPSA id
	i125sm5674713wmi.2.2019.05.24.10.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 10:31:48 -0700 (PDT)
Message-ID: <17c3408af1ebd7edc0f9c99c0bbec3617e8885b9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 18:31:46 +0100
In-Reply-To: <ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
References: <cover.1558664136.git.Qi.Chen@windriver.com>
	<ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 24 May 2019 17:31:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-24 at 10:17 +0800, Chen Qi wrote:
> systemd upstream only care about glibc. We made musl specific
> patches so that systemd could work. But currently these patches
> contain potential security issues.
> 
> So apply these patches only when the libc is musl.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_242.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-
> core/systemd/systemd_242.bb
> index 2dda0d0..adb592f 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
>             "
>  
>  # patches needed by musl
> -SRC_URI += "${SRC_URI_MUSL}"
> +SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') ==
> 'musl' else ''}"
>  SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-
> available.patch \
>                 file://0002-don-t-use-glibc-specific-qsort_r.patch \
>                 file://0003-missing_type.h-add-__compare_fn_t-and-
> comparison_fn_.patch \

Doesn't the usual SRC_URI_append_libc-musl = "X" work?

Cheers,

Richard



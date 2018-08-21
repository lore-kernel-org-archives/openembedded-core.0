Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2587451E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:51:03 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d4-v6so18380820qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oBiT9gxSPtYKsBHfxWmvB0iTXu0NR78EEFPbz5vKrdE=;
	b=E+b1w3eJDhW/8QIyUnXOAf/sBKz7bo3tapR3O5cvCeTw9LNh59aZh19qwhxVbsTdDW
	nG8lyoQXLdJ2+ihC6ZRlpo2h5nkFTq9cLINoqd56OORXDP9mtN6tJLTc6kxmipEHrwYr
	Z1wU62SBj1um5wMG8O3gaXcUs1T1pLesx62f+eZnCa5+md3Br88kNytH4yIeBis19KfJ
	8yqe3j/zVst2SHPtPmcLAyxX9KCLYEM4DGu360YlPWdGigN+ycsUO7Qk7LeSHcFXNj4b
	0/Qh/TZhkAcDyQAFoP3t/rI9+HCBANOjCDCRdNAjZDM5Azm2ZZ1mjMWdLnxdlMJwdb3J
	24jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oBiT9gxSPtYKsBHfxWmvB0iTXu0NR78EEFPbz5vKrdE=;
	b=oxU1hb64o0s0IV43I4SdUgV1SIIzOWF7YVW82hXIsnn72a2FryLGOdW+uVRMRdnN7W
	QAvwIlWCodY1RPnLTaoTG/8XUujB2ZbQLR8W4L/2BCzGBuldgi4heCkzu2vyh8n5ZZ/g
	HETztPneN5RHqCSOYH7K8DiiMLlf1BNdTwIYEKutwO9wJA7ituJtBGskMMQ7zSBo23Yw
	ddRUaEwO9rea4KJ2AP1OMj3XWj9OZjzTzLUVKO97WS7r4chl4NPwqe/VsvOiNPYk9ZIH
	Uh3YmSZgeEEJ7pQa4NwlS5ec7aKU4v5rIKw4DK/vq4+nnASUXrTZkO3ghb0Ucy0FQiWr
	XOwA==
X-Gm-Message-State: AOUpUlHej8ci025CK0Po4Xu09QcFP0v/xQR/UTtieHHji/RY9TUQx6YQ
	hDuDZecJnIvpgytd5f1sPrcj+mHZ/+hKZzTINiI=
X-Google-Smtp-Source: AA+uWPwRrsK3pCDCdWv2MnK4PcvPuyKKXBVwE75tlAykRQUQJ1A0C7gvoXcjU60vYumdbP32oiR7yG+vlHlEcW0SBpA=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr48357937qtf.20.1534812664091; 
	Mon, 20 Aug 2018 17:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180820232105.20179-1-sukdo399@daum.net>
In-Reply-To: <20180820232105.20179-1-sukdo399@daum.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 17:50:38 -0700
Message-ID: <CAMKF1sr+670v4NnJqh++SVrFRaFFMXf3ZfNQkoBJXCZJgOnWsQ@mail.gmail.com>
To: sukdo399@daum.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Tue, 21 Aug 2018 00:51:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 4:26 PM Seokha Ko <sukdo399@daum.net> wrote:
>
> The wayland-scanner was missing from the native toolchain for SDK build
> because it's copied from wayland dev package.
>
> Signed-off-by: Seokha Ko <sukdo399@daum.net>
> ---
>  .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index e2f6169994..4dc6eea23e 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -23,7 +23,7 @@ RDEPENDS_${PN} = "\
>      nativesdk-makedevs \
>      nativesdk-dnf \
>      nativesdk-cmake \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-dev', '', d)} \

Do we need the whole dev package ? if not I would suggest to package
it into a separate output package
and include that along with nativesdk-wayland

>      nativesdk-sdk-provides-dummy \
>      "
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


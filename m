Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2D346601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 17:01:03 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id g16so2033582oib.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 09:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0zntGnbAS0ExVN/bhxGiqrDc5jmFbNiiw8vbR0zSMTo=;
	b=quywXviWpPsKU2eylZ2mfW/uzU/hG2EpKf4WapovCY8MQU4mxNBilrQqcC8fKmC351
	Zhd5FXT65rWQoFqYezAGRnyvbr0XEGLuPLDHNRuqIpJ5vZlvzUpN0SIHmcU1E3JofZWq
	PA26gl2KhnWBAmt2dT4Yx72kD4iOEBOUXagnyZA0IHXIDLLlC6+ebg0tH1pKKspT1UI9
	lqx1sAkK4RaCQJNmTVYJeO47oBZtIusJB2a19Dc37CUdRUYHqqjL6ZWOaB3wTncJ/NRN
	dN3ZHbRO901ldaE5dQTqG+ylZirBw4XDZTcTusXn78rbiAs/1nGI2A14KGGp5o5sW37M
	PXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0zntGnbAS0ExVN/bhxGiqrDc5jmFbNiiw8vbR0zSMTo=;
	b=Uq8UjXn422yarL9HyVFM7gnDgb7B/iboyEKJdE7oEo5ippQvaLG8aUg/mbfoAIXAgN
	asmEu9WVZFaxkpecAv4fM43ca75LvlL8XeFxCxXBoqmquU1KRpJtZX3DNLqkiMbsTNhH
	9gw8/VRnihyq+UPGQYiAa/HPge1ZRCiIdrHTxZ0zYUxVf8FNJNu7IE3+HjnYEnjq6huJ
	52kQ1ncUTPZfuOnHsLafQYlGzMcdZR1FLKpwYD57dVaVoGs7jSA6gcNnfDewY5QedyTv
	bPtVM2J1ojUl0AXRMzytFHlg9aHUqhvL4mi8EL+i0WTVI8qbgxllUkP8Zc+3pIY7UkH0
	sXow==
X-Gm-Message-State: APjAAAVhBzAVGsi/moj96DSEgkH7dBbS3TpposAGlTWlJPWc7gJ+2R/N
	JhxBKyil2HTBS2GTL9l/foF7Is+4vCbHMLuF/Q0hZA==
X-Google-Smtp-Source: AHgI3IY5Bce/EQ6mGk2sVP9UPdMUjZridLwrYyqBH/92G4jIc8+5T15rTLp3k1fUMJnt0JFV+P1mYRc5ifVenc8q1FU=
X-Received: by 2002:aca:4d49:: with SMTP id a70mr9687708oib.135.1551632464220; 
	Sun, 03 Mar 2019 09:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20190303165242.14424-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190303165242.14424-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 3 Mar 2019 18:00:52 +0100
Message-ID: <CANNYZj83wehnRQN_MF84Mm7TG8LHKkx1brPKtgjzfgKdQBFWnA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] qemu-native: add dependency on dtc-native
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
X-List-Received-Date: Sun, 03 Mar 2019 17:01:03 -0000
Content-Type: text/plain; charset="UTF-8"

This has been previously discussed: qemu doesn't properly reconfigure
itself when settings change. Wipe tmp/ and things should just work.

Alex

On Sun, 3 Mar 2019 at 17:54, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> This fixes the following build error:
>
> ../loader-fit.c:30:10: fatal error: libfdt.h: No such file or directory
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> index c8acff8e19..e3efd873ca 100644
> --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> @@ -1,6 +1,6 @@
>  BPN = "qemu"
>
> -DEPENDS = "glib-2.0-native zlib-native"
> +DEPENDS = "glib-2.0-native zlib-native dtc-native"
>
>  require qemu-native.inc
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


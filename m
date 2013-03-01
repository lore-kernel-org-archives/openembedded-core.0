Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UBSi4-0001Dg-As
	for Openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 17:21:25 +0100
Received: by mail-wi0-f175.google.com with SMTP id l13so9267521wie.14
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 08:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=NNGAa06F6VyfnmHxaT1bHy78Pmf6U7/4IMEQn6zlF38=;
	b=EIxoh2z52lg1vTCyhEjKu2GAdrlS0k9c1IyG2Fzg3BK/Qe1eY3R5H/Wno3mqIE9m5y
	RZYunIMwOUBNg076CUh/7oL+J8BG+yUWal7mfNl586hTpGnGPecmyYVPYSS1PGMMIWlf
	E6NkVDNraPHNiTf519Dsf8PpSS8TFyKUwuWJpFO+egAdCj6Gwm6MZuop8m6OneOPcmiG
	U4xYkx9zxaOIJVtFQNUTmL9k+3CcCyPWaDK2+aSGvRUR0qFVc7wYc5vL3GHmaMPybqnR
	wcgMEX4d28Hq/n83gR0YIhaicoTzFAZ21geB0gP+O34VKS6GaTBD1mXWctGolaQYYHVX
	AZbA==
MIME-Version: 1.0
X-Received: by 10.180.104.10 with SMTP id ga10mr4851597wib.23.1362153900754;
	Fri, 01 Mar 2013 08:05:00 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Fri, 1 Mar 2013 08:05:00 -0800 (PST)
In-Reply-To: <1362147965-42559-1-git-send-email-jason.wessel@windriver.com>
References: <1362147965-42559-1-git-send-email-jason.wessel@windriver.com>
Date: Fri, 1 Mar 2013 11:05:00 -0500
Message-ID: <CAHUNapTj+8e8fzeHt=NVQ2j5SFCZze7oVM9FqG4dRvuhB5hNDw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Non deterministic compile of qemu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 16:21:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 1, 2013 at 9:26 AM, Jason Wessel <jason.wessel@windriver.com> wrote:
> When you using a qemuppc target and sstate you might end up with
> the problem:
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 6c44b31..eb60d43 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -2,8 +2,8 @@ DESCRIPTION = "open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
>  DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
> -DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native"
> -DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman"
> +DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
> +DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>  RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"

Is there a way to instrument this in such a way that these depends are
included only when the target machine is qemuppc? Some sort of
@machine_depends or something?



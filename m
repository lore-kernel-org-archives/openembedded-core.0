Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9736770248;
	Fri, 11 Jul 2014 23:41:17 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wm4so1975136obc.16
	for <multiple recipients>; Fri, 11 Jul 2014 16:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=xHBNtAB9pImf5Z17PjKBLyNfLSDOWff+BEw8KNSkqSA=;
	b=fvq66roWndrvfGPrQ/nPMUcZLBUw8QcSKe0Nov5U+gR4ib1MeWrN2T4J/SO1Xy1A2C
	jP2s4HSQ7VJfbBy2vdod9Tyk5X0eNxQFRx8evY1o7yzPFaxOuOK0T7+aO2lyc1+QpoGw
	ObYNZdE8rGIB1bNTcc9cPPAF8I1LXGFbjJrcvvUF6+kvev1qonc5A6mJ25JVMUrfzN+a
	xcPNX+oVP45FPWMz1NN4djZqBx6Wy0HZX49M8pEwT6IUJJU4Eq8+FriyMjs/EvohDaPO
	t42YoWzg41vwLY8cvInmIVo8hs0xi6+LBMRjn/Hxa8NYAQ0NdmzplV8zn8zde+k/Gw70
	dguA==
MIME-Version: 1.0
X-Received: by 10.182.214.98 with SMTP id nz2mr2793037obc.62.1405122078956;
	Fri, 11 Jul 2014 16:41:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Fri, 11 Jul 2014 16:41:18 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407111821080.6262@localhost>
References: <alpine.LFD.2.11.1407111821080.6262@localhost>
Date: Fri, 11 Jul 2014 20:41:18 -0300
X-Google-Sender-Auth: n3wRnje3Rsa7yI77GaqNEQuHzbU
Message-ID: <CAP9ODKqwOXV+GxNhoPFXJWcjLipD1P176Qcy0bBNMuzF9=Bhng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH] core-image.bbclass: Reformat definition of CORE_IMAGE_BASE_INSTALL
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
X-List-Received-Date: Fri, 11 Jul 2014 23:41:18 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

+OE-Core

On Fri, Jul 11, 2014 at 7:23 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be more
> intuitively obvious.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   compile and run-time tested, building a core-image-minimal for
> qemuarm.
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 1b36cba..d2b9d69 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -59,13 +59,11 @@ MACHINE_HWCODECS ??= ""
>  CORE_IMAGE_BASE_INSTALL = '\
>      packagegroup-core-boot \
>      packagegroup-base-extended \
> -    \
> -    ${CORE_IMAGE_EXTRA_INSTALL} \
>      '
>
>  CORE_IMAGE_EXTRA_INSTALL ?= ""
>
> -IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> +IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"

For me, more intuitively would be:

CORE_IMAGE_BASE_INSTALL ?= ...

IMAGE_INSTALL += "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"

So IMAGE_INSTALL += "foo" in local.conf works as expected by new users.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


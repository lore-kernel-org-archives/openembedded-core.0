Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 305AD6CCC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 23:54:07 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id qd12so3617303ieb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 16:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CXkN0iTWIo4AC1pZ/CpQw0t6Z+dJPbahn8yUWHhEEfc=;
	b=QlJcRNHjKMREDVMfcCJTRXfzTH3sj1fgy41AyN6gSlVbaA+dll8j6f2b3rFGLIwg11
	rgKlhOrVHoVYH+/BnzzFgyuQXDrWm94vh53FvOOyVTUMwG30vun3GkmGPmbCIgyOZmaZ
	Hg48lPmqvzjSLKoY7njJ7hebEe38Qqg1yd67cp0qOL2fjx/Z6pTdbIL9+FfEkdOgJu4D
	88OVWRKy2D0GgVFcsFoJjG6oqjHcZY+AV8cXSQFYNQoF0JuEb667U5oWKLRq46hMFTbj
	vvbdsPCVfsn1KGk38IjUiVA1ktYjOxP5cUvzO43W4yhnLX6TO+EhTna/rwkttFW7XkF8
	xxYQ==
X-Received: by 10.50.17.9 with SMTP id k9mr177486igd.3.1383177249040; Wed, 30
	Oct 2013 16:54:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 16:53:38 -0700 (PDT)
In-Reply-To: <1383172767-11006-1-git-send-email-sgw@linux.intel.com>
References: <1383172767-11006-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 16:53:38 -0700
Message-ID: <CAMKF1soQ1+u_5_MieNh69LsDRf+MAonGM6rSmw6Es1SGmh6DEQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix typo in local.rules
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
X-List-Received-Date: Wed, 30 Oct 2013 23:54:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 30, 2013 at 3:39 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/udev/udev/local.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
> index f06002c..59836a4 100644
> --- a/meta/recipes-core/udev/udev/local.rules
> +++ b/meta/recipes-core/udev/udev/local.rules
> @@ -19,4 +19,4 @@ ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe
>  # Create a symlink to any touchscreen input device
>  # Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
>  # has an EV_ABS value (-a) which is used for touchscreen type devices.
> -+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
> ++SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK=="input/touchscreen0"

+= is perfectly fine for SYMLINK contruct. Why is it a typo ?

> --
> 1.8.3.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


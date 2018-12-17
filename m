Return-Path: <jed.openxt@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7FF7BF43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 19:03:29 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id 197so3099592vkf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pLSugAWOCEhbRoGT26009V2CvOvG1GEdXv65/xitQXA=;
	b=DDhCcXQ+ch300FrRKSBHvolk9TuVuJj3/2aKcw36CgkpGYeseOt8Olk3QFzmJT66W6
	Rjz0Skz4a8wATAlBuaTcFwZlsaz0v0xGcQwqex8KiLqQF5Zlir/okMKnPimrBmBfmqxG
	wW3o75YuLe4wCpr9LIwLRQuh60ev3iq34L2zu9GOLaQijv0BKkvrnZIx4Od9lO1wMGXT
	WnIWxyO/oMbU9SovEmLIT6SIvJZhEaTxeYlbGhbYITy9UL+w0dTieXuLUWEb6oJQkQK/
	wsogMkcMuJm9Bhr8Akz6yc5xy31FD6MF3qbmcOwPxFtth5PUItruYWaepq8o0DhXNcEK
	VOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pLSugAWOCEhbRoGT26009V2CvOvG1GEdXv65/xitQXA=;
	b=peLnHyV9SAaxxyTkSdttET7UDJd5z+UZtQdYzyMZeZ/cbHWIOMK/lsjXhEWVXSxJVW
	4ftQe4WIRvNyIG3mR4+jSW3JttFtJaspaganPDJOolyiwGtEQbPd9SD0B22fxGiWWhm5
	7alU3CX5EP+x3emZ6wZ6/z4VcfWw3hnQ5mcxYP/9knD3ZOP/b+SIIDqcK4JRD/Mbdg9p
	Y1YzHYwmIR72l02QKWvV5JMG1qgsWb/+ZgEg20BcOsAX6ToasIIlY3R0+WxjhqlcZRpF
	9MSYvm08Ir1JaZQrgMReMsZTOsX0dr8MV4zMM465Chypw/06gAsW/MKHXdyy5Lq1OyoK
	34SA==
X-Gm-Message-State: AA+aEWa6gN0HAcH/Jt5Z+q7dyDA+CB5hTFE9VXIDkwoW8aO8NZhp2gL2
	1NCqvB/6VJvLMNndQDxFHgI3659UWZf8wHQmHy4=
X-Google-Smtp-Source: AFSGD/XZeco15Gs5YPRQdBT8rzTM7HHaffsq71d/7ZdGhrm/86UrIPAi/wcDGEMHaQKndq8ktVQ0gV4vci+ENfnh0JU=
X-Received: by 2002:a1f:9b8b:: with SMTP id d133mr6515801vke.59.1545073409804; 
	Mon, 17 Dec 2018 11:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20181217180651.16040-1-jed.openxt@gmail.com>
	<CAJTo0LbWf7cWdwCqXGOfr+dcqWEeP9ZE7cS-AK6x++uUp8gG0g@mail.gmail.com>
In-Reply-To: <CAJTo0LbWf7cWdwCqXGOfr+dcqWEeP9ZE7cS-AK6x++uUp8gG0g@mail.gmail.com>
From: Jed Lejosne <jed.openxt@gmail.com>
Date: Mon, 17 Dec 2018 14:03:18 -0500
Message-ID: <CALUs9jgcYvOr2TZy95bq39wp48-dNcUupCNK_UpcExMJb5ReyQ@mail.gmail.com>
To: ross.burton@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk3: enable wayland banckend
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
X-List-Received-Date: Mon, 17 Dec 2018 19:03:29 -0000
Content-Type: text/plain; charset="UTF-8"

My bad, sorry.
For some reason things started working after I added that option (I
already had the DISTRO_FEATURE), but it must have been something else.
Thank you for reviewing.

Jed
On Mon, Dec 17, 2018 at 1:10 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Mon, 17 Dec 2018 at 18:07, Jed <jed.openxt@gmail.com> wrote:
> > It is disabled by default, and required for things like mutter to
> > be able to run under Wayland.
>
> From the recipe:
>
> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl
> wayland x11', d)} \
> ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}"
>
> PACKAGECONFIG[wayland] =
> "--enable-wayland-backend,--disable-wayland-backend,wayland
> wayland-protocols libxkbcommon virtual/mesa wayland-native"
>
> It's enabled if the 'wayland' DISTRO_FEATURE is enabled.
>
> Ross


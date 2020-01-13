Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com
	[209.85.161.52])
	by mail.openembedded.org (Postfix) with ESMTP id B56297FCE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:57:40 +0000 (UTC)
Received: by mail-yw1-f52.google.com with SMTP id u139so6034965ywf.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a1gbqauph6oFInvL+tkKUOgC7dTzr8zJEJcjzvuhv4I=;
	b=YEzJfSC41eJfGQXo1D8FX7aB7NqodDaAI6JgZVzbW1IfFE22I8qE0zgPRQICmsvgyS
	D9YLJFpvA4jbf5AF3uTn5eWL0LJoQnRaXIZfrXkEObzkrcVmI1KZFhZ3wLTy71VJVyG6
	fhwXiIkQWSXhoBTw/jg7XosPPZDALcb7YDUQLtzxXdzawYOLhVJnYfXkeAaFec8WteVc
	c83nct3yiVGYF8HpOcGvUpV/oSp2AV23rQ0s8V00wgkNrFRIgXrRCzX5F+O2sXlJCK67
	1b9lFgHOAA2j1eDYqfrYgNYiojY6qCPO110lH7fZ2aK3+238sbWD72pppAfOhFWn39uY
	x0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a1gbqauph6oFInvL+tkKUOgC7dTzr8zJEJcjzvuhv4I=;
	b=kZwqHGlFXTVzmDeqMKW/gOmUvJlOiZHD228nv5T39KLTbG0zCMeZSrPdY2/Kelu7iB
	/zoHXCnZoabTCZ6EswzN85CNYF5/tgJZgbzer1FUl6YaFKu3XphJ4lyW2ObpFFIte08E
	i03n5CfX4cgR2yGG03otySfCOFTQFp2qeRVhKHTPITI0F0gKpbtnK7m1t9BKelNwu9yx
	ZEK7QKwRiIXDVqd8Rn3xwqRS9mm1V5OIGdndjOZWkYtERu8fmffJxeL/q+tHjtoujkhV
	4AXdemgoUgW3U/CoGYFrJEm7bYl8VD0d8A6ZjNWrdrWxxwYt4jHwXGluRBDQVV/OTf06
	d5Sg==
X-Gm-Message-State: APjAAAXU4A0zT6U7MjtfGIAW2ME/ky7K/DkrXDdBxWrpCV7K5EtCMpfu
	p/+Xf1GVbly5zFtbLIdYNQLoxtBefTPKdy9xQKQ4gNHOz7U=
X-Google-Smtp-Source: APXvYqzYhY9ZbJorCKOGCeK73r+os+NUtM0IN3liM80ZeiIXmnGhIDUg4mpZFJHFm0Qvmks7cbEOtvT+xN4Sbohdb50=
X-Received: by 2002:a81:89c4:: with SMTP id z187mr13627829ywf.83.1578923861592;
	Mon, 13 Jan 2020 05:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
In-Reply-To: <CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 13 Jan 2020 16:57:30 +0300
Message-ID: <CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] wic: fix images build in parallel
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
X-List-Received-Date: Mon, 13 Jan 2020 13:57:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > OE wic plugins create temporary file with the index of the line
> > tmp file name. This causes race in case several builds run in time.
> > Add more entropy as timestamp to remove this race.
>
> How would two wic images to be built in parallel with the same work
> directory? To my understanding an image recipe only supports building
> a single wic image.
>
> Thanks,
> Paul

bitbake image1 image2 image3
all images build .wics and use about the same files, like firmware.
Issue is similar to that:
https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html

Maxim.


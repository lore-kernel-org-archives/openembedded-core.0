Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 71CA56E89C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 11:47:57 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so1093111pbb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 03:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1zX6cP1mBvm43tLFYVoLQIsWVHXz56bFoANMFVZ0LvM=;
	b=cbm++88BP/W0K7ioYDirtklnRNHbFmCw0cXkhQ41ngZo5fLpmGI+Rw+VqMPfeekiix
	zBOVBm8HY1rk2FhT/hgEfukhub4FglOYZQaKAXKppap48/9Ec4yCTiBiJvPtU7zSFWks
	Hw3o0Q8C8RYxwLliH3mY5yiwNQ52h1erome/TtHNxjHTs+B8qPWLOmhE2HA5hdVAVZzE
	0oB/Djgu/fajPa6wOj8dNau0n7YdRrISBPUwITgxwdlRDlutif1w9jms0qdfbGsvua+f
	+4ZgF5pizg2/odP3zDvgd7kzNi2B8AYuuwfnXRnZlIX/jiU8heBLWNJxS9QWCzUo4N+d
	hltw==
X-Gm-Message-State: ALoCoQlmY9U3UFVRXfk5AzNVTbu8UfgISeuQoCDCTVrUDvLq2SdKWImTphhbCmf+955MZtz6z3L7
MIME-Version: 1.0
X-Received: by 10.66.250.161 with SMTP id zd1mr25071805pac.136.1393242478926; 
	Mon, 24 Feb 2014 03:47:58 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 03:47:58 -0800 (PST)
In-Reply-To: <CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
Date: Mon, 24 Feb 2014 11:47:58 +0000
X-Google-Sender-Auth: XEUuL69jlMbcGOMDwwgvhKNvqoI
Message-ID: <CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 11:47:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 10:28 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Feb 24, 2014 at 10:35 AM, Laszlo Papp <lpapp@kde.org> wrote:
>>> are you setting TEMPLATECONF variable? if so, how?
>>
>> cat setup.sh
>> #!/bin/bash
>>
>> TEMPLATECONF=meta-foo/conf . oe-init-build-env
>
> hmm. do you get any error message?

Nope, I have been using this construction for several weeks now. The
local and bblayer samples have been extracted properly into the build
folder, so in that sense, there is no infrastructural change
introduced in here, just yet another file added in the folder.

> meta-foo needs to be a folder in OEROOT (along with 'meta' folder), or
> TEMPLATECONF can be an absolute path otherwise, as you can see from
> this code snippet (from oe-setup-builddir)

Yes, meta-foo is beside meta.


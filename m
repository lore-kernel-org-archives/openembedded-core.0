Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id CF2ED7F825
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 16:36:06 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id e10so4313643ljj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 08:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7LmhfRgxxgdOrIWvSCaBdyUUc7VD0mzmAevuvkIhg7Y=;
	b=yZVHEH2vG8Yz+SrYa+lPVGru2G+5583ur0Jb41uOMUX41EwShzCzH7A/UDwjnIMYu0
	v7fQhljnBt9k6G8aH5vN8UPL0pi1lymQWPaPrfhi/NdztVrNXEfXmRERR5cTEZsgPPO+
	s0UFvDp4wxeSlKWgxYRH/OSg/GZnDp35+fvHepZZnz+WfPqKw46fz/XaIbrcECzR1Y7U
	wx0NaNjC/lI74lDYIDByMKPrSYjsZeRTmQPruCEsPuQcFKnzT3Z7iHQWHikJ88ndZixO
	e/OUQbYx2IZ3e+PzAHyNDgKCfhHjwz5l0lkuJic1w46IVGNQqrWi2zfOXy/dvsQvrecH
	TtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7LmhfRgxxgdOrIWvSCaBdyUUc7VD0mzmAevuvkIhg7Y=;
	b=d+m4PLBrqtUeTavJDqLX+daX8cQRn6kQU9uG3C/LbOtoHYCkw3SAMGEcKmD/DpoK6F
	1+IgHJIZ/5dnu9DWpi18Okl77esRaWArYnJM+1yHiU7EQ9BdawQ4iZQWRpqaeqTBRqJz
	fqEW3c/GAnJkQikG+jotuXHRia04PTbdSxGsYyapweTrhm89X0qOna0cciIgodJ376zh
	BgpiMj7pLwcV7EcrdjhGWYrLJcwMfET2hLLtCrjxS5p0DG8Vk8oGitEY1B4iLMnQXZ0h
	RrkF3BFEaiGf509BfRqDZXt0yrlLGYbtcxhVsEeGFe+HUxXrYuh0WCcSVa+fnogcuFPK
	A+Wg==
X-Gm-Message-State: APjAAAV5v2owyvXpsBjf2pMm2qQfdQ0uv5Us3UufQfANkDI+r751U+ha
	PtFICGfPQjLkDHtRyccFJf2Vw670YssuwoJA3NOu8A==
X-Google-Smtp-Source: APXvYqygCqlpqas+ZhuQUcXjmnJfFbUiM6N7SEFZbCBE+BVTuSrZPYq5QqtSVgVh9hjMN6NHS1+TCcaIbN+rs/VwTsk=
X-Received: by 2002:a2e:9906:: with SMTP id v6mr6188434lji.90.1575563767298;
	Thu, 05 Dec 2019 08:36:07 -0800 (PST)
MIME-Version: 1.0
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<9058755.I6fkynWszP@shodan>
	<CAP71WjybqtUNXJWnOv52QQYevR99_tVyEPpHjx_rwVZfjU02nA@mail.gmail.com>
	<2454376.zbUpM14kzO@shodan>
	<CAMKF1so90+_uwUjcXRVB69qFa8ikkcCsjEeR=WzLkQcSz+553w@mail.gmail.com>
In-Reply-To: <CAMKF1so90+_uwUjcXRVB69qFa8ikkcCsjEeR=WzLkQcSz+553w@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Dec 2019 17:35:55 +0100
Message-ID: <CAP71WjwOvL2rO83jbGD5c+pjz+HviBNufNYcmDYZAaRKk=UJ-Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core python minimum version requirement
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
X-List-Received-Date: Thu, 05 Dec 2019 16:36:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 3:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 5, 2019 at 2:19 AM Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> >
> > On Thursday, 5 December 2019 7:48:11 PM NZDT Nicolas Dechesne wrote:
> > > On Thu, Dec 5, 2019 at 3:08 AM Paul Eggleton
> > > <paul.eggleton@linux.intel.com> wrote:
> > > > FYI I came across repology.org which tells you the version of various
> > > > packages in each distro, though it's not ideal:
> > > >
> > > >   https://repology.org/project/python/versions
> > >
> > > Nice! How do we get OE plugged into that? Have you looked at that?
> >
> > No, I haven't - only discovered it today. I agree we should look into it
> > though.
> >
>
>
> you need to have binary feeds somewhere.

I don't think so. I believe it could work straight from the layerindex
JSON API. in fact the 'source' could be:
http://layers.openembedded.org/layerindex/api/recipes/?filter=layerbranch__branch__name:master

and then we need a simple JSON parser that converts 'our' data into
'their' format, such as:
https://github.com/repology/repology-updater/blob/master/repology/parsers/parsers/ravenports.py

If you check their debian config for example, they use debian 'source'
packages for input:
https://github.com/repology/repology-updater/blob/master/repos.d/deb/debian.yaml

>
> > Cheers
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel System Software Products
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


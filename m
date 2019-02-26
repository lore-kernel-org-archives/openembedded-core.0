Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5FB7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 15:36:31 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z7so10983525lji.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bSq906wM5nDmfkcd6PpGtb9AkOub6j9oAkaYX/Bz6RA=;
	b=wYJ3WvrW03Ll0xbPY6BdSy/X3/UlwQj65voupRsgUP3Ve2kCKeq6GTcXMUFN0QwYVW
	SY7JiKnxfE0h6yuSyH/FQNwHOMWj5re9ylgSt1xgimA2CAw727Cfzhc5CUlR9DUEQ8FM
	ZYl6L7BlPXG+N7fQmk8nVD05NKRvYwhs+xPHTYcOA1bxLXBfcZUezUAuqhpPNAawQgrl
	58stPYQrjjVPGRucJMSDgNqPaCAlynH6eDgsapvr56hKzi1M9EgOe+KL9FUMmlg/r8xK
	Ltjpv8vlawBZC+9LC+jtdU5ciPSpd+qRUbfTlUbRgCCN8cc4vwL4sDFnUoMcuzB1MmGB
	bcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bSq906wM5nDmfkcd6PpGtb9AkOub6j9oAkaYX/Bz6RA=;
	b=td9062chCJ/67NhD87MkirJDIM9g3ydk5Md3bUne5C67DZAbQyVJWfB0g1TqquL0Or
	O78XsbTBQETNlkq7+wFA/zkd1NcLHbY1cZwrdnTebtEhP05QpqiAYtTtCAPmye6Ck8I7
	bycMKoVEJh2el/xcoY1mnexsa7x/ImOcAo1whSHPKzqI4ivaqOCuliSzAvdtp6LA98po
	4tA8RNu033UFbdYkdMiDQYUpG+/+7Tc8YCeuNvMjF8Az9IK2KeSGrXvW8Pxr5maQcDzE
	GnjwkYPlcapziUmAki1Jkimtes3N/TsElJdiAgjLKMMyTCNCr9m0/94hEI2gUuoFLM3W
	B2vQ==
X-Gm-Message-State: AHQUAuYdUU04cJjF4CppZrGrJ8g+cDjJAqgJYO1zZyBPXlY7zG5A/Uau
	71mdmXu6EcGe3ecqjqzkNRbh/uSbJKXEMFn6wpcxHA==
X-Google-Smtp-Source: AHgI3IYyNA9LVsqbrtPlZo8zSUoxEAd7IGKMT7v3ISZiAS3KVG6zpdSGswyP94RE4cbNs7ZKL9qHljFsO97gNhwZaJs=
X-Received: by 2002:a2e:9a8b:: with SMTP id p11mr13808798lji.66.1551195391613; 
	Tue, 26 Feb 2019 07:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
	<CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
	<CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
	<CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
	<CAMKF1sqynSYK=u_qTXkteuSk1s951JAXucnN9r=8=CVOCUD=SA@mail.gmail.com>
In-Reply-To: <CAMKF1sqynSYK=u_qTXkteuSk1s951JAXucnN9r=8=CVOCUD=SA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 26 Feb 2019 16:36:20 +0100
Message-ID: <CAP71WjyHDmhfM=zNaCL6V+YNuW_eumLfFk8iVapxC9iP+k=iiQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Tue, 26 Feb 2019 15:36:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 4:08 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 26, 2019 at 4:26 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > On Tue, Feb 26, 2019 at 8:58 AM Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > Patch has been accepted, so we need to cherry-pick the patch I mentioned.
> >
> > We will wait for 19.0.1 to be out to go to meson, so it will be
> > applied there for sure.
> >
>
> I am still seeing fredreno build failure with master-next
> https://errors.yoctoproject.org/Errors/Details/230466/

I was about to suggest that the right fix would be to get rid of that
recipe, since it's been deprecated, see:
http://bloggingthemonkey.blogspot.com/2016/11/a-quick-note-for-usersdistros.html

So i checked the Layer index to find which layer has the recipe just
to realize it's my own meta-qcom layer... oops.

Are you ok, if I remove it, or do you need it for anything?

>
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


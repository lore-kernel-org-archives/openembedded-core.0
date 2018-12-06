Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD196BBEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 16:06:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y16so603058qki.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 08:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dqNF+iTVIdAX2tOtnde6v8QqpKfCkQeNj1FiufoEGm8=;
	b=P4AopXdK6UWhyugxZ0+vt7L1j62nw/8iai4V6x7HKDjqkm3lEGXMuTsUwh2SaD9yDE
	pThmxA5DbhrpTfFheUOnbFjUdrILllU4MnOW9hkN+WaqLGCNQ9iEHl2tih/OS/QyT/Zw
	D2Q2/3A6dHQb8Kae+s9cG+RZr+Uub7dRXyzvPllSNaHNGhvGKzFd8krkRWsgd0aOWcOb
	VcBnS/kw4g20WhBnjhE0ic1yBmXCtj0gzEU+zgFxFkVVyYDISMx0KuariieIJjXR1hVz
	0cLR93SE3WOa6S40IHrG3I7UEMTc6ircUvKOhIfFYthzYNdyLNbCTR9YTpXjMkA+yPOc
	S8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dqNF+iTVIdAX2tOtnde6v8QqpKfCkQeNj1FiufoEGm8=;
	b=AgpzDItGSNHA64lUS0sQ5h10IGu0F1p2JeQgoVxSlExl1L48rUn263LGA92Ri9p+z2
	c6XrdCg/me+T6tHpCEqL7lUZmbD4nYHDuD+Y55wCuNP++LSqXjymLSOA8j0oFaouGt/K
	mU8+oImTEFLe2SpaCWCaNUgCp9tsWd9OmEji3wmwuEcqrctDtZWNYtK7+umHDBtYJdPE
	B3ZKsF8ZgHG1N1HYkEW8ghxqjgXy9kYXBIBOJev+hOOrBwKQ2Ow9b8G6BY/N82xowlnE
	ZWYVYafPBQ3pukxZmPEwDjGQFPhoxLuLa/hBg98Yj1knjKvRvCQ+I9kUNhMGEXJ1kgq1
	1rOw==
X-Gm-Message-State: AA+aEWbLMYoPz0cW1DLMoKeli1rKPsgohXWNHxRe1dJnLXYY5kMihPhN
	4HpIj8mt4v19i0UXHUWDHvd67WpnUSd5q8T68U8=
X-Google-Smtp-Source: AFSGD/UPPSuXU5TGRJ+UFUTU3EN2pucTsr6cpM0vjRYE58et4nlrFstklpN+gUspuyMmM+zjlChl+8YcysVHCIDMc/Q=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr26350956qkf.223.1544112402083;
	Thu, 06 Dec 2018 08:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20181206000749.28731-1-raj.khem@gmail.com>
	<CAJTo0LZi7zY+g9PKd=eUr9PnipvfTBeOXaC_y91Wm87+aP=oPw@mail.gmail.com>
	<CAMKF1srv3AYsM8XFpOPO=A+mt-cQLxVKkU9rm17XxNeg0yMkyQ@mail.gmail.com>
	<CAJTo0Lau1hQKrPyCBiF7GA=LgUHcLh8n27KwrSQ5qo247qVK=Q@mail.gmail.com>
In-Reply-To: <CAJTo0Lau1hQKrPyCBiF7GA=LgUHcLh8n27KwrSQ5qo247qVK=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Dec 2018 08:06:15 -0800
Message-ID: <CAMKF1sq1Fo2vstoaroYG3=Hsw7hg=BzWQW89mT-UEkM1B-ERwg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Enable building static archive on musl
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
X-List-Received-Date: Thu, 06 Dec 2018 16:06:41 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, that's correct, for glibc is uses libbacktrace, which is provided
by glibc itself, thats why we dont see a need for this with glibc

On Thu, Dec 6, 2018 at 8:03 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 6 Dec 2018 at 15:45, Khem Raj <raj.khem@gmail.com> wrote:
> > Yes, they are. But for musl libunwind static lib is required for rust runtime to build all the time static or not
>
> And that's a musl-specific quirk of rust?
>
> Ross


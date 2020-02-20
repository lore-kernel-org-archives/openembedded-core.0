Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C129615D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 00:10:19 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id i78so699728vke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 16:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YsCzAbRlsJhS2v7wXSZcqoqEj991Lph4vHz6nCM5+VU=;
	b=LHHUFz/j2cRdpJe3L8gay/n3hKUlvp5Qwt/bw9+eq5D8KQW7pYGEK5qvQIvtJC4pSH
	J8JY5tBgDJJhzIem7pg2zm9dphO75dxMsIlDxedm5XiLe79fWyaB+iqeQOLvi9IruM94
	X/EPgRSc5D+zK7snOsyWpvCUq26XAnxOYZSvA6CKUBgAXeOYVRUrpZ09kXk0Gh2NKyTG
	3UUIekLahc8E91iWcbSuUJZ5rr6GOf53Bral/U8W3n9T02nFzsSM+niSNU81GEfTucqQ
	2GsUVySzwPkkWJ5SW+NhlUXpuZ6mm5u3uh2/BxaSTogtPfWdFxCSZwzU/M5RbcoNUSmZ
	6CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YsCzAbRlsJhS2v7wXSZcqoqEj991Lph4vHz6nCM5+VU=;
	b=ZTK9zC8/wFFDClcoalR0dRYeaaqHX2ZNaH++CvtFVyYgjEx38CvNAmHGJDBvxI2kTV
	wdgh4g4yVVFMPfXzSUjtbbDzKBQpfW34fYDOUuYiyBnTKS2+zJWEdtcPSOAOPjyKzmpH
	+dcg/s7kA1REx9Djh0msLJgFMhOtYWvizk03bJegYaI3naNc+z94FKCQdr/2WBVwVnTE
	AqkVDqJDjHVA0giR6ArOVEeFIEzw7jpsZctKBOXiQtWOzudzKd33BoK+H6HNoXrkXwHs
	YpQEKgogDu5X3Oj4EQ5rgHcDgd04SrUdvJ6IgnX3EHZMJ+gQz1DlV119ivV7PRmN6uIk
	KlMA==
X-Gm-Message-State: APjAAAUM6rXomFU7YMgF/s4Ewxdzv0qOWWGuepFBfI7BbrOak9pFBmoB
	7T3zyunyv4Bo0z6FJlJ/VBg8Fk1Je4PYAlETy1EWiMAq
X-Google-Smtp-Source: APXvYqyLivBOJNpawaXotNLl1N/KRrzSdi7cHIhY+XHzbhH+6u7R5Keum2xHl61fxpJqLOjKbnd9HlxAGBQRCe4ayFw=
X-Received: by 2002:a1f:ee45:: with SMTP id m66mr12804944vkh.75.1582157419889; 
	Wed, 19 Feb 2020 16:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20200219214303.138067-1-richard.purdie@linuxfoundation.org>
	<CAJ86T=VsVpM+KLzXdQ569T4LALG4fDT2sS4v+4YCp_6LTZvfsw@mail.gmail.com>
	<9ef969cbe41ad90330b52b045eecaf8688fa18e4.camel@linuxfoundation.org>
In-Reply-To: <9ef969cbe41ad90330b52b045eecaf8688fa18e4.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Feb 2020 16:10:08 -0800
Message-ID: <CAJ86T=XEUHdOQ+rvxd-FpzsYB1qQiwCc2iWf04KZzqRuBMZViQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample.extended: Document how to limit parallel fetch tasks
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
X-List-Received-Date: Thu, 20 Feb 2020 00:10:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 3:16 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-02-19 at 14:05 -0800, Andre McCurdy wrote:
> > On Wed, Feb 19, 2020 at 1:43 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > [YOCTO #13235]
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/conf/local.conf.sample.extended | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/meta/conf/local.conf.sample.extended
> > > b/meta/conf/local.conf.sample.extended
> > > index fcf4a9b7c1a..443b4e83f9a 100644
> > > --- a/meta/conf/local.conf.sample.extended
> > > +++ b/meta/conf/local.conf.sample.extended
> > > @@ -23,6 +23,14 @@
> > >  #
> > >  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE
> > > = "-j 4" would
> > >  # be appropriate for example.
> > > +#
> > > +# Some users are behind firewalls or use servers where the number
> > > of parallel connections
> > > +# is limited. In such cases you can limit the number of fetch
> > > tasks which run in parallel by
> > > +# setting the option below, in this case limiting to a maximum of
> > > 4 fetch tasks in parallel:
> > > +#
> > > +#do_fetch[number_threads] = "4"
> >
> > How does this interact with BB_NUMBER_THREADS? If, for example, both
> > are set to 4 does it mean there could be 4 fetch threads and 4
> > compile threads running in parallel?
>
> BB_NUMBER_THREADS is an upper limit which includes fetch tasks.
>
> > A related issue when the number of parallel connections is limited is
> > parsing a large number of AUTOREV recipes. From what I remember the
> > workaround for that was to set BB_NUMBER_PARSE_THREADS. Maybe that
> > should be documented in local.conf.sample.extended too? Perhaps even
> > better would be to define a single new variable which limits the
> > number of parallel connections in both cases?
>
> I don't know how you'd implement a total number of connections limit
> from a code perspective :/.

A single variable such as BB_MAX_CONNECTION_THREADS which, if defined,
would set the limit for both do_fetch[number_threads] and
BB_NUMBER_PARSE_THREADS ?

> You'd probably need something like a make job server where you obtained
> tokens before making connections and I can see this becoming "fun"
> since you'd have to markup every code section where a network
> connection was made.
>
> We have a conflict between code complexity, maintainability,
> performance and functionality and I'm not sure the use case here
> warrants the complexity...

Of course. I just wanted to share it since it is a real world problem
(I've seen a development team stumped for a few days before finding
BB_NUMBER_PARSE_THREADS, which isn't nearly as well documented as
BB_NUMBER_THREADS and PARALLEL_MAKE). A comment for
BB_NUMBER_PARSE_THREADS in local.conf.sample.extended might have sped
up that debugging process.


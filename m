Return-Path: <malus.brandywine@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAA36139B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:30:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e10so34423938edv.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PpYOF/lLGHyvTyCAqEnRghuu63cwepmPzXtn+9hSrh0=;
	b=mrZLEdp1WDwOakyAXMgVU+m/R6L5uRasK3FD+y0cmzLfRbZ+AnnuVorqRh9qIjLP7u
	RMfyi8ed6kBosDFN7pA6dETc3cBaLTuiJjmeODWVAmiD9w2HNwudv2Q73No+Wsx2Ud6/
	Iz3Bp9ZmrmTzcvAZt3q8S0F2ovXb3HGYPOasbW5sm4rw+/HAHQueQsQLAC29LdUqIZVS
	+w49MCKoAUbQdLLhmbqBzSuHKon98C/OMb9fcZ0CKOdT5bX4GXxD2s6Zp/YLwZKcV8Vf
	wTTRUXmO5jFGeWyk+lu0uASE6ymIsPhVncZPtimF8URwnV7uYcL7sxZZ3RHVikwprJHG
	gx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PpYOF/lLGHyvTyCAqEnRghuu63cwepmPzXtn+9hSrh0=;
	b=nNxPsV2LQM2NoQSi31knaT5vwBeTfStcD8lQxHwAtAJMyc7nnTSbu/qpQJoxzcQTwD
	/z4we9n70rakBX/FsiJwc4PtVcPZ4gVZTK3OAqygKpi1ZY4Ssn2dJ6mLryYMrFxidrZT
	A6ZtqTSFBNqS9ahLDHtCSOc+xO7C2ziXuyg1AGRcoHsHNN6+fPc3SsINhD+0B4WDRS/D
	8mlcvaviK8Zu16mkJ6/08i8V2w9zGEOjBXJWhaCVtKz/P3b11B6dtFq0kjQzI11JxnIy
	wM4Tp5DNJJlHMcS0OA28KpBs/YsuFaG8Iqt4wcGwwqSn2JWmp/QbCp33B9QTtcgDg3ui
	C8ow==
X-Gm-Message-State: APjAAAUfYd/5Qnk1e+oRrMijUHTmuhINZAD2pRJnF7RA3NwvdOYii3gA
	r10TkmerKodL7LSgKLbHNOu46sRMZrvtzFSkev8=
X-Google-Smtp-Source: APXvYqz0+jL5GUWf6xD0KALyCJjP3HMTDkY94TMadrY2XmEwOKEVyp6gxEM0TCDT62ucvtg734yDUCwkhnhvYvzT6MQ=
X-Received: by 2002:a17:906:52cb:: with SMTP id
	w11mr30821064ejn.59.1582216232490; 
	Thu, 20 Feb 2020 08:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20200220150318.20003-1-malus.brandywine@gmail.com>
	<18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
In-Reply-To: <18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
From: Nataliya Korovkina <malus.brandywine@gmail.com>
Date: Thu, 20 Feb 2020 11:30:21 -0500
Message-ID: <CADz_WD7JjTriaEv2Yo0WpjxfMAuR4o-ML70zbZJne+6kYR+5TQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Set default CONNECTIVITY_CHECK_URIS to https://www.yoctoproject.org/
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
X-List-Received-Date: Thu, 20 Feb 2020 16:30:32 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.yoctoproject.org/ is good enough until the project is on.
https://www.example.com/ doesn't exist for at least a year while I'm
witnessing it, so the instructions of "Quick build" don't work
out-of-the-box.

Thanks,
Nataliya

On Thu, Feb 20, 2020 at 10:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-02-20 at 10:03 -0500, Nataliya Korovkina wrote:
> > Signed-off-by: Nataliya Korovkina <malus.brandywine@gmail.com>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc
> > b/meta/conf/distro/include/default-distrovars.inc
> > index 433d4b6651..6c9155b2ae 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
> >  # fetch from the network (and warn you if not). To disable the test
> > set
> >  # the variable to be empty.
> >  # Git example url: git://git.yoctoproject.org/yocto-firewall-
> > test;protocol=git;rev=master
> > -CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
> > +CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/"
>
> Why would that be better?
>
> There have been several requests to change this however I'm not sure we
> can find one perfect url we can use :(
>
> Cheers,
>
> Richard
>


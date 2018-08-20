Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2B4F79017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 19:45:36 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id r21-v6so17593111qtm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4+3t+RKNqZSA0AiDpUIptVz73ng4Wmf2+4Ad/Ll1Kew=;
	b=FYuNPJ8T63IVzGv/pO+pszlFyFfJVCV5C3gcBRelw+wKTNNB/DKurh4YVmgsWESVX0
	5rDjj109VxSotnURtCOO3QcCJabnRZNcG4ISmO/lGIw6iojVkQqOhWFy+13/OaHT5No8
	DG3I+85ybqLkxciMju2AkEfDZLoKwjsPhUu6lOFy/kwPhb1Gud+cz7byw5656tu/1avo
	1EPC0gFZslgwbacpInzDEsiBDqc+7iXZf6nq6xOvMzwrDkMUUc3sCraD2jNHa1YEp7Qz
	wk07B46pFOgeXJx9hJ3cjoy4/OKSBTegk+UrYlPMeA1+FaNrTGcZisMRPMaaFjL4nZLg
	kJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4+3t+RKNqZSA0AiDpUIptVz73ng4Wmf2+4Ad/Ll1Kew=;
	b=ivwbv3oYzOtO6QqD04jzlnbhJJKhimrKG6s077zWutC8TEc5HEQRPmKzMNlLScZzs8
	h3JAxwwy10sLxbPkx+20ILJ0YFi7WHWHPRnP0dbnijqLYFTLTNF6SKhtITQgEu0sSny3
	IqQwsu28K/PNSeQhNsCs2622O/1k78PBkD+xRfivetxcxkwSDZEdbasWzXyzUpPfOTvp
	A1VIrJQ4Z5g4ykQjsdCJm3j+pLjqvkDkBF/DQExp0Mef5kwyDVzpyd79aTST+HHPAoY9
	/NtJT14zHnv44THWOwPJ+RS6WkX4A6qyGHQ6YvDzT9GKO0M6NdCwsGj1SEFRFWQi3mOV
	Eicw==
X-Gm-Message-State: AOUpUlEm7JjrQyyXy8XWBWCxQrxlM+rieYnS0I/9Zz4eycKbdTLa60Pf
	ojjj1sHpmM9elPTd7/60T9GXM4WGjqqzHkuqvjE=
X-Google-Smtp-Source: AA+uWPyv9rRNAivWrFlMiHs/RqZNHX8F+hSRE3+93F3x0SwF9IU+AQXcSWS3sXxltW0ytJOcnOpOYLa68tRypMrFczA=
X-Received: by 2002:a0c:e90c:: with SMTP id
	a12-v6mr23369559qvo.224.1534794337516; 
	Mon, 20 Aug 2018 12:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180820024616.12501-1-pkj@axis.com>
	<9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
In-Reply-To: <9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 12:45:44 -0700
Message-ID: <CAMKF1soPC5rCXEzZN78NuQS3qyFNQMv03QQVF8w3kduJn59tRQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Add a dependency on virtual/crypt
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
X-List-Received-Date: Mon, 20 Aug 2018 19:45:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 2:45 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2018-08-20 at 04:46 +0200, Peter Kjellerstedt wrote:
> > busybox needs crypt() if CONFIG_USE_BB_CRYPT is not defined.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/recipes-core/busybox/busybox.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> > core/busybox/busybox.inc
> > index 8c6dbbaf9b..a8ba10d21c 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -3,7 +3,8 @@ DESCRIPTION = "BusyBox combines tiny versions of many
> > common UNIX utilities into
> >  HOMEPAGE = "http://www.busybox.net"
> >  BUGTRACKER = "https://bugs.busybox.net/"
> >
> > -DEPENDS += "kern-tools-native"
> > +# Depend on virtual/crypt in case CONFIG_USE_BB_CRYPT is not defined
> > +DEPENDS += "kern-tools-native virtual/crypt"
>
> I'm not a bug fan of adding dependencies which might not be needed. How
> common is CONFIG_USE_BB_CRYPT not being defined? I assume that isn't
> our default config?

yes perhaps it should be packageconfig

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


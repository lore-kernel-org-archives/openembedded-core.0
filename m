Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4977900C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:39:26 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id u21-v6so13831770qku.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JOHsxYEu+1ngWKnvoMrh/9wwS+7XIfbiOvxUtS1xGM0=;
	b=Ap7ETduMb7DH3Dz2LS7G6JJ/U8NZNK5sjLOz+oo664LXVCItSk51OR8Em3A+vtU1ap
	YW2Y/jtrbe2ySyo6beL8Dtm/KFb6ue9VUd6lrkGm8EUHjbraXQu4uGdinBgcMKTeVoWo
	mmFg2lM2yTmVbU/b6n9ciikTDdbJV8joUCC5WPndHSii//wNh2gO2b6SxrRcBznwqAVW
	vhmAiAgRiaJ58H1q4XCRwi9SkBim49qKiVafACAc1NLffQcni05fQ/F7Jc075TPg0UUY
	eKHDg2jE2R8ujY7gAX/EBb/OAYFBveHmPPth63caoc7bzZzq6OtqFQ5OlZYrK9Cuck8H
	0rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JOHsxYEu+1ngWKnvoMrh/9wwS+7XIfbiOvxUtS1xGM0=;
	b=rSjBkEfVcNPsxWFXXUamHsAIVKO3YQivH0dcOfnc8aB3mtx3x80wPhaPi1BHRXg420
	ZkZcqwWbOuhSKM3E3tujeW5q3m1xCqZB1kKQTYtPjdrUgEQPJQow8I/G2NRATEHesP8A
	jU7YbK00yHMo4BEDA5KFnI4UkXlRG8KfejrKByyTwEWUZh+EruQrblprFHQTBVo2DdFz
	G4cHuSN/3JjZCH6DTbpQrMxEE2skHb8KrTfp4DzvAqYeMplM2lyz5OLUs9YdPqeLdBZc
	vZ8ApN+Z7D6jw1S2j4Yp9Denk5XnerPm2naR6MFrpZM0Vfla9cEUzaSdCGx3QBnAjsTX
	v45g==
X-Gm-Message-State: AOUpUlGGOxunVdSHhoiVZ/1h2P030D88jHa8fBAIC8OaHJQbkoExbtCT
	0hmjtTnPXFc45UA41mdr2tuUxYTz+V8GOaAiyYQ=
X-Google-Smtp-Source: AA+uWPx7jyY424KavHvsG2jeCUauP7+X+R8tizE12/kDW+27XraOO0lHTzQWldVN4sByxxg4MY5wMMk2ouI1svwpgbk=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr19677251qke.406.1534264767177; 
	Tue, 14 Aug 2018 09:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <1534255849-10649-1-git-send-email-andrea.adami@gmail.com>
	<520af9857fc5f36d1328f24cc1462776967257e6.camel@linuxfoundation.org>
In-Reply-To: <520af9857fc5f36d1328f24cc1462776967257e6.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 09:39:00 -0700
Message-ID: <CAMKF1sqP8znJVim4MB89WLNGy+61D__5yiZzRXgfF1mfDVVgVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-xscale.inc: restore specific tuning
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
X-List-Received-Date: Tue, 14 Aug 2018 16:39:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 14, 2018 at 7:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-08-14 at 16:10 +0200, Andrea Adami wrote:
> > Since commit
> >
> >  a11bdc36a1be
> >  tune-*: define more generic DEFAULTTUNE to share feed between
> > machines
> >
> > we are using armv5te to share binary feeds.
> >
> > After 008085450417 gcc-8: Fix spurious mcpu/march conflict for xscale
> > we can use again the specific optimizations.
> >
> > As of today, there are no public feeds for the legacy devices so
> > let's prefer
> > the optimal tuning.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta/conf/machine/include/tune-xscale.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/tune-xscale.inc
> > b/meta/conf/machine/include/tune-xscale.inc
> > index 0d07333..cd08b93 100644
> > --- a/meta/conf/machine/include/tune-xscale.inc
> > +++ b/meta/conf/machine/include/tune-xscale.inc
> > @@ -1,4 +1,4 @@
> > -DEFAULTTUNE ?= "armv5te"
> > +DEFAULTTUNE ?= "xscale"
>
> Does this make any real world difference except for duplicating feeds?

Usually it should, since compiler should be able to use
xscale specific instructions during codegen  , it will be interesting
to see numbers to measure the gain.

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


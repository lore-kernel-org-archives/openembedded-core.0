Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id A079C7E3B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 17:30:45 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a25so10679097lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UW+MlBbexIfd0PJZenWIuZQGT6HfHQCsQndyWd2Px+M=;
	b=HvrObqVdWqyfga3n7bhsUctr9FJQLaLNOpnI5TgjiTC98TauJcoPmLzs38782cBMQC
	483XGzRgQ4lRD77VhFEcOP053C+9/RP7A2EuTuwdeHM4H6FO8G+NzuoUxuLm3J4doYRV
	T+isUP1t4j9ojCZMjGu8IbMW5xfktg1kTp3UT7B0e4vA0jZaxocM7xLZTnmWxHLA6e0v
	2b/Fe1WOGE/BEGtueuuFvXemnZcTkk4uG3KIM+GNvmfFkxg4a2/I/5piY89amZp8J8CR
	Gi2UF7S9NzAKafyjBGj7oBRUCi3mYZKkroIzv0iRqaDZOEtME2UsTABYIasViNWOjqMF
	0FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UW+MlBbexIfd0PJZenWIuZQGT6HfHQCsQndyWd2Px+M=;
	b=aQTyJF9+Lf0+rocO4q7wN4GBJFchQeVYa1CNou+2sOprTfpRoP3Jc20nKvxzSummZj
	u8tQGM4pmDtrO5fJgIyygB2WmNGw3yEa3MMxbkjUOxqZh00rAmb9YKc0zsJGUEtf4IGS
	HGyIQzdAevLAKGEUpg0y4galWlm9uBFyUuaJLVQv1MB9X6iPAWHj8yVYGlDZRZe2lU5H
	gb5GefEtnBfoQ7hmmrHbeTrXdVbRipEGGIm/zoBVaHnnvQaA6HMS06iyGTny5QTZPDwH
	4r/PlnEr+dztcS0DRRKfSyKrGOCN79RIZ3iMZgFtEh1ypTLax9XCFpnZw7mqVc3+V5RW
	rfng==
X-Gm-Message-State: APjAAAUm0Cc8JM4b9KW7s/GQWrYUKpUKjF07aDZTZ+LczyIm1v2UBS33
	dwijF7zACT6opbgUVDRIFN4oS1JPLvJus//ZoWY=
X-Google-Smtp-Source: APXvYqwiJ2CWAZeLaYWOkkVw90v5Qufm66gy9e2Ib1qpKf16RgQZmZkmxctTz4HomGGMsr7EwI1PU18yc40VY398Y1M=
X-Received: by 2002:ac2:4990:: with SMTP id f16mr19390278lfl.93.1561397446170; 
	Mon, 24 Jun 2019 10:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAKmqyKO_33RpiC4PS6vVTBUz=0Bnc7F5zbGt7mmr6VHU1rK_vA@mail.gmail.com>
	<20190624082053.GB11015@localhost>
In-Reply-To: <20190624082053.GB11015@localhost>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jun 2019 10:27:52 -0700
Message-ID: <CAKmqyKM95L2KmXyXdq+GgcZm1EWnr5wtSNfxah46Zg_xOLAKGA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Mon, 24 Jun 2019 17:30:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 1:20 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sun, Jun 23, 2019 at 07:41:05PM -0700, Alistair Francis wrote:
> > On Thu, Jun 20, 2019 at 5:22 PM Tim Orling <ticotimo@gmail.com> wrote:
> > >
> > >
> > >
> > > On Thu, Jun 20, 2019 at 6:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> On Fri, Jun 7, 2019 at 5:50 PM Tim Orling
> > >> <timothy.t.orling@linux.intel.com> wrote:
> > >> >
> > >> > SCons has supported python3 since 3.0.0 release, use it.
> > >> >
> > >> > [YOCTO #13381]
> > >> >
> > >> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > >> > ---
> > >> >  meta/classes/scons.bbclass | 2 +-
> > >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
> > >> > index 9ee7d1587d..a8ddae35f7 100644
> > >> > --- a/meta/classes/scons.bbclass
> > >> > +++ b/meta/classes/scons.bbclass
> > >> > @@ -1,4 +1,4 @@
> > >> > -DEPENDS += "python-scons-native"
> > >> > +DEPENDS += "python3-scons-native"
> > >> >
> > >>
> > >> some packages haven't upgraded to py3 but use scons see
> > >> https://errors.yoctoproject.org/Errors/Details/249271/
> > >
> > >
> > >
> > > Thank you for reporting this. I was of course expecting some breakage and am committed to fixes. Please do report any other issues.
> >
> > This also breaks the gpsd install, I tried upgrading to the latest
> > release and that didn't help. I am going to send a patch for the
> > upgrade which I tested with this patch reverted.
>
> This is already workarounded:
> http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=22bfe06d15e07cac0df3f34566a9d33007663bae

Argh, I must not have pulled recently enough.

>
> There are post-3.18.1 changes required for Python 3 scons,
> but I went for this hack after seeing that a proper fix
> would involve all of:
> 1. upgrading to 3.18.1
> 2. rebasing oe-only patches to 3.18.1

I sent a patch (with you CCed) that does the first two.

> 3. adding post-3.18.1 patches

How hard would this be? I'm happy to look into it but I didn't see
anything in the gpsd tree that seemed to fix the issue.

Alistair

>
> > Alistair
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>


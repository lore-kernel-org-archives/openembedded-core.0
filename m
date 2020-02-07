Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2B7760E91
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 17:03:47 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z16so237185iod.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 09:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ALS1xQoEMPrSnur+WqXtSGyn/mYC2nKaSZBlokQLLFc=;
	b=DOnf1njLyH/4I831lkvVzhhZChSiyttWRXtHx3E7bOdPeUSN+1mbl8G7kSu1tGPG+0
	ig+Tb79ZP95YyQquhOzCyOJxrcRZEiQ/mSpsrgTkA8KhYdclXboebC7n8SPHiaqzV1RZ
	nn63jlFdNFqUJZi8ZrdFcZLOO844cXZNgOwU5ujzd4FKsVrTI6ixoFRu0TyXUf0XmmOo
	ry+O2jEryTn2zoZoWpz9RLdWhBWqVJKyQuiKQYASArhwDDGP8bWx6Fz11vNg/taTTp8h
	K0C3Q2S91n505t14wZbY73v5djyrZh5516vXpI5E796haYpqqf2h/kUX4V0gsMLuGvUZ
	7WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ALS1xQoEMPrSnur+WqXtSGyn/mYC2nKaSZBlokQLLFc=;
	b=ipzRKNC75tb9XcyRYdInO5BKbrE9gH31HLSrQbzYcxYKkfbVHWG4dns4WeZNAE/VUf
	OBNF4Z/8/BBcmZJAebwjjFGjIOY520A6GjvCBWHn3V+4kbaiTubljpdgvZAOn2Ft1XVK
	Q/KHHTOPCFhTHpHvip0fADOJOJguQ6GKD0GTxu/xy5+1P9MfgmgQuy0xxvlG6VYQjxrx
	Wq3Z16eqdTmUOSe+RgpQu4UPO5wU4d6J9IRjvKGrHpKKZPGQUaskqHcnxb0BYTUqns/w
	svjRE9/NQUsfJU/wJ4RejaD9s5+dzWZb/ZNRmhH/rGll4nDnW6Bk2wKfVnB7NHwcnPip
	6kTQ==
X-Gm-Message-State: APjAAAUEJQCXrD2FDoRV645KT603Yv/YG9AB6t9hKOW10sJkjiRtDIyQ
	6BYGM/9ACJce9MQGw9U84P7HZrb/4GIKTtIOR/LzHw==
X-Google-Smtp-Source: APXvYqxBmNnrgLrt0zfWD2+gjg0kW2x6EpG2q9Gubo9YoqFkD97SBUIPj1Emxm13WEKrB5Ah2preZkCVz63eiOb1doM=
X-Received: by 2002:a05:6638:34c:: with SMTP id
	x12mr10642jap.144.1581095028576; 
	Fri, 07 Feb 2020 09:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20200118054107.101203-1-alex.kiernan@gmail.com>
	<9242b01969234918b10a8d1c2f494590@XBOX03.axis.com>
In-Reply-To: <9242b01969234918b10a8d1c2f494590@XBOX03.axis.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 7 Feb 2020 17:03:37 +0000
Message-ID: <CAO5Uq5RQ0-X48v_B1CdvCOem14uuZ_4GjyJmfmhtYDP-8A6hWQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs: Make BUILDNAME a weak default in reproducible_build_simple
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
X-List-Received-Date: Fri, 07 Feb 2020 17:03:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 4:27 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of Alex Kiernan
> > Sent: den 18 januari 2020 06:41
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [OE-Core][PATCH] rootfs: Make BUILDNAME a weak default
> > in reproducible_build_simple
> >
> > 11e45082ad00 ("rootfs-postcommands.bbclass: improve binary
> > reproducibility") fixed binary reproducibility of /etc/version, but with
> > the move to reproducibilty in all builds, setting /etc/version to
> > anything other than the default fixed timestamp is tricky because
> > rootfs_reproducible() runs very late.
> >
> > rootfs.py uses BUILDNAME if set for /etc/version, so introduce a weak
> > default for BUILDNAME of "REPRODUCIBLE_TIMESTAMP_ROOTFS", when enabling
> > reproducible builds hence allowing BUILDNAME to be overridden elsewhere.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/classes/reproducible_build_simple.bbclass | 1 +
> >  meta/classes/rootfs-postcommands.bbclass       | 5 -----
> >  2 files changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
> > index d0842f0f902a..153a07607219 100644
> > --- a/meta/classes/reproducible_build_simple.bbclass
> > +++ b/meta/classes/reproducible_build_simple.bbclass
> > @@ -7,5 +7,6 @@ export PERL_HASH_SEED = "0"
> >  export SOURCE_DATE_EPOCH ??= "1520598896"
> >
> >  REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
> > +BUILDNAME ??= "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
>
> Can we please revert this change?  This breaks (all?) other usages
> of ${BUILDNAME}. E.g., the information in tmp/buildstats is totally
> useless now since all builds end up in the same directory
> "tmp/buildstats/1520598896", overwriting each other...
>

+1; I'd agree that seems rather more broken than the problem I was
trying to fix here.

-- 
Alex Kiernan


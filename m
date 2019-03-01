Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6D67CD8D;
	Fri,  1 Mar 2019 20:29:41 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id p48so29347231qtk.2;
	Fri, 01 Mar 2019 12:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QdqvVGNZYEkU1f18ogJRsKh2+6LqlGxkmXTOPsyEqXU=;
	b=o+23va4wOnahoa3MZjOEbe3mYAnQ4zeXwWHyxt+Nx2PTeajRAiKfM00w37fJaCBNxN
	tT0Sax6jP5xAIoxyse8kUclN+h0oIaPK6soCHwujihuvDEDK+hr/QWHJye2Zp7B0EodH
	qcVbydpO6MozPR95LmU0y0Y9eiED8EFO38MZ0UmJ4H+N7xI4kfJb5cpCavtoXsbVgE+l
	nQKtN4CLXFTxRQ5DzeaRdFuYOWuRoWVJh5vY2vN03xaENlOeL86FzcCxFu5u8ems11qy
	6Vn1RwOvprc+MIymM0YKaWtaQwqlDCd+SSPYjpfaaOb9sBqHpwAC02iqqQ7yi7/2lrIG
	JW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QdqvVGNZYEkU1f18ogJRsKh2+6LqlGxkmXTOPsyEqXU=;
	b=nlZucLiN26+yvM9B0e1HoFVIPFfWJ0WkrkOWnoyqDEaiX6rxttITWToY0IYNpRb9Z7
	mgaHuzJczarQv/Bi0YPDqrx7Bm/5BLrAb62cegskGhchalTxTvHgYBcaKdGD0qGJEywj
	pMuVsn7XmXanzKfXUA0fHtiER+7T4H3ffbju42Rx4QW75LLkYwbRai5Af6l4aIE0ichM
	nxEJFT6DIvdRag9tzXm+UltqZ5OBAIjnxYX1ykG/aCg1AsGXszJ5hXRbN7p1CpEjWFb7
	0W5wObnlXvW1YnZnOn0GhcUemn4sOa+5DWVjZe0e3XLIZGkOS33l4Vo8mhMN/FPMkRCp
	ELCQ==
X-Gm-Message-State: APjAAAUT8bHNoQPqaFgl8bLX3eQzj4NosRrN78shW7zAWLivNTpzqcyi
	6KLU4QgEv2JHz0o1qOHpJv1qz3C1IZWPtex8JiM=
X-Google-Smtp-Source: APXvYqzVvX/jbEcfvyRoX7jSzU1SJ+6Wo2kaCWmTRhnAJb0urqlDuCo0t2QLHGnWxNF83rLzRLQTvA65gFMGAFcu1gI=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr5422202qta.254.1551472182287; 
	Fri, 01 Mar 2019 12:29:42 -0800 (PST)
MIME-Version: 1.0
References: <accf0c0a-77f8-e86c-c0ed-3af8d5a48e3b@balister.org>
	<CAFNP8OtVN5tjv3xV57q+kjiewtH24tdm3HCqHL+dMKayNcKaMg@mail.gmail.com>
	<CAPybu_1WtS2o=E6rpZzJMvpW6RQzPFxy29XGno=ok7bsTpW6XQ@mail.gmail.com>
In-Reply-To: <CAPybu_1WtS2o=E6rpZzJMvpW6RQzPFxy29XGno=ok7bsTpW6XQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 12:29:16 -0800
Message-ID: <CAMKF1spHTw45_26gHgPgdW=9fu5zMzHegVVcQ5paLKFDLG890w@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Information about non-traditional uses of the Yocto Project and OpenEmbedded
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
X-List-Received-Date: Fri, 01 Mar 2019 20:29:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ricardo

This is interesting, who would not like an improved Beers :)

On Fri, Mar 1, 2019 at 11:43 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hi
>
> We (qtec.com) use yocto/oe to build industrial vision systems.
>
> Today is running on Potato graders, Carrot Graders, Potato 3d cameras,
> Hyperspectral cameras, Beer analysers, Checkweighers, Screw Counters,
> Hockey streamers....
>
> Let me know if you think this is interesting and I can share more detailed info.
>
>
> On Wed, Feb 27, 2019 at 9:16 PM Scott Rifenbark <srifenbark@gmail.com> wrote:
> >
> > Sounds like good potential for a section or chapter in the user docs.
> >
> > Scott
> >
> > On Wed, Feb 27, 2019 at 12:01 PM Philip Balister <philip@balister.org> wrote:
> >>
> >> During the last OpenEmbedded developer meeting, it became clear that
> >> people are using the Yocto project/OpenEmbedded in spaces outside what
> >> we think of as traditional embedded. Lieu Ta is working on a
> >> presentation for the Linux Foundation Leadership Summit and we would
> >> like to collect as many "unusual" applications are possible from
> >> companies we can publicly acknowledge. Unusual is edge, containers,
> >> desktop, etc. Or even really interesting embedded applications :)
> >>
> >> Please drop me an email (off list is fine) with enough info for us to
> >> add you to a slide and acknowledge your work.
> >>
> >> Thanks,
> >>
> >> Philip
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Ricardo Ribalda
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id C328D795FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 20:54:17 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r69-v6so24040496oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=izghTRivhACvjq3pJhVQ/m9biaKRRUCIBLAtvSGzjlQ=;
	b=QIaf9HC65QoRkjuVzwC0+YZ/Ln1HB4iUYvZviswx3f5SVUD9GidS4JLx9QPAavSdcy
	sFi3wwpXM+IkB4Cs7q3vs780UToFg2vLrKi9T/ZGH2kgLVwg1TiVVW4FxoQGSkqWzL+C
	fTV6O3rE0qArS3D+fVTvDmLgJFFwgaHxwPiQMxXc7LiPwaLR0lJ2gheR6SD50mQnH0oY
	g9uOP/gS/zk71btM3wnC9G3nVMPp45O9LVPq5e/IqYAFYi7NHnU5X7hCyGymJgW4zXjY
	GZEpUx/ZwrPdnlJyWKTBEpE1xArLbxTHX2z9GRzMO14BbLaLrpwH90C48RmsHGWMw2C5
	XCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=izghTRivhACvjq3pJhVQ/m9biaKRRUCIBLAtvSGzjlQ=;
	b=Yszg9CC6s4NzmrRODUrVYRa3Zn2o62MUrnhQfqvvJY9tZ34QMZMDhiidBi0cS/edif
	/rvzcEcUpXFI7zmmMMvn4Ir2SjbEH92eNeoixGsAJj7zXF5KZuq7Q74n1c3GJCdx/QRD
	g0jFy8RvHqUodOPOgFQZWDmSyWL55ay+TpNkY+M6AsWyaXvYljfiKyP8oXlLnN2b6zzf
	JIuvQweJiroxyr8hK7gfC+s9h4zx+Uz3Oek37yb9VuqdmmGhBFUAtFzI4c/VRR4Ezn3i
	fkddNQt8IGTTdUzEtMAk8dxf8JfjMXVnVFP+cxR+xebOw/F1SB+oqJGNBTn7BudHxkyP
	zEIA==
X-Gm-Message-State: APzg51AGuGBXR1xWHNY2seKkRH2rcJ2tQmfHVYgtKprQYtAjOb1kBFCY
	GyVimS6QEPAi2Wjpbf+Ig1YoH4eFo/43VQ==
X-Google-Smtp-Source: ANB0Vdag8pyVa4SCwF8Ypj5EHv3Vw6PsE+Sp+uJorjRAX57T0JOP5XhBh4JU7iS9v0oPqFus3CVvUQ==
X-Received: by 2002:aca:3546:: with SMTP id
	c67-v6mr9415718oia.249.1535748858372; 
	Fri, 31 Aug 2018 13:54:18 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	r81-v6sm7197289oih.28.2018.08.31.13.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 13:54:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id k12-v6so24010376oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:54:17 -0700 (PDT)
X-Received: by 2002:aca:1802:: with SMTP id
	h2-v6mr8820248oih.353.1535748856775; 
	Fri, 31 Aug 2018 13:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
In-Reply-To: <CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
Date: Fri, 31 Aug 2018 17:54:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
Message-ID: <CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Fri, 31 Aug 2018 20:54:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 4:55 PM Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 31, 2018 at 11:14 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > On Fri, Aug 31, 2018 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > On Thu, Aug 30, 2018 at 4:26 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > > > This updates CMake to the 3.12.1 stable release. All patches were
> > > > rebase on top of the new source file and all them applied without
> > > > changes.
> > > >
> > > > The number of patches has changed as all them were applied on the Git
> > > > tree and re-exported, to avoid any fuzzy warnings.
> > > >
> > >
> > > This is a major version update and cmake is quite deep in foundation of build
> > > there are large packages outside OE-Core which depend on it. Can you give
> > > some details on testing to make us feel comfortable ?
> >
> > I did basic testing but all patches applied fine. If desired, it can
> > be postponed to next release as it is indeed not critical.
>
> build meta-qt5 with it there is lot of hairy stuff there

bitbake qtscxml

It went fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


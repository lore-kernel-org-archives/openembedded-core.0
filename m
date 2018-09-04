Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 59F95745C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 23:43:46 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id f62-v6so1982523qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hGyDVoUOkByRd5bvQuBw4ORjsO4lkfp+PLO4/apBHms=;
	b=MATDcU8HI95+wKtYcBwmBPQpto4vDqX6RBgqdsOjMe8ltdK6kp72vwwEMfLGcTSD70
	D0zPYIBS9e/ECL+oBKrQE86EYJA5/P0s9eO7rTMTDOToZFFghdTzdhooeG46Jb+cme7p
	bHVRTfjP+gt5QPFO33zDF31ZAzOd3X/iTJ7q0ziLGTvrY9fwNKuZBWkUuylONlySMAHV
	b89jbBQo3IsflvcuK6nq9ZKbin3PqqM4wtwaPWT/+oILoskRjpCCLI1q5quFNhwJv8+l
	s59sXyHARYHo2VT439EGLN1scU4IPp8g+L4etw7eZizj7HovplVkLxBCgG1loLt29850
	Gkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hGyDVoUOkByRd5bvQuBw4ORjsO4lkfp+PLO4/apBHms=;
	b=msrTmkviV76bA/LBr8vjxzDAKWP0CC6I73PyLLWONwGhswItnj8Y1k55n5lDjxiHFQ
	OAcl/Fn+unKxhqCkLOL4Gn2mk3d5HeAb8nB/ujZS1XhX+Xi7xnNAPdDk3pqLS1+rIqzB
	6K7D+zVieOMlBKI3prVH/jXZ3r0a2gC5G36oBjE41xq1nlLwCHBqr1hqCr09B1CNhb1i
	V0j9N6vxFxG8QCkqpxt6Tz0S1fzMJgj9+Hr2vSWJjCIa11KdakOz81qU9iLyY4/6jaDq
	IhffMqTkpe/nXOseAOEMAt5hQQbNbyT9KWGsVEjhbYddUzYbd434dHn+/OoGxfbNNaIT
	uyEw==
X-Gm-Message-State: APzg51Cz9yDfI1pIeZsTk9mi1QNBqKIZKUQ0NuhSwoHz2hcCSjnlfDaI
	eNQT1uld6M9PD17I5eAMot7MDBdByiIB6Oms3rwUxcVj
X-Google-Smtp-Source: ANB0Vda0EjyDMK7L0m5zYL/53J42593QZXEfjXy21iTew99q/znTwIexvqJ3BQtsb12cb6Gv90gHgKWkKw2Gz85tJM4=
X-Received: by 2002:a37:a811:: with SMTP id
	r17-v6mr30900495qke.81.1536104626927; 
	Tue, 04 Sep 2018 16:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
In-Reply-To: <CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 16:43:20 -0700
Message-ID: <CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Tue, 04 Sep 2018 23:43:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Otavio

Here is one failiure that is seen in meta-oe with updates cmake

http://errors.yoctoproject.org/Errors/Details/190510/


On Fri, Aug 31, 2018 at 1:54 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Fri, Aug 31, 2018 at 4:55 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Aug 31, 2018 at 11:14 AM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > On Fri, Aug 31, 2018 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Thu, Aug 30, 2018 at 4:26 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > > > > This updates CMake to the 3.12.1 stable release. All patches were
> > > > > rebase on top of the new source file and all them applied without
> > > > > changes.
> > > > >
> > > > > The number of patches has changed as all them were applied on the Git
> > > > > tree and re-exported, to avoid any fuzzy warnings.
> > > > >
> > > >
> > > > This is a major version update and cmake is quite deep in foundation of build
> > > > there are large packages outside OE-Core which depend on it. Can you give
> > > > some details on testing to make us feel comfortable ?
> > >
> > > I did basic testing but all patches applied fine. If desired, it can
> > > be postponed to next release as it is indeed not critical.
> >
> > build meta-qt5 with it there is lot of hairy stuff there
>
> bitbake qtscxml
>
> It went fine.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


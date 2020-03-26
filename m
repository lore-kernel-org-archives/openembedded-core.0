Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.3744.1585250486964971196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=1cf0gtbE;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id e14so6503377qts.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=AlG5r1oOZiEe8eX3PKistkDiFo5QMmuykoFeOhuGywY=;
        b=1cf0gtbEZikUXjfzO/c96/N5hDY1itFAnn8nOHnNndAHmZHlgoO+3sbbT2k6r3Vv3J
         /dg6itRWvpm+0IGZJRxGwFapCtsQxF/OmRhXw9X62oICKmmQWlNVyGHkg/eUPk7/zX6d
         MtI+1HGKkrTvjTXg2vmIhl1sPPl2kK1W4/SbgOejMpFymyydtmalBVsphW6Fq/umCApo
         MDW/3nAHM1LmriTmsXu8M9w6Uh8b12V9PRF++cwQed9T5CZ1PakUSMGcKM3PMKLV7e5Y
         q1QVAkhItXtZcNPsczWaeCJhqc94eoxDzb0wpZ4rPQxEZS897VN1F/u4KMybv2CFZuNC
         IsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=AlG5r1oOZiEe8eX3PKistkDiFo5QMmuykoFeOhuGywY=;
        b=PB0Nas8JxNOd4p/y4lcgUMcPzHuwEFqL4cTT9JufgWQ+H0ai3UkvGgL7WD3silQRRD
         ZuaCgMJ5Tp3qwLtfyi3W45u2kIMFiyARKNPGSBGW0PVnj/+n/Y/CgWJ5zKNpDWktvncu
         PQ/fIAn5SjY3mNcAoMJk1pFEBq1+CelEi30o0WQLMU4NXc1F+esIEIjV5d8SD32uBrle
         vhBcEqzCUCRBo1K/VRZO9W4P7XT0OxoNXEd9iW5L1EGN5HfK8WHE3drdGG0uf8+mTtCb
         +AK7bY67dcBjWL0cnAhcBzpqlybf/b2yoydbgZKD+UhpTlS9qSdzAkvC2T9C/IALWeYu
         rq6w==
X-Gm-Message-State: ANhLgQ2s5cYTWXidtGxq0ntunDeRB0a9iQ4Xf05AeZWprIsGVfp1Uge0
	5eSO1R7DC3qMFQbIiitZTaFj30eYBUXnrQ==
X-Google-Smtp-Source: ADFU+vtRhkdbfUfNMEzmgC7GKQ7XKoMU/YxK8NmtDDekBZA2wKMu+n7MUkFQSCAkPyM10eN12ndDHQ==
X-Received: by 2002:ac8:4e4f:: with SMTP id e15mr2947066qtw.212.1585250485724;
        Thu, 26 Mar 2020 12:21:25 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id j15sm2086110qtr.40.2020.03.26.12.21.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 12:21:24 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f178.google.com with SMTP id h14so8110662qke.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 12:21:24 -0700 (PDT)
X-Received: by 2002:a37:9e05:: with SMTP id h5mr9661889qke.71.1585250484301;
 Thu, 26 Mar 2020 12:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
 <20200326085426.117209-7-alex.kiernan@gmail.com> <20200326145614.GA26693@localhost>
 <CAO5Uq5Qz2EpUZUFGfRy-6BTrLZuK9sm7bTarmkCwZM9RA5eysw@mail.gmail.com>
 <20200326173258.GA31846@localhost> <CAO5Uq5R-zAdk06WRwKY3e_4ycNCHcy7oNGbWf8DOfLTY-SHLSw@mail.gmail.com>
 <20200326191315.GB5401@localhost>
In-Reply-To: <20200326191315.GB5401@localhost>
Date: Thu, 26 Mar 2020 16:21:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq607DCjyCB95PJ5oC2D0Okixmd9aRYZjsFPxSjX_SEAw@mail.gmail.com>
Message-ID: <CAP9ODKq607DCjyCB95PJ5oC2D0Okixmd9aRYZjsFPxSjX_SEAw@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Adrian Bunk <bunk@stusta.de>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 4:13 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 26, 2020 at 06:08:52PM +0000, Alex Kiernan wrote:
> > On Thu, Mar 26, 2020 at 5:33 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Thu, Mar 26, 2020 at 03:54:55PM +0000, Alex Kiernan wrote:
> > > > On Thu, Mar 26, 2020 at 2:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > On Thu, Mar 26, 2020 at 08:54:19AM +0000, Alex Kiernan wrote:
> > > > > > Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> > > > > > then disables all sysvinit handling in systemd if it isn't present.
> > > > > >
> > > > > > Consolidate sysvinit handling so that when it's disabled we exclude all
> > > > > > sysvinit features.
> > > > > >...
> > > > >
> > > > > What exactly are "sysvinit handling" and "sysvinit features"?
> > > > >
> > > > > It seems to disable systemd-sysv-generator, and this is wrong.
> > > >
> > > > Like this it sets HAVE_SYSV_COMPAT which does disable
> > > > systemd-sysv-generator, but if sysvinit is disabled completely in the
> > > > distro, I'm missing why that's a bad thing?
> > > >
> > > > Or have I misunderstood what sysvinit in DISTRO_FEATURES is meant to
> > > > mean?
> > >
> > > sysvinit in DISTRO_FEATURES means that sysvinit is supported as init system.
> > >
> > > > I'd taken in that sysvinit not present in DISTRO_FEATURES meant
> > > > that packages should install systemd units, not rely on init scripts.
> > >
> > > Packages that do provide both are not the relevant ones.
> > >
> > > For packages that can provide both, if the init script gets installed
> > > it is ignored by systemd when there is also a systemd unit.
> > >
> > > systemd-sysv-generator provides support for packages that do not
> > > (yet) provide a systemd unit, only an init script.
> > >
> > > Disabling this could save a few bytes on a small system when no
> > > installed package needs it, but this is not in any way related
> > > to sysvinit in DISTRO_FEATURES.
> >
> > That's the piece of context I'm missing then... so whilst adding
> > sysvinit as a PACKAGECONFIG is valid, it shouldn't be linked to
> > DISTRO_FEATURES?
>
> Yes, and it should stay enabled by default.

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

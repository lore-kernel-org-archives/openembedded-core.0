Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B50C52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 13:30:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.147967.1723815017945822701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 06:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZASbNevk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso15091005e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723815016; x=1724419816; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wkP5PWNekol+VFZOHgmMPJ26DEn4xji04iOBUmyrnvs=;
        b=ZASbNevkftECK9t3SQLBHdCjD6wDgJ4mmuZUy2mSS9xAjEryEFhmoihXpZgsaFaczd
         AN3gh83Pw2f8k+K00myQkYqv+zoTnr/Rr8aAhQqf+PbfAmdlZz7CiXevASWBGbw7fBYw
         idHgf48yo0Lr+OMLR2545LQUX7gc7E+s2bvww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723815016; x=1724419816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkP5PWNekol+VFZOHgmMPJ26DEn4xji04iOBUmyrnvs=;
        b=MJCWwhPovQy+cOd5dW3UoIfCmeY+q6e0mbfuEuGv/KLuK2TSCbiH1Qmy+Rf5kfss7c
         ku/jMDyl+K4vm/406QkN653AEjYer6/29iXOdiBdklE8yaZ8dDrL4jpB0++29Hnq4+Qt
         RdizPbKS/QJJHend0dk4C5BaqQ4Q+eCrr7fTQCwDDL2axZqeAdmTBfZYAxGRGDl3t6XS
         L1xDjW3nMZzKWJkizx2aK2jKmmoDaBH17u7HY6kRIePl9dxtEVRSZ4AWLhPXYl2ypdGV
         PvGJNLXfxfvmXovxK+oKQ4ID6svwoGAzlELUTm7Wlcuvp8+ich6/KgWS+F8oxIX+RDEf
         CqHQ==
X-Gm-Message-State: AOJu0YysWROl/3ytjJRTZ9b3jjvAMVe2YshGC4iYfjD43PrCTC3rfYsW
	IvLwszUqotifedJsIaf2LC2bYZF06Wur5QybvHKPL50pAbvIc85WOCz3g7numSc=
X-Google-Smtp-Source: AGHT+IHT73vzTcO+PhXdxaEnX4brMH/b3f/ncFG61UvsdB31ehRMtyfOgm4B5owPxHufk31FnmGbZg==
X-Received: by 2002:a5d:604f:0:b0:367:9854:791d with SMTP id ffacd0b85a97d-371946a5aa2mr1706465f8f.43.1723815015942;
        Fri, 16 Aug 2024 06:30:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ba6:8f16:1fbd:baab? ([2001:8b0:aba:5f3c:5ba6:8f16:1fbd:baab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed79da99sm22634915e9.46.2024.08.16.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:30:14 -0700 (PDT)
Message-ID: <32ba2ddc1eef1b88915907ba36d64ccc431b1bed.camel@linuxfoundation.org>
Subject: Re: [PATCH v2][OE-core] cve-check: nvd2 download database variables
 update
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>
Date: Fri, 16 Aug 2024 14:30:14 +0100
In-Reply-To: <CAApg2=RJZwMd9ued9UHTGENnwO8uHqPMOz5K7BTv_Je2oa1sMA@mail.gmail.com>
References: <20240816122342.974794-1-marta.rybczynska@syslinbit.com>
	 <ca9c814c589839548a08544b8c6d403226852c9a.camel@linuxfoundation.org>
	 <CAApg2=RJZwMd9ued9UHTGENnwO8uHqPMOz5K7BTv_Je2oa1sMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 13:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203465

On Fri, 2024-08-16 at 15:18 +0200, Marta Rybczynska wrote:
>=20
>=20
> On Fri, Aug 16, 2024 at 3:05=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > On Fri, 2024-08-16 at 14:23 +0200, Marta Rybczynska via lists.openembed=
ded.org wrote:
> > > Update the recent code adding local/source database files. Add LOCAL =
and
> > > SOURCE part to variable names, as none of them needs to be in DL_DIR.
> > > Use old variable names for the source files, so that the change shoul=
d be
> > > invisible to users after backporting.
> > >=20
> > > At the same time fix a bug: handle a situation when both point to the
> > > same place (was: a deadlock).
> > >=20
> > > Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a loc=
al copy of the database during builds)
> > >=20
> > > Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > > ---
> > > =C2=A0meta/classes/cve-check.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++------=
-
> > > =C2=A0.../meta/cve-update-nvd2-native.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++-------
> > > =C2=A02 files changed, 21 insertions(+), 14 deletions(-)
> >=20
> > I'm not convinced about this I'm afraid. I think do_fetch should put
> > data into DL_DIR and share it, "cve-update-nvd2" isn't special in that
> > regard. We do want to have our source artefacts stored in one place
> > consistently.
> >=20
> > If we keep DL_DIR, the naming the makes sense?
>=20
> I'm not sure I understand. I haven't changed the fact that it gets stored=
 in
> DL_DIR (after download, because you have moved the download itself to the=
 local dir=20
> - maybe that wasn't your intent).

I reached the wrong conclusion from reading the commit message, I
thought you were saying that the file shouldn't be in DL_DIR. You're
saying only that it might not be. We can tweak the commit message to
better explain that, but I'm still not convinced about the naming.

> More about my use-case, that can give context: I tell many of my customer=
s to override
> the variable, download outside of DL_DIR and then move the database file =
manually while
> disabling the automatic download.=20
>=20
> This is the way I have found to have consistent scan results when running=
 multiple image
> builds in different configurations (various hardware platforms) on machin=
es that do not
> share a filesystem.

The use case helps thanks. I am worried that "local" doesn't really
make it clear which variable does what. For example, if I want the
build to use a local file, perhaps I need to set the one with "local"
in it?

The trouble with naming is that right now, it is really obvious to us
but in a few months time, this probably won't be clear and new users to
this code will face a similar issue. I therefore do want to get this
naming right.

With my previous patch, I tried to only change what I saw as "internal"
variables which are recipe specific. I'm not a big fan of having to set
global variables to influence a single recipe.

Perhaps people wanting to use a specific database file should just
place it in DL_DIR and configure the code not to update the database
and just use it as is?

Cheers,

Richard





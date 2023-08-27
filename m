Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18E9C83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:34:19 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.4461.1693164853103036315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=btIAoOif;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bd0bc8b429so7137291fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164851; x=1693769651;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmuYjpix0qpmwF9ZSgGeLu7+VfUMRdoX66sZAMCC7co=;
        b=btIAoOifcgXITRXPUD/yMwF1ESceFU1GbG9TrGfyY0Rz77vkddCkgvBdJvSuHXvbxj
         F0bAQLuBBoLSXG7V7x10VPVM37v0e4lzSx34N2aTHaAFJbHeqga0bP/eBlkYRbOzg8ot
         KCcmtqI2Md5g5CEaTOqql7Qw9Ty0y+6P+dZtZMzgXfjCYNqcqa2VPO9zI2nrFtnZylzx
         /Xl9Nk6SdGDcjW/clfYs9t3qX3q9lSkGngt6lZkxI72enHcqKU7pcHbqyI4gKR2jEUJi
         sJTEzGDMMlPVA5LX5M5cd/UpdosXl7Hi3WwmMJSsZiFfbnx6Y5M/Lvf4v1exUv4WglCa
         aMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164851; x=1693769651;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmuYjpix0qpmwF9ZSgGeLu7+VfUMRdoX66sZAMCC7co=;
        b=i/GTfP4ex/8C47E3M0mo7AZkVzU2Sqk3SOOTvlohzrXq6b3RqddvmITqaoiH7o9YAJ
         dae/+d8otP7znEjUyvde1iLdJhkt3AQllaCGiSgYh89ieaaolavl01pHwmv7Kids04nY
         FvZscuIEHeOFbZYknlSGbBaiys9UtkUgTq6+o0DQyMbV6j59Vrd+7Fw+lJBMze5bZLzK
         StMcavqY+beG4lVIO3iG4PjhQlpnizgDcHpAn2ZACE4jHVNoJVwg6tPADOHWtq2Q/FKk
         nkg+Yf75kuqNC2DoYdFfwclQtrLAV+7WEgPzPbcF2+WY7YXdK06cu4yHQfVJDDF+bur8
         J4Pw==
X-Gm-Message-State: AOJu0YyNhKHBXXMvayKGBX/akkUhqiL9u9RUTrkT0aRVhQBbC4EFfaIU
	gwRDV7ravQjNcqRfg0LlBaam24lPQ+s=
X-Google-Smtp-Source: AGHT+IHI4isK9QpggMKwJ8a0/4issPMG8aAtp1qonZQ/cEiGyyV/ZKLl7Il2VBznLT/kXLmBe3hLWw==
X-Received: by 2002:a2e:a0d6:0:b0:2b9:e623:c2d8 with SMTP id f22-20020a2ea0d6000000b002b9e623c2d8mr17249408ljm.44.1693164851046;
        Sun, 27 Aug 2023 12:34:11 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id re4-20020a170906d8c400b009930042510csm3727544ejb.222.2023.08.27.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:34:10 -0700 (PDT)
Message-ID: <9d8b5a530ab58d464b4687baec285c9fddd8666e.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/13] vscode: add minimal configuration
From: adrian.freihofer@gmail.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Aug 2023 21:34:09 +0200
In-Reply-To: <DB5PR02MB102131FBF97F15D1A10F95B94EFE2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
	 <20230825222711.2735745-2-adrian.freihofer@siemens.com>
	 <DB5PR02MB102131FBF97F15D1A10F95B94EFE2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186794

On Sat, 2023-08-26 at 10:31 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From:
> > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.=
openembedded.org
> > > On Behalf Of Adrian Freihofer
> > Sent: den 26 augusti 2023 00:26
> > To: openembedded-core@lists.openembedded.org
> > Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> > Subject: [OE-core] [PATCH v3 01/13] vscode: add minimal
> > configuration
> >=20
> > It is essential to configure VSCode indexer plugins to ignore the
> > build
> > folder of bitbake. Otherwise, the indexer plugins run with 100% CPU
> > load
> > until an OOM exception occurs. In practice, this makes VSCode more
> > or
> > less unusable for working with Yocto until a file like the one
> > added by
> > this commit is deployed before VSCode starts. From the user's point
> > of
> > view, it is not obvious why the system runs at 100% CPU load and
> > eventually crashes.
> >=20
> > It is even more misleading that VSCode starts the indexers
> > immediately,
> > but does not stop or reconfigure them when the ignore list is
> > updated.
> > In practice, this means that every time the ignore list is changed,
> > VSCode immediately starts indexing the build folder until the OOM
> > exception stops it. Depending on the system's OOM handler, the
> > entire
> > build machine may crash.
> > Particularly annoying is the Python plugin that ignores the general
> > ignore list and requires an extra ignore section.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0.vscode/settings.json | 29 +++++++++++++++++++++++++++++
> > =C2=A02 files changed, 31 insertions(+)
> > =C2=A0create mode 100644 .vscode/settings.json
> >=20
> > diff --git a/.gitignore b/.gitignore
> > index 8f48d452dab..f6ce090b5fc 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -36,3 +36,5 @@ _toaster_clones/
> > =C2=A0downloads/
> > =C2=A0sstate-cache/
> > =C2=A0toaster.sqlite
> > +.vscode/
> > +vscode-bitbake-build/
> > diff --git a/.vscode/settings.json b/.vscode/settings.json
> > new file mode 100644
> > index 00000000000..4c941d47444
> > --- /dev/null
> > +++ b/.vscode/settings.json
> > @@ -0,0 +1,29 @@
> > +{
> > +=C2=A0=C2=A0=C2=A0 "files.watcherExclude": {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/.git/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/cache/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/tmp*/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/downloads/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/sstate-cache/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/vscode-bitbake-build/**=
": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/workspace/sources/**": =
true
>=20
> You should include workspace/attic here and below as well.

Thank you. Fixed with v4.

Regards,
Adrian

>=20
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 "files.exclude": {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/.git/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/cache/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/tmp*/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/downloads/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/sstate-cache/**": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/vscode-bitbake-build/**=
": true,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/workspace/sources/**": =
true
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 "python.analysis.exclude": [
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/.git/**",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/cache/**",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/tmp*/**",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/downloads/**",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/sstate-cache/**",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/vscode-bitbake-build/**=
",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "**/workspace/sources/**"
> > +=C2=A0=C2=A0=C2=A0 ]
> > +}
> > --
> > 2.41.0
>=20
> //Peter
>=20



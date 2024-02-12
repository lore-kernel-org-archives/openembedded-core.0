Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1417FC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 15:48:50 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.9624.1707752924947503932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 07:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LW/sNubT;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50eac018059so4250902e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707752923; x=1708357723; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=26zJxWqYStuYV+jAWX5dO5ZPVD0IxU22WqqSIYtkEpY=;
        b=LW/sNubTdrJ1y3wx1LMm0rNYJkb51S3gUTXiZ3yVz5e+HzCOxXSS2kZwOioaykcVvX
         aUwo8gNzbchZn+/mO4OCA0lTx0eU5mmn87nrLk0t95tV5YTErmyjtbE7K9jsOmIsDM8+
         Ifjtn3f0TjtH7hKRreRnTVrScg6//yLDpRz24QtyQyjIO2Ekb8uzWn6CsLn6LamB0U05
         erBOCZElllfjENyqdaUMo58aTckOICau0Xx3voPAJWCS70m3RhYrQLvSDlkMHnZQy/4e
         OmQ8k2YeC4kDbcfnlU5wQGFwk7sxtgT0ECi6Fo0xgNHrphu4tWbMDrzSTGYfqoi2SLyB
         ECLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707752923; x=1708357723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26zJxWqYStuYV+jAWX5dO5ZPVD0IxU22WqqSIYtkEpY=;
        b=isJGNaHktK5s20bJ0x1NZGInM23lNAidFDsERPCU7lzsGNYkD9Z4sYylkwrFEWx1tz
         BaPUkfhOAmDdO4LLUg7EWrqjY6NYrI3WGuE4jumXq1FiUWsJjUvt1o2JaMIf1yyl2GO+
         /ikYYzVjHI34WivRV9Cz5zr9+QPfLvzlPQ85oSUL3zdoWaRh4eyE00qTqdAOdr7N/7z7
         U8TadB6F26Ia5nNw4LJLV7y4VuGdLWN0A0Jm0OfWtyRsq7Cw4vh4LBAEsQ/+cUqSPzjH
         e09WE+I0KC65PigLYgZzTk/BVDeCNOvMQ1D5UaDgmHxt1Qcxg2WExGyaiER2rmmQ3DdY
         32nQ==
X-Gm-Message-State: AOJu0YyA8F/Fl6VM0T5GSEN82VVAc3X34cRMfDsgfSiLVyZw428F7guF
	wOezV1g2L8ZIgvDLy+A39ZnhqE4z6OgWrlr4AHfK+2OzTQr7mDH5
X-Google-Smtp-Source: AGHT+IH5TF5C7k2JVtQaCWA8vSGuVRuO+BWrRszpMCbHdCeB8In19e1/iJzrwMC2wRco6ra4o6zUeQ==
X-Received: by 2002:a05:6512:2102:b0:511:56c0:695 with SMTP id q2-20020a056512210200b0051156c00695mr4253628lfr.51.1707752922620;
        Mon, 12 Feb 2024 07:48:42 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id bd27-20020a05600c1f1b00b00410d3b8c4c1sm3505400wmb.31.2024.02.12.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 07:48:42 -0800 (PST)
Message-ID: <8ed89336017da50392be926a152a10901c8ceea7.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2024 16:48:41 +0100
In-Reply-To: <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
	 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
	 <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
	 <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 15:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195344

Hi Enguerrand
>=20
> The extension's users have wildly varying setups for running bitbake.
> They have divers sources and build directories layouts. They can open
> each layer in a VSCode workspace separately, while other open a
> parent=20
> directory with everything in it. Some users will use wrapper scripts=20
> like kas, or custom crops docker containers. There is currently no=20
> initiative to automatically provide initial configurations for the=20
> extension for these reasons.

But all users who have the build folder in the scope of VSCode have the
same need for a settings.json that prevents VSCode from indexing the
build folder and configures the yocto-bitbake plugin correctly.

>=20
> I'm not sure to understand the application of the poky/.vscode=20
> configuration now. I used to see it as a way to quickly demo the
> VSCode=20
> functionalities for poky developers or beginners who have just the
> poky=20
> layer. The new patch which updated poky/.vscode was properly doing
> that=20
> IMO. A new user who downloads poky to get started with Yocto will=20
> directly get a .vscode to play around with the various machines and=20
> recipes in poky.

Since the plugin changes the settings.json file, the settings.json file
cannot be in Git. The problem starts at the latest when working with
git. git and VSCode fight against each other in a very problematic way.
I was not able to solve this while the plugin was still active.

>=20
> The majority of users who are using multiple layers and all the
> various=20
> configurations I mentioned will have to configure their own .vscode
> but=20
> I don't think they will be mislead into using poky's example=20
> configuration.=C2=A0

The quick start guide from
https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#building-your=
-image
recommends
  git clone git://git.yoctoproject.org/poky
  cd poky
  source oe-init-build-env

I think just starting code like "code ." from poky or "code .." from
the build folder is the next logical step which should just work. The
Yocto/OE reference setup should also be the reference setup for the
Yocto-bitbake plugin.


> From the user feedback we've had with the extension, I've=20
> never heard of users opening poky as their workspace, since most of
> them should not be editing poky in the first place.

All users who work on poky itself need to modify poky. I think
developing Yocto/OE is a viable use case for Yocto/OE.

But also all the other uses cases I'm aware of use one VSCode instance
to edit or browse all the layers in a very similar way like the quick
start suggest that.



Anyway, having the settings.json in git does no longer work. Otherwise
working with git in a layer directory is impossible.
But leaving the user without any kind of configuration leads to a user
experience like this:

  git clone git://git.yoctoproject.org/poky
  cd poky
  source oe-init-build-env
  bitbake core-image-minimal
  cd ..
  code .

- VSCode starts indexing the build folder at full CPU speed until an
OOM occurs.
- The default configuration uses the wrong build folder and other
invalid settings. The plugin is not usable without configuring many
details.

With my patches all the issues would be addressed. The plugin just
starts showing its real potential with the default configuration.

It also works for more complicated setups. I'm using it for example
with these lines in a oe-init-build-env from a custom layer:

...
if command -v code > /dev/null; then
    OEINITDIR=3D$(dirname "$THIS_SCRIPT")
    OEINITDIR=3D$(readlink -f "$OEINITDIR")
    OEINITDIR=3D"$OEINITDIR" \
    VSCODE_EXCLUDE_DIRS=3D"**/a-big-folder/**" \
    "$OEROOT"/scripts/contrib/oe-init-build-vscode.py || {
        unset OEROOT
        return 1
    }
fi
...


Thank you and best regards,
Adrian


> >=20
> > Here are some patches:
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/vscode-yocto=
-plugin
> >=20
> > I will send them as V2 after I have tested them some more. (There
> > are
> > already oe-selftest)
> >=20
> > @Enguerrand your review would be appreciated.
> >=20
> > Regards,
> > Adrian
> >=20
> > > Cheers,
> > >=20
> > > Richard
> >=20
>=20
> Thanks!
> Enguerrand de Ribaucourt



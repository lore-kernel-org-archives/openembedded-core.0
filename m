Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE60C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 20:23:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.18591.1654806227674389624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 13:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O30KnVgF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id e5so6123834wma.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=ACGwbxU4vtg9+26kJnbu6M0ud2dBpOVCrAuxJ8+JzAU=;
        b=O30KnVgFSIyw+3De8L87x/xe7nmmO1rtz2X6BxRCfrd8oSdHJeUw3HMVLps0T9KUBt
         jw2i40wDeFjZhhSd8ejyM2/Py/JcphQ//pcn9CwOrzB7+axpDROraCLvbxRYrof1ZeGp
         HCNinHUVl5rKvCWLJyqcyQOVboimWY3twiFSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=ACGwbxU4vtg9+26kJnbu6M0ud2dBpOVCrAuxJ8+JzAU=;
        b=ucN9Zu/WvMQ1N2bqjcZjaJMirV8HFQsZohlc8EYHVrq5Wi9UbPHHU6w+wBfRgl2XiC
         +chcabDaxg98DAqCWgjogO/2BRI4jkIE5k8gZS3QofzmDS9h++comOcSkXme+TdCqfBU
         kGejwngM55wjTZyHA6eRCc+qBJTa+E5c+K/Szp5CvAhuJg0fEdu6kxzpLPKQcnkdzyxO
         plpPxJL7i/8Vf+Htu20O6TMcdocMtf3Fa2czCNLsrCa6oBRg8JsQB0d/8Drb2gyLAwGL
         HqCHC9n7bPFMsbxy7CIKncDAT169MrAX6mV7ylVGzVrRyGtFh8YfYsIhLa/mtTSJ4kAh
         7Yow==
X-Gm-Message-State: AOAM530guxYm0UWOoOR0HNdkNTyoP258V8r6Qv4wag+DZ1DYVs9rnbj/
	OGJYETvNmj1VhFs2q7YxT3MMWg==
X-Google-Smtp-Source: 
 ABdhPJxrIzOZLThYVGroe7F7HjFgovjdes5cjesXXDXJ8xc9+OIyT+16Cs4CSeva1jLKxgq7btmwpg==
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr4912848wmd.118.1654806226097;
        Thu, 09 Jun 2022 13:23:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9?
 ([2001:8b0:aba:5f3c:a80c:d45b:2638:f3f9])
        by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b002102739add8sm31257603wrn.54.2022.06.09.13.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:23:45 -0700 (PDT)
Message-ID: 
 <5c372880bd8e3f26e4b417e0fef84a99fb7db27d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/multiconfig: Test that multiconfigs
 in separate layers works
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Jun 2022 21:23:44 +0100
In-Reply-To: 
 <CANPvuRmLJy-k+2k4A-Lf2TVRcCxHHXa1iiKX+89KQ6qgzH4pog@mail.gmail.com>
References: <20220609094209.41221-1-richard.purdie@linuxfoundation.org>
	 <CANPvuRmLJy-k+2k4A-Lf2TVRcCxHHXa1iiKX+89KQ6qgzH4pog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 20:23:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166788

Hi Jose,

On Thu, 2022-06-09 at 18:53 +0100, Jose Quaresma wrote:
> The same test using the same TMPDIR will be useful=C2=A0as there are some
> layers doing that.
> AFAIK the archiver and the rm_works don't like it very much.

Note that the same TMPDIR is only supported if you're only changing
MACHINE. If you're changing distro config, all bets are off and you
shouldn't be sharing TMPDIR.

I wish we had warning messages when users did that but we currently
don't. It should be possible to add but isn't straightforward.

> The OE-core rm_work bbclass doesn't like multiconfig with the same
> TMPDIR.
> This issue with the rm_works=C2=A0is because the native packages use the
> same directory and bitbake
> will run the native tasks twice, one for each machine. I need to
> exclude=C2=A0them to get a green=C2=A0build:
> RM_WORK_EXCLUDE:append =3D " texinfo-dummy-native gettext-minimal-
> native gnu-config"
> Another interesting detail is that these recipes that have the source
> dir in
> the working dir: $S =3D=3D $WORKDIR

If they're building twice, the configuration is differing and they
probably shouldn't be sharing TMPDIR. If there is a configuration you
think should work I'd be interested in the two configs to see why it
builds twice.

Cheers,

Richard




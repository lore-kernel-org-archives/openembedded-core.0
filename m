Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96CFC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 22:27:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.35126.1660775264602019210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DsyLXBlr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u14so3171557wrq.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=ToRIirv4QxxwRlipuYGTgte6rlNzfdfUNQc/d8z2mRE=;
        b=DsyLXBlrrzLOmcYEH8etV0IUkv56MQ4KQMRLX1dRbTmwDEgI7U0p0s9py9BiXXa1la
         nB7Y3ydFfR3pnX0TXMKVyTGEfGmiW5MoZxkGHX+AkKh25x33o3b12BsMW2+mLBa724jX
         Mk2l0tQ+q9LY9/vRYrRdvIjcMbi2tpWvOZ7Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=ToRIirv4QxxwRlipuYGTgte6rlNzfdfUNQc/d8z2mRE=;
        b=yEuluEr//lM1HDyqy6/obnfYMI5udYXr1pXqXKu2hv9v1kNarjANMS9u9zIXWezwN6
         hWEsdRZ/JkjpMAhiGfBnqL+p6A1ZOToPdK/Dd+MOTyEkn/B3u5Arnrgi7FKj0le60rCd
         hsLvFfmCZ38z/08v4XEHDecn9fGwMYvQ2wCJ8Y3gmDjkP4VkqD8N2JRU35B2ygl+RJmp
         HmUgueJgLItJQUO7BWT5djq7Ay5WIuao9Ni1vBn+jl2fKLHzCEkegN0D/j/f0kThgM06
         ohQYS+ImM0sBC4s81vlwHYSpVqPcxxb9P1sHQFMjxGZmlftYjf7PhMbrodsqATN8xM1W
         ycjw==
X-Gm-Message-State: ACgBeo2DVPTMgqGJA+flxIw7kptkvqbcrRzu7RDVjoAiyFmQi/fh2Xjn
	tJt+JSCA+8jCExcl8+k7siVlog==
X-Google-Smtp-Source: 
 AA6agR6dt0z7j/UXTfpTz1ONSFIYCTcsWSi0JMpJtuPt1QLLbxta/QjMsdjafEkaJEq73TWQlCzXUw==
X-Received: by 2002:adf:e5c8:0:b0:224:f60c:6f7e with SMTP id
 a8-20020adfe5c8000000b00224f60c6f7emr63465wrn.87.1660775262874;
        Wed, 17 Aug 2022 15:27:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975?
 ([2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975])
        by smtp.gmail.com with ESMTPSA id
 y5-20020adff6c5000000b0021b970a68f9sm13448956wrp.26.2022.08.17.15.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 15:27:42 -0700 (PDT)
Message-ID: 
 <d3d5ec04d1b0caec5f0e8f7578e40b3f055e10d9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/5] meta/files: add layer setup JSON schema
 and example
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Joshua Watt
	 <JPEWhacker@gmail.com>, Alexander Kanavin <alex@linutronix.de>
Date: Wed, 17 Aug 2022 23:27:41 +0100
In-Reply-To: 
 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
References: <20220817131023.4093773-1-alex@linutronix.de>
	 <20220817131023.4093773-2-alex@linutronix.de>
	 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
	 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 22:27:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169509

On Wed, 2022-08-17 at 23:36 +0200, Alexander Kanavin wrote:
> On Wed, 17 Aug 2022 at 22:52, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > One thing that concerns me a little is that this mixes two things,
> > layer setup (as in repos) and configuration. I'm nervous about json
> > config which effectively has to duplicate the list of machines/distros
> > in layers.
> >=20
> > Where is the distro/machine data used?
>=20
> The use case I was thinking of is doing something useful with this
> information *before* doing actual checkout. I would even appreciate
> knowing in advance - maybe even by just looking at the json through
> gitweb ui - which machines, distros and config templates I would be
> getting, and from which layers.

The trouble is that others already went a different direction with this
which is why we have layer index and the concept of local layer indexes
as well we the ability for bblayers to talk to such indexes if I'm
remembering correctly.

An advantage it has is that it does parse the layers so it can cache
other information too.

My worry is that you have two copies of this information, one in the
json and one in the metadata and effectively by that fact, one of them
will be wrong.=C2=A0

You could report it to the user with a directory listing of the remote
repo via git.

>  Also the proposed oe-setup tool could
> do useful things with this information, if it operates from the json
> definitions in the same format. You can discover and supply all needed
> information up front, and oe-setup will land you in a bitbake session.
> Without it, you have to first do the layer setup, then the
> configuration discovery, then the configuration setup, as separate
> commands - I'd say that would be an inferior experience for the users.

I think you can get a lot of this information relatively easily and
possibly without a clone, via a layer index or probably through a
remote git command too.

> > Are these the only config options people will want to add or will we
> > have others? init system? libc? Or feature information about which
> > configurations are expected to work? I worry this is a magnet for
> > future feature creep and duplication of information.
>=20
> These are not the same, as machines and distros are specifically
> defined in layers as .conf files in pre-determined locations. Other
> things are defined as variables in files, and aren't as easily
> discoverable by code. I only want to allow programmatically
> discoverable options (that are guaranteed to be in lockstep with the
> layer revision) in the json; no one should ever write or modify the
> json by hand.

I'm not sure that will scale for what users want then (which I suspect
is why we ended up with the layer index instead).

> > I can see where the buildconfigs are used but again, does the json file
> > need to encode those or could you determine them by inspection of the
> > layers once setup?
>=20
> In addition to the above point (knowing them in advance is useful),
> there is no fixed location for these in layers. You could perhaps walk
> the layer trees, but I'd rather place the info in the json.

I have wondered if we should define one. I kind of have a plan in mind
to turn the majority of the autobuilder configurations into config
files somewhere in OE-Core to make it easier for people to reproduce
autobuilder configs too, which may be an interesting example of that.

> > Also, if there is new version of this series, could you squash in these
> > copyright/license tweaks please:
> >=20
> > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D45b39629=
8c1dd638bb702f5251b4a663f07978ca
>=20
> This is the easy part :-) Hope the above clarifies a bit what went on
> in my head when I was writing the code.

It does, thanks. I'm just not sure we're quite in the right place with
things. I know in your other reply you say we have to start somewhere
and we can change things. I also know the screaming if we try and
remove something later...

Cheers,

Richard




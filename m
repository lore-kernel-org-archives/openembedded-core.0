Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5826FC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 20:52:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.34096.1660769529884801674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GPSVi8wK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u14so2972950wrq.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=3ABciEYAMeKPfZFmjhwYXC0ozuWjtHvWwy6rkNpphHU=;
        b=GPSVi8wKLseKFptbQL6UPfX/V9b1peAl5ip+cT53BJaUzu9+XN0T2kY4BNpFLUd1iL
         nSnXg/DE8CtCggt6PJdOnYsCYmr/PFNCA3bZgxx9OBtBX8l6VcYL/4lpMxts4zEGemb3
         zInyEfxt9gZVjtkSo046QhN7ZXFtbaAjHCtBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=3ABciEYAMeKPfZFmjhwYXC0ozuWjtHvWwy6rkNpphHU=;
        b=Lw2lTUscdbyKRP7iZa8zszRE2SLeaT70ZMgbwu8tgcwils3/Su65bpljnW6Gfiz4vK
         Hf1ZVsA3tZZb2RVFP6BmwiBGA37sjGdXkQyZmeXSkGq/MuUcSjGa0fMqNQZxjyMgpLlQ
         PgUXHrblUQ7xey9p5RrohGDNZAj5LKnfAILQS27lQGd77MTTMKCaGs0lsS6D+lkBc0Np
         e1wkQRPWincrOzdhBsRmKs8FTorbjbKZOI5QUx3rz/Gx9uUDPBkvTdyFBxyPEMpaliDS
         PtF7g0YXKiBEyvtMnVBqSt43/1U7cSlpMEkVmlMLMk8Az0kclqCElHydvElJODbGKQr/
         murA==
X-Gm-Message-State: ACgBeo2n7gNZjBxWFT+9wY6PopN7pM2Ol16N521yJ8PXFrSd7CcMbt+M
	XAf/QnGpA3jXfGJCwmxlMK1I3g==
X-Google-Smtp-Source: 
 AA6agR4oBx1wlH6+Cyc+Rkq9ED89aA83kFe8pV3RR4fSJDOqMyaqERDe/p46DEl1WJs51ST84IAPNQ==
X-Received: by 2002:a05:6000:1102:b0:220:5c10:5cbe with SMTP id
 z2-20020a056000110200b002205c105cbemr15893996wrw.359.1660769528300;
        Wed, 17 Aug 2022 13:52:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975?
 ([2001:8b0:aba:5f3c:bfd7:4d1c:d13d:975])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a5d4901000000b002207a5d8db3sm13872940wrq.73.2022.08.17.13.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:52:06 -0700 (PDT)
Message-ID: 
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/5] meta/files: add layer setup JSON schema
 and example
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>, Alexander Kanavin
 <alex@linutronix.de>
Date: Wed, 17 Aug 2022 21:52:06 +0100
In-Reply-To: <20220817131023.4093773-2-alex@linutronix.de>
References: <20220817131023.4093773-1-alex@linutronix.de>
	 <20220817131023.4093773-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 20:52:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169506

On Wed, 2022-08-17 at 15:10 +0200, Alexander Kanavin wrote:
> From: Joshua Watt <JPEWhacker@gmail.com>
>=20
> Defines a common schema for layer setup that can be consumed by tools to
> know how to fetch and assemble layers for end users. Also includes an
> example of the layer setup that constructs poky/meta-intel/imaginary prod=
uct layer
> for reference.
>=20
> The schema can be used to validate a layer setup file with the commands:
>=20
>  $ python3 -m pip install jsonschema
>  $ jsonschema -i meta/files/layers.example.json meta/files/layers.schema.=
json
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>=20
> Alex: I made the following modifications to Joshua's original commit:
>=20
> - moved the files from meta/lib to meta/files
>=20
> - the example json showcases a multi-repo, multi-layer setup with additio=
nal
> configurations and machines, instead of just poky - closer to a typical p=
roduct
>=20
> - added oe-selftest that validates the example json against the schema us=
ing python3-jsonschema-native
>=20
> - the schema is modified so that:
>=20
> -- all lists (sources, layers, remotes) are replaced by objects keyed by =
'name' properties of the list items.
> This allows using them as dicts inside Python, and makes the json more co=
mpact and readable.
>=20
> -- added 'contains_this_file' property to source object
>=20
> -- added 'buildconfigs', 'machines' and 'distros' properties to layer obj=
ects.
>=20
> -- replaced 'remote' property with a 'oneOf' definition for git with a sp=
ecific
> 'git-remote' property. 'oneOf' is problematic when schema validation fail=
s:
> the diagnostic is only that none of oneOf variants matched, which is too =
non-specific.
>=20
> -- added 'describe' property to 'git-remote' object.
>=20
> -- removed description property for a layer source: it is not clear how t=
o add that
> when auto-generating the json

I finally got some time to think about this a little bit more.

One thing that concerns me a little is that this mixes two things,
layer setup (as in repos) and configuration. I'm nervous about json
config which effectively has to duplicate the list of machines/distros
in layers.

Where is the distro/machine data used?

Are these the only config options people will want to add or will we
have others? init system? libc? Or feature information about which
configurations are expected to work? I worry this is a magnet for
future feature creep and duplication of information.

I can see where the buildconfigs are used but again, does the json file
need to encode those or could you determine them by inspection of the
layers once setup?

I'm still worried about bolting a format directly into one of our core
tools as it effectively means it is a definitive standard. We do
probably need one but I'm not convinced this is quite right, perhaps
because of the above reason. Not 100% sure but something doesn't feel
quite right.

Also, if there is new version of this series, could you squash in these
copyright/license tweaks please:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D45b396298c1d=
d638bb702f5251b4a663f07978ca

Cheers,

Richard






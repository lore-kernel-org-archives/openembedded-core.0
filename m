Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 983E57E634
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 11:42:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id x21so5940116otq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=anldGXnsYz/OIXDKtUc8svGYnEaX/Kri2O+JCSPh7Vc=;
	b=s7tcOXX5APr4tDbwbQgqNkPqc7UMk8Pnrafo6ooUryYsYMfmSW45JToVY8itTRshsb
	71u5Pumlun9L/uyOtjo/gsDCJBu17FjKF6rr+Qo32/TysnxMbVVFFAerH8/U09ODAmw+
	jDztaCfDW0io3WGta3gaerma6aVDNv7edHvciaqlLyumiJjYPiBA7d9L4fsCkjcRuWoi
	vXnn7g4AXD6jI38uwqtDci/DlxiVHHbXspmOeaXgDVgRgtCHIRphP+2aB6+rJYBqSskI
	9RFME7pV8WUjFt8TB3FEya4331UqwP+gsJ2Z3sUTEwHVq7fdYrSKYCwkEnECD1yR9hoL
	m9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=anldGXnsYz/OIXDKtUc8svGYnEaX/Kri2O+JCSPh7Vc=;
	b=eSFQ63gXVIHtpZT6v2QQ7yJvfrtZnm7VQ6d0B+Tz1sO1yBnagZgtMTiZJZl1n2ATVG
	y5i4lQsISHAQs7llXqvazhIpCHWSg5ebXO/sUCqUmRwCLM1o3K1Hao6XeU5FKYp3qXwA
	SV3YMqFu3vA9eOnROke5S8ex72B5nLEhSwy1oEckS9ynV1vr0xCJSss8XbqV6Dn5neiW
	Wfl0haRWLdv3yLASV7smX3UJTUSOxH/tlICxWBolg5mgq6St8VbP/sZvOU0Mc6rfYfW8
	jwhTHdrUJEYT2hiPa9lNb5AFe5r8CAsWO/EgVD9SNuyYX4FAniWL2Qb/np7r5Ar20sli
	O71Q==
X-Gm-Message-State: APjAAAVAEE3d3wtYQ75g34PXgHr2Dw7PR2HxxHkIdXZVp7XhclKIiY4T
	iUT8OXb6VB+yeihlKXjD3H2x3RcmxwZHq3Upub8=
X-Google-Smtp-Source: APXvYqykVUTr7IMQ+OY0JwqFO3eQj+Gwd3cqHcNhk3wKsFl6/kfoWYjngpYEF2EpdeLd0D8ap2dd82GPe6tnvf0v0e8=
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr12219080otf.61.1561117342546; 
	Fri, 21 Jun 2019 04:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
In-Reply-To: <20190621110356.GO3459@hiutale>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jun 2019 13:42:11 +0200
Message-ID: <CANNYZj8wEidRKDJtqPHMTQxNtYSD1_btOOfgR5TyoF2zL=KEkg@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Fri, 21 Jun 2019 11:42:21 -0000
Content-Type: multipart/alternative; boundary="000000000000a7be63058bd3f487"

--000000000000a7be63058bd3f487
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2019 at 13:11, <Mikko.Rapeli@bmw.de> wrote:

> This adds python3 urllib3 (python3-urllib3 in Debian) to build environment
> dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
> documentation could be updated too, e.g.
>
> https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#brief-build-system-packages
>
> On my Debian 9 build container python3-urllib3 wasn't installed by default
> or via other dependencies.
>

Should this rather be provided via python3-native?

Alex

--000000000000a7be63058bd3f487
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 21 Jun 2019 at 13:11, &lt;<a href=
=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br></div=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">This adds python3 urllib3 (python3-urllib3 in Debian) to build environme=
nt<br>
dependencies. It&#39;s the first user of urllib3 in poky, AFAIK. Maybe<br>
documentation could be updated too, e.g.<br>
<a href=3D"https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual=
.html#brief-build-system-packages" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#brief-bu=
ild-system-packages</a><br>
<br>
On my Debian 9 build container python3-urllib3 wasn&#39;t installed by defa=
ult<br>
or via other dependencies.<br></blockquote><div><br></div><div>Should this =
rather be provided via python3-native?</div><div><br></div><div>Alex<br></d=
iv></div></div>

--000000000000a7be63058bd3f487--

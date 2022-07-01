Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C7EC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 12:53:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.37655.1656680027516399554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 05:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UcUviGeT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id k7so3069786wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=hGYHQFljMagRjDhpzc3Q4YVmOGHwY0mOoIW5b0e3+os=;
        b=UcUviGeTXtuGzJLEQG7pyNWNd/HvkLfANs5ZfxcOU3T1Aq7d98Nm3pVDX4kdDZ+qnK
         1cTVxqmtSG1aN3FRF8vDwW0p05CIem5YZhFfBqp9s9XlO9GOPg02kDxG6YsBrVtBQxGH
         gNJguLOdgqovY23DRkqa1YbQEWRgWnU26eOh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=hGYHQFljMagRjDhpzc3Q4YVmOGHwY0mOoIW5b0e3+os=;
        b=BBEYWXrjauws8osathaE8Htph0gVX4Ln+82OJQm2RWJGg982nFtBOF2/iTgeTSv1Vw
         EUX4ws91CuxBf4rbA0WWUu3UkowPRjHLv+aiKspnW0K2eslHHMeVaNFFPphbISzpqMK9
         IRQxCQ9z5opzBFWs3xnR1gi+F1dIk4XUSLj41uSI5eNeBwaO+MwmGBvYcEgdyybXlrt4
         goOyoQXilkHbBRfBV8vNaxqsBH5D+TV6ukVNJRce5zEJaDv+7NCAy2I7N5owxRklvPXi
         uSwMtkhIvboayVu1U2QpJIer7h9sprJa41LtrAt1nxZOG27qyuM7jZG03vtjb+2LdQ0u
         L+Og==
X-Gm-Message-State: AJIora8B1FTgUN+nr2ekmAtXWSmWzxE5WjD6ztlbTWEvvaAmctl8eF+E
	oBY0NSYT23KCdMDFifKepDEnzA==
X-Google-Smtp-Source: 
 AGRyM1souWzGQxA90QayfgThuQ1nOjAFujJiQ6SvMR2XRh1W8hadEciSSa9IiPiMXux8/ZU/7gnaIQ==
X-Received: by 2002:a05:6000:3cd:b0:21b:8e8d:470f with SMTP id
 b13-20020a05600003cd00b0021b8e8d470fmr13250114wrg.387.1656680026057;
        Fri, 01 Jul 2022 05:53:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 u15-20020a5d434f000000b0021b970a68f9sm22512296wrr.26.2022.07.01.05.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 05:53:45 -0700 (PDT)
Message-ID: 
 <d5c4534e429fc9307eaaba5a8316795d906cd27f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 3/7] insane.bbclass: Make do_qa_staging
 check shebangs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Jul 2022 13:53:43 +0100
In-Reply-To: <16F97685B484595E.1329@lists.openembedded.org>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
	 <20220614151105.1890454-1-ptsneves@gmail.com>
	 <20220614151105.1890454-3-ptsneves@gmail.com>
	 <16F97685B484595E.1329@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 12:53:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167468

On Fri, 2022-06-17 at 17:50 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2022-06-14 at 17:11 +0200, Paulo Neves wrote:
> > As reported in the bug report [1], there was no check for shebang
> > sizes on native scripts and now this is fixed.
> >=20
> > The path scope of the qa_staging was increased from just checking
> > libdir to all the relevant SYSROOT_DIRS.
> >=20
> > It is possible to skip this check through INSANE_SKIP.
> >=20
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11053
> >=20
> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> > ---
> >  meta/classes/insane.bbclass | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 9ca84bace9..b2951a48fe 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -630,6 +630,11 @@ def qa_check_staged(path,d):
> >          bb.note("Recipe %s skipping qa checking: pkgconfig" % d.getVar=
('PN'))
> >          skip_pkgconfig =3D True
> > =20
> > +    skip_shebang_size =3D False
> > +    if 'shebang-size' in skip:
> > +        bb.note("Recipe %s skipping qa checkking: shebang-size" % d.ge=
tVar('PN'))
> > +        skip_shebang_size =3D True
> > +
> >      # find all .la and .pc files
> >      # read the content
> >      # and check for stuff that looks wrong
> > @@ -651,6 +656,13 @@ def qa_check_staged(path,d):
> >                          error_msg =3D "%s failed sanity test (tmpdir) =
in path %s" % (file,root)
> >                          oe.qa.handle_error("pkgconfig", error_msg, d)
> > =20
> > +            if not skip_shebang_size:
> > +                errors =3D {}
> > +                package_qa_check_shebang_size(path, "", d, None, error=
s)
> > +                for e in errors:
> > +                    oe.qa.handle_error(e, errors[e], d)
> > +
> > +
> >  # Run all package-wide warnfuncs and errorfuncs
> >  def package_qa_package(warnfuncs, errorfuncs, package, d):
> >      warnings =3D {}
> > @@ -1139,7 +1151,9 @@ addtask do_package_qa_setscene
> > =20
> >  python do_qa_staging() {
> >      bb.note("QA checking staging")
> > -    qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d)
> > +    sysroot_destdir =3D d.expand('${SYSROOT_DESTDIR}')
> > +    for sysroot_dir in d.expand('${SYSROOT_DIRS}').split():
> > +        qa_check_staged(sysroot_destdir + sysroot_dir, d)
> >      oe.qa.exit_with_message_if_errors("QA staging was broken by the pa=
ckage built above", d)
> >  }
>=20
>=20
> I'm a little worried about the performance implications of this, we're
> going from scanning files in libdir to scanning nearly all files in the
> sysroots, reading from many of them. In isolation that doesn't seem
> much but I suspect the IO will impact builds overall.
>=20
> That leaves me a little torn on this change :/

Sorry about the delay on this. My concern isn't an issue as I wasn't
remembering the exact context of this code correctly. The patches have
therefore merged, thanks!

Cheers,

Richard





Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C1FC433FE
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 12:44:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.24712.1653828239544184735
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oy/5Ia8w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id p10so11395402wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=0OlZUv0okjuqIyz5HvLv6S3MUUK1mpXuUsFfXtmupJc=;
        b=Oy/5Ia8wmK0z4YQu+MuIjpwi5TX1U0S1MaB0TwTW7uPzGRrtitY8gpbjI2pr6cTj4c
         X3jK+FAOYmsK1us9xxK/WUr1EV5J4jMB+niWHe03Ljg1n0yRVFTigayJXeppZ4aw5Gzc
         wOWz3WA6pziBDJ/7CwkqR7NpFoE1nU+fkBWdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=0OlZUv0okjuqIyz5HvLv6S3MUUK1mpXuUsFfXtmupJc=;
        b=X6AtdLpedFW3IHRXrDkGqPdKWiGsoU9c6tig3NsuoEYL3WbS4xLqiZlE+tKtuuJ9bK
         u7fPdzhnYcN/Ym84w8HBf+qaATkFQJ/pj5JCJ/4KsFld0lQxFRNfirT7YrvA4Qy71yrI
         WNML8DmcCohEKV4jUlH9QFBBHd7oh6m+jqX7+Zezlan6s5nSNPaD0FTZSqPdo/DEIQzJ
         lhMMeST1Wmt7s/0L6sFnyEY91aeHzE8TKsdeC7oSCnVpHp0u2fVHCClWKDcaVwV4VIdK
         uBWwqISDKPqo1ElNg6iDJxW5Fec2Q6YzWwiRJB2Ijxt4IvMHRxvN/WKyfOfakIhbLbgH
         3LhQ==
X-Gm-Message-State: AOAM530tNCtkcmlRBT54XAkYufe3F+JJ5yE+i6u72RpjrAQEOQDIyMZo
	boC61r1gPyo5JNsV5J0LFmmCuHXyJHuHbrwv
X-Google-Smtp-Source: 
 ABdhPJzSYZKM20P+JNOmztXvarP4oUXa7TaMRLYd7u8E8Jkokcnb1OTfVfoCI+mEnoaaEzYhiaTStQ==
X-Received: by 2002:a05:6000:34f:b0:210:33ec:fd69 with SMTP id
 e15-20020a056000034f00b0021033ecfd69mr495541wre.184.1653828237701;
        Sun, 29 May 2022 05:43:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4777:d166:870b:18dd?
 ([2001:8b0:aba:5f3c:4777:d166:870b:18dd])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a056000128800b002102b16b9a4sm3044331wrx.110.2022.05.29.05.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 05:43:57 -0700 (PDT)
Message-ID: 
 <1a1814eea5140ed33d3463cee888b6b27ce1c6b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
From: richard.purdie@linuxfoundation.org
To: openembedded-core@lists.openembedded.org
Cc: David Reyna <david.reyna@windriver.com>
Date: Sun, 29 May 2022 13:43:56 +0100
In-Reply-To: <16F392B7758AB3A2.31466@lists.openembedded.org>
References: <16F38C7CB923A434.32574@lists.openembedded.org>
	 <16F392B7758AB3A2.31466@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 12:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166237

On Sun, 2022-05-29 at 13:20 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Hi David,
>=20
> On Sun, 2022-05-29 at 11:25 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/se=
lftest/cases/bbtests.py
> > index cfac7afcf49..d222f0fb297 100644
> > --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> > +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> > @@ -205,6 +205,11 @@ SSTATE_DIR =3D \"${TOPDIR}/download-selftest\"
> >          result =3D runCmd('bitbake -R conf/postfile.conf -e | grep TES=
T_POSTFILE=3D')
> >          self.assertIn('postfile', result.output)
> > =20
> > +    def test_taskexp_tty(self):
> > +        cmd =3D 'bitbake -g -u taskexp_tty zlib acl'
> > +        result =3D runCmd(cmd)
> > +        self.assertEqual(0, result.status, "Command %s didn't run as e=
xpected. %s" % (cmd, result.output))
> > +
> >      def test_checkuri(self):
> >          result =3D runCmd('bitbake -c checkuri m4')
> >          self.assertEqual(0, result.status, msg =3D "\"checkuri\" task =
was not executed. bitbake output: %s" % result.output)
>=20
>=20
> Thanks for the updated bitbake patch. Since I wanted to ensure there
> weren't regressions in the future I coded this test into OE-Core to
> ensure it was being tested on a regular and ongoing basis.
> Unfortunately it failed on the autobuilders:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3646/st=
eps/15/logs/stdio
>=20
> Does that error make any sense to you?
>=20
> For reference I've not tested locally myself yet, I just coded the test
> in to see how things went on the infrastructure.

I was thinking about this and whilst I'm guessing, it could be because
we're running this in a CI environment that doesn't have an interactive
terminal? Is there a way we can still test things there?

Cheers,

Richard



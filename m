Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A70C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 17:04:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.21620.1674061493019760614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 09:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L085dpyU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1871588wma.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tbcs26PUCAs0qsXHHEh0D1GFeQwiExX4G5+s+4f2CN4=;
        b=L085dpyUvDbG8iqtaG+7LpU0DLok8Hxltnba6qni6wDJbdyoLgzcBrCjyo8mBRXgOw
         1RFPdU/4WainlpUKN90MSLbByUo8aN//gus2l26jcSa8GMn2ZhrdjXRwoz+WzLoSC1pq
         wnPt7karVtIdzVT2lw1bWu7UVfvf9ZTRSixZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tbcs26PUCAs0qsXHHEh0D1GFeQwiExX4G5+s+4f2CN4=;
        b=481hHnPVWCkXDp/j55JHC+3zs04DrAAE2bx8pVJT+TB/DjEHt8fBNAFnRrtk9gDVx5
         kG9w7tj5qcOtvD7GQLivYEEtCisbppAxJOJcH7SEV3S3NbCWtY8sD4UrX1AkJncn5Rpt
         VZ5n9UU93Ww7laRF4qnlJJXu0tLnMXBQgiooZsujQwqP3yBzU5rnAQSLsXDNseSG+oas
         CA0iz8VKH+hJdUFDbBiYUjufPhdf8+B+MY0Vd+tKuP9D32JhrTvCX4aCkwyoIIuBfazR
         reQahx+bkf8Xm9KhagJDCZgFsl+yD24+5adJuVXfYTf9KAbY0aIC/7/Q2qqqkTldhxsr
         ofaQ==
X-Gm-Message-State: AFqh2koE4Uco1UU1MioJJ7RpU1wUJ6DfSUb4dU1HMcnFWF3Co78kFEI7
	A0AdcTsQ/Lu77IGZNuAlvyOk9A==
X-Google-Smtp-Source: AMrXdXv5sRqpvJNp3e9s+ySmIjC0UvdQMoNbiTwVU9jjFdtG1fiCKAognb6WWmXYykEyHNcxjZQR3g==
X-Received: by 2002:a05:600c:181b:b0:3da:ff1f:e8d3 with SMTP id n27-20020a05600c181b00b003daff1fe8d3mr7308469wmp.15.1674061491147;
        Wed, 18 Jan 2023 09:04:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:54cb:642:5dda:e3f7? ([2001:8b0:aba:5f3c:54cb:642:5dda:e3f7])
        by smtp.gmail.com with ESMTPSA id k14-20020a05600c1c8e00b003d9ed40a512sm3464781wms.45.2023.01.18.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 09:04:50 -0800 (PST)
Message-ID: <9cd5a7af9dd050e8f73b58898c21ca76bb28f15b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] pseudo: Switch back to the master branch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2023 17:04:50 +0000
In-Reply-To: <20230118174609.6a8fa643@booty>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230118142221.1926666-3-richard.purdie@linuxfoundation.org>
	 <20230118174609.6a8fa643@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 17:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176108

On Wed, 2023-01-18 at 17:46 +0100, Luca Ceresoli wrote:
> Hello Richard,
>=20
> On Wed, 18 Jan 2023 14:22:21 +0000
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>=20
> > OE is the main user of pseudo and we've had the changes in the oe-core =
branch
> > around long enough that we're going to run with them. Swicth back to di=
rectly
> > using the master branch.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-=
devtools/pseudo/pseudo_git.bb
> > index c9386c3f090..553f0254ee4 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -1,6 +1,6 @@
> >  require pseudo.inc
> > =20
> > -SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Doe-core \
> > +SRC_URI =3D "git://git.yoctoproject.org/pseudo \
>=20
> Triggers "URL: ... does not set any branch parameter. The future is
> uncertain and the end is always near" ;)
>=20
> I'm fixing it on my testing branch for the moment.

Thanks, that will teach me to quickly add another patch when cleaning
things up to send!

Cheers,

Richard


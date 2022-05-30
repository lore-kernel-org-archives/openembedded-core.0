Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A27C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 11:48:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.35759.1653911323944270777
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 04:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GnV/hHvw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id t13so14292235wrg.9
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=5jgA+MVsn6S29XY3/Go5+Qpv0Ia+99Qv0S+MK7EghFE=;
        b=GnV/hHvwB2Rlh44g2wodjHSN4VuFu2oJOLzQGGuyAKIwI6FtPGw/XsQwVlJSx9lze4
         YYGtny0lVaeYAFdElzipKR7pa5hLG+nZijHOQamXadRkvibyJq3X80EDuNHYUwtpmNd/
         VcRJdLYiggW8+GQ2yxsJafP6sFIXZ0M8QpgWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=5jgA+MVsn6S29XY3/Go5+Qpv0Ia+99Qv0S+MK7EghFE=;
        b=fhk74uSG186kZNRn4/TMXRvT73iWOiQOIV6cfz8cMLAMh0vVWKrLqToU0ISIOvlBH8
         SIOA62EfkeSWBHtmMaP5oAdtl/KaYIUeUbc2nV7MLH9/DQKFoxkRAfan9K+SeyQkuY5M
         TZIHx8X+W6Emcess5W6iKIXs1NrOvFSNaYh4LppLC2zG+ogh7Ax14I5Mj7pn377e8jKU
         hX+mOzrDNj9vloLxf7eNJ7GG2OgfPg94PXJ+iCFa+q82gNKIA8ABeWPA2sPYZ0Ycrxtm
         mnVA4PkVWHmntl9reZxWq496/7RoG2CkqOpxvRwoxRLl3opmnbL7b+2YIDlPKc6MMNEK
         PpiQ==
X-Gm-Message-State: AOAM531AZP6sd8EApKtwXqAUCTi2epAu1R96N8QxZ3eq8b0sssrjFu0c
	5gaP3T+2GxEV4JNj4eUR6MMs4Q==
X-Google-Smtp-Source: 
 ABdhPJwZODJK9kp9YkQwmpF73Cl1ZeqVbw+x6/4mlYPnWctK2Qnc8+QYOcpu/gmvg9fmFh/HL5j/Vw==
X-Received: by 2002:adf:f291:0:b0:20d:bc00:61d1 with SMTP id
 k17-20020adff291000000b0020dbc0061d1mr45576212wro.203.1653911322319;
        Mon, 30 May 2022 04:48:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e08e:4ac:9d03:7bcb?
 ([2001:8b0:aba:5f3c:e08e:4ac:9d03:7bcb])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a1c5402000000b003972dcfb614sm9619522wmb.14.2022.05.30.04.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:48:41 -0700 (PDT)
Message-ID: 
 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
Subject: Re: [OE-core] externalsrc wiping out external source directory
From: richard.purdie@linuxfoundation.org
To: Kristian Amlie <kristian.amlie@northern.tech>, OE-core
	 <Openembedded-core@lists.openembedded.org>
Date: Mon, 30 May 2022 12:48:41 +0100
In-Reply-To: <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
	 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
	 <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 11:48:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166282

On Mon, 2022-05-30 at 13:46 +0200, Kristian Amlie wrote:
> On 27/05/2022 16:19, richard.purdie@linuxfoundation.org wrote:
> > On Fri, 2022-05-27 at 14:07 +0200, Kristian Amlie via
> > lists.openembedded.org wrote:
> > > Hey all,
> > >=20
> > > I have a problem on kirkstone where using the "externalsrc" class wip=
es
> > > out the directory mentioned in EXTERNALSRC, in other words my persona=
l
> > > development repository.
> > >=20
> > > I have traced it down to the "do_unpack[cleandirs]" variable flag. Th=
is
> > > flag is supposed to be removed here [1] when using "externalsrc", and
> > > indeed I have verified that this is the case. But when the function i=
s
> > > about to be executed, the "cleandirs" variable flag has somehow been
> > > restored [2]. This causes the directory to be removed after all, desp=
ite
> > > the attempt at avoiding it.
> > >=20
> > > At this point I'm a bit lost, I don't really know what happens betwee=
n
> > > those two steps. Does anyone have any idea what might be happening? I=
t
> > > sounds like a pretty serious bug to me, wiping out things in the home
> > > directory of the user.
> > >=20
> > > [1]
> > > https://git.yoctoproject.org/poky/tree/meta/classes/externalsrc.bbcla=
ss?h=3Dkirkstone#n93
> > > [2]
> > > https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/build.py?h=3Dki=
rkstone#n191
> >=20
> > That certainly isn't supposed to happen. As you say, the code is
> > supposed to disable that and isn't behaving as intended. It is hard to
> > say more though.
> >=20
> > Is there a test case you can share with us so we can reproduce the
> > issue? Without some way to replicate of more details of the environment
> > this occurred in, debugging it will be very hard.
>=20
> Here's a way to reproduce it:
>=20
> 1. Take any recipe, let's say recipes-core/busybox/busybox_1.35.0.bb
>=20
> 2. Add "inherit go" to that recipe.
>=20
> 3. Add 'INHERIT +=3D "externalsrc"' to local.conf.
>=20
> 4. Add 'EXTERNALSRC:pn-busybox =3D "/tmp/busybox"' to local.conf.
>=20
> 5. Run "mkdir -p /tmp/busybox/keep".
>=20
> 6. Run "bitbake -fc unpack busybox".
>=20
> 7. Afterwards, observe that "/tmp/busybox/keep" has vanished.
>=20
> The key part here appears to be the "EXPORT_FUNCTIONS" statement inside=
=20
> go.bbclass. If "do_unpack" is removed from there, then the mechanism=20
> works correctly again.

Thanks, a reproducer helps a lot. This was almost certainly a result
of:

https://git.yoctoproject.org/poky/commit/?id=3D73fa855f6af5ef9c3a78656aa56f=
09d213601be2

Cheers,

Richard


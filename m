Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED8797FE44
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:21:48 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i11so8863306ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iS85GJtCmKgoNunxs6dPif5feIhritMcObQ8nxhaX2I=;
	b=p6Q3AEK7KYBs4ABOHhmV5iS+MTVSPeupK+HEj/hmiglkjrZnbpNxKdOKKDMcFSjEWi
	qcCcHyfBPVNChA3oOVpB0EjOgbT2PQCBNr/oT6NROFlericuKYPYbIWd8fGjp0mXwnio
	OWMYP86T683pmOQncg6o6JnPPp8aqKlaRsC/Uvmqh1X0kZuWM59QTFmq5e9TOLIBxcCd
	70Wo7fWYdDInVypver8jVxwJkUtgjOgeijnBVtEVKhKNQwIjAkyx1IF6ei4caOBokbA8
	l8bPs/wadolX643x2FedkyM9wUmYTh85Smaup2PPcwTKwxJghHFeX1kSNS+SB30F/Wg7
	dYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iS85GJtCmKgoNunxs6dPif5feIhritMcObQ8nxhaX2I=;
	b=d6IbOLXb6JyzRaoxHspdk+gQaDnBDZlQ/9xYykZ4ciZs4XfVffF1c9q4NcoHROMuSZ
	5xC5H+OW/Oni5084UpQ0RfGW8NN+z/KUO92qkyBUzCYDikCkonWyBx9D+9mUeEFl1XrG
	LSdihveoBuPy+1RFovVEDm1G1g9q1aMdT0APZG7PSQxj5alihHoqDo3huXkHBfVyh5TY
	tYDF/e7rWrz2ko1HKVuwFGJxzeJYrHWCy1P53/MpHw4AkzB7auhANjAQN+z5NcGex75i
	Un6xgHQWDIb3+vKx60IGVhdGkJN+oFJN20f0ErH9NMQmv4d2Tz9+uaymyVcYZOQV6q2t
	owwQ==
X-Gm-Message-State: APjAAAV9U1EHdmET9tGNltRlxl5IUreCdKEgyspM6qRtFrW0ozWVTnZr
	hsdpppg3STCc0HyPV+5gA2SRbWeps+RSULjMoik=
X-Google-Smtp-Source: APXvYqw5fwI/S/ARJJiOpjkEr/Kie6vf/vnI56sQMw4oo+/nbsnHG4NR28P5R8isxYV9Z3eswvBQlPZH2pa/Gv/TcbU=
X-Received: by 2002:a5d:9ecc:: with SMTP id a12mr9930432ioe.267.1578608509838; 
	Thu, 09 Jan 2020 14:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-5-schnitzeltony@gmail.com>
	<083170de5cdb826ab20f4384270b1f9553692e62.camel@linuxfoundation.org>
In-Reply-To: <083170de5cdb826ab20f4384270b1f9553692e62.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Jan 2020 23:21:38 +0100
Message-ID: <CALbNGRRcKK-Y-xjqnV1ESxOnEa=vM+-1x4uH2JiMvxKOqnTVng@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/11] bitbake.conf: add variables 'mimedir' and 'desktopdir'
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
X-List-Received-Date: Thu, 09 Jan 2020 22:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 11:15 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-01-09 at 21:26 +0100, Andreas M=C3=BCller wrote:
> > mimedir:
> >    This is the path all mime information is stored at and
> >    update-mime-database works with
> > desktopdir:
> >    All application .desktop files are stored here
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 263d8aea4f..6fb4072f1b 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -34,6 +34,8 @@ export datadir =3D "${prefix}/share"
> >  export infodir =3D "${datadir}/info"
> >  export mandir =3D "${datadir}/man"
> >  export docdir =3D "${datadir}/doc"
> > +export mimedir =3D "${datadir}/mime"
> > +export desktopdir =3D "${datadir}/applications"
>
> Do these really need to be exported to the environment for everything?
It is not mandatory. It is just that I wanted to avoid redundancies in
insane.bbclass / mime*.bbclass. If adding exports is a problem I can
remove that. Let me know

Andreas
>
> Cheers,
>
> Richard
>


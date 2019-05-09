Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 692597DFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 14:01:10 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id g84so1701608ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 07:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=J+KfOlJenZ3NselAezKgV31MOTZbRbP9htiS43ehWT4=;
	b=qw9PNGYWH6ZSX47Q9dLwCUJl7QfIQcwgK85T5WAGaaO4WzN7CyJ2+1gwLv63uZCxeK
	i3IjB/An7Bq9x911FwnyibuJqmFL1Koxzlhbf75KHWihfxaJcHq6gu+Ed8Fi1OIRA85k
	pSr7d0T2Y+2axuQB8y1WLqMr9S51agG2SmH89sLO+YQcZaI52u/Ly03uuNim+gtatkef
	w07wPcfoxxz0fKVhFnCHDdZXVb5oerCYjmlsOxBAyA/x5+cIHZ2fFtqdeaLos075NbNc
	uGHZVuJ9ZbRsHEPCQEBsMAt6nG60m1rjXWtWiQ8UB47Hn6Jw4YX8pgxh97+UaUMEzTAP
	WfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=J+KfOlJenZ3NselAezKgV31MOTZbRbP9htiS43ehWT4=;
	b=qE611I2NZPLUHDb0ep5pBeMWVjkKrEANUWMJm3CRGjldcvtUKh1KDH2jmK/B7jr9O1
	OIcYtF6pxtcGYSBCP/f25cjJVySjQa6+PJa5Q2sls8kuDNcWU+67KAqKHM1pFx/oNd+2
	EQcGc4b/Q32fTzE4KBqsiwtH7SSk5Dgl5yvdXtLMv6Pt+U1Cfwdfp0b6HAobiiTJIhFj
	eCLpOxjnKl1jq4JxK0zBubTxr8qhaCxk89UEdTRE6HzZxlvRZ7V8yfWAVQ8UTK4buEg2
	Gp5QLnmZS9RyAtkQSmLWPIapqhk5Yx3NEn525zLXGsMSp0Z0ZBDjCpGjXIpuLJZnjbm0
	sIEw==
X-Gm-Message-State: APjAAAVq7NgpKwL4S5aY7I0emDuWRXuEFErDvVbGYDuxkXLq4EKyXBvn
	Wk7EbP6Ljeqz+ROGF8SW7x+D0e6bXuizEEvEjiQ=
X-Google-Smtp-Source: APXvYqwE6HOfwGjRNPHGK0V/ATR/03S2bDezIMbJ2nFNIyLr4w5SjjGMbDEuIYQWk5+HBKYArq//DZZcoy0lR9wYM+Q=
X-Received: by 2002:a5e:8708:: with SMTP id y8mr2480221ioj.272.1557410471498; 
	Thu, 09 May 2019 07:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190508201335.1732-1-schnitzeltony@gmail.com>
	<CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
In-Reply-To: <CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 May 2019 16:01:00 +0200
Message-ID: <CALbNGRQE6Pk_mYjjKCyPug0ti=Ogy6UyTYOfLej5fTHFP5Oc6Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: add MESON_CROSS_EXTRA_PROPS to inject properties into meson.cross
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
X-List-Received-Date: Thu, 09 May 2019 14:01:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2019 at 1:04 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 8 May 2019 at 21:14, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> > Some projects rely on (cross)specific properties e.g [1]. By setting
> >
> > MESON_CROSS_EXTRA_PROPS=3D"var1=3D'value1' var2=3Dtrue"
> >
> > the required properties can be passed to meson.build. The contents of
> > MESON_CROSS_EXTRA_PROPS behave same as known by e.g EXTRA_OEMESON.
> >
> > [1] https://gitlab.gnome.org/GNOME/tracker/blob/master/meson.build#L91
>
> Or see https://git.openembedded.org/openembedded-core/commit/?id=3De04e0a=
20cab04966698c50dc79195a8f159248d3
> for an example of how this is done already.
>
> Ross
I have to get back to this.

For the gnome tracker case I have in the recipe

| # full text search requires sqlite3 build with PACKAGECONFIG[fts5] set
| PACKAGECONFIG[fts] =3D "-Dfts=3Dtrue,-Dfts=3Dfalse"

and was happy to handle it correctly the OE way

| MESON_CROSS_EXTRA_PROPS =3D
"sqlite3_has_fts5=3D'${@bb.utils.contains('PACKAGECONFIG', 'fts',
'true', 'false', d)}'"

Andreas


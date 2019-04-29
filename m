Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 709987DD39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:52:42 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id l203so9053642oia.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2v5bO4jO2+0VjGw09BUEdu6t5uAGCgZTjnco9cgb0F4=;
	b=r+TyXYLYs+EtUWSiU6yCePrErLEvk6XByMR2AmeT3dIOYN+jeyD6WtMnheKSxHFgSG
	hrFy4wzwizD2F/h2lH+QH0X+ihOpAxUalb1NN86dS5PpOKGlWK5e8mTmGPhoSi5NBbG9
	OgV7hYU/linzmpOoKnLfNQ1JvyhGPMwDeXT7gx8H6wwa9HHl0gTPySzmcR+5Gg6nRzug
	GMmSvTFARAAsNnqFqmSceJHFPQ79ggzEUabKdxPwcAiA19W1wgJBQxn/534EMUK1rgo/
	KYfiHs3od38m1XZpZEL9usSdGKNYmQbBwWnEpK4nPY0ellM3hC7xfcQfZyUCNN6oR7cC
	PPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2v5bO4jO2+0VjGw09BUEdu6t5uAGCgZTjnco9cgb0F4=;
	b=Dqb14dgJTDb7K+5PxYi0jHg7qZSKUREGfC3hgSkKeBec857ff8pe2p+CeMWuTYGemi
	cAyu670p56Lazm8ElSZaemZYYpPLTnxgyVnE0bGl1zJRMv89ObEVE55vNUhml2FY2L5X
	SqzVxBGOdFHCCmjJoVf/Uhx3EqAxJOmAI99LarZkZzaErTyG9q3RsolN967qWg37lhDb
	9DVZDymktRYG8zGbotivTEHdkfp/lLI/x+BZiBGxPXgwnaV8HANX8SrlHYOOuqD3te/1
	KWbqYKx1SCOAPnBxzXa8eEC2XMOfXWIh/pcRaWqwSKcnv7NrlIWEPgwkHOJ9uN8v/sHR
	yrlg==
X-Gm-Message-State: APjAAAWLUPLBWU6vnwtXwk0YC4B51yHrRRFrNcB4X8gnZXvHSsVeGv1j
	J/xCdgN3jJz0cVZWeFHY5Y5unPBtya1CejRk5dc=
X-Google-Smtp-Source: APXvYqzope9a1RT3Qx+x96xbFk8QSRts1r/WtkQHd8Jh6GmM2KLFU9wudJkeZfmmnHFkAJGnyuA6/W9RhbkLyBv1BiU=
X-Received: by 2002:aca:5809:: with SMTP id m9mr219451oib.88.1556560363356;
	Mon, 29 Apr 2019 10:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
	<20190418155918.40653-2-alex.kanavin@gmail.com>
	<CAMKF1soCnBA+kgUqV-XBKfz554c1ecWXyRPn7DXJzRofkcfC0Q@mail.gmail.com>
In-Reply-To: <CAMKF1soCnBA+kgUqV-XBKfz554c1ecWXyRPn7DXJzRofkcfC0Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2019 19:52:31 +0200
Message-ID: <CANNYZj-PaXAM_9N25LTUiD7ijp+jNw87N9On4a3fm+Kxei_pNg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] epiphany: update to 3.32.1.2
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
X-List-Received-Date: Mon, 29 Apr 2019 17:52:42 -0000
Content-Type: text/plain; charset="UTF-8"

"../epiphany-3.32.1.2/lib/ephy-web-app-utils.c:391:5: error: cannot
jump from this goto statement to its label"

Huh? :)

Alex

On Mon, 29 Apr 2019 at 19:16, Khem Raj <raj.khem@gmail.com> wrote:
>
> FWIW Fails on rpi3
> https://errors.yoctoproject.org/Errors/Details/238639/
>
> On Thu, Apr 18, 2019 at 8:59 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Drop an option no longer provided by upstream.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb}   | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >  rename meta/recipes-gnome/epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb} (80%)
> >
> > diff --git a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> > similarity index 80%
> > rename from meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
> > rename to meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> > index a64c82f48bf..ba2e851bb6f 100644
> > --- a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
> > +++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> > @@ -13,10 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
> >  SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> >             file://0002-help-meson.build-disable-the-use-of-yelp.patch \
> >             "
> > -SRC_URI[archive.md5sum] = "fd05702b1c9bcb6a0633de54c4a6ccd2"
> > -SRC_URI[archive.sha256sum] = "76cdb8db6af2da8c3371a73e2dfd5ba64867b5f1e65fa9621f35348a42ff0d17"
> > -
> > -EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
> > +SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
> > +SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
> >
> >  FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
> >  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


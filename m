Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id A7CC87999A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 08:27:23 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id q4-v6so5217507otf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=W5psXdcH4s019gQTYqTXjePqSsiOfqNn6qWiZnfpch0=;
	b=TIXm9mfjltoI1WMSCOk6ay+BVE+V1GJckL4W3wRuNLd4vQymlN8+rsTT7kaZ7QoR0Q
	7CEnggydWfSuqijYcS30TVKMhDPrk26jSxrG2VzV6BuphD+KApK2FhZOWbTT/DJ87Uob
	BjRYN6lkNs9PQSVT4ax9h14/T5HYI3k8xkV5N5uZI4aKFNHkwTzvdlI97yL2oWsXNGBn
	i0i8lH6OUv6K0pnOQoI1NywkHXDWu6JXYEXxjuhhL9sUTpLA9y8OS+Abj+2tCHXZPl+F
	WEMPzsuekOwfyEJ0ZtdWChYVa3d5zZcuoGndsqhrBQZc3AkAtO73vyaygBSARsCUEbo7
	bI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=W5psXdcH4s019gQTYqTXjePqSsiOfqNn6qWiZnfpch0=;
	b=Y3rqm2YUwTuVNF+F2s3gxEAmjpuu7ZfK2Y4gXfApR6rZSZJd6iaLFGIptL6h3CQeJv
	Kj/FTzfUP7eeNAsSeoUEXnf7e+sK3wWhP7Wksxc0jPGM11PM/5pCaCmF3U1MRsBpbivr
	/K+LmwCIUxf3t5qQqpCp34OqQhcEWN7LTt+p3c6Dui2k2gynwA25bBvpZW5NLT1oMzmy
	1oZTx4WLXmvSwL1wXMSZuh57HDM+eilCPdDNiopXu0rJ1S+BwWf7y0IeLcLRgfJ5S/SJ
	zg2mEHpPxale/np08W+lgIJYxly32pZLLN8ygRw0dHb8A20wPP8FTt5tK3S1odn4pmA6
	fK0Q==
X-Gm-Message-State: ABuFfohBb+5HXUggm+27FQvHOdAzcSgrqsKNEbompYVvC0mavLyulCDK
	9e9QqEK3DsgEnOel2sxbcW390zz22p7zX+GlKOI=
X-Google-Smtp-Source: ACcGV613KSOfhF++E3l2sOGfHqLxBAMcShsUZWgADSooDwp9oRz9xfg2ViEMRjo7QDdLOYy73Z43S4v9+dsMUrkJC5g=
X-Received: by 2002:a9d:cd8:: with SMTP id
	o24-v6mr7789656otd.367.1538123244508; 
	Fri, 28 Sep 2018 01:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537175252.git.kai.kang@windriver.com>
	<2a01e366-0e9d-0cc6-419b-6856173bff6f@windriver.com>
In-Reply-To: <2a01e366-0e9d-0cc6-419b-6856173bff6f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Sep 2018 10:27:12 +0200
Message-ID: <CANNYZj8D+iTsULmigJmWW1re_JHHHpziUEGmOwSHc8+eVs76sg@mail.gmail.com>
To: Kai Kang <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fix install file conflicts of gobject-introspection when multilib is enabled
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
X-List-Received-Date: Fri, 28 Sep 2018 08:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The original patches never made it to the list, can you resend please?
(just confirmed with oe-core archive page)

Alex


On Thu, 27 Sep 2018 at 10:28, Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2018=E5=B9=B409=E6=9C=8817=E6=97=A5 17:43, Kai Kang wrote:
> > Some of .gir files are target related, so install .gir files to ${libdi=
r}
> > rather than ${datadir} to fix install file conflicts when mutlilib is e=
nabled.
> >
> > The following changes since commit b78597a4e038ed64b379f11257002e5a5f24=
886f:
> >
> >    xf86-video-fbdev: update to 0.5.0 (2018-09-17 08:41:45 +0100)
> >
> > are available in the Git repository at:
> >
> >    git://git.pokylinux.org/poky-contrib kangkai/gir
> >    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/gir
> >
> > Kai Kang (2):
> >    gobject-introspection: fix multilib install file conflicts
> >    vala: update vapigen-wrapper
>
> Ping...
>
> >
> >   meta/recipes-devtools/vala/vala.inc           |  4 +-
> >   ...nfigure.ac-make-GIR_DIR-configurable.patch | 65 ++++++++++++++++++=
+
> >   .../gobject-introspection_1.58.0.bb           | 10 ++-
> >   3 files changed, 75 insertions(+), 4 deletions(-)
> >   create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-i=
ntrospection/0001-configure.ac-make-GIR_DIR-configurable.patch
> >
>
> --
> Regards,
> Neil | Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


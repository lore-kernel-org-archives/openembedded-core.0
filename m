Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60C82613B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:12:52 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id p2so5804895uao.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 00:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=15QSetudrBWjtZ4bZlU7T5xQR2kHgNkb7u5mCR9XkGM=;
	b=tPmRgZKOQwcTeKuYjXCDlsqrSRN+SvF/WaTgid2P6Rrc7Ey29yMShTS38Wh4NL/2Mp
	Y6fTBDHEpuDzxvj20F7ac7yaJ8pkeIX7pnDSo00/DPn4aBulgX+qdb//l0+goJN9Sorc
	RqGtZaWEIOXqTGyS8IySLFR/TG3mmROokg26mEEhoXZETIi1a04DipjbkTE08itH71xL
	tp06p0kY6i9gEEzXXkzTSeGtv921kQ2ahWVtlWu7TTCLdvQ0lZ+OoBJik3GRkQpHT95J
	JEc1PvPyIat/Q9xwE75ODwcR2zR0RwQ90WP23nNgRtqzYeweZJxdr6qpM8H+JhZ8YtCY
	UtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=15QSetudrBWjtZ4bZlU7T5xQR2kHgNkb7u5mCR9XkGM=;
	b=KQ/obI26ZkbSSh23jJKn6dPx++RyBZHEY881WvX48H17Qs5WHd7sS4wBhrF1nEkD/f
	3iz7J7WGnGNyBpPWI+Qn3WYnSl2C2FdKBW4bn8qrK/Qc8xsO6fNxBMeRzEkdskYg/o9/
	9UqjlXdZEUGH+2Xn7p5SiHQuRKiB2UNjuoNBVk8ZGHaRJHZ1/IZQyIl2C09n12POXSfP
	XXo6NM7Dfq8JY61JmdZApEPN23rU1C76dbvsKnLnvrtzykE6111aKzNr0NuDUFOMzjbZ
	5qSxHFq48gbQ9n+mRxjJl8RZEV0kx6N9A8bCRc3tPgvrRoUXi554E5pFYF88mBUzhBVT
	ETFg==
X-Gm-Message-State: APjAAAX1QivV2kkGxH2zmteoMhvQMV1HHWaCgpGYNXYVFqiy49tfvvVD
	9NirN9ZamGjgMAlXFrzqNGyOlrcu5g65PQ7wP2w=
X-Google-Smtp-Source: APXvYqwD+7AVt0mI0/nnh62/Ot2dyS8NYwK8zigf2q/H3aMfagqDjqPZzyJ0tuHTxOmiTIs/Wsqhx9cwPOA5cJkQSE8=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr6625772uam.71.1581927173385; 
	Mon, 17 Feb 2020 00:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-2-alex.kanavin@gmail.com>
	<CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
	<CANNYZj8qJVAh9Zz_u5OT0HRCn_LD8ZG9E3-abjJLZbo7=0UzCw@mail.gmail.com>
	<CAMKF1sqrxL4H-gYab-VopR-ZUhiPqo3f3XXQhedaKrZ7eGXtZQ@mail.gmail.com>
	<CANNYZj_2H6YJ4hO69Rwqqs6NjJynX-yigJhTdhj7tTFgbBroUw@mail.gmail.com>
	<CAMKF1soQsumU153u0ZmV6AXOiT49r3smLGfjBYYbVYEQ2-N0Eg@mail.gmail.com>
In-Reply-To: <CAMKF1soQsumU153u0ZmV6AXOiT49r3smLGfjBYYbVYEQ2-N0Eg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 09:12:42 +0100
Message-ID: <CANNYZj_8Hr8mrV6ND+E2Si6PDmZ9e0dzryucD8zEVFYnmx7jHw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] procps: upstream has switched to gitlab
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
X-List-Received-Date: Mon, 17 Feb 2020 08:12:53 -0000
Content-Type: multipart/alternative; boundary="0000000000003af0d9059ec11f09"

--0000000000003af0d9059ec11f09
Content-Type: text/plain; charset="UTF-8"

I looked it up. Actually, potfiles.in is typically not a generated file,
and should be placed under version control. The comment is valid.

Alex

On Mon 17. Feb 2020 at 3.36, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Feb 16, 2020 at 12:45 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Sun, 16 Feb 2020 at 21:07, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> >>> -S = "${WORKDIR}/procps-ng-${PV}"
> >> >>> +# Upstream has a custom autogen.sh which invokes
> po/update-potfiles as they
> >> >>> +# don't ship a po/POTFILES.in (which is silly).  Without that file
> gettext
> >> >>> +# doesn't believe po/ is a gettext directory and won't generate
> po/Makefile.
> >> >>
> >> >> Do we miss .in file from tarball ? Or is it missing in a git checkout
> >> >> This is expected when building in a maintainer mode
> >> >> Tarballs are produced by maintainers for users
> >> >> Who wants to build from source
> >> >
> >> >
> >> > The .in is available in tarballs, but not in git repo. It's generated
> as explained above.
> >>
> >> right. Then revise the comment, since its expected to be absent when
> >> we are building from
> >> git sources.
> >
> >
> > The fix and the comment were copied wholesale and were originally
> written by Ross. How is POTFILES.in normally generated (i.e. without
> involving custom autogen.sh)?
>
> any .in file is usually generated by maintainer into source tarball
> since the build is not consuming source tar anymore
> this comment perhaps should be deleted.
>
> >
> > Alex
>

--0000000000003af0d9059ec11f09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I looked it up. Actually, <a href=3D"http://potfiles=
.in">potfiles.in</a> is typically not a generated file, and should be place=
d under version control. The comment is valid.</div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon 17. Feb 2020 at 3.36, Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Sun, Feb 16, 2020 at 12:45 PM =
Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, 16 Feb 2020 at 21:07, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; -S =3D &quot;${WORKDIR}/procps-ng-${PV}&quot;<br>
&gt;&gt; &gt;&gt;&gt; +# Upstream has a custom autogen.sh which invokes po/=
update-potfiles as they<br>
&gt;&gt; &gt;&gt;&gt; +# don&#39;t ship a po/POTFILES.in (which is silly).=
=C2=A0 Without that file gettext<br>
&gt;&gt; &gt;&gt;&gt; +# doesn&#39;t believe po/ is a gettext directory and=
 won&#39;t generate po/Makefile.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Do we miss .in file from tarball ? Or is it missing in a =
git checkout<br>
&gt;&gt; &gt;&gt; This is expected when building in a maintainer mode<br>
&gt;&gt; &gt;&gt; Tarballs are produced by maintainers for users<br>
&gt;&gt; &gt;&gt; Who wants to build from source<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The .in is available in tarballs, but not in git repo. It&#39=
;s generated as explained above.<br>
&gt;&gt;<br>
&gt;&gt; right. Then revise the comment, since its expected to be absent wh=
en<br>
&gt;&gt; we are building from<br>
&gt;&gt; git sources.<br>
&gt;<br>
&gt;<br>
&gt; The fix and the comment were copied wholesale and were originally writ=
ten by Ross. How is POTFILES.in normally generated (i.e. without involving =
custom autogen.sh)?<br>
<br>
any .in file is usually generated by maintainer into source tarball<br>
since the build is not consuming source tar anymore<br>
this comment perhaps should be deleted.<br>
<br>
&gt;<br>
&gt; Alex<br>
</blockquote></div></div>

--0000000000003af0d9059ec11f09--

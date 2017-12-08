Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 62F25785B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 11:43:55 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id b5so4267214itc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 03:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BvIWPFIriydjzMc3ZCyScdLZslWNum/OFx0gzo4EZGw=;
	b=UDdO8gyJbgb/e43BzoS5/JHvJIemeT323zNs53xpm94jHpVVUO/zKBVke5oo20m/3Z
	iBV7V4gkGHjspOeCEoUTPWCxlx/1vG7p15odRWujSeOBAP2oEKQC8+6RwFDaCslEldjT
	ZyPxaqM3T0nmkq85un07w89Gcwp/HjBG5RpLyhzv32pyay0KGkSJbVXvDqev0hgVEj9t
	3lNXjcFdEfzJ0B3xdaRdyiEedzt+vJYXqFpAkzrYVnDnolNpj/VAYZbebju7zCqZjrUb
	c016LufpijpIq2iNGLoP6Q1Z6WEiJK2xjXKzX3BGkHmRIhOH0LQLGGsfSQ05mnVcC5Pd
	ddow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BvIWPFIriydjzMc3ZCyScdLZslWNum/OFx0gzo4EZGw=;
	b=BiKtv5ozx9MnQHqQeJBM9zKsIeEuZJQAB9LXuGjHEyt6cAK3gFJrH/33ua5VeZrNHi
	syJqeZ6x4FIoU/GjDU52825Pigu2d+MUxe2JKktGYv9mvLHCvyOr36LL7oHWt2aiV2U4
	x4YgTCKheo4jcmCKvom4ZbxRYiwGFzwnwq4PjX9NMdifDcDLz1i5y6NJyUKy6+HgkuyW
	F1buAgUJlaG54GPYJxWYBu4jqNj2J4RmJhhKC4/7gDtq8Eb0wGgDZWn3fDk3niY0CNfx
	+vUFknmRmcm8Yl+i5eE0qt662E+eM6GeVP8IgZ29mdeVUKiZQQcsUKl5N3+OS77e3fpu
	e9Vw==
X-Gm-Message-State: AKGB3mLjV0WlQ6x9X8kYprPXquGLNVq7natqGrXQS+jFy8r5iEVk7xJs
	s0D+l5KCo43GvptLkN8K9XPdvVveUfJ+WRiUT3+DBQ==
X-Google-Smtp-Source: AGs4zMbfDiCopPDTYaemtvpbIy5t5evBLRom8VHdOr7drfKfXsDOLbewIggiQkWx3o2fOuHxqHaBLH9UaSO/y7ELBtc=
X-Received: by 10.36.80.148 with SMTP id m142mr5689222itb.6.1512733436703;
	Fri, 08 Dec 2017 03:43:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Fri, 8 Dec 2017 03:43:36 -0800 (PST)
In-Reply-To: <1512730125.32455.28.camel@andred.net>
References: <20171207211610.19158-1-gael.portay@savoirfairelinux.com>
	<1512730125.32455.28.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Dec 2017 11:43:36 +0000
Message-ID: <CAJTo0LbFpH5Dq8JUkfzNhLQ_iRgc9=VWT3q7-XjFMZu58ZzzNw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_manager.py: fix opkg custom config path
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
X-List-Received-Date: Fri, 08 Dec 2017 11:43:55 -0000
Content-Type: multipart/alternative; boundary="001a114387b8228b6f055fd2b3cd"

--001a114387b8228b6f055fd2b3cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

An even easier solution would  be to use oe.path.join, which solely exists
to join paths without the "interesting" absolute path quirk of os.path.join=
.

Ross

On 8 December 2017 at 10:48, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Thu, 2017-12-07 at 16:16 -0500, Ga=C3=ABl PORTAY wrote:
> > The opkg custom config feature has moved to the package_manager python
> > module. This feature is broken since commit 19c538f57c.
> >
> > The python function os.path.join joins path components. If a component
> > is an absolute path, all previous components are thrown away.
> >
> > The sysconfdir variable is an absolute path component. It causes the
> > leading target rootfs component to be removed. As a result, the
> > package-manager module tries to write in the real root filesystem
> > instead of the temporary work directory for the rootfs image.
> >
> > This fixes the issue by prepending the target rootfs component using th=
e
> > string concatenation operator when the file is opened (without using
> > os.path module).
> >
> > Cc: Ash Charles <ash.charles@savoirfairelinux.com>
> > Signed-off-by: Ga=C3=ABl PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  meta/lib/oe/package_manager.py | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/lib/oe/package_manager.py
> > b/meta/lib/oe/package_manager.py
> > index 6cbb61fd84..ac29593f88 100644
> > --- a/meta/lib/oe/package_manager.py
> > +++ b/meta/lib/oe/package_manager.py
> > @@ -953,12 +953,11 @@ class OpkgPM(OpkgDpkgPM):
> >              """
> >              if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") !=3D "=
":
> >                  for arch in self.pkg_archs.split():
> > -                    cfg_file_name =3D os.path.join(self.target_rootfs,
> > -
>  self.d.getVar("sysconfdi
> > r"),
> > +                    cfg_file_name =3D
> > os.path.join(self.d.getVar("sysconfdir", True),
>
> The 'True' argument has been removed from all getVar() calls, please don'=
t
> re-introduce it.
>
>
> >                                                   "opkg",
> >                                                   "local-%s-feed.conf" =
%
> > arch)
> >
> > -                    with open(cfg_file_name, "w+") as cfg_file:
> > +                    with open(self.target_rootfs + cfg_file_name, "w+"=
)
> > as cfg_file:
> >                          cfg_file.write("src/gz local-%s %s/%s" %
> >                                         (arch,
> >                                          self.d.getVar('FEED_DEPLOYDIR_
> BAS
> > E_URI'),
> > --
> > 2.15.0
> >
>
> Also, a simpler solution would be to simply strip the leading '/' from
> sysconfdir:
>
>                      cfg_file_name =3D os.path.join(self.target_rootfs,
> -
>  self.d.getVar("sysconfdir"),
> +
>  self.d.getVar("sysconfdir").lstrip("/"),
>                                                   "opkg",
>                                                   "local-%s-feed.conf" %
> arch)
>
> would be the only change needed.
>
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114387b8228b6f055fd2b3cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">An even easier solution would =C2=A0be to use oe.path.join=
, which solely exists to join paths without the &quot;interesting&quot; abs=
olute path quirk of os.path.join.<div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 December 2017 at 1=
0:48, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred=
.net" target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Thu, 2017-12=
-07 at 16:16 -0500, Ga=C3=ABl PORTAY wrote:<br>
&gt; The opkg custom config feature has moved to the package_manager python=
<br>
&gt; module. This feature is broken since commit 19c538f57c.<br>
&gt;<br>
&gt; The python function os.path.join joins path components. If a component=
<br>
&gt; is an absolute path, all previous components are thrown away.<br>
&gt;<br>
&gt; The sysconfdir variable is an absolute path component. It causes the<b=
r>
&gt; leading target rootfs component to be removed. As a result, the<br>
&gt; package-manager module tries to write in the real root filesystem<br>
&gt; instead of the temporary work directory for the rootfs image.<br>
&gt;<br>
&gt; This fixes the issue by prepending the target rootfs component using t=
he<br>
&gt; string concatenation operator when the file is opened (without using<b=
r>
&gt; os.path module).<br>
&gt;<br>
&gt; Cc: Ash Charles &lt;<a href=3D"mailto:ash.charles@savoirfairelinux.com=
">ash.charles@savoirfairelinux.<wbr>com</a>&gt;<br>
&gt; Signed-off-by: Ga=C3=ABl PORTAY &lt;<a href=3D"mailto:gael.portay@savo=
irfairelinux.com">gael.portay@savoirfairelinux.<wbr>com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/package_manager.py | 5 ++---<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/package_manager.<wbr>py<br>
&gt; b/meta/lib/oe/package_manager.<wbr>py<br>
&gt; index 6cbb61fd84..ac29593f88 100644<br>
&gt; --- a/meta/lib/oe/package_manager.<wbr>py<br>
&gt; +++ b/meta/lib/oe/package_manager.<wbr>py<br>
&gt; @@ -953,12 +953,11 @@ class OpkgPM(OpkgDpkgPM):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (self.d.getVar(&#39=
;FEED_<wbr>DEPLOYDIR_BASE_URI&#39;) or &quot;&quot;) !=3D &quot;&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for arch=
 in self.pkg_archs.split():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cfg_file_name =3D os.path.join(self.target_<wbr>rootfs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&quot;sysconfdi<br>
&gt; r&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cfg_file_name =3D<br>
&gt; os.path.join(self.d.getVar(&quot;<wbr>sysconfdir&quot;, True),<br>
<br>
</div></div>The &#39;True&#39; argument has been removed from all getVar() =
calls, please don&#39;t<br>
re-introduce it.<br>
<span class=3D""><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;opkg&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;local-%s-feed.conf&quot; %<br>
&gt; arch)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 with open(cfg_file_name, &quot;w+&quot;) as cfg_file:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 with open(self.target_rootfs + cfg_file_name, &quot;w+&quot;)<br>
&gt; as cfg_file:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cfg_file.write(&quot;src/gz local-%s %s/%s&quot; %<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(arch,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self.d.getVar(&#39;FEED_DEPLOYDIR_<wbr>BAS<br>
&gt; E_URI&#39;),<br>
&gt; --<br>
&gt; 2.15.0<br>
&gt;<br>
<br>
</span>Also, a simpler solution would be to simply strip the leading &#39;/=
&#39; from<br>
sysconfdir:<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cfg_file_name =3D os.path.join(self.target_<wbr>rootfs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&quot;sysconfdir&quot;),<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&quot;sysconfdir&quot;).<wb=
r>lstrip(&quot;/&quot;),<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;opkg&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;local-%s-feed.conf&quot; % arch)<br>
<br>
</span>would be the only change needed.<br>
<br>
<br>
Cheers,<br>
Andre&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114387b8228b6f055fd2b3cd--

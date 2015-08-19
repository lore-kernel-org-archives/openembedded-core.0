Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id C1461767D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:30:59 +0000 (UTC)
Received: by qged69 with SMTP id d69so13857474qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PJNlqBP50x98IiNFELxEV1+4N8EqTZs3nRNqN3lGEBk=;
	b=k9ztFS7vPz4ojbJ7v1UmZJXG6A+Hy8yRtVz8YGad+2lwpMsF6skr+oB5OwtRFUfKrH
	aPxCZFXwdOWkU/SlBMsrWzZpWm1ObMvqR8C9lnn6eRdLGVCwTTBePggTeTkXack9AoSY
	BVUuIj1VOkbyIzHsjmS+3wWuk8wcKtV4q+u1N9jy5TNucByGRIaBtVmDUocnnR9HN8FB
	W9VHChsu/NvzBlOxu6dAH/bheKrkVIgUtbWEiCvTG/ExfO2KARTRfkSG0TmOh7Us6VzQ
	xL1OjSztJqVnP8/CfEUtrA6LuqL4TDsuEpp3My/OxG6GJrfNcCu4xOdLMufviaGEKjOt
	BJEQ==
X-Gm-Message-State: ALoCoQmu+p5jkMX81VdIlCMZEL7EuwnRs3Di0JHx1y4ys7l7JuzsUrtmP8vqzy12q0hA8j4ERBac
X-Received: by 10.140.33.164 with SMTP id j33mr26853810qgj.77.1440016259332;
	Wed, 19 Aug 2015 13:30:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 13:30:39 -0700 (PDT)
In-Reply-To: <CALbNGRSyp39S0FcAsGw+EXHp85GaU=HAW9OKJQi0Ta4WeFnHQA@mail.gmail.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<5d7a87b67d76994b2a71bcb40d256e22304c6f31.1439991562.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSyp39S0FcAsGw+EXHp85GaU=HAW9OKJQi0Ta4WeFnHQA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 21:30:39 +0100
Message-ID: <CAJTo0LZ9rh4OaXHX9a1y1J7mYxcWSngmT1u+8rne3r5nDH3EaQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/22] glib: add a warning suppression patch to glib
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
X-List-Received-Date: Wed, 19 Aug 2015 20:31:05 -0000
Content-Type: multipart/alternative; boundary=001a1139bd9c9c0695051dafe960

--001a1139bd9c9c0695051dafe960
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 August 2015 at 21:26, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
wrote:

> On Wed, Aug 19, 2015 at 3:40 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > Otherwise QA check will fail.
> > Some schemas in gsettings-desktop-schemas (such as proxy and locale)
> > are still using deprecated paths, as of 3.16.1. This causes warning
> > messages, and meta/lib/oe/rootfs.py complaints about them.
> >
> > Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > ---
> >  ...warning-about-deprecated-paths-in-schemas.patch | 32
> ++++++++++++++++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb      |  1 +
> >  2 files changed, 33 insertions(+)
> >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-depreca=
ted-paths-in-schemas.patch
> >
> > diff --git
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-depre=
cated-paths-in-schemas.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-depre=
cated-paths-in-schemas.patch
> > new file mode 100644
> > index 0000000..54e830c
> > --- /dev/null
> > +++
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-depre=
cated-paths-in-schemas.patch
> > @@ -0,0 +1,32 @@
> > +From 41534253b6b61ed4769eb6a3966698a50ee73b71 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 12 Jun 2015 17:08:46 +0300
> > +Subject: [PATCH] Remove the warning about deprecated paths in schemas
> > +
> > +Some schemas in gsettings-desktop-schemas (such as proxy and locale)
> > +are still using deprecated paths, as of 3.16.1. This causes warning
> > +messages, and meta/lib/oe/rootfs.py complaints about them.
> Upstream-Status


In a desperate attempt to merge at least some of this into master shortly,
I added that by hand when merging to mut...

Ross

--001a1139bd9c9c0695051dafe960
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 August 2015 at 21:26, Andreas M=C3=BCller <span dir=
=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_bla=
nk">schnitzeltony@googlemail.com</a>&gt;</span> wrote:<br><div class=3D"gma=
il_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cl=
ass=3D"HOEnZb"><div class=3D"h5">On Wed, Aug 19, 2015 at 3:40 PM, Alexander=
 Kanavin<br>
&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@=
linux.intel.com</a>&gt; wrote:<br>
&gt; Otherwise QA check will fail.<br>
&gt; Some schemas in gsettings-desktop-schemas (such as proxy and locale)<b=
r>
&gt; are still using deprecated paths, as of 3.16.1. This causes warning<br=
>
&gt; messages, and meta/lib/oe/rootfs.py complaints about them.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanav=
in@linux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...warning-about-deprecated-paths-in-schemas.patch | 32 ++++++++=
++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.44.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.44.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 33 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Remo=
ve-the-warning-about-deprecated-paths-in-schemas.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warni=
ng-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/gli=
b-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..54e830c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-abou=
t-deprecated-paths-in-schemas.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 41534253b6b61ed4769eb6a3966698a50ee73b71 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 12 Jun 2015 17:08:46 +0300<br>
&gt; +Subject: [PATCH] Remove the warning about deprecated paths in schemas=
<br>
&gt; +<br>
&gt; +Some schemas in gsettings-desktop-schemas (such as proxy and locale)<=
br>
&gt; +are still using deprecated paths, as of 3.16.1. This causes warning<b=
r>
&gt; +messages, and meta/lib/oe/rootfs.py complaints about them.<br>
</div></div>Upstream-Status</blockquote><div><br></div><div>In a desperate =
attempt to merge at least some of this into master shortly, I added that by=
 hand when merging to mut...</div><div><br></div><div>Ross</div></div></div=
></div>

--001a1139bd9c9c0695051dafe960--

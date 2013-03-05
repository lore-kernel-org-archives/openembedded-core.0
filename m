Received: from mail-we0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UCufN-0004ll-2D
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 17:24:41 +0100
Received: by mail-we0-f169.google.com with SMTP id t11so6756459wey.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 08:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=nTkGC0DDN+E9AxMyEbnVrftW/jpILXZUshN9avxeN34=;
	b=iQxFOnZeQh3AUzQLOL7VUyVzaJWuFcdcW4ER/CFx909INsv/N9UP8fNI1/LDm1jw9v
	VQuv3k3hh5KP3Tv/Vtw9XltHOAJB4ro914u4MYkz3h3pGQfU3OJxekyFBkNdjm7bx/VC
	WxN80KNjKsh4wFdaIeQSiAfP6PF63YT74NBO7DWcTvFIpaov3OKfMbcD/g44bo3YeMQI
	J+dmam55GPwOgOe5lynMzPRkYHrYlEp6WHaaarltWy+qZg/1TLKQtmZOrKIp7KicpelH
	iu1Iriv5CcIdZjUxiIlIvEW5gV1M1f+t0R94juvljmqiWHuOmFL/EHuPwev5kaj5FQfy
	/FIw==
X-Received: by 10.180.183.193 with SMTP id eo1mr19693029wic.19.1362499687562; 
	Tue, 05 Mar 2013 08:08:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.40.6 with HTTP; Tue, 5 Mar 2013 08:07:46 -0800 (PST)
In-Reply-To: <20130305153031.GC12023@jama.dyndns-home.com>
References: <1362497257-23984-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130305153031.GC12023@jama.dyndns-home.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 5 Mar 2013 18:07:46 +0200
Message-ID: <CAMZjud2xRQEWrU3Z16r+CTy1zdgkg+W2k9aKg313aCBKyQXeSQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlC449/yv/i2jnoxuO1ZfuMagwmiguPCRQjxhhT4Vkk5GT97aDjBTC9VS5X1ha192thMgsE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gmp: updated to 5.1.0a
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 16:24:41 -0000
Content-Type: multipart/alternative; boundary=001a11c241cee25a7004d72fad91

--001a11c241cee25a7004d72fad91
Content-Type: text/plain; charset=ISO-8859-1

Sorry, I didn't realize that v1 was already merged. New patch sent.

Thanks,
Bogdan

On Tue, Mar 5, 2013 at 5:30 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Mar 05, 2013 at 05:27:37PM +0200, Bogdan Marinescu wrote:
> > ---
> >  .../gmp/{gmp-5.1.0 => gmp-5.1.0a}/187b7b1646ee.patch            |    0
> >  .../gmp/{gmp-5.1.0 => gmp-5.1.0a}/configure.patch               |    0
> >  .../{gmp-5.1.0 => gmp-5.1.0a}/obsolete_automake_macros.patch    |    0
> >  meta/recipes-support/gmp/{gmp_5.1.0.bb => gmp_5.1.0a.bb}        |    7
> +++----
> >  4 files changed, 3 insertions(+), 4 deletions(-)
> >  rename meta/recipes-support/gmp/{gmp-5.1.0 =>
> gmp-5.1.0a}/187b7b1646ee.patch (100%)
> >  rename meta/recipes-support/gmp/{gmp-5.1.0 =>
> gmp-5.1.0a}/configure.patch (100%)
> >  rename meta/recipes-support/gmp/{gmp-5.1.0 =>
> gmp-5.1.0a}/obsolete_automake_macros.patch (100%)
> >  rename meta/recipes-support/gmp/{gmp_5.1.0.bb => gmp_5.1.0a.bb} (71%)
>
> v1 was already applied, you don't need to rename them, just return PR
> and set it to r2.
>
> > diff --git a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
> b/meta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch
> > similarity index 100%
> > rename from meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
> > rename to meta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch
> > diff --git a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch
> b/meta/recipes-support/gmp/gmp-5.1.0a/configure.patch
> > similarity index 100%
> > rename from meta/recipes-support/gmp/gmp-5.1.0/configure.patch
> > rename to meta/recipes-support/gmp/gmp-5.1.0a/configure.patch
> > diff --git
> a/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch
> b/meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.patch
> > similarity index 100%
> > rename from
> meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch
> > rename to
> meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.patch
> > diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bbb/meta/recipes-support/gmp/
> gmp_5.1.0a.bb
> > similarity index 71%
> > rename from meta/recipes-support/gmp/gmp_5.1.0.bb
> > rename to meta/recipes-support/gmp/gmp_5.1.0a.bb
> > index 6591ebe..b5d6842 100644
> > --- a/meta/recipes-support/gmp/gmp_5.1.0.bb
> > +++ b/meta/recipes-support/gmp/gmp_5.1.0a.bb
> > @@ -3,13 +3,12 @@ LICENSE="LGPLv3&GPLv3"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
> \
> >
> file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
> >
> > -PR = "r1"
> > -
> >  SRC_URI_append = " file://use-includedir.patch \
> >                     file://gmp_fix_for_x32.patch \
> >                     file://187b7b1646ee.patch \
> >                     file://obsolete_automake_macros.patch \
> >                     "
> > +S = "${WORKDIR}/gmp-5.1.0"
> >
> > -SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
> > -SRC_URI[sha256sum] =
> "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a3181164ad2fad5eefc796"
> > +SRC_URI[md5sum] = "cf6d7cb5915f29ce0fc41d042205c080"
> > +SRC_URI[sha256sum] =
> "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb05ca9bccd990794dc"
> > --
> > 1.7.10.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a11c241cee25a7004d72fad91
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry, I didn&#39;t realize that v1 was already merged. New patch sent.<div=
><br></div><div>Thanks,</div><div>Bogdan<br><br><div class=3D"gmail_quote">=
On Tue, Mar 5, 2013 at 5:30 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Mar 05, 2013 at 05=
:27:37PM +0200, Bogdan Marinescu wrote:<br>
&gt; ---<br>
&gt; =A0.../gmp/{gmp-5.1.0 =3D&gt; gmp-5.1.0a}/187b7b1646ee.patch =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A00<br>
&gt; =A0.../gmp/{gmp-5.1.0 =3D&gt; gmp-5.1.0a}/configure.patch =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A00<br>
&gt; =A0.../{gmp-5.1.0 =3D&gt; gmp-5.1.0a}/obsolete_automake_macros.patch =
=A0 =A0| =A0 =A00<br>
&gt; =A0meta/recipes-support/gmp/{<a href=3D"http://gmp_5.1.0.bb" target=3D=
"_blank">gmp_5.1.0.bb</a> =3D&gt; <a href=3D"http://gmp_5.1.0a.bb" target=
=3D"_blank">gmp_5.1.0a.bb</a>} =A0 =A0 =A0 =A0| =A0 =A07 +++----<br>
&gt; =A04 files changed, 3 insertions(+), 4 deletions(-)<br>
&gt; =A0rename meta/recipes-support/gmp/{gmp-5.1.0 =3D&gt; gmp-5.1.0a}/187b=
7b1646ee.patch (100%)<br>
&gt; =A0rename meta/recipes-support/gmp/{gmp-5.1.0 =3D&gt; gmp-5.1.0a}/conf=
igure.patch (100%)<br>
&gt; =A0rename meta/recipes-support/gmp/{gmp-5.1.0 =3D&gt; gmp-5.1.0a}/obso=
lete_automake_macros.patch (100%)<br>
&gt; =A0rename meta/recipes-support/gmp/{<a href=3D"http://gmp_5.1.0.bb" ta=
rget=3D"_blank">gmp_5.1.0.bb</a> =3D&gt; <a href=3D"http://gmp_5.1.0a.bb" t=
arget=3D"_blank">gmp_5.1.0a.bb</a>} (71%)<br>
<br>
</div>v1 was already applied, you don&#39;t need to rename them, just retur=
n PR<br>
and set it to r2.<br>
<div><div class=3D"h5"><br>
&gt; diff --git a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch b/m=
eta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch<br>
&gt; rename to meta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch<br>
&gt; diff --git a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch b/meta=
/recipes-support/gmp/gmp-5.1.0a/configure.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-support/gmp/gmp-5.1.0/configure.patch<br>
&gt; rename to meta/recipes-support/gmp/gmp-5.1.0a/configure.patch<br>
&gt; diff --git a/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macr=
os.patch b/meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.pat=
ch<br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macro=
s.patch<br>
&gt; rename to meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros=
.patch<br>
&gt; diff --git a/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0.bb" =
target=3D"_blank">gmp_5.1.0.bb</a> b/meta/recipes-support/gmp/<a href=3D"ht=
tp://gmp_5.1.0a.bb" target=3D"_blank">gmp_5.1.0a.bb</a><br>
&gt; similarity index 71%<br>
&gt; rename from meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0.bb" t=
arget=3D"_blank">gmp_5.1.0.bb</a><br>
&gt; rename to meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0a.bb" ta=
rget=3D"_blank">gmp_5.1.0a.bb</a><br>
&gt; index 6591ebe..b5d6842 100644<br>
&gt; --- a/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0.bb" target=
=3D"_blank">gmp_5.1.0.bb</a><br>
&gt; +++ b/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0a.bb" target=
=3D"_blank">gmp_5.1.0a.bb</a><br>
&gt; @@ -3,13 +3,12 @@ LICENSE=3D&quot;LGPLv3&amp;GPLv3&quot;<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab87=
4e80d47fae504 \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://version.c;endline=3D18;md5=
=3Dd8c56b52b9092346b9f93b4da65ef790&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r1&quot;<br>
&gt; -<br>
&gt; =A0SRC_URI_append =3D &quot; file://use-includedir.patch \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://gmp_fix_for_x32.patch \=
<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://187b7b1646ee.patch \<br=
>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://obsolete_automake_macro=
s.patch \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt; +S =3D &quot;${WORKDIR}/gmp-5.1.0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;362cf515aff8dc240958ce47418e4c78&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8b=
e9a3181164ad2fad5eefc796&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;cf6d7cb5915f29ce0fc41d042205c080&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;ed5239a62aeaba6cfc8d50ec36fb59215618f98c=
248d4bb05ca9bccd990794dc&quot;<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div>

--001a11c241cee25a7004d72fad91--

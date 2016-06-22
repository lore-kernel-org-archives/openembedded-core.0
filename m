Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 35E0F731C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:36:02 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g13so38885821ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C9BxIbgpkXG8YVptaPF58MQvSsr0Z3mJQGc4bfG9Kds=;
	b=XNwNeHKeFvLHAsSTcOGoALwKxHDUIIq531kGf+z2NLhC8j2dYlXxYDksAPcs+bjCbf
	Ihkfd7cfZeSWaKZn4xATFvszz0QAeyzGZIpRRoeLpRGEO7IDHvgjQj/M2B2z0ZsjRk1r
	Dynz0o4RDfmlVbGdWQFNcJ7RKt47T7f087Fv4WfuAJzSd3b2HVso7lusTkAjQNjbDuIF
	p4pMD0uolrByVYQzcQ0l0YpHJ8T3swOT+TNw4KVIQYyMzD3NDGsSjDvRT8QXRvSvHhsT
	DW9SZB5oRQborkxZ9T+g6ZrzOCjoFJI6bTUNxfaM9SFTJY6UfCxM3FCQ3JvbOgtD6rbe
	xstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C9BxIbgpkXG8YVptaPF58MQvSsr0Z3mJQGc4bfG9Kds=;
	b=F1zy4F9VbSku3PgITMAosGdF4OykbLOYkdJFnMb/e5yGR05lEgmorg7BW7fCEbSqCQ
	sH6uf5yuSxpsrfx25VMdOn6feN7BhSN47psfkQTcUkpc1n3oggjSZv6MOS2pQ105Y/WP
	d1q5Nwr+V67TLEfP4iLBX+lIi1fVyDtW3okhGJMwNXTkYP+S/i99Yi6DihGysIUAyu7J
	xjfcrllxmVrxYQ3mq+3e/R+2qC3jY2/FkakpNO+DUIsXGCNzQIHNhTxB/n8/swkqSEb7
	9LBJpgHudMImjnFuLPUme7BRMJI2tzgHu4DRWMXoJmXhDNOu7Y5JJouYzhZGuHOoWZKZ
	ngcA==
X-Gm-Message-State: ALyK8tJG65OBy0K/gDfkFfzTK5bsVy5CY956BEntFVJ4F+15qfK18fw2vFf5ewQVdFEtYboJ2ZuMvqGMk2+KLJtV
X-Received: by 10.107.154.210 with SMTP id c201mr38842644ioe.99.1466606163251; 
	Wed, 22 Jun 2016 07:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 22 Jun 2016 07:35:43 -0700 (PDT)
In-Reply-To: <03eac8deaa244de132c505a9db7d411fc363f782.1466595928.git.jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
	<03eac8deaa244de132c505a9db7d411fc363f782.1466595928.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jun 2016 15:35:43 +0100
Message-ID: <CAJTo0LZmcuyPQEi3K8XxctBaC_MHTjnWpqgbT2koLirX62bHOA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/10] vte: don't build test app
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
X-List-Received-Date: Wed, 22 Jun 2016 14:36:03 -0000
Content-Type: multipart/alternative; boundary=001a1140fab663336c0535dedb9a

--001a1140fab663336c0535dedb9a
Content-Type: text/plain; charset=UTF-8

The patch should explain why we're disabling the test application.

If we don't build the test app then the "vte" package is pretty pointless:

libvte:
        /usr/lib/libvte-2.91.so.0
        /usr/lib/libvte-2.91.so.0.4400.1
vte:
        /etc/profile.d/vte.sh
        /usr/lib/girepository-1.0/Vte-2.91.typelib

The typelib should be with the library, and that sh fragment is fairly
pointless.  Should libvte and vte be merged (ie package the library into
$PN and let the renamer do its job)?

Ross

On 22 June 2016 at 12:52, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-support/vte/vte_0.44.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vte/vte_0.44.1.bb
> b/meta/recipes-support/vte/vte_0.44.1.bb
> index ecbf58a..f3baa1e 100644
> --- a/meta/recipes-support/vte/vte_0.44.1.bb
> +++ b/meta/recipes-support/vte/vte_0.44.1.bb
> @@ -18,7 +18,7 @@ PACKAGECONFIG[gnutls] =
> "--with-gnutls,--without-gnutls,gnutls"
>  CFLAGS += "-D_GNU_SOURCE"
>
>  # Enable vala only if gobject-introspection is enabled
> -EXTRA_OECONF = "--enable-vala=auto"
> +EXTRA_OECONF = "--enable-vala=auto --disable-test-application"
>
>  # libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
>  # Use libtool-cross (which has a hack to prevent that) instead.
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140fab663336c0535dedb9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch should explain why we&#39;re disabling the =
test application.</div><div><br></div>If we don&#39;t build the test app th=
en the &quot;vte&quot; package is pretty pointless:<div><br></div><div><div=
>libvte:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libvte-2.91.so.0</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libvte-2.91.so.0.4400.1</div><=
div>vte:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /etc/profile.d/vte.sh</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/girepository-1.0/Vte-2.91.typelib<=
/div></div><div><br></div><div>The typelib should be with the library, and =
that sh fragment is fairly pointless.=C2=A0 Should libvte and vte be merged=
 (ie package the library into $PN and let the renamer do its job)?</div><di=
v><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 22 June 2016 at 12:52, Jussi Kukkonen <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.ku=
kkonen@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Si=
gned-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com"=
>jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.44.1.bb</a> b/meta/recipes-support/=
vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"noreferrer" target=3D"_blank">v=
te_0.44.1.bb</a><br>
index ecbf58a..f3baa1e 100644<br>
--- a/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a><br>
+++ b/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a><br>
@@ -18,7 +18,7 @@ PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-g=
nutls,gnutls&quot;<br>
=C2=A0CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>
<br>
=C2=A0# Enable vala only if gobject-introspection is enabled<br>
-EXTRA_OECONF =3D &quot;--enable-vala=3Dauto&quot;<br>
+EXTRA_OECONF =3D &quot;--enable-vala=3Dauto --disable-test-application&quo=
t;<br>
<br>
=C2=A0# libtool adds &quot;-nostdlib&quot; when g++ is used. This breaks PI=
E builds.<br>
=C2=A0# Use libtool-cross (which has a hack to prevent that) instead.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1140fab663336c0535dedb9a--

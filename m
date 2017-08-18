Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAEB784A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 06:38:52 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id m88so30064570iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kifnSchsSQtQqlIW1JiTESji5u3infE7n62Z0Inpw8Q=;
	b=i6V+KKIC+VkRZGanWqHOUe8MWx06lnchtlastYbIsWzD5j1WuwtJJplJYqkikDPAbb
	L1t0RcAMh0IvBhM1U9PJRHVVkFKT3ybzEQq6eXt21yoqdk5Nut1mwbOHmAKsNYTcHW/f
	BG3bkj71w5cDdM6ohR/82dkqs8Kkary44sQSJEa+NSyNU2jQupCsustkhy1ShjqoNI46
	su5Z4NZzfEo+uxrNy+4vV50OHmV2YZO62vEPx68RiYVijyTqDlZBnLR3txgVFH7ilc8D
	DFlhvyv19GZ7H1vOjjEuVuwt9epjELSMt0HkxwgtJprxFzq1w3opfU3dika8Gkvdr2WT
	b+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kifnSchsSQtQqlIW1JiTESji5u3infE7n62Z0Inpw8Q=;
	b=icaliizLvQQ/mzAEN2wu3xINHWKfDorcGG6IgegcRP5YmWaJ9D8R7zpliHRYjWit2h
	xG3Ad92ndWDNYUFqKPSI3x+bky3JkB/yryy9GKir1thucELV9wMFe+gemmobgYDVJJDD
	54Vr+lcBXpRJ6pFCiJVIJH2iIvsBA6BPuZIZJgwVi7Hdw9+VPX9Y2CBo8hE6PmL3W7KH
	rAAk/HjQXEwIYtQzmI/gyfzQvbtFCg0CNKQ3wcVUapsyVxpHPcsqk7/xHP1oLNieR6t/
	Bhp8JH2MqNh5ATzllyipl+6D0wlaDI7ubqdB7RZUCptSUgFHkzKqQvkpCbqzVjweT33y
	MYWQ==
X-Gm-Message-State: AHYfb5in4ZMSvMdKGB34zB9nYerzroihedK9467Mje9yHCa1g6HiaXqT
	h2/V8TQ9UWYhKJ/I0JfOPRip32uBRxL50nw=
X-Received: by 10.107.20.81 with SMTP id 78mr6915492iou.98.1503038333580; Thu,
	17 Aug 2017 23:38:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Thu, 17 Aug 2017 23:38:23 -0700 (PDT)
In-Reply-To: <20170817182603.20588-1-clopez@igalia.com>
References: <20170817182603.20588-1-clopez@igalia.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 18 Aug 2017 09:38:23 +0300
Message-ID: <CAHiDW_EkLn1G9Ofs7doaPfScqmUwmRxrQzgNKT_9VZAUbkj6JQ@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Add a recommends on shared-mime-info.
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
X-List-Received-Date: Fri, 18 Aug 2017 06:38:52 -0000
Content-Type: multipart/alternative; boundary="001a114fcd24f51411055701612d"

--001a114fcd24f51411055701612d
Content-Type: text/plain; charset="UTF-8"

On 17 August 2017 at 21:26, Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

>  * without this package installed any WebKitGTK+ based browser
>    will fail to correctly open html files (and other files)
>    from disk (file:// URIs). It will open them as plain txt files.
>
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.16.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> index 387965970e..df355d29ba 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> @@ -98,7 +98,7 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
>
>  FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/
> libwebkit2gtkinjectedbundle.so"
>
> -RRECOMMENDS_${PN} += "ca-certificates"
> +RRECOMMENDS_${PN} += "ca-certificates shared-mime-info"


This isn't wrong , I'll just add some context.

If/when my gdk-pixbuf patch from three days ago lands gdk-pixbuf will
always rdepend on shared-mime-info (and webkitgtk probably can't be
installed without gdk-pixbuf) so the problem would disappear anyway. This
just a happy accident so this patch still seems valid.

There's also https://bugzilla.yoctoproject.org/show_bug.cgi?id=11792 about
whether glib should bring in shared-mime-info so GIO file sniffing wouldn't
be broken (the database is 3.6MB which is not a big number in a webkit
context but can be for others).

Jussi

--001a114fcd24f51411055701612d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
7 August 2017 at 21:26, Carlos Alberto Lopez Perez <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:clopez@igalia.com" target=3D"_blank">clopez@igalia.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0* without this package installed any WebKitGTK+ based browser<br>
=C2=A0 =C2=A0will fail to correctly open html files (and other files)<br>
=C2=A0 =C2=A0from disk (file:// URIs). It will open them as plain txt files=
.<br>
<br>
Signed-off-by: Carlos Alberto Lopez Perez &lt;<a href=3D"mailto:clopez@igal=
ia.com">clopez@igalia.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.16.6.bb" rel=
=3D"noreferrer" target=3D"_blank">webki<wbr>tgtk_2.16.6.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.16.6.bb=
" rel=3D"noreferrer" target=3D"_blank">web<wbr>kitgtk_2.16.6.bb</a> b/meta/=
recipes-sato/webkit/<a href=3D"http://webkitgtk_2.16.6.bb" rel=3D"noreferre=
r" target=3D"_blank">web<wbr>kitgtk_2.16.6.bb</a><br>
index 387965970e..df355d29ba 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.16.6.bb" rel=
=3D"noreferrer" target=3D"_blank">web<wbr>kitgtk_2.16.6.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.16.6.bb" rel=
=3D"noreferrer" target=3D"_blank">web<wbr>kitgtk_2.16.6.bb</a><br>
@@ -98,7 +98,7 @@ SECURITY_CFLAGS_append_aarch64 =3D &quot; -fPIE&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/webkit2gtk-4.0/<wbr>injected-bundle/=
<wbr>libwebkit2gtkinjectedbundle.<wbr>so&quot;<br>
<br>
-RRECOMMENDS_${PN} +=3D &quot;ca-certificates&quot;<br>
+RRECOMMENDS_${PN} +=3D &quot;ca-certificates shared-mime-info&quot;</block=
quote><div><br></div><div>This isn&#39;t wrong , I&#39;ll just add some con=
text.</div><div><br></div><div>If/when my gdk-pixbuf patch from three days =
ago lands gdk-pixbuf will always rdepend on shared-mime-info (and webkitgtk=
 probably can&#39;t be installed without gdk-pixbuf) so the problem would d=
isappear anyway. This just a happy accident so this patch still seems valid=
.</div><div><br></div><div>There&#39;s also=C2=A0<a href=3D"https://bugzill=
a.yoctoproject.org/show_bug.cgi?id=3D11792">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D11792</a> about whether glib should bring in shared-mi=
me-info so GIO file sniffing wouldn&#39;t be broken (the database is 3.6MB =
which is not a big number in a webkit context but can be for others).</div>=
<div><br></div><div>Jussi</div></div></div></div>

--001a114fcd24f51411055701612d--

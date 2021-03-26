Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.12825.1616767448693725712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 07:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tux8FxVS;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id h10so6404441edt.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qt5MLJPNaU2iXcaBjq+SdnBtKxi4DzFQxMGJ/Dah9Fk=;
        b=Tux8FxVSQsIrVxdX6IrT8mzQJZKLgw910qbGIVnAfg0gcWehpsmsGS0S/ELvvv7bun
         xMuOcbSnabMMYlgB2P484dcW4q/pLLh7Qix+MjLYWSgL0Qf2QEbkKHq85tfkqPh9G+Ca
         8LtD7wX+kYVQUBJ05hOdvysC5qP/3t8SZb5o+EN5EL5LQMpDzjmUBx5awYzAumD+ADNk
         ndWdX4bXHyu4wUsEGZsV+ouGNp5WHx9UStjUNj07FZfGaEzo5YonqHZY+JCHWvkEUPsz
         JpwMeraLoSf/CUvHtST86f6pRx/doQQVqP8u4iQzLsoQ/hz0Vw76gBWPRRkSsw3hdxKh
         71CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qt5MLJPNaU2iXcaBjq+SdnBtKxi4DzFQxMGJ/Dah9Fk=;
        b=X/szjs46o5lopc4mfRvnDNUrc317/lml316zZtt5LeeB5y/Icv2zX+0ll7B9In+xAG
         iOLmWFV8JmttOgmD+ZkcuSJgZ/rl0jGExTBe265c2SCn6WaXqlrlsq912h9YY7bdGx2a
         adYrboV3+NmTbsscREmEp6N7vnii3WRiqbbZDUit+horyd4jhDtlaTBS+ZcMfRJnms80
         RoQHr4nWWacgrbOo+k30wCcwRK6/fOl8cMMtyp9J8I1HrZs9B6WuuP9/B6JJ3o1jrQL+
         23ZirpN/CcoORUZEu/IUVejZhrx/XcwViAU/sZwZP3J+dog95CmOr899jkGpPszFdUTI
         4egQ==
X-Gm-Message-State: AOAM530QqRuRdqYj8guLxWJB9JhhX7XjJLYNxYQggikrjOo2c+XBw2ns
	1hqk5mCB1LW1gU22OFCzIl8CP0zLOQKP5WC8Cg8=
X-Google-Smtp-Source: ABdhPJw8P8A0RAbfNSMA6a/OeeXQZIYcOUrSG3Yu30O3hqvlgD6GxmUWCLjEM8V7LwrWYNb9eBzCWYQDMR95T1QQHTo=
X-Received: by 2002:aa7:cf95:: with SMTP id z21mr15039735edx.76.1616767446977;
 Fri, 26 Mar 2021 07:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <1616766364-22994-1-git-send-email-purushottam.choudhary@kpit.com>
In-Reply-To: <1616766364-22994-1-git-send-email-purushottam.choudhary@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 26 Mar 2021 15:03:55 +0100
Message-ID: <CA+chaQdC0qqPSzJNo8TRXXmfWmDWmV3BxxmMPnwQPfdzWZUsfA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] buildhistory.bbclass: store MAINTAINER variable
To: Purushottam choudhary <purushottam.choudhary@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000005c8dee05be71012f"

--0000000000005c8dee05be71012f
Content-Type: text/plain; charset="UTF-8"

This change isn't in master nor gatesgarth.

On Fri, Mar 26, 2021 at 2:46 PM Purushottam choudhary <
purushottam.choudhary@kpit.com> wrote:

> The maintainer declaration in the buildhistory
> is useful for tracking the maintainer of recipes.
> This change adds the MAINTAINER variable for
> recipes and packages to its buildhistory data.
>
> Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 8a1359a..04fac82 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -109,6 +109,7 @@ python buildhistory_emit_pkghistory() {
>              self.pe = "0"
>              self.pv = "0"
>              self.pr = "r0"
> +            self.maintainer = ""
>              self.depends = ""
>              self.packages = ""
>              self.srcrev = ""
> @@ -126,6 +127,7 @@ python buildhistory_emit_pkghistory() {
>              self.pkge = ""
>              self.pkgv = ""
>              self.pkgr = ""
> +            self.maintainer = ""
>              self.size = 0
>              self.depends = ""
>              self.rprovides = ""
> @@ -162,6 +164,8 @@ python buildhistory_emit_pkghistory() {
>                      pkginfo.pkgv = value
>                  elif name == "PKGR":
>                      pkginfo.pkgr = value
> +                elif name == "MAINTAINER":
> +                    pkginfo.maintainer = value
>                  elif name == "RPROVIDES":
>                      pkginfo.rprovides = value
>                  elif name == "RDEPENDS":
> @@ -215,6 +219,7 @@ python buildhistory_emit_pkghistory() {
>      pr = d.getVar('PR')
>      layer = bb.utils.get_file_layer(d.getVar('FILE'), d)
>
> +    maintainer = d.getVar('MAINTAINER') or ''
>      pkgdata_dir = d.getVar('PKGDATA_DIR')
>      packages = ""
>      try:
> @@ -251,6 +256,7 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.pe = pe
>      rcpinfo.pv = pv
>      rcpinfo.pr = pr
> +    rcpinfo.maintainer = maintainer
>      rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS')
> or ""))
>      rcpinfo.packages = packages
>      rcpinfo.layer = layer
> @@ -270,6 +276,7 @@ python buildhistory_emit_pkghistory() {
>          pkge = pkgdata.get('PKGE', '0')
>          pkgv = pkgdata['PKGV']
>          pkgr = pkgdata['PKGR']
> +        pkg_maintainer = d.getVar('MAINTAINER_%s' % (pkg,), True) or
> maintainer
>          #
>          # Find out what the last version was
>          # Make sure the version did not decrease
> @@ -293,6 +300,7 @@ python buildhistory_emit_pkghistory() {
>          pkginfo.pkge = pkge
>          pkginfo.pkgv = pkgv
>          pkginfo.pkgr = pkgr
> +        pkginfo.maintainer = pkg_maintainer
>          pkginfo.rprovides =
> sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
>          pkginfo.rdepends =
> sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
>          pkginfo.rrecommends =
> sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
> @@ -368,6 +376,7 @@ def write_recipehistory(rcpinfo, d):
>          f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
>          f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
>          f.write(u"LAYER = %s\n" %  rcpinfo.layer)
> +        f.write(u"MAINTAINER = %s\n" % rcpinfo.maintainer)
>
>      write_latest_srcrev(d, pkghistdir)
>
> @@ -386,6 +395,7 @@ def write_pkghistory(pkginfo, d):
>              f.write(u"PE = %s\n" %  pkginfo.pe)
>          f.write(u"PV = %s\n" %  pkginfo.pv)
>          f.write(u"PR = %s\n" %  pkginfo.pr)
> +        f.write(u"MAINTAINER = %s\n" % pkginfo.maintainer)
>
>          if pkginfo.pkg != pkginfo.name:
>              f.write(u"PKG = %s\n" % pkginfo.pkg)
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> 
>
>

--0000000000005c8dee05be71012f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This change isn&#39;t in master nor gatesgarth.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar=
 26, 2021 at 2:46 PM Purushottam choudhary &lt;<a href=3D"mailto:purushotta=
m.choudhary@kpit.com">purushottam.choudhary@kpit.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The maintainer declarat=
ion in the buildhistory<br>
is useful for tracking the maintainer of recipes.<br>
This change adds the MAINTAINER variable for<br>
recipes and packages to its buildhistory data.<br>
<br>
Signed-off-by: Purushottam Choudhary &lt;<a href=3D"mailto:purushottam.cho=
udhary@kpit.com" target=3D"_blank">purushottam.choudhary@kpit.com</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/buildhistory.bbclass | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory=
.bbclass<br>
index 8a1359a..04fac82 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -109,6 +109,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.pe"=
 rel=3D"noreferrer" target=3D"_blank">self.pe</a> =3D &quot;0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pv =3D &quot;0&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://self.pr"=
 rel=3D"noreferrer" target=3D"_blank">self.pr</a> =3D &quot;r0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.maintainer =3D &quot;&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.depends =3D &quot;&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.packages =3D &quot;&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.srcrev =3D &quot;&quo=
t;<br>
@@ -126,6 +127,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pkge =3D &quot;&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pkgv =3D &quot;&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pkgr =3D &quot;&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.maintainer =3D &quot;&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.size =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.depends =3D &quot;&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rprovides =3D &quot;&=
quot;<br>
@@ -162,6 +164,8 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pkginfo.pkgv =3D value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif name =
=3D=3D &quot;PKGR&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pkginfo.pkgr =3D value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif name =3D=3D =
&quot;MAINTAINER&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg=
info.maintainer =3D value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif name =
=3D=3D &quot;RPROVIDES&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pkginfo.rprovides =3D value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif name =
=3D=3D &quot;RDEPENDS&quot;:<br>
@@ -215,6 +219,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0pr =3D d.getVar(&#39;PR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0layer =3D bb.utils.get_file_layer(d.getVar(&#39;FILE&#=
39;), d)<br>
<br>
+=C2=A0 =C2=A0 maintainer =3D d.getVar(&#39;MAINTAINER&#39;) or &#39;&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0pkgdata_dir =3D d.getVar(&#39;PKGDATA_DIR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0packages =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
@@ -251,6 +256,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://rcpinfo.pe" rel=3D"noreferrer" targe=
t=3D"_blank">rcpinfo.pe</a> =3D pe<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.pv =3D pv<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://rcpinfo.pr" rel=3D"noreferrer" targe=
t=3D"_blank">rcpinfo.pr</a> =3D pr<br>
+=C2=A0 =C2=A0 rcpinfo.maintainer =3D maintainer<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.g=
etVar(&#39;DEPENDS&#39;) or &quot;&quot;))<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.packages =3D packages<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.layer =3D layer<br>
@@ -270,6 +276,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkge =3D pkgdata.get(&#39;PKGE&#39;, &#3=
9;0&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgv =3D pkgdata[&#39;PKGV&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgr =3D pkgdata[&#39;PKGR&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_maintainer =3D d.getVar(&#39;MAINTAINER_%=
s&#39; % (pkg,), True) or maintainer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Find out what the last version was<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure the version did not decrease=
<br>
@@ -293,6 +300,7 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.pkge =3D pkge<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.pkgv =3D pkgv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.pkgr =3D pkgr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkginfo.maintainer =3D pkg_maintainer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.rprovides =3D sortpkglist(oe.uti=
ls.squashspaces(pkgdata.get(&#39;RPROVIDES&#39;, &quot;&quot;)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.rdepends =3D sortpkglist(oe.util=
s.squashspaces(pkgdata.get(&#39;RDEPENDS&#39;, &quot;&quot;)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.rrecommends =3D sortpkglist(oe.u=
tils.squashspaces(pkgdata.get(&#39;RRECOMMENDS&#39;, &quot;&quot;)))<br>
@@ -368,6 +376,7 @@ def write_recipehistory(rcpinfo, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;DEPENDS =3D %s\n&quot; %=
=C2=A0 rcpinfo.depends)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;PACKAGES =3D %s\n&quot; %=
=
=C2=A0 rcpinfo.packages)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;LAYER =3D %s\n&quot; %=C2=
=
=A0 rcpinfo.layer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;MAINTAINER =3D %s\n&quot; % rc=
pinfo.maintainer)<br>
<br>
=C2=A0 =C2=A0 =C2=A0write_latest_srcrev(d, pkghistdir)<br>
<br>
@@ -386,6 +395,7 @@ def write_pkghistory(pkginfo, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;PE =3D %s\n=
&quot; %=C2=A0 <a href=3D"http://pkginfo.pe" rel=3D"noreferrer" target=3D"_=
blank">pkginfo.pe</a>)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;PV =3D %s\n&quot; %=C2=A0=
 pkginfo.pv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;PR =3D %s\n&quot; %=C2=A0=
 <a href=3D"http://pkginfo.pr" rel=3D"noreferrer" target=3D"_blank">pkginfo=
.pr</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;MAINTAINER =3D %s\n&quot; % pk=
ginfo.maintainer)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkginfo.pkg !=3D <a href=3D"http://pk=
ginfo.name" rel=3D"noreferrer" target=3D"_blank">pkginfo.name</a>:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(u&quot;PKG =3D %s\=
n&quot; % pkginfo.pkg)<br>
--<br>
2.7.4<br>
<br>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005c8dee05be71012f--

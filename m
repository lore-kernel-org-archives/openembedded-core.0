Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6326C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 12:57:49 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.10614.1639400268418959874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4ekefsi;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id r15so29007561uao.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gr8rKX56Pa4UY3kJUj6KqEHJeQZBPM/YfQZoFn1gDYQ=;
        b=R4ekefsi26Pg0JiblP6f038t2vR6oJdBuaZFS5emBb1EVLE79ptTd07yYtfhdNK5Si
         B/XsFC992N6ECITYFeiyZGZRwHdNFrpxe4rnTbOza76B6RRYVImIe0oj6imSKJdrTZQA
         QAkVP66DVud2Do22aVKAtE8Wmy5tcYQNbYC26ajj5Zdxj+BI5BN576fWMLZxXUyTH4nC
         mbxKd8KACnB+QnNzRSPLTynpFwbriW4e0tZ+yAJIN6MsIatbaEKWK6c0qT/mp0NtMHBJ
         qs/MnYXpy7862LwFNBRYQPLh8htCFKl+issZ/IdwqFOvwi5PfbHAd0wWX71VL/ZGJEUo
         LExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gr8rKX56Pa4UY3kJUj6KqEHJeQZBPM/YfQZoFn1gDYQ=;
        b=yseZYPO5czVDlXpjeokrhkTxtc80Cj5UjJT9hqHcpV0VQ+KZcGj6hGAjmkIACnM85o
         GaQ0jyZ0nPQqOhrfGE13CQWykTMZJ1Our+9YMKZF4PzLcNG2UnSmFhjURIj9mIjNFIXy
         CpN5qI3xnCbSIwLpiBvMNxBb0HpJZ44ZOxeKGuhVzJ5y8Kq+ta4bdC0hLIsjLxIbzTmR
         domVNmwfgEed4KrEQ2KxIkTiKcgFNmtUMXHpRGYElZcHA3FgyX1l8gbZvhCT72JhMky+
         b/VxzcxnGkBSn/QQbyBw57B27KBYjTfGlVfOpTKjyANDW9fxv1niY9yu77HqTboR2uSk
         ZbtA==
X-Gm-Message-State: AOAM533JrXSETeq+blRmv7SMQN9OECeG42Vnx3+ndz9iV2N7d5pQZTo6
	BgO9Mz4SLHl9EEMlJdv9Lpz8fS20WymNRrbFMJE=
X-Google-Smtp-Source: 
 ABdhPJxWE7lDb29cXjF+W3lYNL8M4UFV0Vd/amTuCwCmtqHkOtpuhg3avrwc4FgKzTPLpcqYBh44ZZOslJBgJXtvRKQ=
X-Received: by 2002:a67:efd5:: with SMTP id s21mr27576308vsp.73.1639400267463;
 Mon, 13 Dec 2021 04:57:47 -0800 (PST)
MIME-Version: 1.0
References: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Dec 2021 13:57:36 +0100
Message-ID: 
 <CANNYZj_Kr9ziC4TLcgTZ_cGzaFy1-6uDD_V0geAEJnt1p7cEWg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] recipetool: Separate licenses with &
 operator
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000963eb705d3069ef9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 12:57:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159622

--000000000000963eb705d3069ef9
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Dec 2021 at 13:38, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Separate licenses with & operator since it should be satisfied most use
> cases and it is a reasonable assumption that all the licenses apply.
> Furthermore flat, split and sort the licenses to minimize license string
> changes.
>

I think this is better explained with an example. What did not work before,
and what works with this change?

Alex



>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/lib/oeqa/selftest/cases/recipetool.py |  4 +--
>  scripts/lib/recipetool/create.py           | 39 +++++++++++++++++-----
>  2 files changed, 32 insertions(+), 11 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py
> b/meta/lib/oeqa/selftest/cases/recipetool.py
> index 439e41597c..95e4753976 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -426,7 +426,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars = {}
>          checkvars['SUMMARY'] = 'Node Server Example'
>          checkvars['HOMEPAGE'] = '
> https://github.com/savoirfairelinux/node-server-example#readme'
> -        checkvars['LICENSE'] = set(['MIT', 'ISC', 'Unknown'])
> +        checkvars['LICENSE'] = 'BSD-3-Clause & ISC & MIT & Unknown'
>          urls = []
>          urls.append('npm://
> registry.npmjs.org/;package=@savoirfairelinux/node-server-example;version=${PV}
> <http://registry.npmjs.org/;package=@savoirfairelinux/node-server-example;version=$%7BPV%7D>
> ')
>          urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
> @@ -483,7 +483,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          result = runCmd('recipetool create -o %s %s' % (temprecipe,
> srcuri))
>          self.assertTrue(os.path.isfile(recipefile))
>          checkvars = {}
> -        checkvars['LICENSE'] = set(['PSF', '&', 'BSD-3-Clause', 'GPL'])
> +        checkvars['LICENSE'] = 'BSD-3-Clause & GPL & PSF'
>          checkvars['LIC_FILES_CHKSUM'] =
> 'file://COPYING.txt;md5=35a23d42b615470583563132872c97d6'
>          checkvars['SRC_URI'] = '
> https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-${PV}.tar.gz
> '
>          checkvars['SRC_URI[md5sum]'] = 'c53768d63db3873b7d452833553469de'
> diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py
> index 406c97f1c5..8e8a621b4f 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -919,6 +919,22 @@ def split_value(value):
>      else:
>          return value
>
> +def fixup_license(value):
> +    # Ensure licenses with OR starts and ends with brackets
> +    if '|' in value:
> +        return '(' + value + ')'
> +    return value
> +
> +def tidy_licenses(value):
> +    """Flat, split and sort licenses"""
> +    from oe.license import flattened_licenses
> +    def _choose(a, b):
> +        str_a, str_b  = sorted((" & ".join(a), " & ".join(b)),
> key=str.casefold)
> +        return ["(%s | %s)" % (str_a, str_b)]
> +    if not isinstance(value, str):
> +        value = " & ".join(value)
> +    return sorted(list(set(flattened_licenses(value, _choose))),
> key=str.casefold)
> +
>  def handle_license_vars(srctree, lines_before, handled, extravalues, d):
>      lichandled = [x for x in handled if x[0] == 'license']
>      if lichandled:
> @@ -932,10 +948,13 @@ def handle_license_vars(srctree, lines_before,
> handled, extravalues, d):
>      lines = []
>      if licvalues:
>          for licvalue in licvalues:
> -            if not licvalue[0] in licenses:
> -                licenses.append(licvalue[0])
> +            license = licvalue[0]
> +            lics = tidy_licenses(fixup_license(license))
> +            lics = [lic for lic in lics if lic not in licenses]
> +            if len(lics):
> +                licenses.extend(lics)
>              lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1],
> licvalue[2]))
> -            if licvalue[0] == 'Unknown':
> +            if license == 'Unknown':
>                  lic_unknown.append(licvalue[1])
>          if lic_unknown:
>              lines.append('#')
> @@ -944,9 +963,7 @@ def handle_license_vars(srctree, lines_before,
> handled, extravalues, d):
>              for licfile in lic_unknown:
>                  lines.append('#   %s' % licfile)
>
> -    extra_license = split_value(extravalues.pop('LICENSE', []))
> -    if '&' in extra_license:
> -        extra_license.remove('&')
> +    extra_license = tidy_licenses(extravalues.pop('LICENSE', ''))
>      if extra_license:
>          if licenses == ['Unknown']:
>              licenses = extra_license
> @@ -987,7 +1004,7 @@ def handle_license_vars(srctree, lines_before,
> handled, extravalues, d):
>          lines.append('# instead of &. If there is any doubt, check the
> accompanying documentation')
>          lines.append('# to determine which situation is applicable.')
>
> -    lines.append('LICENSE = "%s"' % ' & '.join(licenses))
> +    lines.append('LICENSE = "%s"' % ' & '.join(sorted(licenses,
> key=str.casefold)))
>      lines.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n
> '.join(lic_files_chksum))
>      lines.append('')
>
> @@ -1226,6 +1243,7 @@ def split_pkg_licenses(licvalues, packages,
> outlines, fallback_licenses=[], pn='
>      """
>      pkglicenses = {pn: []}
>      for license, licpath, _ in licvalues:
> +        license = fixup_license(license)
>          for pkgname, pkgpath in packages.items():
>              if licpath.startswith(pkgpath + '/'):
>                  if pkgname in pkglicenses:
> @@ -1238,11 +1256,14 @@ def split_pkg_licenses(licvalues, packages,
> outlines, fallback_licenses=[], pn='
>              pkglicenses[pn].append(license)
>      outlicenses = {}
>      for pkgname in packages:
> -        license = ' '.join(list(set(pkglicenses.get(pkgname,
> ['Unknown'])))) or 'Unknown'
> +        # Assume AND operator between license files
> +        license = ' & '.join(list(set(pkglicenses.get(pkgname,
> ['Unknown'])))) or 'Unknown'
>          if license == 'Unknown' and pkgname in fallback_licenses:
>              license = fallback_licenses[pkgname]
> +        licenses = tidy_licenses(license)
> +        license = ' & '.join(licenses)
>          outlines.append('LICENSE:%s = "%s"' % (pkgname, license))
> -        outlicenses[pkgname] = license.split()
> +        outlicenses[pkgname] = licenses
>      return outlicenses
>
>  def read_pkgconfig_provides(d):
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159619):
> https://lists.openembedded.org/g/openembedded-core/message/159619
> Mute This Topic: https://lists.openembedded.org/mt/87696347/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000963eb705d3069ef9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 13 Dec 2021 at 13:38, Stefan Herbrechtsmeier &lt;<a href=3D"=
mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-o=
ss@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan=
.herbrechtsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@=
weidmueller.com</a>&gt;<br>
<br>
Separate licenses with &amp; operator since it should be satisfied most use=
<br>
cases and it is a reasonable assumption that all the licenses apply.<br>
Furthermore flat, split and sort the licenses to minimize license string<br=
>
changes.<br></blockquote><div><br></div><div>I think this is better explain=
ed with an example. What did not work before, and what works with this chan=
ge?</div><div><br></div><div>Alex<br></div><div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/lib/oeqa/selftest/cases/recipetool.py |=C2=A0 4 +--<br>
=C2=A0scripts/lib/recipetool/create.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 39 +++++++++++++++++-----<br>
=C2=A02 files changed, 32 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py<br>
index 439e41597c..95e4753976 100644<br>
--- a/meta/lib/oeqa/selftest/cases/recipetool.py<br>
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py<br>
@@ -426,7 +426,7 @@ class RecipetoolCreateTests(RecipetoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SUMMARY&#39;] =3D &#39;Nod=
e Server Example&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;HOMEPAGE&#39;] =3D &#39;<a=
 href=3D"https://github.com/savoirfairelinux/node-server-example#readme" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/savoirfairelinux/node=
-server-example#readme</a>&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;LICENSE&#39;] =3D set([&#39;MIT=
&#39;, &#39;ISC&#39;, &#39;Unknown&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;LICENSE&#39;] =3D &#39;BSD-3-Cl=
ause &amp; ISC &amp; MIT &amp; Unknown&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urls =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urls.append(&#39;npm://<a href=3D"http://=
registry.npmjs.org/;package=3D@savoirfairelinux/node-server-example;version=
=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">registry.npmjs.org/;pack=
age=3D@savoirfairelinux/node-server-example;version=3D${PV}</a>&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urls.append(&#39;npmsw://${THISDIR}/${BPN=
}/npm-shrinkwrap.json&#39;)<br>
@@ -483,7 +483,7 @@ class RecipetoolCreateTests(RecipetoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;recipetool create =
-o %s %s&#39; % (temprecipe, srcuri))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(os.path.isfile(recipefile=
))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars =3D {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;LICENSE&#39;] =3D set([&#39;PSF=
&#39;, &#39;&amp;&#39;, &#39;BSD-3-Clause&#39;, &#39;GPL&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;LICENSE&#39;] =3D &#39;BSD-3-Cl=
ause &amp; GPL &amp; PSF&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;LIC_FILES_CHKSUM&#39;] =3D=
 &#39;file://COPYING.txt;md5=3D35a23d42b615470583563132872c97d6&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRC_URI&#39;] =3D &#39;<a =
href=3D"https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbade=
cc9381d11dea0fa34e4759b4071244fa094804c/docutils-$%7BPV%7D.tar.gz" rel=3D"n=
oreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/84/f4/=
5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-${PV}=
.tar.gz</a>&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRC_URI[md5sum]&#39;] =3D =
&#39;c53768d63db3873b7d452833553469de&#39;<br>
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py<br>
index 406c97f1c5..8e8a621b4f 100644<br>
--- a/scripts/lib/recipetool/create.py<br>
+++ b/scripts/lib/recipetool/create.py<br>
@@ -919,6 +919,22 @@ def split_value(value):<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return value<br>
<br>
+def fixup_license(value):<br>
+=C2=A0 =C2=A0 # Ensure licenses with OR starts and ends with brackets<br>
+=C2=A0 =C2=A0 if &#39;|&#39; in value:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;(&#39; + value + &#39;)&#39;<br>
+=C2=A0 =C2=A0 return value<br>
+<br>
+def tidy_licenses(value):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Flat, split and sort licenses&quot;&quot;&=
quot;<br>
+=C2=A0 =C2=A0 from oe.license import flattened_licenses<br>
+=C2=A0 =C2=A0 def _choose(a, b):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 str_a, str_b=C2=A0 =3D sorted((&quot; &amp; &q=
uot;.join(a), &quot; &amp; &quot;.join(b)), key=3Dstr.casefold)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [&quot;(%s | %s)&quot; % (str_a, str_b)=
]<br>
+=C2=A0 =C2=A0 if not isinstance(value, str):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D &quot; &amp; &quot;.join(value)<br>
+=C2=A0 =C2=A0 return sorted(list(set(flattened_licenses(value, _choose))),=
 key=3Dstr.casefold)<br>
+<br>
=C2=A0def handle_license_vars(srctree, lines_before, handled, extravalues, =
d):<br>
=C2=A0 =C2=A0 =C2=A0lichandled =3D [x for x in handled if x[0] =3D=3D &#39;=
license&#39;]<br>
=C2=A0 =C2=A0 =C2=A0if lichandled:<br>
@@ -932,10 +948,13 @@ def handle_license_vars(srctree, lines_before, handle=
d, extravalues, d):<br>
=C2=A0 =C2=A0 =C2=A0lines =3D []<br>
=C2=A0 =C2=A0 =C2=A0if licvalues:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for licvalue in licvalues:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not licvalue[0] in licenses:<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses.append(li=
cvalue[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 license =3D licvalue[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lics =3D tidy_licenses(fixup_lic=
ense(license))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lics =3D [lic for lic in lics if=
 lic not in licenses]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(lics):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses.extend(li=
cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lic_files_chksum.append(&#3=
9;file://%s;md5=3D%s&#39; % (licvalue[1], licvalue[2]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if licvalue[0] =3D=3D &#39;Unkno=
wn&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if license =3D=3D &#39;Unknown&#=
39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lic_unknown.a=
ppend(licvalue[1])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if lic_unknown:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines.append(&#39;#&#39;)<b=
r>
@@ -944,9 +963,7 @@ def handle_license_vars(srctree, lines_before, handled,=
 extravalues, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for licfile in lic_unknown:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines.append(=
&#39;#=C2=A0 =C2=A0%s&#39; % licfile)<br>
<br>
-=C2=A0 =C2=A0 extra_license =3D split_value(extravalues.pop(&#39;LICENSE&#=
39;, []))<br>
-=C2=A0 =C2=A0 if &#39;&amp;&#39; in extra_license:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_license.remove(&#39;&amp;&#39;)<br>
+=C2=A0 =C2=A0 extra_license =3D tidy_licenses(extravalues.pop(&#39;LICENSE=
&#39;, &#39;&#39;))<br>
=C2=A0 =C2=A0 =C2=A0if extra_license:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if licenses =3D=3D [&#39;Unknown&#39;]:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0licenses =3D extra_license<=
br>
@@ -987,7 +1004,7 @@ def handle_license_vars(srctree, lines_before, handled=
, extravalues, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines.append(&#39;# instead of &amp;. If =
there is any doubt, check the accompanying documentation&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines.append(&#39;# to determine which si=
tuation is applicable.&#39;)<br>
<br>
-=C2=A0 =C2=A0 lines.append(&#39;LICENSE =3D &quot;%s&quot;&#39; % &#39; &a=
mp; &#39;.join(licenses))<br>
+=C2=A0 =C2=A0 lines.append(&#39;LICENSE =3D &quot;%s&quot;&#39; % &#39; &a=
mp; &#39;.join(sorted(licenses, key=3Dstr.casefold)))<br>
=C2=A0 =C2=A0 =C2=A0lines.append(&#39;LIC_FILES_CHKSUM =3D &quot;%s&quot;&#=
39; % &#39; \\\n=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;.join(lic_files_chksum))<br>
=C2=A0 =C2=A0 =C2=A0lines.append(&#39;&#39;)<br>
<br>
@@ -1226,6 +1243,7 @@ def split_pkg_licenses(licvalues, packages, outlines,=
 fallback_licenses=3D[], pn=3D&#39;<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0pkglicenses =3D {pn: []}<br>
=C2=A0 =C2=A0 =C2=A0for license, licpath, _ in licvalues:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 license =3D fixup_license(license)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkgname, pkgpath in packages.items():=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if licpath.startswith(pkgpa=
th + &#39;/&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkgname in=
 pkglicenses:<br>
@@ -1238,11 +1256,14 @@ def split_pkg_licenses(licvalues, packages, outline=
s, fallback_licenses=3D[], pn=3D&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkglicenses[pn].append(lice=
nse)<br>
=C2=A0 =C2=A0 =C2=A0outlicenses =3D {}<br>
=C2=A0 =C2=A0 =C2=A0for pkgname in packages:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 license =3D &#39; &#39;.join(list(set(pkglicen=
ses.get(pkgname, [&#39;Unknown&#39;])))) or &#39;Unknown&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Assume AND operator between license files<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 license =3D &#39; &amp; &#39;.join(list(set(pk=
glicenses.get(pkgname, [&#39;Unknown&#39;])))) or &#39;Unknown&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if license =3D=3D &#39;Unknown&#39; and p=
kgname in fallback_licenses:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0license =3D fallback_licens=
es[pkgname]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses =3D tidy_licenses(license)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 license =3D &#39; &amp; &#39;.join(licenses)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outlines.append(&#39;LICENSE:%s =3D &quot=
;%s&quot;&#39; % (pkgname, license))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 outlicenses[pkgname] =3D license.split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 outlicenses[pkgname] =3D licenses<br>
=C2=A0 =C2=A0 =C2=A0return outlicenses<br>
<br>
=C2=A0def read_pkgconfig_provides(d):<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159619): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159619" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159619</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87696347/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87696347/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000963eb705d3069ef9--


Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id AB8A46FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 10:38:30 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f34so1482449ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 02:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=84PsAxhbI1L91YRBgi1H0vkqQrliQGk8/qL4QhslW6M=;
	b=Y6FEIxCNGDwPnK9UemFowTh8Vo2rGY3BJMR85JXMHuwU7tGGdPLSgTiiV3iM5JG/RQ
	hNVdsGXDSiLPGmvP7REnLBYyQJdHbBD8RCCcsUHckcv4MY4+4sC0OTseW1amN5F30Qyq
	AnIcAyD9nSVxX93/ubYihJwmh/8Xg63AgDKJaR8pMOXLrSAqGelRuu6fIzNsY95LisbQ
	nNZRnLSqiGq5ZCGkkT/HfSXDwenk/dr6STC2oJk6NSSF3jo8051LztBOPWxSIlrL7tgU
	jWBpuhvJJ8TE+jCMHoDS9cRCFF2r+OGUQy55o13wTfJvSOT/oEtCGWe1vor/AmLTmyHJ
	sIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=84PsAxhbI1L91YRBgi1H0vkqQrliQGk8/qL4QhslW6M=;
	b=uHNhaImofyMwmt41Z6y/mWbo1K51+AXMU/dqsLw4H6veURyGK3Njk26/f48MjQHXCp
	GV1vn99U6Ij82qKDriEuf/FGzYYs20RsJNHVzDLrWLelCyguR48HXKIv5ppCnvm7DohR
	3GZ+zNYMqb+2SitHNde3iGRu+ZZr9iBtmC/mfwpy9qqOkd6hPRKRBEZkl7Uh4QtoH6/O
	yagwF46HEhZX9SiBjm7C+uchSWPWwZRpu7I33dxpRDWB5wPzF+IMRga198bEsKQWD5CH
	wmgMrhdvoc8N2TBqhZQFpETccftkfU2CjENRpqbl6j1gdoEYkEAyyjWUz0mTBmj6G96X
	eGRA==
X-Gm-Message-State: APf1xPDB8OkJ/umperp9b1EssjMSPxEj81ACKsl/EIiScIm5tCVr+iqz
	jRgPfP/cK/qLwZ4XIsImsDpCx4ENYBLQqqr5xO9qIw==
X-Google-Smtp-Source: AH8x227XbkjhgIyBlIDUoAemWAvfXawj9VSgpV6vqQrFRDNCqG3/svLw3pTRf8rpUEt36RwaQla8jOlo51xebKO4l9o=
X-Received: by 10.107.32.19 with SMTP id g19mr6817040iog.217.1517999911667;
	Wed, 07 Feb 2018 02:38:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 7 Feb 2018 02:38:11 -0800 (PST)
In-Reply-To: <1517967731-9068-1-git-send-email-juro.bystricky@intel.com>
References: <1517967731-9068-1-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Feb 2018 10:38:11 +0000
Message-ID: <CAJTo0LaP-MXNqCEdokSmvfaDMz2OYcupWJzzir=sYFriPBqxJA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-doc: improve reproducibility
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
X-List-Received-Date: Wed, 07 Feb 2018 10:38:30 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a48122da05649ce56b"

--001a1141a2a48122da05649ce56b
Content-Type: text/plain; charset="UTF-8"

A neater fix might be to drop the documentation change from the patch we're
applying, as it's unlikely that people will be reading the autoconf
documentation.

Ross

On 7 February 2018 at 01:42, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> autoconf-doc package contains autoconf.info.
> This file contains date when this file was created, i.e:
>
>      "This manual (31 January 2018) .."
>
> Therefore, two builds done on two different days will show different dates
> for
> otherwise identical files, hence breaking reproducibility.
> The date is obtained from mtime of "autoconf.texi", unfortunately we patch
> this
> file and change the mtime as a consequence.
> The date serves as a document version identifier, so preserving the
> original mtime of
> "autoconf.texi" would be misleading, as we actually did modify the
> document on purpose.
> The fix is to set the mtime of "autoconf.texi" based on SOURCE_DATE_EPOCH.
>
> [YOCTO #12524]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-devtools/autoconf/autoconf.inc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc
> b/meta/recipes-devtools/autoconf/autoconf.inc
> index df81bc6..f5156f7 100644
> --- a/meta/recipes-devtools/autoconf/autoconf.inc
> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> @@ -48,6 +48,15 @@ do_configure() {
>         oe_runconf
>  }
>
> +do_compile_prepend_class-target() {
> +       # mtime of autoconf.texi will end up as embedded date in
> autoconf.info.
> +       # We patch autoconf.texi, so that modifies mtime each time.
> +       # To ensure reproducibility, set the mtime to SOURCE_DATE_EPOCH
> +       if [ -n "${SOURCE_DATE_EPOCH}" ]; then
> +               touch -d @${SOURCE_DATE_EPOCH} ${S}/doc/autoconf.texi
> +       fi
> +}
> +
>  do_install_append() {
>      rm -rf ${D}${datadir}/emacs
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141a2a48122da05649ce56b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A neater fix might be to drop the documentation change fro=
m the patch we&#39;re applying, as it&#39;s unlikely that people will be re=
ading the autoconf documentation.<div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 February 2018 at 0=
1:42, Juro Bystricky <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky=
@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">autoconf-doc package contains <a href=
=3D"http://autoconf.info" rel=3D"noreferrer" target=3D"_blank">autoconf.inf=
o</a>.<br>
This file contains date when this file was created, i.e:<br>
<br>
=C2=A0 =C2=A0 =C2=A0&quot;This manual (31 January 2018) ..&quot;<br>
<br>
Therefore, two builds done on two different days will show different dates =
for<br>
otherwise identical files, hence breaking reproducibility.<br>
The date is obtained from mtime of &quot;autoconf.texi&quot;, unfortunately=
 we patch this<br>
file and change the mtime as a consequence.<br>
The date serves as a document version identifier, so preserving the origina=
l mtime of<br>
&quot;autoconf.texi&quot; would be misleading, as we actually did modify th=
e document on purpose.<br>
The fix is to set the mtime of &quot;autoconf.texi&quot; based on SOURCE_DA=
TE_EPOCH.<br>
<br>
[YOCTO #12524]<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>autoconf/autoconf.inc | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>autoconf/autoconf.inc b/meta/recipe=
s-devtools/<wbr>autoconf/autoconf.inc<br>
index df81bc6..f5156f7 100644<br>
--- a/meta/recipes-devtools/<wbr>autoconf/autoconf.inc<br>
+++ b/meta/recipes-devtools/<wbr>autoconf/autoconf.inc<br>
@@ -48,6 +48,15 @@ do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runconf<br>
=C2=A0}<br>
<br>
+do_compile_prepend_class-<wbr>target() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# mtime of autoconf.texi will end up as embedde=
d date in <a href=3D"http://autoconf.info" rel=3D"noreferrer" target=3D"_bl=
ank">autoconf.info</a>.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# We patch autoconf.texi, so that modifies mtim=
e each time.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# To ensure reproducibility, set the mtime to S=
OURCE_DATE_EPOCH<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${SOURCE_DATE_EPOCH}&quot; ]; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch -d @${SOURCE_=
DATE_EPOCH} ${S}/doc/autoconf.texi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${D}${datadir}/emacs<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141a2a48122da05649ce56b--

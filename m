Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.5021.1617137192474324952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 13:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=opoYI3Kw;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ap14so13658144ejc.0;
        Tue, 30 Mar 2021 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jTKmcjfpKjq6ylDuFsfAQx1tXw0ESjlbJmjRdfBVW+U=;
        b=opoYI3KwT7rkn++TugG2W3GB2ExT8euWbB1PY7KFIhp3wWIYRbAeq/0Ajiu/TogTec
         Jz1Xkx8X9z9pYB09wKy6htqzfMiT2jsaRLX3xalgvffsvxrGDViYlP55/tbRY9KHBkzf
         OQ/p01UrwRul5de5dGZwry0ZC6Ene6iIAIjlLdBDmvDTCSGFNlrgpjc0EbILyluIV+RY
         i+7H5Zpgy/mUzRkxkxI4VTR5ANZMd5UWu0B/PvKv2yddcmeueowVVn4Mq2ZuAOlzu1ei
         TVpQXPVdJcjUOGEPqDYviCJsreMuQMvDSlV/YSnrQ8i4wqdSLaDWkeIQcbWSqnGYGyDp
         zaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jTKmcjfpKjq6ylDuFsfAQx1tXw0ESjlbJmjRdfBVW+U=;
        b=gbGusYAxBWK1XMSQp2m/6Vx584YEJdmKkt3fZXRUvNStjOSEiJMmkuMsw91c9lYeGe
         kEekhnxSkPFc9DWGhXryWRoAadQmXJtk0umMHfT/Ig6gbGX2VDiD2Jlp6j+F14l8DYX3
         ZRqCdaf2rQpM+8yXQAA+g4tnh5+2PU6HImYOjydiv9AWeYOGWQyqU99zOZEgnAONKl/i
         lGEFgetBH5lVGsP3/oDX61exM3z1nj0Xdr8G9R8mJ3R7XHYGO9e65Ne+/a3raOnZfnVS
         EYv7XoVVRSDpiBsm2OIofKgfzoVgDyy1inpCbtBz7m+YFnEviz9ZNq7dn670oh7ijpDm
         QBwg==
X-Gm-Message-State: AOAM532DUwwr3hAbuI7ZhqWhv5qU3FWQXTT5X0Ot5wtZcOuxg7OXIKlp
	gK6ljY11qIMbTgf/ZHg932ibp7ByNKWCOQnt+wl9GPlCbwo=
X-Google-Smtp-Source: ABdhPJzzPEt6KDKEnVFVx3g5vyzBCXduJpbnodkpdbOLlcUqZGQpKOVY07OdrRJmhrtWgte+5l2FtvVVIFyRpNZij5M=
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr35435698ejo.471.1617137190790;
 Tue, 30 Mar 2021 13:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <158021229287.2205.655529513378933058@git.openembedded.org> <20200128115135.923C8232CB0@git.openembedded.org>
In-Reply-To: <20200128115135.923C8232CB0@git.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 30 Mar 2021 22:46:19 +0200
Message-ID: <CA+chaQeLKzCdXyhPOoZJVxjWS7HG0kOwg3nt90xsJLz8Ov2VxA@mail.gmail.com>
Subject: Re: [oe-commits] [openembedded-core] 05/11: license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-commits@lists.openembedded.org, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf6bd405bec71781"

--000000000000cf6bd405bec71781
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 12:52 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch zeus
> in repository openembedded-core.
>
> commit 5ed714139f91eb03871e01b68a4370784071234d
> Author: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> AuthorDate: Wed Dec 11 17:48:13 2019 +0100
>
>     license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
>
>     Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented
>     variable that contained a static list of licenses. It was used by
>     expand_wildcard_licenses() to expand any wildcards used in, e.g.,
>     INCOMPATIBLE_LICENSE. However, since this static list of licenses has
>     not been kept up-to-date, many licenses were missing, with the result
>     that if one tried to use any of those licenses with a wildcard, no
>     licenses would be found, effectively ignoring that they should be
>     marked as incompatible.
>
>     This introduces a new (documented) variable, AVAILABLE_LICENSES, that
>     is automatically updated to contain all licenses found in any
>     directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},
>     and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding
>     wildcards.
>
>     Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     (cherry picked from commit 8c9ef587fe499c612a878a1ab42092eb79b334ef)
>     Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/license.bbclass                     | 27
> ++++++++++++++++++++----
>  meta/conf/documentation.conf                     |  1 +
>  meta/lib/oeqa/selftest/cases/incompatible_lic.py |  6 +++---
>  3 files changed, 27 insertions(+), 7 deletions(-)
>
...

> +def available_licenses(d):
> +    """
> +    Return the available licenses by searching the directories specified
> by
> +    COMMON_LICENSE_DIR and LICENSE_PATH.
> +    """
> +    lic_dirs = ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
> +                (d.getVar('LICENSE_PATH') or '')).split()
> +
> +    licenses = []
> +    for lic_dir in lic_dirs:
> +        licenses += os.listdir(lic_dir)
> +
> +    licenses = sorted(licenses)
> +    return licenses
> +
> +# Only determine the list of all available licenses once. This assumes
> that any
> +# additions to LICENSE_PATH have been done before this file is parsed.
> +AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
> +
>

FWIW this part no longer seems to work correctly, now running:
yocto-check-layer --dependency /OE/meta-openembedded/meta-oe/
/OE/meta-openembedded/meta-python/ -- /OE/meta-openembedded/meta-multimedia/

I've noticed:
INFO:  ... ok
INFO: skipped "DistroCheckLayer: Layer meta-multimedia isn't Distro one."
INFO: ======================================================================
INFO: FAIL: test_signatures (common.CommonCheckLayer)
INFO: ----------------------------------------------------------------------
INFO: Traceback (most recent call last):
  File
"/OE/build/oe-core/openembedded-core/scripts/lib/checklayer/cases/common.py",
line 55, in test_signatures
    self.fail('Adding layer %s changed signatures.\n%s' %
(self.tc.layer['name'], msg))
AssertionError: Adding layer meta-multimedia changed signatures.
88 signatures changed, initial differences (first hash before, second
after):
   libdevmapper:do_configure:
61d81f223c9ec5893d05cd355a0f9a6896841c2a1d957eb86c21eb7ce1ccad90 ->
6c38318b639496645b24971358c7c8e3d0d7b0f5ccd8575fab68c042678d4097
      bitbake-diffsigs --task libdevmapper do_configure --signature
61d81f223c9ec5893d05cd355a0f9a6896841c2a1d957eb86c21eb7ce1ccad90
6c38318b639496645b24971358c7c8e3d0d7b0f5ccd8575fab68c042678d4097
      NOTE: Reconnecting to bitbake server...
      basehash changed from
cf65d65a6575e76b468d41acd30ace204137f37eec43f3cf9bed00eb4c127086 to
e0a60ed74c1c002fea3f0883e173b2927c970c6b44c69e943b02d2d47bd1545f
      Variable AVAILABLE_LICENSES value changed:
      "AAL ACE-TAO-CIAO AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0 AGPL-3.0-only
AGPL-3.0-or-later ANTLR-PD {+AOM-Patent-License-1.0+} APL-1.0 APSL-1.0
APSL-1.1 APSL-1.2 APSL-2.0 Adobe Apache-1.0 Apache-1.1 Apache-2.0
Apache-2.0-with-LLVM-exception Arphic-Public-License Artistic-1.0
Artistic-2.0 BSD BSD-0-Clause BSD-1-Clause BSD-2-Clause BSD-2-Clause-Patent
BSD-3-Clause BSD-3-Clause-Clear BSD-4-Clause BSL-1.0 {+BellBird+}
BitstreamVera CATOSL-1.1 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5 CC-BY-3.0
CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-NC-3.0 CC-BY-NC-ND-1.0
CC-BY-NC-ND-2.0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-SA-1.0
CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0 CC-BY-ND-1.0 CC-BY-ND-2.0
CC-BY-ND-2.5 CC-BY-ND-3.0 CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5
CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B
CECILL-C {+CMU-Tex+} CPAL-1.0 CPL-1.0 CUA-OPL-1.0 ClArtistic DSSSL ECL-1.0
ECL-2.0 EDL-1.0 EFL-1.0 EFL-2.0 EPL-1.0 EPL-2.0 EUDatagrid EUPL-1.0
EUPL-1.1 Entessa ErlPL-1.1 FLTK FSF-Unlimited Fair Frameworx-1.0
{+Fraunhofer_FDK_AAC_Codec_Library_for_Android+} FreeType GD GFDL-1.1
GFDL-1.2 GFDL-1.3 GPL-1.0-only GPL-1.0-or-later GPL-2-with-bison-exception
GPL-2.0-only GPL-2.0-or-later GPL-2.0-with-GCC-exception
GPL-2.0-with-OpenSSL-exception GPL-2.0-with-autoconf-exception
GPL-2.0-with-classpath-exception GPL-2.0-with-font-exception
GPL-2.0-with-lmbench-restriction GPL-3-with-bison-exception GPL-3.0-only
GPL-3.0-or-later GPL-3.0-with-GCC-exception GPL-3.0-with-autoconf-exception
HDF5 HPND ICU IPA IPL-1.0 ISC ImageMagick Intel Khronos Kilgard
LGPL-2.0-only LGPL-2.0-or-later LGPL-2.1-only LGPL-2.1-or-later
LGPL-3.0-only LGPL-3.0-or-later LLNL LPL-1.02 LPPL-1.0 LPPL-1.1 LPPL-1.2
LPPL-1.3c Libpng MIT MPL-1.0 MPL-1.1 MPL-2.0 MS-PL MS-RL ManishSingh
Mini-XML-License MirOS Motosoto Multics NASA-1.3 NCSA NGPL NPOSL-3.0 NTP
Nauman Nokia OASIS OCLC-2.0 ODbL-1.0 OFL-1.0 OFL-1.1 OGPL OGTSL OLDAP-2.8
OSL-1.0 OSL-2.0 OSL-3.0 OpenLDAP OpenSSL PD PHP-3.0 PSF-2.0 ParaTypeFFL-1.3
PostgreSQL Proprietary Python-2.0 QPL-1.0 QWTv1.0 RHeCos-1 RHeCos-1.1
RPL-1.5 RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 SMAIL_GPL SPL-1.0 SSPL-1
Simple-2.0 Sleepycat SugarCRM-1 SugarCRM-1.1.3 {+Sun+} TLWG UCB UFL Unicode
Unlicense VSL-1.0 W3C WTFPL WXwindows Watcom-1.0 X11 XFree86-1.0
XFree86-1.1 XSL Xnet YPL-1.1 ZPL-1.1 ZPL-2.0 ZPL-2.1 Zimbra-1.3 Zlib
bzip2-1.0.4 bzip2-1.0.6 eCos-2.0 flite gSOAP-1 gSOAP-1.3b gnuplot iozone3
nbench-byte pkgconf read-edid safec tcl ttf-mplus unRAR unfs3 vim wxWidgets
zsh"

   lvm2:do_configure:
3f28ac63b231b6f1b27157c21c517f80944d8c75603212663fc9b2268d558507 ->
c5b60d8dee00f558ef1086a6415c229eac6ac633e06d574b34ec9e47039d9d2a
      bitbake-diffsigs --task lvm2 do_configure --signature
3f28ac63b231b6f1b27157c21c517f80944d8c75603212663fc9b2268d558507
c5b60d8dee00f558ef1086a6415c229eac6ac633e06d574b34ec9e47039d9d2a
      NOTE: Reconnecting to bitbake server...
      basehash changed from
b1ece9d06005c4520a52037d8bb0a2facdecda5977d5e183a44ef84fc6a13671 to
f9b5acc9bf89bf4dfefb50e3e4c2ab08f15a1d3a3005dafe6505c5cd5f03c4e8
      Variable AVAILABLE_LICENSES value changed:
      "AAL ACE-TAO-CIAO AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0 AGPL-3.0-only
AGPL-3.0-or-later ANTLR-PD {+AOM-Patent-License-1.0+} APL-1.0 APSL-1.0
APSL-1.1 APSL-1.2 APSL-2.0 Adobe Apache-1.0 Apache-1.1 Apache-2.0
Apache-2.0-with-LLVM-exception Arphic-Public-License Artistic-1.0
Artistic-2.0 BSD BSD-0-Clause BSD-1-Clause BSD-2-Clause BSD-2-Clause-Patent
BSD-3-Clause BSD-3-Clause-Clear BSD-4-Clause BSL-1.0 {+BellBird+}
BitstreamVera CATOSL-1.1 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5 CC-BY-3.0
CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-NC-3.0 CC-BY-NC-ND-1.0
CC-BY-NC-ND-2.0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-SA-1.0
CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0 CC-BY-ND-1.0 CC-BY-ND-2.0
CC-BY-ND-2.5 CC-BY-ND-3.0 CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5
CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B
CECILL-C {+CMU-Tex+} CPAL-1.0 CPL-1.0 CUA-OPL-1.0 ClArtistic DSSSL ECL-1.0
ECL-2.0 EDL-1.0 EFL-1.0 EFL-2.0 EPL-1.0 EPL-2.0 EUDatagrid EUPL-1.0
EUPL-1.1 Entessa ErlPL-1.1 FLTK FSF-Unlimited Fair Frameworx-1.0
{+Fraunhofer_FDK_AAC_Codec_Library_for_Android+} FreeType GD GFDL-1.1
GFDL-1.2 GFDL-1.3 GPL-1.0-only GPL-1.0-or-later GPL-2-with-bison-exception
GPL-2.0-only GPL-2.0-or-later GPL-2.0-with-GCC-exception
GPL-2.0-with-OpenSSL-exception GPL-2.0-with-autoconf-exception
GPL-2.0-with-classpath-exception GPL-2.0-with-font-exception
GPL-2.0-with-lmbench-restriction GPL-3-with-bison-exception GPL-3.0-only
GPL-3.0-or-later GPL-3.0-with-GCC-exception GPL-3.0-with-autoconf-exception
HDF5 HPND ICU IPA IPL-1.0 ISC ImageMagick Intel Khronos Kilgard
LGPL-2.0-only LGPL-2.0-or-later LGPL-2.1-only LGPL-2.1-or-later
LGPL-3.0-only LGPL-3.0-or-later LLNL LPL-1.02 LPPL-1.0 LPPL-1.1 LPPL-1.2
LPPL-1.3c Libpng MIT MPL-1.0 MPL-1.1 MPL-2.0 MS-PL MS-RL ManishSingh
Mini-XML-License MirOS Motosoto Multics NASA-1.3 NCSA NGPL NPOSL-3.0 NTP
Nauman Nokia OASIS OCLC-2.0 ODbL-1.0 OFL-1.0 OFL-1.1 OGPL OGTSL OLDAP-2.8
OSL-1.0 OSL-2.0 OSL-3.0 OpenLDAP OpenSSL PD PHP-3.0 PSF-2.0 ParaTypeFFL-1.3
PostgreSQL Proprietary Python-2.0 QPL-1.0 QWTv1.0 RHeCos-1 RHeCos-1.1
RPL-1.5 RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 SMAIL_GPL SPL-1.0 SSPL-1
Simple-2.0 Sleepycat SugarCRM-1 SugarCRM-1.1.3 {+Sun+} TLWG UCB UFL Unicode
Unlicense VSL-1.0 W3C WTFPL WXwindows Watcom-1.0 X11 XFree86-1.0
XFree86-1.1 XSL Xnet YPL-1.1 ZPL-1.1 ZPL-2.0 ZPL-2.1 Zimbra-1.3 Zlib
bzip2-1.0.4 bzip2-1.0.6 eCos-2.0 flite gSOAP-1 gSOAP-1.3b gnuplot iozone3
nbench-byte pkgconf read-edid safec tcl ttf-mplus unRAR unfs3 vim wxWidgets
zsh"

And manually running:
bitbake -S none lvm2
with and without meta-multimedia included confirms this behavior:

oe-core$ bitbake-diffsigs
tmp-musl/stamps/core2-64-foo4-linux-musl/lvm2/2.03.11-r0.do_configure.sigdata.21be78ebe2363713cf02f25efd28406fb8025e199e3a7938ee571fcdb33672a1
tmp-musl/stamps/core2-64-foo4-linux-musl/lvm2/2.03.11-r0.do_configure.sigdata.7dfa7612c4916466f8a0b8f067c840e03232536159b6b9dd5e7462e743ef8942
NOTE: Reconnecting to bitbake server...
basehash changed from
f5fbb9749fe3d66410b9fb22eb534b2c0be9190a00b6c5ee1b2615de3ad771f1 to
f33a319864313d451d4434a4c7d87eaa47553904c044c07223655e51b4209e6d
Variable AVAILABLE_LICENSES value changed:
"AAL ACE-TAO-CIAO AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0 AGPL-3.0-only
AGPL-3.0-or-later ANTLR-PD {+AOM-Patent-License-1.0+} APL-1.0 APSL-1.0
APSL-1.1 APSL-1.2 APSL-2.0 Adobe Apache-1.0 Apache-1.1 Apache-2.0
Apache-2.0-with-LLVM-exception Arphic-Public-License Artistic-1.0
Artistic-2.0 BSD BSD-0-Clause BSD-1-Clause BSD-2-Clause BSD-2-Clause-Patent
BSD-3-Clause BSD-3-Clause-Clear BSD-4-Clause BSL-1.0 {+BellBird+}
BitstreamVera Broadcom-RPi CATOSL-1.1 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5
CC-BY-3.0 CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-NC-3.0
CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0
CC-BY-NC-SA-1.0 CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0
CC-BY-ND-1.0 CC-BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0 CC-BY-SA-1.0
CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 CDDL-1.0
CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C {+CMU-Tex+} CPAL-1.0 CPL-1.0
CUA-OPL-1.0 ClArtistic DMTF DSSSL Digia-Qt-LGPL-Exception-1.1 ECL-1.0
ECL-2.0 EDL-1.0 EFL-1.0 EFL-2.0 EPL-1.0 EPL-2.0 EUDatagrid EUPL-1.0
EUPL-1.1 Entessa ErlPL-1.1 FLTK FSF-Unlimited Fair Frameworx-1.0
{+Fraunhofer_FDK_AAC_Codec_Library_for_Android+} FreeType GD GFDL-1.1
GFDL-1.2 GFDL-1.3 GPL-1.0-only GPL-1.0-or-later GPL-2-with-bison-exception
GPL-2.0-only GPL-2.0-or-later GPL-2.0-with-GCC-exception
GPL-2.0-with-OpenSSL-exception GPL-2.0-with-autoconf-exception
GPL-2.0-with-classpath-exception GPL-2.0-with-font-exception
GPL-2.0-with-lmbench-restriction GPL-3-with-bison-exception GPL-3.0-only
GPL-3.0-or-later GPL-3.0-with-GCC-exception GPL-3.0-with-autoconf-exception
HDF5 HPND ICU IPA IPL-1.0 ISC ImageMagick Intel Intel-ACPI Khronos Kilgard
LGPL-2.0-only LGPL-2.0-or-later LGPL-2.1-only LGPL-2.1-or-later
LGPL-3.0-only LGPL-3.0-or-later LLNL LLNL LPL-1.02 LPPL-1.0 LPPL-1.1
LPPL-1.2 LPPL-1.3c Libpng MIT MPL-1.0 MPL-1.1 MPL-2.0 MS-PL MS-RL
ManishSingh Mini-XML-License MirOS Motosoto Multics NASA-1.3 NCSA NGPL
NPOSL-3.0 NTP Nauman NewRelic Nokia OASIS OCLC-2.0 ODbL-1.0 OFL-1.0 OFL-1.1
OGPL OGTSL OLDAP-2.8 OML OSL-1.0 OSL-2.0 OSL-3.0 OpenLDAP OpenSSL PD
PHP-3.0 PSF-2.0 ParaTypeFFL-1.3 PostgreSQL Proprietary Python-2.0 QPL-1.0
QWTv1.0 RHeCos-1 RHeCos-1.1 RPL-1.5 RPSL-1.0 RSCPL Ruby SAX-PD SGI-1
SMAIL_GPL SPL-1.0 SSPL-1 Simple-2.0 Sleepycat SugarCRM-1 SugarCRM-1.1.3
{+Sun+} TLWG The-Qt-Company-Commercial The-Qt-Company-GPL-Exception-1.0 UCB
UFL Unicode Unicode Unlicense VSL-1.0 W3C WTFPL WXwindows Watcom-1.0 X11
XFree86-1.0 XFree86-1.1 XSL Xdebug Xnet YPL-1.1 ZPL-1.1 ZPL-2.0 ZPL-2.1
Zimbra-1.3 Zlib bzip2-1.0.4 bzip2-1.0.6 copyleft-next-0.3.0 eCos-2.0 flite
gSOAP-1 gSOAP-1.3b gnuplot iozone3 nbench-byte netperf pkgconf radvd
read-edid safec tcl ttf-mplus unRAR unfs3 vim wxWidgets zsh"

meta-networking adds to LICENSE_PATH like many other layers:
oe-core$ grep LICENSE_PATH meta-openembedded/meta*/conf/layer.conf
meta-openembedded/meta-multimedia/conf/layer.conf:LICENSE_PATH +=
"${LAYERDIR}/licenses"
meta-openembedded/meta-networking/conf/layer.conf:LICENSE_PATH +=
"${LAYERDIR}/licenses"
meta-openembedded/meta-oe/conf/layer.conf:LICENSE_PATH +=
"${LAYERDIR}/licenses"
meta-openembedded/meta-python/conf/layer.conf:LICENSE_PATH +=
"${LAYERDIR}/licenses"
meta-openembedded/meta-webserver/conf/layer.conf:LICENSE_PATH +=
"${LAYERDIR}/licenses"

so nothing strange there, but lvm2.inc is a bit fishy with:
inherit autotools-brokensep pkgconfig systemd license

the license inherit was added long time ago with:

commit e257af489347851d0781b3882f711f580f245fbb
Author: Kai Kang <kai.kang@windriver.com>
Date:   Sun Sep 24 08:51:20 2017 +0800

    lvm2: refactoring code to disable package config thin-provisioning-tools

bitbake-diffsigs
tmp-musl/stamps/core2-64-foo4-linux-musl/lvm2/2.03.11-r0.do_configure.sigdata.7dfa7612c4916466f8a0b8f067c840e03232536159b6b9dd5e7462e743ef8942
| grep AVAILABLE_LICENSES | grep List.of.dep
List of dependencies for variable AVAILABLE_LICENSES is set()
List of dependencies for variable expand_wildcard_licenses is
{'AVAILABLE_LICENSES'}

Anyone seeing the same? I wonder if it was somehow introduced in recent
licensing changes, but I don't see anything obvious and I thought that
check-yocto-layer used to pass for meta-multimedia before.

--000000000000cf6bd405bec71781
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 28, 2020 at 12:52 PM &lt;<a href=
=3D"mailto:git@git.openembedded.org">git@git.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is an aut=
omated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch zeus<br>
in repository openembedded-core.<br>
<br>
commit 5ed714139f91eb03871e01b68a4370784071234d<br>
Author: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.co=
m" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
AuthorDate: Wed Dec 11 17:48:13 2019 +0100<br>
<br>
=C2=A0 =C2=A0 license.bbclass: Introduce AVAILABLE_LICENSES that lists all =
licenses<br>
<br>
=C2=A0 =C2=A0 Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumente=
d<br>
=C2=A0 =C2=A0 variable that contained a static list of licenses. It was use=
d by<br>
=C2=A0 =C2=A0 expand_wildcard_licenses() to expand any wildcards used in, e=
.g.,<br>
=C2=A0 =C2=A0 INCOMPATIBLE_LICENSE. However, since this static list of lice=
nses has<br>
=C2=A0 =C2=A0 not been kept up-to-date, many licenses were missing, with th=
e result<br>
=C2=A0 =C2=A0 that if one tried to use any of those licenses with a wildcar=
d, no<br>
=C2=A0 =C2=A0 licenses would be found, effectively ignoring that they shoul=
d be<br>
=C2=A0 =C2=A0 marked as incompatible.<br>
<br>
=C2=A0 =C2=A0 This introduces a new (documented) variable, AVAILABLE_LICENS=
ES, that<br>
=C2=A0 =C2=A0 is automatically updated to contain all licenses found in any=
<br>
=C2=A0 =C2=A0 directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_=
PATH},<br>
=C2=A0 =C2=A0 and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding=
<br>
=C2=A0 =C2=A0 wildcards.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter=
.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&g=
t;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
=C2=A0 =C2=A0 (cherry picked from commit 8c9ef587fe499c612a878a1ab42092eb79=
b334ef)<br>
=C2=A0 =C2=A0 Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@=
intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/license.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 ++++++++++++++++++++----<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/incompatible_lic.py |=C2=A0 6 +++---<br>
=C2=A03 files changed, 27 insertions(+), 7 deletions(-)<br></blockquote><di=
v>...=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+def ava=
ilable_licenses(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Return the available licenses by searching the directories s=
pecified by<br>
+=C2=A0 =C2=A0 COMMON_LICENSE_DIR and LICENSE_PATH.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 lic_dirs =3D ((d.getVar(&#39;COMMON_LICENSE_DIR&#39;) or &#3=
9;&#39;) + &#39; &#39; +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (d.getVar(&#39;LIC=
ENSE_PATH&#39;) or &#39;&#39;)).split()<br>
+<br>
+=C2=A0 =C2=A0 licenses =3D []<br>
+=C2=A0 =C2=A0 for lic_dir in lic_dirs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 licenses +=3D os.listdir(lic_dir)<br>
+<br>
+=C2=A0 =C2=A0 licenses =3D sorted(licenses)<br>
+=C2=A0 =C2=A0 return licenses<br>
+<br>
+# Only determine the list of all available licenses once. This assumes tha=
t any<br>
+# additions to LICENSE_PATH have been done before this file is parsed.<br>
+AVAILABLE_LICENSES :=3D &quot;${@&#39; &#39;.join(available_licenses(d))}&=
quot;<br>
+<br></blockquote><div><br></div><div>FWIW this part no longer seems to wor=
k correctly, now running:<br></div><div>yocto-check-layer --dependency /OE/=
meta-openembedded/meta-oe/ /OE/meta-openembedded/meta-python/ -- /OE/meta-o=
penembedded/meta-multimedia/<br></div><div><br></div><div>I&#39;ve noticed:=
</div><div>INFO: =C2=A0... ok<br>INFO: skipped &quot;DistroCheckLayer: Laye=
r meta-multimedia isn&#39;t Distro one.&quot;<br>INFO: =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>INFO: FAIL: test_signatures (=
common.CommonCheckLayer)<br>INFO: -----------------------------------------=
-----------------------------<br>INFO: Traceback (most recent call last):<b=
r>=C2=A0 File &quot;/OE/build/oe-core/openembedded-core/scripts/lib/checkla=
yer/cases/common.py&quot;, line 55, in test_signatures<br>=C2=A0 =C2=A0 sel=
f.fail(&#39;Adding layer %s changed signatures.\n%s&#39; % (self.tc.layer[&=
#39;name&#39;], msg))<br>AssertionError: Adding layer meta-multimedia chang=
ed signatures.<br>88 signatures changed, initial differences (first hash be=
fore, second after):<br>=C2=A0 =C2=A0libdevmapper:do_configure: 61d81f223c9=
ec5893d05cd355a0f9a6896841c2a1d957eb86c21eb7ce1ccad90 -&gt; 6c38318b6394966=
45b24971358c7c8e3d0d7b0f5ccd8575fab68c042678d4097<br>=C2=A0 =C2=A0 =C2=A0 b=
itbake-diffsigs --task libdevmapper do_configure --signature 61d81f223c9ec5=
893d05cd355a0f9a6896841c2a1d957eb86c21eb7ce1ccad90 6c38318b639496645b249713=
58c7c8e3d0d7b0f5ccd8575fab68c042678d4097<br>=C2=A0 =C2=A0 =C2=A0 NOTE: Reco=
nnecting to bitbake server...<br>=C2=A0 =C2=A0 =C2=A0 basehash changed from=
 cf65d65a6575e76b468d41acd30ace204137f37eec43f3cf9bed00eb4c127086 to e0a60e=
d74c1c002fea3f0883e173b2927c970c6b44c69e943b02d2d47bd1545f<br>=C2=A0 =C2=A0=
 =C2=A0 Variable AVAILABLE_LICENSES value changed:<br>=C2=A0 =C2=A0 =C2=A0 =
&quot;AAL ACE-TAO-CIAO AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0 AGPL-3.0-only AGPL-3=
.0-or-later ANTLR-PD {+AOM-Patent-License-1.0+} APL-1.0 APSL-1.0 APSL-1.1 A=
PSL-1.2 APSL-2.0 Adobe Apache-1.0 Apache-1.1 Apache-2.0 Apache-2.0-with-LLV=
M-exception Arphic-Public-License Artistic-1.0 Artistic-2.0 BSD BSD-0-Claus=
e BSD-1-Clause BSD-2-Clause BSD-2-Clause-Patent BSD-3-Clause BSD-3-Clause-C=
lear BSD-4-Clause BSL-1.0 {+BellBird+} BitstreamVera CATOSL-1.1 CC-BY-1.0 C=
C-BY-2.0 CC-BY-2.5 CC-BY-3.0 CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-N=
C-3.0 CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY=
-NC-SA-1.0 CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0 CC-BY-ND-1.0 CC-=
BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0 CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 =
CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B C=
ECILL-C {+CMU-Tex+} CPAL-1.0 CPL-1.0 CUA-OPL-1.0 ClArtistic DSSSL ECL-1.0 E=
CL-2.0 EDL-1.0 EFL-1.0 EFL-2.0 EPL-1.0 EPL-2.0 EUDatagrid EUPL-1.0 EUPL-1.1=
 Entessa ErlPL-1.1 FLTK FSF-Unlimited Fair Frameworx-1.0 {+Fraunhofer_FDK_A=
AC_Codec_Library_for_Android+} FreeType GD GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1=
.0-only GPL-1.0-or-later GPL-2-with-bison-exception GPL-2.0-only GPL-2.0-or=
-later GPL-2.0-with-GCC-exception GPL-2.0-with-OpenSSL-exception GPL-2.0-wi=
th-autoconf-exception GPL-2.0-with-classpath-exception GPL-2.0-with-font-ex=
ception GPL-2.0-with-lmbench-restriction GPL-3-with-bison-exception GPL-3.0=
-only GPL-3.0-or-later GPL-3.0-with-GCC-exception GPL-3.0-with-autoconf-exc=
eption HDF5 HPND ICU IPA IPL-1.0 ISC ImageMagick Intel Khronos Kilgard LGPL=
-2.0-only LGPL-2.0-or-later LGPL-2.1-only LGPL-2.1-or-later LGPL-3.0-only L=
GPL-3.0-or-later LLNL LPL-1.02 LPPL-1.0 LPPL-1.1 LPPL-1.2 LPPL-1.3c Libpng =
MIT MPL-1.0 MPL-1.1 MPL-2.0 MS-PL MS-RL ManishSingh Mini-XML-License MirOS =
Motosoto Multics NASA-1.3 NCSA NGPL NPOSL-3.0 NTP Nauman Nokia OASIS OCLC-2=
.0 ODbL-1.0 OFL-1.0 OFL-1.1 OGPL OGTSL OLDAP-2.8 OSL-1.0 OSL-2.0 OSL-3.0 Op=
enLDAP OpenSSL PD PHP-3.0 PSF-2.0 ParaTypeFFL-1.3 PostgreSQL Proprietary Py=
thon-2.0 QPL-1.0 QWTv1.0 RHeCos-1 RHeCos-1.1 RPL-1.5 RPSL-1.0 RSCPL Ruby SA=
X-PD SGI-1 SMAIL_GPL SPL-1.0 SSPL-1 Simple-2.0 Sleepycat SugarCRM-1 SugarCR=
M-1.1.3 {+Sun+} TLWG UCB UFL Unicode Unlicense VSL-1.0 W3C WTFPL WXwindows =
Watcom-1.0 X11 XFree86-1.0 XFree86-1.1 XSL Xnet YPL-1.1 ZPL-1.1 ZPL-2.0 ZPL=
-2.1 Zimbra-1.3 Zlib bzip2-1.0.4 bzip2-1.0.6 eCos-2.0 flite gSOAP-1 gSOAP-1=
.3b gnuplot iozone3 nbench-byte pkgconf read-edid safec tcl ttf-mplus unRAR=
 unfs3 vim wxWidgets zsh&quot;<br><br>=C2=A0 =C2=A0lvm2:do_configure: 3f28a=
c63b231b6f1b27157c21c517f80944d8c75603212663fc9b2268d558507 -&gt; c5b60d8de=
e00f558ef1086a6415c229eac6ac633e06d574b34ec9e47039d9d2a<br>=C2=A0 =C2=A0 =
=C2=A0 bitbake-diffsigs --task lvm2 do_configure --signature 3f28ac63b231b6=
f1b27157c21c517f80944d8c75603212663fc9b2268d558507 c5b60d8dee00f558ef1086a6=
415c229eac6ac633e06d574b34ec9e47039d9d2a<br>=C2=A0 =C2=A0 =C2=A0 NOTE: Reco=
nnecting to bitbake server...<br>=C2=A0 =C2=A0 =C2=A0 basehash changed from=
 b1ece9d06005c4520a52037d8bb0a2facdecda5977d5e183a44ef84fc6a13671 to f9b5ac=
c9bf89bf4dfefb50e3e4c2ab08f15a1d3a3005dafe6505c5cd5f03c4e8<br>=C2=A0 =C2=A0=
 =C2=A0 Variable AVAILABLE_LICENSES value changed:<br>=C2=A0 =C2=A0 =C2=A0 =
&quot;AAL ACE-TAO-CIAO AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0 AGPL-3.0-only AGPL-3=
.0-or-later ANTLR-PD {+AOM-Patent-License-1.0+} APL-1.0 APSL-1.0 APSL-1.1 A=
PSL-1.2 APSL-2.0 Adobe Apache-1.0 Apache-1.1 Apache-2.0 Apache-2.0-with-LLV=
M-exception Arphic-Public-License Artistic-1.0 Artistic-2.0 BSD BSD-0-Claus=
e BSD-1-Clause BSD-2-Clause BSD-2-Clause-Patent BSD-3-Clause BSD-3-Clause-C=
lear BSD-4-Clause BSL-1.0 {+BellBird+} BitstreamVera CATOSL-1.1 CC-BY-1.0 C=
C-BY-2.0 CC-BY-2.5 CC-BY-3.0 CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-N=
C-3.0 CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY=
-NC-SA-1.0 CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0 CC-BY-ND-1.0 CC-=
BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0 CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 =
CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B C=
ECILL-C {+CMU-Tex+} CPAL-1.0 CPL-1.0 CUA-OPL-1.0 ClArtistic DSSSL ECL-1.0 E=
CL-2.0 EDL-1.0 EFL-1.0 EFL-2.0 EPL-1.0 EPL-2.0 EUDatagrid EUPL-1.0 EUPL-1.1=
 Entessa ErlPL-1.1 FLTK FSF-Unlimited Fair Frameworx-1.0 {+Fraunhofer_FDK_A=
AC_Codec_Library_for_Android+} FreeType GD GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1=
.0-only GPL-1.0-or-later GPL-2-with-bison-exception GPL-2.0-only GPL-2.0-or=
-later GPL-2.0-with-GCC-exception GPL-2.0-with-OpenSSL-exception GPL-2.0-wi=
th-autoconf-exception GPL-2.0-with-classpath-exception GPL-2.0-with-font-ex=
ception GPL-2.0-with-lmbench-restriction GPL-3-with-bison-exception GPL-3.0=
-only GPL-3.0-or-later GPL-3.0-with-GCC-exception GPL-3.0-with-autoconf-exc=
eption HDF5 HPND ICU IPA IPL-1.0 ISC ImageMagick Intel Khronos Kilgard LGPL=
-2.0-only LGPL-2.0-or-later LGPL-2.1-only LGPL-2.1-or-later LGPL-3.0-only L=
GPL-3.0-or-later LLNL LPL-1.02 LPPL-1.0 LPPL-1.1 LPPL-1.2 LPPL-1.3c Libpng =
MIT MPL-1.0 MPL-1.1 MPL-2.0 MS-PL MS-RL ManishSingh Mini-XML-License MirOS =
Motosoto Multics NASA-1.3 NCSA NGPL NPOSL-3.0 NTP Nauman Nokia OASIS OCLC-2=
.0 ODbL-1.0 OFL-1.0 OFL-1.1 OGPL OGTSL OLDAP-2.8 OSL-1.0 OSL-2.0 OSL-3.0 Op=
enLDAP OpenSSL PD PHP-3.0 PSF-2.0 ParaTypeFFL-1.3 PostgreSQL Proprietary Py=
thon-2.0 QPL-1.0 QWTv1.0 RHeCos-1 RHeCos-1.1 RPL-1.5 RPSL-1.0 RSCPL Ruby SA=
X-PD SGI-1 SMAIL_GPL SPL-1.0 SSPL-1 Simple-2.0 Sleepycat SugarCRM-1 SugarCR=
M-1.1.3 {+Sun+} TLWG UCB UFL Unicode Unlicense VSL-1.0 W3C WTFPL WXwindows =
Watcom-1.0 X11 XFree86-1.0 XFree86-1.1 XSL Xnet YPL-1.1 ZPL-1.1 ZPL-2.0 ZPL=
-2.1 Zimbra-1.3 Zlib bzip2-1.0.4 bzip2-1.0.6 eCos-2.0 flite gSOAP-1 gSOAP-1=
.3b gnuplot iozone3 nbench-byte pkgconf read-edid safec tcl ttf-mplus unRAR=
 unfs3 vim wxWidgets zsh&quot;<br></div><div><br></div><div>And manually ru=
nning:</div><div>bitbake -S none lvm2</div><div>with and without meta-multi=
media included confirms this behavior:</div><div><br></div><div>oe-core$ bi=
tbake-diffsigs tmp-musl/stamps/core2-64-foo4-linux-musl/lvm2/2.03.11-r0.do_=
configure.sigdata.21be78ebe2363713cf02f25efd28406fb8025e199e3a7938ee571fcdb=
33672a1 tmp-musl/stamps/core2-64-foo4-linux-musl/lvm2/2.03.11-r0.do_configu=
re.sigdata.7dfa7612c4916466f8a0b8f067c840e03232536159b6b9dd5e7462e743ef8942=
<br>NOTE: Reconnecting to bitbake server...<br>basehash changed from f5fbb9=
749fe3d66410b9fb22eb534b2c0be9190a00b6c5ee1b2615de3ad771f1 to f33a319864313=
d451d4434a4c7d87eaa47553904c044c07223655e51b4209e6d<br>Variable AVAILABLE_L=
ICENSES value changed:<br>&quot;AAL ACE-TAO-CIAO AFL-1.2 AFL-2.0 AFL-2.1 AF=
L-3.0 AGPL-3.0-only AGPL-3.0-or-later ANTLR-PD {+AOM-Patent-License-1.0+} A=
PL-1.0 APSL-1.0 APSL-1.1 APSL-1.2 APSL-2.0 Adobe Apache-1.0 Apache-1.1 Apac=
he-2.0 Apache-2.0-with-LLVM-exception Arphic-Public-License Artistic-1.0 Ar=
tistic-2.0 BSD BSD-0-Clause BSD-1-Clause BSD-2-Clause BSD-2-Clause-Patent B=
SD-3-Clause BSD-3-Clause-Clear BSD-4-Clause BSL-1.0 {+BellBird+} BitstreamV=
era Broadcom-RPi CATOSL-1.1 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5 CC-BY-3.0 CC-BY-N=
C-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-NC-3.0 CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.=
0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-SA-1.0 CC-BY-NC-SA-2.0 CC-BY-NC-=
SA-2.5 CC-BY-NC-SA-3.0 CC-BY-ND-1.0 CC-BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0 =
CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 CD=
DL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C {+CMU-Tex+} CPAL-1.0 CPL-1.0=
 CUA-OPL-1.0 ClArtistic DMTF DSSSL Digia-Qt-LGPL-Exception-1.1 ECL-1.0 ECL-=
2.0 EDL-1.0 EFL-1.0 EFL-2.0 EPL-1.0 EPL-2.0 EUDatagrid EUPL-1.0 EUPL-1.1 En=
tessa ErlPL-1.1 FLTK FSF-Unlimited Fair Frameworx-1.0 {+Fraunhofer_FDK_AAC_=
Codec_Library_for_Android+} FreeType GD GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0-=
only GPL-1.0-or-later GPL-2-with-bison-exception GPL-2.0-only GPL-2.0-or-la=
ter GPL-2.0-with-GCC-exception GPL-2.0-with-OpenSSL-exception GPL-2.0-with-=
autoconf-exception GPL-2.0-with-classpath-exception GPL-2.0-with-font-excep=
tion GPL-2.0-with-lmbench-restriction GPL-3-with-bison-exception GPL-3.0-on=
ly GPL-3.0-or-later GPL-3.0-with-GCC-exception GPL-3.0-with-autoconf-except=
ion HDF5 HPND ICU IPA IPL-1.0 ISC ImageMagick Intel Intel-ACPI Khronos Kilg=
ard LGPL-2.0-only LGPL-2.0-or-later LGPL-2.1-only LGPL-2.1-or-later LGPL-3.=
0-only LGPL-3.0-or-later LLNL LLNL LPL-1.02 LPPL-1.0 LPPL-1.1 LPPL-1.2 LPPL=
-1.3c Libpng MIT MPL-1.0 MPL-1.1 MPL-2.0 MS-PL MS-RL ManishSingh Mini-XML-L=
icense MirOS Motosoto Multics NASA-1.3 NCSA NGPL NPOSL-3.0 NTP Nauman NewRe=
lic Nokia OASIS OCLC-2.0 ODbL-1.0 OFL-1.0 OFL-1.1 OGPL OGTSL OLDAP-2.8 OML =
OSL-1.0 OSL-2.0 OSL-3.0 OpenLDAP OpenSSL PD PHP-3.0 PSF-2.0 ParaTypeFFL-1.3=
 PostgreSQL Proprietary Python-2.0 QPL-1.0 QWTv1.0 RHeCos-1 RHeCos-1.1 RPL-=
1.5 RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 SMAIL_GPL SPL-1.0 SSPL-1 Simple-2.0 Sl=
eepycat SugarCRM-1 SugarCRM-1.1.3 {+Sun+} TLWG The-Qt-Company-Commercial Th=
e-Qt-Company-GPL-Exception-1.0 UCB UFL Unicode Unicode Unlicense VSL-1.0 W3=
C WTFPL WXwindows Watcom-1.0 X11 XFree86-1.0 XFree86-1.1 XSL Xdebug Xnet YP=
L-1.1 ZPL-1.1 ZPL-2.0 ZPL-2.1 Zimbra-1.3 Zlib bzip2-1.0.4 bzip2-1.0.6 copyl=
eft-next-0.3.0 eCos-2.0 flite gSOAP-1 gSOAP-1.3b gnuplot iozone3 nbench-byt=
e netperf pkgconf radvd read-edid safec tcl ttf-mplus unRAR unfs3 vim wxWid=
gets zsh&quot;<br></div><div><br></div><div>meta-networking adds to LICENSE=
_PATH like many other layers:</div><div>oe-core$ grep LICENSE_PATH meta-ope=
nembedded/meta*/conf/layer.conf<br>meta-openembedded/meta-multimedia/conf/l=
ayer.conf:LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>meta-openem=
bedded/meta-networking/conf/layer.conf:LICENSE_PATH +=3D &quot;${LAYERDIR}/=
licenses&quot;<br>meta-openembedded/meta-oe/conf/layer.conf:LICENSE_PATH +=
=3D &quot;${LAYERDIR}/licenses&quot;<br>meta-openembedded/meta-python/conf/=
layer.conf:LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>meta-opene=
mbedded/meta-webserver/conf/layer.conf:LICENSE_PATH +=3D &quot;${LAYERDIR}/=
licenses&quot;</div><div><br></div><div>so nothing strange there, but lvm2.=
inc is a bit fishy with:</div><div>inherit autotools-brokensep pkgconfig sy=
stemd license<br></div><div><br></div><div>the license inherit was added lo=
ng time ago with:</div><div><br></div><div>commit e257af489347851d0781b3882=
f711f580f245fbb<br>Author: Kai Kang &lt;<a href=3D"mailto:kai.kang@windrive=
r.com">kai.kang@windriver.com</a>&gt;<br>Date: =C2=A0 Sun Sep 24 08:51:20 2=
017 +0800<br><br>=C2=A0 =C2=A0 lvm2: refactoring code to disable package co=
nfig thin-provisioning-tools<br></div><div><br></div><div>bitbake-diffsigs =
tmp-musl/stamps/core2-64-foo4-linux-musl/lvm2/2.03.11-r0.do_configure.sigda=
ta.7dfa7612c4916466f8a0b8f067c840e03232536159b6b9dd5e7462e743ef8942 | grep =
AVAILABLE_LICENSES | grep List.of.dep<br>List of dependencies for variable =
AVAILABLE_LICENSES is set()<br>List of dependencies for variable expand_wil=
dcard_licenses is {&#39;AVAILABLE_LICENSES&#39;}<br></div><div><br></div><d=
iv>Anyone seeing the same? I wonder if it was somehow introduced in recent =
licensing changes, but I don&#39;t see anything obvious and I thought that =
check-yocto-layer used to pass for meta-multimedia before.</div><div><br></=
div><div><br></div></div></div>

--000000000000cf6bd405bec71781--

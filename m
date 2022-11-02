Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDAAC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 22:40:58 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.12913.1667428853709765914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 15:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gguz3vB1;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id d26so830629eje.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VlTqfYIszV23l0Ji2oa6yjiBittVztwhNXwOjt8fyEY=;
        b=Gguz3vB1DAMy1JqJISV9uoQDEZD5fpdtKnCR1WiD78WRxx+GVpUGtt5EM2LC9y3myP
         aUZsoYd+z969U/X7DQW4n+IfLGQiO1+EH93o+JiIM/A/0uI11CR+2Guh50hqNp8C0JaB
         yjj7VberU9/8QMWHQsCufWRCqJ4To+EBzecl0Z8kCi303UFZ3uTpfne0av8zh+omovdY
         g6bqNgfOBqHNyei4ulRDJ73Pto534af2alfRJ+x3/xrWHTYJ4NMibv58nZq9p5n7rSlt
         eCAwYinzgdXXmNQS4hYCYVvyaB3qO/AgJ8wg4bprLvuq3SUpw4+VFwH8nqTU4JjY5R93
         lbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlTqfYIszV23l0Ji2oa6yjiBittVztwhNXwOjt8fyEY=;
        b=4rdLJ7aMNNsKbkIm/8zcMGi4XjxvWOLsXcEf634cDKJftYN/Ysr/VCKUOeUrLyhjkp
         qhD68cQYWLWdW+2B0wE2/FN88HcNNRYM/g9FY8QnSAFmg7fPci9Mf7YF5vjR/PmB0giG
         a9ntsZPEdzX+rPmFjtNMoThCMnlstp2WqKQsbM+wxn0UBkYQbiMHmQnFzk3DDiergvLu
         UG33dau4vwZ0UeVwfDaye8GAYR7cWI5Mx7Uez/3SztKfCs3v0E0zhRSN66xcRj4AS6WA
         Bs2UHFJ+Ei2CBQrNCtJwiokCEeqktCpYGvFoiwZtj5duPTuKOT2gQqBw0PKITrm9C+S2
         QO+A==
X-Gm-Message-State: ACrzQf3Kxc8pvl+1Wt5RNSgURUpVNzpsAAYQQGl9cizyBxx2DmIH7mNd
	27aubkbDPrhiBUAmC2nsC+HSn/gIN1YZm+1TckU=
X-Google-Smtp-Source: AMsMyM6+CVH6i+RaybSIFV/eMGjherKckrV0YPe1VaHXHLEwx+IC7kRj7n1YAYEcdNdGl7KIQxUml0wp/GsmlsmG9p4=
X-Received: by 2002:a17:906:f854:b0:7ad:d196:9df with SMTP id
 ks20-20020a170906f85400b007add19609dfmr18523742ejb.295.1667428851903; Wed, 02
 Nov 2022 15:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221027083541.1757707-1-narpat.mali@windriver.com>
 <CANx9H-AzEchfTH796JGdD1AFRAa3zYD6wBDmWU3JYQiX+VVzvw@mail.gmail.com> <DM4PR11MB55501F0FED5A7469F5FC9009E4399@DM4PR11MB5550.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB55501F0FED5A7469F5FC9009E4399@DM4PR11MB5550.namprd11.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Nov 2022 15:40:41 -0700
Message-ID: <CANx9H-B2X748reADNACGu3ys+=qraG87qtnCiaj2wKVX=iN=Tg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 -> 1.2.0
To: Narpat Mali <narpat.mali@windriver.com>
Cc: Alexander Kanavin <alex@linutronix.de>, "G Pillai, Hari" <hari.gpillai@windriver.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	"Polampalli, Archana" <archana.polampalli@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000067f0b305ec84883e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 22:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172600

--00000000000067f0b305ec84883e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 2, 2022 at 8:21 AM Narpat Mali <narpat.mali@windriver.com>
wrote:

> Hi Tim,
>
>
>
> Actually, our product is based on =E2=80=9Ckirkstone=E2=80=9D branch in w=
hich the current
> version of python3-mako is 1.1.6 version.
>
> The* CVE-2022-40023 *has been fixed in python3-mako 1.2.2 version and
> this is the patch available on GitHub
> https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cf=
bd5be068c
>
>
>
> In *master* branch python3-mako is already been upgraded to 1.2.2
> version. We want the *CVE-2022-40023 *fix to be available on *kirkstone*
> branch so, I have sent patch request to upgrade python3-mako from 1.1.6 -=
>
> 1.2.0 , 1.2.0 -> 1.2.1 , & 1.2.1 -> 1.2.2 version.
>
>
It is the 1.1.6 to 1.2.0 upgrade that adds new =E2=80=9Cchanges=E2=80=9D. S=
o either you
make a strong case that the changes do not break ABI or you backport a fix
for the CVEs.

>
>
> Have also found that the version 1.2.2 doesn=E2=80=99t include any new fe=
ature as
> below.
> 1.2.2
>
> Released: Mon Aug 29 2022
> bug
>
>    - [bug] [lexer]
>
> Fixed issue in lexer where the regexp used to match tags would not
> correctly interpret quoted sections individually. While this parsing issu=
e
> still produced the same expected tag structure later on, the mis-handling
> of quoted sections was also subject to a regexp crash if a tag had a larg=
e
> number of quotes within its quoted sections. Credit to Sebastian Chnelik
> for locating the issue.
>
> As Mako templates inherently render and directly invoke arbitrary Python
> code from the template source, it is never appropriate to create
> templates that contain untrusted input.
>
> References: #366 <https://github.com/sqlalchemy/mako/issues/366>
>
>
>
>
>
> Shall I just backport this CVE-2022-40023 fix given in 1.2.2 version on
> python3-mako 1.1.6 version or what shall I do in this case ?
>
>
>
> Best Regards,
>
> Narpat
>
>
> ------------------------------
> *From:* Tim Orling <ticotimo@gmail.com>
> *Sent:* Tuesday, November 1, 2022 8:47:47 PM
> *To:* Mali, Narpat <Narpat.Mali@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Polampalli, Archana <
> Archana.Polampalli@windriver.com>; G Pillai, Hari <
> Hari.GPillai@windriver.com>; Alexander Kanavin <alex@linutronix.de>; Luca
> Ceresoli <luca.ceresoli@bootlin.com>
> *Subject:* Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade
> 1.1.6 -> 1.2.0
>
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> This would break stable policy as it includes new features:
>
> https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0
> <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/cha=
ngelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKE=
rqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$>
>
> 1.2.0
> <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/cha=
ngelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKE=
rqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$>
> Released: Thu Mar 10 2022 changed
> <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/cha=
ngelog.html*change-1.2.0-changed__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eK=
yaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABktopqva$>
>
>    -
>
>    *[changed] [py3k]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-0dbd75123f8119e63fdcc0a442bc5113__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
ggEv0XL$>
>
>    Corrected =E2=80=9Cuniversal wheel=E2=80=9D directive in setup.cfg so =
that building a
>    wheel does not target Python 2.
>
>    References: #351
>    <https://urldefense.com/v3/__https://github.com/sqlalchemy/mako/issues=
/351__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b=
7fl0FewZr1UlMEFq79SSZABkYd7YO7$>
>
>    -
>
>    *[changed] [py3k]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-8485f890cb72df59b5f3f4bf19db2252__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
qMiAt5y$>
>
>    The bytestring_passthrough template argument is removed, as this flag
>    only applied to Python 2.
>
>    -
>
>    *[changed] [py3k]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-2ce5a2bc81c4690be5216769085a6721__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
offi0Hd$>
>
>    With the removal of Python 2=E2=80=99s cStringIO, Mako now uses its ow=
n
>    internal FastEncodingBuffer exclusively.
>
>    -
>
>    *[changed] [py3k]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-54c870bfa9e0a339f1334434165e87ea__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
tghA8MK$>
>
>    Removed disable_unicode flag, that=E2=80=99s no longer used in Python =
3.
>
>    -
>
>    *[changed]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-0900c0303cb688a6d1702244e22320b2__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
qaskz-O$>
>
>    Refactored test utilities into mako.testing module. Removed
>    unittest.TestCase dependency in favor of pytest.
>
>    References: #349
>    <https://urldefense.com/v3/__https://github.com/sqlalchemy/mako/issues=
/349__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b=
7fl0FewZr1UlMEFq79SSZABkPlQz9_$>
>
>    -
>
>    *[changed] [setup]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-0007ecb822c473326561cd0f9d7cb35c__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
nq_f2Pr$>
>
>    Replaced the use of pkg_resources with the importlib library. For
>    Python < 3.8 the library importlib_metadata is used.
>
>    -
>
>    *[changed] [py3k]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-e9b48a2c87837a89fc445f43f2ea0b62__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
pS8HLCK$>
>
>    Removed support for Python 2 and Python 3.6. Mako now requires Python
>    >=3D 3.7.
>
>
> bug
> <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/cha=
ngelog.html*change-1.2.0-bug__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5=
bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABjjk2I2H$>
>
>    -
>
>    *[bug] [py3k]*
>    <https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-cc67f729bc0307e8fae39f27e355c7aa__;Iw!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
n1Bv5pn$>
>
>    Mako now performs exception chaining using raise from, correctly
>    identifying underlying exception conditions when it raises its own
>    exceptions. Pull request courtesy Ram Rachum.
>
>
> On Thu, Oct 27, 2022 at 1:38 AM Narpat Mali <narpat.mali@windriver.com>
> wrote:
>
> License-Update: copyright years
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Upstream master commit:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Df273900e846b8=
ac416c9d579db32a08c2f34141e
> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-co=
re/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f34141e__;!!AjveYdw8EvQ!dS=
MZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZAB=
iU1UtWG$>
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../python/{python3-mako_1.1.6.bb
> <https://urldefense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABqRMx25E$>
> =3D> python3-mako_1.2.0.bb
> <https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABtTOsCS_$>}
> | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb
> <https://urldefense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABqRMx25E$>
> =3D> python3-mako_1.2.0.bb
> <https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABtTOsCS_$>}
> (59%)
>
> diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> <https://urldefense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABqRMx25E$>
> b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> <https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABtTOsCS_$>
> similarity index 59%
> rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
> <https://urldefense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABqRMx25E$>
> rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
> <https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABtTOsCS_$>
> index 71e5d96ba1..11e5f326bd 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> <https://urldefense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABqRMx25E$>
> +++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> <https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ=
!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SS=
ZABtTOsCS_$>
> @@ -2,16 +2,18 @@ SUMMARY =3D "Templating library for Python"
>  HOMEPAGE =3D "http://www.makotemplates.org/
> <https://urldefense.com/v3/__http://www.makotemplates.org/__;!!AjveYdw8Ev=
Q!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79S=
SZABgBvHIC8$>
> "
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D943eb67718222db21d44a4ef18366=
75f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00a6a=
18d"
>
>  PYPI_PACKAGE =3D "Mako"
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D
> "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
> +SRC_URI[sha256sum] =3D
> "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
>
>  RDEPENDS:${PN} =3D "${PYTHON_PN}-html \
> +                  ${PYTHON_PN}-markupsafe \
>                    ${PYTHON_PN}-netclient \
> +                  ${PYTHON_PN}-pygments \
>                    ${PYTHON_PN}-threading \
>  "
>
> --
> 2.34.1
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172593):
> https://lists.openembedded.org/g/openembedded-core/message/172593
> Mute This Topic: https://lists.openembedded.org/mt/94600007/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000067f0b305ec84883e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 2, 2022 at 8:21 AM Narpat Mali &lt;<a href=3D"m=
ailto:narpat.mali@windriver.com">narpat.mali@windriver.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:brea=
k-word">
<div class=3D"m_-1127688351980422530WordSection1">
<p class=3D"MsoNormal">Hi Tim,</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Actually, our product is based on =E2=80=9Ckirkstone=
=E2=80=9D branch in which the current version of python3-mako is 1.1.6 vers=
ion.</p>
<p class=3D"MsoNormal">The<b> CVE-2022-40023 </b>has been fixed in python3-=
mako 1.2.2 version and this is the patch available on GitHub
<a href=3D"https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e=
9dd1fd9cfbd5be068c" target=3D"_blank">
https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd=
5be068c</a></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">In <b>master</b> branch python3-mako is already been=
 upgraded to 1.2.2 version. We want the
<b>CVE-2022-40023 </b>fix to be available on <b>kirkstone</b> branch so, I =
have sent patch request to upgrade python3-mako from 1.1.6 -&gt; 1.2.0 , 1.=
2.0 -&gt; 1.2.1 , &amp; 1.2.1 -&gt; 1.2.2 version.</p>
<p class=3D"MsoNormal"><u></u></p></div></div></blockquote><div dir=3D"auto=
"><br></div><div dir=3D"auto">It is the 1.1.6 to 1.2.0 upgrade that adds ne=
w =E2=80=9Cchanges=E2=80=9D. So either you make a strong case that the chan=
ges do not break ABI or you backport a fix for the CVEs.</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=
=3D"word-wrap:break-word"><div class=3D"m_-1127688351980422530WordSection1"=
><p class=3D"MsoNormal" dir=3D"auto">=C2=A0<u></u></p>
<p class=3D"MsoNormal">Have also found that the version 1.2.2 doesn=E2=80=
=99t include any new feature as below.</p>
<div>
<h3><span style=3D"font-size:15.5pt;font-family:&quot;Tahoma&quot;,sans-ser=
if">1.2.2<u></u><u></u></span></h3>
<p class=3D"MsoNormal">Released: Mon Aug 29 2022<u></u><u></u></p>
<h4><span style=3D"font-family:&quot;Tahoma&quot;,sans-serif">bug<u></u><u>=
</u></span></h4>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal"><code><span style=3D"font-size:10.0pt">[bug] [lexer=
]</span></code><strong><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif">=C2=A0</span></strong><u></u><u></u></li></ul>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt">Fixed issue in lexer wh=
ere the regexp used to match tags would not correctly interpret quoted sect=
ions individually. While this parsing issue still produced the same expecte=
d tag structure later on, the mis-handling
 of quoted sections was also subject to a regexp crash if a tag had a large=
 number of quotes within its quoted sections. Credit to Sebastian Chnelik f=
or locating the issue.</p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt">As Mako templates inher=
ently render and directly invoke arbitrary Python code from the template so=
urce, it is=C2=A0<code><span style=3D"font-size:10.0pt">never</span></code>=
=C2=A0appropriate to create templates that contain
 untrusted input.</p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt">References:=C2=A0<a hre=
f=3D"https://github.com/sqlalchemy/mako/issues/366" target=3D"_blank"><span=
 class=3D"m_-1127688351980422530Heading4Char"><span style=3D"font-size:12.0=
pt;color:windowtext;text-decoration:none">#366</span></span></a><u></u><u><=
/u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Shall I just backport this CVE-2022-40023 fix given =
in 1.2.2 version on python3-mako 1.1.6 version or what shall I do in this c=
ase ?</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-1127688351980422530divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">tic=
otimo@gmail.com</a>&gt;<br>
<b>Sent:</b> Tuesday, November 1, 2022 8:47:47 PM<br>
<b>To:</b> Mali, Narpat &lt;<a href=3D"mailto:Narpat.Mali@windriver.com" ta=
rget=3D"_blank">Narpat.Mali@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;; Polampalli, Archana &lt;<a href=3D=
"mailto:Archana.Polampalli@windriver.com" target=3D"_blank">Archana.Polampa=
lli@windriver.com</a>&gt;; G Pillai, Hari &lt;<a href=3D"mailto:Hari.GPilla=
i@windriver.com" target=3D"_blank">Hari.GPillai@windriver.com</a>&gt;; Alex=
ander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">a=
lex@linutronix.de</a>&gt;; Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresol=
i@bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1=
.1.6 -&gt; 1.2.0</font>
<div>=C2=A0</div>
</div>
<div>
<p></p>
<div style=3D"border:solid #9c6500 1.0pt;padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p style=3D"line-height:12.0pt;background:#ffeb9c"><b><span style=3D"font-s=
ize:10.0pt;color:#9c6500"></span></b><span style=3D"font-size:10.0pt;color:=
red">[Please note: This e-mail is from an EXTERNAL e-mail address]</span></=
p>
</div></div></div><div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=
=3D"word-wrap:break-word"><div>
<div>
<div dir=3D"ltr">
<div>This would break stable policy as it includes new features:</div>
<div><br>
</div>
<div><a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/=
en/latest/changelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aS=
ur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$" target=
=3D"_blank">https://docs.makotemplates.org/en/latest/changelog.html#change-=
1.2.0</a></div>
<div><br>
</div>
<div>
<h3>1.2.0<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.=
org/en/latest/changelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFx=
B5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$" tit=
le=3D"Permalink to this heading" target=3D"_blank"></a></h3>
Released: Thu Mar 10 2022
<h4>changed<a href=3D"https://urldefense.com/v3/__https://docs.makotemplate=
s.org/en/latest/changelog.html*change-1.2.0-changed__;Iw!!AjveYdw8EvQ!dSMZx=
nosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkto=
pqva$" title=3D"Permalink to this heading" target=3D"_blank"></a></h4>
<ul>
<li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-0"><span id=3D"m_-11276=
88351980422530x_gmail-change-0dbd75123f8119e63fdcc0a442bc5113"><strong>[cha=
nged] [py3k]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-0dbd75123f8119e63fdcc0a442bc5113__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABggEv0XL$" target=3D"_blank">
</a></span></p>
<p>Corrected =E2=80=9Cuniversal wheel=E2=80=9D directive in <code>
<span>setup.cfg</span></code> so that building a wheel does not target Pyth=
on 2.</p>
<p>References: <a href=3D"https://urldefense.com/v3/__https://github.com/sq=
lalchemy/mako/issues/351__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErq=
H3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkYd7YO7$" target=3D"_blank">
#351</a></p>
<p></p>
</li><li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-1"><span id=3D"m_-11276=
88351980422530x_gmail-change-8485f890cb72df59b5f3f4bf19db2252"><strong>[cha=
nged] [py3k]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-8485f890cb72df59b5f3f4bf19db2252__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABqMiAt5y$" target=3D"_blank">
</a></span></p>
<p>The <code><span>bytestring_passthrough</span></code> template argument i=
s removed, as this flag only applied to Python 2.</p>
<p></p>
<p></p>
</li><li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-2"><span id=3D"m_-11276=
88351980422530x_gmail-change-2ce5a2bc81c4690be5216769085a6721"><strong>[cha=
nged] [py3k]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-2ce5a2bc81c4690be5216769085a6721__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABoffi0Hd$" target=3D"_blank">
</a></span></p>
<p>With the removal of Python 2=E2=80=99s <code>
<span>cStringIO</span></code>, Mako now uses its own internal
<code><span>FastEncodingBuffer</span></code> exclusively.</p>
<p></p>
<p></p>
</li><li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-3"><span id=3D"m_-11276=
88351980422530x_gmail-change-54c870bfa9e0a339f1334434165e87ea"><strong>[cha=
nged] [py3k]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-54c870bfa9e0a339f1334434165e87ea__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABtghA8MK$" target=3D"_blank">
</a></span></p>
<p>Removed <code><span>disable_unicode</span></code> flag, that=E2=80=99s n=
o longer used in Python 3.</p>
<p></p>
<p></p>
</li><li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-4"><span id=3D"m_-11276=
88351980422530x_gmail-change-0900c0303cb688a6d1702244e22320b2"><strong>[cha=
nged]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-0900c0303cb688a6d1702244e22320b2__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABqaskz-O$" target=3D"_blank">
</a></span></p>
<p>Refactored test utilities into <code>
<span>mako.testing</span></code> module. Removed <code>
<span>unittest.TestCase</span></code> dependency in favor of <code>
<span>pytest</span></code>.</p>
<p>References: <a href=3D"https://urldefense.com/v3/__https://github.com/sq=
lalchemy/mako/issues/349__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErq=
H3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkPlQz9_$" target=3D"_blank">
#349</a></p>
<p></p>
</li><li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-5"><span id=3D"m_-11276=
88351980422530x_gmail-change-0007ecb822c473326561cd0f9d7cb35c"><strong>[cha=
nged] [setup]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-0007ecb822c473326561cd0f9d7cb35c__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABnq_f2Pr$" target=3D"_blank">
</a></span></p>
<p>Replaced the use of <code>
<span>pkg_resources</span></code> with the <code>
<span>importlib</span></code> library. For Python &lt; 3.8 the library
<code><span>importlib_metadata</span></code> is used.</p>
<p></p>
<p></p>
</li><li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-6"><span id=3D"m_-11276=
88351980422530x_gmail-change-e9b48a2c87837a89fc445f43f2ea0b62"><strong>[cha=
nged] [py3k]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-e9b48a2c87837a89fc445f43f2ea0b62__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABpS8HLCK$" target=3D"_blank">
</a></span></p>
<p>Removed support for Python 2 and Python 3.6. Mako now requires Python &g=
t;=3D 3.7.</p>
<p></p>
<p></p>
</li></ul>
<h4>bug<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.or=
g/en/latest/changelog.html*change-1.2.0-bug__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wg=
FxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABjjk2I2H$" t=
itle=3D"Permalink to this heading" target=3D"_blank"></a></h4>
<ul>
<li>
<p id=3D"m_-1127688351980422530x_gmail-change-1.2.0-7"><span id=3D"m_-11276=
88351980422530x_gmail-change-cc67f729bc0307e8fae39f27e355c7aa"><strong>[bug=
] [py3k]</strong>
<a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/la=
test/changelog.html*change-cc67f729bc0307e8fae39f27e355c7aa__;Iw!!AjveYdw8E=
vQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79=
SSZABn1Bv5pn$" target=3D"_blank">
</a></span></p>
<p>Mako now performs exception chaining using <code>
<span>raise</span> <span>from</span></code>, correctly identifying underlyi=
ng exception conditions when it raises its own exceptions. Pull request cou=
rtesy Ram Rachum.</p>
</li></ul>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Oct 27, 2022 at 1:38 AM Narpat Mali &lt;<a href=3D=
"mailto:narpat.mali@windriver.com" target=3D"_blank">narpat.mali@windriver.=
com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
License-Update: copyright years<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
Upstream master commit:<br>
<a href=3D"https://urldefense.com/v3/__https://git.openembedded.org/openemb=
edded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f34141e__;!!AjveYd=
w8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEF=
q79SSZABiU1UtWG$" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f3=
4141e</a><br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"https://urldefense.com/v3/__http://python3-mak=
o_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDI=
a09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"noreferrer" target=3D"_blank"=
>python3-mako_1.1.6.bb</a> =3D&gt;
<a href=3D"https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!Ajv=
eYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1Ul=
MEFq79SSZABtTOsCS_$" rel=3D"noreferrer" target=3D"_blank">
python3-mako_1.2.0.bb</a>} | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"https://urldefense.co=
m/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9e=
KyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"nore=
ferrer" target=3D"_blank">python3-mako_1.1.6.bb</a>
 =3D&gt; <a href=3D"https://urldefense.com/v3/__http://python3-mako_1.2.0.b=
b__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl=
0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferrer" target=3D"_blank">
python3-mako_1.2.0.bb</a>} (59%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"https://urldefense.com=
/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eK=
yaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"noref=
errer" target=3D"_blank">python3-mako_1.1.6.bb</a>
 b/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__http=
://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErq=
H3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferrer" tar=
get=3D"_blank">python3-mako_1.2.0.bb</a><br>
similarity index 59%<br>
rename from meta/recipes-devtools/python/<a href=3D"https://urldefense.com/=
v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKy=
aZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"norefe=
rrer" target=3D"_blank">python3-mako_1.1.6.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3=
/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ=
5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferr=
er" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
index 71e5d96ba1..11e5f326bd 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__h=
ttp://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLK=
ErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"noreferrer" =
target=3D"_blank">python3-mako_1.1.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__h=
ttp://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLK=
ErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferrer" =
target=3D"_blank">python3-mako_1.2.0.bb</a><br>
@@ -2,16 +2,18 @@ SUMMARY =3D &quot;Templating library for Python&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com/v3/__http://www.=
makotemplates.org/__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phOD=
yQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABgBvHIC8$" rel=3D"noreferrer" target=3D=
"_blank">http://www.makotemplates.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D943eb67718222db21d44a4ef18=
36675f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00=
a6a18d&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Mako&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4e9e345a41924a954251b95b4b28e14a301145b544901=
332e658907a7464b6b2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9a7c7e922b87db3686210cf49d5d767033a41d4010b28=
4e747682c92bddd8b39&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-html \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-markupsafe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-netclient \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-pygments \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-threading \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div></div><div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"wo=
rd-wrap:break-word"><div></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172593): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172593" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172593</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94600007/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94600007/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000067f0b305ec84883e--


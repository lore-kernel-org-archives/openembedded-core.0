Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10307CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 09:01:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.13635.1760950872549135797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 02:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EOCSLyVZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5C213C0AFE3
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 09:00:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD5EB606D5;
	Mon, 20 Oct 2025 09:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DB70102F23AD;
	Mon, 20 Oct 2025 11:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760950865; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MBHxyzD5c+9VeaEdopmCMjjFtCWFaeRLu1uAbKjf3QE=;
	b=EOCSLyVZrM98aIUZ8jthExl0MQ2V7FRavjhA7j0fJ7RBRWeUyq2bM0LQ3znRLFJLkKa89S
	Gpg9RgLeezb/M5l2BWh9+GGPHdSxoC/80P2BhauGghxSHhuxtJNbKhx4ZXjs+B7pUjwf7k
	75dQslIFzqJd3Paz/z2wLebjUPTGzF157ZofBZ1rJDm2NR+pAb9Do9FrMxygs8EQsVH3Ps
	P4DRpUm1EW25wZoKCjDTquBYVcQjDl78ctCyXr867Ppa70Nm677tsrHhaNIzsAXlEog60Z
	kXCJULW+t/4try3IfN4nCaZ4aqYqIoWIRRxM/s/fCB+CF/RLYaNqdw4KNZAE1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 11:01:02 +0200
Message-Id: <DDN0ZE7GF8AL.1DP2ESROPJC0M@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] common-licenses: update to SPDX license
 list v3.27
Cc: "hongxu" <hongxu.jia@eng.windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251017131627.3049096-1-ross.burton@arm.com>
In-Reply-To: <20251017131627.3049096-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 09:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225111

On Fri Oct 17, 2025 at 3:16 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Use scripts/pull-sdpx-licenses.py to refresh the license list and add
> any new licenses that we previously did not have license texts for.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I get a lot of conflicts on the spdx-licenses.json file, because of
Hongxu patch:
spdx-licenses.json: Update to SPDX license version 3.27.0
Message-ID: <20251015050747.211069-1-hongxu.jia@windriver.com>

I'm not really familiar about what is done here, are both patches
needed? In that case Ross, can you rebase on Hongxu patch please? Or is
there any way I can easily fix the conflicts?

Thanks,
Mathieu

>  meta/files/common-licenses/Artistic-dist      |  125 ++
>  meta/files/common-licenses/Aspell-RU          |    4 +
>  .../BSD-2-Clause-pkgconf-disclaimer           |   15 +
>  .../common-licenses/Boehm-GC-without-fee      |   14 +
>  meta/files/common-licenses/CC-PDM-1.0         |   27 +
>  meta/files/common-licenses/CC-SA-1.0          |  198 ++
>  meta/files/common-licenses/CryptoSwift        |   11 +
>  meta/files/common-licenses/DocBook-DTD        |   24 +
>  meta/files/common-licenses/DocBook-Schema     |   22 +
>  meta/files/common-licenses/DocBook-Stylesheet |   13 +
>  meta/files/common-licenses/FSFULLRSD          |    4 +
>  meta/files/common-licenses/FSL-1.1-ALv2       |  105 +
>  meta/files/common-licenses/FSL-1.1-MIT        |  110 +
>  .../common-licenses/Game-Programming-Gems     |    8 +
>  meta/files/common-licenses/HDF5               |   96 +
>  meta/files/common-licenses/HIDAPI             |    2 +
>  meta/files/common-licenses/HPND-Netrek        |   10 +
>  meta/files/common-licenses/InnoSetup          |   27 +
>  meta/files/common-licenses/MIPS               |    4 +
>  meta/files/common-licenses/MIT-Click          |   30 +
>  meta/files/common-licenses/NTIA-PD            |   13 +
>  meta/files/common-licenses/Ruby-pty           |   10 +
>  meta/files/common-licenses/SMAIL-GPL          |  144 ++
>  meta/files/common-licenses/SOFA               |   90 +
>  meta/files/common-licenses/SUL-1.0            |   73 +
>  .../common-licenses/Sendmail-Open-Source-1.1  |   75 +
>  meta/files/common-licenses/ThirdEye           |    7 +
>  meta/files/common-licenses/TrustedQSL         |   58 +
>  meta/files/common-licenses/Ubuntu-font-1.0    |   96 +
>  .../files/common-licenses/Unlicense-libtelnet |    1 +
>  .../common-licenses/Unlicense-libwhirlpool    |    8 +
>  meta/files/common-licenses/X11-swapped        |   23 +
>  .../common-licenses/any-OSI-perl-modules      |   11 +
>  meta/files/common-licenses/generic-xts        |   17 +
>  meta/files/common-licenses/jove               |    4 +
>  meta/files/common-licenses/libpng-1.6.35      |   96 +
>  meta/files/common-licenses/man2html           |    2 +
>  meta/files/common-licenses/ngrep              |   38 +
>  meta/files/common-licenses/wwl                |    5 +
>  meta/files/spdx-licenses.json                 | 1836 +++++++++++------
>  40 files changed, 2786 insertions(+), 670 deletions(-)
>  create mode 100644 meta/files/common-licenses/Artistic-dist
>  create mode 100644 meta/files/common-licenses/Aspell-RU
>  create mode 100644 meta/files/common-licenses/BSD-2-Clause-pkgconf-discl=
aimer
>  create mode 100644 meta/files/common-licenses/Boehm-GC-without-fee
>  create mode 100644 meta/files/common-licenses/CC-PDM-1.0
>  create mode 100644 meta/files/common-licenses/CC-SA-1.0
>  create mode 100644 meta/files/common-licenses/CryptoSwift
>  create mode 100644 meta/files/common-licenses/DocBook-DTD
>  create mode 100644 meta/files/common-licenses/DocBook-Schema
>  create mode 100644 meta/files/common-licenses/DocBook-Stylesheet
>  create mode 100644 meta/files/common-licenses/FSFULLRSD
>  create mode 100644 meta/files/common-licenses/FSL-1.1-ALv2
>  create mode 100644 meta/files/common-licenses/FSL-1.1-MIT
>  create mode 100644 meta/files/common-licenses/Game-Programming-Gems
>  create mode 100644 meta/files/common-licenses/HDF5
>  create mode 100644 meta/files/common-licenses/HIDAPI
>  create mode 100644 meta/files/common-licenses/HPND-Netrek
>  create mode 100644 meta/files/common-licenses/InnoSetup
>  create mode 100644 meta/files/common-licenses/MIPS
>  create mode 100644 meta/files/common-licenses/MIT-Click
>  create mode 100644 meta/files/common-licenses/NTIA-PD
>  create mode 100644 meta/files/common-licenses/Ruby-pty
>  create mode 100644 meta/files/common-licenses/SMAIL-GPL
>  create mode 100644 meta/files/common-licenses/SOFA
>  create mode 100644 meta/files/common-licenses/SUL-1.0
>  create mode 100644 meta/files/common-licenses/Sendmail-Open-Source-1.1
>  create mode 100644 meta/files/common-licenses/ThirdEye
>  create mode 100644 meta/files/common-licenses/TrustedQSL
>  create mode 100644 meta/files/common-licenses/Ubuntu-font-1.0
>  create mode 100644 meta/files/common-licenses/Unlicense-libtelnet
>  create mode 100644 meta/files/common-licenses/Unlicense-libwhirlpool
>  create mode 100644 meta/files/common-licenses/X11-swapped
>  create mode 100644 meta/files/common-licenses/any-OSI-perl-modules
>  create mode 100644 meta/files/common-licenses/generic-xts
>  create mode 100644 meta/files/common-licenses/jove
>  create mode 100644 meta/files/common-licenses/libpng-1.6.35
>  create mode 100644 meta/files/common-licenses/man2html
>  create mode 100644 meta/files/common-licenses/ngrep
>  create mode 100644 meta/files/common-licenses/wwl
>
> diff --git a/meta/files/common-licenses/Artistic-dist b/meta/files/common=
-licenses/Artistic-dist
> new file mode 100644
> index 00000000000..ff0b79e470a
> --- /dev/null
> +++ b/meta/files/common-licenses/Artistic-dist
> @@ -0,0 +1,125 @@
> +The "Artistic License"
> +=20
> +                             Preamble
> +=20
> +The intent of this document is to state the conditions under which a
> +Package may be copied, such that the Copyright Holder maintains some
> +semblance of artistic control over the development of the Package,
> +while giving the users of the package the right to use and distribute
> +the Package in a more-or-less customary fashion, plus the right to make
> +reasonable modifications.
> +=20
> +It also grants you the rights to reuse parts of a Package in your own
> +programs without transferring this License to those programs, provided
> +that you meet some reasonable requirements.
> +=20
> +Definitions:
> +=20
> +        "Package" refers to the collection of files distributed by the
> +        Copyright Holder, and derivatives of that collection of files
> +        created through textual modification.
> +=20
> +        "Standard Version" refers to such a Package if it has not been
> +        modified, or has been modified in accordance with the wishes
> +        of the Copyright Holder as specified below.
> +=20
> +        "Copyright Holder" is whoever is named in the copyright or
> +        copyrights for the package.
> +=20
> +        "You" is you, if you're thinking about copying or distributing
> +        this Package.
> +=20
> +        "Reasonable copying fee" is whatever you can justify on the
> +        basis of media cost, duplication charges, time of people involve=
d,
> +        and so on.  (You will not be required to justify it to the
> +        Copyright Holder, but only to the computing community at large
> +        as a market that must bear the fee.)
> +=20
> +        "Freely Available" means that no fee is charged for the item
> +        itself, though there may be fees involved in handling the item.
> +        It also means that recipients of the item may redistribute it
> +        under the same conditions they received it.
> +=20
> +1. You may make and give away verbatim copies of the source form of the
> +Standard Version of this Package without restriction, provided that you
> +duplicate all of the original copyright notices and associated disclaime=
rs.
> +=20
> +2. You may apply bug fixes, portability fixes and other modifications
> +derived from the Public Domain or from the Copyright Holder.  A Package
> +modified in such a way shall still be considered the Standard Version.
> +=20
> +3. You may otherwise modify your copy of this Package in any way, provid=
ed
> +that you insert a prominent notice in each changed file stating how and
> +when you changed that file, and provided that you do at least ONE of the
> +following:
> +=20
> +    a) place your modifications in the Public Domain or otherwise make t=
hem
> +    Freely Available, such as by posting said modifications to Usenet or
> +    an equivalent medium, or placing the modifications on a major archiv=
e
> +    site such as uunet.uu.net, or by allowing the Copyright Holder to in=
clude
> +    your modifications in the Standard Version of the Package.
> +=20
> +    b) use the modified Package only within your corporation or organiza=
tion.
> +=20
> +    c) rename any non-standard executables so the names do not conflict
> +    with standard executables, which must also be provided, and provide
> +    a separate manual page for each non-standard executable that clearly
> +    documents how it differs from the Standard Version.
> +=20
> +    d) make other distribution arrangements with the Copyright Holder.
> +=20
> +4. You may distribute the programs of this Package in object code or
> +executable form, provided that you do at least ONE of the following:
> +=20
> +    a) distribute a Standard Version of the executables and library file=
s,
> +    together with instructions (in the manual page or equivalent) on whe=
re
> +    to get the Standard Version.
> +=20
> +    b) accompany the distribution with the machine-readable source of
> +    the Package with your modifications.
> +=20
> +    c) give non-standard executables non-standard names, and clearly
> +    document the differences in manual pages (or equivalent), together
> +    with instructions on where to get the Standard Version.
> +=20
> +    d) make other distribution arrangements with the Copyright Holder.
> +=20
> +5. You may charge a reasonable copying fee for any distribution of this
> +Package.  You may charge any fee you choose for support of this
> +Package.  You may not charge a fee for this Package itself.  However,
> +you may distribute this Package in aggregate with other (possibly
> +commercial) programs as part of a larger (possibly commercial) software
> +distribution provided that you do not advertise this Package as a
> +product of your own.
> +=20
> +6. The scripts and library files supplied as input to or produced as
> +output from the programs of this Package do not automatically fall
> +under the copyright of this Package, but belong to whoever generated
> +them, and may be sold commercially, and may be aggregated with this
> +Package.  If such scripts or library files are aggregated with this
> +Package via the so-called "undump" or "unexec" methods of producing a
> +binary executable image, then distribution of such an image shall
> +neither be construed as a distribution of this Package nor shall it
> +fall under the restrictions of Paragraphs 3 and 4, provided that you do
> +not represent such an executable image as a Standard Version of this
> +Package.
> +=20
> +7. You may reuse parts of this Package in your own programs, provided th=
at
> +you explicitly state where you got them from, in the source code (and, l=
eft
> +to your courtesy, in the documentation), duplicating all the associated
> +copyright notices and disclaimers. Besides your changes, if any, must be
> +clearly marked as such. Parts reused that way will no longer fall under =
this
> +license if, and only if, the name of your program(s) have no immediate
> +connection with the name of the Package itself or its associated program=
s.
> +You may then apply whatever restrictions you wish on the reused parts or
> +choose to place them in the Public Domain--this will apply only within t=
he
> +context of your package.
> +=20
> +8. The name of the Copyright Holder may not be used to endorse or promot=
e
> +products derived from this software without specific prior written permi=
ssion.
> +=20
> +9. THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
> +IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
> +WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> +
> +THE END
> diff --git a/meta/files/common-licenses/Aspell-RU b/meta/files/common-lic=
enses/Aspell-RU
> new file mode 100644
> index 00000000000..5cec17629b7
> --- /dev/null
> +++ b/meta/files/common-licenses/Aspell-RU
> @@ -0,0 +1,4 @@
> +Permission to use, copy, redistribute is granted.
> +Permission to redistribute modifications in patch form is granted.
> +Permission to redistribute binaries made of modified sources is granted.
> +All other rights reserved.
> diff --git a/meta/files/common-licenses/BSD-2-Clause-pkgconf-disclaimer b=
/meta/files/common-licenses/BSD-2-Clause-pkgconf-disclaimer
> new file mode 100644
> index 00000000000..4c3b8ae80e7
> --- /dev/null
> +++ b/meta/files/common-licenses/BSD-2-Clause-pkgconf-disclaimer
> @@ -0,0 +1,15 @@
> +Copyright =C2=A9 2001-2025 Audacious developers and others
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are m=
et:
> +
> +1. Redistributions of source code must retain the above copyright notice=
,
> +   this list of conditions, and the following disclaimer.
> +
> +2. Redistributions in binary form must reproduce the above copyright not=
ice,
> +   this list of conditions, and the following disclaimer in the
> +   documentation provided with the distribution.
> +
> +This software is provided =E2=80=9Cas is=E2=80=9D and without any warran=
ty, express or
> +implied.  In no event shall the authors be liable for any damages arisin=
g
> +from the use of this software.
> diff --git a/meta/files/common-licenses/Boehm-GC-without-fee b/meta/files=
/common-licenses/Boehm-GC-without-fee
> new file mode 100644
> index 00000000000..354d47017e2
> --- /dev/null
> +++ b/meta/files/common-licenses/Boehm-GC-without-fee
> @@ -0,0 +1,14 @@
> +Copyright (c)  2000
> +SWsoft  company
> +
> +Modifications copyright (c) 2001, 2013. Oracle and/or its affiliates.
> +All rights reserved.
> +
> +This material is provided "as is", with absolutely no warranty expressed
> +or implied. Any use is at your own risk.
> +
> +Permission to use or copy this software for any purpose is hereby grante=
d
> +without fee, provided the above notices are retained on all copies.
> +Permission to modify the code and to distribute modified code is granted=
,
> +provided the above notices are retained, and a notice that the code was
> +modified is included with the above copyright notice.
> diff --git a/meta/files/common-licenses/CC-PDM-1.0 b/meta/files/common-li=
censes/CC-PDM-1.0
> new file mode 100644
> index 00000000000..1dc4e63b874
> --- /dev/null
> +++ b/meta/files/common-licenses/CC-PDM-1.0
> @@ -0,0 +1,27 @@
> +No Copyright
> +
> +This work has been identified as being free of known restrictions under
> +copyright law, including all related and neighboring rights.
> +
> +
> +You can copy, modify, distribute and perform the work, even for commerci=
al
> +purposes, all without asking permission. See Other Information below.
> +
> +Other Information
> +
> +The work may not be free of known copyright restrictions in all jurisdic=
tions .
> +
> +Persons may have other rights in or related to the work, such as patent =
or
> +trademark rights, and others may have rights in how the work is used, su=
ch as
> +publicity or privacy rights.
> +
> +In some jurisdictions moral rights of the author may persist beyond the =
term of
> +copyright. These rights may include the right to be identified as the au=
thor
> +and the right to object to derogatory treatments.
> +
> +Unless expressly stated otherwise, the person who identified the work ma=
kes no
> +warranties about the work, and disclaims liability for all uses of the w=
ork, to
> +the fullest extent permitted by applicable law.
> +
> +When using or citing the work, you should not imply endorsement by the a=
uthor
> +or the person who identified the work.
> diff --git a/meta/files/common-licenses/CC-SA-1.0 b/meta/files/common-lic=
enses/CC-SA-1.0
> new file mode 100644
> index 00000000000..1a810feaec2
> --- /dev/null
> +++ b/meta/files/common-licenses/CC-SA-1.0
> @@ -0,0 +1,198 @@
> +                          Creative Commons Legal Code
> +
> +                                ShareAlike 1.0
> +
> +CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGA=
L
> +SERVICES. DISTRIBUTION OF THIS DRAFT LICENSE DOES NOT CREATE AN ATTORNEY=
-CLIENT
> +RELATIONSHIP. CREATIVE COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" B=
ASIS.
> +CREATIVE COMMONS MAKES NO WARRANTIES REGARDING THE INFORMATION PROVIDED,=
 AND
> +DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM ITS USE.
> +
> +License
> +
> +THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE
> +COMMONS PUBLIC LICENSE ("CCPL" OR "LICENSE"). THE WORK IS PROTECTED BY
> +COPYRIGHT AND/OR OTHER APPLICABLE LAW. ANY USE OF THE WORK OTHER THAN AS
> +AUTHORIZED UNDER THIS LICENSE IS PROHIBITED.
> +
> +BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE=
 TO BE
> +BOUND BY THE TERMS OF THIS LICENSE. THE LICENSOR GRANTS YOU THE RIGHTS
> +CONTAINED HERE IN CONSIDERATION OF YOUR ACCEPTANCE OF SUCH TERMS AND
> +CONDITIONS.
> +
> +1. Definitions
> +
> + a. "Collective Work" means a work, such as a periodical issue, antholog=
y or
> +    encyclopedia, in which the Work in its entirety in unmodified form, =
along
> +    with a number of other contributions, constituting separate and inde=
pendent
> +    works in themselves, are assembled into a collective whole. A work t=
hat
> +    constitutes a Collective Work will not be considered a Derivative Wo=
rk (as
> +    defined below) for the purposes of this License.
> + b. "Derivative Work" means a work based upon the Work or upon the Work =
and
> +    other pre-existing works, such as a translation, musical arrangement=
,
> +    dramatization, fictionalization, motion picture version, sound recor=
ding,
> +    art reproduction, abridgment, condensation, or any other form in whi=
ch the
> +    Work may be recast, transformed, or adapted, except that a work that
> +    constitutes a Collective Work will not be considered a Derivative Wo=
rk for
> +    the purpose of this License.
> + c. "Licensor" means the individual or entity that offers the Work under=
 the
> +    terms of this License.
> + d. "Original Author" means the individual or entity who created the Wor=
k.
> + e. "Work" means the copyrightable work of authorship offered under the =
terms
> +    of this License.
> + f. "You" means an individual or entity exercising rights under this Lic=
ense
> +    who has not previously violated the terms of this License with respe=
ct to
> +    the Work, or who has received express permission from the Licensor t=
o
> +    exercise rights under this License despite a previous violation.
> +
> +2. Fair Use Rights. Nothing in this license is intended to reduce, limit=
, or
> +restrict any rights arising from fair use, first sale or other limitatio=
ns on
> +the exclusive rights of the copyright owner under copyright law or other
> +applicable laws.
> +
> +3. License Grant. Subject to the terms and conditions of this License, L=
icensor
> +hereby grants You a worldwide, royalty-free, non-exclusive, perpetual (f=
or the
> +duration of the applicable copyright) license to exercise the rights in =
the
> +Work as stated below:
> +
> + a. to reproduce the Work, to incorporate the Work into one or more Coll=
ective
> +    Works, and to reproduce the Work as incorporated in the Collective W=
orks;
> + b. to create and reproduce Derivative Works;
> + c. to distribute copies or phonorecords of, display publicly, perform
> +    publicly, and perform publicly by means of a digital audio transmiss=
ion the
> +    Work including as incorporated in Collective Works;
> + d. to distribute copies or phonorecords of, display publicly, perform
> +    publicly, and perform publicly by means of a digital audio transmiss=
ion
> +    Derivative Works;
> +
> +The above rights may be exercised in all media and formats whether now k=
nown or
> +hereafter devised. The above rights include the right to make such
> +modifications as are technically necessary to exercise the rights in oth=
er
> +media and formats. All rights not expressly granted by Licensor are here=
by
> +reserved.
> +
> +4. Restrictions. The license granted in Section 3 above is expressly mad=
e
> +subject to and limited by the following restrictions:
> +
> + a. You may distribute, publicly display, publicly perform, or publicly
> +    digitally perform the Work only under the terms of this License, and=
 You
> +    must include a copy of, or the Uniform Resource Identifier for, this
> +    License with every copy or phonorecord of the Work You distribute, p=
ublicly
> +    display, publicly perform, or publicly digitally perform. You may no=
t offer
> +    or impose any terms on the Work that alter or restrict the terms of =
this
> +    License or the recipients' exercise of the rights granted hereunder.=
 You
> +    may not sublicense the Work. You must keep intact all notices that r=
efer to
> +    this License and to the disclaimer of warranties. You may not distri=
bute,
> +    publicly display, publicly perform, or publicly digitally perform th=
e Work
> +    with any technological measures that control access or use of the Wo=
rk in a
> +    manner inconsistent with the terms of this License Agreement. The ab=
ove
> +    applies to the Work as incorporated in a Collective Work, but this d=
oes not
> +    require the Collective Work apart from the Work itself to be made su=
bject
> +    to the terms of this License. If You create a Collective Work, upon =
notice
> +    from any Licensor You must, to the extent practicable, remove from t=
he
> +    Collective Work any reference to such Licensor or the Original Autho=
r, as
> +    requested. If You create a Derivative Work, upon notice from any Lic=
ensor
> +    You must, to the extent practicable, remove from the Derivative Work=
 any
> +    reference to such Licensor or the Original Author, as requested.
> + b. You may distribute, publicly display, publicly perform, or publicly
> +    digitally perform a Derivative Work only under the terms of this Lic=
ense,
> +    and You must include a copy of, or the Uniform Resource Identifier f=
or,
> +    this License with every copy or phonorecord of each Derivative Work =
You
> +    distribute, publicly display, publicly perform, or publicly digitall=
y
> +    perform. You may not offer or impose any terms on the Derivative Wor=
ks that
> +    alter or restrict the terms of this License or the recipients' exerc=
ise of
> +    the rights granted hereunder, and You must keep intact all notices t=
hat
> +    refer to this License and to the disclaimer of warranties. You may n=
ot
> +    distribute, publicly display, publicly perform, or publicly digitall=
y
> +    perform the Derivative Work with any technological measures that con=
trol
> +    access or use of the Work in a manner inconsistent with the terms of=
 this
> +    License Agreement. The above applies to the Derivative Work as incor=
porated
> +    in a Collective Work, but this does not require the Collective Work =
apart
> +    from the Derivative Work itself to be made subject to the terms of t=
his
> +    License.
> +
> +5. Representations, Warranties and Disclaimer
> +
> + a. By offering the Work for public release under this License, Licensor
> +    represents and warrants that, to the best of Licensor's knowledge af=
ter
> +    reasonable inquiry:
> +     i. Licensor has secured all rights in the Work necessary to grant t=
he
> +        license rights hereunder and to permit the lawful exercise of th=
e
> +        rights granted hereunder without You having any obligation to pa=
y any
> +        royalties, compulsory license fees, residuals or any other payme=
nts;
> +    ii. The Work does not infringe the copyright, trademark, publicity r=
ights,
> +        common law rights or any other right of any third party or const=
itute
> +        defamation, invasion of privacy or other tortious injury to any =
third
> +        party.
> + b. EXCEPT AS EXPRESSLY STATED IN THIS LICENSE OR OTHERWISE AGREED IN WR=
ITING
> +    OR REQUIRED BY APPLICABLE LAW, THE WORK IS LICENSED ON AN "AS IS" BA=
SIS,
> +    WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED INCLUDING,
> +    WITHOUT LIMITATION, ANY WARRANTIES REGARDING THE CONTENTS OR ACCURAC=
Y OF
> +    THE WORK.
> +
> +6. Limitation on Liability. EXCEPT TO THE EXTENT REQUIRED BY APPLICABLE =
LAW,
> +AND EXCEPT FOR DAMAGES ARISING FROM LIABILITY TO A THIRD PARTY RESULTING=
 FROM
> +BREACH OF THE WARRANTIES IN SECTION 5, IN NO EVENT WILL LICENSOR BE LIAB=
LE TO
> +YOU ON ANY LEGAL THEORY FOR ANY SPECIAL, INCIDENTAL, CONSEQUENTIAL, PUNI=
TIVE OR
> +EXEMPLARY DAMAGES ARISING OUT OF THIS LICENSE OR THE USE OF THE WORK, EV=
EN IF
> +LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
> +
> +7. Termination
> +
> + a. This License and the rights granted hereunder will terminate automat=
ically
> +    upon any breach by You of the terms of this License. Individuals or
> +    entities who have received Derivative Works or Collective Works from=
 You
> +    under this License, however, will not have their licenses terminated
> +    provided such individuals or entities remain in full compliance with=
 those
> +    licenses. Sections 1, 2, 5, 6, 7, and 8 will survive any termination=
 of
> +    this License.
> + b. Subject to the above terms and conditions, the license granted here =
is
> +    perpetual (for the duration of the applicable copyright in the Work)=
.
> +    Notwithstanding the above, Licensor reserves the right to release th=
e Work
> +    under different license terms or to stop distributing the Work at an=
y time;
> +    provided, however that any such election will not serve to withdraw =
this
> +    License (or any other license that has been, or is required to be, g=
ranted
> +    under the terms of this License), and this License will continue in =
full
> +    force and effect unless terminated as stated above.
> +
> +8. Miscellaneous
> +
> + a. Each time You distribute or publicly digitally perform the Work or a
> +    Collective Work, the Licensor offers to the recipient a license to t=
he Work
> +    on the same terms and conditions as the license granted to You under=
 this
> +    License.
> + b. Each time You distribute or publicly digitally perform a Derivative =
Work,
> +    Licensor offers to the recipient a license to the original Work on t=
he same
> +    terms and conditions as the license granted to You under this Licens=
e.
> + c. If any provision of this License is invalid or unenforceable under
> +    applicable law, it shall not affect the validity or enforceability o=
f the
> +    remainder of the terms of this License, and without further action b=
y the
> +    parties to this agreement, such provision shall be reformed to the m=
inimum
> +    extent necessary to make such provision valid and enforceable.
> + d. No term or provision of this License shall be deemed waived and no b=
reach
> +    consented to unless such waiver or consent shall be in writing and s=
igned
> +    by the party to be charged with such waiver or consent.
> + e. This License constitutes the entire agreement between the parties wi=
th
> +    respect to the Work licensed here. There are no understandings, agre=
ements
> +    or representations with respect to the Work not specified here. Lice=
nsor
> +    shall not be bound by any additional provisions that may appear in a=
ny
> +    communication from You. This License may not be modified without the=
 mutual
> +    written agreement of the Licensor and You.
> +
> +Creative Commons is not a party to this License, and makes no warranty
> +whatsoever in connection with the Work. Creative Commons will not be lia=
ble to
> +You or any party on any legal theory for any damages whatsoever, includi=
ng
> +without limitation any general, special, incidental or consequential dam=
ages
> +arising in connection to this license. Notwithstanding the foregoing two=
 (2)
> +sentences, if Creative Commons has expressly identified itself as the Li=
censor
> +hereunder, it shall have all rights and obligations of Licensor.
> +
> +Except for the limited purpose of indicating to the public that the Work=
 is
> +licensed under the CCPL, neither party will use the trademark "Creative
> +Commons" or any related trademark or logo of Creative Commons without th=
e prior
> +written consent of Creative Commons. Any permitted use will be in compli=
ance
> +with Creative Commons' then-current trademark usage guidelines, as may b=
e
> +published on its website or otherwise made available upon request from t=
ime to
> +time.
> +
> +Creative Commons may be contacted at http://creativecommons.org/.
> diff --git a/meta/files/common-licenses/CryptoSwift b/meta/files/common-l=
icenses/CryptoSwift
> new file mode 100644
> index 00000000000..71603206c5e
> --- /dev/null
> +++ b/meta/files/common-licenses/CryptoSwift
> @@ -0,0 +1,11 @@
> +Copyright (C) 2014-3099 Marcin Krzy=C5=BCanowski
> +This software is provided 'as-is', without any express or implied warran=
ty.
> +
> +In no event will the authors be held liable for any damages arising from=
 the use of this software.
> +
> +Permission is granted to anyone to use this software for any purpose,inc=
luding commercial applications, and to alter it and redistribute it freely,=
 subject to the following restrictions:
> +
> +- The origin of this software must not be misrepresented; you must not c=
laim that you wrote the original software. If you use this software in a pr=
oduct, an acknowledgment in the product documentation is required.
> +- Altered source versions must be plainly marked as such, and must not b=
e misrepresented as being the original software.
> +- This notice may not be removed or altered from any source or binary di=
stribution.
> +- Redistributions of any form whatsoever must retain the following ackno=
wledgment: 'This product includes software developed by the "Marcin Krzyzan=
owski" (http://krzyzanowskim.com/).'
> diff --git a/meta/files/common-licenses/DocBook-DTD b/meta/files/common-l=
icenses/DocBook-DTD
> new file mode 100644
> index 00000000000..a110d23e6f3
> --- /dev/null
> +++ b/meta/files/common-licenses/DocBook-DTD
> @@ -0,0 +1,24 @@
> +Copyright 1992-2002 HaL Computer Systems, Inc.,
> +O'Reilly & Associates, Inc., ArborText, Inc., Fujitsu Software
> +Corporation, Norman Walsh, Sun Microsystems, Inc., and the
> +Organization for the Advancement of Structured Information
> +Standards (OASIS).
> +
> +$Id: sdbcent.mod,v 1.13 2005/04/01 21:02:17 nwalsh Exp $
> +
> +Permission to use, copy, modify and distribute the DocBook XML DTD
> +and its accompanying documentation for any purpose and without fee
> +is hereby granted in perpetuity, provided that the above copyright
> +notice and this paragraph appear in all copies.  The copyright
> +holders make no representation about the suitability of the DTD for
> +any purpose.  It is provided "as is" without expressed or implied
> +warranty.
> +
> +If you modify the Simplified DocBook DTD in any way, except for
> +declaring and referencing additional sets of general entities and
> +declaring additional notations, label your DTD as a variant of
> +DocBook.  See the maintenance documentation for more information.
> +
> +Please direct all questions, bug reports, or suggestions for
> +changes to the docbook@lists.oasis-open.org mailing list. For more
> +information, see http://www.oasis-open.org/docbook/.
> diff --git a/meta/files/common-licenses/DocBook-Schema b/meta/files/commo=
n-licenses/DocBook-Schema
> new file mode 100644
> index 00000000000..56203a0878d
> --- /dev/null
> +++ b/meta/files/common-licenses/DocBook-Schema
> @@ -0,0 +1,22 @@
> +Copyright 1992-2011 HaL Computer Systems, Inc.,
> +O'Reilly & Associates, Inc., ArborText, Inc., Fujitsu Software
> +Corporation, Norman Walsh, Sun Microsystems, Inc., and the
> +Organization for the Advancement of Structured Information
> +Standards (OASIS).
> +=20
> +Permission to use, copy, modify and distribute the DocBook schema
> +and its accompanying documentation for any purpose and without fee
> +is hereby granted in perpetuity, provided that the above copyright
> +notice and this paragraph appear in all copies. The copyright
> +holders make no representation about the suitability of the schema
> +for any purpose. It is provided "as is" without expressed or implied
> +warranty.
> +=20
> +If you modify the DocBook schema in any way, label your schema as a
> +variant of DocBook. See the reference documentation
> +(http://docbook.org/tdg5/en/html/ch05.html#s-notdocbook)
> +for more information.
> +=20
> +Please direct all questions, bug reports, or suggestions for changes
> +to the docbook@lists.oasis-open.org mailing list. For more
> +information, see http://www.oasis-open.org/docbook/.
> diff --git a/meta/files/common-licenses/DocBook-Stylesheet b/meta/files/c=
ommon-licenses/DocBook-Stylesheet
> new file mode 100644
> index 00000000000..e986ed42359
> --- /dev/null
> +++ b/meta/files/common-licenses/DocBook-Stylesheet
> @@ -0,0 +1,13 @@
> +Copyright 2005 Norman Walsh, Sun Microsystems,
> +Inc., and the Organization for the Advancement
> +of Structured Information Standards (OASIS).
> +
> +Release: $Id: db4-upgrade.xsl 8905 2010-09-12 11:47:07Z bobstayton $
> +
> +Permission to use, copy, modify and distribute this stylesheet
> +and its accompanying documentation for any purpose and
> +without fee is hereby granted in perpetuity, provided that
> +the above copyright notice and this paragraph appear in
> +all copies. The copyright holders make no representation
> +about the suitability of the schema for any purpose. It
> +is provided "as is" without expressed or implied warranty.
> diff --git a/meta/files/common-licenses/FSFULLRSD b/meta/files/common-lic=
enses/FSFULLRSD
> new file mode 100644
> index 00000000000..abc104563ac
> --- /dev/null
> +++ b/meta/files/common-licenses/FSFULLRSD
> @@ -0,0 +1,4 @@
> +This file is free software; the Free Software Foundation
> +gives unlimited permission to copy and/or distribute it,
> +with or without modifications, as long as this notice is preserved.
> +This file is offered as-is, without any warranty.
> diff --git a/meta/files/common-licenses/FSL-1.1-ALv2 b/meta/files/common-=
licenses/FSL-1.1-ALv2
> new file mode 100644
> index 00000000000..386880ecd6d
> --- /dev/null
> +++ b/meta/files/common-licenses/FSL-1.1-ALv2
> @@ -0,0 +1,105 @@
> +# Functional Source License, Version 1.1, ALv2 Future License
> +
> +## Abbreviation
> +
> +FSL-1.1-ALv2
> +
> +## Notice
> +
> +Copyright ${year} ${licensor name}
> +
> +## Terms and Conditions
> +
> +### Licensor ("We")
> +
> +The party offering the Software under these Terms and Conditions.
> +
> +### The Software
> +
> +The "Software" is each version of the software that we make available un=
der
> +these Terms and Conditions, as indicated by our inclusion of these Terms=
 and
> +Conditions with the Software.
> +
> +### License Grant
> +
> +Subject to your compliance with this License Grant and the Patents,
> +Redistribution and Trademark clauses below, we hereby grant you the righ=
t to
> +use, copy, modify, create derivative works, publicly perform, publicly d=
isplay
> +and redistribute the Software for any Permitted Purpose identified below=
.
> +
> +### Permitted Purpose
> +
> +A Permitted Purpose is any purpose other than a Competing Use. A Competi=
ng Use
> +means making the Software available to others in a commercial product or
> +service that:
> +
> +1. substitutes for the Software;
> +
> +2. substitutes for any other product or service we offer using the Softw=
are
> +   that exists as of the date we make the Software available; or
> +
> +3. offers the same or substantially similar functionality as the Softwar=
e.
> +
> +Permitted Purposes specifically include using the Software:
> +
> +1. for your internal use and access;
> +
> +2. for non-commercial education;
> +
> +3. for non-commercial research; and
> +
> +4. in connection with professional services that you provide to a licens=
ee
> +   using the Software in accordance with these Terms and Conditions.
> +
> +### Patents
> +
> +To the extent your use for a Permitted Purpose would necessarily infring=
e our
> +patents, the license grant above includes a license under our patents. I=
f you
> +make a claim against any party that the Software infringes or contribute=
s to
> +the infringement of any patent, then your patent license to the Software=
 ends
> +immediately.
> +
> +### Redistribution
> +
> +The Terms and Conditions apply to all copies, modifications and derivati=
ves of
> +the Software.
> +
> +If you redistribute any copies, modifications or derivatives of the Soft=
ware,
> +you must include a copy of or a link to these Terms and Conditions and n=
ot
> +remove any copyright notices provided in or with the Software.
> +
> +### Disclaimer
> +
> +THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND, EXP=
RESS OR
> +IMPLIED, INCLUDING WITHOUT LIMITATION WARRANTIES OF FITNESS FOR A PARTIC=
ULAR
> +PURPOSE, MERCHANTABILITY, TITLE OR NON-INFRINGEMENT.
> +
> +IN NO EVENT WILL WE HAVE ANY LIABILITY TO YOU ARISING OUT OF OR RELATED =
TO THE
> +SOFTWARE, INCLUDING INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAG=
ES,
> +EVEN IF WE HAVE BEEN INFORMED OF THEIR POSSIBILITY IN ADVANCE.
> +
> +### Trademarks
> +
> +Except for displaying the License Details and identifying us as the orig=
in of
> +the Software, you have no right under these Terms and Conditions to use =
our
> +trademarks, trade names, service marks or product names.
> +
> +## Grant of Future License
> +
> +We hereby irrevocably grant you an additional license to use the Softwar=
e under
> +the Apache License, Version 2.0 that is effective on the second annivers=
ary of
> +the date we make the Software available. On or after that date, you may =
use the
> +Software under the Apache License, Version 2.0, in which case the follow=
ing
> +will apply:
> +
> +Licensed under the Apache License, Version 2.0 (the "License"); you may =
not use
> +this file except in compliance with the License.
> +
> +You may obtain a copy of the License at
> +
> +http://www.apache.org/licenses/LICENSE-2.0
> +
> +Unless required by applicable law or agreed to in writing, software dist=
ributed
> +under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES=
 OR
> +CONDITIONS OF ANY KIND, either express or implied. See the License for t=
he
> +specific language governing permissions and limitations under the Licens=
e.
> diff --git a/meta/files/common-licenses/FSL-1.1-MIT b/meta/files/common-l=
icenses/FSL-1.1-MIT
> new file mode 100644
> index 00000000000..571aa38073e
> --- /dev/null
> +++ b/meta/files/common-licenses/FSL-1.1-MIT
> @@ -0,0 +1,110 @@
> +# Functional Source License, Version 1.1, MIT Future License
> +
> +## Abbreviation
> +
> +FSL-1.1-MIT
> +
> +## Notice
> +
> +Copyright ${year} ${licensor name}
> +
> +## Terms and Conditions
> +
> +### Licensor ("We")
> +
> +The party offering the Software under these Terms and Conditions.
> +
> +### The Software
> +
> +The "Software" is each version of the software that we make available un=
der
> +these Terms and Conditions, as indicated by our inclusion of these Terms=
 and
> +Conditions with the Software.
> +
> +### License Grant
> +
> +Subject to your compliance with this License Grant and the Patents,
> +Redistribution and Trademark clauses below, we hereby grant you the righ=
t to
> +use, copy, modify, create derivative works, publicly perform, publicly d=
isplay
> +and redistribute the Software for any Permitted Purpose identified below=
.
> +
> +### Permitted Purpose
> +
> +A Permitted Purpose is any purpose other than a Competing Use. A Competi=
ng Use
> +means making the Software available to others in a commercial product or
> +service that:
> +
> +1. substitutes for the Software;
> +
> +2. substitutes for any other product or service we offer using the Softw=
are
> +   that exists as of the date we make the Software available; or
> +
> +3. offers the same or substantially similar functionality as the Softwar=
e.
> +
> +Permitted Purposes specifically include using the Software:
> +
> +1. for your internal use and access;
> +
> +2. for non-commercial education;
> +
> +3. for non-commercial research; and
> +
> +4. in connection with professional services that you provide to a licens=
ee
> +   using the Software in accordance with these Terms and Conditions.
> +
> +### Patents
> +
> +To the extent your use for a Permitted Purpose would necessarily infring=
e our
> +patents, the license grant above includes a license under our patents. I=
f you
> +make a claim against any party that the Software infringes or contribute=
s to
> +the infringement of any patent, then your patent license to the Software=
 ends
> +immediately.
> +
> +### Redistribution
> +
> +The Terms and Conditions apply to all copies, modifications and derivati=
ves of
> +the Software.
> +
> +If you redistribute any copies, modifications or derivatives of the Soft=
ware,
> +you must include a copy of or a link to these Terms and Conditions and n=
ot
> +remove any copyright notices provided in or with the Software.
> +
> +### Disclaimer
> +
> +THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND, EXP=
RESS OR
> +IMPLIED, INCLUDING WITHOUT LIMITATION WARRANTIES OF FITNESS FOR A PARTIC=
ULAR
> +PURPOSE, MERCHANTABILITY, TITLE OR NON-INFRINGEMENT.
> +
> +IN NO EVENT WILL WE HAVE ANY LIABILITY TO YOU ARISING OUT OF OR RELATED =
TO THE
> +SOFTWARE, INCLUDING INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAG=
ES,
> +EVEN IF WE HAVE BEEN INFORMED OF THEIR POSSIBILITY IN ADVANCE.
> +
> +### Trademarks
> +
> +Except for displaying the License Details and identifying us as the orig=
in of
> +the Software, you have no right under these Terms and Conditions to use =
our
> +trademarks, trade names, service marks or product names.
> +
> +## Grant of Future License
> +
> +We hereby irrevocably grant you an additional license to use the Softwar=
e under
> +the MIT license that is effective on the second anniversary of the date =
we make
> +the Software available. On or after that date, you may use the Software =
under
> +the MIT license, in which case the following will apply:
> +
> +Permission is hereby granted, free of charge, to any person obtaining a =
copy of
> +this software and associated documentation files (the "Software"), to de=
al in
> +the Software without restriction, including without limitation the right=
s to
> +use, copy, modify, merge, publish, distribute, sublicense, and/or sell c=
opies
> +of the Software, and to permit persons to whom the Software is furnished=
 to do
> +so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included =
in all
> +copies or substantial portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,
> +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS I=
N THE
> +SOFTWARE.
> diff --git a/meta/files/common-licenses/Game-Programming-Gems b/meta/file=
s/common-licenses/Game-Programming-Gems
> new file mode 100644
> index 00000000000..25549ebb38c
> --- /dev/null
> +++ b/meta/files/common-licenses/Game-Programming-Gems
> @@ -0,0 +1,8 @@
> +Original version Copyright (C) Scott Bilas, 2000.
> +All rights reserved worldwide.
> +
> +This software is provided "as is" without express or implied
> +warranties. You may freely copy and compile this source into
> +applications you distribute provided that the copyright text
> +below is included in the resulting source code, for example:
> +"Portions Copyright (C) Scott Bilas, 2000"
> diff --git a/meta/files/common-licenses/HDF5 b/meta/files/common-licenses=
/HDF5
> new file mode 100644
> index 00000000000..b4cb77559cd
> --- /dev/null
> +++ b/meta/files/common-licenses/HDF5
> @@ -0,0 +1,96 @@
> +Copyright Notice and License Terms for
> +HDF5 (Hierarchical Data Format 5) Software Library and Utilities
> +------------------------------------------------------------------------=
-----
> +
> +HDF5 (Hierarchical Data Format 5) Software Library and Utilities
> +Copyright 2006 by The HDF Group.
> +
> +NCSA HDF5 (Hierarchical Data Format 5) Software Library and Utilities
> +Copyright 1998-2006 by The Board of Trustees of the University of Illino=
is.
> +
> +All rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted for any purpose (including commercial purpos=
es)
> +provided that the following conditions are met:
> +
> +1. Redistributions of source code must retain the above copyright notice=
,
> +   this list of conditions, and the following disclaimer.
> +
> +2. Redistributions in binary form must reproduce the above copyright not=
ice,
> +   this list of conditions, and the following disclaimer in the document=
ation
> +   and/or materials provided with the distribution.
> +
> +3. Neither the name of The HDF Group, the name of the University, nor th=
e
> +   name of any Contributor may be used to endorse or promote products de=
rived
> +   from this software without specific prior written permission from
> +   The HDF Group, the University, or the Contributor, respectively.
> +
> +DISCLAIMER:
> +THIS SOFTWARE IS PROVIDED BY THE HDF GROUP AND THE CONTRIBUTORS
> +"AS IS" WITH NO WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED. IN NO
> +EVENT SHALL THE HDF GROUP OR THE CONTRIBUTORS BE LIABLE FOR ANY DAMAGES
> +SUFFERED BY THE USERS ARISING OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> +ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +You are under no obligation whatsoever to provide any bug fixes, patches=
, or
> +upgrades to the features, functionality or performance of the source cod=
e
> +("Enhancements") to anyone; however, if you choose to make your Enhancem=
ents
> +available either publicly, or directly to The HDF Group, without imposin=
g a
> +separate written license agreement for such Enhancements, then you hereb=
y
> +grant the following license: a non-exclusive, royalty-free perpetual lic=
ense
> +to install, use, modify, prepare derivative works, incorporate into othe=
r
> +computer software, distribute, and sublicense such enhancements or deriv=
ative
> +works thereof, in binary and source code form.
> +
> +------------------------------------------------------------------------=
-----
> +------------------------------------------------------------------------=
-----
> +
> +Contributors:   National Center for Supercomputing Applications (NCSA) a=
t
> +the University of Illinois, Fortner Software, Unidata Program Center
> +(netCDF), The Independent JPEG Group (JPEG), Jean-loup Gailly and Mark A=
dler
> +(gzip), and Digital Equipment Corporation (DEC).
> +
> +------------------------------------------------------------------------=
-----
> +
> +Portions of HDF5 were developed with support from the Lawrence Berkeley
> +National Laboratory (LBNL) and the United States Department of Energy
> +under Prime Contract No. DE-AC02-05CH11231.
> +
> +------------------------------------------------------------------------=
-----
> +
> +Portions of HDF5 were developed with support from Lawrence Livermore
> +National Laboratory and the United States Department of Energy under
> +Prime Contract No. DE-AC52-07NA27344.
> +
> +------------------------------------------------------------------------=
-----
> +
> +Portions of HDF5 were developed with support from the University of
> +California, Lawrence Livermore National Laboratory (UC LLNL).
> +The following statement applies to those portions of the product and mus=
t
> +be retained in any redistribution of source code, binaries, documentatio=
n,
> +and/or accompanying materials:
> +
> +   This work was partially produced at the University of California,
> +   Lawrence Livermore National Laboratory (UC LLNL) under contract
> +   no. W-7405-ENG-48 (Contract 48) between the U.S. Department of Energy
> +   (DOE) and The Regents of the University of California (University)
> +   for the operation of UC LLNL.
> +
> +   DISCLAIMER:
> +   THIS WORK WAS PREPARED AS AN ACCOUNT OF WORK SPONSORED BY AN AGENCY O=
F
> +   THE UNITED STATES GOVERNMENT. NEITHER THE UNITED STATES GOVERNMENT NO=
R
> +   THE UNIVERSITY OF CALIFORNIA NOR ANY OF THEIR EMPLOYEES, MAKES ANY
> +   WARRANTY, EXPRESS OR IMPLIED, OR ASSUMES ANY LIABILITY OR RESPONSIBIL=
ITY
> +   FOR THE ACCURACY, COMPLETENESS, OR USEFULNESS OF ANY INFORMATION,
> +   APPARATUS, PRODUCT, OR PROCESS DISCLOSED, OR REPRESENTS THAT ITS USE
> +   WOULD NOT INFRINGE PRIVATELY- OWNED RIGHTS. REFERENCE HEREIN TO ANY
> +   SPECIFIC COMMERCIAL PRODUCTS, PROCESS, OR SERVICE BY TRADE NAME,
> +   TRADEMARK, MANUFACTURER, OR OTHERWISE, DOES NOT NECESSARILY CONSTITUT=
E
> +   OR IMPLY ITS ENDORSEMENT, RECOMMENDATION, OR FAVORING BY THE UNITED
> +   STATES GOVERNMENT OR THE UNIVERSITY OF CALIFORNIA. THE VIEWS AND
> +   OPINIONS OF AUTHORS EXPRESSED HEREIN DO NOT NECESSARILY STATE OR REFL=
ECT
> +   THOSE OF THE UNITED STATES GOVERNMENT OR THE UNIVERSITY OF CALIFORNIA=
,
> +   AND SHALL NOT BE USED FOR ADVERTISING OR PRODUCT ENDORSEMENT PURPOSES=
.
> +
> +------------------------------------------------------------------------=
-----
> diff --git a/meta/files/common-licenses/HIDAPI b/meta/files/common-licens=
es/HIDAPI
> new file mode 100644
> index 00000000000..e0b5d70c04b
> --- /dev/null
> +++ b/meta/files/common-licenses/HIDAPI
> @@ -0,0 +1,2 @@
> +This software may be used by anyone for any reason so long
> +as the copyright notice in the source files remains intact.
> diff --git a/meta/files/common-licenses/HPND-Netrek b/meta/files/common-l=
icenses/HPND-Netrek
> new file mode 100644
> index 00000000000..5c3cb650f46
> --- /dev/null
> +++ b/meta/files/common-licenses/HPND-Netrek
> @@ -0,0 +1,10 @@
> +Copyright (C) 1995 S. M. Patel (smpatel@wam.umd.edu)
> +
> +Permission to use, copy, modify, and distribute this
> +software and its documentation for any purpose and without
> +fee is hereby granted, provided that the above copyright
> +notice appear in all copies and that both that copyright
> +notice and this permission notice appear in supporting
> +documentation.  No representations are made about the
> +suitability of this software for any purpose.  It is
> +provided "as is" without express or implied warranty.
> diff --git a/meta/files/common-licenses/InnoSetup b/meta/files/common-lic=
enses/InnoSetup
> new file mode 100644
> index 00000000000..337584e6d1c
> --- /dev/null
> +++ b/meta/files/common-licenses/InnoSetup
> @@ -0,0 +1,27 @@
> +Inno Setup License
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Except where otherwise noted, all of the documentation and software incl=
uded in the Inno Setup
> +package is copyrighted by Jordan Russell.
> +
> +Copyright (C) 1997-2024 Jordan Russell. All rights reserved.
> +Portions Copyright (C) 2000-2024 Martijn Laan. All rights reserved.
> +
> +This software is provided "as-is," without any express or implied warran=
ty. In no event shall the
> +author be held liable for any damages arising from the use of this softw=
are.
> +
> +Permission is granted to anyone to use this software for any purpose, in=
cluding commercial
> +applications, and to alter and redistribute it, provided that the follow=
ing conditions are met:
> +
> +1. All redistributions of source code files must retain all copyright no=
tices that are currently in
> +   place, and this list of conditions without modification.
> +
> +2. All redistributions in binary form must retain all occurrences of the=
 above copyright notice and
> +   web site addresses that are currently in place (for example, in the A=
bout boxes).
> +
> +3. The origin of this software must not be misrepresented; you must not =
claim that you wrote the
> +   original software. If you use this software to distribute a product, =
an acknowledgment in the
> +   product documentation would be appreciated but is not required.
> +
> +4. Modified versions in source or binary form must be plainly marked as =
such, and must not be
> +   misrepresented as being the original software.
> diff --git a/meta/files/common-licenses/MIPS b/meta/files/common-licenses=
/MIPS
> new file mode 100644
> index 00000000000..cf57a056391
> --- /dev/null
> +++ b/meta/files/common-licenses/MIPS
> @@ -0,0 +1,4 @@
> +Copyright (c) 1992, 1991, 1990 MIPS Computer Systems, Inc.
> +MIPS Computer Systems, Inc. grants reproduction and use
> +rights to all parties, PROVIDED that this comment is
> +maintained in the copy.
> diff --git a/meta/files/common-licenses/MIT-Click b/meta/files/common-lic=
enses/MIT-Click
> new file mode 100644
> index 00000000000..82054edc397
> --- /dev/null
> +++ b/meta/files/common-licenses/MIT-Click
> @@ -0,0 +1,30 @@
> +Portions of this software are subject to the license below.  The relevan=
t
> +source files are clearly marked; they refer to this file using the phras=
e
> +"the Click LICENSE file". This license is an MIT license, plus a clause
> +(taken from the W3C license) requiring prior written permission to use o=
ur
> +names in publicity.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +Permission is hereby granted, free of charge, to any person obtaining a
> +copy of this software and associated documentation files (the "Software"=
),
> +to deal in the Software without restriction, including without limitatio=
n
> +the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +and/or sell copies of the Software, and to permit persons to whom the
> +Software is furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included =
in
> +all copies or substantial portions of the Software.
> +
> +The name and trademarks of copyright holders may NOT be used in advertis=
ing
> +or publicity pertaining to the Software without specific, written prior
> +permission. Title to copyright in this Software and any associated
> +documentation will at all times remain with copyright holders.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +DEALINGS IN THE SOFTWARE.
> diff --git a/meta/files/common-licenses/NTIA-PD b/meta/files/common-licen=
ses/NTIA-PD
> new file mode 100644
> index 00000000000..f451790073f
> --- /dev/null
> +++ b/meta/files/common-licenses/NTIA-PD
> @@ -0,0 +1,13 @@
> +SOFTWARE DISCLAIMER / RELEASE
> +
> +This software was developed by employees of the National Telecommunicati=
ons and Information Administration (NTIA), an agency of the Federal Governm=
ent and is provided to you as a public service.  Pursuant to Title 15 Unite=
d States Code Section 105, works of NTIA employees are not subject to copyr=
ight protection within the United States.
> +
> +The software is provided by NTIA =E2=80=9CAS IS.=E2=80=9D  NTIA MAKES NO=
 WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR STATUTORY, INCLUDING, WITHOUT LI=
MITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR=
 PURPOSE, NON-INFRINGEMENT AND DATA ACCURACY. NTIA does not warrant or make=
 any representations regarding the use of the software or the results there=
of, including but not limited to the correctness, accuracy, reliability or =
usefulness of the software.=20
> +
> +To the extent that NTIA holds rights in countries other than the United =
States, you are hereby granted the non-exclusive irrevocable and unconditio=
nal right to print, publish, prepare derivative works and distribute the NT=
IA software, in any medium, or authorize others to do so on your behalf, on=
 a royalty-free basis throughout the World.
> +
> +You may improve, modify, and create derivative works of the software or =
any portion of the software, and you may copy and distribute such modificat=
ions or works. Modified works should carry a notice stating that you change=
d the software and should note the date and nature of any such change.
> +
> +You are solely responsible for determining the appropriateness of using =
and distributing the software and you assume all risks associated with its =
use, including but not limited to the risks and costs of program errors, co=
mpliance with applicable laws, damage to or loss of data, programs or equip=
ment, and the unavailability or interruption of operation. This software is=
 not intended to be used in any situation where a failure could cause risk =
of injury or damage to property.=20
> +
> +Please provide appropriate acknowledgments of NTIA=E2=80=99s creation of=
 the software in any copies or derivative works of this software.
> diff --git a/meta/files/common-licenses/Ruby-pty b/meta/files/common-lice=
nses/Ruby-pty
> new file mode 100644
> index 00000000000..c817762f84c
> --- /dev/null
> +++ b/meta/files/common-licenses/Ruby-pty
> @@ -0,0 +1,10 @@
> +(c) Copyright 1998 by Akinori Ito.
> +
> +This software may be redistributed freely for this purpose, in full
> +or in part, provided that this entire copyright notice is included
> +on any copies of this software and applications and derivations thereof.
> +
> +This software is provided on an "as is" basis, without warranty of any
> +kind, either expressed or implied, as to any matter including, but not
> +limited to warranty of fitness of purpose, or merchantability, or
> +results obtained from use of this software.
> diff --git a/meta/files/common-licenses/SMAIL-GPL b/meta/files/common-lic=
enses/SMAIL-GPL
> new file mode 100644
> index 00000000000..be799ec39de
> --- /dev/null
> +++ b/meta/files/common-licenses/SMAIL-GPL
> @@ -0,0 +1,144 @@
> +SMAIL GENERAL PUBLIC LICENSE
> +		       (Clarified 11 Feb 1988)
> +
> + Copyright (C)  1988 Landon Curt Noll & Ronald S. Karr
> + Copyright (C)  1992 Ronald S. Karr
> + Copyleft (GNU) 1988 Landon Curt Noll & Ronald S. Karr
> +
> + Everyone is permitted to copy and distribute verbatim copies
> + of this license, but changing it is not allowed.  You can also
> + use this wording to make the terms for other programs.
> +
> +  The license agreements of most software companies keep you at the
> +mercy of those companies.  By contrast, our general public license is
> +intended to give everyone the right to share SMAIL.  To make sure that
> +you get the rights we want you to have, we need to make restrictions
> +that forbid anyone to deny you these rights or to ask you to surrender
> +the rights.  Hence this license agreement.
> +
> +  Specifically, we want to make sure that you have the right to give
> +away copies of SMAIL, that you receive source code or else can get it
> +if you want it, that you can change SMAIL or use pieces of it in new
> +free programs, and that you know you can do these things.
> +
> +  To make sure that everyone has such rights, we have to forbid you to
> +deprive anyone else of these rights.  For example, if you distribute
> +copies of SMAIL, you must give the recipients all the rights that you
> +have.  You must make sure that they, too, receive or can get the
> +source code.  And you must tell them their rights.
> +
> +  Also, for our own protection, we must make certain that everyone
> +finds out that there is no warranty for SMAIL.  If SMAIL is modified by
> +someone else and passed on, we want its recipients to know that what
> +they have is not what we distributed, so that any problems introduced
> +by others will not reflect on our reputation.
> +
> +  Therefore we (Landon Curt Noll and Ronald S. Karr) make the following=
=20
> +terms which say what you must do to be allowed to distribute or change=
=20
> +SMAIL.
> +
> +
> +			COPYING POLICIES
> +
> +  1. You may copy and distribute verbatim copies of SMAIL source code
> +as you receive it, in any medium, provided that you conspicuously and
> +appropriately publish on each copy a valid copyright notice "Copyright
> +(C) 1988 Landon Curt Noll & Ronald S. Karr" (or with whatever year is
> +appropriate); keep intact the notices on all files that refer to this
> +License Agreement and to the absence of any warranty; and give any
> +other recipients of the SMAIL program a copy of this License
> +Agreement along with the program.  You may charge a distribution fee
> +for the physical act of transferring a copy.
> +
> +  2. You may modify your copy or copies of SMAIL or any portion of it,
> +and copy and distribute such modifications under the terms of
> +Paragraph 1 above, provided that you also do the following:
> +
> +    a) cause the modified files to carry prominent notices stating
> +    that you changed the files and the date of any change; and
> +
> +    b) cause the whole of any work that you distribute or publish,
> +    that in whole or in part contains or is a derivative of SMAIL or
> +    any part thereof, to be licensed at no charge to all third
> +    parties on terms identical to those contained in this License
> +    Agreement (except that you may choose to grant more extensive
> +    warranty protection to some or all third parties, at your option).
> +
> +    c) You may charge a distribution fee for the physical act of
> +    transferring a copy, and you may at your option offer warranty
> +    protection in exchange for a fee.
> +
> +Mere aggregation of another unrelated program with this program (or its
> +derivative) on a volume of a storage or distribution medium does not bri=
ng
> +the other program under the scope of these terms.
> +
> +  3. You may copy and distribute SMAIL (or a portion or derivative of it=
,
> +under Paragraph 2) in object code or executable form under the terms of
> +Paragraphs 1 and 2 above provided that you also do one of the following:
> +
> +    a) accompany it with the complete corresponding machine-readable
> +    source code, which must be distributed under the terms of
> +    Paragraphs 1 and 2 above; or,
> +
> +    b) accompany it with a written offer, valid for at least three
> +    years, to give any third party free (except for a nominal
> +    shipping charge) a complete machine-readable copy of the
> +    corresponding source code, to be distributed under the terms of
> +    Paragraphs 1 and 2 above; or,
> +
> +    c) accompany it with the information you received as to where the
> +    corresponding source code may be obtained.  (This alternative is
> +    allowed only for non-commercial distribution and only if you
> +    received the program in object code or executable form alone.)
> +
> +For an executable file, complete source code means all the source code f=
or
> +all modules it contains; but, as a special exception, it need not includ=
e
> +source code for modules which are standard libraries that accompany the
> +operating system on which the executable file runs.
> +
> +  4. You may not copy, sublicense, distribute or transfer SMAIL
> +except as expressly provided under this License Agreement.  Any attempt
> +otherwise to copy, sublicense, distribute or transfer SMAIL is void and
> +your rights to use the program under this License agreement shall be
> +automatically terminated.  However, parties who have received computer
> +software programs from you with this License Agreement will not have
> +their licenses terminated so long as such parties remain in full complia=
nce.
> +
> +  5. If you wish to incorporate parts of SMAIL into other free
> +programs whose distribution conditions are different, write to Landon
> +Curt Noll & Ronald S. Karr via the Free Software Foundation at 51
> +Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.  We have not yet
> +worked out a simple rule that can be stated here, but we will often
> +permit this.  We will be guided by the two goals of preserving the
> +free status of all derivatives of our free software and of promoting
> +the sharing and reuse of software.
> +
> +Your comments and suggestions about our licensing policies and our
> +software are welcome!  This contract was based on the contract made by
> +the Free Software Foundation.  Please contact the Free Software
> +Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
> +USA, or call (617) 542-5942 for details on copylefted material in
> +general.
> +
> +		       NO WARRANTY
> +
> +  BECAUSE SMAIL IS LICENSED FREE OF CHARGE, WE PROVIDE ABSOLUTELY NO
> +WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE STATE LAW.  EXCEPT WHEN
> +OTHERWISE STATED IN WRITING, LANDON CURT NOLL & RONALD S. KARR AND/OR
> +OTHER PARTIES PROVIDE SMAIL "AS IS" WITHOUT WARRANTY OF ANY KIND,
> +EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> +THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF SMAIL IS WITH
> +YOU.  SHOULD SMAIL PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
> +NECESSARY SERVICING, REPAIR OR CORRECTION.
> +
> +  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL LANDON CURT NOLL &
> +RONALD S. KARR AND/OR ANY OTHER PARTY WHO MAY MODIFY AND REDISTRIBUTE
> +SMAIL AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
> +LOST PROFITS, LOST MONIES, OR OTHER SPECIAL, INCIDENTAL OR
> +CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
> +(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
> +INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE
> +PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS) SMAIL, EVEN IF YOU HAVE
> +BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY
> +ANY OTHER PARTY.
> diff --git a/meta/files/common-licenses/SOFA b/meta/files/common-licenses=
/SOFA
> new file mode 100644
> index 00000000000..d9529497c31
> --- /dev/null
> +++ b/meta/files/common-licenses/SOFA
> @@ -0,0 +1,90 @@
> +Copyright (C) 2023
> +Standards of Fundamental Astronomy Board
> +of the International Astronomical Union.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +SOFA Software License
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +NOTICE TO USER:
> +
> +BY USING THIS SOFTWARE YOU ACCEPT THE FOLLOWING SIX TERMS AND
> +CONDITIONS WHICH APPLY TO ITS USE.
> +
> +1. The Software is owned by the IAU SOFA Board ("SOFA").
> +
> +2. Permission is granted to anyone to use the SOFA software for any
> +purpose, including commercial applications, free of charge and
> +without payment of royalties, subject to the conditions and
> +restrictions listed below.
> +
> +3. You (the user) may copy and distribute SOFA source code to others,
> +and use and adapt its code and algorithms in your own software,
> +on a world-wide, royalty-free basis.  That portion of your
> +distribution that does not consist of intact and unchanged copies
> +of SOFA source code files is a "derived work" that must comply
> +with the following requirements:
> +
> +     a) Your work shall be marked or carry a statement that it
> +        (i) uses routines and computations derived by you from
> +        software provided by SOFA under license to you; and
> +        (ii) does not itself constitute software provided by and/or
> +        endorsed by SOFA.
> +
> +     b) The source code of your derived work must contain descriptions
> +        of how the derived work is based upon, contains and/or differs
> +        from the original SOFA software.
> +
> +     c) The names of all routines in your derived work shall not
> +        include the prefix "iau" or "sofa" or trivial modifications
> +        thereof such as changes of case.
> +
> +     d) The origin of the SOFA components of your derived work must
> +        not be misrepresented;  you must not claim that you wrote the
> +        original software, nor file a patent application for SOFA
> +        software or algorithms embedded in the SOFA software.
> +
> +     e) These requirements must be reproduced intact in any source
> +        distribution and shall apply to anyone to whom you have
> +        granted a further right to modify the source code of your
> +        derived work.
> +
> +     Note that, as originally distributed, the SOFA software is
> +     intended to be a definitive implementation of the IAU standards,
> +     and consequently third-party modifications are discouraged.  All
> +     variations, no matter how minor, must be explicitly marked as
> +     such, as explained above.
> +
> +  4. You shall not cause the SOFA software to be brought into
> +     disrepute, either by misuse, or use for inappropriate tasks, or
> +     by inappropriate modification.
> +
> +  5. The SOFA software is provided "as is" and SOFA makes no warranty
> +     as to its use or performance.   SOFA does not and cannot warrant
> +     the performance or results which the user may obtain by using the
> +     SOFA software.  SOFA makes no warranties, express or implied, as
> +     to non-infringement of third party rights, merchantability, or
> +     fitness for any particular purpose.  In no event will SOFA be
> +     liable to the user for any consequential, incidental, or special
> +     damages, including any lost profits or lost savings, even if a
> +     SOFA representative has been advised of such damages, or for any
> +     claim by any third party.
> +
> +  6. The provision of any version of the SOFA software under the terms
> +     and conditions specified herein does not imply that future
> +     versions will also be made available under the same terms and
> +     conditions.
> +
> +  In any published work or commercial product which uses the SOFA
> +  software directly, acknowledgement (see www.iausofa.org) is
> +  appreciated.
> +
> +  Correspondence concerning SOFA software should be addressed as
> +  follows:
> +      By email:  sofa@ukho.gov.uk
> +      By post:   IAU SOFA Center
> +                 HM Nautical Almanac Office
> +                 UK Hydrographic Office
> +                 Admiralty Way, Taunton
> +                 Somerset, TA1 2DN
> +                 United Kingdom
> diff --git a/meta/files/common-licenses/SUL-1.0 b/meta/files/common-licen=
ses/SUL-1.0
> new file mode 100644
> index 00000000000..119672697d0
> --- /dev/null
> +++ b/meta/files/common-licenses/SUL-1.0
> @@ -0,0 +1,73 @@
> +Sustainable Use License
> +
> +Version 1.0
> +
> +Acceptance
> +
> +By using the software, you agree to all of the terms and conditions belo=
w.
> +
> +Copyright License
> +
> +The licensor grants you a non-exclusive, royalty-free, worldwide, non-su=
blicensable, non-transferable license
> +to use, copy, distribute, make available, and prepare derivative works o=
f the software, in each case subject
> +to the limitations below.
> +
> +Limitations
> +
> +You may use or modify the software only for your own internal business p=
urposes or for non-commercial or
> +personal use. You may distribute the software or provide it to others on=
ly if you do so free of charge for
> +non-commercial purposes. You may not alter, remove, or obscure any licen=
sing, copyright, or other notices of
> +the licensor in the software. Any use of the licensor=E2=80=99s trademar=
ks is subject to applicable law.
> +
> +Patents
> +
> +The licensor grants you a license, under any patent claims the licensor =
can license, or becomes able to
> +license, to make, have made, use, sell, offer for sale, import and have =
imported the software, in each case
> +subject to the limitations and conditions in this license. This license =
does not cover any patent claims that
> +you cause to be infringed by modifications or additions to the software.=
 If you or your company make any
> +written claim that the software infringes or contributes to infringement=
 of any patent, your patent license
> +for the software granted under these terms ends immediately. If your com=
pany makes such a claim, your patent
> +license ends immediately for work on behalf of your company.
> +
> +Notices
> +
> +You must ensure that anyone who gets a copy of any part of the software =
from you also gets a copy of these
> +terms. If you modify the software, you must include in any modified copi=
es of the software a prominent notice
> +stating that you have modified the software.
> +
> +No Other Rights
> +
> +These terms do not imply any licenses other than those expressly granted=
 in these terms.
> +
> +Termination
> +
> +If you use the software in violation of these terms, such use is not lic=
ensed, and your license will
> +automatically terminate. If the licensor provides you with a notice of y=
our violation, and you cease all
> +violation of this license no later than 30 days after you receive that n=
otice, your license will be reinstated
> +retroactively. However, if you violate these terms after such reinstatem=
ent, any additional violation of these
> +terms will cause your license to terminate automatically and permanently=
.
> +
> +No Liability
> +
> +As far as the law allows, the software comes as is, without any warranty=
 or condition, and the licensor will
> +not be liable to you for any damages arising out of these terms or the u=
se or nature of the software, under
> +any kind of legal claim.
> +
> +Definitions
> +
> +The =E2=80=9Clicensor=E2=80=9D is the entity offering these terms.
> +
> +The =E2=80=9Csoftware=E2=80=9D is the software the licensor makes availa=
ble under these terms, including any portion of it.
> +
> +=E2=80=9CYou=E2=80=9D refers to the individual or entity agreeing to the=
se terms.
> +
> +=E2=80=9CYour company=E2=80=9D is any legal entity, sole proprietorship,=
 or other kind of organization that you work for, plus
> +all organizations that have control over, are under the control of, or a=
re under common control with that
> +organization. Control means ownership of substantially all the assets of=
 an entity, or the power to direct its
> +management and policies by vote, contract, or otherwise. Control can be =
direct or indirect.
> +
> +=E2=80=9CYour license=E2=80=9D is the license granted to you for the sof=
tware under these terms.
> +
> +=E2=80=9CUse=E2=80=9D means anything you do with the software requiring =
your license.
> +
> +=E2=80=9CTrademark=E2=80=9D means trademarks, service marks, and similar=
 rights.
> diff --git a/meta/files/common-licenses/Sendmail-Open-Source-1.1 b/meta/f=
iles/common-licenses/Sendmail-Open-Source-1.1
> new file mode 100644
> index 00000000000..054f719ee59
> --- /dev/null
> +++ b/meta/files/common-licenses/Sendmail-Open-Source-1.1
> @@ -0,0 +1,75 @@
> +SENDMAIL OPEN SOURCE LICENSE
> +
> +The following license terms and conditions apply to this open source
> +software ("Software"), unless a different license is obtained directly
> +from Sendmail, Inc. ("Sendmail") located at 6475 Christie Ave, Suite 350=
,
> +Emeryville, CA 94608, USA.
> +
> +Use, modification and redistribution (including distribution of any
> +modified or derived work) of the Software in source and binary forms is
> +permitted only if each of the following conditions of 1-6 are met:
> +
> +1. Redistributions of the Software qualify as "freeware" or "open
> +   source software" under one of the following terms:
> +
> +   (a) Redistributions are made at no charge beyond the reasonable
> +       cost of materials and delivery; or
> +
> +   (b) Redistributions are accompanied by a copy of the modified
> +       Source Code (on an acceptable machine-readable medium) or by an
> +       irrevocable offer to provide a copy of the modified Source Code
> +       (on an acceptable machine-readable medium) for up to three years
> +       at the cost of materials and delivery. Such redistributions must
> +       allow further use, modification, and redistribution of the Source
> +       Code under substantially the same terms as this license. For
> +       the purposes of redistribution "Source Code" means the complete
> +       human-readable, compilable, linkable, and operational source
> +       code of the redistributed module(s) including all modifications.
> +
> +2. Redistributions of the Software Source Code must retain the
> +   copyright notices as they appear in each Source Code file, these
> +   license terms and conditions, and the disclaimer/limitation of
> +   liability set forth in paragraph 6 below. Redistributions of the
> +   Software Source Code must also comply with the copyright notices
> +   and/or license terms and conditions imposed by contributors on
> +   embedded code. The contributors' license terms and conditions
> +   and/or copyright notices are contained in the Source Code
> +   distribution.
> +
> +3. Redistributions of the Software in binary form must reproduce the
> +   Copyright Notice described below, these license terms and conditions,
> +   and the disclaimer/limitation of liability set forth in paragraph
> +   6 below, in the documentation and/or other materials provided with
> +   the binary distribution.  For the purposes of binary distribution,
> +   "Copyright Notice" refers to the following language: "Copyright (c)
> +   1998-2009 Sendmail, Inc. All rights reserved."
> +
> +4. Neither the name, trademark or logo of Sendmail, Inc. (including
> +   without limitation its subsidiaries or affiliates) or its contributor=
s
> +   may be used to endorse or promote products, or software or services
> +   derived from this Software without specific prior written permission.
> +   The name "sendmail" is a registered trademark and service mark of
> +   Sendmail, Inc.
> +
> +5. We reserve the right to cancel this license if you do not comply with=
=20
> +   the terms.  This license is governed by California law and both of us=
=20
> +   agree that for any dispute arising out of or relating to this Softwar=
e,=20
> +   that jurisdiction and venue is proper in San Francisco or Alameda=20
> +   counties.  These license terms and conditions reflect the complete=20
> +   agreement for the license of the Software (which means this supercede=
s=20
> +   prior or contemporaneous agreements or representations).  If any term
> +   or condition under this license is found to be invalid, the remaining
> +   terms and conditions still apply.
> +
> +6. Disclaimer/Limitation of Liability: THIS SOFTWARE IS PROVIDED BY
> +   SENDMAIL AND ITS CONTRIBUTORS "AS IS" WITHOUT WARRANTY OF ANY KIND
> +   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,=
 THE
> +   IMPLIED WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS F=
OR A
> +   PARTICULAR PURPOSE ARE EXPRESSLY DISCLAIMED. IN NO EVENT SHALL SENDMA=
IL
> +   OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMI=
TED
> +   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
> +   OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEOR=
Y
> +   OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDI=
NG
> +   WITHOUT LIMITATION NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF=
 THE
> +   USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMA=
GES.
> diff --git a/meta/files/common-licenses/ThirdEye b/meta/files/common-lice=
nses/ThirdEye
> new file mode 100644
> index 00000000000..ce75b566e37
> --- /dev/null
> +++ b/meta/files/common-licenses/ThirdEye
> @@ -0,0 +1,7 @@
> +(C) Copyright 1984 by Third Eye Software, Inc.
> +
> +Third Eye Software, Inc. grants reproduction and use rights to
> +all parties, PROVIDED that this comment is maintained in the copy.
> +
> +Third Eye makes no claims about the applicability of this
> +symbol table to a particular use.
> diff --git a/meta/files/common-licenses/TrustedQSL b/meta/files/common-li=
censes/TrustedQSL
> new file mode 100644
> index 00000000000..982d4269f62
> --- /dev/null
> +++ b/meta/files/common-licenses/TrustedQSL
> @@ -0,0 +1,58 @@
> +Copyright (C) 2001-2015 American Radio Relay League, Inc. All rights
> +reserved.
> +
> +Portions (C) 2003-2023 The TrustedQSL Developers. Please see the AUTHORS=
.txt
> +file for contributors.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions
> +are met:
> +
> +1. Any redistribution of source code must retain the above copyright
> +notice, this list of conditions and the disclaimer shown in
> +Paragraph 5 (below).
> +
> +2. Redistribution in binary form must reproduce the above copyright
> +notice, this list of conditions and the disclaimer shown in
> +Paragraph 5 (below) in the documentation and/or other materials
> +provided with the distribution.
> +
> +3. Products derived from or including this software may not use
> +"Logbook of the World" or "LoTW" or any other American Radio Relay
> +League, Incorporated trademarks or servicemarks in their names
> +without prior written permission of the ARRL. See Paragraph 6
> +(below) for contact information.
> +
> +4. Use of this software does not imply endorsement by ARRL of
> +products derived from or including this software and vendors may not
> +claim such endorsement.=20
> +
> +5. Disclaimer: This software is provided "as-is" without
> +representation, guarantee or warranty of any kind, either express or
> +implied, including but not limited to the implied warranties of
> +merchantability or of fitness for a particular purpose. The entire
> +risk as to the quality and performance of the software is solely
> +with you. Should the software prove defective, you (and not the
> +American Radio Relay League, its officers, directors, employees or
> +agents) assume the entire cost of all necessary servicing, repair or
> +correction. In no event will ARRL be liable to you or to any third
> +party for any damages, whether direct or indirect, including lost
> +profits, lost savings, or other incidental or consequential damages
> +arising out of the use or inability to use such software, regardless
> +of whether ARRL has been advised of the possibility of such damages.
> +
> +6. Contact information:
> +
> +American Radio Relay League, Inc.
> +Attn: Logbook of the World Manager
> +225 Main St
> +Newington, CT 06111
> +voice: 860-594-0200
> +fax: 860-594-0259
> +email: logbook@arrl.org
> +Worldwide Web: www.arrl.org
> +
> +This software consists of voluntary contributions made by many
> +individuals on behalf of the ARRL. More information on the "Logbook
> +of The World" project and the ARRL is available from the ARRL Web
> +site at www.arrl.org.
> diff --git a/meta/files/common-licenses/Ubuntu-font-1.0 b/meta/files/comm=
on-licenses/Ubuntu-font-1.0
> new file mode 100644
> index 00000000000..ae78a8f94ea
> --- /dev/null
> +++ b/meta/files/common-licenses/Ubuntu-font-1.0
> @@ -0,0 +1,96 @@
> +-------------------------------
> +UBUNTU FONT LICENCE Version 1.0
> +-------------------------------
> +
> +PREAMBLE
> +This licence allows the licensed fonts to be used, studied, modified and
> +redistributed freely. The fonts, including any derivative works, can be
> +bundled, embedded, and redistributed provided the terms of this licence
> +are met. The fonts and derivatives, however, cannot be released under
> +any other licence. The requirement for fonts to remain under this
> +licence does not require any document created using the fonts or their
> +derivatives to be published under this licence, as long as the primary
> +purpose of the document is not to be a vehicle for the distribution of
> +the fonts.
> +
> +DEFINITIONS
> +"Font Software" refers to the set of files released by the Copyright
> +Holder(s) under this licence and clearly marked as such. This may
> +include source files, build scripts and documentation.
> +
> +"Original Version" refers to the collection of Font Software components
> +as received under this licence.
> +
> +"Modified Version" refers to any derivative made by adding to, deleting,
> +or substituting -- in part or in whole -- any of the components of the
> +Original Version, by changing formats or by porting the Font Software to
> +a new environment.
> +
> +"Copyright Holder(s)" refers to all individuals and companies who have a
> +copyright ownership of the Font Software.
> +
> +"Substantially Changed" refers to Modified Versions which can be easily
> +identified as dissimilar to the Font Software by users of the Font
> +Software comparing the Original Version with the Modified Version.
> +
> +To "Propagate" a work means to do anything with it that, without
> +permission, would make you directly or secondarily liable for
> +infringement under applicable copyright law, except executing it on a
> +computer or modifying a private copy. Propagation includes copying,
> +distribution (with or without modification and with or without charging
> +a redistribution fee), making available to the public, and in some
> +countries other activities as well.
> +
> +PERMISSION & CONDITIONS
> +This licence does not grant any rights under trademark law and all such
> +rights are reserved.
> +
> +Permission is hereby granted, free of charge, to any person obtaining a
> +copy of the Font Software, to propagate the Font Software, subject to
> +the below conditions:
> +
> +1) Each copy of the Font Software must contain the above copyright
> +notice and this licence. These can be included either as stand-alone
> +text files, human-readable headers or in the appropriate machine-
> +readable metadata fields within text or binary files as long as those
> +fields can be easily viewed by the user.
> +
> +2) The font name complies with the following:
> +(a) The Original Version must retain its name, unmodified.
> +(b) Modified Versions which are Substantially Changed must be renamed to
> +avoid use of the name of the Original Version or similar names entirely.
> +(c) Modified Versions which are not Substantially Changed must be
> +renamed to both (i) retain the name of the Original Version and (ii) add
> +additional naming elements to distinguish the Modified Version from the
> +Original Version. The name of such Modified Versions must be the name of
> +the Original Version, with "derivative X" where X represents the name of
> +the new work, appended to that name.
> +
> +3) The name(s) of the Copyright Holder(s) and any contributor to the
> +Font Software shall not be used to promote, endorse or advertise any
> +Modified Version, except (i) as required by this licence, (ii) to
> +acknowledge the contribution(s) of the Copyright Holder(s) or (iii) with
> +their explicit written permission.
> +
> +4) The Font Software, modified or unmodified, in part or in whole, must
> +be distributed entirely under this licence, and must not be distributed
> +under any other licence. The requirement for fonts to remain under this
> +licence does not affect any document created using the Font Software,
> +except any version of the Font Software extracted from a document
> +created using the Font Software may only be distributed under this
> +licence.
> +
> +TERMINATION
> +This licence becomes null and void if any of the above conditions are
> +not met.
> +
> +DISCLAIMER
> +THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
> +MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
> +COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
> +COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> +INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
> +DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM OTHER
> +DEALINGS IN THE FONT SOFTWARE.
> diff --git a/meta/files/common-licenses/Unlicense-libtelnet b/meta/files/=
common-licenses/Unlicense-libtelnet
> new file mode 100644
> index 00000000000..18d17880301
> --- /dev/null
> +++ b/meta/files/common-licenses/Unlicense-libtelnet
> @@ -0,0 +1 @@
> +The author or authors of this code dedicate any and all copyright intere=
st in this code to the public domain. We make this dedication for the benef=
it of the public at large and to the detriment of our heirs and successors.=
 We intend this dedication to be an overt act of relinquishment in perpetui=
ty of all present and future rights to this code under copyright law.
> diff --git a/meta/files/common-licenses/Unlicense-libwhirlpool b/meta/fil=
es/common-licenses/Unlicense-libwhirlpool
> new file mode 100644
> index 00000000000..11ead25c2d4
> --- /dev/null
> +++ b/meta/files/common-licenses/Unlicense-libwhirlpool
> @@ -0,0 +1,8 @@
> +This is free and unencumbered software released into the public domain.
> +Anyone is free to copy, modify, publish, use, compile, sell, or
> +distribute this software, either in source code form or as a compiled
> +binary, for any purpose, commercial or non-commercial, and by any means.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> +MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> diff --git a/meta/files/common-licenses/X11-swapped b/meta/files/common-l=
icenses/X11-swapped
> new file mode 100644
> index 00000000000..b023bd546ee
> --- /dev/null
> +++ b/meta/files/common-licenses/X11-swapped
> @@ -0,0 +1,23 @@
> +Copyright (c) 2008-2010 Derick Eddington.  All rights reserved.
> +
> +Permission is hereby granted, free of charge, to any person obtaining a
> +copy of this software and associated documentation files (the "Software"=
),
> +to deal in the Software without restriction, including without limitatio=
n
> +the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +and/or sell copies of the Software, and to permit persons to whom the
> +Software is furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included =
in
> +all copies or substantial portions of the Software.
> +
> +Except as contained in this notice, the name(s) of the above copyright
> +holders shall not be used in advertising or otherwise to promote the sal=
e,
> +use or other dealings in this Software without prior written authorizati=
on.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +DEALINGS IN THE SOFTWARE.
> diff --git a/meta/files/common-licenses/any-OSI-perl-modules b/meta/files=
/common-licenses/any-OSI-perl-modules
> new file mode 100644
> index 00000000000..108db04581a
> --- /dev/null
> +++ b/meta/files/common-licenses/any-OSI-perl-modules
> @@ -0,0 +1,11 @@
> +This software may be redistributed under the terms of the GPL, LGPL,
> +modified BSD, or Artistic license, or any of the other OSI approved
> +licenses listed at http://www.opensource.org/licenses/alphabetical.
> +Distribution is allowed under all of these licenses, or any smaller
> +subset of multiple or just one of these licenses.
> +
> +When using a packaged version, please refer to the package metadata to s=
ee
> +under which license terms it was distributed. Alternatively, a distribut=
or
> +may choose to replace the LICENSE section of the documentation and/or
> +include a LICENSE file to reflect the license(s) they chose to redistrib=
ute
> +under.
> diff --git a/meta/files/common-licenses/generic-xts b/meta/files/common-l=
icenses/generic-xts
> new file mode 100644
> index 00000000000..bf08a2b4216
> --- /dev/null
> +++ b/meta/files/common-licenses/generic-xts
> @@ -0,0 +1,17 @@
> +Copyright (C) 2008, Damien Miller
> +Copyright (C) 2011, Alex Hornung
> +
> +Permission to use, copy, and modify this software with or without fee
> +is hereby granted, provided that this entire notice is included in
> +all copies of any software which is or includes a copy or
> +modification of this software.
> +You may use this code under the GNU public license if you so wish. Pleas=
e
> +contribute changes back to the authors under this freer than GPL license
> +so that we may further the use of strong encryption without limitations =
to
> +all.
> +
> +THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR
> +IMPLIED WARRANTY. IN PARTICULAR, NONE OF THE AUTHORS MAKES ANY
> +REPRESENTATION OR WARRANTY OF ANY KIND CONCERNING THE
> +MERCHANTABILITY OF THIS SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR
> +PURPOSE.
> diff --git a/meta/files/common-licenses/jove b/meta/files/common-licenses=
/jove
> new file mode 100644
> index 00000000000..edcc31667ab
> --- /dev/null
> +++ b/meta/files/common-licenses/jove
> @@ -0,0 +1,4 @@
> +This program is Copyright (C) 1986-2002 by Jonathan Payne.  JOVE is
> +provided by Jonathan and Jovehacks without charge and without
> +warranty.  You may copy, modify, and/or distribute JOVE, provided that
> +this notice is included in all the source files and documentation.
> diff --git a/meta/files/common-licenses/libpng-1.6.35 b/meta/files/common=
-licenses/libpng-1.6.35
> new file mode 100644
> index 00000000000..cf3b98dfdb9
> --- /dev/null
> +++ b/meta/files/common-licenses/libpng-1.6.35
> @@ -0,0 +1,96 @@
> +PNG Reference Library License version 1 (for libpng 0.5 through 1.6.35)
> +-----------------------------------------------------------------------
> +
> +libpng versions 1.0.7, July 1, 2000, through 1.6.35, July 15, 2018 are
> +Copyright (c) 2000-2002, 2004, 2006-2018 Glenn Randers-Pehrson, are
> +derived from libpng-1.0.6, and are distributed according to the same
> +disclaimer and license as libpng-1.0.6 with the following individuals
> +added to the list of Contributing Authors:
> +
> +    Simon-Pierre Cadieux
> +    Eric S. Raymond
> +    Mans Rullgard
> +    Cosmin Truta
> +    Gilles Vollant
> +    James Yu
> +    Mandar Sahastrabuddhe
> +    Google Inc.
> +    Vadim Barkov
> +
> +and with the following additions to the disclaimer:
> +
> +    There is no warranty against interference with your enjoyment of
> +    the library or against infringement.  There is no warranty that our
> +    efforts or the library will fulfill any of your particular purposes
> +    or needs.  This library is provided with all faults, and the entire
> +    risk of satisfactory quality, performance, accuracy, and effort is
> +    with the user.
> +
> +Some files in the "contrib" directory and some configure-generated
> +files that are distributed with libpng have other copyright owners, and
> +are released under other open source licenses.
> +
> +libpng versions 0.97, January 1998, through 1.0.6, March 20, 2000, are
> +Copyright (c) 1998-2000 Glenn Randers-Pehrson, are derived from
> +libpng-0.96, and are distributed according to the same disclaimer and
> +license as libpng-0.96, with the following individuals added to the
> +list of Contributing Authors:
> +
> +    Tom Lane
> +    Glenn Randers-Pehrson
> +    Willem van Schaik
> +
> +libpng versions 0.89, June 1996, through 0.96, May 1997, are
> +Copyright (c) 1996-1997 Andreas Dilger, are derived from libpng-0.88,
> +and are distributed according to the same disclaimer and license as
> +libpng-0.88, with the following individuals added to the list of
> +Contributing Authors:
> +
> +    John Bowler
> +    Kevin Bracey
> +    Sam Bushell
> +    Magnus Holmgren
> +    Greg Roelofs
> +    Tom Tanner
> +
> +Some files in the "scripts" directory have other copyright owners,
> +but are released under this license.
> +
> +libpng versions 0.5, May 1995, through 0.88, January 1996, are
> +Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
> +
> +For the purposes of this copyright and license, "Contributing Authors"
> +is defined as the following set of individuals:
> +
> +    Andreas Dilger
> +    Dave Martindale
> +    Guy Eric Schalnat
> +    Paul Schmidt
> +    Tim Wegner
> +
> +The PNG Reference Library is supplied "AS IS".  The Contributing
> +Authors and Group 42, Inc. disclaim all warranties, expressed or
> +implied, including, without limitation, the warranties of
> +merchantability and of fitness for any purpose.  The Contributing
> +Authors and Group 42, Inc. assume no liability for direct, indirect,
> +incidental, special, exemplary, or consequential damages, which may
> +result from the use of the PNG Reference Library, even if advised of
> +the possibility of such damage.
> +
> +Permission is hereby granted to use, copy, modify, and distribute this
> +source code, or portions hereof, for any purpose, without fee, subject
> +to the following restrictions:
> +
> + 1. The origin of this source code must not be misrepresented.
> +
> + 2. Altered versions must be plainly marked as such and must not
> +    be misrepresented as being the original source.
> +
> + 3. This Copyright notice may not be removed or altered from any
> +    source or altered source distribution.
> +
> +The Contributing Authors and Group 42, Inc. specifically permit,
> +without fee, and encourage the use of this source code as a component
> +to supporting the PNG file format in commercial products.  If you use
> +this source code in a product, acknowledgment is not required but would
> +be appreciated.
> diff --git a/meta/files/common-licenses/man2html b/meta/files/common-lice=
nses/man2html
> new file mode 100644
> index 00000000000..42d61d3af56
> --- /dev/null
> +++ b/meta/files/common-licenses/man2html
> @@ -0,0 +1,2 @@
> +Permission is granted to distribute, modify and use this program
> +as long as this comment is not removed or changed.
> diff --git a/meta/files/common-licenses/ngrep b/meta/files/common-license=
s/ngrep
> new file mode 100644
> index 00000000000..6b970e466b6
> --- /dev/null
> +++ b/meta/files/common-licenses/ngrep
> @@ -0,0 +1,38 @@
> +Copyright (c) 2017 Jordan Ritter.  All rights reserved.
> +
> +Permission is granted to anyone to use this software for any purpose on
> +any computer system, and to alter it and redistribute it, subject
> +to the following restrictions:
> +
> +1. The origin of this software must not be misrepresented, either by
> +   explicit claim or by omission.
> +
> +2. Altered versions must be plainly marked as such, and must not be
> +   misrepresented as being the original software.  Any altered version
> +   must clearly and properly represent the origin of this software in
> +   any accompanying documentation.
> +
> +3. All advertising materials which relate specifically to derivate
> +   works of this software must display the following acknowledgement:
> +   This product includes software developed by Jordan Ritter.
> +
> +4. The name of the Author may not be used to endorse or promote
> +   products derived from this software without specific prior written
> +   permission.
> +
> +5. This notice, and any references to this notice, in any original or
> +   derived source distribution of or documentation for this software,
> +   may not be removed or altered.
> +
> +
> +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> +PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
> +BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> +BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> +WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
> +OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
> +IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/meta/files/common-licenses/wwl b/meta/files/common-licenses/=
wwl
> new file mode 100644
> index 00000000000..12486ff6382
> --- /dev/null
> +++ b/meta/files/common-licenses/wwl
> @@ -0,0 +1,5 @@
> +db@FreeBSD.ORG wrote this file.  As long as you retain this notice you
> +can do whatever you want with this code, except you may not
> +license it under any form of the GPL.
> +A postcard or QSL card showing me you appreciate
> +this code would be nice. Diane Bruce va3db
> diff --git a/meta/files/spdx-licenses.json b/meta/files/spdx-licenses.jso=
n
> index 1af30611213..a568067dd96 100644
> --- a/meta/files/spdx-licenses.json
> +++ b/meta/files/spdx-licenses.json
> @@ -1,5 +1,5 @@
>  {
> -  "licenseListVersion": "3.24.0",
> +  "licenseListVersion": "3.27.0",
>    "licenses": [
>      {
>        "detailsUrl": "https://spdx.org/licenses/0BSD.json",
> @@ -8,7 +8,7 @@
>        "licenseId": "0BSD",
>        "name": "BSD Zero Clause License",
>        "reference": "https://spdx.org/licenses/0BSD.html",
> -      "referenceNumber": 537,
> +      "referenceNumber": 316,
>        "seeAlso": [
>          "http://landley.net/toybox/license.html",
>          "https://opensource.org/licenses/0BSD"
> @@ -21,7 +21,7 @@
>        "licenseId": "3D-Slicer-1.0",
>        "name": "3D Slicer License v1.0",
>        "reference": "https://spdx.org/licenses/3D-Slicer-1.0.html",
> -      "referenceNumber": 200,
> +      "referenceNumber": 61,
>        "seeAlso": [
>          "https://slicer.org/LICENSE",
>          "https://github.com/Slicer/Slicer/blob/main/License.txt"
> @@ -34,7 +34,7 @@
>        "licenseId": "AAL",
>        "name": "Attribution Assurance License",
>        "reference": "https://spdx.org/licenses/AAL.html",
> -      "referenceNumber": 406,
> +      "referenceNumber": 424,
>        "seeAlso": [
>          "https://opensource.org/licenses/attribution"
>        ]
> @@ -46,7 +46,7 @@
>        "licenseId": "Abstyles",
>        "name": "Abstyles License",
>        "reference": "https://spdx.org/licenses/Abstyles.html",
> -      "referenceNumber": 526,
> +      "referenceNumber": 252,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Abstyles"
>        ]
> @@ -58,7 +58,7 @@
>        "licenseId": "AdaCore-doc",
>        "name": "AdaCore Doc License",
>        "reference": "https://spdx.org/licenses/AdaCore-doc.html",
> -      "referenceNumber": 382,
> +      "referenceNumber": 315,
>        "seeAlso": [
>          "https://github.com/AdaCore/xmlada/blob/master/docs/index.rst",
>          "https://github.com/AdaCore/gnatcoll-core/blob/master/docs/index=
.rst",
> @@ -72,7 +72,7 @@
>        "licenseId": "Adobe-2006",
>        "name": "Adobe Systems Incorporated Source Code License Agreement"=
,
>        "reference": "https://spdx.org/licenses/Adobe-2006.html",
> -      "referenceNumber": 558,
> +      "referenceNumber": 658,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
>        ]
> @@ -84,7 +84,7 @@
>        "licenseId": "Adobe-Display-PostScript",
>        "name": "Adobe Display PostScript License",
>        "reference": "https://spdx.org/licenses/Adobe-Display-PostScript.h=
tml",
> -      "referenceNumber": 431,
> +      "referenceNumber": 499,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type=3Dheads#L752"
>        ]
> @@ -96,7 +96,7 @@
>        "licenseId": "Adobe-Glyph",
>        "name": "Adobe Glyph List License",
>        "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
> -      "referenceNumber": 297,
> +      "referenceNumber": 492,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
>        ]
> @@ -108,7 +108,7 @@
>        "licenseId": "Adobe-Utopia",
>        "name": "Adobe Utopia Font License",
>        "reference": "https://spdx.org/licenses/Adobe-Utopia.html",
> -      "referenceNumber": 532,
> +      "referenceNumber": 554,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/font/adobe-utopia-100dpi/-/=
blob/master/COPYING?ref_type=3Dheads"
>        ]
> @@ -120,7 +120,7 @@
>        "licenseId": "ADSL",
>        "name": "Amazon Digital Services License",
>        "reference": "https://spdx.org/licenses/ADSL.html",
> -      "referenceNumber": 463,
> +      "referenceNumber": 76,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesL=
icense"
>        ]
> @@ -133,7 +133,7 @@
>        "licenseId": "AFL-1.1",
>        "name": "Academic Free License v1.1",
>        "reference": "https://spdx.org/licenses/AFL-1.1.html",
> -      "referenceNumber": 601,
> +      "referenceNumber": 7,
>        "seeAlso": [
>          "http://opensource.linux-mirror.org/licenses/afl-1.1.txt",
>          "http://wayback.archive.org/web/20021004124254/http://www.openso=
urce.org/licenses/academic.php"
> @@ -147,7 +147,7 @@
>        "licenseId": "AFL-1.2",
>        "name": "Academic Free License v1.2",
>        "reference": "https://spdx.org/licenses/AFL-1.2.html",
> -      "referenceNumber": 72,
> +      "referenceNumber": 480,
>        "seeAlso": [
>          "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
>          "http://wayback.archive.org/web/20021204204652/http://www.openso=
urce.org/licenses/academic.php"
> @@ -161,7 +161,7 @@
>        "licenseId": "AFL-2.0",
>        "name": "Academic Free License v2.0",
>        "reference": "https://spdx.org/licenses/AFL-2.0.html",
> -      "referenceNumber": 187,
> +      "referenceNumber": 41,
>        "seeAlso": [
>          "http://wayback.archive.org/web/20060924134533/http://www.openso=
urce.org/licenses/afl-2.0.txt"
>        ]
> @@ -174,7 +174,7 @@
>        "licenseId": "AFL-2.1",
>        "name": "Academic Free License v2.1",
>        "reference": "https://spdx.org/licenses/AFL-2.1.html",
> -      "referenceNumber": 383,
> +      "referenceNumber": 682,
>        "seeAlso": [
>          "http://opensource.linux-mirror.org/licenses/afl-2.1.txt"
>        ]
> @@ -187,7 +187,7 @@
>        "licenseId": "AFL-3.0",
>        "name": "Academic Free License v3.0",
>        "reference": "https://spdx.org/licenses/AFL-3.0.html",
> -      "referenceNumber": 369,
> +      "referenceNumber": 343,
>        "seeAlso": [
>          "http://www.rosenlaw.com/AFL3.0.htm",
>          "https://opensource.org/licenses/afl-3.0"
> @@ -200,7 +200,7 @@
>        "licenseId": "Afmparse",
>        "name": "Afmparse License",
>        "reference": "https://spdx.org/licenses/Afmparse.html",
> -      "referenceNumber": 345,
> +      "referenceNumber": 84,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Afmparse"
>        ]
> @@ -213,7 +213,7 @@
>        "licenseId": "AGPL-1.0",
>        "name": "Affero General Public License v1.0",
>        "reference": "https://spdx.org/licenses/AGPL-1.0.html",
> -      "referenceNumber": 221,
> +      "referenceNumber": 38,
>        "seeAlso": [
>          "http://www.affero.org/oagpl.html"
>        ]
> @@ -225,7 +225,7 @@
>        "licenseId": "AGPL-1.0-only",
>        "name": "Affero General Public License v1.0 only",
>        "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
> -      "referenceNumber": 334,
> +      "referenceNumber": 415,
>        "seeAlso": [
>          "http://www.affero.org/oagpl.html"
>        ]
> @@ -237,7 +237,7 @@
>        "licenseId": "AGPL-1.0-or-later",
>        "name": "Affero General Public License v1.0 or later",
>        "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
> -      "referenceNumber": 527,
> +      "referenceNumber": 24,
>        "seeAlso": [
>          "http://www.affero.org/oagpl.html"
>        ]
> @@ -250,7 +250,7 @@
>        "licenseId": "AGPL-3.0",
>        "name": "GNU Affero General Public License v3.0",
>        "reference": "https://spdx.org/licenses/AGPL-3.0.html",
> -      "referenceNumber": 394,
> +      "referenceNumber": 427,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/agpl.txt",
>          "https://opensource.org/licenses/AGPL-3.0"
> @@ -264,7 +264,7 @@
>        "licenseId": "AGPL-3.0-only",
>        "name": "GNU Affero General Public License v3.0 only",
>        "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
> -      "referenceNumber": 123,
> +      "referenceNumber": 191,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/agpl.txt",
>          "https://opensource.org/licenses/AGPL-3.0"
> @@ -278,7 +278,7 @@
>        "licenseId": "AGPL-3.0-or-later",
>        "name": "GNU Affero General Public License v3.0 or later",
>        "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
> -      "referenceNumber": 105,
> +      "referenceNumber": 469,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/agpl.txt",
>          "https://opensource.org/licenses/AGPL-3.0"
> @@ -292,7 +292,7 @@
>        "licenseId": "Aladdin",
>        "name": "Aladdin Free Public License",
>        "reference": "https://spdx.org/licenses/Aladdin.html",
> -      "referenceNumber": 168,
> +      "referenceNumber": 495,
>        "seeAlso": [
>          "http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.01/Public.htm"
>        ]
> @@ -304,7 +304,7 @@
>        "licenseId": "AMD-newlib",
>        "name": "AMD newlib License",
>        "reference": "https://spdx.org/licenses/AMD-newlib.html",
> -      "referenceNumber": 222,
> +      "referenceNumber": 437,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/sys/a29khif/_close.S;h=3D04f52ae00de1dafbd9055ad8d73c5c697a3aae=
7f;hb=3DHEAD"
>        ]
> @@ -316,7 +316,7 @@
>        "licenseId": "AMDPLPA",
>        "name": "AMD's plpa_map.c License",
>        "reference": "https://spdx.org/licenses/AMDPLPA.html",
> -      "referenceNumber": 149,
> +      "referenceNumber": 194,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/AMD_plpa_map_License"
>        ]
> @@ -328,7 +328,7 @@
>        "licenseId": "AML",
>        "name": "Apple MIT License",
>        "reference": "https://spdx.org/licenses/AML.html",
> -      "referenceNumber": 13,
> +      "referenceNumber": 644,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Apple_MIT_License"
>        ]
> @@ -340,7 +340,7 @@
>        "licenseId": "AML-glslang",
>        "name": "AML glslang variant License",
>        "reference": "https://spdx.org/licenses/AML-glslang.html",
> -      "referenceNumber": 1,
> +      "referenceNumber": 439,
>        "seeAlso": [
>          "https://github.com/KhronosGroup/glslang/blob/main/LICENSE.txt#L=
949",
>          "https://docs.omniverse.nvidia.com/install-guide/latest/common/l=
icenses.html"
> @@ -353,7 +353,7 @@
>        "licenseId": "AMPAS",
>        "name": "Academy of Motion Picture Arts and Sciences BSD",
>        "reference": "https://spdx.org/licenses/AMPAS.html",
> -      "referenceNumber": 420,
> +      "referenceNumber": 15,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/BSD#AMPASBSD"
>        ]
> @@ -365,7 +365,7 @@
>        "licenseId": "ANTLR-PD",
>        "name": "ANTLR Software Rights Notice",
>        "reference": "https://spdx.org/licenses/ANTLR-PD.html",
> -      "referenceNumber": 576,
> +      "referenceNumber": 25,
>        "seeAlso": [
>          "http://www.antlr2.org/license.html"
>        ]
> @@ -377,7 +377,7 @@
>        "licenseId": "ANTLR-PD-fallback",
>        "name": "ANTLR Software Rights Notice with license fallback",
>        "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
> -      "referenceNumber": 194,
> +      "referenceNumber": 218,
>        "seeAlso": [
>          "http://www.antlr2.org/license.html"
>        ]
> @@ -389,11 +389,25 @@
>        "licenseId": "any-OSI",
>        "name": "Any OSI License",
>        "reference": "https://spdx.org/licenses/any-OSI.html",
> -      "referenceNumber": 121,
> +      "referenceNumber": 74,
>        "seeAlso": [
>          "https://metacpan.org/pod/Exporter::Tidy#LICENSE"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/any-OSI-perl-modules.json=
",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "any-OSI-perl-modules",
> +      "name": "Any OSI License - Perl Modules",
> +      "reference": "https://spdx.org/licenses/any-OSI-perl-modules.html"=
,
> +      "referenceNumber": 230,
> +      "seeAlso": [
> +        "https://metacpan.org/release/JUERD/Exporter-Tidy-0.09/view/Tidy=
.pm#LICENSE",
> +        "https://metacpan.org/pod/Qmail::Deliverable::Client#LICENSE",
> +        "https://metacpan.org/pod/Net::MQTT::Simple#LICENSE"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Apache-1.0.json",
>        "isDeprecatedLicenseId": false,
> @@ -402,7 +416,7 @@
>        "licenseId": "Apache-1.0",
>        "name": "Apache License 1.0",
>        "reference": "https://spdx.org/licenses/Apache-1.0.html",
> -      "referenceNumber": 616,
> +      "referenceNumber": 379,
>        "seeAlso": [
>          "http://www.apache.org/licenses/LICENSE-1.0"
>        ]
> @@ -415,7 +429,7 @@
>        "licenseId": "Apache-1.1",
>        "name": "Apache License 1.1",
>        "reference": "https://spdx.org/licenses/Apache-1.1.html",
> -      "referenceNumber": 313,
> +      "referenceNumber": 111,
>        "seeAlso": [
>          "http://apache.org/licenses/LICENSE-1.1",
>          "https://opensource.org/licenses/Apache-1.1"
> @@ -429,10 +443,11 @@
>        "licenseId": "Apache-2.0",
>        "name": "Apache License 2.0",
>        "reference": "https://spdx.org/licenses/Apache-2.0.html",
> -      "referenceNumber": 564,
> +      "referenceNumber": 162,
>        "seeAlso": [
>          "https://www.apache.org/licenses/LICENSE-2.0",
> -        "https://opensource.org/licenses/Apache-2.0"
> +        "https://opensource.org/licenses/Apache-2.0",
> +        "https://opensource.org/license/apache-2-0"
>        ]
>      },
>      {
> @@ -442,7 +457,7 @@
>        "licenseId": "APAFML",
>        "name": "Adobe Postscript AFM License",
>        "reference": "https://spdx.org/licenses/APAFML.html",
> -      "referenceNumber": 136,
> +      "referenceNumber": 474,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/AdobePostscriptAFM"
>        ]
> @@ -454,7 +469,7 @@
>        "licenseId": "APL-1.0",
>        "name": "Adaptive Public License 1.0",
>        "reference": "https://spdx.org/licenses/APL-1.0.html",
> -      "referenceNumber": 515,
> +      "referenceNumber": 127,
>        "seeAlso": [
>          "https://opensource.org/licenses/APL-1.0"
>        ]
> @@ -466,7 +481,7 @@
>        "licenseId": "App-s2p",
>        "name": "App::s2p License",
>        "reference": "https://spdx.org/licenses/App-s2p.html",
> -      "referenceNumber": 470,
> +      "referenceNumber": 155,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/App-s2p"
>        ]
> @@ -479,7 +494,7 @@
>        "licenseId": "APSL-1.0",
>        "name": "Apple Public Source License 1.0",
>        "reference": "https://spdx.org/licenses/APSL-1.0.html",
> -      "referenceNumber": 39,
> +      "referenceNumber": 86,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Apple_Public_Source_Li=
cense_1.0"
>        ]
> @@ -491,7 +506,7 @@
>        "licenseId": "APSL-1.1",
>        "name": "Apple Public Source License 1.1",
>        "reference": "https://spdx.org/licenses/APSL-1.1.html",
> -      "referenceNumber": 582,
> +      "referenceNumber": 23,
>        "seeAlso": [
>          "http://www.opensource.apple.com/source/IOSerialFamily/IOSerialF=
amily-7/APPLE_LICENSE"
>        ]
> @@ -503,7 +518,7 @@
>        "licenseId": "APSL-1.2",
>        "name": "Apple Public Source License 1.2",
>        "reference": "https://spdx.org/licenses/APSL-1.2.html",
> -      "referenceNumber": 628,
> +      "referenceNumber": 265,
>        "seeAlso": [
>          "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
>        ]
> @@ -516,7 +531,7 @@
>        "licenseId": "APSL-2.0",
>        "name": "Apple Public Source License 2.0",
>        "reference": "https://spdx.org/licenses/APSL-2.0.html",
> -      "referenceNumber": 144,
> +      "referenceNumber": 568,
>        "seeAlso": [
>          "http://www.opensource.apple.com/license/apsl/"
>        ]
> @@ -528,7 +543,7 @@
>        "licenseId": "Arphic-1999",
>        "name": "Arphic Public License",
>        "reference": "https://spdx.org/licenses/Arphic-1999.html",
> -      "referenceNumber": 131,
> +      "referenceNumber": 649,
>        "seeAlso": [
>          "http://ftp.gnu.org/gnu/non-gnu/chinese-fonts-truetype/LICENSE"
>        ]
> @@ -553,7 +568,7 @@
>        "licenseId": "Artistic-1.0-cl8",
>        "name": "Artistic License 1.0 w/clause 8",
>        "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
> -      "referenceNumber": 321,
> +      "referenceNumber": 291,
>        "seeAlso": [
>          "https://opensource.org/licenses/Artistic-1.0"
>        ]
> @@ -565,7 +580,7 @@
>        "licenseId": "Artistic-1.0-Perl",
>        "name": "Artistic License 1.0 (Perl)",
>        "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
> -      "referenceNumber": 652,
> +      "referenceNumber": 20,
>        "seeAlso": [
>          "http://dev.perl.org/licenses/artistic.html"
>        ]
> @@ -578,13 +593,37 @@
>        "licenseId": "Artistic-2.0",
>        "name": "Artistic License 2.0",
>        "reference": "https://spdx.org/licenses/Artistic-2.0.html",
> -      "referenceNumber": 355,
> +      "referenceNumber": 217,
>        "seeAlso": [
>          "http://www.perlfoundation.org/artistic_license_2_0",
>          "https://www.perlfoundation.org/artistic-license-20.html",
>          "https://opensource.org/licenses/artistic-license-2.0"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Artistic-dist.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Artistic-dist",
> +      "name": "Artistic License 1.0 (dist)",
> +      "reference": "https://spdx.org/licenses/Artistic-dist.html",
> +      "referenceNumber": 511,
> +      "seeAlso": [
> +        "https://github.com/pexip/os-perl/blob/833cf4c86cc465ccfc627ff16=
db67e783156a248/debian/copyright#L2720-L2845"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Aspell-RU.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Aspell-RU",
> +      "name": "Aspell Russian License",
> +      "reference": "https://spdx.org/licenses/Aspell-RU.html",
> +      "referenceNumber": 231,
> +      "seeAlso": [
> +        "https://ftp.gnu.org/gnu/aspell/dict/ru/aspell6-ru-0.99f7-1.tar.=
bz2"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.j=
son",
>        "isDeprecatedLicenseId": false,
> @@ -592,7 +631,7 @@
>        "licenseId": "ASWF-Digital-Assets-1.0",
>        "name": "ASWF Digital Assets License version 1.0",
>        "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.ht=
ml",
> -      "referenceNumber": 330,
> +      "referenceNumber": 340,
>        "seeAlso": [
>          "https://github.com/AcademySoftwareFoundation/foundation/blob/ma=
in/digital_assets/aswf_digital_assets_license_v1.0.txt"
>        ]
> @@ -604,7 +643,7 @@
>        "licenseId": "ASWF-Digital-Assets-1.1",
>        "name": "ASWF Digital Assets License 1.1",
>        "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.ht=
ml",
> -      "referenceNumber": 447,
> +      "referenceNumber": 153,
>        "seeAlso": [
>          "https://github.com/AcademySoftwareFoundation/foundation/blob/ma=
in/digital_assets/aswf_digital_assets_license_v1.1.txt"
>        ]
> @@ -616,7 +655,7 @@
>        "licenseId": "Baekmuk",
>        "name": "Baekmuk License",
>        "reference": "https://spdx.org/licenses/Baekmuk.html",
> -      "referenceNumber": 436,
> +      "referenceNumber": 311,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:Baekmuk?rd=3DLicensing=
/Baekmuk"
>        ]
> @@ -628,7 +667,7 @@
>        "licenseId": "Bahyph",
>        "name": "Bahyph License",
>        "reference": "https://spdx.org/licenses/Bahyph.html",
> -      "referenceNumber": 494,
> +      "referenceNumber": 505,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Bahyph"
>        ]
> @@ -640,7 +679,7 @@
>        "licenseId": "Barr",
>        "name": "Barr License",
>        "reference": "https://spdx.org/licenses/Barr.html",
> -      "referenceNumber": 48,
> +      "referenceNumber": 420,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Barr"
>        ]
> @@ -652,7 +691,7 @@
>        "licenseId": "bcrypt-Solar-Designer",
>        "name": "bcrypt Solar Designer License",
>        "reference": "https://spdx.org/licenses/bcrypt-Solar-Designer.html=
",
> -      "referenceNumber": 27,
> +      "referenceNumber": 167,
>        "seeAlso": [
>          "https://github.com/bcrypt-ruby/bcrypt-ruby/blob/master/ext/mri/=
crypt_blowfish.c"
>        ]
> @@ -664,7 +703,7 @@
>        "licenseId": "Beerware",
>        "name": "Beerware License",
>        "reference": "https://spdx.org/licenses/Beerware.html",
> -      "referenceNumber": 143,
> +      "referenceNumber": 556,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Beerware",
>          "https://people.freebsd.org/~phk/"
> @@ -677,7 +716,7 @@
>        "licenseId": "Bitstream-Charter",
>        "name": "Bitstream Charter Font License",
>        "reference": "https://spdx.org/licenses/Bitstream-Charter.html",
> -      "referenceNumber": 560,
> +      "referenceNumber": 47,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Charter#License_Text",
>          "https://raw.githubusercontent.com/blackhole89/notekit/master/da=
ta/fonts/Charter%20license.txt"
> @@ -690,7 +729,7 @@
>        "licenseId": "Bitstream-Vera",
>        "name": "Bitstream Vera Font License",
>        "reference": "https://spdx.org/licenses/Bitstream-Vera.html",
> -      "referenceNumber": 581,
> +      "referenceNumber": 208,
>        "seeAlso": [
>          "https://web.archive.org/web/20080207013128/http://www.gnome.org=
/fonts/",
>          "https://docubrain.com/sites/default/files/licenses/bitstream-ve=
ra.html"
> @@ -703,7 +742,7 @@
>        "licenseId": "BitTorrent-1.0",
>        "name": "BitTorrent Open Source License v1.0",
>        "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
> -      "referenceNumber": 373,
> +      "referenceNumber": 156,
>        "seeAlso": [
>          "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/license=
s/BitTorrent?r1=3D1.1&r2=3D1.1.1.1&diff_format=3Ds"
>        ]
> @@ -716,7 +755,7 @@
>        "licenseId": "BitTorrent-1.1",
>        "name": "BitTorrent Open Source License v1.1",
>        "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
> -      "referenceNumber": 288,
> +      "referenceNumber": 325,
>        "seeAlso": [
>          "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
>        ]
> @@ -728,7 +767,7 @@
>        "licenseId": "blessing",
>        "name": "SQLite Blessing",
>        "reference": "https://spdx.org/licenses/blessing.html",
> -      "referenceNumber": 469,
> +      "referenceNumber": 680,
>        "seeAlso": [
>          "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln=3D4-9",
>          "https://sqlite.org/src/artifact/df5091916dbb40e6"
> @@ -741,7 +780,7 @@
>        "licenseId": "BlueOak-1.0.0",
>        "name": "Blue Oak Model License 1.0.0",
>        "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
> -      "referenceNumber": 60,
> +      "referenceNumber": 51,
>        "seeAlso": [
>          "https://blueoakcouncil.org/license/1.0.0"
>        ]
> @@ -753,13 +792,25 @@
>        "licenseId": "Boehm-GC",
>        "name": "Boehm-Demers-Weiser GC License",
>        "reference": "https://spdx.org/licenses/Boehm-GC.html",
> -      "referenceNumber": 322,
> +      "referenceNumber": 92,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:MIT#Another_Minimal_va=
riant_(found_in_libatomic_ops)",
>          "https://github.com/uim/libgcroots/blob/master/COPYING",
>          "https://github.com/ivmai/libatomic_ops/blob/master/LICENSE"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Boehm-GC-without-fee.json=
",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Boehm-GC-without-fee",
> +      "name": "Boehm-Demers-Weiser GC License (without fee)",
> +      "reference": "https://spdx.org/licenses/Boehm-GC-without-fee.html"=
,
> +      "referenceNumber": 466,
> +      "seeAlso": [
> +        "https://github.com/MariaDB/server/blob/11.6/libmysqld/lib_sql.c=
c"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Borceux.json",
>        "isDeprecatedLicenseId": false,
> @@ -767,7 +818,7 @@
>        "licenseId": "Borceux",
>        "name": "Borceux license",
>        "reference": "https://spdx.org/licenses/Borceux.html",
> -      "referenceNumber": 552,
> +      "referenceNumber": 335,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Borceux"
>        ]
> @@ -779,7 +830,7 @@
>        "licenseId": "Brian-Gladman-2-Clause",
>        "name": "Brian Gladman 2-Clause License",
>        "reference": "https://spdx.org/licenses/Brian-Gladman-2-Clause.htm=
l",
> -      "referenceNumber": 457,
> +      "referenceNumber": 198,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L140=
-L156",
>          "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
> @@ -792,7 +843,7 @@
>        "licenseId": "Brian-Gladman-3-Clause",
>        "name": "Brian Gladman 3-Clause License",
>        "reference": "https://spdx.org/licenses/Brian-Gladman-3-Clause.htm=
l",
> -      "referenceNumber": 409,
> +      "referenceNumber": 675,
>        "seeAlso": [
>          "https://github.com/SWI-Prolog/packages-clib/blob/master/sha1/br=
g_endian.h"
>        ]
> @@ -804,7 +855,7 @@
>        "licenseId": "BSD-1-Clause",
>        "name": "BSD 1-Clause License",
>        "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
> -      "referenceNumber": 567,
> +      "referenceNumber": 286,
>        "seeAlso": [
>          "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=
=3D326823"
>        ]
> @@ -817,7 +868,7 @@
>        "licenseId": "BSD-2-Clause",
>        "name": "BSD 2-Clause \"Simplified\" License",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
> -      "referenceNumber": 264,
> +      "referenceNumber": 430,
>        "seeAlso": [
>          "https://opensource.org/licenses/BSD-2-Clause"
>        ]
> @@ -829,7 +880,7 @@
>        "licenseId": "BSD-2-Clause-Darwin",
>        "name": "BSD 2-Clause - Ian Darwin variant",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause-Darwin.html",
> -      "referenceNumber": 231,
> +      "referenceNumber": 477,
>        "seeAlso": [
>          "https://github.com/file/file/blob/master/COPYING"
>        ]
> @@ -841,7 +892,7 @@
>        "licenseId": "BSD-2-Clause-first-lines",
>        "name": "BSD 2-Clause - first lines requirement",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause-first-lines.h=
tml",
> -      "referenceNumber": 245,
> +      "referenceNumber": 543,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L664=
-L690",
>          "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
> @@ -855,7 +906,7 @@
>        "licenseId": "BSD-2-Clause-FreeBSD",
>        "name": "BSD 2-Clause FreeBSD License",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html"=
,
> -      "referenceNumber": 192,
> +      "referenceNumber": 622,
>        "seeAlso": [
>          "http://www.freebsd.org/copyright/freebsd-license.html"
>        ]
> @@ -868,7 +919,7 @@
>        "licenseId": "BSD-2-Clause-NetBSD",
>        "name": "BSD 2-Clause NetBSD License",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
> -      "referenceNumber": 449,
> +      "referenceNumber": 531,
>        "seeAlso": [
>          "http://www.netbsd.org/about/redistribution.html#default"
>        ]
> @@ -880,11 +931,24 @@
>        "licenseId": "BSD-2-Clause-Patent",
>        "name": "BSD-2-Clause Plus Patent License",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
> -      "referenceNumber": 612,
> +      "referenceNumber": 584,
>        "seeAlso": [
>          "https://opensource.org/licenses/BSDplusPatent"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-pkgconf-disc=
laimer.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "BSD-2-Clause-pkgconf-disclaimer",
> +      "name": "BSD 2-Clause pkgconf disclaimer variant",
> +      "reference": "https://spdx.org/licenses/BSD-2-Clause-pkgconf-discl=
aimer.html",
> +      "referenceNumber": 624,
> +      "seeAlso": [
> +        "https://github.com/audacious-media-player/audacious/blob/master=
/src/audacious/main.cc",
> +        "https://github.com/audacious-media-player/audacious/blob/master=
/COPYING"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Views.json",
>        "isDeprecatedLicenseId": false,
> @@ -892,7 +956,7 @@
>        "licenseId": "BSD-2-Clause-Views",
>        "name": "BSD 2-Clause with views sentence",
>        "reference": "https://spdx.org/licenses/BSD-2-Clause-Views.html",
> -      "referenceNumber": 657,
> +      "referenceNumber": 536,
>        "seeAlso": [
>          "http://www.freebsd.org/copyright/freebsd-license.html",
>          "https://people.freebsd.org/~ivoras/wine/patch-wine-nvidia.sh",
> @@ -907,7 +971,7 @@
>        "licenseId": "BSD-3-Clause",
>        "name": "BSD 3-Clause \"New\" or \"Revised\" License",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
> -      "referenceNumber": 216,
> +      "referenceNumber": 567,
>        "seeAlso": [
>          "https://opensource.org/licenses/BSD-3-Clause",
>          "https://www.eclipse.org/org/documents/edl-v10.php"
> @@ -920,7 +984,7 @@
>        "licenseId": "BSD-3-Clause-acpica",
>        "name": "BSD 3-Clause acpica variant",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-acpica.html",
> -      "referenceNumber": 408,
> +      "referenceNumber": 277,
>        "seeAlso": [
>          "https://github.com/acpica/acpica/blob/master/source/common/acfi=
leio.c#L119"
>        ]
> @@ -932,7 +996,7 @@
>        "licenseId": "BSD-3-Clause-Attribution",
>        "name": "BSD with attribution",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.h=
tml",
> -      "referenceNumber": 14,
> +      "referenceNumber": 159,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/BSD_with_Attribution"
>        ]
> @@ -945,7 +1009,7 @@
>        "licenseId": "BSD-3-Clause-Clear",
>        "name": "BSD 3-Clause Clear License",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
> -      "referenceNumber": 347,
> +      "referenceNumber": 259,
>        "seeAlso": [
>          "http://labs.metacarta.com/license-explanation.html#license"
>        ]
> @@ -957,7 +1021,7 @@
>        "licenseId": "BSD-3-Clause-flex",
>        "name": "BSD 3-Clause Flex variant",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-flex.html",
> -      "referenceNumber": 211,
> +      "referenceNumber": 205,
>        "seeAlso": [
>          "https://github.com/westes/flex/blob/master/COPYING"
>        ]
> @@ -969,7 +1033,7 @@
>        "licenseId": "BSD-3-Clause-HP",
>        "name": "Hewlett-Packard BSD variant license",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-HP.html",
> -      "referenceNumber": 210,
> +      "referenceNumber": 643,
>        "seeAlso": [
>          "https://github.com/zdohnal/hplip/blob/master/COPYING#L939"
>        ]
> @@ -981,7 +1045,7 @@
>        "licenseId": "BSD-3-Clause-LBNL",
>        "name": "Lawrence Berkeley National Labs BSD variant license",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
> -      "referenceNumber": 597,
> +      "referenceNumber": 6,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/LBNLBSD"
>        ]
> @@ -993,7 +1057,7 @@
>        "licenseId": "BSD-3-Clause-Modification",
>        "name": "BSD 3-Clause Modification",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.=
html",
> -      "referenceNumber": 364,
> +      "referenceNumber": 497,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Varia=
nt"
>        ]
> @@ -1005,7 +1069,7 @@
>        "licenseId": "BSD-3-Clause-No-Military-License",
>        "name": "BSD 3-Clause No Military License",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-L=
icense.html",
> -      "referenceNumber": 30,
> +      "referenceNumber": 498,
>        "seeAlso": [
>          "https://gitlab.syncad.com/hive/dhive/-/blob/master/LICENSE",
>          "https://github.com/greymass/swift-eosio/blob/master/LICENSE"
> @@ -1018,7 +1082,7 @@
>        "licenseId": "BSD-3-Clause-No-Nuclear-License",
>        "name": "BSD 3-Clause No Nuclear License",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Li=
cense.html",
> -      "referenceNumber": 21,
> +      "referenceNumber": 108,
>        "seeAlso": [
>          "http://download.oracle.com/otn-pub/java/licenses/bsd.txt"
>        ]
> @@ -1030,7 +1094,7 @@
>        "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
>        "name": "BSD 3-Clause No Nuclear License 2014",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Li=
cense-2014.html",
> -      "referenceNumber": 543,
> +      "referenceNumber": 239,
>        "seeAlso": [
>          "https://java.net/projects/javaeetutorial/pages/BerkeleyLicense"
>        ]
> @@ -1042,7 +1106,7 @@
>        "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
>        "name": "BSD 3-Clause No Nuclear Warranty",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Wa=
rranty.html",
> -      "referenceNumber": 402,
> +      "referenceNumber": 606,
>        "seeAlso": [
>          "https://jogamp.org/git/?p=3Dgluegen.git;a=3Dblob_plain;f=3DLICE=
NSE.txt"
>        ]
> @@ -1054,7 +1118,7 @@
>        "licenseId": "BSD-3-Clause-Open-MPI",
>        "name": "BSD 3-Clause Open MPI variant",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html=
",
> -      "referenceNumber": 376,
> +      "referenceNumber": 637,
>        "seeAlso": [
>          "https://www.open-mpi.org/community/license.php",
>          "http://www.netlib.org/lapack/LICENSE.txt"
> @@ -1067,7 +1131,7 @@
>        "licenseId": "BSD-3-Clause-Sun",
>        "name": "BSD 3-Clause Sun Microsystems",
>        "reference": "https://spdx.org/licenses/BSD-3-Clause-Sun.html",
> -      "referenceNumber": 554,
> +      "referenceNumber": 240,
>        "seeAlso": [
>          "https://github.com/xmlark/msv/blob/b9316e2f2270bc1606952ea4939e=
c87fbba157f3/xsdlib/src/main/java/com/sun/msv/datatype/regexp/InternalImpl.=
java"
>        ]
> @@ -1080,7 +1144,7 @@
>        "licenseId": "BSD-4-Clause",
>        "name": "BSD 4-Clause \"Original\" or \"Old\" License",
>        "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
> -      "referenceNumber": 650,
> +      "referenceNumber": 227,
>        "seeAlso": [
>          "http://directory.fsf.org/wiki/License:BSD_4Clause"
>        ]
> @@ -1092,7 +1156,7 @@
>        "licenseId": "BSD-4-Clause-Shortened",
>        "name": "BSD 4 Clause Shortened",
>        "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.htm=
l",
> -      "referenceNumber": 252,
> +      "referenceNumber": 269,
>        "seeAlso": [
>          "https://metadata.ftp-master.debian.org/changelogs//main/a/arpwa=
tch/arpwatch_2.1a15-7_copyright"
>        ]
> @@ -1104,7 +1168,7 @@
>        "licenseId": "BSD-4-Clause-UC",
>        "name": "BSD-4-Clause (University of California-Specific)",
>        "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
> -      "referenceNumber": 117,
> +      "referenceNumber": 21,
>        "seeAlso": [
>          "http://www.freebsd.org/copyright/license.html"
>        ]
> @@ -1116,7 +1180,7 @@
>        "licenseId": "BSD-4.3RENO",
>        "name": "BSD 4.3 RENO License",
>        "reference": "https://spdx.org/licenses/BSD-4.3RENO.html",
> -      "referenceNumber": 298,
> +      "referenceNumber": 434,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dl=
ibiberty/strcasecmp.c;h=3D131d81c2ce7881fa48c363dc5bf5fb302c61ce0b;hb=3DHEA=
D",
>          "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRI=
GHT#L55-63"
> @@ -1129,7 +1193,7 @@
>        "licenseId": "BSD-4.3TAHOE",
>        "name": "BSD 4.3 TAHOE License",
>        "reference": "https://spdx.org/licenses/BSD-4.3TAHOE.html",
> -      "referenceNumber": 0,
> +      "referenceNumber": 685,
>        "seeAlso": [
>          "https://github.com/389ds/389-ds-base/blob/main/ldap/include/sys=
exits-compat.h#L15",
>          "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.te=
xi?id=3Da74c6b4ee49397cf330b333da1042bffa60ed14f#n1788"
> @@ -1142,7 +1206,7 @@
>        "licenseId": "BSD-Advertising-Acknowledgement",
>        "name": "BSD Advertising Acknowledgement License",
>        "reference": "https://spdx.org/licenses/BSD-Advertising-Acknowledg=
ement.html",
> -      "referenceNumber": 423,
> +      "referenceNumber": 345,
>        "seeAlso": [
>          "https://github.com/python-excel/xlrd/blob/master/LICENSE#L33"
>        ]
> @@ -1154,7 +1218,7 @@
>        "licenseId": "BSD-Attribution-HPND-disclaimer",
>        "name": "BSD with Attribution and HPND disclaimer",
>        "reference": "https://spdx.org/licenses/BSD-Attribution-HPND-discl=
aimer.html",
> -      "referenceNumber": 171,
> +      "referenceNumber": 506,
>        "seeAlso": [
>          "https://github.com/cyrusimap/cyrus-sasl/blob/master/COPYING"
>        ]
> @@ -1166,7 +1230,7 @@
>        "licenseId": "BSD-Inferno-Nettverk",
>        "name": "BSD-Inferno-Nettverk",
>        "reference": "https://spdx.org/licenses/BSD-Inferno-Nettverk.html"=
,
> -      "referenceNumber": 401,
> +      "referenceNumber": 535,
>        "seeAlso": [
>          "https://www.inet.no/dante/LICENSE"
>        ]
> @@ -1178,7 +1242,7 @@
>        "licenseId": "BSD-Protection",
>        "name": "BSD Protection License",
>        "reference": "https://spdx.org/licenses/BSD-Protection.html",
> -      "referenceNumber": 403,
> +      "referenceNumber": 163,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License=
"
>        ]
> @@ -1190,7 +1254,7 @@
>        "licenseId": "BSD-Source-beginning-file",
>        "name": "BSD Source Code Attribution - beginning of file variant",
>        "reference": "https://spdx.org/licenses/BSD-Source-beginning-file.=
html",
> -      "referenceNumber": 97,
> +      "referenceNumber": 383,
>        "seeAlso": [
>          "https://github.com/lattera/freebsd/blob/master/sys/cam/cam.c#L4=
"
>        ]
> @@ -1202,7 +1266,7 @@
>        "licenseId": "BSD-Source-Code",
>        "name": "BSD Source Code Attribution",
>        "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
> -      "referenceNumber": 22,
> +      "referenceNumber": 450,
>        "seeAlso": [
>          "https://github.com/robbiehanson/CocoaHTTPServer/blob/master/LIC=
ENSE.txt"
>        ]
> @@ -1214,7 +1278,7 @@
>        "licenseId": "BSD-Systemics",
>        "name": "Systemics BSD variant license",
>        "reference": "https://spdx.org/licenses/BSD-Systemics.html",
> -      "referenceNumber": 178,
> +      "referenceNumber": 602,
>        "seeAlso": [
>          "https://metacpan.org/release/DPARIS/Crypt-DES-2.07/source/COPYR=
IGHT"
>        ]
> @@ -1226,7 +1290,7 @@
>        "licenseId": "BSD-Systemics-W3Works",
>        "name": "Systemics W3Works BSD variant license",
>        "reference": "https://spdx.org/licenses/BSD-Systemics-W3Works.html=
",
> -      "referenceNumber": 350,
> +      "referenceNumber": 422,
>        "seeAlso": [
>          "https://metacpan.org/release/DPARIS/Crypt-Blowfish-2.14/source/=
COPYRIGHT#L7"
>        ]
> @@ -1239,7 +1303,7 @@
>        "licenseId": "BSL-1.0",
>        "name": "Boost Software License 1.0",
>        "reference": "https://spdx.org/licenses/BSL-1.0.html",
> -      "referenceNumber": 514,
> +      "referenceNumber": 130,
>        "seeAlso": [
>          "http://www.boost.org/LICENSE_1_0.txt",
>          "https://opensource.org/licenses/BSL-1.0"
> @@ -1252,7 +1316,7 @@
>        "licenseId": "BUSL-1.1",
>        "name": "Business Source License 1.1",
>        "reference": "https://spdx.org/licenses/BUSL-1.1.html",
> -      "referenceNumber": 549,
> +      "referenceNumber": 234,
>        "seeAlso": [
>          "https://mariadb.com/bsl11/"
>        ]
> @@ -1264,7 +1328,7 @@
>        "licenseId": "bzip2-1.0.5",
>        "name": "bzip2 and libbzip2 License v1.0.5",
>        "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
> -      "referenceNumber": 419,
> +      "referenceNumber": 412,
>        "seeAlso": [
>          "https://sourceware.org/bzip2/1.0.5/bzip2-manual-1.0.5.html",
>          "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
> @@ -1277,7 +1341,7 @@
>        "licenseId": "bzip2-1.0.6",
>        "name": "bzip2 and libbzip2 License v1.0.6",
>        "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
> -      "referenceNumber": 396,
> +      "referenceNumber": 243,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dbzip2.git;a=3Dblob;f=3DLICENSE;=
hb=3Dbzip2-1.0.6",
>          "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html",
> @@ -1291,7 +1355,7 @@
>        "licenseId": "C-UDA-1.0",
>        "name": "Computational Use of Data Agreement v1.0",
>        "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
> -      "referenceNumber": 432,
> +      "referenceNumber": 660,
>        "seeAlso": [
>          "https://github.com/microsoft/Computational-Use-of-Data-Agreemen=
t/blob/master/C-UDA-1.0.md",
>          "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
> @@ -1304,7 +1368,7 @@
>        "licenseId": "CAL-1.0",
>        "name": "Cryptographic Autonomy License 1.0",
>        "reference": "https://spdx.org/licenses/CAL-1.0.html",
> -      "referenceNumber": 653,
> +      "referenceNumber": 305,
>        "seeAlso": [
>          "http://cryptographicautonomylicense.com/license-text.html",
>          "https://opensource.org/licenses/CAL-1.0"
> @@ -1317,7 +1381,7 @@
>        "licenseId": "CAL-1.0-Combined-Work-Exception",
>        "name": "Cryptographic Autonomy License 1.0 (Combined Work Excepti=
on)",
>        "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Exce=
ption.html",
> -      "referenceNumber": 217,
> +      "referenceNumber": 569,
>        "seeAlso": [
>          "http://cryptographicautonomylicense.com/license-text.html",
>          "https://opensource.org/licenses/CAL-1.0"
> @@ -1330,7 +1394,7 @@
>        "licenseId": "Caldera",
>        "name": "Caldera License",
>        "reference": "https://spdx.org/licenses/Caldera.html",
> -      "referenceNumber": 622,
> +      "referenceNumber": 483,
>        "seeAlso": [
>          "http://www.lemis.com/grog/UNIX/ancient-source-all.pdf"
>        ]
> @@ -1342,7 +1406,7 @@
>        "licenseId": "Caldera-no-preamble",
>        "name": "Caldera License (without preamble)",
>        "reference": "https://spdx.org/licenses/Caldera-no-preamble.html",
> -      "referenceNumber": 585,
> +      "referenceNumber": 401,
>        "seeAlso": [
>          "https://github.com/apache/apr/blob/trunk/LICENSE#L298C6-L298C29=
"
>        ]
> @@ -1354,7 +1418,7 @@
>        "licenseId": "Catharon",
>        "name": "Catharon License",
>        "reference": "https://spdx.org/licenses/Catharon.html",
> -      "referenceNumber": 45,
> +      "referenceNumber": 581,
>        "seeAlso": [
>          "https://github.com/scummvm/scummvm/blob/v2.8.0/LICENSES/Catharo=
nLicense.txt"
>        ]
> @@ -1366,7 +1430,7 @@
>        "licenseId": "CATOSL-1.1",
>        "name": "Computer Associates Trusted Open Source License 1.1",
>        "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
> -      "referenceNumber": 193,
> +      "referenceNumber": 97,
>        "seeAlso": [
>          "https://opensource.org/licenses/CATOSL-1.1"
>        ]
> @@ -1378,7 +1442,7 @@
>        "licenseId": "CC-BY-1.0",
>        "name": "Creative Commons Attribution 1.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
> -      "referenceNumber": 37,
> +      "referenceNumber": 559,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/1.0/legalcode"
>        ]
> @@ -1390,7 +1454,7 @@
>        "licenseId": "CC-BY-2.0",
>        "name": "Creative Commons Attribution 2.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
> -      "referenceNumber": 241,
> +      "referenceNumber": 441,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/2.0/legalcode"
>        ]
> @@ -1402,7 +1466,7 @@
>        "licenseId": "CC-BY-2.5",
>        "name": "Creative Commons Attribution 2.5 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
> -      "referenceNumber": 129,
> +      "referenceNumber": 292,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/2.5/legalcode"
>        ]
> @@ -1414,7 +1478,7 @@
>        "licenseId": "CC-BY-2.5-AU",
>        "name": "Creative Commons Attribution 2.5 Australia",
>        "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
> -      "referenceNumber": 583,
> +      "referenceNumber": 126,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/2.5/au/legalcode"
>        ]
> @@ -1426,7 +1490,7 @@
>        "licenseId": "CC-BY-3.0",
>        "name": "Creative Commons Attribution 3.0 Unported",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
> -      "referenceNumber": 302,
> +      "referenceNumber": 576,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/legalcode"
>        ]
> @@ -1438,7 +1502,7 @@
>        "licenseId": "CC-BY-3.0-AT",
>        "name": "Creative Commons Attribution 3.0 Austria",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
> -      "referenceNumber": 324,
> +      "referenceNumber": 107,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/at/legalcode"
>        ]
> @@ -1450,7 +1514,7 @@
>        "licenseId": "CC-BY-3.0-AU",
>        "name": "Creative Commons Attribution 3.0 Australia",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0-AU.html",
> -      "referenceNumber": 342,
> +      "referenceNumber": 648,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/au/legalcode"
>        ]
> @@ -1462,7 +1526,7 @@
>        "licenseId": "CC-BY-3.0-DE",
>        "name": "Creative Commons Attribution 3.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
> -      "referenceNumber": 239,
> +      "referenceNumber": 458,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/de/legalcode"
>        ]
> @@ -1474,7 +1538,7 @@
>        "licenseId": "CC-BY-3.0-IGO",
>        "name": "Creative Commons Attribution 3.0 IGO",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0-IGO.html",
> -      "referenceNumber": 19,
> +      "referenceNumber": 410,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/igo/legalcode"
>        ]
> @@ -1486,7 +1550,7 @@
>        "licenseId": "CC-BY-3.0-NL",
>        "name": "Creative Commons Attribution 3.0 Netherlands",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
> -      "referenceNumber": 501,
> +      "referenceNumber": 436,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/nl/legalcode"
>        ]
> @@ -1498,7 +1562,7 @@
>        "licenseId": "CC-BY-3.0-US",
>        "name": "Creative Commons Attribution 3.0 United States",
>        "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
> -      "referenceNumber": 569,
> +      "referenceNumber": 366,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/3.0/us/legalcode"
>        ]
> @@ -1511,7 +1575,7 @@
>        "licenseId": "CC-BY-4.0",
>        "name": "Creative Commons Attribution 4.0 International",
>        "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
> -      "referenceNumber": 265,
> +      "referenceNumber": 66,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by/4.0/legalcode"
>        ]
> @@ -1524,7 +1588,7 @@
>        "licenseId": "CC-BY-NC-1.0",
>        "name": "Creative Commons Attribution Non Commercial 1.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
> -      "referenceNumber": 167,
> +      "referenceNumber": 428,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc/1.0/legalcode"
>        ]
> @@ -1537,7 +1601,7 @@
>        "licenseId": "CC-BY-NC-2.0",
>        "name": "Creative Commons Attribution Non Commercial 2.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
> -      "referenceNumber": 92,
> +      "referenceNumber": 553,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc/2.0/legalcode"
>        ]
> @@ -1550,7 +1614,7 @@
>        "licenseId": "CC-BY-NC-2.5",
>        "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
> -      "referenceNumber": 253,
> +      "referenceNumber": 49,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc/2.5/legalcode"
>        ]
> @@ -1563,7 +1627,7 @@
>        "licenseId": "CC-BY-NC-3.0",
>        "name": "Creative Commons Attribution Non Commercial 3.0 Unported"=
,
>        "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
> -      "referenceNumber": 199,
> +      "referenceNumber": 686,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc/3.0/legalcode"
>        ]
> @@ -1575,7 +1639,7 @@
>        "licenseId": "CC-BY-NC-3.0-DE",
>        "name": "Creative Commons Attribution Non Commercial 3.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
> -      "referenceNumber": 429,
> +      "referenceNumber": 324,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc/3.0/de/legalcode"
>        ]
> @@ -1588,7 +1652,7 @@
>        "licenseId": "CC-BY-NC-4.0",
>        "name": "Creative Commons Attribution Non Commercial 4.0 Internati=
onal",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
> -      "referenceNumber": 188,
> +      "referenceNumber": 560,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
>        ]
> @@ -1600,7 +1664,7 @@
>        "licenseId": "CC-BY-NC-ND-1.0",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 1.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
> -      "referenceNumber": 365,
> +      "referenceNumber": 442,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd-nc/1.0/legalcode"
>        ]
> @@ -1612,7 +1676,7 @@
>        "licenseId": "CC-BY-NC-ND-2.0",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 2.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
> -      "referenceNumber": 416,
> +      "referenceNumber": 334,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-nd/2.0/legalcode"
>        ]
> @@ -1624,7 +1688,7 @@
>        "licenseId": "CC-BY-NC-ND-2.5",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 2.5 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
> -      "referenceNumber": 58,
> +      "referenceNumber": 215,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
>        ]
> @@ -1636,7 +1700,7 @@
>        "licenseId": "CC-BY-NC-ND-3.0",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 3.0 Unported",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
> -      "referenceNumber": 213,
> +      "referenceNumber": 94,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
>        ]
> @@ -1648,7 +1712,7 @@
>        "licenseId": "CC-BY-NC-ND-3.0-DE",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 3.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
> -      "referenceNumber": 84,
> +      "referenceNumber": 185,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-nd/3.0/de/legalcode"
>        ]
> @@ -1660,7 +1724,7 @@
>        "licenseId": "CC-BY-NC-ND-3.0-IGO",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 3.0 IGO",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
> -      "referenceNumber": 587,
> +      "referenceNumber": 577,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-nd/3.0/igo/legalcode=
"
>        ]
> @@ -1672,7 +1736,7 @@
>        "licenseId": "CC-BY-NC-ND-4.0",
>        "name": "Creative Commons Attribution Non Commercial No Derivative=
s 4.0 International",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
> -      "referenceNumber": 296,
> +      "referenceNumber": 53,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
>        ]
> @@ -1684,7 +1748,7 @@
>        "licenseId": "CC-BY-NC-SA-1.0",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 1=
.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
> -      "referenceNumber": 170,
> +      "referenceNumber": 510,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/1.0/legalcode"
>        ]
> @@ -1696,7 +1760,7 @@
>        "licenseId": "CC-BY-NC-SA-2.0",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
> -      "referenceNumber": 484,
> +      "referenceNumber": 199,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode"
>        ]
> @@ -1708,7 +1772,7 @@
>        "licenseId": "CC-BY-NC-SA-2.0-DE",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.html",
> -      "referenceNumber": 184,
> +      "referenceNumber": 356,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/2.0/de/legalcode"
>        ]
> @@ -1720,7 +1784,7 @@
>        "licenseId": "CC-BY-NC-SA-2.0-FR",
>        "name": "Creative Commons Attribution-NonCommercial-ShareAlike 2.0=
 France",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
> -      "referenceNumber": 116,
> +      "referenceNumber": 301,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/2.0/fr/legalcode"
>        ]
> @@ -1732,7 +1796,7 @@
>        "licenseId": "CC-BY-NC-SA-2.0-UK",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.0 England and Wales",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
> -      "referenceNumber": 415,
> +      "referenceNumber": 671,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/2.0/uk/legalcode"
>        ]
> @@ -1744,7 +1808,7 @@
>        "licenseId": "CC-BY-NC-SA-2.5",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 2=
.5 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
> -      "referenceNumber": 106,
> +      "referenceNumber": 659,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/2.5/legalcode"
>        ]
> @@ -1756,7 +1820,7 @@
>        "licenseId": "CC-BY-NC-SA-3.0",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 Unported",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
> -      "referenceNumber": 323,
> +      "referenceNumber": 359,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
>        ]
> @@ -1768,7 +1832,7 @@
>        "licenseId": "CC-BY-NC-SA-3.0-DE",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
> -      "referenceNumber": 150,
> +      "referenceNumber": 279,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode"
>        ]
> @@ -1780,7 +1844,7 @@
>        "licenseId": "CC-BY-NC-SA-3.0-IGO",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 3=
.0 IGO",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
> -      "referenceNumber": 295,
> +      "referenceNumber": 636,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/3.0/igo/legalcode=
"
>        ]
> @@ -1792,7 +1856,7 @@
>        "licenseId": "CC-BY-NC-SA-4.0",
>        "name": "Creative Commons Attribution Non Commercial Share Alike 4=
.0 International",
>        "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
> -      "referenceNumber": 351,
> +      "referenceNumber": 89,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
>        ]
> @@ -1805,7 +1869,7 @@
>        "licenseId": "CC-BY-ND-1.0",
>        "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
> -      "referenceNumber": 56,
> +      "referenceNumber": 118,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
>        ]
> @@ -1818,7 +1882,7 @@
>        "licenseId": "CC-BY-ND-2.0",
>        "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
> -      "referenceNumber": 640,
> +      "referenceNumber": 587,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
>        ]
> @@ -1831,7 +1895,7 @@
>        "licenseId": "CC-BY-ND-2.5",
>        "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
> -      "referenceNumber": 276,
> +      "referenceNumber": 394,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd/2.5/legalcode"
>        ]
> @@ -1844,7 +1908,7 @@
>        "licenseId": "CC-BY-ND-3.0",
>        "name": "Creative Commons Attribution No Derivatives 3.0 Unported"=
,
>        "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
> -      "referenceNumber": 173,
> +      "referenceNumber": 457,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd/3.0/legalcode"
>        ]
> @@ -1856,7 +1920,7 @@
>        "licenseId": "CC-BY-ND-3.0-DE",
>        "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
> -      "referenceNumber": 525,
> +      "referenceNumber": 610,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
>        ]
> @@ -1869,7 +1933,7 @@
>        "licenseId": "CC-BY-ND-4.0",
>        "name": "Creative Commons Attribution No Derivatives 4.0 Internati=
onal",
>        "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
> -      "referenceNumber": 328,
> +      "referenceNumber": 11,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-nd/4.0/legalcode"
>        ]
> @@ -1881,7 +1945,7 @@
>        "licenseId": "CC-BY-SA-1.0",
>        "name": "Creative Commons Attribution Share Alike 1.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
> -      "referenceNumber": 453,
> +      "referenceNumber": 384,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/1.0/legalcode"
>        ]
> @@ -1893,7 +1957,7 @@
>        "licenseId": "CC-BY-SA-2.0",
>        "name": "Creative Commons Attribution Share Alike 2.0 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
> -      "referenceNumber": 174,
> +      "referenceNumber": 260,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/2.0/legalcode"
>        ]
> @@ -1905,7 +1969,7 @@
>        "licenseId": "CC-BY-SA-2.0-UK",
>        "name": "Creative Commons Attribution Share Alike 2.0 England and =
Wales",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
> -      "referenceNumber": 387,
> +      "referenceNumber": 197,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/2.0/uk/legalcode"
>        ]
> @@ -1917,7 +1981,7 @@
>        "licenseId": "CC-BY-SA-2.1-JP",
>        "name": "Creative Commons Attribution Share Alike 2.1 Japan",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
> -      "referenceNumber": 471,
> +      "referenceNumber": 149,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
>        ]
> @@ -1929,7 +1993,7 @@
>        "licenseId": "CC-BY-SA-2.5",
>        "name": "Creative Commons Attribution Share Alike 2.5 Generic",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
> -      "referenceNumber": 461,
> +      "referenceNumber": 631,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/2.5/legalcode"
>        ]
> @@ -1941,7 +2005,7 @@
>        "licenseId": "CC-BY-SA-3.0",
>        "name": "Creative Commons Attribution Share Alike 3.0 Unported",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
> -      "referenceNumber": 621,
> +      "referenceNumber": 79,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/3.0/legalcode"
>        ]
> @@ -1953,7 +2017,7 @@
>        "licenseId": "CC-BY-SA-3.0-AT",
>        "name": "Creative Commons Attribution Share Alike 3.0 Austria",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
> -      "referenceNumber": 31,
> +      "referenceNumber": 493,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
>        ]
> @@ -1965,7 +2029,7 @@
>        "licenseId": "CC-BY-SA-3.0-DE",
>        "name": "Creative Commons Attribution Share Alike 3.0 Germany",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
> -      "referenceNumber": 325,
> +      "referenceNumber": 683,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
>        ]
> @@ -1977,7 +2041,7 @@
>        "licenseId": "CC-BY-SA-3.0-IGO",
>        "name": "Creative Commons Attribution-ShareAlike 3.0 IGO",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.html",
> -      "referenceNumber": 20,
> +      "referenceNumber": 571,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/3.0/igo/legalcode"
>        ]
> @@ -1990,7 +2054,7 @@
>        "licenseId": "CC-BY-SA-4.0",
>        "name": "Creative Commons Attribution Share Alike 4.0 Internationa=
l",
>        "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
> -      "referenceNumber": 155,
> +      "referenceNumber": 256,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
>        ]
> @@ -2002,11 +2066,36 @@
>        "licenseId": "CC-PDDC",
>        "name": "Creative Commons Public Domain Dedication and Certificati=
on",
>        "reference": "https://spdx.org/licenses/CC-PDDC.html",
> -      "referenceNumber": 349,
> +      "referenceNumber": 273,
>        "seeAlso": [
>          "https://creativecommons.org/licenses/publicdomain/"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/CC-PDM-1.0.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "CC-PDM-1.0",
> +      "name": "Creative    Commons Public Domain Mark 1.0 Universal",
> +      "reference": "https://spdx.org/licenses/CC-PDM-1.0.html",
> +      "referenceNumber": 547,
> +      "seeAlso": [
> +        "https://creativecommons.org/publicdomain/mark/1.0/",
> +        "https://creativecommons.org/share-your-work/cclicenses/"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/CC-SA-1.0.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "CC-SA-1.0",
> +      "name": "Creative Commons Share Alike 1.0 Generic",
> +      "reference": "https://spdx.org/licenses/CC-SA-1.0.html",
> +      "referenceNumber": 85,
> +      "seeAlso": [
> +        "https://creativecommons.org/licenses/sa/1.0/legalcode"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
>        "isDeprecatedLicenseId": false,
> @@ -2015,7 +2104,7 @@
>        "licenseId": "CC0-1.0",
>        "name": "Creative Commons Zero v1.0 Universal",
>        "reference": "https://spdx.org/licenses/CC0-1.0.html",
> -      "referenceNumber": 70,
> +      "referenceNumber": 369,
>        "seeAlso": [
>          "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
>        ]
> @@ -2028,7 +2117,7 @@
>        "licenseId": "CDDL-1.0",
>        "name": "Common Development and Distribution License 1.0",
>        "reference": "https://spdx.org/licenses/CDDL-1.0.html",
> -      "referenceNumber": 282,
> +      "referenceNumber": 407,
>        "seeAlso": [
>          "https://opensource.org/licenses/cddl1"
>        ]
> @@ -2040,7 +2129,7 @@
>        "licenseId": "CDDL-1.1",
>        "name": "Common Development and Distribution License 1.1",
>        "reference": "https://spdx.org/licenses/CDDL-1.1.html",
> -      "referenceNumber": 130,
> +      "referenceNumber": 124,
>        "seeAlso": [
>          "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
>          "https://javaee.github.io/glassfish/LICENSE"
> @@ -2053,7 +2142,7 @@
>        "licenseId": "CDL-1.0",
>        "name": "Common Documentation License 1.0",
>        "reference": "https://spdx.org/licenses/CDL-1.0.html",
> -      "referenceNumber": 592,
> +      "referenceNumber": 385,
>        "seeAlso": [
>          "http://www.opensource.apple.com/cdl/",
>          "https://fedoraproject.org/wiki/Licensing/Common_Documentation_L=
icense",
> @@ -2067,7 +2156,7 @@
>        "licenseId": "CDLA-Permissive-1.0",
>        "name": "Community Data License Agreement Permissive 1.0",
>        "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
> -      "referenceNumber": 551,
> +      "referenceNumber": 454,
>        "seeAlso": [
>          "https://cdla.io/permissive-1-0"
>        ]
> @@ -2079,7 +2168,7 @@
>        "licenseId": "CDLA-Permissive-2.0",
>        "name": "Community Data License Agreement Permissive 2.0",
>        "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
> -      "referenceNumber": 319,
> +      "referenceNumber": 520,
>        "seeAlso": [
>          "https://cdla.dev/permissive-2-0"
>        ]
> @@ -2091,7 +2180,7 @@
>        "licenseId": "CDLA-Sharing-1.0",
>        "name": "Community Data License Agreement Sharing 1.0",
>        "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
> -      "referenceNumber": 445,
> +      "referenceNumber": 548,
>        "seeAlso": [
>          "https://cdla.io/sharing-1-0"
>        ]
> @@ -2103,7 +2192,7 @@
>        "licenseId": "CECILL-1.0",
>        "name": "CeCILL Free Software License Agreement v1.0",
>        "reference": "https://spdx.org/licenses/CECILL-1.0.html",
> -      "referenceNumber": 219,
> +      "referenceNumber": 468,
>        "seeAlso": [
>          "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
>        ]
> @@ -2115,7 +2204,7 @@
>        "licenseId": "CECILL-1.1",
>        "name": "CeCILL Free Software License Agreement v1.1",
>        "reference": "https://spdx.org/licenses/CECILL-1.1.html",
> -      "referenceNumber": 38,
> +      "referenceNumber": 100,
>        "seeAlso": [
>          "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
>        ]
> @@ -2128,7 +2217,7 @@
>        "licenseId": "CECILL-2.0",
>        "name": "CeCILL Free Software License Agreement v2.0",
>        "reference": "https://spdx.org/licenses/CECILL-2.0.html",
> -      "referenceNumber": 73,
> +      "referenceNumber": 370,
>        "seeAlso": [
>          "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"
>        ]
> @@ -2140,7 +2229,7 @@
>        "licenseId": "CECILL-2.1",
>        "name": "CeCILL Free Software License Agreement v2.1",
>        "reference": "https://spdx.org/licenses/CECILL-2.1.html",
> -      "referenceNumber": 393,
> +      "referenceNumber": 95,
>        "seeAlso": [
>          "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
>        ]
> @@ -2153,7 +2242,7 @@
>        "licenseId": "CECILL-B",
>        "name": "CeCILL-B Free Software License Agreement",
>        "reference": "https://spdx.org/licenses/CECILL-B.html",
> -      "referenceNumber": 354,
> +      "referenceNumber": 425,
>        "seeAlso": [
>          "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html"
>        ]
> @@ -2166,7 +2255,7 @@
>        "licenseId": "CECILL-C",
>        "name": "CeCILL-C Free Software License Agreement",
>        "reference": "https://spdx.org/licenses/CECILL-C.html",
> -      "referenceNumber": 271,
> +      "referenceNumber": 45,
>        "seeAlso": [
>          "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
>        ]
> @@ -2178,7 +2267,7 @@
>        "licenseId": "CERN-OHL-1.1",
>        "name": "CERN Open Hardware Licence v1.1",
>        "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
> -      "referenceNumber": 32,
> +      "referenceNumber": 398,
>        "seeAlso": [
>          "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
>        ]
> @@ -2190,7 +2279,7 @@
>        "licenseId": "CERN-OHL-1.2",
>        "name": "CERN Open Hardware Licence v1.2",
>        "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
> -      "referenceNumber": 95,
> +      "referenceNumber": 318,
>        "seeAlso": [
>          "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
>        ]
> @@ -2202,7 +2291,7 @@
>        "licenseId": "CERN-OHL-P-2.0",
>        "name": "CERN Open Hardware Licence Version 2 - Permissive",
>        "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
> -      "referenceNumber": 198,
> +      "referenceNumber": 200,
>        "seeAlso": [
>          "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
>        ]
> @@ -2214,7 +2303,7 @@
>        "licenseId": "CERN-OHL-S-2.0",
>        "name": "CERN Open Hardware Licence Version 2 - Strongly Reciproca=
l",
>        "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
> -      "referenceNumber": 370,
> +      "referenceNumber": 175,
>        "seeAlso": [
>          "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
>        ]
> @@ -2226,7 +2315,7 @@
>        "licenseId": "CERN-OHL-W-2.0",
>        "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal"=
,
>        "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
> -      "referenceNumber": 82,
> +      "referenceNumber": 219,
>        "seeAlso": [
>          "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-v=
ersion-2"
>        ]
> @@ -2238,7 +2327,7 @@
>        "licenseId": "CFITSIO",
>        "name": "CFITSIO License",
>        "reference": "https://spdx.org/licenses/CFITSIO.html",
> -      "referenceNumber": 96,
> +      "referenceNumber": 207,
>        "seeAlso": [
>          "https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/f_user/nod=
e9.html",
>          "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fv/doc/licen=
se.html"
> @@ -2251,7 +2340,7 @@
>        "licenseId": "check-cvs",
>        "name": "check-cvs License",
>        "reference": "https://spdx.org/licenses/check-cvs.html",
> -      "referenceNumber": 521,
> +      "referenceNumber": 377,
>        "seeAlso": [
>          "http://cvs.savannah.gnu.org/viewvc/cvs/ccvs/contrib/check_cvs.i=
n?revision=3D1.1.4.3&view=3Dmarkup&pathrev=3Dcvs1-11-23#l2"
>        ]
> @@ -2263,7 +2352,7 @@
>        "licenseId": "checkmk",
>        "name": "Checkmk License",
>        "reference": "https://spdx.org/licenses/checkmk.html",
> -      "referenceNumber": 272,
> +      "referenceNumber": 389,
>        "seeAlso": [
>          "https://github.com/libcheck/check/blob/master/checkmk/checkmk.i=
n"
>        ]
> @@ -2276,7 +2365,7 @@
>        "licenseId": "ClArtistic",
>        "name": "Clarified Artistic License",
>        "reference": "https://spdx.org/licenses/ClArtistic.html",
> -      "referenceNumber": 66,
> +      "referenceNumber": 690,
>        "seeAlso": [
>          "http://gianluca.dellavedova.org/2011/01/03/clarified-artistic-l=
icense/",
>          "http://www.ncftp.com/ncftp/doc/LICENSE.txt"
> @@ -2289,7 +2378,7 @@
>        "licenseId": "Clips",
>        "name": "Clips License",
>        "reference": "https://spdx.org/licenses/Clips.html",
> -      "referenceNumber": 450,
> +      "referenceNumber": 65,
>        "seeAlso": [
>          "https://github.com/DrItanium/maya/blob/master/LICENSE.CLIPS"
>        ]
> @@ -2301,7 +2390,7 @@
>        "licenseId": "CMU-Mach",
>        "name": "CMU Mach License",
>        "reference": "https://spdx.org/licenses/CMU-Mach.html",
> -      "referenceNumber": 410,
> +      "referenceNumber": 178,
>        "seeAlso": [
>          "https://www.cs.cmu.edu/~410/licenses.html"
>        ]
> @@ -2313,7 +2402,7 @@
>        "licenseId": "CMU-Mach-nodoc",
>        "name": "CMU    Mach - no notices-in-documentation variant",
>        "reference": "https://spdx.org/licenses/CMU-Mach-nodoc.html",
> -      "referenceNumber": 111,
> +      "referenceNumber": 391,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L718=
-L728",
>          "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
> @@ -2326,7 +2415,7 @@
>        "licenseId": "CNRI-Jython",
>        "name": "CNRI Jython License",
>        "reference": "https://spdx.org/licenses/CNRI-Jython.html",
> -      "referenceNumber": 509,
> +      "referenceNumber": 138,
>        "seeAlso": [
>          "http://www.jython.org/license.html"
>        ]
> @@ -2338,7 +2427,7 @@
>        "licenseId": "CNRI-Python",
>        "name": "CNRI Python License",
>        "reference": "https://spdx.org/licenses/CNRI-Python.html",
> -      "referenceNumber": 611,
> +      "referenceNumber": 352,
>        "seeAlso": [
>          "https://opensource.org/licenses/CNRI-Python"
>        ]
> @@ -2350,7 +2439,7 @@
>        "licenseId": "CNRI-Python-GPL-Compatible",
>        "name": "CNRI Python Open Source GPL Compatible License Agreement"=
,
>        "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible=
.html",
> -      "referenceNumber": 504,
> +      "referenceNumber": 673,
>        "seeAlso": [
>          "http://www.python.org/download/releases/1.6.1/download_win/"
>        ]
> @@ -2362,7 +2451,7 @@
>        "licenseId": "COIL-1.0",
>        "name": "Copyfree Open Innovation License",
>        "reference": "https://spdx.org/licenses/COIL-1.0.html",
> -      "referenceNumber": 286,
> +      "referenceNumber": 526,
>        "seeAlso": [
>          "https://coil.apotheon.org/plaintext/01.0.txt"
>        ]
> @@ -2374,7 +2463,7 @@
>        "licenseId": "Community-Spec-1.0",
>        "name": "Community Specification License 1.0",
>        "reference": "https://spdx.org/licenses/Community-Spec-1.0.html",
> -      "referenceNumber": 631,
> +      "referenceNumber": 695,
>        "seeAlso": [
>          "https://github.com/CommunitySpecification/1.0/blob/master/1._Co=
mmunity_Specification_License-v1.md"
>        ]
> @@ -2387,7 +2476,7 @@
>        "licenseId": "Condor-1.1",
>        "name": "Condor Public License v1.1",
>        "reference": "https://spdx.org/licenses/Condor-1.1.html",
> -      "referenceNumber": 251,
> +      "referenceNumber": 114,
>        "seeAlso": [
>          "http://research.cs.wisc.edu/condor/license.html#condor",
>          "http://web.archive.org/web/20111123062036/http://research.cs.wi=
sc.edu/condor/license.html#condor"
> @@ -2400,7 +2489,7 @@
>        "licenseId": "copyleft-next-0.3.0",
>        "name": "copyleft-next 0.3.0",
>        "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
> -      "referenceNumber": 421,
> +      "referenceNumber": 122,
>        "seeAlso": [
>          "https://github.com/copyleft-next/copyleft-next/blob/master/Rele=
ases/copyleft-next-0.3.0"
>        ]
> @@ -2412,7 +2501,7 @@
>        "licenseId": "copyleft-next-0.3.1",
>        "name": "copyleft-next 0.3.1",
>        "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
> -      "referenceNumber": 119,
> +      "referenceNumber": 583,
>        "seeAlso": [
>          "https://github.com/copyleft-next/copyleft-next/blob/master/Rele=
ases/copyleft-next-0.3.1"
>        ]
> @@ -2424,7 +2513,7 @@
>        "licenseId": "Cornell-Lossless-JPEG",
>        "name": "Cornell Lossless JPEG License",
>        "reference": "https://spdx.org/licenses/Cornell-Lossless-JPEG.html=
",
> -      "referenceNumber": 632,
> +      "referenceNumber": 331,
>        "seeAlso": [
>          "https://android.googlesource.com/platform/external/dng_sdk/+/re=
fs/heads/master/source/dng_lossless_jpeg.cpp#16",
>          "https://www.mssl.ucl.ac.uk/~mcrw/src/20050920/proto.h",
> @@ -2439,7 +2528,7 @@
>        "licenseId": "CPAL-1.0",
>        "name": "Common Public Attribution License 1.0",
>        "reference": "https://spdx.org/licenses/CPAL-1.0.html",
> -      "referenceNumber": 315,
> +      "referenceNumber": 147,
>        "seeAlso": [
>          "https://opensource.org/licenses/CPAL-1.0"
>        ]
> @@ -2452,7 +2541,7 @@
>        "licenseId": "CPL-1.0",
>        "name": "Common Public License 1.0",
>        "reference": "https://spdx.org/licenses/CPL-1.0.html",
> -      "referenceNumber": 135,
> +      "referenceNumber": 367,
>        "seeAlso": [
>          "https://opensource.org/licenses/CPL-1.0"
>        ]
> @@ -2465,7 +2554,7 @@
>        "licenseId": "CPOL-1.02",
>        "name": "Code Project Open License 1.02",
>        "reference": "https://spdx.org/licenses/CPOL-1.02.html",
> -      "referenceNumber": 479,
> +      "referenceNumber": 250,
>        "seeAlso": [
>          "http://www.codeproject.com/info/cpol10.aspx"
>        ]
> @@ -2477,7 +2566,7 @@
>        "licenseId": "Cronyx",
>        "name": "Cronyx License",
>        "reference": "https://spdx.org/licenses/Cronyx.html",
> -      "referenceNumber": 377,
> +      "referenceNumber": 32,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/font/alias/-/blob/master/CO=
PYING",
>          "https://gitlab.freedesktop.org/xorg/font/cronyx-cyrillic/-/blob=
/master/COPYING",
> @@ -2492,11 +2581,23 @@
>        "licenseId": "Crossword",
>        "name": "Crossword License",
>        "reference": "https://spdx.org/licenses/Crossword.html",
> -      "referenceNumber": 340,
> +      "referenceNumber": 347,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Crossword"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/CryptoSwift.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "CryptoSwift",
> +      "name": "CryptoSwift License",
> +      "reference": "https://spdx.org/licenses/CryptoSwift.html",
> +      "referenceNumber": 323,
> +      "seeAlso": [
> +        "https://github.com/krzyzanowskim/CryptoSwift/blob/main/LICENSE"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
>        "isDeprecatedLicenseId": false,
> @@ -2504,7 +2605,7 @@
>        "licenseId": "CrystalStacker",
>        "name": "CrystalStacker License",
>        "reference": "https://spdx.org/licenses/CrystalStacker.html",
> -      "referenceNumber": 593,
> +      "referenceNumber": 449,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd=3DLi=
censing/CrystalStacker"
>        ]
> @@ -2516,7 +2617,7 @@
>        "licenseId": "CUA-OPL-1.0",
>        "name": "CUA Office Public License v1.0",
>        "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
> -      "referenceNumber": 553,
> +      "referenceNumber": 298,
>        "seeAlso": [
>          "https://opensource.org/licenses/CUA-OPL-1.0"
>        ]
> @@ -2528,7 +2629,7 @@
>        "licenseId": "Cube",
>        "name": "Cube License",
>        "reference": "https://spdx.org/licenses/Cube.html",
> -      "referenceNumber": 404,
> +      "referenceNumber": 140,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Cube"
>        ]
> @@ -2540,7 +2641,7 @@
>        "licenseId": "curl",
>        "name": "curl License",
>        "reference": "https://spdx.org/licenses/curl.html",
> -      "referenceNumber": 604,
> +      "referenceNumber": 160,
>        "seeAlso": [
>          "https://github.com/bagder/curl/blob/master/COPYING"
>        ]
> @@ -2552,7 +2653,7 @@
>        "licenseId": "cve-tou",
>        "name": "Common Vulnerability Enumeration ToU License",
>        "reference": "https://spdx.org/licenses/cve-tou.html",
> -      "referenceNumber": 306,
> +      "referenceNumber": 216,
>        "seeAlso": [
>          "https://www.cve.org/Legal/TermsOfUse"
>        ]
> @@ -2564,7 +2665,7 @@
>        "licenseId": "D-FSL-1.0",
>        "name": "Deutsche Freie Software Lizenz",
>        "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
> -      "referenceNumber": 154,
> +      "referenceNumber": 545,
>        "seeAlso": [
>          "http://www.dipp.nrw.de/d-fsl/lizenzen/",
>          "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/de/D-FSL-1_0_d=
e.txt",
> @@ -2583,7 +2684,7 @@
>        "licenseId": "DEC-3-Clause",
>        "name": "DEC 3-Clause License",
>        "reference": "https://spdx.org/licenses/DEC-3-Clause.html",
> -      "referenceNumber": 15,
> +      "referenceNumber": 164,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type=3Dheads#L239"
>        ]
> @@ -2595,7 +2696,7 @@
>        "licenseId": "diffmark",
>        "name": "diffmark license",
>        "reference": "https://spdx.org/licenses/diffmark.html",
> -      "referenceNumber": 292,
> +      "referenceNumber": 50,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/diffmark"
>        ]
> @@ -2607,7 +2708,7 @@
>        "licenseId": "DL-DE-BY-2.0",
>        "name": "Data licence Germany \u2013 attribution \u2013 version 2.=
0",
>        "reference": "https://spdx.org/licenses/DL-DE-BY-2.0.html",
> -      "referenceNumber": 225,
> +      "referenceNumber": 530,
>        "seeAlso": [
>          "https://www.govdata.de/dl-de/by-2-0"
>        ]
> @@ -2619,7 +2720,7 @@
>        "licenseId": "DL-DE-ZERO-2.0",
>        "name": "Data licence Germany \u2013 zero \u2013 version 2.0",
>        "reference": "https://spdx.org/licenses/DL-DE-ZERO-2.0.html",
> -      "referenceNumber": 341,
> +      "referenceNumber": 139,
>        "seeAlso": [
>          "https://www.govdata.de/dl-de/zero-2-0"
>        ]
> @@ -2631,12 +2732,60 @@
>        "licenseId": "DOC",
>        "name": "DOC License",
>        "reference": "https://spdx.org/licenses/DOC.html",
> -      "referenceNumber": 397,
> +      "referenceNumber": 31,
>        "seeAlso": [
>          "http://www.cs.wustl.edu/~schmidt/ACE-copying.html",
>          "https://www.dre.vanderbilt.edu/~schmidt/ACE-copying.html"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/DocBook-DTD.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "DocBook-DTD",
> +      "name": "DocBook DTD License",
> +      "reference": "https://spdx.org/licenses/DocBook-DTD.html",
> +      "referenceNumber": 603,
> +      "seeAlso": [
> +        "http://www.docbook.org/xml/simple/1.1/docbook-simple-1.1.zip"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/DocBook-Schema.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "DocBook-Schema",
> +      "name": "DocBook Schema License",
> +      "reference": "https://spdx.org/licenses/DocBook-Schema.html",
> +      "referenceNumber": 184,
> +      "seeAlso": [
> +        "https://github.com/docbook/xslt10-stylesheets/blob/efd62655c11c=
c8773708df7a843613fa1e932bf8/xsl/assembly/schema/docbook51b7.rnc"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/DocBook-Stylesheet.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "DocBook-Stylesheet",
> +      "name": "DocBook Stylesheet License",
> +      "reference": "https://spdx.org/licenses/DocBook-Stylesheet.html",
> +      "referenceNumber": 494,
> +      "seeAlso": [
> +        "http://www.docbook.org/xml/5.0/docbook-5.0.zip"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/DocBook-XML.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "DocBook-XML",
> +      "name": "DocBook XML License",
> +      "reference": "https://spdx.org/licenses/DocBook-XML.html",
> +      "referenceNumber": 672,
> +      "seeAlso": [
> +        "https://github.com/docbook/xslt10-stylesheets/blob/efd62655c11c=
c8773708df7a843613fa1e932bf8/xsl/COPYING#L27"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Dotseqn.json",
>        "isDeprecatedLicenseId": false,
> @@ -2644,7 +2793,7 @@
>        "licenseId": "Dotseqn",
>        "name": "Dotseqn License",
>        "reference": "https://spdx.org/licenses/Dotseqn.html",
> -      "referenceNumber": 132,
> +      "referenceNumber": 257,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Dotseqn"
>        ]
> @@ -2656,7 +2805,7 @@
>        "licenseId": "DRL-1.0",
>        "name": "Detection Rule License 1.0",
>        "reference": "https://spdx.org/licenses/DRL-1.0.html",
> -      "referenceNumber": 16,
> +      "referenceNumber": 446,
>        "seeAlso": [
>          "https://github.com/Neo23x0/sigma/blob/master/LICENSE.Detection.=
Rules.md"
>        ]
> @@ -2668,7 +2817,7 @@
>        "licenseId": "DRL-1.1",
>        "name": "Detection Rule License 1.1",
>        "reference": "https://spdx.org/licenses/DRL-1.1.html",
> -      "referenceNumber": 278,
> +      "referenceNumber": 135,
>        "seeAlso": [
>          "https://github.com/SigmaHQ/Detection-Rule-License/blob/6ec7fbde=
6101d101b5b5d1fcb8f9b69fbc76c04a/LICENSE.Detection.Rules.md"
>        ]
> @@ -2680,7 +2829,7 @@
>        "licenseId": "DSDP",
>        "name": "DSDP License",
>        "reference": "https://spdx.org/licenses/DSDP.html",
> -      "referenceNumber": 485,
> +      "referenceNumber": 336,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/DSDP"
>        ]
> @@ -2692,7 +2841,7 @@
>        "licenseId": "dtoa",
>        "name": "David M. Gay dtoa License",
>        "reference": "https://spdx.org/licenses/dtoa.html",
> -      "referenceNumber": 358,
> +      "referenceNumber": 578,
>        "seeAlso": [
>          "https://github.com/SWI-Prolog/swipl-devel/blob/master/src/os/dt=
oa.c",
>          "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/stdlib/mprec.h;hb=3DHEAD"
> @@ -2705,7 +2854,7 @@
>        "licenseId": "dvipdfm",
>        "name": "dvipdfm License",
>        "reference": "https://spdx.org/licenses/dvipdfm.html",
> -      "referenceNumber": 100,
> +      "referenceNumber": 319,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/dvipdfm"
>        ]
> @@ -2717,7 +2866,7 @@
>        "licenseId": "ECL-1.0",
>        "name": "Educational Community License v1.0",
>        "reference": "https://spdx.org/licenses/ECL-1.0.html",
> -      "referenceNumber": 124,
> +      "referenceNumber": 641,
>        "seeAlso": [
>          "https://opensource.org/licenses/ECL-1.0"
>        ]
> @@ -2730,7 +2879,7 @@
>        "licenseId": "ECL-2.0",
>        "name": "Educational Community License v2.0",
>        "reference": "https://spdx.org/licenses/ECL-2.0.html",
> -      "referenceNumber": 361,
> +      "referenceNumber": 338,
>        "seeAlso": [
>          "https://opensource.org/licenses/ECL-2.0"
>        ]
> @@ -2743,7 +2892,7 @@
>        "licenseId": "eCos-2.0",
>        "name": "eCos license version 2.0",
>        "reference": "https://spdx.org/licenses/eCos-2.0.html",
> -      "referenceNumber": 372,
> +      "referenceNumber": 647,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/ecos-license.html"
>        ]
> @@ -2755,7 +2904,7 @@
>        "licenseId": "EFL-1.0",
>        "name": "Eiffel Forum License v1.0",
>        "reference": "https://spdx.org/licenses/EFL-1.0.html",
> -      "referenceNumber": 335,
> +      "referenceNumber": 145,
>        "seeAlso": [
>          "http://www.eiffel-nice.org/license/forum.txt",
>          "https://opensource.org/licenses/EFL-1.0"
> @@ -2769,7 +2918,7 @@
>        "licenseId": "EFL-2.0",
>        "name": "Eiffel Forum License v2.0",
>        "reference": "https://spdx.org/licenses/EFL-2.0.html",
> -      "referenceNumber": 88,
> +      "referenceNumber": 604,
>        "seeAlso": [
>          "http://www.eiffel-nice.org/license/eiffel-forum-license-2.html"=
,
>          "https://opensource.org/licenses/EFL-2.0"
> @@ -2782,7 +2931,7 @@
>        "licenseId": "eGenix",
>        "name": "eGenix.com Public License 1.1.0",
>        "reference": "https://spdx.org/licenses/eGenix.html",
> -      "referenceNumber": 261,
> +      "referenceNumber": 613,
>        "seeAlso": [
>          "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.=
pdf",
>          "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_Lice=
nse_1.1.0"
> @@ -2795,7 +2944,7 @@
>        "licenseId": "Elastic-2.0",
>        "name": "Elastic License 2.0",
>        "reference": "https://spdx.org/licenses/Elastic-2.0.html",
> -      "referenceNumber": 147,
> +      "referenceNumber": 396,
>        "seeAlso": [
>          "https://www.elastic.co/licensing/elastic-license",
>          "https://github.com/elastic/elasticsearch/blob/master/licenses/E=
LASTIC-LICENSE-2.0.txt"
> @@ -2808,7 +2957,7 @@
>        "licenseId": "Entessa",
>        "name": "Entessa Public License v1.0",
>        "reference": "https://spdx.org/licenses/Entessa.html",
> -      "referenceNumber": 546,
> +      "referenceNumber": 40,
>        "seeAlso": [
>          "https://opensource.org/licenses/Entessa"
>        ]
> @@ -2820,7 +2969,7 @@
>        "licenseId": "EPICS",
>        "name": "EPICS Open License",
>        "reference": "https://spdx.org/licenses/EPICS.html",
> -      "referenceNumber": 120,
> +      "referenceNumber": 158,
>        "seeAlso": [
>          "https://epics.anl.gov/license/open.php"
>        ]
> @@ -2833,7 +2982,7 @@
>        "licenseId": "EPL-1.0",
>        "name": "Eclipse Public License 1.0",
>        "reference": "https://spdx.org/licenses/EPL-1.0.html",
> -      "referenceNumber": 500,
> +      "referenceNumber": 558,
>        "seeAlso": [
>          "http://www.eclipse.org/legal/epl-v10.html",
>          "https://opensource.org/licenses/EPL-1.0"
> @@ -2847,10 +2996,12 @@
>        "licenseId": "EPL-2.0",
>        "name": "Eclipse Public License 2.0",
>        "reference": "https://spdx.org/licenses/EPL-2.0.html",
> -      "referenceNumber": 407,
> +      "referenceNumber": 326,
>        "seeAlso": [
>          "https://www.eclipse.org/legal/epl-2.0",
> -        "https://www.opensource.org/licenses/EPL-2.0"
> +        "https://www.opensource.org/licenses/EPL-2.0",
> +        "https://www.eclipse.org/legal/epl-v20.html",
> +        "https://projects.eclipse.org/license/epl-2.0"
>        ]
>      },
>      {
> @@ -2860,7 +3011,7 @@
>        "licenseId": "ErlPL-1.1",
>        "name": "Erlang Public License v1.1",
>        "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
> -      "referenceNumber": 466,
> +      "referenceNumber": 541,
>        "seeAlso": [
>          "http://www.erlang.org/EPLICENSE"
>        ]
> @@ -2872,7 +3023,7 @@
>        "licenseId": "etalab-2.0",
>        "name": "Etalab Open License 2.0",
>        "reference": "https://spdx.org/licenses/etalab-2.0.html",
> -      "referenceNumber": 636,
> +      "referenceNumber": 363,
>        "seeAlso": [
>          "https://github.com/DISIC/politique-de-contribution-open-source/=
blob/master/LICENSE.pdf",
>          "https://raw.githubusercontent.com/DISIC/politique-de-contributi=
on-open-source/master/LICENSE"
> @@ -2886,7 +3037,7 @@
>        "licenseId": "EUDatagrid",
>        "name": "EU DataGrid Software License",
>        "reference": "https://spdx.org/licenses/EUDatagrid.html",
> -      "referenceNumber": 228,
> +      "referenceNumber": 262,
>        "seeAlso": [
>          "http://eu-datagrid.web.cern.ch/eu-datagrid/license.html",
>          "https://opensource.org/licenses/EUDatagrid"
> @@ -2899,7 +3050,7 @@
>        "licenseId": "EUPL-1.0",
>        "name": "European Union Public License 1.0",
>        "reference": "https://spdx.org/licenses/EUPL-1.0.html",
> -      "referenceNumber": 227,
> +      "referenceNumber": 405,
>        "seeAlso": [
>          "http://ec.europa.eu/idabc/en/document/7330.html",
>          "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id=3D31096"
> @@ -2913,7 +3064,7 @@
>        "licenseId": "EUPL-1.1",
>        "name": "European Union Public License 1.1",
>        "reference": "https://spdx.org/licenses/EUPL-1.1.html",
> -      "referenceNumber": 266,
> +      "referenceNumber": 393,
>        "seeAlso": [
>          "https://joinup.ec.europa.eu/software/page/eupl/licence-eupl",
>          "https://joinup.ec.europa.eu/sites/default/files/custom-page/att=
achment/eupl1.1.-licence-en_0.pdf",
> @@ -2928,7 +3079,7 @@
>        "licenseId": "EUPL-1.2",
>        "name": "European Union Public License 1.2",
>        "reference": "https://spdx.org/licenses/EUPL-1.2.html",
> -      "referenceNumber": 559,
> +      "referenceNumber": 596,
>        "seeAlso": [
>          "https://joinup.ec.europa.eu/page/eupl-text-11-12",
>          "https://joinup.ec.europa.eu/sites/default/files/custom-page/att=
achment/eupl_v1.2_en.pdf",
> @@ -2945,7 +3096,7 @@
>        "licenseId": "Eurosym",
>        "name": "Eurosym License",
>        "reference": "https://spdx.org/licenses/Eurosym.html",
> -      "referenceNumber": 63,
> +      "referenceNumber": 299,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Eurosym"
>        ]
> @@ -2957,7 +3108,7 @@
>        "licenseId": "Fair",
>        "name": "Fair License",
>        "reference": "https://spdx.org/licenses/Fair.html",
> -      "referenceNumber": 570,
> +      "referenceNumber": 190,
>        "seeAlso": [
>          "https://web.archive.org/web/20150926120323/http://fairlicense.o=
rg/",
>          "https://opensource.org/licenses/Fair"
> @@ -2970,7 +3121,7 @@
>        "licenseId": "FBM",
>        "name": "Fuzzy Bitmap License",
>        "reference": "https://spdx.org/licenses/FBM.html",
> -      "referenceNumber": 175,
> +      "referenceNumber": 476,
>        "seeAlso": [
>          "https://github.com/SWI-Prolog/packages-xpce/blob/161a40cd82004f=
731ba48024f9d30af388a7edf5/src/img/gifwrite.c#L21-L26"
>        ]
> @@ -2982,7 +3133,7 @@
>        "licenseId": "FDK-AAC",
>        "name": "Fraunhofer FDK AAC Codec Library",
>        "reference": "https://spdx.org/licenses/FDK-AAC.html",
> -      "referenceNumber": 49,
> +      "referenceNumber": 44,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/FDK-AAC",
>          "https://directory.fsf.org/wiki/License:Fdk"
> @@ -2995,7 +3146,7 @@
>        "licenseId": "Ferguson-Twofish",
>        "name": "Ferguson Twofish License",
>        "reference": "https://spdx.org/licenses/Ferguson-Twofish.html",
> -      "referenceNumber": 617,
> +      "referenceNumber": 662,
>        "seeAlso": [
>          "https://github.com/wernerd/ZRTPCPP/blob/6b3cd8e6783642292bad0c2=
1e3e5e5ce45ff3e03/cryptcommon/twofish.c#L113C3-L127"
>        ]
> @@ -3007,7 +3158,7 @@
>        "licenseId": "Frameworx-1.0",
>        "name": "Frameworx Open License 1.0",
>        "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
> -      "referenceNumber": 259,
> +      "referenceNumber": 376,
>        "seeAlso": [
>          "https://opensource.org/licenses/Frameworx-1.0"
>        ]
> @@ -3019,7 +3170,7 @@
>        "licenseId": "FreeBSD-DOC",
>        "name": "FreeBSD Documentation License",
>        "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
> -      "referenceNumber": 333,
> +      "referenceNumber": 645,
>        "seeAlso": [
>          "https://www.freebsd.org/copyright/freebsd-doc-license/"
>        ]
> @@ -3031,7 +3182,7 @@
>        "licenseId": "FreeImage",
>        "name": "FreeImage Public License v1.0",
>        "reference": "https://spdx.org/licenses/FreeImage.html",
> -      "referenceNumber": 181,
> +      "referenceNumber": 264,
>        "seeAlso": [
>          "http://freeimage.sourceforge.net/freeimage-license.txt"
>        ]
> @@ -3044,7 +3195,7 @@
>        "licenseId": "FSFAP",
>        "name": "FSF All Permissive License",
>        "reference": "https://spdx.org/licenses/FSFAP.html",
> -      "referenceNumber": 36,
> +      "referenceNumber": 561,
>        "seeAlso": [
>          "https://www.gnu.org/prep/maintain/html_node/License-Notices-for=
-Other-Files.html"
>        ]
> @@ -3056,7 +3207,7 @@
>        "licenseId": "FSFAP-no-warranty-disclaimer",
>        "name": "FSF All Permissive License (without Warranty)",
>        "reference": "https://spdx.org/licenses/FSFAP-no-warranty-disclaim=
er.html",
> -      "referenceNumber": 536,
> +      "referenceNumber": 629,
>        "seeAlso": [
>          "https://git.savannah.gnu.org/cgit/wget.git/tree/util/trunc.c?h=
=3Dv1.21.3&id=3D40747a11e44ced5a8ac628a41f879ced3e2ebce9#n6"
>        ]
> @@ -3068,7 +3219,7 @@
>        "licenseId": "FSFUL",
>        "name": "FSF Unlimited License",
>        "reference": "https://spdx.org/licenses/FSFUL.html",
> -      "referenceNumber": 454,
> +      "referenceNumber": 59,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License"
>        ]
> @@ -3080,11 +3231,23 @@
>        "licenseId": "FSFULLR",
>        "name": "FSF Unlimited License (with License Retention)",
>        "reference": "https://spdx.org/licenses/FSFULLR.html",
> -      "referenceNumber": 422,
> +      "referenceNumber": 322,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#=
License_Retention_Variant"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/FSFULLRSD.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "FSFULLRSD",
> +      "name": "FSF Unlimited License (with License Retention and Short D=
isclaimer)",
> +      "reference": "https://spdx.org/licenses/FSFULLRSD.html",
> +      "referenceNumber": 300,
> +      "seeAlso": [
> +        "https://git.savannah.gnu.org/cgit/gnulib.git/tree/modules/COPYI=
NG?id=3D7b08932179d0d6b017f7df01a2ddf6e096b038e3"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/FSFULLRWD.json",
>        "isDeprecatedLicenseId": false,
> @@ -3092,11 +3255,35 @@
>        "licenseId": "FSFULLRWD",
>        "name": "FSF Unlimited License (With License Retention and Warrant=
y Disclaimer)",
>        "reference": "https://spdx.org/licenses/FSFULLRWD.html",
> -      "referenceNumber": 197,
> +      "referenceNumber": 245,
>        "seeAlso": [
>          "https://lists.gnu.org/archive/html/autoconf/2012-04/msg00061.ht=
ml"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/FSL-1.1-ALv2.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "FSL-1.1-ALv2",
> +      "name": "Functional Source License, Version 1.1, ALv2 Future Licen=
se",
> +      "reference": "https://spdx.org/licenses/FSL-1.1-ALv2.html",
> +      "referenceNumber": 585,
> +      "seeAlso": [
> +        "https://fsl.software/FSL-1.1-ALv2.template.md"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/FSL-1.1-MIT.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "FSL-1.1-MIT",
> +      "name": "Functional Source License, Version 1.1, MIT Future Licens=
e",
> +      "reference": "https://spdx.org/licenses/FSL-1.1-MIT.html",
> +      "referenceNumber": 639,
> +      "seeAlso": [
> +        "https://fsl.software/FSL-1.1-MIT.template.md"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/FTL.json",
>        "isDeprecatedLicenseId": false,
> @@ -3105,7 +3292,7 @@
>        "licenseId": "FTL",
>        "name": "Freetype Project License",
>        "reference": "https://spdx.org/licenses/FTL.html",
> -      "referenceNumber": 438,
> +      "referenceNumber": 417,
>        "seeAlso": [
>          "http://freetype.fis.uniroma2.it/FTL.TXT",
>          "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/do=
cs/FTL.TXT",
> @@ -3119,7 +3306,7 @@
>        "licenseId": "Furuseth",
>        "name": "Furuseth License",
>        "reference": "https://spdx.org/licenses/Furuseth.html",
> -      "referenceNumber": 380,
> +      "referenceNumber": 72,
>        "seeAlso": [
>          "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRI=
GHT?ref_type=3Dheads#L39-51"
>        ]
> @@ -3136,6 +3323,18 @@
>          "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/fwlw/RE=
ADME"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Game-Programming-Gems.jso=
n",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Game-Programming-Gems",
> +      "name": "Game Programming Gems License",
> +      "reference": "https://spdx.org/licenses/Game-Programming-Gems.html=
",
> +      "referenceNumber": 246,
> +      "seeAlso": [
> +        "https://github.com/OGRECave/ogre/blob/master/OgreMain/include/O=
greSingleton.h#L28C3-L35C46"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/GCR-docs.json",
>        "isDeprecatedLicenseId": false,
> @@ -3143,7 +3342,7 @@
>        "licenseId": "GCR-docs",
>        "name": "Gnome GCR Documentation License",
>        "reference": "https://spdx.org/licenses/GCR-docs.html",
> -      "referenceNumber": 115,
> +      "referenceNumber": 270,
>        "seeAlso": [
>          "https://github.com/GNOME/gcr/blob/master/docs/COPYING"
>        ]
> @@ -3155,11 +3354,23 @@
>        "licenseId": "GD",
>        "name": "GD License",
>        "reference": "https://spdx.org/licenses/GD.html",
> -      "referenceNumber": 291,
> +      "referenceNumber": 549,
>        "seeAlso": [
>          "https://libgd.github.io/manuals/2.3.0/files/license-txt.html"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/generic-xts.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "generic-xts",
> +      "name": "Generic XTS License",
> +      "reference": "https://spdx.org/licenses/generic-xts.html",
> +      "referenceNumber": 132,
> +      "seeAlso": [
> +        "https://github.com/mhogomchungu/zuluCrypt/blob/master/external_=
libraries/tcplay/generic_xts.c"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/GFDL-1.1.json",
>        "isDeprecatedLicenseId": true,
> @@ -3168,7 +3379,7 @@
>        "licenseId": "GFDL-1.1",
>        "name": "GNU Free Documentation License v1.1",
>        "reference": "https://spdx.org/licenses/GFDL-1.1.html",
> -      "referenceNumber": 589,
> +      "referenceNumber": 533,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3180,7 +3391,7 @@
>        "licenseId": "GFDL-1.1-invariants-only",
>        "name": "GNU Free Documentation License v1.1 only - invariants",
>        "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.h=
tml",
> -      "referenceNumber": 307,
> +      "referenceNumber": 271,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3192,7 +3403,7 @@
>        "licenseId": "GFDL-1.1-invariants-or-later",
>        "name": "GNU Free Documentation License v1.1 or later - invariants=
",
>        "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-lat=
er.html",
> -      "referenceNumber": 98,
> +      "referenceNumber": 538,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3204,7 +3415,7 @@
>        "licenseId": "GFDL-1.1-no-invariants-only",
>        "name": "GNU Free Documentation License v1.1 only - no invariants"=
,
>        "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-onl=
y.html",
> -      "referenceNumber": 47,
> +      "referenceNumber": 609,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3216,7 +3427,7 @@
>        "licenseId": "GFDL-1.1-no-invariants-or-later",
>        "name": "GNU Free Documentation License v1.1 or later - no invaria=
nts",
>        "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-=
later.html",
> -      "referenceNumber": 273,
> +      "referenceNumber": 689,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3229,7 +3440,7 @@
>        "licenseId": "GFDL-1.1-only",
>        "name": "GNU Free Documentation License v1.1 only",
>        "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
> -      "referenceNumber": 626,
> +      "referenceNumber": 456,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3242,7 +3453,7 @@
>        "licenseId": "GFDL-1.1-or-later",
>        "name": "GNU Free Documentation License v1.1 or later",
>        "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
> -      "referenceNumber": 644,
> +      "referenceNumber": 67,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
>        ]
> @@ -3255,7 +3466,7 @@
>        "licenseId": "GFDL-1.2",
>        "name": "GNU Free Documentation License v1.2",
>        "reference": "https://spdx.org/licenses/GFDL-1.2.html",
> -      "referenceNumber": 520,
> +      "referenceNumber": 350,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3267,7 +3478,7 @@
>        "licenseId": "GFDL-1.2-invariants-only",
>        "name": "GNU Free Documentation License v1.2 only - invariants",
>        "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.h=
tml",
> -      "referenceNumber": 495,
> +      "referenceNumber": 192,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3279,7 +3490,7 @@
>        "licenseId": "GFDL-1.2-invariants-or-later",
>        "name": "GNU Free Documentation License v1.2 or later - invariants=
",
>        "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-lat=
er.html",
> -      "referenceNumber": 6,
> +      "referenceNumber": 261,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3291,7 +3502,7 @@
>        "licenseId": "GFDL-1.2-no-invariants-only",
>        "name": "GNU Free Documentation License v1.2 only - no invariants"=
,
>        "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-onl=
y.html",
> -      "referenceNumber": 77,
> +      "referenceNumber": 101,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3303,7 +3514,7 @@
>        "licenseId": "GFDL-1.2-no-invariants-or-later",
>        "name": "GNU Free Documentation License v1.2 or later - no invaria=
nts",
>        "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-=
later.html",
> -      "referenceNumber": 279,
> +      "referenceNumber": 244,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3316,7 +3527,7 @@
>        "licenseId": "GFDL-1.2-only",
>        "name": "GNU Free Documentation License v1.2 only",
>        "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
> -      "referenceNumber": 648,
> +      "referenceNumber": 595,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3329,7 +3540,7 @@
>        "licenseId": "GFDL-1.2-or-later",
>        "name": "GNU Free Documentation License v1.2 or later",
>        "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
> -      "referenceNumber": 318,
> +      "referenceNumber": 488,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
>        ]
> @@ -3342,7 +3553,7 @@
>        "licenseId": "GFDL-1.3",
>        "name": "GNU Free Documentation License v1.3",
>        "reference": "https://spdx.org/licenses/GFDL-1.3.html",
> -      "referenceNumber": 287,
> +      "referenceNumber": 652,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3354,7 +3565,7 @@
>        "licenseId": "GFDL-1.3-invariants-only",
>        "name": "GNU Free Documentation License v1.3 only - invariants",
>        "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.h=
tml",
> -      "referenceNumber": 289,
> +      "referenceNumber": 69,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3366,7 +3577,7 @@
>        "licenseId": "GFDL-1.3-invariants-or-later",
>        "name": "GNU Free Documentation License v1.3 or later - invariants=
",
>        "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-lat=
er.html",
> -      "referenceNumber": 497,
> +      "referenceNumber": 550,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3378,7 +3589,7 @@
>        "licenseId": "GFDL-1.3-no-invariants-only",
>        "name": "GNU Free Documentation License v1.3 only - no invariants"=
,
>        "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-onl=
y.html",
> -      "referenceNumber": 254,
> +      "referenceNumber": 516,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3390,7 +3601,7 @@
>        "licenseId": "GFDL-1.3-no-invariants-or-later",
>        "name": "GNU Free Documentation License v1.3 or later - no invaria=
nts",
>        "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-=
later.html",
> -      "referenceNumber": 207,
> +      "referenceNumber": 73,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3403,7 +3614,7 @@
>        "licenseId": "GFDL-1.3-only",
>        "name": "GNU Free Documentation License v1.3 only",
>        "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
> -      "referenceNumber": 635,
> +      "referenceNumber": 223,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3416,7 +3627,7 @@
>        "licenseId": "GFDL-1.3-or-later",
>        "name": "GNU Free Documentation License v1.3 or later",
>        "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
> -      "referenceNumber": 448,
> +      "referenceNumber": 633,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/fdl-1.3.txt"
>        ]
> @@ -3428,7 +3639,7 @@
>        "licenseId": "Giftware",
>        "name": "Giftware License",
>        "reference": "https://spdx.org/licenses/Giftware.html",
> -      "referenceNumber": 172,
> +      "referenceNumber": 519,
>        "seeAlso": [
>          "http://liballeg.org/license.html#allegro-4-the-giftware-license=
"
>        ]
> @@ -3440,7 +3651,7 @@
>        "licenseId": "GL2PS",
>        "name": "GL2PS License",
>        "reference": "https://spdx.org/licenses/GL2PS.html",
> -      "referenceNumber": 434,
> +      "referenceNumber": 360,
>        "seeAlso": [
>          "http://www.geuz.org/gl2ps/COPYING.GL2PS"
>        ]
> @@ -3452,7 +3663,7 @@
>        "licenseId": "Glide",
>        "name": "3dfx Glide License",
>        "reference": "https://spdx.org/licenses/Glide.html",
> -      "referenceNumber": 189,
> +      "referenceNumber": 71,
>        "seeAlso": [
>          "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
>        ]
> @@ -3464,7 +3675,7 @@
>        "licenseId": "Glulxe",
>        "name": "Glulxe License",
>        "reference": "https://spdx.org/licenses/Glulxe.html",
> -      "referenceNumber": 85,
> +      "referenceNumber": 635,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Glulxe"
>        ]
> @@ -3476,7 +3687,7 @@
>        "licenseId": "GLWTPL",
>        "name": "Good Luck With That Public License",
>        "reference": "https://spdx.org/licenses/GLWTPL.html",
> -      "referenceNumber": 190,
> +      "referenceNumber": 27,
>        "seeAlso": [
>          "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb44=
2c0b31e33a65b9d6e85"
>        ]
> @@ -3489,7 +3700,7 @@
>        "licenseId": "gnuplot",
>        "name": "gnuplot License",
>        "reference": "https://spdx.org/licenses/gnuplot.html",
> -      "referenceNumber": 110,
> +      "referenceNumber": 247,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Gnuplot"
>        ]
> @@ -3501,7 +3712,7 @@
>        "licenseId": "GPL-1.0",
>        "name": "GNU General Public License v1.0 only",
>        "reference": "https://spdx.org/licenses/GPL-1.0.html",
> -      "referenceNumber": 630,
> +      "referenceNumber": 10,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
>        ]
> @@ -3513,7 +3724,7 @@
>        "licenseId": "GPL-1.0+",
>        "name": "GNU General Public License v1.0 or later",
>        "reference": "https://spdx.org/licenses/GPL-1.0+.html",
> -      "referenceNumber": 26,
> +      "referenceNumber": 177,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
>        ]
> @@ -3525,7 +3736,7 @@
>        "licenseId": "GPL-1.0-only",
>        "name": "GNU General Public License v1.0 only",
>        "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
> -      "referenceNumber": 12,
> +      "referenceNumber": 152,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
>        ]
> @@ -3537,7 +3748,7 @@
>        "licenseId": "GPL-1.0-or-later",
>        "name": "GNU General Public License v1.0 or later",
>        "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
> -      "referenceNumber": 642,
> +      "referenceNumber": 68,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.ht=
ml"
>        ]
> @@ -3550,7 +3761,7 @@
>        "licenseId": "GPL-2.0",
>        "name": "GNU General Public License v2.0 only",
>        "reference": "https://spdx.org/licenses/GPL-2.0.html",
> -      "referenceNumber": 524,
> +      "referenceNumber": 688,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
>          "https://opensource.org/licenses/GPL-2.0"
> @@ -3564,7 +3775,7 @@
>        "licenseId": "GPL-2.0+",
>        "name": "GNU General Public License v2.0 or later",
>        "reference": "https://spdx.org/licenses/GPL-2.0+.html",
> -      "referenceNumber": 25,
> +      "referenceNumber": 144,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
>          "https://opensource.org/licenses/GPL-2.0"
> @@ -3578,11 +3789,12 @@
>        "licenseId": "GPL-2.0-only",
>        "name": "GNU General Public License v2.0 only",
>        "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
> -      "referenceNumber": 618,
> +      "referenceNumber": 461,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
>          "https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt",
> -        "https://opensource.org/licenses/GPL-2.0"
> +        "https://opensource.org/licenses/GPL-2.0",
> +        "https://github.com/openjdk/jdk/blob/6162e2c5213c5dd7c1127fd9616=
b543efa898962/LICENSE"
>        ]
>      },
>      {
> @@ -3593,10 +3805,11 @@
>        "licenseId": "GPL-2.0-or-later",
>        "name": "GNU General Public License v2.0 or later",
>        "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
> -      "referenceNumber": 164,
> +      "referenceNumber": 99,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.ht=
ml",
> -        "https://opensource.org/licenses/GPL-2.0"
> +        "https://opensource.org/licenses/GPL-2.0",
> +        "https://github.com/openjdk/jdk/blob/6162e2c5213c5dd7c1127fd9616=
b543efa898962/LICENSE"
>        ]
>      },
>      {
> @@ -3606,7 +3819,7 @@
>        "licenseId": "GPL-2.0-with-autoconf-exception",
>        "name": "GNU General Public License v2.0 w/Autoconf exception",
>        "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-exce=
ption.html",
> -      "referenceNumber": 146,
> +      "referenceNumber": 618,
>        "seeAlso": [
>          "http://ac-archive.sourceforge.net/doc/copyright.html"
>        ]
> @@ -3618,7 +3831,7 @@
>        "licenseId": "GPL-2.0-with-bison-exception",
>        "name": "GNU General Public License v2.0 w/Bison exception",
>        "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-excepti=
on.html",
> -      "referenceNumber": 374,
> +      "referenceNumber": 358,
>        "seeAlso": [
>          "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id=
=3D193d7c7054ba7197b0789e14965b739162319b5e#n141"
>        ]
> @@ -3630,7 +3843,7 @@
>        "licenseId": "GPL-2.0-with-classpath-exception",
>        "name": "GNU General Public License v2.0 w/Classpath exception",
>        "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-exc=
eption.html",
> -      "referenceNumber": 331,
> +      "referenceNumber": 171,
>        "seeAlso": [
>          "https://www.gnu.org/software/classpath/license.html"
>        ]
> @@ -3642,7 +3855,7 @@
>        "licenseId": "GPL-2.0-with-font-exception",
>        "name": "GNU General Public License v2.0 w/Font exception",
>        "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exceptio=
n.html",
> -      "referenceNumber": 542,
> +      "referenceNumber": 151,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/gpl-faq.html#FontException"
>        ]
> @@ -3654,7 +3867,7 @@
>        "licenseId": "GPL-2.0-with-GCC-exception",
>        "name": "GNU General Public License v2.0 w/GCC Runtime Library exc=
eption",
>        "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception=
.html",
> -      "referenceNumber": 68,
> +      "referenceNumber": 525,
>        "seeAlso": [
>          "https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/libgcc1.c=
;h=3D762f5143fc6eed57b6797c82710f3538aa52b40b;hb=3Dcb143a3ce4fb417c68f5fa26=
91a1b1b1053dfba9#l10"
>        ]
> @@ -3667,7 +3880,7 @@
>        "licenseId": "GPL-3.0",
>        "name": "GNU General Public License v3.0 only",
>        "reference": "https://spdx.org/licenses/GPL-3.0.html",
> -      "referenceNumber": 442,
> +      "referenceNumber": 503,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
>          "https://opensource.org/licenses/GPL-3.0"
> @@ -3681,7 +3894,7 @@
>        "licenseId": "GPL-3.0+",
>        "name": "GNU General Public License v3.0 or later",
>        "reference": "https://spdx.org/licenses/GPL-3.0+.html",
> -      "referenceNumber": 270,
> +      "referenceNumber": 131,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
>          "https://opensource.org/licenses/GPL-3.0"
> @@ -3695,7 +3908,7 @@
>        "licenseId": "GPL-3.0-only",
>        "name": "GNU General Public License v3.0 only",
>        "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
> -      "referenceNumber": 133,
> +      "referenceNumber": 632,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
>          "https://opensource.org/licenses/GPL-3.0"
> @@ -3709,7 +3922,7 @@
>        "licenseId": "GPL-3.0-or-later",
>        "name": "GNU General Public License v3.0 or later",
>        "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
> -      "referenceNumber": 390,
> +      "referenceNumber": 467,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
>          "https://opensource.org/licenses/GPL-3.0"
> @@ -3722,7 +3935,7 @@
>        "licenseId": "GPL-3.0-with-autoconf-exception",
>        "name": "GNU General Public License v3.0 w/Autoconf exception",
>        "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-exce=
ption.html",
> -      "referenceNumber": 458,
> +      "referenceNumber": 650,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/autoconf-exception-3.0.html"
>        ]
> @@ -3734,7 +3947,7 @@
>        "licenseId": "GPL-3.0-with-GCC-exception",
>        "name": "GNU General Public License v3.0 w/GCC Runtime Library exc=
eption",
>        "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception=
.html",
> -      "referenceNumber": 356,
> +      "referenceNumber": 601,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/gcc-exception-3.1.html"
>        ]
> @@ -3746,7 +3959,7 @@
>        "licenseId": "Graphics-Gems",
>        "name": "Graphics Gems License",
>        "reference": "https://spdx.org/licenses/Graphics-Gems.html",
> -      "referenceNumber": 574,
> +      "referenceNumber": 255,
>        "seeAlso": [
>          "https://github.com/erich666/GraphicsGems/blob/master/LICENSE.md=
"
>        ]
> @@ -3758,7 +3971,7 @@
>        "licenseId": "gSOAP-1.3b",
>        "name": "gSOAP Public License v1.3b",
>        "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
> -      "referenceNumber": 655,
> +      "referenceNumber": 668,
>        "seeAlso": [
>          "http://www.cs.fsu.edu/~engelen/license.html"
>        ]
> @@ -3770,7 +3983,7 @@
>        "licenseId": "gtkbook",
>        "name": "gtkbook License",
>        "reference": "https://spdx.org/licenses/gtkbook.html",
> -      "referenceNumber": 237,
> +      "referenceNumber": 465,
>        "seeAlso": [
>          "https://github.com/slogan621/gtkbook",
>          "https://github.com/oetiker/rrdtool-1.x/blob/master/src/plbasena=
me.c#L8-L11"
> @@ -3783,7 +3996,7 @@
>        "licenseId": "Gutmann",
>        "name": "Gutmann License",
>        "reference": "https://spdx.org/licenses/Gutmann.html",
> -      "referenceNumber": 441,
> +      "referenceNumber": 524,
>        "seeAlso": [
>          "https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c"
>        ]
> @@ -3795,11 +4008,23 @@
>        "licenseId": "HaskellReport",
>        "name": "Haskell Language Report License",
>        "reference": "https://spdx.org/licenses/HaskellReport.html",
> -      "referenceNumber": 625,
> +      "referenceNumber": 605,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Repor=
t_License"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/HDF5.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "HDF5",
> +      "name": "HDF5 License",
> +      "reference": "https://spdx.org/licenses/HDF5.html",
> +      "referenceNumber": 19,
> +      "seeAlso": [
> +        "https://github.com/HDFGroup/hdf5/?tab=3DLicense-1-ov-file#readm=
e"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/hdparm.json",
>        "isDeprecatedLicenseId": false,
> @@ -3807,11 +4032,23 @@
>        "licenseId": "hdparm",
>        "name": "hdparm License",
>        "reference": "https://spdx.org/licenses/hdparm.html",
> -      "referenceNumber": 81,
> +      "referenceNumber": 283,
>        "seeAlso": [
>          "https://github.com/Distrotech/hdparm/blob/4517550db29a91420fb2b=
020349523b1b4512df2/LICENSE.TXT"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/HIDAPI.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "HIDAPI",
> +      "name": "HIDAPI License",
> +      "reference": "https://spdx.org/licenses/HIDAPI.html",
> +      "referenceNumber": 310,
> +      "seeAlso": [
> +        "https://github.com/signal11/hidapi/blob/master/LICENSE-orig.txt=
"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
>        "isDeprecatedLicenseId": false,
> @@ -3819,7 +4056,7 @@
>        "licenseId": "Hippocratic-2.1",
>        "name": "Hippocratic License 2.1",
>        "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
> -      "referenceNumber": 299,
> +      "referenceNumber": 87,
>        "seeAlso": [
>          "https://firstdonoharm.dev/version/2/1/license.html",
>          "https://github.com/EthicalSource/hippocratic-license/blob/58c0e=
646d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
> @@ -3832,7 +4069,7 @@
>        "licenseId": "HP-1986",
>        "name": "Hewlett-Packard 1986 License",
>        "reference": "https://spdx.org/licenses/HP-1986.html",
> -      "referenceNumber": 277,
> +      "referenceNumber": 282,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/machine/hppa/memchr.S;h=3D1cca3e5e8867aa4bffef1f75a5c1bba25c0c4=
41e;hb=3DHEAD#l2"
>        ]
> @@ -3844,7 +4081,7 @@
>        "licenseId": "HP-1989",
>        "name": "Hewlett-Packard 1989 License",
>        "reference": "https://spdx.org/licenses/HP-1989.html",
> -      "referenceNumber": 639,
> +      "referenceNumber": 8,
>        "seeAlso": [
>          "https://github.com/bleargh45/Data-UUID/blob/master/LICENSE"
>        ]
> @@ -3857,7 +4094,7 @@
>        "licenseId": "HPND",
>        "name": "Historical Permission Notice and Disclaimer",
>        "reference": "https://spdx.org/licenses/HPND.html",
> -      "referenceNumber": 281,
> +      "referenceNumber": 209,
>        "seeAlso": [
>          "https://opensource.org/licenses/HPND",
>          "http://lists.opensource.org/pipermail/license-discuss_lists.ope=
nsource.org/2002-November/006304.html"
> @@ -3870,7 +4107,7 @@
>        "licenseId": "HPND-DEC",
>        "name": "Historical Permission Notice and Disclaimer - DEC variant=
",
>        "reference": "https://spdx.org/licenses/HPND-DEC.html",
> -      "referenceNumber": 577,
> +      "referenceNumber": 112,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/app/xkbcomp/-/blob/master/C=
OPYING?ref_type=3Dheads#L69"
>        ]
> @@ -3882,7 +4119,7 @@
>        "licenseId": "HPND-doc",
>        "name": "Historical Permission Notice and Disclaimer - documentati=
on variant",
>        "reference": "https://spdx.org/licenses/HPND-doc.html",
> -      "referenceNumber": 391,
> +      "referenceNumber": 600,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/C=
OPYING?ref_type=3Dheads#L185-197",
>          "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/C=
OPYING?ref_type=3Dheads#L70-77"
> @@ -3895,7 +4132,7 @@
>        "licenseId": "HPND-doc-sell",
>        "name": "Historical Permission Notice and Disclaimer - documentati=
on sell variant",
>        "reference": "https://spdx.org/licenses/HPND-doc-sell.html",
> -      "referenceNumber": 163,
> +      "referenceNumber": 306,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/C=
OPYING?ref_type=3Dheads#L108-117",
>          "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/C=
OPYING?ref_type=3Dheads#L153-162"
> @@ -3908,7 +4145,7 @@
>        "licenseId": "HPND-export-US",
>        "name": "HPND with US Government export control warning",
>        "reference": "https://spdx.org/licenses/HPND-export-US.html",
> -      "referenceNumber": 214,
> +      "referenceNumber": 459,
>        "seeAlso": [
>          "https://www.kermitproject.org/ck90.html#source"
>        ]
> @@ -3920,7 +4157,7 @@
>        "licenseId": "HPND-export-US-acknowledgement",
>        "name": "HPND with US Government export control warning and acknow=
ledgment",
>        "reference": "https://spdx.org/licenses/HPND-export-US-acknowledge=
ment.html",
> -      "referenceNumber": 610,
> +      "referenceNumber": 487,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L831=
-L852",
>          "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
> @@ -3933,7 +4170,7 @@
>        "licenseId": "HPND-export-US-modify",
>        "name": "HPND with US Government export control warning and modifi=
cation rqmt",
>        "reference": "https://spdx.org/licenses/HPND-export-US-modify.html=
",
> -      "referenceNumber": 498,
> +      "referenceNumber": 172,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L115=
7-L1182",
>          "https://github.com/pythongssapi/k5test/blob/v0.10.3/K5TEST-LICE=
NSE.txt"
> @@ -3946,7 +4183,7 @@
>        "licenseId": "HPND-export2-US",
>        "name": "HPND with US Government export control and 2 disclaimers"=
,
>        "reference": "https://spdx.org/licenses/HPND-export2-US.html",
> -      "referenceNumber": 33,
> +      "referenceNumber": 1,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L111=
-L133",
>          "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
> @@ -3959,7 +4196,7 @@
>        "licenseId": "HPND-Fenneberg-Livingston",
>        "name": "Historical Permission Notice and Disclaimer - Fenneberg-L=
ivingston variant",
>        "reference": "https://spdx.org/licenses/HPND-Fenneberg-Livingston.=
html",
> -      "referenceNumber": 145,
> +      "referenceNumber": 445,
>        "seeAlso": [
>          "https://github.com/FreeRADIUS/freeradius-client/blob/master/COP=
YRIGHT#L32",
>          "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L34"
> @@ -3972,7 +4209,7 @@
>        "licenseId": "HPND-INRIA-IMAG",
>        "name": "Historical Permission Notice and Disclaimer    - INRIA-IM=
AG variant",
>        "reference": "https://spdx.org/licenses/HPND-INRIA-IMAG.html",
> -      "referenceNumber": 614,
> +      "referenceNumber": 233,
>        "seeAlso": [
>          "https://github.com/ppp-project/ppp/blob/master/pppd/ipv6cp.c#L7=
5-L83"
>        ]
> @@ -3984,7 +4221,7 @@
>        "licenseId": "HPND-Intel",
>        "name": "Historical Permission Notice and Disclaimer - Intel varia=
nt",
>        "reference": "https://spdx.org/licenses/HPND-Intel.html",
> -      "referenceNumber": 195,
> +      "referenceNumber": 228,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/machine/i960/memcpy.S;hb=3DHEAD"
>        ]
> @@ -3996,7 +4233,7 @@
>        "licenseId": "HPND-Kevlin-Henney",
>        "name": "Historical Permission Notice and Disclaimer - Kevlin Henn=
ey variant",
>        "reference": "https://spdx.org/licenses/HPND-Kevlin-Henney.html",
> -      "referenceNumber": 428,
> +      "referenceNumber": 528,
>        "seeAlso": [
>          "https://github.com/mruby/mruby/blob/83d12f8d52522cdb7c8cc46fad3=
4821359f453e6/mrbgems/mruby-dir/src/Win/dirent.c#L127-L140"
>        ]
> @@ -4008,7 +4245,7 @@
>        "licenseId": "HPND-Markus-Kuhn",
>        "name": "Historical Permission Notice and Disclaimer - Markus Kuhn=
 variant",
>        "reference": "https://spdx.org/licenses/HPND-Markus-Kuhn.html",
> -      "referenceNumber": 8,
> +      "referenceNumber": 623,
>        "seeAlso": [
>          "https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c",
>          "https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dr=
eadline/readline/support/wcwidth.c;h=3D0f5ec995796f4813abbcf4972aec0378ab74=
722a;hb=3DHEAD#l55"
> @@ -4021,7 +4258,7 @@
>        "licenseId": "HPND-merchantability-variant",
>        "name": "Historical Permission Notice and Disclaimer - merchantabi=
lity variant",
>        "reference": "https://spdx.org/licenses/HPND-merchantability-varia=
nt.html",
> -      "referenceNumber": 540,
> +      "referenceNumber": 157,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/misc/fini.c;hb=3DHEAD"
>        ]
> @@ -4033,11 +4270,21 @@
>        "licenseId": "HPND-MIT-disclaimer",
>        "name": "Historical Permission Notice and Disclaimer with MIT disc=
laimer",
>        "reference": "https://spdx.org/licenses/HPND-MIT-disclaimer.html",
> -      "referenceNumber": 185,
> +      "referenceNumber": 313,
>        "seeAlso": [
>          "https://metacpan.org/release/NLNETLABS/Net-DNS-SEC-1.22/source/=
LICENSE"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/HPND-Netrek.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "HPND-Netrek",
> +      "name": "Historical Permission Notice and Disclaimer - Netrek vari=
ant",
> +      "reference": "https://spdx.org/licenses/HPND-Netrek.html",
> +      "referenceNumber": 387,
> +      "seeAlso": []
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/HPND-Pbmplus.json",
>        "isDeprecatedLicenseId": false,
> @@ -4045,7 +4292,7 @@
>        "licenseId": "HPND-Pbmplus",
>        "name": "Historical Permission Notice and Disclaimer - Pbmplus var=
iant",
>        "reference": "https://spdx.org/licenses/HPND-Pbmplus.html",
> -      "referenceNumber": 603,
> +      "referenceNumber": 339,
>        "seeAlso": [
>          "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/ne=
tpbm.c#l8"
>        ]
> @@ -4057,7 +4304,7 @@
>        "licenseId": "HPND-sell-MIT-disclaimer-xserver",
>        "name": "Historical Permission Notice and Disclaimer - sell xserve=
r variant with MIT disclaimer",
>        "reference": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-x=
server.html",
> -      "referenceNumber": 125,
> +      "referenceNumber": 341,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYI=
NG?ref_type=3Dheads#L1781"
>        ]
> @@ -4069,7 +4316,7 @@
>        "licenseId": "HPND-sell-regexpr",
>        "name": "Historical Permission Notice and Disclaimer - sell regexp=
r variant",
>        "reference": "https://spdx.org/licenses/HPND-sell-regexpr.html",
> -      "referenceNumber": 633,
> +      "referenceNumber": 681,
>        "seeAlso": [
>          "https://gitlab.com/bacula-org/bacula/-/blob/Branch-11.0/bacula/=
LICENSE-FOSS?ref_type=3Dheads#L245"
>        ]
> @@ -4081,9 +4328,10 @@
>        "licenseId": "HPND-sell-variant",
>        "name": "Historical Permission Notice and Disclaimer - sell varian=
t",
>        "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
> -      "referenceNumber": 344,
> +      "referenceNumber": 13,
>        "seeAlso": [
> -        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/net/sunrpc/auth_gss/gss_generic_token.c?h=3Dv4.19"
> +        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/net/sunrpc/auth_gss/gss_generic_token.c?h=3Dv4.19",
> +        "https://github.com/kfish/xsel/blob/master/COPYING"
>        ]
>      },
>      {
> @@ -4093,7 +4341,7 @@
>        "licenseId": "HPND-sell-variant-MIT-disclaimer",
>        "name": "HPND sell variant with MIT disclaimer",
>        "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disc=
laimer.html",
> -      "referenceNumber": 160,
> +      "referenceNumber": 225,
>        "seeAlso": [
>          "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/REA=
DME"
>        ]
> @@ -4105,7 +4353,7 @@
>        "licenseId": "HPND-sell-variant-MIT-disclaimer-rev",
>        "name": "HPND sell variant with MIT disclaimer - reverse",
>        "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-disc=
laimer-rev.html",
> -      "referenceNumber": 609,
> +      "referenceNumber": 357,
>        "seeAlso": [
>          "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/dyn=
list.c"
>        ]
> @@ -4117,7 +4365,7 @@
>        "licenseId": "HPND-UC",
>        "name": "Historical Permission Notice and Disclaimer - University =
of California variant",
>        "reference": "https://spdx.org/licenses/HPND-UC.html",
> -      "referenceNumber": 386,
> +      "referenceNumber": 210,
>        "seeAlso": [
>          "https://core.tcl-lang.org/tk/file?name=3Dcompat/unistd.h"
>        ]
> @@ -4129,7 +4377,7 @@
>        "licenseId": "HPND-UC-export-US",
>        "name": "Historical Permission Notice and Disclaimer - University =
of California, US export warning",
>        "reference": "https://spdx.org/licenses/HPND-UC-export-US.html",
> -      "referenceNumber": 118,
> +      "referenceNumber": 143,
>        "seeAlso": [
>          "https://github.com/RTimothyEdwards/magic/blob/master/LICENSE"
>        ]
> @@ -4141,7 +4389,7 @@
>        "licenseId": "HTMLTIDY",
>        "name": "HTML Tidy License",
>        "reference": "https://spdx.org/licenses/HTMLTIDY.html",
> -      "referenceNumber": 134,
> +      "referenceNumber": 478,
>        "seeAlso": [
>          "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md=
"
>        ]
> @@ -4153,7 +4401,7 @@
>        "licenseId": "IBM-pibs",
>        "name": "IBM PowerPC Initialization and Boot Software",
>        "reference": "https://spdx.org/licenses/IBM-pibs.html",
> -      "referenceNumber": 102,
> +      "referenceNumber": 242,
>        "seeAlso": [
>          "http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Darch/powerpc/cp=
u/ppc4xx/miiphy.c;h=3D297155fdafa064b955e53e9832de93bfb0cfb85b;hb=3D9fab4bf=
4cc077c21e43941866f3f2c196f28670d"
>        ]
> @@ -4165,7 +4413,7 @@
>        "licenseId": "ICU",
>        "name": "ICU License",
>        "reference": "https://spdx.org/licenses/ICU.html",
> -      "referenceNumber": 67,
> +      "referenceNumber": 289,
>        "seeAlso": [
>          "http://source.icu-project.org/repos/icu/icu/trunk/license.html"
>        ]
> @@ -4177,7 +4425,7 @@
>        "licenseId": "IEC-Code-Components-EULA",
>        "name": "IEC    Code Components End-user licence agreement",
>        "reference": "https://spdx.org/licenses/IEC-Code-Components-EULA.h=
tml",
> -      "referenceNumber": 359,
> +      "referenceNumber": 399,
>        "seeAlso": [
>          "https://www.iec.ch/webstore/custserv/pdf/CC-EULA.pdf",
>          "https://www.iec.ch/CCv1",
> @@ -4192,7 +4440,7 @@
>        "licenseId": "IJG",
>        "name": "Independent JPEG Group License",
>        "reference": "https://spdx.org/licenses/IJG.html",
> -      "referenceNumber": 641,
> +      "referenceNumber": 512,
>        "seeAlso": [
>          "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev=3D1.2"
>        ]
> @@ -4204,7 +4452,7 @@
>        "licenseId": "IJG-short",
>        "name": "Independent JPEG Group License - short",
>        "reference": "https://spdx.org/licenses/IJG-short.html",
> -      "referenceNumber": 615,
> +      "referenceNumber": 694,
>        "seeAlso": [
>          "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/ljpg=
/"
>        ]
> @@ -4216,7 +4464,7 @@
>        "licenseId": "ImageMagick",
>        "name": "ImageMagick License",
>        "reference": "https://spdx.org/licenses/ImageMagick.html",
> -      "referenceNumber": 478,
> +      "referenceNumber": 472,
>        "seeAlso": [
>          "http://www.imagemagick.org/script/license.php"
>        ]
> @@ -4229,7 +4477,7 @@
>        "licenseId": "iMatix",
>        "name": "iMatix Standard Function Library Agreement",
>        "reference": "https://spdx.org/licenses/iMatix.html",
> -      "referenceNumber": 327,
> +      "referenceNumber": 482,
>        "seeAlso": [
>          "http://legacy.imatix.com/html/sfl/sfl4.htm#license"
>        ]
> @@ -4242,7 +4490,7 @@
>        "licenseId": "Imlib2",
>        "name": "Imlib2 License",
>        "reference": "https://spdx.org/licenses/Imlib2.html",
> -      "referenceNumber": 169,
> +      "referenceNumber": 552,
>        "seeAlso": [
>          "http://trac.enlightenment.org/e/browser/trunk/imlib2/COPYING",
>          "https://git.enlightenment.org/legacy/imlib2.git/tree/COPYING"
> @@ -4255,7 +4503,7 @@
>        "licenseId": "Info-ZIP",
>        "name": "Info-ZIP License",
>        "reference": "https://spdx.org/licenses/Info-ZIP.html",
> -      "referenceNumber": 269,
> +      "referenceNumber": 52,
>        "seeAlso": [
>          "http://www.info-zip.org/license.html"
>        ]
> @@ -4267,12 +4515,24 @@
>        "licenseId": "Inner-Net-2.0",
>        "name": "Inner Net License v2.0",
>        "reference": "https://spdx.org/licenses/Inner-Net-2.0.html",
> -      "referenceNumber": 572,
> +      "referenceNumber": 328,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Inner_Net_License",
>          "https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3DLICENSES=
;h=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD#l207"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/InnoSetup.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "InnoSetup",
> +      "name": "Inno Setup License",
> +      "reference": "https://spdx.org/licenses/InnoSetup.html",
> +      "referenceNumber": 354,
> +      "seeAlso": [
> +        "https://github.com/jrsoftware/issrc/blob/HEAD/license.txt"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Intel.json",
>        "isDeprecatedLicenseId": false,
> @@ -4281,7 +4541,7 @@
>        "licenseId": "Intel",
>        "name": "Intel Open Source License",
>        "reference": "https://spdx.org/licenses/Intel.html",
> -      "referenceNumber": 623,
> +      "referenceNumber": 419,
>        "seeAlso": [
>          "https://opensource.org/licenses/Intel"
>        ]
> @@ -4293,7 +4553,7 @@
>        "licenseId": "Intel-ACPI",
>        "name": "Intel ACPI Software License Agreement",
>        "reference": "https://spdx.org/licenses/Intel-ACPI.html",
> -      "referenceNumber": 571,
> +      "referenceNumber": 206,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Intel_ACPI_Software_Li=
cense_Agreement"
>        ]
> @@ -4305,7 +4565,7 @@
>        "licenseId": "Interbase-1.0",
>        "name": "Interbase Public License v1.0",
>        "reference": "https://spdx.org/licenses/Interbase-1.0.html",
> -      "referenceNumber": 654,
> +      "referenceNumber": 532,
>        "seeAlso": [
>          "https://web.archive.org/web/20060319014854/http://info.borland.=
com/devsupport/interbase/opensource/IPL.html"
>        ]
> @@ -4318,7 +4578,7 @@
>        "licenseId": "IPA",
>        "name": "IPA Font License",
>        "reference": "https://spdx.org/licenses/IPA.html",
> -      "referenceNumber": 94,
> +      "referenceNumber": 186,
>        "seeAlso": [
>          "https://opensource.org/licenses/IPA"
>        ]
> @@ -4331,7 +4591,7 @@
>        "licenseId": "IPL-1.0",
>        "name": "IBM Public License v1.0",
>        "reference": "https://spdx.org/licenses/IPL-1.0.html",
> -      "referenceNumber": 332,
> +      "referenceNumber": 591,
>        "seeAlso": [
>          "https://opensource.org/licenses/IPL-1.0"
>        ]
> @@ -4344,7 +4604,7 @@
>        "licenseId": "ISC",
>        "name": "ISC License",
>        "reference": "https://spdx.org/licenses/ISC.html",
> -      "referenceNumber": 488,
> +      "referenceNumber": 58,
>        "seeAlso": [
>          "https://www.isc.org/licenses/",
>          "https://www.isc.org/downloads/software-support-policy/isc-licen=
se/",
> @@ -4358,7 +4618,7 @@
>        "licenseId": "ISC-Veillard",
>        "name": "ISC Veillard variant",
>        "reference": "https://spdx.org/licenses/ISC-Veillard.html",
> -      "referenceNumber": 513,
> +      "referenceNumber": 317,
>        "seeAlso": [
>          "https://raw.githubusercontent.com/GNOME/libxml2/4c2e7c651f6c2f0=
d1a74f350cbda95f7df3e7017/hash.c",
>          "https://github.com/GNOME/libxml2/blob/master/dict.c",
> @@ -4372,7 +4632,7 @@
>        "licenseId": "Jam",
>        "name": "Jam License",
>        "reference": "https://spdx.org/licenses/Jam.html",
> -      "referenceNumber": 108,
> +      "referenceNumber": 475,
>        "seeAlso": [
>          "https://www.boost.org/doc/libs/1_35_0/doc/html/jam.html",
>          "https://web.archive.org/web/20160330173339/https://swarm.worksh=
op.perforce.com/files/guest/perforce_software/jam/src/README"
> @@ -4385,11 +4645,23 @@
>        "licenseId": "JasPer-2.0",
>        "name": "JasPer License",
>        "reference": "https://spdx.org/licenses/JasPer-2.0.html",
> -      "referenceNumber": 487,
> +      "referenceNumber": 103,
>        "seeAlso": [
>          "http://www.ece.uvic.ca/~mdadams/jasper/LICENSE"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/jove.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "jove",
> +      "name": "Jove License",
> +      "reference": "https://spdx.org/licenses/jove.html",
> +      "referenceNumber": 642,
> +      "seeAlso": [
> +        "https://github.com/jonmacs/jove/blob/4_17/LICENSE"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/JPL-image.json",
>        "isDeprecatedLicenseId": false,
> @@ -4397,7 +4669,7 @@
>        "licenseId": "JPL-image",
>        "name": "JPL Image Use Policy",
>        "reference": "https://spdx.org/licenses/JPL-image.html",
> -      "referenceNumber": 363,
> +      "referenceNumber": 321,
>        "seeAlso": [
>          "https://www.jpl.nasa.gov/jpl-image-use-policy"
>        ]
> @@ -4409,7 +4681,7 @@
>        "licenseId": "JPNIC",
>        "name": "Japan Network Information Center License",
>        "reference": "https://spdx.org/licenses/JPNIC.html",
> -      "referenceNumber": 83,
> +      "referenceNumber": 655,
>        "seeAlso": [
>          "https://gitlab.isc.org/isc-projects/bind9/blob/master/COPYRIGHT=
#L366"
>        ]
> @@ -4422,7 +4694,7 @@
>        "licenseId": "JSON",
>        "name": "JSON License",
>        "reference": "https://spdx.org/licenses/JSON.html",
> -      "referenceNumber": 65,
> +      "referenceNumber": 54,
>        "seeAlso": [
>          "http://www.json.org/license.html"
>        ]
> @@ -4434,7 +4706,7 @@
>        "licenseId": "Kastrup",
>        "name": "Kastrup License",
>        "reference": "https://spdx.org/licenses/Kastrup.html",
> -      "referenceNumber": 226,
> +      "referenceNumber": 491,
>        "seeAlso": [
>          "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/kast=
rup/binhex.dtx"
>        ]
> @@ -4446,7 +4718,7 @@
>        "licenseId": "Kazlib",
>        "name": "Kazlib License",
>        "reference": "https://spdx.org/licenses/Kazlib.html",
> -      "referenceNumber": 232,
> +      "referenceNumber": 312,
>        "seeAlso": [
>          "http://git.savannah.gnu.org/cgit/kazlib.git/tree/except.c?id=3D=
0062df360c2d17d57f6af19b0e444c51feb99036"
>        ]
> @@ -4458,7 +4730,7 @@
>        "licenseId": "Knuth-CTAN",
>        "name": "Knuth CTAN License",
>        "reference": "https://spdx.org/licenses/Knuth-CTAN.html",
> -      "referenceNumber": 290,
> +      "referenceNumber": 332,
>        "seeAlso": [
>          "https://ctan.org/license/knuth"
>        ]
> @@ -4470,7 +4742,7 @@
>        "licenseId": "LAL-1.2",
>        "name": "Licence Art Libre 1.2",
>        "reference": "https://spdx.org/licenses/LAL-1.2.html",
> -      "referenceNumber": 165,
> +      "referenceNumber": 134,
>        "seeAlso": [
>          "http://artlibre.org/licence/lal/licence-art-libre-12/"
>        ]
> @@ -4482,7 +4754,7 @@
>        "licenseId": "LAL-1.3",
>        "name": "Licence Art Libre 1.3",
>        "reference": "https://spdx.org/licenses/LAL-1.3.html",
> -      "referenceNumber": 600,
> +      "referenceNumber": 521,
>        "seeAlso": [
>          "https://artlibre.org/"
>        ]
> @@ -4494,7 +4766,7 @@
>        "licenseId": "Latex2e",
>        "name": "Latex2e License",
>        "reference": "https://spdx.org/licenses/Latex2e.html",
> -      "referenceNumber": 439,
> +      "referenceNumber": 43,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Latex2e"
>        ]
> @@ -4506,7 +4778,7 @@
>        "licenseId": "Latex2e-translated-notice",
>        "name": "Latex2e with translated notice permission",
>        "reference": "https://spdx.org/licenses/Latex2e-translated-notice.=
html",
> -      "referenceNumber": 620,
> +      "referenceNumber": 523,
>        "seeAlso": [
>          "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.te=
xi?id=3Da74c6b4ee49397cf330b333da1042bffa60ed14f#n74"
>        ]
> @@ -4518,7 +4790,7 @@
>        "licenseId": "Leptonica",
>        "name": "Leptonica License",
>        "reference": "https://spdx.org/licenses/Leptonica.html",
> -      "referenceNumber": 103,
> +      "referenceNumber": 137,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Leptonica"
>        ]
> @@ -4530,7 +4802,7 @@
>        "licenseId": "LGPL-2.0",
>        "name": "GNU Library General Public License v2 only",
>        "reference": "https://spdx.org/licenses/LGPL-2.0.html",
> -      "referenceNumber": 353,
> +      "referenceNumber": 676,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
>        ]
> @@ -4542,7 +4814,7 @@
>        "licenseId": "LGPL-2.0+",
>        "name": "GNU Library General Public License v2 or later",
>        "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
> -      "referenceNumber": 62,
> +      "referenceNumber": 409,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
>        ]
> @@ -4554,7 +4826,7 @@
>        "licenseId": "LGPL-2.0-only",
>        "name": "GNU Library General Public License v2 only",
>        "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
> -      "referenceNumber": 519,
> +      "referenceNumber": 329,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
>        ]
> @@ -4566,7 +4838,7 @@
>        "licenseId": "LGPL-2.0-or-later",
>        "name": "GNU Library General Public License v2 or later",
>        "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
> -      "referenceNumber": 366,
> +      "referenceNumber": 75,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.h=
tml"
>        ]
> @@ -4579,7 +4851,7 @@
>        "licenseId": "LGPL-2.1",
>        "name": "GNU Lesser General Public License v2.1 only",
>        "reference": "https://spdx.org/licenses/LGPL-2.1.html",
> -      "referenceNumber": 656,
> +      "referenceNumber": 677,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
>          "https://opensource.org/licenses/LGPL-2.1"
> @@ -4593,7 +4865,7 @@
>        "licenseId": "LGPL-2.1+",
>        "name": "GNU Lesser General Public License v2.1 or later",
>        "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
> -      "referenceNumber": 64,
> +      "referenceNumber": 448,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
>          "https://opensource.org/licenses/LGPL-2.1"
> @@ -4607,7 +4879,7 @@
>        "licenseId": "LGPL-2.1-only",
>        "name": "GNU Lesser General Public License v2.1 only",
>        "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
> -      "referenceNumber": 177,
> +      "referenceNumber": 297,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
>          "https://opensource.org/licenses/LGPL-2.1"
> @@ -4621,7 +4893,7 @@
>        "licenseId": "LGPL-2.1-or-later",
>        "name": "GNU Lesser General Public License v2.1 or later",
>        "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
> -      "referenceNumber": 24,
> +      "referenceNumber": 187,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.h=
tml",
>          "https://opensource.org/licenses/LGPL-2.1"
> @@ -4635,7 +4907,7 @@
>        "licenseId": "LGPL-3.0",
>        "name": "GNU Lesser General Public License v3.0 only",
>        "reference": "https://spdx.org/licenses/LGPL-3.0.html",
> -      "referenceNumber": 578,
> +      "referenceNumber": 9,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
>          "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
> @@ -4650,7 +4922,7 @@
>        "licenseId": "LGPL-3.0+",
>        "name": "GNU Lesser General Public License v3.0 or later",
>        "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
> -      "referenceNumber": 233,
> +      "referenceNumber": 169,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
>          "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
> @@ -4665,7 +4937,7 @@
>        "licenseId": "LGPL-3.0-only",
>        "name": "GNU Lesser General Public License v3.0 only",
>        "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
> -      "referenceNumber": 3,
> +      "referenceNumber": 634,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
>          "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
> @@ -4680,7 +4952,7 @@
>        "licenseId": "LGPL-3.0-or-later",
>        "name": "GNU Lesser General Public License v3.0 or later",
>        "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
> -      "referenceNumber": 262,
> +      "referenceNumber": 502,
>        "seeAlso": [
>          "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
>          "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
> @@ -4694,7 +4966,7 @@
>        "licenseId": "LGPLLR",
>        "name": "Lesser General Public License For Linguistic Resources",
>        "reference": "https://spdx.org/licenses/LGPLLR.html",
> -      "referenceNumber": 477,
> +      "referenceNumber": 123,
>        "seeAlso": [
>          "http://www-igm.univ-mlv.fr/~unitex/lgpllr.html"
>        ]
> @@ -4706,7 +4978,19 @@
>        "licenseId": "Libpng",
>        "name": "libpng License",
>        "reference": "https://spdx.org/licenses/Libpng.html",
> -      "referenceNumber": 186,
> +      "referenceNumber": 62,
> +      "seeAlso": [
> +        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/libpng-1.6.35.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "libpng-1.6.35",
> +      "name": "PNG Reference Library License v1 (for libpng 0.5 through =
1.6.35)",
> +      "reference": "https://spdx.org/licenses/libpng-1.6.35.html",
> +      "referenceNumber": 429,
>        "seeAlso": [
>          "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
>        ]
> @@ -4718,7 +5002,7 @@
>        "licenseId": "libpng-2.0",
>        "name": "PNG Reference Library version 2",
>        "reference": "https://spdx.org/licenses/libpng-2.0.html",
> -      "referenceNumber": 257,
> +      "referenceNumber": 226,
>        "seeAlso": [
>          "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
>        ]
> @@ -4730,7 +5014,7 @@
>        "licenseId": "libselinux-1.0",
>        "name": "libselinux public domain notice",
>        "reference": "https://spdx.org/licenses/libselinux-1.0.html",
> -      "referenceNumber": 556,
> +      "referenceNumber": 263,
>        "seeAlso": [
>          "https://github.com/SELinuxProject/selinux/blob/master/libselinu=
x/LICENSE"
>        ]
> @@ -4742,7 +5026,7 @@
>        "licenseId": "libtiff",
>        "name": "libtiff License",
>        "reference": "https://spdx.org/licenses/libtiff.html",
> -      "referenceNumber": 392,
> +      "referenceNumber": 35,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/libtiff"
>        ]
> @@ -4754,7 +5038,7 @@
>        "licenseId": "libutil-David-Nugent",
>        "name": "libutil David Nugent License",
>        "reference": "https://spdx.org/licenses/libutil-David-Nugent.html"=
,
> -      "referenceNumber": 400,
> +      "referenceNumber": 402,
>        "seeAlso": [
>          "http://web.mit.edu/freebsd/head/lib/libutil/login_ok.3",
>          "https://cgit.freedesktop.org/libbsd/tree/man/setproctitle.3bsd"
> @@ -4767,7 +5051,7 @@
>        "licenseId": "LiLiQ-P-1.1",
>        "name": "Licence Libre du Qu\u00e9bec \u2013 Permissive version 1.=
1",
>        "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
> -      "referenceNumber": 43,
> +      "referenceNumber": 232,
>        "seeAlso": [
>          "https://forge.gouv.qc.ca/licence/fr/liliq-v1-1/",
>          "http://opensource.org/licenses/LiLiQ-P-1.1"
> @@ -4780,7 +5064,7 @@
>        "licenseId": "LiLiQ-R-1.1",
>        "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9=
 version 1.1",
>        "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
> -      "referenceNumber": 74,
> +      "referenceNumber": 229,
>        "seeAlso": [
>          "https://www.forge.gouv.qc.ca/participez/licence-logicielle/lice=
nce-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-l=
iliq-r-v1-1/",
>          "http://opensource.org/licenses/LiLiQ-R-1.1"
> @@ -4793,7 +5077,7 @@
>        "licenseId": "LiLiQ-Rplus-1.1",
>        "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9=
 forte version 1.1",
>        "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
> -      "referenceNumber": 40,
> +      "referenceNumber": 238,
>        "seeAlso": [
>          "https://www.forge.gouv.qc.ca/participez/licence-logicielle/lice=
nce-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-f=
orte-liliq-r-v1-1/",
>          "http://opensource.org/licenses/LiLiQ-Rplus-1.1"
> @@ -4806,7 +5090,7 @@
>        "licenseId": "Linux-man-pages-1-para",
>        "name": "Linux man-pages - 1 paragraph",
>        "reference": "https://spdx.org/licenses/Linux-man-pages-1-para.htm=
l",
> -      "referenceNumber": 339,
> +      "referenceNumber": 78,
>        "seeAlso": [
>          "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/getcpu.2#n4"
>        ]
> @@ -4818,7 +5102,7 @@
>        "licenseId": "Linux-man-pages-copyleft",
>        "name": "Linux man-pages Copyleft",
>        "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft.h=
tml",
> -      "referenceNumber": 590,
> +      "referenceNumber": 640,
>        "seeAlso": [
>          "https://www.kernel.org/doc/man-pages/licenses.html"
>        ]
> @@ -4830,7 +5114,7 @@
>        "licenseId": "Linux-man-pages-copyleft-2-para",
>        "name": "Linux man-pages Copyleft - 2 paragraphs",
>        "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-2=
-para.html",
> -      "referenceNumber": 86,
> +      "referenceNumber": 592,
>        "seeAlso": [
>          "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/move_pages.2#n5",
>          "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/migrate_pages.2#n8"
> @@ -4843,7 +5127,7 @@
>        "licenseId": "Linux-man-pages-copyleft-var",
>        "name": "Linux man-pages Copyleft Variant",
>        "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-v=
ar.html",
> -      "referenceNumber": 337,
> +      "referenceNumber": 202,
>        "seeAlso": [
>          "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tre=
e/man2/set_mempolicy.2#n5"
>        ]
> @@ -4855,7 +5139,7 @@
>        "licenseId": "Linux-OpenIB",
>        "name": "Linux Kernel Variant of OpenIB.org license",
>        "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
> -      "referenceNumber": 613,
> +      "referenceNumber": 513,
>        "seeAlso": [
>          "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/infiniband/core/sa.h"
>        ]
> @@ -4867,7 +5151,7 @@
>        "licenseId": "LOOP",
>        "name": "Common Lisp LOOP License",
>        "reference": "https://spdx.org/licenses/LOOP.html",
> -      "referenceNumber": 607,
> +      "referenceNumber": 237,
>        "seeAlso": [
>          "https://gitlab.com/embeddable-common-lisp/ecl/-/blob/develop/sr=
c/lsp/loop.lsp",
>          "http://git.savannah.gnu.org/cgit/gcl.git/tree/gcl/lsp/gcl_loop.=
lsp?h=3DVersion_2_6_13pre",
> @@ -4884,7 +5168,7 @@
>        "licenseId": "LPD-document",
>        "name": "LPD Documentation License",
>        "reference": "https://spdx.org/licenses/LPD-document.html",
> -      "referenceNumber": 522,
> +      "referenceNumber": 5,
>        "seeAlso": [
>          "https://github.com/Cyan4973/xxHash/blob/dev/doc/xxhash_spec.md"=
,
>          "https://www.ietf.org/rfc/rfc1952.txt"
> @@ -4897,7 +5181,7 @@
>        "licenseId": "LPL-1.0",
>        "name": "Lucent Public License Version 1.0",
>        "reference": "https://spdx.org/licenses/LPL-1.0.html",
> -      "referenceNumber": 196,
> +      "referenceNumber": 136,
>        "seeAlso": [
>          "https://opensource.org/licenses/LPL-1.0"
>        ]
> @@ -4910,7 +5194,7 @@
>        "licenseId": "LPL-1.02",
>        "name": "Lucent Public License v1.02",
>        "reference": "https://spdx.org/licenses/LPL-1.02.html",
> -      "referenceNumber": 69,
> +      "referenceNumber": 656,
>        "seeAlso": [
>          "http://plan9.bell-labs.com/plan9/license.html",
>          "https://opensource.org/licenses/LPL-1.02"
> @@ -4923,7 +5207,7 @@
>        "licenseId": "LPPL-1.0",
>        "name": "LaTeX Project Public License v1.0",
>        "reference": "https://spdx.org/licenses/LPPL-1.0.html",
> -      "referenceNumber": 215,
> +      "referenceNumber": 63,
>        "seeAlso": [
>          "http://www.latex-project.org/lppl/lppl-1-0.txt"
>        ]
> @@ -4935,7 +5219,7 @@
>        "licenseId": "LPPL-1.1",
>        "name": "LaTeX Project Public License v1.1",
>        "reference": "https://spdx.org/licenses/LPPL-1.1.html",
> -      "referenceNumber": 114,
> +      "referenceNumber": 542,
>        "seeAlso": [
>          "http://www.latex-project.org/lppl/lppl-1-1.txt"
>        ]
> @@ -4948,7 +5232,7 @@
>        "licenseId": "LPPL-1.2",
>        "name": "LaTeX Project Public License v1.2",
>        "reference": "https://spdx.org/licenses/LPPL-1.2.html",
> -      "referenceNumber": 435,
> +      "referenceNumber": 486,
>        "seeAlso": [
>          "http://www.latex-project.org/lppl/lppl-1-2.txt"
>        ]
> @@ -4961,7 +5245,7 @@
>        "licenseId": "LPPL-1.3a",
>        "name": "LaTeX Project Public License v1.3a",
>        "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
> -      "referenceNumber": 18,
> +      "referenceNumber": 280,
>        "seeAlso": [
>          "http://www.latex-project.org/lppl/lppl-1-3a.txt"
>        ]
> @@ -4973,7 +5257,7 @@
>        "licenseId": "LPPL-1.3c",
>        "name": "LaTeX Project Public License v1.3c",
>        "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
> -      "referenceNumber": 240,
> +      "referenceNumber": 33,
>        "seeAlso": [
>          "http://www.latex-project.org/lppl/lppl-1-3c.txt",
>          "https://opensource.org/licenses/LPPL-1.3c"
> @@ -4986,7 +5270,7 @@
>        "licenseId": "lsof",
>        "name": "lsof License",
>        "reference": "https://spdx.org/licenses/lsof.html",
> -      "referenceNumber": 605,
> +      "referenceNumber": 563,
>        "seeAlso": [
>          "https://github.com/lsof-org/lsof/blob/master/COPYING"
>        ]
> @@ -4998,7 +5282,7 @@
>        "licenseId": "Lucida-Bitmap-Fonts",
>        "name": "Lucida Bitmap Fonts License",
>        "reference": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.html",
> -      "referenceNumber": 399,
> +      "referenceNumber": 661,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/font/bh-100dpi/-/blob/maste=
r/COPYING?ref_type=3Dheads"
>        ]
> @@ -5010,7 +5294,7 @@
>        "licenseId": "LZMA-SDK-9.11-to-9.20",
>        "name": "LZMA SDK License (versions 9.11 to 9.20)",
>        "reference": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.html=
",
> -      "referenceNumber": 430,
> +      "referenceNumber": 349,
>        "seeAlso": [
>          "https://www.7-zip.org/sdk.html",
>          "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
> @@ -5023,7 +5307,7 @@
>        "licenseId": "LZMA-SDK-9.22",
>        "name": "LZMA SDK License (versions 9.22 and beyond)",
>        "reference": "https://spdx.org/licenses/LZMA-SDK-9.22.html",
> -      "referenceNumber": 244,
> +      "referenceNumber": 504,
>        "seeAlso": [
>          "https://www.7-zip.org/sdk.html",
>          "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
> @@ -5036,7 +5320,7 @@
>        "licenseId": "Mackerras-3-Clause",
>        "name": "Mackerras 3-Clause License",
>        "reference": "https://spdx.org/licenses/Mackerras-3-Clause.html",
> -      "referenceNumber": 59,
> +      "referenceNumber": 539,
>        "seeAlso": [
>          "https://github.com/ppp-project/ppp/blob/master/pppd/chap_ms.c#L=
6-L28"
>        ]
> @@ -5048,7 +5332,7 @@
>        "licenseId": "Mackerras-3-Clause-acknowledgment",
>        "name": "Mackerras 3-Clause - acknowledgment variant",
>        "reference": "https://spdx.org/licenses/Mackerras-3-Clause-acknowl=
edgment.html",
> -      "referenceNumber": 598,
> +      "referenceNumber": 433,
>        "seeAlso": [
>          "https://github.com/ppp-project/ppp/blob/master/pppd/auth.c#L6-L=
28"
>        ]
> @@ -5060,9 +5344,10 @@
>        "licenseId": "magaz",
>        "name": "magaz License",
>        "reference": "https://spdx.org/licenses/magaz.html",
> -      "referenceNumber": 516,
> +      "referenceNumber": 373,
>        "seeAlso": [
> -        "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/magaz/m=
agaz.tex"
> +        "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/magaz/m=
agaz.tex",
> +        "https://mirrors.ctan.org/macros/latex/contrib/version/version.s=
ty"
>        ]
>      },
>      {
> @@ -5072,7 +5357,7 @@
>        "licenseId": "mailprio",
>        "name": "mailprio License",
>        "reference": "https://spdx.org/licenses/mailprio.html",
> -      "referenceNumber": 179,
> +      "referenceNumber": 381,
>        "seeAlso": [
>          "https://fossies.org/linux/sendmail/contrib/mailprio"
>        ]
> @@ -5084,11 +5369,25 @@
>        "licenseId": "MakeIndex",
>        "name": "MakeIndex License",
>        "reference": "https://spdx.org/licenses/MakeIndex.html",
> -      "referenceNumber": 206,
> +      "referenceNumber": 165,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MakeIndex"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/man2html.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "man2html",
> +      "name": "man2html License",
> +      "reference": "https://spdx.org/licenses/man2html.html",
> +      "referenceNumber": 120,
> +      "seeAlso": [
> +        "http://primates.ximian.com/~flucifredi/man/man-1.6g.tar.gz",
> +        "https://github.com/hamano/man2html/blob/master/man2html.c",
> +        "https://docs.oracle.com/cd/E81115_01/html/E81116/licenses.html"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Martin-Birgmeier.json",
>        "isDeprecatedLicenseId": false,
> @@ -5096,7 +5395,7 @@
>        "licenseId": "Martin-Birgmeier",
>        "name": "Martin Birgmeier License",
>        "reference": "https://spdx.org/licenses/Martin-Birgmeier.html",
> -      "referenceNumber": 535,
> +      "referenceNumber": 361,
>        "seeAlso": [
>          "https://github.com/Perl/perl5/blob/blead/util.c#L6136"
>        ]
> @@ -5108,7 +5407,7 @@
>        "licenseId": "McPhee-slideshow",
>        "name": "McPhee Slideshow License",
>        "reference": "https://spdx.org/licenses/McPhee-slideshow.html",
> -      "referenceNumber": 492,
> +      "referenceNumber": 489,
>        "seeAlso": [
>          "https://mirror.las.iastate.edu/tex-archive/graphics/metapost/co=
ntrib/macros/slideshow/slideshow.mp"
>        ]
> @@ -5120,7 +5419,7 @@
>        "licenseId": "metamail",
>        "name": "metamail License",
>        "reference": "https://spdx.org/licenses/metamail.html",
> -      "referenceNumber": 437,
> +      "referenceNumber": 455,
>        "seeAlso": [
>          "https://github.com/Dual-Life/mime-base64/blob/master/Base64.xs#=
L12"
>        ]
> @@ -5132,12 +5431,24 @@
>        "licenseId": "Minpack",
>        "name": "Minpack License",
>        "reference": "https://spdx.org/licenses/Minpack.html",
> -      "referenceNumber": 512,
> +      "referenceNumber": 28,
>        "seeAlso": [
>          "http://www.netlib.org/minpack/disclaimer",
>          "https://gitlab.com/libeigen/eigen/-/blob/master/COPYING.MINPACK=
"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/MIPS.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "MIPS",
> +      "name": "MIPS License",
> +      "reference": "https://spdx.org/licenses/MIPS.html",
> +      "referenceNumber": 351,
> +      "seeAlso": [
> +        "https://sourceware.org/cgit/binutils-gdb/tree/include/coff/sym.=
h#n11"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/MirOS.json",
>        "isDeprecatedLicenseId": false,
> @@ -5145,7 +5456,7 @@
>        "licenseId": "MirOS",
>        "name": "The MirOS Licence",
>        "reference": "https://spdx.org/licenses/MirOS.html",
> -      "referenceNumber": 183,
> +      "referenceNumber": 692,
>        "seeAlso": [
>          "https://opensource.org/licenses/MirOS"
>        ]
> @@ -5158,9 +5469,10 @@
>        "licenseId": "MIT",
>        "name": "MIT License",
>        "reference": "https://spdx.org/licenses/MIT.html",
> -      "referenceNumber": 608,
> +      "referenceNumber": 515,
>        "seeAlso": [
> -        "https://opensource.org/license/mit/"
> +        "https://opensource.org/license/mit/",
> +        "http://opensource.org/licenses/MIT"
>        ]
>      },
>      {
> @@ -5170,7 +5482,7 @@
>        "licenseId": "MIT-0",
>        "name": "MIT No Attribution",
>        "reference": "https://spdx.org/licenses/MIT-0.html",
> -      "referenceNumber": 395,
> +      "referenceNumber": 173,
>        "seeAlso": [
>          "https://github.com/aws/mit-0",
>          "https://romanrm.net/mit-zero",
> @@ -5184,11 +5496,23 @@
>        "licenseId": "MIT-advertising",
>        "name": "Enlightenment License (e16)",
>        "reference": "https://spdx.org/licenses/MIT-advertising.html",
> -      "referenceNumber": 293,
> +      "referenceNumber": 440,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/MIT-Click.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "MIT-Click",
> +      "name": "MIT Click License",
> +      "reference": "https://spdx.org/licenses/MIT-Click.html",
> +      "referenceNumber": 438,
> +      "seeAlso": [
> +        "https://github.com/kohler/t1utils/blob/master/LICENSE"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/MIT-CMU.json",
>        "isDeprecatedLicenseId": false,
> @@ -5196,7 +5520,7 @@
>        "licenseId": "MIT-CMU",
>        "name": "CMU License",
>        "reference": "https://spdx.org/licenses/MIT-CMU.html",
> -      "referenceNumber": 575,
> +      "referenceNumber": 287,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:MIT?rd=3DLicensing/MIT=
#CMU_Style",
>          "https://github.com/python-pillow/Pillow/blob/fffb426092c8db24a5=
f4b6df243a8a3c01fb63cd/LICENSE"
> @@ -5209,7 +5533,7 @@
>        "licenseId": "MIT-enna",
>        "name": "enna License",
>        "reference": "https://spdx.org/licenses/MIT-enna.html",
> -      "referenceNumber": 638,
> +      "referenceNumber": 580,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MIT#enna"
>        ]
> @@ -5221,7 +5545,7 @@
>        "licenseId": "MIT-feh",
>        "name": "feh License",
>        "reference": "https://spdx.org/licenses/MIT-feh.html",
> -      "referenceNumber": 53,
> +      "referenceNumber": 408,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MIT#feh"
>        ]
> @@ -5233,7 +5557,7 @@
>        "licenseId": "MIT-Festival",
>        "name": "MIT Festival Variant",
>        "reference": "https://spdx.org/licenses/MIT-Festival.html",
> -      "referenceNumber": 317,
> +      "referenceNumber": 18,
>        "seeAlso": [
>          "https://github.com/festvox/flite/blob/master/COPYING",
>          "https://github.com/festvox/speech_tools/blob/master/COPYING"
> @@ -5246,7 +5570,7 @@
>        "licenseId": "MIT-Khronos-old",
>        "name": "MIT Khronos - old variant",
>        "reference": "https://spdx.org/licenses/MIT-Khronos-old.html",
> -      "referenceNumber": 249,
> +      "referenceNumber": 508,
>        "seeAlso": [
>          "https://github.com/KhronosGroup/SPIRV-Cross/blob/main/LICENSES/=
LicenseRef-KhronosFreeUse.txt"
>        ]
> @@ -5258,7 +5582,7 @@
>        "licenseId": "MIT-Modern-Variant",
>        "name": "MIT License Modern Variant",
>        "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
> -      "referenceNumber": 424,
> +      "referenceNumber": 304,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:MIT#Modern_Variants",
>          "https://ptolemy.berkeley.edu/copyright.htm",
> @@ -5272,10 +5596,9 @@
>        "licenseId": "MIT-open-group",
>        "name": "MIT Open Group variant",
>        "reference": "https://spdx.org/licenses/MIT-open-group.html",
> -      "referenceNumber": 283,
> +      "referenceNumber": 404,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/C=
OPYING",
> -        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/CO=
PYING",
>          "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/=
COPYING",
>          "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COP=
YING"
>        ]
> @@ -5287,7 +5610,7 @@
>        "licenseId": "MIT-testregex",
>        "name": "MIT testregex Variant",
>        "reference": "https://spdx.org/licenses/MIT-testregex.html",
> -      "referenceNumber": 427,
> +      "referenceNumber": 496,
>        "seeAlso": [
>          "https://github.com/dotnet/runtime/blob/55e1ac7c07df62c4108d4ace=
df78f77574470ce5/src/libraries/System.Text.RegularExpressions/tests/Functio=
nalTests/AttRegexTests.cs#L12-L28"
>        ]
> @@ -5299,7 +5622,7 @@
>        "licenseId": "MIT-Wu",
>        "name": "MIT Tom Wu Variant",
>        "reference": "https://spdx.org/licenses/MIT-Wu.html",
> -      "referenceNumber": 459,
> +      "referenceNumber": 355,
>        "seeAlso": [
>          "https://github.com/chromium/octane/blob/master/crypto.js"
>        ]
> @@ -5311,7 +5634,7 @@
>        "licenseId": "MITNFA",
>        "name": "MIT +no-false-attribs license",
>        "reference": "https://spdx.org/licenses/MITNFA.html",
> -      "referenceNumber": 157,
> +      "referenceNumber": 473,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MITNFA"
>        ]
> @@ -5323,7 +5646,7 @@
>        "licenseId": "MMIXware",
>        "name": "MMIXware License",
>        "reference": "https://spdx.org/licenses/MMIXware.html",
> -      "referenceNumber": 474,
> +      "referenceNumber": 663,
>        "seeAlso": [
>          "https://gitlab.lrz.de/mmix/mmixware/-/blob/master/boilerplate.w=
"
>        ]
> @@ -5335,7 +5658,7 @@
>        "licenseId": "Motosoto",
>        "name": "Motosoto License",
>        "reference": "https://spdx.org/licenses/Motosoto.html",
> -      "referenceNumber": 627,
> +      "referenceNumber": 507,
>        "seeAlso": [
>          "https://opensource.org/licenses/Motosoto"
>        ]
> @@ -5347,7 +5670,7 @@
>        "licenseId": "MPEG-SSG",
>        "name": "MPEG Software Simulation",
>        "reference": "https://spdx.org/licenses/MPEG-SSG.html",
> -      "referenceNumber": 417,
> +      "referenceNumber": 303,
>        "seeAlso": [
>          "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/co=
nverter/ppm/ppmtompeg/jrevdct.c#l1189"
>        ]
> @@ -5359,7 +5682,7 @@
>        "licenseId": "mpi-permissive",
>        "name": "mpi Permissive License",
>        "reference": "https://spdx.org/licenses/mpi-permissive.html",
> -      "referenceNumber": 80,
> +      "referenceNumber": 213,
>        "seeAlso": [
>          "https://sources.debian.org/src/openmpi/4.1.0-10/ompi/debuggers/=
msgq_interface.h/?hl=3D19#L19"
>        ]
> @@ -5371,7 +5694,7 @@
>        "licenseId": "mpich2",
>        "name": "mpich2 License",
>        "reference": "https://spdx.org/licenses/mpich2.html",
> -      "referenceNumber": 482,
> +      "referenceNumber": 102,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/MIT"
>        ]
> @@ -5383,7 +5706,7 @@
>        "licenseId": "MPL-1.0",
>        "name": "Mozilla Public License 1.0",
>        "reference": "https://spdx.org/licenses/MPL-1.0.html",
> -      "referenceNumber": 28,
> +      "referenceNumber": 665,
>        "seeAlso": [
>          "http://www.mozilla.org/MPL/MPL-1.0.html",
>          "https://opensource.org/licenses/MPL-1.0"
> @@ -5397,7 +5720,7 @@
>        "licenseId": "MPL-1.1",
>        "name": "Mozilla Public License 1.1",
>        "reference": "https://spdx.org/licenses/MPL-1.1.html",
> -      "referenceNumber": 619,
> +      "referenceNumber": 679,
>        "seeAlso": [
>          "http://www.mozilla.org/MPL/MPL-1.1.html",
>          "https://opensource.org/licenses/MPL-1.1"
> @@ -5411,7 +5734,7 @@
>        "licenseId": "MPL-2.0",
>        "name": "Mozilla Public License 2.0",
>        "reference": "https://spdx.org/licenses/MPL-2.0.html",
> -      "referenceNumber": 263,
> +      "referenceNumber": 599,
>        "seeAlso": [
>          "https://www.mozilla.org/MPL/2.0/",
>          "https://opensource.org/licenses/MPL-2.0"
> @@ -5424,7 +5747,7 @@
>        "licenseId": "MPL-2.0-no-copyleft-exception",
>        "name": "Mozilla Public License 2.0 (no copyleft exception)",
>        "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-except=
ion.html",
> -      "referenceNumber": 455,
> +      "referenceNumber": 174,
>        "seeAlso": [
>          "https://www.mozilla.org/MPL/2.0/",
>          "https://opensource.org/licenses/MPL-2.0"
> @@ -5437,7 +5760,7 @@
>        "licenseId": "mplus",
>        "name": "mplus Font License",
>        "reference": "https://spdx.org/licenses/mplus.html",
> -      "referenceNumber": 541,
> +      "referenceNumber": 17,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:Mplus?rd=3DLicensing/m=
plus"
>        ]
> @@ -5449,7 +5772,7 @@
>        "licenseId": "MS-LPL",
>        "name": "Microsoft Limited Public License",
>        "reference": "https://spdx.org/licenses/MS-LPL.html",
> -      "referenceNumber": 528,
> +      "referenceNumber": 674,
>        "seeAlso": [
>          "https://www.openhub.net/licenses/mslpl",
>          "https://github.com/gabegundy/atlserver/blob/master/License.txt"=
,
> @@ -5464,7 +5787,7 @@
>        "licenseId": "MS-PL",
>        "name": "Microsoft Public License",
>        "reference": "https://spdx.org/licenses/MS-PL.html",
> -      "referenceNumber": 499,
> +      "referenceNumber": 698,
>        "seeAlso": [
>          "http://www.microsoft.com/opensource/licenses.mspx",
>          "https://opensource.org/licenses/MS-PL"
> @@ -5478,7 +5801,7 @@
>        "licenseId": "MS-RL",
>        "name": "Microsoft Reciprocal License",
>        "reference": "https://spdx.org/licenses/MS-RL.html",
> -      "referenceNumber": 343,
> +      "referenceNumber": 276,
>        "seeAlso": [
>          "http://www.microsoft.com/opensource/licenses.mspx",
>          "https://opensource.org/licenses/MS-RL"
> @@ -5491,7 +5814,7 @@
>        "licenseId": "MTLL",
>        "name": "Matrix Template Library License",
>        "reference": "https://spdx.org/licenses/MTLL.html",
> -      "referenceNumber": 137,
> +      "referenceNumber": 588,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Matrix_Template_Librar=
y_License"
>        ]
> @@ -5503,7 +5826,7 @@
>        "licenseId": "MulanPSL-1.0",
>        "name": "Mulan Permissive Software License, Version 1",
>        "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
> -      "referenceNumber": 107,
> +      "referenceNumber": 320,
>        "seeAlso": [
>          "https://license.coscl.org.cn/MulanPSL/",
>          "https://github.com/yuwenlong/longphp/blob/25dfb70cc2a466dc4bb55=
ba30901cbce08d164b5/LICENSE"
> @@ -5516,7 +5839,7 @@
>        "licenseId": "MulanPSL-2.0",
>        "name": "Mulan Permissive Software License, Version 2",
>        "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
> -      "referenceNumber": 490,
> +      "referenceNumber": 182,
>        "seeAlso": [
>          "https://license.coscl.org.cn/MulanPSL2"
>        ]
> @@ -5528,7 +5851,7 @@
>        "licenseId": "Multics",
>        "name": "Multics License",
>        "reference": "https://spdx.org/licenses/Multics.html",
> -      "referenceNumber": 573,
> +      "referenceNumber": 60,
>        "seeAlso": [
>          "https://opensource.org/licenses/Multics"
>        ]
> @@ -5540,7 +5863,7 @@
>        "licenseId": "Mup",
>        "name": "Mup License",
>        "reference": "https://spdx.org/licenses/Mup.html",
> -      "referenceNumber": 440,
> +      "referenceNumber": 288,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Mup"
>        ]
> @@ -5552,7 +5875,7 @@
>        "licenseId": "NAIST-2003",
>        "name": "Nara Institute of Science and Technology License (2003)",
>        "reference": "https://spdx.org/licenses/NAIST-2003.html",
> -      "referenceNumber": 104,
> +      "referenceNumber": 462,
>        "seeAlso": [
>          "https://enterprise.dejacode.com/licenses/public/naist-2003/#lic=
ense-text",
>          "https://github.com/nodejs/node/blob/4a19cc8947b1bba2b2d27816ec3=
d0edf9b28e503/LICENSE#L343"
> @@ -5566,7 +5889,7 @@
>        "licenseId": "NASA-1.3",
>        "name": "NASA Open Source Agreement 1.3",
>        "reference": "https://spdx.org/licenses/NASA-1.3.html",
> -      "referenceNumber": 127,
> +      "referenceNumber": 432,
>        "seeAlso": [
>          "http://ti.arc.nasa.gov/opensource/nosa/",
>          "https://opensource.org/licenses/NASA-1.3"
> @@ -5579,7 +5902,7 @@
>        "licenseId": "Naumen",
>        "name": "Naumen Public License",
>        "reference": "https://spdx.org/licenses/Naumen.html",
> -      "referenceNumber": 128,
> +      "referenceNumber": 307,
>        "seeAlso": [
>          "https://opensource.org/licenses/Naumen"
>        ]
> @@ -5591,7 +5914,7 @@
>        "licenseId": "NBPL-1.0",
>        "name": "Net Boolean Public License v1",
>        "reference": "https://spdx.org/licenses/NBPL-1.0.html",
> -      "referenceNumber": 41,
> +      "referenceNumber": 460,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D37b4b3f6cc4bf34e1d3dec61e69914b9819d8894"
>        ]
> @@ -5603,7 +5926,7 @@
>        "licenseId": "NCBI-PD",
>        "name": "NCBI Public Domain Notice",
>        "reference": "https://spdx.org/licenses/NCBI-PD.html",
> -      "referenceNumber": 362,
> +      "referenceNumber": 696,
>        "seeAlso": [
>          "https://github.com/ncbi/sra-tools/blob/e8e5b6af4edc460156ad9ce5=
902d0779cffbf685/LICENSE",
>          "https://github.com/ncbi/datasets/blob/0ea4cd16b61e5b799d9cc55ae=
cfa016d6c9bd2bf/LICENSE.md",
> @@ -5619,7 +5942,7 @@
>        "licenseId": "NCGL-UK-2.0",
>        "name": "Non-Commercial Government Licence",
>        "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
> -      "referenceNumber": 320,
> +      "referenceNumber": 392,
>        "seeAlso": [
>          "http://www.nationalarchives.gov.uk/doc/non-commercial-governmen=
t-licence/version/2/"
>        ]
> @@ -5631,7 +5954,7 @@
>        "licenseId": "NCL",
>        "name": "NCL Source Code License",
>        "reference": "https://spdx.org/licenses/NCL.html",
> -      "referenceNumber": 153,
> +      "referenceNumber": 154,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/=
src/modules/module-filter-chain/pffft.c?ref_type=3Dheads#L1-52"
>        ]
> @@ -5644,7 +5967,7 @@
>        "licenseId": "NCSA",
>        "name": "University of Illinois/NCSA Open Source License",
>        "reference": "https://spdx.org/licenses/NCSA.html",
> -      "referenceNumber": 557,
> +      "referenceNumber": 148,
>        "seeAlso": [
>          "http://otm.illinois.edu/uiuc_openSource",
>          "https://opensource.org/licenses/NCSA"
> @@ -5652,12 +5975,12 @@
>      },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Net-SNMP.json",
> -      "isDeprecatedLicenseId": false,
> +      "isDeprecatedLicenseId": true,
>        "isOsiApproved": false,
>        "licenseId": "Net-SNMP",
>        "name": "Net-SNMP License",
>        "reference": "https://spdx.org/licenses/Net-SNMP.html",
> -      "referenceNumber": 234,
> +      "referenceNumber": 638,
>        "seeAlso": [
>          "http://net-snmp.sourceforge.net/about/license.html"
>        ]
> @@ -5669,7 +5992,7 @@
>        "licenseId": "NetCDF",
>        "name": "NetCDF license",
>        "reference": "https://spdx.org/licenses/NetCDF.html",
> -      "referenceNumber": 503,
> +      "referenceNumber": 626,
>        "seeAlso": [
>          "http://www.unidata.ucar.edu/software/netcdf/copyright.html"
>        ]
> @@ -5681,7 +6004,7 @@
>        "licenseId": "Newsletr",
>        "name": "Newsletr License",
>        "reference": "https://spdx.org/licenses/Newsletr.html",
> -      "referenceNumber": 412,
> +      "referenceNumber": 607,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Newsletr"
>        ]
> @@ -5693,11 +6016,23 @@
>        "licenseId": "NGPL",
>        "name": "Nethack General Public License",
>        "reference": "https://spdx.org/licenses/NGPL.html",
> -      "referenceNumber": 275,
> +      "referenceNumber": 64,
>        "seeAlso": [
>          "https://opensource.org/licenses/NGPL"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/ngrep.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "ngrep",
> +      "name": "ngrep License",
> +      "reference": "https://spdx.org/licenses/ngrep.html",
> +      "referenceNumber": 16,
> +      "seeAlso": [
> +        "https://github.com/jpr5/ngrep/blob/master/LICENSE"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/NICTA-1.0.json",
>        "isDeprecatedLicenseId": false,
> @@ -5705,7 +6040,7 @@
>        "licenseId": "NICTA-1.0",
>        "name": "NICTA Public Software License, Version 1.0",
>        "reference": "https://spdx.org/licenses/NICTA-1.0.html",
> -      "referenceNumber": 311,
> +      "referenceNumber": 406,
>        "seeAlso": [
>          "https://opensource.apple.com/source/mDNSResponder/mDNSResponder=
-320.10/mDNSPosix/nss_ReadMe.txt"
>        ]
> @@ -5717,7 +6052,7 @@
>        "licenseId": "NIST-PD",
>        "name": "NIST Public Domain Notice",
>        "reference": "https://spdx.org/licenses/NIST-PD.html",
> -      "referenceNumber": 309,
> +      "referenceNumber": 98,
>        "seeAlso": [
>          "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfec=
eb2db8cba05b7c2e0cd3/LICENSE.txt",
>          "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c=
98348188a65a135d98/README.md"
> @@ -5730,7 +6065,7 @@
>        "licenseId": "NIST-PD-fallback",
>        "name": "NIST Public Domain Notice with license fallback",
>        "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
> -      "referenceNumber": 34,
> +      "referenceNumber": 616,
>        "seeAlso": [
>          "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897=
d9a7d2656b42abe3/LICENSE",
>          "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c5=
986071cf6568cc34/LICENSE.rst"
> @@ -5743,7 +6078,7 @@
>        "licenseId": "NIST-Software",
>        "name": "NIST Software License",
>        "reference": "https://spdx.org/licenses/NIST-Software.html",
> -      "referenceNumber": 76,
> +      "referenceNumber": 447,
>        "seeAlso": [
>          "https://github.com/open-quantum-safe/liboqs/blob/40b01fdbb270f8=
614fde30e65d30e9da18c02393/src/common/rand/rand_nist.c#L1-L15"
>        ]
> @@ -5755,7 +6090,7 @@
>        "licenseId": "NLOD-1.0",
>        "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
>        "reference": "https://spdx.org/licenses/NLOD-1.0.html",
> -      "referenceNumber": 565,
> +      "referenceNumber": 249,
>        "seeAlso": [
>          "http://data.norge.no/nlod/en/1.0"
>        ]
> @@ -5767,7 +6102,7 @@
>        "licenseId": "NLOD-2.0",
>        "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
>        "reference": "https://spdx.org/licenses/NLOD-2.0.html",
> -      "referenceNumber": 483,
> +      "referenceNumber": 687,
>        "seeAlso": [
>          "http://data.norge.no/nlod/en/2.0"
>        ]
> @@ -5779,7 +6114,7 @@
>        "licenseId": "NLPL",
>        "name": "No Limit Public License",
>        "reference": "https://spdx.org/licenses/NLPL.html",
> -      "referenceNumber": 71,
> +      "referenceNumber": 161,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/NLPL"
>        ]
> @@ -5792,7 +6127,7 @@
>        "licenseId": "Nokia",
>        "name": "Nokia Open Source License",
>        "reference": "https://spdx.org/licenses/Nokia.html",
> -      "referenceNumber": 44,
> +      "referenceNumber": 464,
>        "seeAlso": [
>          "https://opensource.org/licenses/nokia"
>        ]
> @@ -5805,7 +6140,7 @@
>        "licenseId": "NOSL",
>        "name": "Netizen Open Source License",
>        "reference": "https://spdx.org/licenses/NOSL.html",
> -      "referenceNumber": 126,
> +      "referenceNumber": 471,
>        "seeAlso": [
>          "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
>        ]
> @@ -5817,7 +6152,7 @@
>        "licenseId": "Noweb",
>        "name": "Noweb License",
>        "reference": "https://spdx.org/licenses/Noweb.html",
> -      "referenceNumber": 534,
> +      "referenceNumber": 77,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Noweb"
>        ]
> @@ -5830,7 +6165,7 @@
>        "licenseId": "NPL-1.0",
>        "name": "Netscape Public License v1.0",
>        "reference": "https://spdx.org/licenses/NPL-1.0.html",
> -      "referenceNumber": 346,
> +      "referenceNumber": 372,
>        "seeAlso": [
>          "http://www.mozilla.org/MPL/NPL/1.0/"
>        ]
> @@ -5843,7 +6178,7 @@
>        "licenseId": "NPL-1.1",
>        "name": "Netscape Public License v1.1",
>        "reference": "https://spdx.org/licenses/NPL-1.1.html",
> -      "referenceNumber": 418,
> +      "referenceNumber": 518,
>        "seeAlso": [
>          "http://www.mozilla.org/MPL/NPL/1.1/"
>        ]
> @@ -5855,7 +6190,7 @@
>        "licenseId": "NPOSL-3.0",
>        "name": "Non-Profit Open Software License 3.0",
>        "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
> -      "referenceNumber": 579,
> +      "referenceNumber": 195,
>        "seeAlso": [
>          "https://opensource.org/licenses/NOSL3.0"
>        ]
> @@ -5867,11 +6202,24 @@
>        "licenseId": "NRL",
>        "name": "NRL License",
>        "reference": "https://spdx.org/licenses/NRL.html",
> -      "referenceNumber": 230,
> +      "referenceNumber": 146,
>        "seeAlso": [
>          "http://web.mit.edu/network/isakmp/nrllicense.html"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/NTIA-PD.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "NTIA-PD",
> +      "name": "NTIA Public Domain Notice",
> +      "reference": "https://spdx.org/licenses/NTIA-PD.html",
> +      "referenceNumber": 426,
> +      "seeAlso": [
> +        "https://raw.githubusercontent.com/NTIA/itm/refs/heads/master/LI=
CENSE.md",
> +        "https://raw.githubusercontent.com/NTIA/scos-sensor/refs/heads/m=
aster/LICENSE.md"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/NTP.json",
>        "isDeprecatedLicenseId": false,
> @@ -5879,7 +6227,7 @@
>        "licenseId": "NTP",
>        "name": "NTP License",
>        "reference": "https://spdx.org/licenses/NTP.html",
> -      "referenceNumber": 547,
> +      "referenceNumber": 621,
>        "seeAlso": [
>          "https://opensource.org/licenses/NTP"
>        ]
> @@ -5891,7 +6239,7 @@
>        "licenseId": "NTP-0",
>        "name": "NTP No Attribution",
>        "reference": "https://spdx.org/licenses/NTP-0.html",
> -      "referenceNumber": 460,
> +      "referenceNumber": 566,
>        "seeAlso": [
>          "https://github.com/tytso/e2fsprogs/blob/master/lib/et/et_name.c=
"
>        ]
> @@ -5904,7 +6252,7 @@
>        "licenseId": "Nunit",
>        "name": "Nunit License",
>        "reference": "https://spdx.org/licenses/Nunit.html",
> -      "referenceNumber": 634,
> +      "referenceNumber": 203,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Nunit"
>        ]
> @@ -5916,7 +6264,7 @@
>        "licenseId": "O-UDA-1.0",
>        "name": "Open Use of Data Agreement v1.0",
>        "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
> -      "referenceNumber": 191,
> +      "referenceNumber": 485,
>        "seeAlso": [
>          "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1=
.0/O-UDA-1.0.md",
>          "https://cdla.dev/open-use-of-data-agreement-v1-0/"
> @@ -5929,7 +6277,7 @@
>        "licenseId": "OAR",
>        "name": "OAR License",
>        "reference": "https://spdx.org/licenses/OAR.html",
> -      "referenceNumber": 4,
> +      "referenceNumber": 251,
>        "seeAlso": [
>          "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3D=
newlib/libc/string/strsignal.c;hb=3DHEAD#l35"
>        ]
> @@ -5941,7 +6289,7 @@
>        "licenseId": "OCCT-PL",
>        "name": "Open CASCADE Technology Public License",
>        "reference": "https://spdx.org/licenses/OCCT-PL.html",
> -      "referenceNumber": 596,
> +      "referenceNumber": 371,
>        "seeAlso": [
>          "http://www.opencascade.com/content/occt-public-license"
>        ]
> @@ -5953,7 +6301,7 @@
>        "licenseId": "OCLC-2.0",
>        "name": "OCLC Research Public License 2.0",
>        "reference": "https://spdx.org/licenses/OCLC-2.0.html",
> -      "referenceNumber": 308,
> +      "referenceNumber": 274,
>        "seeAlso": [
>          "http://www.oclc.org/research/activities/software/license/v2fina=
l.htm",
>          "https://opensource.org/licenses/OCLC-2.0"
> @@ -5967,7 +6315,7 @@
>        "licenseId": "ODbL-1.0",
>        "name": "Open Data Commons Open Database License v1.0",
>        "reference": "https://spdx.org/licenses/ODbL-1.0.html",
> -      "referenceNumber": 243,
> +      "referenceNumber": 397,
>        "seeAlso": [
>          "http://www.opendatacommons.org/licenses/odbl/1.0/",
>          "https://opendatacommons.org/licenses/odbl/1-0/"
> @@ -5980,7 +6328,7 @@
>        "licenseId": "ODC-By-1.0",
>        "name": "Open Data Commons Attribution License v1.0",
>        "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
> -      "referenceNumber": 7,
> +      "referenceNumber": 46,
>        "seeAlso": [
>          "https://opendatacommons.org/licenses/by/1.0/"
>        ]
> @@ -5992,7 +6340,7 @@
>        "licenseId": "OFFIS",
>        "name": "OFFIS License",
>        "reference": "https://spdx.org/licenses/OFFIS.html",
> -      "referenceNumber": 238,
> +      "referenceNumber": 368,
>        "seeAlso": [
>          "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/dico=
m/README"
>        ]
> @@ -6005,7 +6353,7 @@
>        "licenseId": "OFL-1.0",
>        "name": "SIL Open Font License 1.0",
>        "reference": "https://spdx.org/licenses/OFL-1.0.html",
> -      "referenceNumber": 475,
> +      "referenceNumber": 589,
>        "seeAlso": [
>          "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web=
"
>        ]
> @@ -6017,7 +6365,7 @@
>        "licenseId": "OFL-1.0-no-RFN",
>        "name": "SIL Open Font License 1.0 with no Reserved Font Name",
>        "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
> -      "referenceNumber": 23,
> +      "referenceNumber": 653,
>        "seeAlso": [
>          "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web=
"
>        ]
> @@ -6029,7 +6377,7 @@
>        "licenseId": "OFL-1.0-RFN",
>        "name": "SIL Open Font License 1.0 with Reserved Font Name",
>        "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
> -      "referenceNumber": 11,
> +      "referenceNumber": 201,
>        "seeAlso": [
>          "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web=
"
>        ]
> @@ -6042,7 +6390,7 @@
>        "licenseId": "OFL-1.1",
>        "name": "SIL Open Font License 1.1",
>        "reference": "https://spdx.org/licenses/OFL-1.1.html",
> -      "referenceNumber": 248,
> +      "referenceNumber": 608,
>        "seeAlso": [
>          "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
>          "https://opensource.org/licenses/OFL-1.1"
> @@ -6055,7 +6403,7 @@
>        "licenseId": "OFL-1.1-no-RFN",
>        "name": "SIL Open Font License 1.1 with no Reserved Font Name",
>        "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
> -      "referenceNumber": 550,
> +      "referenceNumber": 204,
>        "seeAlso": [
>          "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
>          "https://opensource.org/licenses/OFL-1.1"
> @@ -6068,7 +6416,7 @@
>        "licenseId": "OFL-1.1-RFN",
>        "name": "SIL Open Font License 1.1 with Reserved Font Name",
>        "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
> -      "referenceNumber": 507,
> +      "referenceNumber": 82,
>        "seeAlso": [
>          "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
>          "https://opensource.org/licenses/OFL-1.1"
> @@ -6081,7 +6429,7 @@
>        "licenseId": "OGC-1.0",
>        "name": "OGC Software License, Version 1.0",
>        "reference": "https://spdx.org/licenses/OGC-1.0.html",
> -      "referenceNumber": 166,
> +      "referenceNumber": 612,
>        "seeAlso": [
>          "https://www.ogc.org/ogc/software/1.0"
>        ]
> @@ -6093,7 +6441,7 @@
>        "licenseId": "OGDL-Taiwan-1.0",
>        "name": "Taiwan Open Government Data License, version 1.0",
>        "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
> -      "referenceNumber": 468,
> +      "referenceNumber": 129,
>        "seeAlso": [
>          "https://data.gov.tw/license"
>        ]
> @@ -6105,7 +6453,7 @@
>        "licenseId": "OGL-Canada-2.0",
>        "name": "Open Government Licence - Canada",
>        "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
> -      "referenceNumber": 464,
> +      "referenceNumber": 544,
>        "seeAlso": [
>          "https://open.canada.ca/en/open-government-licence-canada"
>        ]
> @@ -6117,7 +6465,7 @@
>        "licenseId": "OGL-UK-1.0",
>        "name": "Open Government Licence v1.0",
>        "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
> -      "referenceNumber": 489,
> +      "referenceNumber": 168,
>        "seeAlso": [
>          "http://www.nationalarchives.gov.uk/doc/open-government-licence/=
version/1/"
>        ]
> @@ -6129,7 +6477,7 @@
>        "licenseId": "OGL-UK-2.0",
>        "name": "Open Government Licence v2.0",
>        "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
> -      "referenceNumber": 467,
> +      "referenceNumber": 400,
>        "seeAlso": [
>          "http://www.nationalarchives.gov.uk/doc/open-government-licence/=
version/2/"
>        ]
> @@ -6141,7 +6489,7 @@
>        "licenseId": "OGL-UK-3.0",
>        "name": "Open Government Licence v3.0",
>        "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
> -      "referenceNumber": 151,
> +      "referenceNumber": 570,
>        "seeAlso": [
>          "http://www.nationalarchives.gov.uk/doc/open-government-licence/=
version/3/"
>        ]
> @@ -6153,7 +6501,7 @@
>        "licenseId": "OGTSL",
>        "name": "Open Group Test Suite License",
>        "reference": "https://spdx.org/licenses/OGTSL.html",
> -      "referenceNumber": 367,
> +      "referenceNumber": 534,
>        "seeAlso": [
>          "http://www.opengroup.org/testing/downloads/The_Open_Group_TSL.t=
xt",
>          "https://opensource.org/licenses/OGTSL"
> @@ -6166,7 +6514,7 @@
>        "licenseId": "OLDAP-1.1",
>        "name": "Open LDAP Public License v1.1",
>        "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
> -      "referenceNumber": 180,
> +      "referenceNumber": 333,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D806557a5ad59804ef3a44d5abfbe91d706b0791f"
>        ]
> @@ -6178,7 +6526,7 @@
>        "licenseId": "OLDAP-1.2",
>        "name": "Open LDAP Public License v1.2",
>        "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
> -      "referenceNumber": 229,
> +      "referenceNumber": 281,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D42b0383c50c299977b5893ee695cf4e486fb0dc7"
>        ]
> @@ -6190,7 +6538,7 @@
>        "licenseId": "OLDAP-1.3",
>        "name": "Open LDAP Public License v1.3",
>        "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
> -      "referenceNumber": 224,
> +      "referenceNumber": 386,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3De5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1"
>        ]
> @@ -6202,7 +6550,7 @@
>        "licenseId": "OLDAP-1.4",
>        "name": "Open LDAP Public License v1.4",
>        "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
> -      "referenceNumber": 255,
> +      "referenceNumber": 105,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dc9f95c2f3f2ffb5e0ae55fe7388af75547660941"
>        ]
> @@ -6214,7 +6562,7 @@
>        "licenseId": "OLDAP-2.0",
>        "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)=
",
>        "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
> -      "referenceNumber": 208,
> +      "referenceNumber": 657,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dcbf50f4e1185a21abd4c0a54d3f4341fe28f36ea"
>        ]
> @@ -6226,7 +6574,7 @@
>        "licenseId": "OLDAP-2.0.1",
>        "name": "Open LDAP Public License v2.0.1",
>        "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
> -      "referenceNumber": 79,
> +      "referenceNumber": 654,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Db6d68acd14e51ca3aab4428bf26522aa74873f0e"
>        ]
> @@ -6238,7 +6586,7 @@
>        "licenseId": "OLDAP-2.1",
>        "name": "Open LDAP Public License v2.1",
>        "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
> -      "referenceNumber": 360,
> +      "referenceNumber": 170,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Db0d176738e96a0d3b9f85cb51e140a86f21be715"
>        ]
> @@ -6250,7 +6598,7 @@
>        "licenseId": "OLDAP-2.2",
>        "name": "Open LDAP Public License v2.2",
>        "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
> -      "referenceNumber": 316,
> +      "referenceNumber": 667,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D470b0c18ec67621c85881b2733057fecf4a1acc3"
>        ]
> @@ -6262,7 +6610,7 @@
>        "licenseId": "OLDAP-2.2.1",
>        "name": "Open LDAP Public License v2.2.1",
>        "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
> -      "referenceNumber": 426,
> +      "referenceNumber": 378,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D4bc786f34b50aa301be6f5600f58a980070f481e"
>        ]
> @@ -6274,7 +6622,7 @@
>        "licenseId": "OLDAP-2.2.2",
>        "name": "Open LDAP Public License 2.2.2",
>        "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
> -      "referenceNumber": 384,
> +      "referenceNumber": 314,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Ddf2cc1e21eb7c160695f5b7cffd6296c151ba188"
>        ]
> @@ -6287,7 +6635,7 @@
>        "licenseId": "OLDAP-2.3",
>        "name": "Open LDAP Public License v2.3",
>        "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
> -      "referenceNumber": 381,
> +      "referenceNumber": 411,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dd32cf54a32d581ab475d23c810b0a7fbaf8d63c3"
>        ]
> @@ -6299,7 +6647,7 @@
>        "licenseId": "OLDAP-2.4",
>        "name": "Open LDAP Public License v2.4",
>        "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
> -      "referenceNumber": 93,
> +      "referenceNumber": 382,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3Dcd1284c4a91a8a380d904eee68d1583f989ed386"
>        ]
> @@ -6311,7 +6659,7 @@
>        "licenseId": "OLDAP-2.5",
>        "name": "Open LDAP Public License v2.5",
>        "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
> -      "referenceNumber": 651,
> +      "referenceNumber": 443,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D6852b9d90022e8593c98205413380536b1b5a7cf"
>        ]
> @@ -6323,7 +6671,7 @@
>        "licenseId": "OLDAP-2.6",
>        "name": "Open LDAP Public License v2.6",
>        "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
> -      "referenceNumber": 568,
> +      "referenceNumber": 344,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D1cae062821881f41b73012ba816434897abf4205"
>        ]
> @@ -6336,7 +6684,7 @@
>        "licenseId": "OLDAP-2.7",
>        "name": "Open LDAP Public License v2.7",
>        "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
> -      "referenceNumber": 220,
> +      "referenceNumber": 574,
>        "seeAlso": [
>          "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Db=
lob;f=3DLICENSE;hb=3D47c2415c1df81556eeb39be6cad458ef87c534a2"
>        ]
> @@ -6348,7 +6696,7 @@
>        "licenseId": "OLDAP-2.8",
>        "name": "Open LDAP Public License v2.8",
>        "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
> -      "referenceNumber": 5,
> +      "referenceNumber": 364,
>        "seeAlso": [
>          "http://www.openldap.org/software/release/license.html"
>        ]
> @@ -6360,7 +6708,7 @@
>        "licenseId": "OLFL-1.3",
>        "name": "Open Logistics Foundation License Version 1.3",
>        "reference": "https://spdx.org/licenses/OLFL-1.3.html",
> -      "referenceNumber": 142,
> +      "referenceNumber": 121,
>        "seeAlso": [
>          "https://openlogisticsfoundation.org/licenses/",
>          "https://opensource.org/license/olfl-1-3/"
> @@ -6373,7 +6721,7 @@
>        "licenseId": "OML",
>        "name": "Open Market License",
>        "reference": "https://spdx.org/licenses/OML.html",
> -      "referenceNumber": 375,
> +      "referenceNumber": 116,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Open_Market_License"
>        ]
> @@ -6385,7 +6733,7 @@
>        "licenseId": "OpenPBS-2.3",
>        "name": "OpenPBS v2.3 Software License",
>        "reference": "https://spdx.org/licenses/OpenPBS-2.3.html",
> -      "referenceNumber": 314,
> +      "referenceNumber": 2,
>        "seeAlso": [
>          "https://github.com/adaptivecomputing/torque/blob/master/PBS_Lic=
ense.txt",
>          "https://www.mcs.anl.gov/research/projects/openpbs/PBS_License.t=
xt"
> @@ -6399,7 +6747,7 @@
>        "licenseId": "OpenSSL",
>        "name": "OpenSSL License",
>        "reference": "https://spdx.org/licenses/OpenSSL.html",
> -      "referenceNumber": 303,
> +      "referenceNumber": 275,
>        "seeAlso": [
>          "http://www.openssl.org/source/license.html"
>        ]
> @@ -6411,7 +6759,7 @@
>        "licenseId": "OpenSSL-standalone",
>        "name": "OpenSSL License - standalone",
>        "reference": "https://spdx.org/licenses/OpenSSL-standalone.html",
> -      "referenceNumber": 602,
> +      "referenceNumber": 128,
>        "seeAlso": [
>          "https://library.netapp.com/ecm/ecm_download_file/ECMP1196395",
>          "https://hstechdocs.helpsystems.com/manuals/globalscape/archive/=
cuteftp6/open_ssl_license_agreement.htm"
> @@ -6424,7 +6772,7 @@
>        "licenseId": "OpenVision",
>        "name": "OpenVision License",
>        "reference": "https://spdx.org/licenses/OpenVision.html",
> -      "referenceNumber": 588,
> +      "referenceNumber": 36,
>        "seeAlso": [
>          "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L66-=
L98",
>          "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html",
> @@ -6439,7 +6787,7 @@
>        "licenseId": "OPL-1.0",
>        "name": "Open Public License v1.0",
>        "reference": "https://spdx.org/licenses/OPL-1.0.html",
> -      "referenceNumber": 91,
> +      "referenceNumber": 614,
>        "seeAlso": [
>          "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
>          "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
> @@ -6452,7 +6800,7 @@
>        "licenseId": "OPL-UK-3.0",
>        "name": "United    Kingdom Open Parliament Licence v3.0",
>        "reference": "https://spdx.org/licenses/OPL-UK-3.0.html",
> -      "referenceNumber": 480,
> +      "referenceNumber": 285,
>        "seeAlso": [
>          "https://www.parliament.uk/site-information/copyright-parliament=
/open-parliament-licence/"
>        ]
> @@ -6464,7 +6812,7 @@
>        "licenseId": "OPUBL-1.0",
>        "name": "Open Publication License v1.0",
>        "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
> -      "referenceNumber": 329,
> +      "referenceNumber": 414,
>        "seeAlso": [
>          "http://opencontent.org/openpub/",
>          "https://www.debian.org/opl",
> @@ -6478,7 +6826,7 @@
>        "licenseId": "OSET-PL-2.1",
>        "name": "OSET Public License version 2.1",
>        "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
> -      "referenceNumber": 517,
> +      "referenceNumber": 183,
>        "seeAlso": [
>          "http://www.osetfoundation.org/public-license",
>          "https://opensource.org/licenses/OPL-2.1"
> @@ -6492,7 +6840,7 @@
>        "licenseId": "OSL-1.0",
>        "name": "Open Software License 1.0",
>        "reference": "https://spdx.org/licenses/OSL-1.0.html",
> -      "referenceNumber": 162,
> +      "referenceNumber": 651,
>        "seeAlso": [
>          "https://opensource.org/licenses/OSL-1.0"
>        ]
> @@ -6505,7 +6853,7 @@
>        "licenseId": "OSL-1.1",
>        "name": "Open Software License 1.1",
>        "reference": "https://spdx.org/licenses/OSL-1.1.html",
> -      "referenceNumber": 586,
> +      "referenceNumber": 453,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/OSL1.1"
>        ]
> @@ -6518,7 +6866,7 @@
>        "licenseId": "OSL-2.0",
>        "name": "Open Software License 2.0",
>        "reference": "https://spdx.org/licenses/OSL-2.0.html",
> -      "referenceNumber": 531,
> +      "referenceNumber": 179,
>        "seeAlso": [
>          "http://web.archive.org/web/20041020171434/http://www.rosenlaw.c=
om/osl2.0.html"
>        ]
> @@ -6531,7 +6879,7 @@
>        "licenseId": "OSL-2.1",
>        "name": "Open Software License 2.1",
>        "reference": "https://spdx.org/licenses/OSL-2.1.html",
> -      "referenceNumber": 138,
> +      "referenceNumber": 29,
>        "seeAlso": [
>          "http://web.archive.org/web/20050212003940/http://www.rosenlaw.c=
om/osl21.htm",
>          "https://opensource.org/licenses/OSL-2.1"
> @@ -6545,7 +6893,7 @@
>        "licenseId": "OSL-3.0",
>        "name": "Open Software License 3.0",
>        "reference": "https://spdx.org/licenses/OSL-3.0.html",
> -      "referenceNumber": 300,
> +      "referenceNumber": 3,
>        "seeAlso": [
>          "https://web.archive.org/web/20120101081418/http://rosenlaw.com:=
80/OSL3.0.htm",
>          "https://opensource.org/licenses/OSL-3.0"
> @@ -6558,7 +6906,7 @@
>        "licenseId": "PADL",
>        "name": "PADL License",
>        "reference": "https://spdx.org/licenses/PADL.html",
> -      "referenceNumber": 113,
> +      "referenceNumber": 284,
>        "seeAlso": [
>          "https://git.openldap.org/openldap/openldap/-/blob/master/librar=
ies/libldap/os-local.c?ref_type=3Dheads#L19-23"
>        ]
> @@ -6570,7 +6918,7 @@
>        "licenseId": "Parity-6.0.0",
>        "name": "The Parity Public License 6.0.0",
>        "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
> -      "referenceNumber": 246,
> +      "referenceNumber": 241,
>        "seeAlso": [
>          "https://paritylicense.com/versions/6.0.0.html"
>        ]
> @@ -6582,7 +6930,7 @@
>        "licenseId": "Parity-7.0.0",
>        "name": "The Parity Public License 7.0.0",
>        "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
> -      "referenceNumber": 212,
> +      "referenceNumber": 235,
>        "seeAlso": [
>          "https://paritylicense.com/versions/7.0.0.html"
>        ]
> @@ -6594,7 +6942,7 @@
>        "licenseId": "PDDL-1.0",
>        "name": "Open Data Commons Public Domain Dedication & License 1.0"=
,
>        "reference": "https://spdx.org/licenses/PDDL-1.0.html",
> -      "referenceNumber": 493,
> +      "referenceNumber": 684,
>        "seeAlso": [
>          "http://opendatacommons.org/licenses/pddl/1.0/",
>          "https://opendatacommons.org/licenses/pddl/"
> @@ -6607,7 +6955,7 @@
>        "licenseId": "PHP-3.0",
>        "name": "PHP License v3.0",
>        "reference": "https://spdx.org/licenses/PHP-3.0.html",
> -      "referenceNumber": 584,
> +      "referenceNumber": 133,
>        "seeAlso": [
>          "http://www.php.net/license/3_0.txt",
>          "https://opensource.org/licenses/PHP-3.0"
> @@ -6621,7 +6969,7 @@
>        "licenseId": "PHP-3.01",
>        "name": "PHP License v3.01",
>        "reference": "https://spdx.org/licenses/PHP-3.01.html",
> -      "referenceNumber": 538,
> +      "referenceNumber": 221,
>        "seeAlso": [
>          "http://www.php.net/license/3_01.txt"
>        ]
> @@ -6633,7 +6981,7 @@
>        "licenseId": "Pixar",
>        "name": "Pixar License",
>        "reference": "https://spdx.org/licenses/Pixar.html",
> -      "referenceNumber": 204,
> +      "referenceNumber": 435,
>        "seeAlso": [
>          "https://github.com/PixarAnimationStudios/OpenSubdiv/raw/v3_5_0/=
LICENSE.txt",
>          "https://graphics.pixar.com/opensubdiv/docs/license.html",
> @@ -6647,7 +6995,7 @@
>        "licenseId": "pkgconf",
>        "name": "pkgconf License",
>        "reference": "https://spdx.org/licenses/pkgconf.html",
> -      "referenceNumber": 389,
> +      "referenceNumber": 670,
>        "seeAlso": [
>          "https://github.com/pkgconf/pkgconf/blob/master/cli/main.c#L8"
>        ]
> @@ -6659,7 +7007,7 @@
>        "licenseId": "Plexus",
>        "name": "Plexus Classworlds License",
>        "reference": "https://spdx.org/licenses/Plexus.html",
> -      "referenceNumber": 141,
> +      "referenceNumber": 181,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_Lic=
ense"
>        ]
> @@ -6671,7 +7019,7 @@
>        "licenseId": "pnmstitch",
>        "name": "pnmstitch License",
>        "reference": "https://spdx.org/licenses/pnmstitch.html",
> -      "referenceNumber": 158,
> +      "referenceNumber": 691,
>        "seeAlso": [
>          "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/ed=
itor/pnmstitch.c#l2"
>        ]
> @@ -6683,7 +7031,7 @@
>        "licenseId": "PolyForm-Noncommercial-1.0.0",
>        "name": "PolyForm Noncommercial License 1.0.0",
>        "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0=
.0.html",
> -      "referenceNumber": 54,
> +      "referenceNumber": 119,
>        "seeAlso": [
>          "https://polyformproject.org/licenses/noncommercial/1.0.0"
>        ]
> @@ -6695,7 +7043,7 @@
>        "licenseId": "PolyForm-Small-Business-1.0.0",
>        "name": "PolyForm Small Business License 1.0.0",
>        "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.=
0.0.html",
> -      "referenceNumber": 594,
> +      "referenceNumber": 30,
>        "seeAlso": [
>          "https://polyformproject.org/licenses/small-business/1.0.0"
>        ]
> @@ -6707,7 +7055,7 @@
>        "licenseId": "PostgreSQL",
>        "name": "PostgreSQL License",
>        "reference": "https://spdx.org/licenses/PostgreSQL.html",
> -      "referenceNumber": 643,
> +      "referenceNumber": 697,
>        "seeAlso": [
>          "http://www.postgresql.org/about/licence",
>          "https://opensource.org/licenses/PostgreSQL"
> @@ -6721,7 +7069,7 @@
>        "licenseId": "PPL",
>        "name": "Peer Production License",
>        "reference": "https://spdx.org/licenses/PPL.html",
> -      "referenceNumber": 580,
> +      "referenceNumber": 150,
>        "seeAlso": [
>          "https://wiki.p2pfoundation.net/Peer_Production_License",
>          "http://www.networkcultures.org/_uploads/%233notebook_telekommun=
ist.pdf"
> @@ -6734,9 +7082,10 @@
>        "licenseId": "PSF-2.0",
>        "name": "Python Software Foundation License 2.0",
>        "reference": "https://spdx.org/licenses/PSF-2.0.html",
> -      "referenceNumber": 55,
> +      "referenceNumber": 211,
>        "seeAlso": [
> -        "https://opensource.org/licenses/Python-2.0"
> +        "https://opensource.org/licenses/Python-2.0",
> +        "https://matplotlib.org/stable/project/license.html"
>        ]
>      },
>      {
> @@ -6746,7 +7095,7 @@
>        "licenseId": "psfrag",
>        "name": "psfrag License",
>        "reference": "https://spdx.org/licenses/psfrag.html",
> -      "referenceNumber": 555,
> +      "referenceNumber": 423,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/psfrag"
>        ]
> @@ -6758,7 +7107,7 @@
>        "licenseId": "psutils",
>        "name": "psutils License",
>        "reference": "https://spdx.org/licenses/psutils.html",
> -      "referenceNumber": 260,
> +      "referenceNumber": 500,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/psutils"
>        ]
> @@ -6771,7 +7120,7 @@
>        "licenseId": "Python-2.0",
>        "name": "Python License 2.0",
>        "reference": "https://spdx.org/licenses/Python-2.0.html",
> -      "referenceNumber": 285,
> +      "referenceNumber": 628,
>        "seeAlso": [
>          "https://opensource.org/licenses/Python-2.0"
>        ]
> @@ -6783,7 +7132,7 @@
>        "licenseId": "Python-2.0.1",
>        "name": "Python License 2.0.1",
>        "reference": "https://spdx.org/licenses/Python-2.0.1.html",
> -      "referenceNumber": 201,
> +      "referenceNumber": 586,
>        "seeAlso": [
>          "https://www.python.org/download/releases/2.0.1/license/",
>          "https://docs.python.org/3/license.html",
> @@ -6797,7 +7146,7 @@
>        "licenseId": "python-ldap",
>        "name": "Python ldap License",
>        "reference": "https://spdx.org/licenses/python-ldap.html",
> -      "referenceNumber": 446,
> +      "referenceNumber": 630,
>        "seeAlso": [
>          "https://github.com/python-ldap/python-ldap/blob/main/LICENCE"
>        ]
> @@ -6809,7 +7158,7 @@
>        "licenseId": "Qhull",
>        "name": "Qhull License",
>        "reference": "https://spdx.org/licenses/Qhull.html",
> -      "referenceNumber": 326,
> +      "referenceNumber": 590,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Qhull"
>        ]
> @@ -6822,7 +7171,7 @@
>        "licenseId": "QPL-1.0",
>        "name": "Q Public License 1.0",
>        "reference": "https://spdx.org/licenses/QPL-1.0.html",
> -      "referenceNumber": 413,
> +      "referenceNumber": 693,
>        "seeAlso": [
>          "http://doc.qt.nokia.com/3.3/license.html",
>          "https://opensource.org/licenses/QPL-1.0",
> @@ -6836,7 +7185,7 @@
>        "licenseId": "QPL-1.0-INRIA-2004",
>        "name": "Q Public License 1.0 - INRIA 2004 variant",
>        "reference": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.html",
> -      "referenceNumber": 486,
> +      "referenceNumber": 117,
>        "seeAlso": [
>          "https://github.com/maranget/hevea/blob/master/LICENSE"
>        ]
> @@ -6848,7 +7197,7 @@
>        "licenseId": "radvd",
>        "name": "radvd License",
>        "reference": "https://spdx.org/licenses/radvd.html",
> -      "referenceNumber": 433,
> +      "referenceNumber": 678,
>        "seeAlso": [
>          "https://github.com/radvd-project/radvd/blob/master/COPYRIGHT"
>        ]
> @@ -6860,7 +7209,7 @@
>        "licenseId": "Rdisc",
>        "name": "Rdisc License",
>        "reference": "https://spdx.org/licenses/Rdisc.html",
> -      "referenceNumber": 50,
> +      "referenceNumber": 4,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
>        ]
> @@ -6873,7 +7222,7 @@
>        "licenseId": "RHeCos-1.1",
>        "name": "Red Hat eCos Public License v1.1",
>        "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
> -      "referenceNumber": 99,
> +      "referenceNumber": 258,
>        "seeAlso": [
>          "http://ecos.sourceware.org/old-license.html"
>        ]
> @@ -6885,7 +7234,7 @@
>        "licenseId": "RPL-1.1",
>        "name": "Reciprocal Public License 1.1",
>        "reference": "https://spdx.org/licenses/RPL-1.1.html",
> -      "referenceNumber": 205,
> +      "referenceNumber": 57,
>        "seeAlso": [
>          "https://opensource.org/licenses/RPL-1.1"
>        ]
> @@ -6897,7 +7246,7 @@
>        "licenseId": "RPL-1.5",
>        "name": "Reciprocal Public License 1.5",
>        "reference": "https://spdx.org/licenses/RPL-1.5.html",
> -      "referenceNumber": 52,
> +      "referenceNumber": 413,
>        "seeAlso": [
>          "https://opensource.org/licenses/RPL-1.5"
>        ]
> @@ -6910,7 +7259,7 @@
>        "licenseId": "RPSL-1.0",
>        "name": "RealNetworks Public Source License v1.0",
>        "reference": "https://spdx.org/licenses/RPSL-1.0.html",
> -      "referenceNumber": 637,
> +      "referenceNumber": 104,
>        "seeAlso": [
>          "https://helixcommunity.org/content/rpsl",
>          "https://opensource.org/licenses/RPSL-1.0"
> @@ -6923,7 +7272,7 @@
>        "licenseId": "RSA-MD",
>        "name": "RSA Message-Digest License",
>        "reference": "https://spdx.org/licenses/RSA-MD.html",
> -      "referenceNumber": 496,
> +      "referenceNumber": 12,
>        "seeAlso": [
>          "http://www.faqs.org/rfcs/rfc1321.html"
>        ]
> @@ -6935,7 +7284,7 @@
>        "licenseId": "RSCPL",
>        "name": "Ricoh Source Code Public License",
>        "reference": "https://spdx.org/licenses/RSCPL.html",
> -      "referenceNumber": 235,
> +      "referenceNumber": 166,
>        "seeAlso": [
>          "http://wayback.archive.org/web/20060715140826/http://www.risour=
ce.org/RPL/RPL-1.0A.shtml",
>          "https://opensource.org/licenses/RSCPL"
> @@ -6949,11 +7298,25 @@
>        "licenseId": "Ruby",
>        "name": "Ruby License",
>        "reference": "https://spdx.org/licenses/Ruby.html",
> -      "referenceNumber": 223,
> +      "referenceNumber": 490,
>        "seeAlso": [
>          "https://www.ruby-lang.org/en/about/license.txt"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Ruby-pty.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Ruby-pty",
> +      "name": "Ruby pty extension license",
> +      "reference": "https://spdx.org/licenses/Ruby-pty.html",
> +      "referenceNumber": 509,
> +      "seeAlso": [
> +        "https://github.com/ruby/ruby/blob/9f6deaa6888a423720b4b127b5314=
f0ad26cc2e6/ext/pty/pty.c#L775-L786",
> +        "https://github.com/ruby/ruby/commit/0a64817fb80016030c03518fb94=
59f63c11605ea#diff-ef5fa30838d6d0cecad9e675cc50b24628cfe2cb277c346053fafcc3=
6c91c204",
> +        "https://github.com/ruby/ruby/commit/0a64817fb80016030c03518fb94=
59f63c11605ea#diff-fedf217c1ce44bda01f0a678d3ff8b198bed478754d699c527a698ad=
933979a0"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
>        "isDeprecatedLicenseId": false,
> @@ -6961,7 +7324,7 @@
>        "licenseId": "SAX-PD",
>        "name": "Sax Public Domain Notice",
>        "reference": "https://spdx.org/licenses/SAX-PD.html",
> -      "referenceNumber": 301,
> +      "referenceNumber": 22,
>        "seeAlso": [
>          "http://www.saxproject.org/copying.html"
>        ]
> @@ -6973,7 +7336,7 @@
>        "licenseId": "SAX-PD-2.0",
>        "name": "Sax Public Domain Notice 2.0",
>        "reference": "https://spdx.org/licenses/SAX-PD-2.0.html",
> -      "referenceNumber": 561,
> +      "referenceNumber": 346,
>        "seeAlso": [
>          "http://www.saxproject.org/copying.html"
>        ]
> @@ -6985,7 +7348,7 @@
>        "licenseId": "Saxpath",
>        "name": "Saxpath License",
>        "reference": "https://spdx.org/licenses/Saxpath.html",
> -      "referenceNumber": 109,
> +      "referenceNumber": 390,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Saxpath_License"
>        ]
> @@ -6997,7 +7360,7 @@
>        "licenseId": "SCEA",
>        "name": "SCEA Shared Source License",
>        "reference": "https://spdx.org/licenses/SCEA.html",
> -      "referenceNumber": 35,
> +      "referenceNumber": 484,
>        "seeAlso": [
>          "http://research.scea.com/scea_shared_source_license.html"
>        ]
> @@ -7009,7 +7372,7 @@
>        "licenseId": "SchemeReport",
>        "name": "Scheme Language Report License",
>        "reference": "https://spdx.org/licenses/SchemeReport.html",
> -      "referenceNumber": 425,
> +      "referenceNumber": 91,
>        "seeAlso": []
>      },
>      {
> @@ -7019,7 +7382,7 @@
>        "licenseId": "Sendmail",
>        "name": "Sendmail License",
>        "reference": "https://spdx.org/licenses/Sendmail.html",
> -      "referenceNumber": 274,
> +      "referenceNumber": 266,
>        "seeAlso": [
>          "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
>          "https://web.archive.org/web/20160322142305/https://www.sendmail=
.com/pdfs/open_source/sendmail_license.pdf"
> @@ -7032,12 +7395,24 @@
>        "licenseId": "Sendmail-8.23",
>        "name": "Sendmail License 8.23",
>        "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
> -      "referenceNumber": 247,
> +      "referenceNumber": 55,
>        "seeAlso": [
>          "https://www.proofpoint.com/sites/default/files/sendmail-license=
.pdf",
>          "https://web.archive.org/web/20181003101040/https://www.proofpoi=
nt.com/sites/default/files/sendmail-license.pdf"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Sendmail-Open-Source-1.1.=
json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Sendmail-Open-Source-1.1",
> +      "name": "Sendmail Open Source License v1.1",
> +      "reference": "https://spdx.org/licenses/Sendmail-Open-Source-1.1.h=
tml",
> +      "referenceNumber": 620,
> +      "seeAlso": [
> +        "https://github.com/trusteddomainproject/OpenDMARC/blob/master/L=
ICENSE.Sendmail"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/SGI-B-1.0.json",
>        "isDeprecatedLicenseId": false,
> @@ -7045,7 +7420,7 @@
>        "licenseId": "SGI-B-1.0",
>        "name": "SGI Free Software License B v1.0",
>        "reference": "https://spdx.org/licenses/SGI-B-1.0.html",
> -      "referenceNumber": 476,
> +      "referenceNumber": 56,
>        "seeAlso": [
>          "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.1.0.html"
>        ]
> @@ -7057,7 +7432,7 @@
>        "licenseId": "SGI-B-1.1",
>        "name": "SGI Free Software License B v1.1",
>        "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
> -      "referenceNumber": 456,
> +      "referenceNumber": 296,
>        "seeAlso": [
>          "http://oss.sgi.com/projects/FreeB/"
>        ]
> @@ -7070,7 +7445,7 @@
>        "licenseId": "SGI-B-2.0",
>        "name": "SGI Free Software License B v2.0",
>        "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
> -      "referenceNumber": 405,
> +      "referenceNumber": 617,
>        "seeAlso": [
>          "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.2.0.pdf"
>        ]
> @@ -7082,7 +7457,7 @@
>        "licenseId": "SGI-OpenGL",
>        "name": "SGI OpenGL License",
>        "reference": "https://spdx.org/licenses/SGI-OpenGL.html",
> -      "referenceNumber": 629,
> +      "referenceNumber": 34,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/mesa/glw/-/blob/master/README?re=
f_type=3Dheads"
>        ]
> @@ -7094,7 +7469,7 @@
>        "licenseId": "SGP4",
>        "name": "SGP4 Permission Notice",
>        "reference": "https://spdx.org/licenses/SGP4.html",
> -      "referenceNumber": 336,
> +      "referenceNumber": 572,
>        "seeAlso": [
>          "https://celestrak.org/publications/AIAA/2006-6753/faq.php"
>        ]
> @@ -7106,7 +7481,7 @@
>        "licenseId": "SHL-0.5",
>        "name": "Solderpad Hardware License v0.5",
>        "reference": "https://spdx.org/licenses/SHL-0.5.html",
> -      "referenceNumber": 338,
> +      "referenceNumber": 267,
>        "seeAlso": [
>          "https://solderpad.org/licenses/SHL-0.5/"
>        ]
> @@ -7118,7 +7493,7 @@
>        "licenseId": "SHL-0.51",
>        "name": "Solderpad Hardware License, Version 0.51",
>        "reference": "https://spdx.org/licenses/SHL-0.51.html",
> -      "referenceNumber": 29,
> +      "referenceNumber": 582,
>        "seeAlso": [
>          "https://solderpad.org/licenses/SHL-0.51/"
>        ]
> @@ -7130,7 +7505,7 @@
>        "licenseId": "SimPL-2.0",
>        "name": "Simple Public License 2.0",
>        "reference": "https://spdx.org/licenses/SimPL-2.0.html",
> -      "referenceNumber": 444,
> +      "referenceNumber": 452,
>        "seeAlso": [
>          "https://opensource.org/licenses/SimPL-2.0"
>        ]
> @@ -7143,7 +7518,7 @@
>        "licenseId": "SISSL",
>        "name": "Sun Industry Standards Source License v1.1",
>        "reference": "https://spdx.org/licenses/SISSL.html",
> -      "referenceNumber": 268,
> +      "referenceNumber": 110,
>        "seeAlso": [
>          "http://www.openoffice.org/licenses/sissl_license.html",
>          "https://opensource.org/licenses/SISSL"
> @@ -7156,7 +7531,7 @@
>        "licenseId": "SISSL-1.2",
>        "name": "Sun Industry Standards Source License v1.2",
>        "reference": "https://spdx.org/licenses/SISSL-1.2.html",
> -      "referenceNumber": 502,
> +      "referenceNumber": 253,
>        "seeAlso": [
>          "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.h=
tml"
>        ]
> @@ -7168,7 +7543,7 @@
>        "licenseId": "SL",
>        "name": "SL License",
>        "reference": "https://spdx.org/licenses/SL.html",
> -      "referenceNumber": 645,
> +      "referenceNumber": 83,
>        "seeAlso": [
>          "https://github.com/mtoyoda/sl/blob/master/LICENSE"
>        ]
> @@ -7181,11 +7556,23 @@
>        "licenseId": "Sleepycat",
>        "name": "Sleepycat License",
>        "reference": "https://spdx.org/licenses/Sleepycat.html",
> -      "referenceNumber": 182,
> +      "referenceNumber": 42,
>        "seeAlso": [
>          "https://opensource.org/licenses/Sleepycat"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/SMAIL-GPL.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "SMAIL-GPL",
> +      "name": "SMAIL General Public License",
> +      "reference": "https://spdx.org/licenses/SMAIL-GPL.html",
> +      "referenceNumber": 546,
> +      "seeAlso": [
> +        "https://sources.debian.org/copyright/license/debianutils/4.11.2=
/"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/SMLNJ.json",
>        "isDeprecatedLicenseId": false,
> @@ -7194,7 +7581,7 @@
>        "licenseId": "SMLNJ",
>        "name": "Standard ML of New Jersey License",
>        "reference": "https://spdx.org/licenses/SMLNJ.html",
> -      "referenceNumber": 148,
> +      "referenceNumber": 81,
>        "seeAlso": [
>          "https://www.smlnj.org/license.html"
>        ]
> @@ -7206,7 +7593,7 @@
>        "licenseId": "SMPPL",
>        "name": "Secure Messaging Protocol Public License",
>        "reference": "https://spdx.org/licenses/SMPPL.html",
> -      "referenceNumber": 250,
> +      "referenceNumber": 579,
>        "seeAlso": [
>          "https://github.com/dcblake/SMP/blob/master/Documentation/Licens=
e.txt"
>        ]
> @@ -7218,7 +7605,7 @@
>        "licenseId": "SNIA",
>        "name": "SNIA Public License 1.1",
>        "reference": "https://spdx.org/licenses/SNIA.html",
> -      "referenceNumber": 518,
> +      "referenceNumber": 224,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/SNIA_Public_License"
>        ]
> @@ -7230,11 +7617,23 @@
>        "licenseId": "snprintf",
>        "name": "snprintf License",
>        "reference": "https://spdx.org/licenses/snprintf.html",
> -      "referenceNumber": 161,
> +      "referenceNumber": 594,
>        "seeAlso": [
>          "https://github.com/openssh/openssh-portable/blob/master/openbsd=
-compat/bsd-snprintf.c#L2"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/SOFA.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "SOFA",
> +      "name": "SOFA Software License",
> +      "reference": "https://spdx.org/licenses/SOFA.html",
> +      "referenceNumber": 375,
> +      "seeAlso": [
> +        "http://www.iausofa.org/tandc.html"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/softSurfer.json",
>        "isDeprecatedLicenseId": false,
> @@ -7242,7 +7641,7 @@
>        "licenseId": "softSurfer",
>        "name": "softSurfer License",
>        "reference": "https://spdx.org/licenses/softSurfer.html",
> -      "referenceNumber": 523,
> +      "referenceNumber": 593,
>        "seeAlso": [
>          "https://github.com/mm2/Little-CMS/blob/master/src/cmssm.c#L207"=
,
>          "https://fedoraproject.org/wiki/Licensing/softSurfer"
> @@ -7255,7 +7654,7 @@
>        "licenseId": "Soundex",
>        "name": "Soundex License",
>        "reference": "https://spdx.org/licenses/Soundex.html",
> -      "referenceNumber": 368,
> +      "referenceNumber": 374,
>        "seeAlso": [
>          "https://metacpan.org/release/RJBS/Text-Soundex-3.05/source/Soun=
dex.pm#L3-11"
>        ]
> @@ -7267,7 +7666,7 @@
>        "licenseId": "Spencer-86",
>        "name": "Spencer License 86",
>        "reference": "https://spdx.org/licenses/Spencer-86.html",
> -      "referenceNumber": 472,
> +      "referenceNumber": 193,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_L=
ibrary_License"
>        ]
> @@ -7279,7 +7678,7 @@
>        "licenseId": "Spencer-94",
>        "name": "Spencer License 94",
>        "reference": "https://spdx.org/licenses/Spencer-94.html",
> -      "referenceNumber": 378,
> +      "referenceNumber": 451,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_L=
ibrary_License",
>          "https://metacpan.org/release/KNOK/File-MMagic-1.30/source/COPYI=
NG#L28"
> @@ -7292,7 +7691,7 @@
>        "licenseId": "Spencer-99",
>        "name": "Spencer License 99",
>        "reference": "https://spdx.org/licenses/Spencer-99.html",
> -      "referenceNumber": 139,
> +      "referenceNumber": 220,
>        "seeAlso": [
>          "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/re=
gfronts.c"
>        ]
> @@ -7305,7 +7704,7 @@
>        "licenseId": "SPL-1.0",
>        "name": "Sun Public License v1.0",
>        "reference": "https://spdx.org/licenses/SPL-1.0.html",
> -      "referenceNumber": 280,
> +      "referenceNumber": 342,
>        "seeAlso": [
>          "https://opensource.org/licenses/SPL-1.0"
>        ]
> @@ -7317,7 +7716,7 @@
>        "licenseId": "ssh-keyscan",
>        "name": "ssh-keyscan License",
>        "reference": "https://spdx.org/licenses/ssh-keyscan.html",
> -      "referenceNumber": 294,
> +      "referenceNumber": 537,
>        "seeAlso": [
>          "https://github.com/openssh/openssh-portable/blob/master/LICENCE=
#L82"
>        ]
> @@ -7329,7 +7728,7 @@
>        "licenseId": "SSH-OpenSSH",
>        "name": "SSH OpenSSH license",
>        "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
> -      "referenceNumber": 506,
> +      "referenceNumber": 463,
>        "seeAlso": [
>          "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c=
59838b5fa574cd456d6047b2d4/LICENCE#L10"
>        ]
> @@ -7341,7 +7740,7 @@
>        "licenseId": "SSH-short",
>        "name": "SSH short notice",
>        "reference": "https://spdx.org/licenses/SSH-short.html",
> -      "referenceNumber": 563,
> +      "referenceNumber": 573,
>        "seeAlso": [
>          "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c=
59838b5fa574cd456d6047b2d4/pathnames.h",
>          "http://web.mit.edu/kolya/.f/root/athena.mit.edu/sipb.mit.edu/pr=
oject/openssh/OldFiles/src/openssh-2.9.9p2/ssh-add.1",
> @@ -7355,7 +7754,7 @@
>        "licenseId": "SSLeay-standalone",
>        "name": "SSLeay License - standalone",
>        "reference": "https://spdx.org/licenses/SSLeay-standalone.html",
> -      "referenceNumber": 591,
> +      "referenceNumber": 96,
>        "seeAlso": [
>          "https://www.tq-group.com/filedownloads/files/software-license-c=
onditions/OriginalSSLeay/OriginalSSLeay.pdf"
>        ]
> @@ -7367,7 +7766,7 @@
>        "licenseId": "SSPL-1.0",
>        "name": "Server Side Public License, v 1",
>        "reference": "https://spdx.org/licenses/SSPL-1.0.html",
> -      "referenceNumber": 17,
> +      "referenceNumber": 664,
>        "seeAlso": [
>          "https://www.mongodb.com/licensing/server-side-public-license"
>        ]
> @@ -7380,7 +7779,7 @@
>        "licenseId": "StandardML-NJ",
>        "name": "Standard ML of New Jersey License",
>        "reference": "https://spdx.org/licenses/StandardML-NJ.html",
> -      "referenceNumber": 658,
> +      "referenceNumber": 501,
>        "seeAlso": [
>          "https://www.smlnj.org/license.html"
>        ]
> @@ -7392,11 +7791,23 @@
>        "licenseId": "SugarCRM-1.1.3",
>        "name": "SugarCRM Public License v1.1.3",
>        "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
> -      "referenceNumber": 42,
> +      "referenceNumber": 222,
>        "seeAlso": [
>          "http://www.sugarcrm.com/crm/SPL"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/SUL-1.0.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "SUL-1.0",
> +      "name": "Sustainable Use License v1.0",
> +      "reference": "https://spdx.org/licenses/SUL-1.0.html",
> +      "referenceNumber": 557,
> +      "seeAlso": [
> +        "https://github.com/n8n-io/n8n/blob/master/LICENSE.md"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Sun-PPP.json",
>        "isDeprecatedLicenseId": false,
> @@ -7404,7 +7815,7 @@
>        "licenseId": "Sun-PPP",
>        "name": "Sun PPP License",
>        "reference": "https://spdx.org/licenses/Sun-PPP.html",
> -      "referenceNumber": 385,
> +      "referenceNumber": 39,
>        "seeAlso": [
>          "https://github.com/ppp-project/ppp/blob/master/pppd/eap.c#L7-L1=
6"
>        ]
> @@ -7416,7 +7827,7 @@
>        "licenseId": "Sun-PPP-2000",
>        "name": "Sun PPP License (2000)",
>        "reference": "https://spdx.org/licenses/Sun-PPP-2000.html",
> -      "referenceNumber": 310,
> +      "referenceNumber": 70,
>        "seeAlso": [
>          "https://github.com/ppp-project/ppp/blob/master/modules/ppp_ahdl=
c.c#L7-L19"
>        ]
> @@ -7428,7 +7839,7 @@
>        "licenseId": "SunPro",
>        "name": "SunPro License",
>        "reference": "https://spdx.org/licenses/SunPro.html",
> -      "referenceNumber": 57,
> +      "referenceNumber": 395,
>        "seeAlso": [
>          "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e=
_acosh.c",
>          "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e=
_lgammal.c"
> @@ -7441,7 +7852,7 @@
>        "licenseId": "SWL",
>        "name": "Scheme Widget Library (SWL) Software License Agreement",
>        "reference": "https://spdx.org/licenses/SWL.html",
> -      "referenceNumber": 649,
> +      "referenceNumber": 196,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/SWL"
>        ]
> @@ -7453,7 +7864,7 @@
>        "licenseId": "swrule",
>        "name": "swrule License",
>        "reference": "https://spdx.org/licenses/swrule.html",
> -      "referenceNumber": 90,
> +      "referenceNumber": 348,
>        "seeAlso": [
>          "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/misc=
/swrule.sty"
>        ]
> @@ -7465,7 +7876,7 @@
>        "licenseId": "Symlinks",
>        "name": "Symlinks License",
>        "reference": "https://spdx.org/licenses/Symlinks.html",
> -      "referenceNumber": 414,
> +      "referenceNumber": 517,
>        "seeAlso": [
>          "https://www.mail-archive.com/debian-bugs-rc@lists.debian.org/ms=
g11494.html"
>        ]
> @@ -7477,7 +7888,7 @@
>        "licenseId": "TAPR-OHL-1.0",
>        "name": "TAPR Open Hardware License v1.0",
>        "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
> -      "referenceNumber": 242,
> +      "referenceNumber": 80,
>        "seeAlso": [
>          "https://www.tapr.org/OHL"
>        ]
> @@ -7489,7 +7900,7 @@
>        "licenseId": "TCL",
>        "name": "TCL/TK License",
>        "reference": "https://spdx.org/licenses/TCL.html",
> -      "referenceNumber": 2,
> +      "referenceNumber": 625,
>        "seeAlso": [
>          "http://www.tcl.tk/software/tcltk/license.html",
>          "https://fedoraproject.org/wiki/Licensing/TCL"
> @@ -7502,7 +7913,7 @@
>        "licenseId": "TCP-wrappers",
>        "name": "TCP Wrappers License",
>        "reference": "https://spdx.org/licenses/TCP-wrappers.html",
> -      "referenceNumber": 9,
> +      "referenceNumber": 278,
>        "seeAlso": [
>          "http://rc.quest.com/topics/openssh/license.php#tcpwrappers"
>        ]
> @@ -7514,7 +7925,7 @@
>        "licenseId": "TermReadKey",
>        "name": "TermReadKey License",
>        "reference": "https://spdx.org/licenses/TermReadKey.html",
> -      "referenceNumber": 256,
> +      "referenceNumber": 619,
>        "seeAlso": [
>          "https://github.com/jonathanstowe/TermReadKey/blob/master/README=
#L9-L10"
>        ]
> @@ -7526,12 +7937,24 @@
>        "licenseId": "TGPPL-1.0",
>        "name": "Transitive Grace Period Public Licence 1.0",
>        "reference": "https://spdx.org/licenses/TGPPL-1.0.html",
> -      "referenceNumber": 101,
> +      "referenceNumber": 142,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/TGPPL",
>          "https://tahoe-lafs.org/trac/tahoe-lafs/browser/trunk/COPYING.TG=
PPL.rst"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/ThirdEye.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "ThirdEye",
> +      "name": "ThirdEye License",
> +      "reference": "https://spdx.org/licenses/ThirdEye.html",
> +      "referenceNumber": 403,
> +      "seeAlso": [
> +        "https://sourceware.org/cgit/binutils-gdb/tree/include/coff/symc=
onst.h#n11"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/threeparttable.json",
>        "isDeprecatedLicenseId": false,
> @@ -7539,7 +7962,7 @@
>        "licenseId": "threeparttable",
>        "name": "threeparttable License",
>        "reference": "https://spdx.org/licenses/threeparttable.html",
> -      "referenceNumber": 398,
> +      "referenceNumber": 14,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Threeparttable"
>        ]
> @@ -7551,7 +7974,7 @@
>        "licenseId": "TMate",
>        "name": "TMate Open Source License",
>        "reference": "https://spdx.org/licenses/TMate.html",
> -      "referenceNumber": 539,
> +      "referenceNumber": 176,
>        "seeAlso": [
>          "http://svnkit.com/license.html"
>        ]
> @@ -7563,7 +7986,7 @@
>        "licenseId": "TORQUE-1.1",
>        "name": "TORQUE v2.5+ Software License v1.1",
>        "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
> -      "referenceNumber": 61,
> +      "referenceNumber": 214,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/TORQUEv1.1"
>        ]
> @@ -7575,7 +7998,7 @@
>        "licenseId": "TOSL",
>        "name": "Trusster Open Source License",
>        "reference": "https://spdx.org/licenses/TOSL.html",
> -      "referenceNumber": 267,
> +      "referenceNumber": 416,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/TOSL"
>        ]
> @@ -7587,7 +8010,7 @@
>        "licenseId": "TPDL",
>        "name": "Time::ParseDate License",
>        "reference": "https://spdx.org/licenses/TPDL.html",
> -      "referenceNumber": 75,
> +      "referenceNumber": 666,
>        "seeAlso": [
>          "https://metacpan.org/pod/Time::ParseDate#LICENSE"
>        ]
> @@ -7599,11 +8022,23 @@
>        "licenseId": "TPL-1.0",
>        "name": "THOR Public License 1.0",
>        "reference": "https://spdx.org/licenses/TPL-1.0.html",
> -      "referenceNumber": 508,
> +      "referenceNumber": 540,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing:ThorPublicLicense"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/TrustedQSL.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "TrustedQSL",
> +      "name": "TrustedQSL License",
> +      "reference": "https://spdx.org/licenses/TrustedQSL.html",
> +      "referenceNumber": 37,
> +      "seeAlso": [
> +        "https://sourceforge.net/p/trustedqsl/tqsl/ci/master/tree/LICENS=
E.txt"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/TTWL.json",
>        "isDeprecatedLicenseId": false,
> @@ -7611,7 +8046,7 @@
>        "licenseId": "TTWL",
>        "name": "Text-Tabs+Wrap License",
>        "reference": "https://spdx.org/licenses/TTWL.html",
> -      "referenceNumber": 87,
> +      "referenceNumber": 598,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/TTWL",
>          "https://github.com/ap/Text-Tabs/blob/master/lib.modern/Text/Tab=
s.pm#L148"
> @@ -7624,7 +8059,7 @@
>        "licenseId": "TTYP0",
>        "name": "TTYP0 License",
>        "reference": "https://spdx.org/licenses/TTYP0.html",
> -      "referenceNumber": 451,
> +      "referenceNumber": 236,
>        "seeAlso": [
>          "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/"
>        ]
> @@ -7636,7 +8071,7 @@
>        "licenseId": "TU-Berlin-1.0",
>        "name": "Technische Universitaet Berlin License 1.0",
>        "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
> -      "referenceNumber": 159,
> +      "referenceNumber": 106,
>        "seeAlso": [
>          "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9=
f526803d9680/gsm/COPYRIGHT"
>        ]
> @@ -7648,11 +8083,24 @@
>        "licenseId": "TU-Berlin-2.0",
>        "name": "Technische Universitaet Berlin License 2.0",
>        "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
> -      "referenceNumber": 624,
> +      "referenceNumber": 669,
>        "seeAlso": [
>          "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39=
e438a015da50035/licences/libgsm.txt"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Ubuntu-font-1.0.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Ubuntu-font-1.0",
> +      "name": "Ubuntu Font Licence v1.0",
> +      "reference": "https://spdx.org/licenses/Ubuntu-font-1.0.html",
> +      "referenceNumber": 268,
> +      "seeAlso": [
> +        "https://ubuntu.com/legal/font-licence",
> +        "https://assets.ubuntu.com/v1/81e5605d-ubuntu-font-licence-1.0.t=
xt"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/UCAR.json",
>        "isDeprecatedLicenseId": false,
> @@ -7660,7 +8108,7 @@
>        "licenseId": "UCAR",
>        "name": "UCAR License",
>        "reference": "https://spdx.org/licenses/UCAR.html",
> -      "referenceNumber": 78,
> +      "referenceNumber": 353,
>        "seeAlso": [
>          "https://github.com/Unidata/UDUNITS-2/blob/master/COPYRIGHT"
>        ]
> @@ -7672,7 +8120,7 @@
>        "licenseId": "UCL-1.0",
>        "name": "Upstream Compatibility License v1.0",
>        "reference": "https://spdx.org/licenses/UCL-1.0.html",
> -      "referenceNumber": 646,
> +      "referenceNumber": 611,
>        "seeAlso": [
>          "https://opensource.org/licenses/UCL-1.0"
>        ]
> @@ -7684,7 +8132,7 @@
>        "licenseId": "ulem",
>        "name": "ulem License",
>        "reference": "https://spdx.org/licenses/ulem.html",
> -      "referenceNumber": 566,
> +      "referenceNumber": 514,
>        "seeAlso": [
>          "https://mirrors.ctan.org/macros/latex/contrib/ulem/README"
>        ]
> @@ -7696,7 +8144,7 @@
>        "licenseId": "UMich-Merit",
>        "name": "Michigan/Merit Networks License",
>        "reference": "https://spdx.org/licenses/UMich-Merit.html",
> -      "referenceNumber": 505,
> +      "referenceNumber": 48,
>        "seeAlso": [
>          "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L64"
>        ]
> @@ -7708,7 +8156,7 @@
>        "licenseId": "Unicode-3.0",
>        "name": "Unicode License v3",
>        "reference": "https://spdx.org/licenses/Unicode-3.0.html",
> -      "referenceNumber": 46,
> +      "referenceNumber": 308,
>        "seeAlso": [
>          "https://www.unicode.org/license.txt"
>        ]
> @@ -7720,7 +8168,7 @@
>        "licenseId": "Unicode-DFS-2015",
>        "name": "Unicode License Agreement - Data Files and Software (2015=
)",
>        "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
> -      "referenceNumber": 647,
> +      "referenceNumber": 254,
>        "seeAlso": [
>          "https://web.archive.org/web/20151224134844/http://unicode.org/c=
opyright.html"
>        ]
> @@ -7732,7 +8180,7 @@
>        "licenseId": "Unicode-DFS-2016",
>        "name": "Unicode License Agreement - Data Files and Software (2016=
)",
>        "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
> -      "referenceNumber": 152,
> +      "referenceNumber": 309,
>        "seeAlso": [
>          "https://www.unicode.org/license.txt",
>          "http://web.archive.org/web/20160823201924/http://www.unicode.or=
g/copyright.html#License",
> @@ -7746,7 +8194,7 @@
>        "licenseId": "Unicode-TOU",
>        "name": "Unicode Terms of Use",
>        "reference": "https://spdx.org/licenses/Unicode-TOU.html",
> -      "referenceNumber": 606,
> +      "referenceNumber": 115,
>        "seeAlso": [
>          "http://web.archive.org/web/20140704074106/http://www.unicode.or=
g/copyright.html",
>          "http://www.unicode.org/copyright.html"
> @@ -7759,7 +8207,7 @@
>        "licenseId": "UnixCrypt",
>        "name": "UnixCrypt License",
>        "reference": "https://spdx.org/licenses/UnixCrypt.html",
> -      "referenceNumber": 462,
> +      "referenceNumber": 180,
>        "seeAlso": [
>          "https://foss.heptapod.net/python-libs/passlib/-/blob/branch/sta=
ble/LICENSE#L70",
>          "https://opensource.apple.com/source/JBoss/JBoss-737/jboss-all/j=
etty/src/main/org/mortbay/util/UnixCrypt.java.auto.html",
> @@ -7774,11 +8222,35 @@
>        "licenseId": "Unlicense",
>        "name": "The Unlicense",
>        "reference": "https://spdx.org/licenses/Unlicense.html",
> -      "referenceNumber": 411,
> +      "referenceNumber": 337,
>        "seeAlso": [
>          "https://unlicense.org/"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Unlicense-libtelnet.json"=
,
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Unlicense-libtelnet",
> +      "name": "Unlicense - libtelnet variant",
> +      "reference": "https://spdx.org/licenses/Unlicense-libtelnet.html",
> +      "referenceNumber": 113,
> +      "seeAlso": [
> +        "https://github.com/seanmiddleditch/libtelnet/blob/develop/COPYI=
NG"
> +      ]
> +    },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/Unlicense-libwhirlpool.js=
on",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "Unlicense-libwhirlpool",
> +      "name": "Unlicense - libwhirlpool variant",
> +      "reference": "https://spdx.org/licenses/Unlicense-libwhirlpool.htm=
l",
> +      "referenceNumber": 565,
> +      "seeAlso": [
> +        "https://github.com/dfateyev/libwhirlpool/blob/master/README#L27=
"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
>        "isDeprecatedLicenseId": false,
> @@ -7787,7 +8259,7 @@
>        "licenseId": "UPL-1.0",
>        "name": "Universal Permissive License v1.0",
>        "reference": "https://spdx.org/licenses/UPL-1.0.html",
> -      "referenceNumber": 511,
> +      "referenceNumber": 88,
>        "seeAlso": [
>          "https://opensource.org/licenses/UPL"
>        ]
> @@ -7799,7 +8271,7 @@
>        "licenseId": "URT-RLE",
>        "name": "Utah Raster Toolkit Run Length Encoded License",
>        "reference": "https://spdx.org/licenses/URT-RLE.html",
> -      "referenceNumber": 443,
> +      "referenceNumber": 380,
>        "seeAlso": [
>          "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/co=
nverter/other/pnmtorle.c",
>          "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/co=
nverter/other/rletopnm.c"
> @@ -7813,7 +8285,7 @@
>        "licenseId": "Vim",
>        "name": "Vim License",
>        "reference": "https://spdx.org/licenses/Vim.html",
> -      "referenceNumber": 371,
> +      "referenceNumber": 327,
>        "seeAlso": [
>          "http://vimdoc.sourceforge.net/htmldoc/uganda.html"
>        ]
> @@ -7825,7 +8297,7 @@
>        "licenseId": "VOSTROM",
>        "name": "VOSTROM Public License for Open Source",
>        "reference": "https://spdx.org/licenses/VOSTROM.html",
> -      "referenceNumber": 122,
> +      "referenceNumber": 575,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/VOSTROM"
>        ]
> @@ -7837,7 +8309,7 @@
>        "licenseId": "VSL-1.0",
>        "name": "Vovida Software License v1.0",
>        "reference": "https://spdx.org/licenses/VSL-1.0.html",
> -      "referenceNumber": 510,
> +      "referenceNumber": 562,
>        "seeAlso": [
>          "https://opensource.org/licenses/VSL-1.0"
>        ]
> @@ -7850,7 +8322,7 @@
>        "licenseId": "W3C",
>        "name": "W3C Software Notice and License (2002-12-31)",
>        "reference": "https://spdx.org/licenses/W3C.html",
> -      "referenceNumber": 284,
> +      "referenceNumber": 479,
>        "seeAlso": [
>          "http://www.w3.org/Consortium/Legal/2002/copyright-software-2002=
1231.html",
>          "https://opensource.org/licenses/W3C"
> @@ -7863,7 +8335,7 @@
>        "licenseId": "W3C-19980720",
>        "name": "W3C Software Notice and License (1998-07-20)",
>        "reference": "https://spdx.org/licenses/W3C-19980720.html",
> -      "referenceNumber": 156,
> +      "referenceNumber": 365,
>        "seeAlso": [
>          "http://www.w3.org/Consortium/Legal/copyright-software-19980720.=
html"
>        ]
> @@ -7871,11 +8343,11 @@
>      {
>        "detailsUrl": "https://spdx.org/licenses/W3C-20150513.json",
>        "isDeprecatedLicenseId": false,
> -      "isOsiApproved": false,
> +      "isOsiApproved": true,
>        "licenseId": "W3C-20150513",
>        "name": "W3C Software Notice and Document License (2015-05-13)",
>        "reference": "https://spdx.org/licenses/W3C-20150513.html",
> -      "referenceNumber": 452,
> +      "referenceNumber": 295,
>        "seeAlso": [
>          "https://www.w3.org/Consortium/Legal/2015/copyright-software-and=
-document",
>          "https://www.w3.org/copyright/software-license-2015/",
> @@ -7889,7 +8361,7 @@
>        "licenseId": "w3m",
>        "name": "w3m License",
>        "reference": "https://spdx.org/licenses/w3m.html",
> -      "referenceNumber": 202,
> +      "referenceNumber": 141,
>        "seeAlso": [
>          "https://github.com/tats/w3m/blob/master/COPYING"
>        ]
> @@ -7902,7 +8374,7 @@
>        "licenseId": "Watcom-1.0",
>        "name": "Sybase Open Watcom Public License 1.0",
>        "reference": "https://spdx.org/licenses/Watcom-1.0.html",
> -      "referenceNumber": 533,
> +      "referenceNumber": 527,
>        "seeAlso": [
>          "https://opensource.org/licenses/Watcom-1.0"
>        ]
> @@ -7914,7 +8386,7 @@
>        "licenseId": "Widget-Workshop",
>        "name": "Widget Workshop License",
>        "reference": "https://spdx.org/licenses/Widget-Workshop.html",
> -      "referenceNumber": 548,
> +      "referenceNumber": 522,
>        "seeAlso": [
>          "https://github.com/novnc/noVNC/blob/master/core/crypto/des.js#L=
24"
>        ]
> @@ -7926,7 +8398,7 @@
>        "licenseId": "Wsuipa",
>        "name": "Wsuipa License",
>        "reference": "https://spdx.org/licenses/Wsuipa.html",
> -      "referenceNumber": 305,
> +      "referenceNumber": 564,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Wsuipa"
>        ]
> @@ -7939,12 +8411,24 @@
>        "licenseId": "WTFPL",
>        "name": "Do What The F*ck You Want To Public License",
>        "reference": "https://spdx.org/licenses/WTFPL.html",
> -      "referenceNumber": 176,
> +      "referenceNumber": 418,
>        "seeAlso": [
>          "http://www.wtfpl.net/about/",
>          "http://sam.zoy.org/wtfpl/COPYING"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/wwl.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "wwl",
> +      "name": "WWL License",
> +      "reference": "https://spdx.org/licenses/wwl.html",
> +      "referenceNumber": 627,
> +      "seeAlso": [
> +        "http://www.db.net/downloads/wwl+db-1.3.tgz"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/wxWindows.json",
>        "isDeprecatedLicenseId": true,
> @@ -7952,7 +8436,7 @@
>        "licenseId": "wxWindows",
>        "name": "wxWindows Library License",
>        "reference": "https://spdx.org/licenses/wxWindows.html",
> -      "referenceNumber": 258,
> +      "referenceNumber": 431,
>        "seeAlso": [
>          "https://opensource.org/licenses/WXwindows"
>        ]
> @@ -7965,7 +8449,7 @@
>        "licenseId": "X11",
>        "name": "X11 License",
>        "reference": "https://spdx.org/licenses/X11.html",
> -      "referenceNumber": 203,
> +      "referenceNumber": 0,
>        "seeAlso": [
>          "http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3"
>        ]
> @@ -7977,11 +8461,23 @@
>        "licenseId": "X11-distribute-modifications-variant",
>        "name": "X11 License Distribution Modification Variant",
>        "reference": "https://spdx.org/licenses/X11-distribute-modificatio=
ns-variant.html",
> -      "referenceNumber": 112,
> +      "referenceNumber": 302,
>        "seeAlso": [
>          "https://github.com/mirror/ncurses/blob/master/COPYING"
>        ]
>      },
> +    {
> +      "detailsUrl": "https://spdx.org/licenses/X11-swapped.json",
> +      "isDeprecatedLicenseId": false,
> +      "isOsiApproved": false,
> +      "licenseId": "X11-swapped",
> +      "name": "X11 swapped final paragraphs",
> +      "reference": "https://spdx.org/licenses/X11-swapped.html",
> +      "referenceNumber": 248,
> +      "seeAlso": [
> +        "https://github.com/fedeinthemix/chez-srfi/blob/master/srfi/LICE=
NSE"
> +      ]
> +    },
>      {
>        "detailsUrl": "https://spdx.org/licenses/Xdebug-1.03.json",
>        "isDeprecatedLicenseId": false,
> @@ -7989,7 +8485,7 @@
>        "licenseId": "Xdebug-1.03",
>        "name": "Xdebug License v 1.03",
>        "reference": "https://spdx.org/licenses/Xdebug-1.03.html",
> -      "referenceNumber": 10,
> +      "referenceNumber": 109,
>        "seeAlso": [
>          "https://github.com/xdebug/xdebug/blob/master/LICENSE"
>        ]
> @@ -8001,7 +8497,7 @@
>        "licenseId": "Xerox",
>        "name": "Xerox License",
>        "reference": "https://spdx.org/licenses/Xerox.html",
> -      "referenceNumber": 595,
> +      "referenceNumber": 615,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Xerox"
>        ]
> @@ -8013,7 +8509,7 @@
>        "licenseId": "Xfig",
>        "name": "Xfig License",
>        "reference": "https://spdx.org/licenses/Xfig.html",
> -      "referenceNumber": 89,
> +      "referenceNumber": 125,
>        "seeAlso": [
>          "https://github.com/Distrotech/transfig/blob/master/transfig/tra=
nsfig.c",
>          "https://fedoraproject.org/wiki/Licensing:MIT#Xfig_Variant",
> @@ -8028,7 +8524,7 @@
>        "licenseId": "XFree86-1.1",
>        "name": "XFree86 License 1.1",
>        "reference": "https://spdx.org/licenses/XFree86-1.1.html",
> -      "referenceNumber": 562,
> +      "referenceNumber": 646,
>        "seeAlso": [
>          "http://www.xfree86.org/current/LICENSE4.html"
>        ]
> @@ -8041,7 +8537,7 @@
>        "licenseId": "xinetd",
>        "name": "xinetd License",
>        "reference": "https://spdx.org/licenses/xinetd.html",
> -      "referenceNumber": 465,
> +      "referenceNumber": 93,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Xinetd_License"
>        ]
> @@ -8053,7 +8549,7 @@
>        "licenseId": "xkeyboard-config-Zinoviev",
>        "name": "xkeyboard-config Zinoviev License",
>        "reference": "https://spdx.org/licenses/xkeyboard-config-Zinoviev.=
html",
> -      "referenceNumber": 140,
> +      "referenceNumber": 212,
>        "seeAlso": [
>          "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-confi=
g/-/blob/master/COPYING?ref_type=3Dheads#L178"
>        ]
> @@ -8065,7 +8561,7 @@
>        "licenseId": "xlock",
>        "name": "xlock License",
>        "reference": "https://spdx.org/licenses/xlock.html",
> -      "referenceNumber": 357,
> +      "referenceNumber": 362,
>        "seeAlso": [
>          "https://fossies.org/linux/tiff/contrib/ras/ras2tif.c"
>        ]
> @@ -8077,7 +8573,7 @@
>        "licenseId": "Xnet",
>        "name": "X.Net License",
>        "reference": "https://spdx.org/licenses/Xnet.html",
> -      "referenceNumber": 236,
> +      "referenceNumber": 470,
>        "seeAlso": [
>          "https://opensource.org/licenses/Xnet"
>        ]
> @@ -8089,7 +8585,7 @@
>        "licenseId": "xpp",
>        "name": "XPP License",
>        "reference": "https://spdx.org/licenses/xpp.html",
> -      "referenceNumber": 312,
> +      "referenceNumber": 290,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/xpp"
>        ]
> @@ -8101,7 +8597,7 @@
>        "licenseId": "XSkat",
>        "name": "XSkat License",
>        "reference": "https://spdx.org/licenses/XSkat.html",
> -      "referenceNumber": 544,
> +      "referenceNumber": 293,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/XSkat_License"
>        ]
> @@ -8113,7 +8609,7 @@
>        "licenseId": "xzoom",
>        "name": "xzoom License",
>        "reference": "https://spdx.org/licenses/xzoom.html",
> -      "referenceNumber": 530,
> +      "referenceNumber": 90,
>        "seeAlso": [
>          "https://metadata.ftp-master.debian.org/changelogs//main/x/xzoom=
/xzoom_0.3-27_copyright"
>        ]
> @@ -8125,7 +8621,7 @@
>        "licenseId": "YPL-1.0",
>        "name": "Yahoo! Public License v1.0",
>        "reference": "https://spdx.org/licenses/YPL-1.0.html",
> -      "referenceNumber": 491,
> +      "referenceNumber": 294,
>        "seeAlso": [
>          "http://www.zimbra.com/license/yahoo_public_license_1.0.html"
>        ]
> @@ -8138,7 +8634,7 @@
>        "licenseId": "YPL-1.1",
>        "name": "Yahoo! Public License v1.1",
>        "reference": "https://spdx.org/licenses/YPL-1.1.html",
> -      "referenceNumber": 473,
> +      "referenceNumber": 481,
>        "seeAlso": [
>          "http://www.zimbra.com/license/yahoo_public_license_1.1.html"
>        ]
> @@ -8150,7 +8646,7 @@
>        "licenseId": "Zed",
>        "name": "Zed License",
>        "reference": "https://spdx.org/licenses/Zed.html",
> -      "referenceNumber": 599,
> +      "referenceNumber": 189,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/Zed"
>        ]
> @@ -8162,7 +8658,7 @@
>        "licenseId": "Zeeff",
>        "name": "Zeeff License",
>        "reference": "https://spdx.org/licenses/Zeeff.html",
> -      "referenceNumber": 218,
> +      "referenceNumber": 551,
>        "seeAlso": [
>          "ftp://ftp.tin.org/pub/news/utils/newsx/newsx-1.6.tar.gz"
>        ]
> @@ -8175,7 +8671,7 @@
>        "licenseId": "Zend-2.0",
>        "name": "Zend License v2.0",
>        "reference": "https://spdx.org/licenses/Zend-2.0.html",
> -      "referenceNumber": 481,
> +      "referenceNumber": 444,
>        "seeAlso": [
>          "https://web.archive.org/web/20130517195954/http://www.zend.com/=
license/2_00.txt"
>        ]
> @@ -8188,7 +8684,7 @@
>        "licenseId": "Zimbra-1.3",
>        "name": "Zimbra Public License v1.3",
>        "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
> -      "referenceNumber": 379,
> +      "referenceNumber": 26,
>        "seeAlso": [
>          "http://web.archive.org/web/20100302225219/http://www.zimbra.com=
/license/zimbra-public-license-1-3.html"
>        ]
> @@ -8200,7 +8696,7 @@
>        "licenseId": "Zimbra-1.4",
>        "name": "Zimbra Public License v1.4",
>        "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
> -      "referenceNumber": 304,
> +      "referenceNumber": 330,
>        "seeAlso": [
>          "http://www.zimbra.com/legal/zimbra-public-license-1-4"
>        ]
> @@ -8213,7 +8709,7 @@
>        "licenseId": "Zlib",
>        "name": "zlib License",
>        "reference": "https://spdx.org/licenses/Zlib.html",
> -      "referenceNumber": 209,
> +      "referenceNumber": 421,
>        "seeAlso": [
>          "http://www.zlib.net/zlib_license.html",
>          "https://opensource.org/licenses/Zlib"
> @@ -8226,7 +8722,7 @@
>        "licenseId": "zlib-acknowledgement",
>        "name": "zlib/libpng License with Acknowledgement",
>        "reference": "https://spdx.org/licenses/zlib-acknowledgement.html"=
,
> -      "referenceNumber": 348,
> +      "referenceNumber": 188,
>        "seeAlso": [
>          "https://fedoraproject.org/wiki/Licensing/ZlibWithAcknowledgemen=
t"
>        ]
> @@ -8238,7 +8734,7 @@
>        "licenseId": "ZPL-1.1",
>        "name": "Zope Public License 1.1",
>        "reference": "https://spdx.org/licenses/ZPL-1.1.html",
> -      "referenceNumber": 545,
> +      "referenceNumber": 597,
>        "seeAlso": [
>          "http://old.zope.org/Resources/License/ZPL-1.1"
>        ]
> @@ -8251,7 +8747,7 @@
>        "licenseId": "ZPL-2.0",
>        "name": "Zope Public License 2.0",
>        "reference": "https://spdx.org/licenses/ZPL-2.0.html",
> -      "referenceNumber": 51,
> +      "referenceNumber": 555,
>        "seeAlso": [
>          "http://old.zope.org/Resources/License/ZPL-2.0",
>          "https://opensource.org/licenses/ZPL-2.0"
> @@ -8265,11 +8761,11 @@
>        "licenseId": "ZPL-2.1",
>        "name": "Zope Public License 2.1",
>        "reference": "https://spdx.org/licenses/ZPL-2.1.html",
> -      "referenceNumber": 352,
> +      "referenceNumber": 272,
>        "seeAlso": [
>          "http://old.zope.org/Resources/ZPL/"
>        ]
>      }
>    ],
> -  "releaseDate": "2024-05-22"
> +  "releaseDate": "2025-07-01T00:00:00Z"
>  }
> \ No newline at end of file




--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



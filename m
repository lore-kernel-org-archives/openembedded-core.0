Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C51C60722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 17:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6A89918202
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qFMoTUIOCXaq
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:26 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4D24A181B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:26 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36EBA1A08E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:26 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C3031A08C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:26 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:26 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 2019B342
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 18:32:26 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 23 Dec 2016 18:32:26 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 23 Dec 2016 18:32:25 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 23 Dec 2016 18:32:25 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ola x Nilsson <olani@axis.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] externalsrc.bbclass: Add task buildclean
Thread-Index: AQHSXFdGXG22n6SNJEaZBAnl6vk1bqEVy7vg
Date: Fri, 23 Dec 2016 17:32:25 +0000
Message-ID: <3b53052e54c2420dac83b62cd6eb2d33@XBOX02.axis.com>
References: <1482413283-25405-1-git-send-email-ola.x.nilsson@axis.com>
In-Reply-To: <1482413283-25405-1-git-send-email-ola.x.nilsson@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] externalsrc.bbclass: Add task buildclean
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
X-List-Received-Date: Fri, 23 Dec 2016 17:32:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Ola x Nilsson
> Sent: den 22 december 2016 14:28
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] externalsrc.bbclass: Add task buildclean
>=20
> The buildclean task should call the package build system clean
> command, just implemented for Make for now.
>=20
> This is meant for recipes where S =3D=3D B, but can be useful as a
> standalone task for other recipes too.
>=20
> Setting it to run before do_clean will do what most developers expect
> when calling bitbake -c clean.
>=20
> Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
> ---
>  meta/classes/externalsrc.bbclass | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index e115a47..bc82f1f 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -4,7 +4,7 @@
>  # Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  #
> -# externalsrc.bbclass enables use of an existing source tree, usually ex=
ternal to
> +# externalsrc.bbclass enables use of an existing source tree, usually ex=
ternal to
>  # the build system to build a piece of software rather than the usual fe=
tch/unpack/patch
>  # process.
>  #
> @@ -108,6 +108,8 @@ python () {
>          # We don't want the workdir to go away
>          d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
>=20
> +        bb.build.addtask('do_makeclean', 'do_clean', None, d)
> +
>          # If B=3DS the same builddir is used even for different architec=
tures.
>          # Thus, use a shared CONFIGURESTAMPFILE and STAMP directory so t=
hat
>          # change of do_configure task hash is correctly detected and sta=
mps are
> @@ -142,6 +144,17 @@ python externalsrc_compile_prefunc() {
>      bb.plain('NOTE: %s: compiling from external source tree %s' % (d.get=
Var('PN'), d.getVar('EXTERNALSRC')))
>  }
>=20
> +do_buildclean[dirs] =3D "${S} ${B}"
> +do_buildclean[nostamp] =3D "1"
> +do_buildclean[doc] =3D "Call 'make clean' or equivalent in ${B}"
> +externalsrc_do_buildclean() {
> +	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
> +		oe_runmake clean || die "make failed"
> +	else
> +		bbnote "nothing to compile - no makefile found"

Change "compile" to "clean" to avoid confusion.

> +	fi
> +}
> +
>  def srctree_hash_files(d):
>      import shutil
>      import subprocess
> @@ -188,3 +201,5 @@ def srctree_configure_hash_files(d):
>                  if f in search_files:
>                      out_items.append('%s:True' % os.path.join(root, f))
>      return ' '.join(out_items)
> +
> +EXPORT_FUNCTIONS do_buildclean
> --
> 2.1.4

//Peter



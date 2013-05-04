Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UYffk-0002Ow-0z
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 18:51:07 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz17so1376577pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2013 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=WlbmosiSxrLI3YwoUlyngj7zLypC3/67gRLgScnxvQE=;
	b=Bx7OLF22IrQoy4njHi80LgvdrgpVzey0nSDw8H4W6/IhG5os0J6IR49YYdFbaYACTx
	4YvzNg1YAf69LxSCsOS1qRCR28Hlyljh6Z4dACxI4rsNPbzJDBby3fwOsf/3nI6pBjEu
	e2hslZoqwYStl95B+kOsIZiUuvLfsfRczqC5BQjZYnRtb56GBJAi6EUi+73zOV2vsGio
	7TcevRvo11BO3iVs/b0OEBTDTks7ZKw6pwwJVoxzXtCud1YSrO4J/75ufOi8o+np6rco
	DTBMM6GPZKtCN73iRyA9yXuHFx/LH05bwW+b3E5Y47sk7CLZMl+GaSEVuSoEGx41T0pv
	vSAg==
X-Received: by 10.69.1.39 with SMTP id bd7mr18573229pbd.188.1367685178449;
	Sat, 04 May 2013 09:32:58 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	cq1sm16358468pbc.13.2013.05.04.09.32.56 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 09:32:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1367619160-17703-1-git-send-email-sgw@linux.intel.com>
Date: Sat, 4 May 2013 09:32:58 -0700
Message-Id: <0422BEEE-9EC9-414E-B921-E82F210D2AFC@gmail.com>
References: <1367619160-17703-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] binutils: backport whitespace fix
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
X-List-Received-Date: Sat, 04 May 2013 16:51:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Looked good.

Acked-By: Khem Raj <raj.khem@gmail.com>

On May 3, 2013, at 3:12 PM, Saul Wold <sgw@linux.intel.com> wrote:

> This is a backport of a whitespace skipping issue: PR14987 and PR14887
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/binutils/binutils-2.23.2.inc |    1 +
> .../binutils-fix-skip-whitespace-pr14887.patch     |   50 =
++++++++++++++++++++
> 2 files changed, 51 insertions(+)
> create mode 100644 =
meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-=
whitespace-pr14887.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2.inc =
b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
> index 0b01279..ddbe522 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.23.2.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
> @@ -37,6 +37,7 @@ BACKPORT =3D "\
>      file://backport/binutils-fix-ineffectual-zero-of-cache.patch \
>      file://backport/binutils-replace-strncat-with-strcat.patch  \
>      =
file://backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.=
patch  \
> +     file://backport/binutils-fix-skip-whitespace-pr14887.patch \
> "
> SRC_URI[md5sum] =3D "4f8fa651e35ef262edc01d60fb45702e"
> SRC_URI[sha256sum] =3D =
"fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097"
> diff --git =
a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ski=
p-whitespace-pr14887.patch =
b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ski=
p-whitespace-pr14887.patch
> new file mode 100644
> index 0000000..e504b3b
> --- /dev/null
> +++ =
b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ski=
p-whitespace-pr14887.patch
> @@ -0,0 +1,50 @@
> +
> +
> +PR gas/14887
> + * config/tc-arm.c (skip_past_char): Skip whitespace before the =
anticipated character.
> + * config/tc-arm.c (parse_address_main): Delete skip of whitespace =
here as it is no longer needed.
> +
> +Upstream-Status: Backport [PR14887]
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +RCS file: /cvs/src/src/gas/ChangeLog,v
> +retrieving revision 1.4898
> +retrieving revision 1.4899
> +Index: binutils-2.23.2/gas/config/tc-arm.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- binutils-2.23.2.orig/gas/config/tc-arm.c
> ++++ binutils-2.23.2/gas/config/tc-arm.c
> +@@ -885,6 +885,9 @@ const char FLT_CHARS[] =3D "rRsSfFdDxXeEpP
> + static inline int
> + skip_past_char (char ** str, char c)
> + {
> ++  /* PR gas/14987: Allow for whitespace before the expected =
character.  */
> ++  skip_whitespace (*str);
> ++
> +   if (**str =3D=3D c)
> +     {
> +       (*str)++;
> +@@ -5168,6 +5171,9 @@ parse_address_main (char **str, int i, i
> +       return PARSE_OPERAND_SUCCESS;
> +     }
> +=20
> ++  /* PR gas/14987: Allow for whitespace before the expected =
character.  */
> ++  skip_whitespace (p);
> ++
> +   if ((reg =3D arm_reg_parse (&p, REG_TYPE_RN)) =3D=3D FAIL)
> +     {
> +       inst.error =3D _(reg_expected_msgs[REG_TYPE_RN]);
> +Index: binutils-2.23.2/gas/testsuite/gas/arm/neon-ldst-es.s
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- binutils-2.23.2.orig/gas/testsuite/gas/arm/neon-ldst-es.s
> ++++ binutils-2.23.2/gas/testsuite/gas/arm/neon-ldst-es.s
> +@@ -57,3 +57,7 @@
> + 	vld2.32 {q1},[r7]
> + 	vld4.32 {q1-q2},[r7]
> + 	vld4.32 {q14-q15},[r7]
> ++
> ++	@ PR 14987 and 14887: Allow for whitespace in the instruction.
> ++	vld1.32 { d1 [ ] } , [ r2 ] , r3
> ++
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




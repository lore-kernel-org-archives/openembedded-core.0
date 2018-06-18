Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id C94BB744DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 06:38:26 +0000 (UTC)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
	by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 418LyW0CC6z1XLFjD;
	Mon, 18 Jun 2018 08:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1529303907;
	bh=pbC5wJ0lKgqf06x50VHma9iM8SrapcLQ0Ls2wD/edMU=; l=10;
	h=From:From:Reply-To:Sender;
	b=IPw+hq9x59JBjiUBI/QNUaL8KoxRtOtJiKSjCAIb5VNYDkhtYFOo2ekJZbNidXKKT
	3+0ZMDrYNPVdbFUpHxM4nN0wSU3JLTPXAuxN4uY4MYfJecgJC5BhbCXyM05YF1Qmd8
	ObUFdHq69pvZc7/2Zyx8jdu4QPWN0wUnBPh4qM00=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
	by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 418LyV6mCPz89n;
	Mon, 18 Jun 2018 08:38:26 +0200 (CEST)
X-AuditID: 0a3aad10-40fff70000000ee7-37-5b275370a928
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id
	CE.36.03815.073572B5; Mon, 18 Jun 2018 08:38:40 +0200 (CEST)
Received: from FE-MBX2009.de.bosch.com (fe-mbx2009.de.bosch.com [10.3.231.15])
	by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 418LyV4frqzCpP7;
	Mon, 18 Jun 2018 08:38:26 +0200 (CEST)
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	FE-MBX2009.de.bosch.com (10.3.231.15) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 18 Jun 2018 08:38:26 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2020.APAC.bosch.com (10.187.83.43) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 18 Jun 2018 14:38:24 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.008; Mon, 18 Jun 2018 14:38:24 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug
	sources in externalsrc -dbg packages
Thread-Index: AQHT7aL1NBdDeQv1gUOwAbts2z5YlqQ4scOAgADtPqCALCFZEA==
Date: Mon, 18 Jun 2018 06:38:24 +0000
Message-ID: <58b4c77ac20c477e894a21e27777682d@in.bosch.com>
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com> 
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.208]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21Tf0wbZRjmu17ba+2567WF1zoS6ViIOBnUqYwZNVvCIIZkc8nMxh+ulYM2
	0h+7KwQmSxAn20iTIcKy3WqVDqHYOETJ1hGmrp3REsSINWO4X5FpdIzphluguOKVK2v/8J/L
	8z3P+7zP+713R0jodkJPWO0uhrWbag0yJa4s+TT7aeeOvMrC4UBx8eWF2/Lin/msl7Eyb2R7
	2figH23DditfqGJqrfUMu/7FPUpL34DRyec3fD/5jawZ3c9pQwoCqA0wF+9DbUhJ0NQxDOaH
	PJh4GEHwRdgrFw9/Izh6dwgXD3MIFs6eTJZdQOD9o1WWaCajSiHQ2bIsaCk3gqXYb/KEoKFs
	cCTYv4y1lB2C0V9xEW+GcG8MJTBOrYUHU+FlnqQ2wbWDS8mpDiLo489JEwKissF3qWO5SEJl
	wdSNDzHxGhT0jPwgEbEO/pyOS0WcA7OnA8n6Apjs6pSJ+Cno7Z6RiGFqiBy/gbejTD6tLZ9m
	4dMsfJrlI4R/gnTVTGG97fmNRcUFrJnh9hUWFbzhsH2OxFdEBREfMYcQRSCDirxWkVdJS031
	XKMthJ4lMIOOVG8RqEfNjqpGi4mzvM7W1TKcQU+ijIwMWvOQ5urMNivHWR32EAJCYtCSeasF
	H1llatzHsA7RFkKPE7ghi3RXNe2mqRqTi3mTYZwMu6JuIggDkIWvCkY1y9QwDdXWWteKbMgW
	MzPTlfRYjFCE0DOESsh+bXsim3OabJy1Jml/TLTTK2zKOoq2ELda3W4JjdsddkafRTYnRqAS
	lZY6+8MJ9KvJAl9uJa1LE1JdbqJLSNihhsxPmFXCn5DKBjKo8eyi1UkyZTJ+LHioz3TgGbso
	fKfBewgiB85icNn/HQaHfPdw+OX+BSmcap2Qwvz1uzI4NPKuHCaGeTnMj4flEF2cFtDX7yig
	beGwAube9yjAG59Wwp2Li4/A7akJFfhnllTguxIjIXa8axVEB4ZWwb//nKDgdLSHguCDBTXE
	j71Hg/twQAM9vd9qYDIuPE4Mdujg6u+tmcD/NJp5U1gsJiz2q+7cxGJdJtf/LDbJpm6nb0Zn
	SvdW8DMtsY3mrdOL/qb2HRuMA8Pn+/1PGhv2t5S+0qntrC5/q4S9VaRtqv9AfecA/6PTyJac
	ufJEwDdvyug4N8eqo3viY+XK2X68Ina+oWvn1ec27/J4c972DK490j22151btu7kePj6S275
	qZ2zkf1frjmqoP7KHl2vEjqXrzPgnMVUlC9hOdN/i8WmVaMEAAA=
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Mon, 18 Jun 2018 06:38:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Openembedded-Core maintainers,

Since the commit from myself has its age more than a month at patchwork.ope=
nembedded.org, it is not arrived to master/next branch.
https://patchwork.openembedded.org/series/12005/#=20
I could see some latest commits after mine just before few days are availab=
le at master branch.

Can you please let me know if anything went wrong from my end?

Mit freundlichen Gr=FC=DFen / Best regards

Rajendran Vignesh
RBEI/ECF33 =20

Tel. +91 422 67-65103=20


-----Original Message-----
From: Vignesh Rajendran (RBEI/ECF3)=20
Sent: Monday, May 21, 2018 10:21 AM
To: 'Paul Eggleton' <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org; Avanashilingam Gokulnath (RBE=
I/ECF3) <Gokulnath.Avanashilingam@in.bosch.com>; Thangaraj Sathish (RBEI/EC=
F3) <Sathish.Thangaraj@in.bosch.com>; Ramadevi Sennakeseavan <ramadevi.senn=
akesavan@in.bosch.com>
Subject: RE: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug sour=
ces in externalsrc -dbg packages

Hello Paul,

>> Is there a way we can fix this without adding a reference to externalsrc=
 in
>> package.bbclass?

From my knowledge, No.=20
Because the path of source location in debug binaries is pointed to the ext=
ernal path.
copydebugsources was the only option in my point of view to copy the source=
s from external path.

Do you find/foresee any issues regarding that change in package.bbclass?

Mit freundlichen Gr=FC=DFen / Best regards

Rajendran Vignesh
RBEI/ECF33 =20

Tel. +91 422 67-65103=20


-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Monday, May 21, 2018 3:56 AM
To: Vignesh Rajendran (RBEI/ECF3) <Vignesh.Rajendran@in.bosch.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug sour=
ces in externalsrc -dbg packages

Hi Vignesh,

Thanks for the patch, a question below.

On Thursday, 17 May 2018 5:50:00 PM NZST Vignesh Rajendran wrote:
> The recipes which are using externalsrc method doesn't contain the
> debug sources in their -dbg packages.
>=20
> Add a handling in copydebugsources function to copy the debugsources for
> externalsrc -dbg packages.
>=20
> Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
> ---
>  meta/classes/externalsrc.bbclass |  3 +++
>  meta/classes/package.bbclass     | 12 ++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index c9f5cf7..135670d 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -129,6 +129,9 @@ python () {
>              d.setVar('CONFIGURESTAMPFILE', configstamp)
>              d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDP=
E}${PV}-${PR}')
>              d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*'=
)
> +
> +	# set DEBUG_PREFIX_MAP to external source path
> +	d.appendVar("DEBUG_PREFIX_MAP", "-fdebug-prefix-map=3D${EXTERNALSRC}=3D=
/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}")
>  }
> =20
>  python externalsrc_configure_prefunc() {
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index edeffa9..f071a2e 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):
>          workdir =3D d.getVar("WORKDIR")
>          workparentdir =3D os.path.dirname(os.path.dirname(workdir))
>          workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/"=
 + os.path.basename(workdir)
> +        externalsrc =3D d.getVar('EXTERNALSRC', True)
> =20
>          # If build path exists in sourcefile, it means toolchain did not=
 use
>          # -fdebug-prefix-map to compile
> @@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):
>          processdebugsrc +=3D "fgrep -zw '%s' | "
>          # Remove prefix in the source paths
>          processdebugsrc +=3D "sed 's#%s##g' | "
> -        processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-owne=
r '%s%s' 2>/dev/null)"
> +        # handle external sources to provide sources in -dbg packages
> +        if externalsrc:
> +            localsrc_prefix =3D "/usr/src/debug/"
> +            processdebugsrc +=3D "sed 's#%s/##g' | "
> +            processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-=
owner '%s%s/%s' 2>/dev/null)"
> +            cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc=
_prefix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir)
> +        else:
> +            processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-=
owner '%s%s' 2>/dev/null)"
> +            cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc=
_prefix, workparentdir, dvar, debugsrcdir)
> =20
> -        cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_pre=
fix, workparentdir, dvar, debugsrcdir)
>          (retval, output) =3D oe.utils.getstatusoutput(cmd)
>          # Can "fail" if internal headers/transient sources are attempted
>          #if retval:
>=20

Is there a way we can fix this without adding a reference to externalsrc in
package.bbclass?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre




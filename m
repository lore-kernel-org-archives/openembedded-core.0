Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id CD872745C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 04:51:00 +0000 (UTC)
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 40q5vS6HhMz4f3lMJ;
	Mon, 21 May 2018 06:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1526878260;
	bh=5zb0zpzAu9dmyaGg4tfHzPvu231TcRtZdUagvvR4EKA=; l=10;
	h=From:From:Reply-To:Sender;
	b=xC8KSYrWXEuT2U1yboRKT90IDNBLIdmsQJ5OHUMbEhhK3P0D+A8Gi2ECtku8EFsY6
	XEuttXrQUDuD2HBu42S0MxlX+dcPxiF16IaxRNRobAWNEl4EB4LyUs5EyWhcetsQJ5
	ZIKnnW5pmm7m0Os422VYIkiZZLhM8woNYuSRo7Cs=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
	by si0vm1947.rbesz01.com (Postfix) with ESMTP id 40q5vS5wl6z6CjQ32;
	Mon, 21 May 2018 06:51:00 +0200 (CEST)
X-AuditID: 0a3aad16-bcfff70000000413-75-5b025032a5b4
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id
	AD.10.01043.230520B5; Mon, 21 May 2018 06:50:58 +0200 (CEST)
Received: from FE-MBX2045.de.bosch.com (fe-mbx2045.de.bosch.com [10.3.231.55])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 40q5vS3gk5z6D3rxs; 
	Mon, 21 May 2018 06:51:00 +0200 (CEST)
Received: from SGPMBX2004.APAC.bosch.com (10.187.83.48) by
	FE-MBX2045.de.bosch.com (10.3.231.55) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 21 May 2018 06:50:59 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2004.APAC.bosch.com (10.187.83.48) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 21 May 2018 12:50:57 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.008; Mon, 21 May 2018 12:50:57 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug
	sources in externalsrc -dbg packages
Thread-Index: AQHT7aL1NBdDeQv1gUOwAbts2z5YlqQ4scOAgADtPqA=
Date: Mon, 21 May 2018 04:50:57 +0000
Message-ID: <26867e93993045b0bba0472792c9a7c5@in.bosch.com>
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.219]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21Tb0wbdRjmd3ct18rJ9Urbdx04d4linDL+qEFmhGhkOHXDD8sy+KBFTtpI
	r6xXyOCD1m0SVkhYcEQoyLamm3WwJXU6O3D+qZgV3AabGCgyMoFsAVQ6Gcq/Ma8crP3gl8vz
	vs/7PO+fuyNx5jNST5p4G2flDaWsXEkos84kPZ2ejxWmnl/clDmy8Fds5q9OXQ6W19bzZt5V
	rwflYwXKF4q5UlMFZ9364ttKY11Xv7zMwe7vqw3gdmTf6EAKEuhnoL5lCHcgJcnQTRiMfLog
	k4JvEUw2+QkpCCGYu+RdY2YR9H03KZeCbgSjATcRNpPTudB+9AAWxgl0GtR661flOH0RA6en
	Cw8TatoM9b7PY6UiHnwDY2IRKeIsOHYrI5wm6Mfgw6bgqidFb4MDM+dWPRm6GsHAFS6MFfRL
	MOjyyMMY0UngCjas1uO0DoYnjmHScjS4v+nDJayByfEVmYQ3Q8dSaK0+BYYaj8olvAVOnZjG
	pb4q6GmeII4gcEbZOqMkziiJM0pyHBGnkUYwpVaY01Mz01OsRZxQlZqW8o7F/AWS3pzWhw7+
	UOxHNInYOOp0NlbIyAwVQqXZj54lMVZDKbPuFzAPF1mKK40GwfiWtbyUE1g9hWJiYhj1g7RQ
	XmQ2CYLJwvsRkDibQO0aR4UMVWyorOKsFknmRxtJgtVREzmhAoYuMdi49ziujLOus9tIkgVq
	dKc4g8rKlXD73zWV2tZpNknqqY1mottipMKPMsg4sXf8G6IFJZQZzIKpZE2+QZIz69mItBe9
	TP5RXVeHMwRv4Tm9jqoKj0CHK43l/IMJ9InUnExcShNFRFymUBCJN1RT58LiOPEHifQGyqdu
	3cuo1pIRUfpJUUN74qH18iCCNt8cgp5DFzCocc0R8Ns/3TI4W31dBvM3/5bD9U5nLMxf/TEW
	BpbGRfT9QQU4Fg4rYPbjVgXcGVx6CDzT9+PAdWORgsXmxnhYvttCw/kBNw2+ewsqqDvcrgb3
	qUtqGFoRHy3eBg2M3qrWgvOXXi20dYwANDhqNkBHqFEPX/3bngjLX36dCPZQf9KUeFhMPGyN
	X/wYKMFmsP3PYdeyke30dqQL3nYsNa8Eq1SPjz21RV7y6nMzO7KeuNB/4vfb2K5snu/c3dK3
	Yr459jq3/aOZ17wZ7st3L3Y/8oG/4ZOtOwIJ10KBffiRnZrs3J+3T/de4/PeXxYCf/6UYrl3
	fG9a8qNTw2f67c35V7Q3Wo31tcm5e+Z359zp7drj6ux4/uwrs8nD+w6xhGA0pD2JWwXDfyAL
	bNC6BAAA
Cc: "Ramadevi Sennakesavan
	\(RBEI/ECF3\)" <Ramadevi.Sennakesavan@in.bosch.com>, "Thangaraj Sathish
	\(RBEI/ECF3\)" <Sathish.Thangaraj@in.bosch.com>, "Avanashilingam Gokulnath
	\(RBEI/ECF3\)" <Gokulnath.Avanashilingam@in.bosch.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 21 May 2018 04:51:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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




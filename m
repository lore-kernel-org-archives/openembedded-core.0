Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A69657197A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 00:16:02 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v186so29550258wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 16:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AUzoM0RgyW5RHKj1o0HjRYLer/xHDVvQpGy4JJZ0Smg=;
	b=OmDyjggdwfhYAQaOl5p9xLP78/kCJhLMNH6X5NXrCJuqaKidBln/P+eTK3hCTNAsmd
	ZUAFENKUW3pHaEgQ7NT2/uCxB2Kn032L1zlITp6cM2pfZNjyGsWjWSl66F27tWsZD5rJ
	QQJ1pyaZMuCXHrzqZXc+EDF7X+jU8uuZCoCat6WKXPIgULcaS88zjX9QeR2LOb85hJPC
	Pcu8chP3OFLNfbds7oMt0fMUvKGHOUgCAYUP1z20U6tS3j2wnzEPM5hanqODv98yHbz+
	n/Z/hT+EzEbhEs+nfFAQblp9yk2EhG7Z0UnYspWbBuxwL4grKuTTEb/wWqK8u17urmE2
	Sn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AUzoM0RgyW5RHKj1o0HjRYLer/xHDVvQpGy4JJZ0Smg=;
	b=i88QD0h3dP3U6gchESzSoQMZl1y4ViO/sjUj/jAYBo8ra5TMLiXaUkQaIlSZX80ebp
	KzOzwkgnc6pvZIQbhiN3KH+rjBng0gicMvQ0jjQBBBAGrjFeJ8JbrM9DWQOZTCTFwdKq
	awFJiNooGPij5lJlnDlmE/90PcO+T7wMVeEZMrDscmL8DybGNklzffRqAYYo+uobi2AK
	78C9dihHcpjwVgIbBuU6AtXKeetdCkRnA7Jl2CJoHZ4Iwnr/XjrC14egSt4vr16FDEy+
	DW5qUPKkcqv+CRNMeYbKDcDB9rhbPegLHFMPamYyGbcUcA3IIKWGV0DcUYp2XY0kQzX9
	15cw==
X-Gm-Message-State: AMke39kxtInH+ouMMPAoZrA8F6GQfCHih417dm0rITi23OX6HalxVXpQBdJheC/9vVb0oA==
X-Received: by 10.28.217.136 with SMTP id q130mr3779743wmg.13.1487376961122;
	Fri, 17 Feb 2017 16:16:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u189sm3526340wmu.1.2017.02.17.16.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Feb 2017 16:15:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 18 Feb 2017 01:16:00 +0100
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170218001600.GC3276@jama>
References: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
	<20170215085849.GA6218@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170215085849.GA6218@linux.intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: core-image-tiny-initramfs failing to parse because of WIC (WKS_FULL_PATH, )
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
X-List-Received-Date: Sat, 18 Feb 2017 00:16:03 -0000
X-Groupsio-MsgNum: 93517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline

--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2017 at 10:58:49AM +0200, Ed Bartosh wrote:
> Hi Martin,
>=20
> Sorry for the delay. I missedd your message somehow.
>=20
> I can't reproduce this. Tried with latest poky and latest oe-core +
> bitbake. I built core-image-tiny-initramfs from scratch and bitbake -e
> busybox works for me just fine.
>=20
> Can you provide more details about your setup, please?

Hi Ed,

I was also having troubles reproducing it in different setup as well, until=
 I've
found out that my local.conf had this line:

IMAGE_FSTYPES_qemux86 =3D "vmdk"

which prevented ever using wic (USING_WIC variable was always empty).

Now with this line removed I can share the complete exception reproduced
with just oe-core layer included:

$ bitbake -e core-image-tiny-initramfs | tee env.core-image-tiny-initramfs5
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,=
 IP: 127.0.0.1, PORT: 38869, PID: 21506
Parsing recipes...ERROR: ExpansionError during parsing /OE/build/oe-core/op=
enembedded-core/meta/recipes-core/images/core-image-tiny-initramfs.bb
Traceback (most recent call last):
  File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 412, in DataS=
mart.expandWithRefs(s=3D'\tout=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"\n\twks=3D"=
${WKS_FULL_PATH}"\n\tif [ -z "$wks" ]; then\n\t\tbbfatal "No kickstart file=
s from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES=
 appropriately."\n\tfi\n\n\tBUILDDIR=3D"${TOPDIR}" wic create "$wks" --vars=
 "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${W=
IC_CREATE_EXTRA_ARGS}\n\tmv "$out/$(basename "${wks%.wks}")"*.direct "$out$=
{IMAGE_NAME_SUFFIX}.wic"\n\trm -rf "$out/"\n', varname=3D'IMAGE_CMD'):
                 try:
    >                s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
                     try:
  File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 111, in Varia=
bleParse.var_sub(match=3D<_sre.SRE_Match object; span=3D(43, 59), match=3D'=
${WKS_FULL_PATH}'>):
                 else:
    >                var =3D self.d.getVarFlag(key, "_content")
                 self.references.add(key)
  File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 773, in DataS=
mart.getVarFlag(var=3D'WKS_FULL_PATH', flag=3D'_content', expand=3DTrue, no=
weakdefault=3DFalse, parsing=3DFalse):
                     cachename =3D var + "[" + flag + "]"
    >            value =3D self.expand(value, cachename)

  File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 436, in DataS=
mart.expand(s=3D"${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}'=
) or ''}", varname=3D'WKS_FULL_PATH'):
         def expand(self, s, varname =3D None):
    >        return self.expandWithRefs(s, varname).value

  File "/OE/build/oe-core/bitbake/lib/bb/data_smart.py", line 426, in DataS=
mart.expandWithRefs(s=3D"${@wks_search('directdisk.wks core-image-tiny-init=
ramfs.wks'.split(), '/OE/build/oe-core/openembedded-core/meta/recipes-core/=
images:${@':'.join('%s/wic' % p for p in '/OE/build/oe-core:${TMPDIR}:/OE/b=
uild/oe-core/openembedded-core/meta'.split(':'))}:${@':'.join('%s/scripts/l=
ib/wic/canned-wks' % l for l in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-c=
ore/openembedded-core/meta:/OE/build/oe-core/openembedded-core'.split(':'))=
}') or ''}", varname=3D'WKS_FULL_PATH'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc) from exc

bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH, exp=
ression was ${@wks_search('directdisk.wks core-image-tiny-initramfs.wks'.sp=
lit(), '/OE/build/oe-core/openembedded-core/meta/recipes-core/images:${@':'=
=2Ejoin('%s/wic' % p for p in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-cor=
e/openembedded-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/cann=
ed-wks' % l for l in '/OE/build/oe-core:${TMPDIR}:/OE/build/oe-core/openemb=
edded-core/meta:/OE/build/oe-core/openembedded-core'.split(':'))}') or ''} =
which triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH, line =
1)


Summary: There was 1 ERROR message shown, returning a non-zero exit code.

The strange part of this exception is the unexpanded ${TMPDIR} in the WKS_S=
EARCH_PATH value,
that lead me to following 2 lines in conf/bblayers.conf:

TMPDIR :=3D "/OE/build/oe-core"
BBPATH =3D "${TOPDIR}:${TMPDIR}"

I'm not sure why it appears unexpanded in WKS_SEARCH_PATH, I see you do som=
e magick with all these
WKS_* variables, especially in that anonymous python, but the exception is =
actually from
expanding IMAGE_CMD_wic () function and it goes away if I remove following =
line from it:

        wks=3D"${WKS_FULL_PATH}"

And it also goes away if I use immediate expansion when setting that BBPATH=
 in bblayers.conf.

Interesting variables from bitbake -e with immediate expansion:
# $BBPATH [4 operations]
#   immediate /OE/build/oe-core/conf/bblayers.conf:6
#     "${TOPDIR}:${TMPDIR}"
#   postdot /OE/build/oe-core/openembedded-core/meta/conf/layer.conf:2
#     ":${LAYERDIR}"
#   set data_smart.py:911 [expandVarref]
#     "/OE/build/oe-core:/OE/build/oe-core:/OE/build/oe-core/openembedded-c=
ore/meta"
#   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:94
#     [doc] "Used by BitBake to locate .bbclass and configuration files. Th=
is variable is analogous to the PATH variable."
# pre-expansion value:
#   "/OE/build/oe-core:/OE/build/oe-core:/OE/build/oe-core/openembedded-cor=
e/meta"
BBPATH=3D"/OE/build/oe-core:/OE/build/oe-core:/OE/build/oe-core/openembedde=
d-core/meta"

# $WKS_SEARCH_PATH
#   set? /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.b=
bclass:10
#     "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))=
}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COR=
EBASE}'.split(':'))}"
WKS_SEARCH_PATH=3D"/OE/build/oe-core/openembedded-core/meta/recipes-core/im=
ages:/OE/build/oe-core/wic:/OE/build/oe-core/wic:/OE/build/oe-core/openembe=
dded-core/meta/wic:/OE/build/oe-core/scripts/lib/wic/canned-wks:/OE/build/o=
e-core/scripts/lib/wic/canned-wks:/OE/build/oe-core/openembedded-core/meta/=
scripts/lib/wic/canned-wks:/OE/build/oe-core/openembedded-core/scripts/lib/=
wic/canned-wks"

# $WKS_FULL_PATH
#   set /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.bb=
class:11
#     "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
WKS_FULL_PATH=3D"/OE/build/oe-core/openembedded-core/scripts/lib/wic/canned=
-wks/directdisk.wks"

And the same without immediate expansion, but with 'wks=3D"${WKS_FULL_PATH}=
"' line removed so that it doesn't fail to parse:
# $BBPATH [4 operations]
#   set /OE/build/oe-core/conf/bblayers.conf:6
#     "${TOPDIR}:${TMPDIR}"
#   postdot /OE/build/oe-core/openembedded-core/meta/conf/layer.conf:2
#     ":${LAYERDIR}"
#   set data_smart.py:911 [expandVarref]
#     "${TOPDIR}:${TMPDIR}:/OE/build/oe-core/openembedded-core/meta"
#   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:94
#     [doc] "Used by BitBake to locate .bbclass and configuration files. Th=
is variable is analogous to the PATH variable."
# pre-expansion value:
#   "${TOPDIR}:${TMPDIR}:/OE/build/oe-core/openembedded-core/meta"
BBPATH=3D"/OE/build/oe-core:/OE/build/oe-core-glibc:/OE/build/oe-core/opene=
mbedded-core/meta"

# $WKS_SEARCH_PATH
#   set? /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.b=
bclass:10
#     "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))=
}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COR=
EBASE}'.split(':'))}"
WKS_SEARCH_PATH=3D"/OE/build/oe-core/openembedded-core/meta/recipes-core/im=
ages:/OE/build/oe-core/wic:/OE/build/oe-core-glibc/wic:/OE/build/oe-core/op=
enembedded-core/meta/wic:/OE/build/oe-core/scripts/lib/wic/canned-wks:/OE/b=
uild/oe-core-glibc/scripts/lib/wic/canned-wks:/OE/build/oe-core/openembedde=
d-core/meta/scripts/lib/wic/canned-wks:/OE/build/oe-core/openembedded-core/=
scripts/lib/wic/canned-wks"

# $WKS_FULL_PATH
#   set /OE/build/oe-core/openembedded-core/meta/classes/image_types_wic.bb=
class:11
#     "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
WKS_FULL_PATH=3D"/OE/build/oe-core/openembedded-core/scripts/lib/wic/canned=
-wks/directdisk.wks"

Let me know if sharing "bitbake -e core-image-tiny-initramfs" from these 2 =
tests would be useful for you.

Regards,
>=20
> On Thu, Feb 09, 2017 at 09:39:30AM +0100, Martin Jansa wrote:
> > Running e.g. bitbake -e busybox with latest oe-core triggers this badly
> > looking exception:
> >=20
> > Can we add some weak assignment for people who don't care about wic
> > or core-image-tiny-initramfs to continue using oe-core?
> >=20
> > ERROR: ExpansionError during parsing /OE/oe-core/meta/recipes-core/imag=
es/
> > core-image-tiny-initramfs.bb
> > Traceback (most recent call last):
> >   File "/OE/bitbake/lib/bb/data_smart.py", line 412, in
> > DataSmart.expandWithRefs(s=3D'\tout=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"\n=
\twks=3D"${WKS_FULL_PATH}"\n\tif
> > [ -z "$wks" ]; then\n\t\tbbfatal "No kickstart files from WKS_FILES were
> > found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
> > appropriately."\n\tfi\n\n\tBUILDDIR=3D"${TOPDIR}" wic create "$wks" --v=
ars
> > "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> > ${WIC_CREATE_EXTRA_ARGS}\n\tmv "$out/$(basename "${wks%.wks}")"*.direct
> > "$out${IMAGE_NAME_SUFFIX}.wic"\n\trm -rf "$out/"\n', varname=3D'IMAGE_C=
MD'):
> >                  try:
> >     >                s =3D __expand_var_regexp__.sub(varparse.var_sub, =
s)
> >                      try:
> >   File "/OE/bitbake/lib/bb/data_smart.py", line 111, in
> > VariableParse.var_sub(match=3D<_sre.SRE_Match object; span=3D(43, 59),
> > match=3D'${WKS_FULL_PATH}'>):
> >                  else:
> >     >                var =3D self.d.getVarFlag(key, "_content")
> >                  self.references.add(key)
> >   File "/OE/bitbake/lib/bb/data_smart.py", line 773, in
> > DataSmart.getVarFlag(var=3D'WKS_FULL_PATH', flag=3D'_content', expand=
=3DTrue,
> > noweakdefault=3DFalse, parsing=3DFalse):
> >                      cachename =3D var + "[" + flag + "]"
> >     >            value =3D self.expand(value, cachename)
> >=20
> >   File "/OE/bitbake/lib/bb/data_smart.py", line 436, in
> > DataSmart.expand(s=3D"${@wks_search('${WKS_FILES}'.split(),
> > '${WKS_SEARCH_PATH}') or ''}", varname=3D'WKS_FULL_PATH'):
> >          def expand(self, s, varname =3D None):
> >     >        return self.expandWithRefs(s, varname).value
> >=20
> >   File "/OE/bitbake/lib/bb/data_smart.py", line 426, in
> > DataSmart.expandWithRefs(s=3D"${@wks_search('directdisk.wks
> > core-image-tiny-initramfs.wks'.split(),
> > '/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
> > '/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/l=
ib/wic/canned-wks'
> > % l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}'=
) or
> > ''}", varname=3D'WKS_FULL_PATH'):
> >                  except Exception as exc:
> >     >                raise ExpansionError(varname, s, exc) from exc
> >=20
> > bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH,
> > expression was ${@wks_search('directdisk.wks
> > core-image-tiny-initramfs.wks'.split(),
> > '/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
> > '/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/l=
ib/wic/canned-wks'
> > % l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}'=
) or
> > ''} which triggered exception SyntaxError: invalid syntax (WKS_FULL_PAT=
H,
> > line 1)
>=20
> --
> Regards,
> Ed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKeSQAAKCRA3VSO3ZXaA
HBMwAJ9bJG7T7sJROT/iw67+x3Tcz6Hn3gCgplpDtHU5qIepgwADlwEhFtP4ojQ=
=IYpw
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--

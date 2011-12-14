Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RadCQ-0002uR-LG
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 01:59:58 +0100
Received: from mail200-ch1-R.bigfish.com (10.43.68.241) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Wed, 14 Dec 2011 00:53:03 +0000
Received: from mail200-ch1 (localhost [127.0.0.1])	by
	mail200-ch1-R.bigfish.com (Postfix) with ESMTP id BEDF020281	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 00:53:03 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail200-ch1 (localhost.localdomain [127.0.0.1]) by mail200-ch1
	(MessageSwitch) id 1323823983604775_25650;
	Wed, 14 Dec 2011 00:53:03 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail200-ch1.bigfish.com (Postfix) with ESMTP id
	85F4E2A010F	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 00:53:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 14 Dec 2011 00:53:01 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.28]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 13 Dec 2011 18:52:59 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] sstate.bbclass: add option to use
	alternate compression in lieu of gzip
Thread-Index: AQHMufq5B+Dl77iD1ECtMq2ECV8RFA==
Date: Wed, 14 Dec 2011 00:52:59 +0000
Message-ID: <CAEsOVNcQHbO8dsOZE92NLbZXKvx-0sFxNmpe-h_s4RC9G-KB2w@mail.gmail.com>
References: <CAEsOVNdDP0oEUi3HbrgTZTGbE4r1DS53gE66wR6kXs5-MkUX6Q@mail.gmail.com>
	<1323219149-17056-1-git-send-email-msm@freescale.com>
In-Reply-To: <1323219149-17056-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v3] sstate.bbclass: add option to use alternate compression in lieu of gzip
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 00:59:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EF38DC84BD356A40999727D15287CF87@freescale.net>
Content-Transfer-Encoding: quoted-printable

Ping!

On Tue, Dec 6, 2011 at 6:52 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> The savings can be substantial. The resutls below are for a
> core-image-minimal type image:
>
> gzip: =A0 =A01.1G =A0 sstate-cache
> xz =A0 =A0 =A0 714M =A0 sstate-cache
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: This one actually works!
> v3:
> =A0- Use --use-compress-program=3D option to tar so we can use any compre=
ssion
> =A0 not just ones built into tar
> =A0- Add ASSUME_PROVIDED for the compression program we are using, this w=
ay
> =A0 it won't effect the build and if you are using it - it's already
> =A0 going to be available on the host
>
>
> =A0meta/classes/sstate.bbclass | =A0 22 ++++++++++++++--------
> =A01 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 3d259f0..a2d7b65 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -18,6 +18,12 @@ SSTATE_MANMACH ?=3D "${SSTATE_PKGARCH}"
>
> =A0SSTATEPOSTINSTFUNCS ?=3D ""
>
> +SSTATE_PKG_SUFFIX ?=3D "tgz"
> +SSTATE_PKG_TARZIPPROG ?=3D "gzip"
> +# the tool used above for sstate-cache will always need to be used from =
the host
> +# so we can ASSUME_PROVIDED it
> +ASSUME_PROVIDED +=3D "${SSTATE_PKG_TARZIPPROG}-native"
> +
> =A0python () {
> =A0 =A0 if bb.data.inherits_class('native', d):
> =A0 =A0 =A0 =A0 bb.data.setVar('SSTATE_PKGARCH', bb.data.getVar('BUILD_AR=
CH', d), d)
> @@ -155,7 +161,7 @@ def sstate_installpkg(ss, d):
> =A0 =A0 =A0 =A0 oe.path.remove(dir)
>
> =A0 =A0 sstateinst =3D bb.data.expand("${WORKDIR}/sstate-install-%s/" % s=
s['name'], d)
> - =A0 =A0sstatepkg =3D bb.data.getVar('SSTATE_PKG', d, True) + '_' + ss['=
name'] + ".tgz"
> + =A0 =A0sstatepkg =3D bb.data.expand("${SSTATE_PKG}" + '_' + ss['name'] =
+ ".${SSTATE_PKG_SUFFIX}", d)
>
> =A0 =A0 if not os.path.exists(sstatepkg):
> =A0 =A0 =A0 =A0pstaging_fetch(sstatepkg, d)
> @@ -206,7 +212,7 @@ def sstate_clean_cachefile(ss, d):
> =A0 =A0 import oe.path
>
> =A0 =A0 sstatepkgdir =3D bb.data.getVar('SSTATE_DIR', d, True)
> - =A0 =A0sstatepkgfile =3D sstatepkgdir + '/' + bb.data.getVar('SSTATE_PK=
GSPEC', d, True) + "*_" + ss['name'] + ".tgz*"
> + =A0 =A0sstatepkgfile =3D bb.data.expand(sstatepkgdir + '/' + "${SSTATE_=
PKGSPEC}" + "*_" + ss['name'] + ".${SSTATE_PKG_SUFFIX}*", d)
> =A0 =A0 bb.note("Removing %s" % sstatepkgfile)
> =A0 =A0 oe.path.remove(sstatepkgfile)
>
> @@ -351,7 +357,7 @@ def sstate_package(ss, d):
> =A0 =A0 tmpdir =3D bb.data.getVar('TMPDIR', d, True)
>
> =A0 =A0 sstatebuild =3D bb.data.expand("${WORKDIR}/sstate-build-%s/" % ss=
['name'], d)
> - =A0 =A0sstatepkg =3D bb.data.getVar('SSTATE_PKG', d, True) + '_'+ ss['n=
ame'] + ".tgz"
> + =A0 =A0sstatepkg =3D bb.data.expand("${SSTATE_PKG}" + '_' + ss['name'] =
+ ".${SSTATE_PKG_SUFFIX}", d)
> =A0 =A0 bb.mkdirhier(sstatebuild)
> =A0 =A0 bb.mkdirhier(os.path.dirname(sstatepkg))
> =A0 =A0 for state in ss['dirs']:
> @@ -448,9 +454,9 @@ sstate_create_package () {
> =A0 =A0 =A0 =A0cd ${SSTATE_BUILDDIR}
> =A0 =A0 =A0 =A0# Need to handle empty directories
> =A0 =A0 =A0 =A0if [ "$(ls -A)" ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -czf ${SSTATE_PKG} *
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar --use-compress-program=3D${SSTATE_PKG_T=
ARZIPPROG} -cf ${SSTATE_PKG} *
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cz --file=3D${SSTATE_PKG} --files-from=
=3D/dev/null
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar --use-compress-program=3D${SSTATE_PKG_T=
ARZIPPROG} -c --file=3D${SSTATE_PKG} --files-from=3D/dev/null
> =A0 =A0 =A0 =A0fi
>
> =A0 =A0 =A0 =A0cd ${WORKDIR}
> @@ -463,7 +469,7 @@ sstate_create_package () {
> =A0sstate_unpack_package () {
> =A0 =A0 =A0 =A0mkdir -p ${SSTATE_INSTDIR}
> =A0 =A0 =A0 =A0cd ${SSTATE_INSTDIR}
> - =A0 =A0 =A0 tar -xvzf ${SSTATE_PKG}
> + =A0 =A0 =A0 tar --use-compress-program=3D${SSTATE_PKG_TARZIPPROG} -xvf =
${SSTATE_PKG}
> =A0}
>
> =A0BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> @@ -483,7 +489,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d):
> =A0 =A0 }
>
> =A0 =A0 for task in range(len(sq_fn)):
> - =A0 =A0 =A0 =A0sstatefile =3D bb.data.expand("${SSTATE_DIR}/" + sq_hash=
fn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
> + =A0 =A0 =A0 =A0sstatefile =3D bb.data.expand("${SSTATE_DIR}/" + sq_hash=
fn[task] + "_" + mapping[sq_task[task]] + ".${SSTATE_PKG_SUFFIX}", d)
> =A0 =A0 =A0 =A0 sstatefile =3D sstatefile.replace("${BB_TASKHASH}", sq_ha=
sh[task])
> =A0 =A0 =A0 =A0 if os.path.exists(sstatefile):
> =A0 =A0 =A0 =A0 =A0 =A0 bb.debug(2, "SState: Found valid sstate file %s" =
% sstatefile)
> @@ -508,7 +514,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d):
> =A0 =A0 =A0 =A0 =A0 =A0 if task in ret:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
>
> - =A0 =A0 =A0 =A0 =A0 =A0sstatefile =3D bb.data.expand("${SSTATE_DIR}/" +=
 sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
> + =A0 =A0 =A0 =A0 =A0 =A0sstatefile =3D bb.data.expand("${SSTATE_DIR}/" +=
 sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".${SSTATE_PKG_SUFFIX}", =
d)
> =A0 =A0 =A0 =A0 =A0 =A0 sstatefile =3D sstatefile.replace("${BB_TASKHASH}=
", sq_hash[task])
>
> =A0 =A0 =A0 =A0 =A0 =A0 srcuri =3D "file://" + os.path.basename(sstatefil=
e)
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiTsl-0004WY-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:40:07 +0100
Received: from mail37-am1-R.bigfish.com (10.3.201.247) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 16:32:45 +0000
Received: from mail37-am1 (localhost [127.0.0.1])	by mail37-am1-R.bigfish.com
	(Postfix) with ESMTP id 689954401E8	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:32:45 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail37-am1 (localhost.localdomain [127.0.0.1]) by mail37-am1
	(MessageSwitch) id 1325694765249673_5095;
	Wed,  4 Jan 2012 16:32:45 +0000 (UTC)
Received: from AM1EHSMHS014.bigfish.com (unknown [10.3.201.248])	by
	mail37-am1.bigfish.com (Postfix) with ESMTP id 375AF300054	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:32:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS014.bigfish.com
	(10.3.207.152) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 16:32:43 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 4 Jan 2012 10:32:42 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] linux-tools: add binutils to perf DEPENDS
Thread-Index: AQHMyv56pd2mJyYhX06Wx9EAgv0xIQ==
Date: Wed, 4 Jan 2012 16:32:41 +0000
Message-ID: <CAEsOVNdi_no+UZ9uigiM_U8BLwUDES=02bwdPKT7A+YGH7KqNg@mail.gmail.com>
References: <cover.1325640149.git.josh@linux.intel.com>
	<a8eea7c83f33f5d5eab1e2758a88f3ee140e68a1.1325640149.git.josh@linux.intel.com>
In-Reply-To: <a8eea7c83f33f5d5eab1e2758a88f3ee140e68a1.1325640149.git.josh@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 1/2] linux-tools: add binutils to perf DEPENDS
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
X-List-Received-Date: Wed, 04 Jan 2012 16:40:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A892ACBCEDF0474CBF6564D8A9C59A99@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2012 at 7:31 PM, Joshua Lock <josh@linux.intel.com> wrote:
> We have witnessed non-deterministic failures of perf for some platforms
> whilst looking for bfd.h, a header provided by binutils.
>
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
> =A0meta/recipes-kernel/linux/linux-tools.inc | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-ker=
nel/linux/linux-tools.inc
> index 950f197..aa45dba 100644
> --- a/meta/recipes-kernel/linux/linux-tools.inc
> +++ b/meta/recipes-kernel/linux/linux-tools.inc
> @@ -22,7 +22,7 @@ addtask install_perf after do_install before do_package
> =A0do_compile_perf[umask] =3D 022
> =A0do_install_perf[umask] =3D 022
>
> -PERFDEPENDS =3D "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}=
elfutils:do_populate_sysroot"
> +PERFDEPENDS =3D "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}=
elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"

Does this build the rpm for binutils too? I've seen the following
error recently when creating the rfs:

| error: Failed dependencies:
| 	binutils >=3D 2.21.1a is needed by perf-3.0.6-r2.p3060qds
| 	libbfd-2.21.1.so is needed by perf-3.0.6-r2.p3060qds

-M=




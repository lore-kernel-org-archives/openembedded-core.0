Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S29bs-0007hm-NH
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 00:04:00 +0100
Received: from mail15-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 22:55:33 +0000
Received: from mail15-va3 (localhost [127.0.0.1])	by mail15-va3-R.bigfish.com
	(Postfix) with ESMTP id E52251E051F	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 22:55:33 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail15-va3 (localhost.localdomain [127.0.0.1]) by mail15-va3
	(MessageSwitch) id 1330383331849492_25566;
	Mon, 27 Feb 2012 22:55:31 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.243])	by
	mail15-va3.bigfish.com (Postfix) with ESMTP id C0035E0049	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 22:55:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 22:55:30 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 27 Feb 2012 16:55:29 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] multilib.bbclass: allow
	TARGET_VENDOR_virtclass-multilib to be overriden
Thread-Index: AQHM9aLmWIqY6KZElEa7DCbn4B6BZw==
Date: Mon, 27 Feb 2012 22:55:29 +0000
Message-ID: <CAEsOVNe9iwAbQ8jFFTY8hVroy2nTm7-XauGgFyV+x_4DtFOxUg@mail.gmail.com>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
In-Reply-To: <1330371531-28803-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 1/4] multilib.bbclass: allow TARGET_VENDOR_virtclass-multilib to be overriden
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
X-List-Received-Date: Mon, 27 Feb 2012 23:04:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0FCE4598CB45734187F72FAC5C88006F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Per conversation with Saul on IRC - I'll push a branch to poky-contrib
for my 6 pending patches.

-M

On Mon, Feb 27, 2012 at 1:38 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> If we set this bit, we can override the ugly "pokymllib32" to back to
> "poky" (powerpc-pokymllib32-linux-gcc -> powerpc-poky-linux-gcc). I've
> left this unset by default, but can be set by adding the following:
>
> TARGET_VENDOR_virtclass-multilib-lib32 =3D "-poky"
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =A0meta/classes/multilib.bbclass | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclas=
s
> index 87d0cd4..61b7765 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -26,7 +26,8 @@ python multilib_virtclass_handler () {
> =A0 =A0 e.data.setVar("MLPREFIX", variant + "-")
> =A0 =A0 e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> =A0 =A0 e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.g=
etVar("SHLIBSDIR", False) + "/" + variant)
> - =A0 =A0e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.d=
ata.getVar("TARGET_VENDOR", False) + "ml" + variant)
> + =A0 =A0if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + variant, =
False) is None:
> + =A0 =A0 =A0 =A0 =A0 e.data.setVar("TARGET_VENDOR_virtclass-multilib-" +=
 variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
> =A0 =A0 e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ov=
erride)
> =A0}
>
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




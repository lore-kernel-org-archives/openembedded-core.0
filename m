Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAsNo-0004aZ-Q1
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 01:57:17 +0200
Received: from mail144-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 23:51:43 +0000
Received: from mail144-tx2 (localhost.localdomain [127.0.0.1])	by
	mail144-tx2-R.bigfish.com (Postfix) with ESMTP id D21668781F7	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 23:51:42 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail144-tx2 (localhost.localdomain [127.0.0.1]) by mail144-tx2
	(MessageSwitch) id 1317685845390402_10236;
	Mon,  3 Oct 2011 23:50:45 +0000 (UTC)
Received: from TX2EHSMHS029.bigfish.com (unknown [10.9.14.253])	by
	mail144-tx2.bigfish.com (Postfix) with ESMTP id 6C5571AA00A3	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 23:48:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS029.bigfish.com
	(10.9.99.129) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 23:48:29 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 18:48:29 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] Fix typo in meta/classes/sanity.bbclass
Thread-Index: AQHMgibzlr5dWtwVF0OgQMSBfYhJsw==
Date: Mon, 3 Oct 2011 23:48:28 +0000
Message-ID: <CAEsOVNdbpyesRT7UHdcXWMmp8fv1Wiyx6dUiTi40AVNgaOogGQ@mail.gmail.com>
References: <1317685187-9041-1-git-send-email-msm@freescale.com>
In-Reply-To: <1317685187-9041-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [RFC] Fix typo in meta/classes/sanity.bbclass
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
X-List-Received-Date: Mon, 03 Oct 2011 23:57:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5131301EB24B024EB2AAE07DC70F0203@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 6:39 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> Signed-off-by: Matthew McClintock <msm@freescale.com>

Whoops =3D)

> ---
> Not sure if this is correct but it looks like a typo, also
> there appears to be some issues with the fix as well
>
> =A0meta/classes/sanity.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 4067408..cf30927 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -169,7 +169,7 @@ def check_sanity_validmachine(e):
> =A0 =A0 =A0 =A0 messages =3D messages + 'TUNE_ARCH is unset. Please ensur=
e your MACHINE configuration includes a valid tune configuration file which=
 will set this correctly.\n'
>
> =A0 =A0 # Check TARGET_ARCH is set correctly
> - =A0 =A0if data.getVar('TARGE_ARCH', e.data, False) =3D=3D '${TUNE_ARCH}=
':
> + =A0 =A0if data.getVar('TARGET_ARCH', e.data, False) =3D=3D '${TUNE_ARCH=
}':
> =A0 =A0 =A0 =A0 messages =3D messages + 'TARGET_ARCH is being overwritten=
, likely by your MACHINE configuration files.\nPlease use a valid tune conf=
iguration file which should set this correctly automatically\nand avoid set=
ting this in the machine configuration. See the OE-Core mailing list for mo=
re information.\n'
>
> =A0 =A0 # Check TARGET_OS is set

After fixing this I see the following:

ERROR:  Poky's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    TARGET_ARCH is being overwritten, likely by your MACHINE
configuration files.
Please use a valid tune configuration file which should set this
correctly automatically
and avoid setting this in the machine configuration. See the OE-Core
mailing list for more information.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed

-M=




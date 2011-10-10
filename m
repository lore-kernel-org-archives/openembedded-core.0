Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RDKaJ-0005oR-5Q
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 20:28:19 +0200
Received: from mail17-va3-R.bigfish.com (10.7.14.244) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.22; Mon, 10 Oct 2011 18:22:37 +0000
Received: from mail17-va3 (localhost.localdomain [127.0.0.1])	by
	mail17-va3-R.bigfish.com (Postfix) with ESMTP id 996019B8357	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 18:22:37 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VS-17(zz9371Kdf9M1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail17-va3 (localhost.localdomain [127.0.0.1]) by mail17-va3
	(MessageSwitch) id 13182708768114_17528; Mon, 10 Oct 2011 18:21:16 +0000
	(UTC)
Received: from VA3EHSMHS033.bigfish.com (unknown [10.7.14.252])	by
	mail17-va3.bigfish.com (Postfix) with ESMTP id 041DD1B480E5	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 18:21:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS033.bigfish.com
	(10.7.99.43) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 10 Oct 2011 18:21:04 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Mon, 10 Oct 2011 13:21:03 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] Fix typo in meta/classes/sanity.bbclass
Thread-Index: AQHMgibzlr5dWtwVF0OgQMSBfYhJs5V2QiIA
Date: Mon, 10 Oct 2011 18:21:02 +0000
Message-ID: <CAEsOVNfpf97anznqn8ZqgOXmJEZp3sA4pK7aALT2w=3G2SjPbA@mail.gmail.com>
References: <1317685187-9041-1-git-send-email-msm@freescale.com>
	<CAEsOVNdbpyesRT7UHdcXWMmp8fv1Wiyx6dUiTi40AVNgaOogGQ@mail.gmail.com>
In-Reply-To: <CAEsOVNdbpyesRT7UHdcXWMmp8fv1Wiyx6dUiTi40AVNgaOogGQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2011 18:28:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <70DA0D07FBBC1146BC806DCF9BB30652@freescale.net>
Content-Transfer-Encoding: quoted-printable

Ping? Any comments?

-M

On Mon, Oct 3, 2011 at 6:48 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Oct 3, 2011 at 6:39 PM, Matthew McClintock <msm@freescale.com> wr=
ote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>
> Whoops =3D)
>
>> ---
>> Not sure if this is correct but it looks like a typo, also
>> there appears to be some issues with the fix as well
>>
>> =A0meta/classes/sanity.bbclass | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 4067408..cf30927 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -169,7 +169,7 @@ def check_sanity_validmachine(e):
>> =A0 =A0 =A0 =A0 messages =3D messages + 'TUNE_ARCH is unset. Please ensu=
re your MACHINE configuration includes a valid tune configuration file whic=
h will set this correctly.\n'
>>
>> =A0 =A0 # Check TARGET_ARCH is set correctly
>> - =A0 =A0if data.getVar('TARGE_ARCH', e.data, False) =3D=3D '${TUNE_ARCH=
}':
>> + =A0 =A0if data.getVar('TARGET_ARCH', e.data, False) =3D=3D '${TUNE_ARC=
H}':
>> =A0 =A0 =A0 =A0 messages =3D messages + 'TARGET_ARCH is being overwritte=
n, likely by your MACHINE configuration files.\nPlease use a valid tune con=
figuration file which should set this correctly automatically\nand avoid se=
tting this in the machine configuration. See the OE-Core mailing list for m=
ore information.\n'
>>
>> =A0 =A0 # Check TARGET_OS is set
>
> After fixing this I see the following:
>
> ERROR: =A0Poky's config sanity checker detected a potential misconfigurat=
ion.
> =A0 =A0Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
> =A0 =A0Following is the list of potential problems / advisories:
>
> =A0 =A0TARGET_ARCH is being overwritten, likely by your MACHINE
> configuration files.
> Please use a valid tune configuration file which should set this
> correctly automatically
> and avoid setting this in the machine configuration. See the OE-Core
> mailing list for more information.
>
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=




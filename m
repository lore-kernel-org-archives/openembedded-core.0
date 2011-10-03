Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAqld-00035e-6M
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 00:13:45 +0200
Received: from mail11-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 22:08:11 +0000
Received: from mail11-ch1 (localhost.localdomain [127.0.0.1])	by
	mail11-ch1-R.bigfish.com (Postfix) with ESMTP id AB70A14C8437	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 22:08:11 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail11-ch1 (localhost.localdomain [127.0.0.1]) by mail11-ch1
	(MessageSwitch) id 1317679691528839_28877;
	Mon,  3 Oct 2011 22:08:11 +0000 (UTC)
Received: from CH1EHSMHS025.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail11-ch1.bigfish.com (Postfix) with ESMTP id
	6C9BFAC0052 for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 22:08:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS025.bigfish.com
	(10.43.70.25) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 22:08:09 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 17:08:09 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate_clean() overzealous?
Thread-Index: AQHMghEWByaZDBNudkeuZ/nyp+AU3ZVrdXoAgAABXACAAAqcAA==
Date: Mon, 3 Oct 2011 22:08:08 +0000
Message-ID: <CAEsOVNcBdVBxef9OkOjwXP++XYieXOJnQSC95j5iDFkJX2g=Pg@mail.gmail.com>
References: <1317660469.13337.16.camel@phil-desktop>
	<CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
	<4E8A2828.7090202@intel.com>
	<CAEsOVNekGoGvTPOJKj1a+FDrYT-mWvF-T5AdcjQMEP6diDZhQQ@mail.gmail.com>
In-Reply-To: <CAEsOVNekGoGvTPOJKj1a+FDrYT-mWvF-T5AdcjQMEP6diDZhQQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Mon, 03 Oct 2011 22:13:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <21BA5FEA7F579C429EED522492235CFD@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 4:29 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> On Mon, Oct 3, 2011 at 4:24 PM, Saul Wold <saul.wold@intel.com> wrote:
>> I am not sure that's correct, since we use sstate with the Autobuilder a=
nd
>> it's shared across different hosts building different MACHINEs, we don't=
 see
>> the -natives getting build, do you have any examples?
>
> I'm building with targets that are not upstream, so I can't comment on
> the upstream variant. There are different TUNES though. I'm actually
> currently in the process of looking at why sstate-cache is not being
> reused.
>
> Can you point at the autobuilder stuff? Is it going from
> fsl-mpc8315e-rdb to and x86_64 target? Or between two x86_64 targets?

For example autoconf-native:

$ bitbake-diffsigs
../sstate-cache/sstate-autoconf-native-x86_64-linux-2.68-r2-x86_64-2-*sigin=
fo
[mattsm@right build_p5020ds_release (master *$)]$ bitbake-diffsigs
../sstate-cache/sstate-autoconf-native-x86_64-linux-2.68-r2-x86_64-2-*sigin=
fo
[snip]
basehash changed from bab02dfa833aca4810b0fae8c4ab48f9 to
e156f3fb86236bfc0262e6287bd73784
List of dependencies for variable baselib changed from
set(['BASELIB']) to set(['DEFAULTTUNE'])
Dependency on variable BASELIB was added
Dependency on Variable DEFAULTTUNE was removed
Variable baselib value changed from ${BASELIB} to
${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or
'INVALID'), True) or 'lib'}
Hash for dependent task
virtual:native:/local/home/mattsm/git/poky/meta/recipes-devtools/autoconf/a=
utoconf_2.68.bb.do_install
changed from e74616029727b6e61b00273425128f1d to
478e7900a2310f2669708e6909883865

Back tracking this appears to be a multilib issue since I have that
enabled on one of the -native packages:

../meta/conf/bitbake.conf:baselib =3D "${BASELIB}"
../meta/conf/multilib.conf:baselib =3D "${@d.getVar('BASE_LIB_tune-' +
(d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"

Which causes the other differences....

-M=




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RsSrz-0003bR-1z
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 06:36:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jan 2012 21:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="104840217"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2012 21:28:38 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 1 Feb 2012 13:28:25 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 1 Feb 2012 13:28:25 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Wed, 1 Feb 2012 13:28:24 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Darren Hart
	<dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v3 0/3] *** SUBJECT HERE ***
Thread-Index: AQHM4KAGDNOXy/46Oki2d1U8QNZo/ZYngpyw
Date: Wed, 1 Feb 2012 05:28:23 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0FCE97B9@SHSMSX102.ccr.corp.intel.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
	<CAOSpxdbF6t5z+GYirR4u3oa41Pd=UrFyQRKT1QSw1dLBRPBeEg@mail.gmail.com>
	<4F2840F5.9080908@linux.intel.com>
	<CAOSpxdYr19UF+P-hUAVMe0Q6=UrMujSmLWS4QV3xMkPCP17SNA@mail.gmail.com>
In-Reply-To: <CAOSpxdYr19UF+P-hUAVMe0Q6=UrMujSmLWS4QV3xMkPCP17SNA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] *** SUBJECT HERE ***
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 01 Feb 2012 05:36:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Here is my example of the steps after you source the environment and "git p=
ush" to poky-contrib.

Run: create-pull-request -b shane/typo -u origin-pc3 -r 238a47d800446996f5c=
b9929f33aaaffe618f7b6 -s "fix the typos for package report system"
Edit: the pull-3635/0000-XXXX file
Run: send-pull-request -p pull-3635 -t  openembedded-core@lists.openembedde=
d.org

--
Shane

Steve Sakoman wrote on=A02012-02-01:

> On Tue, Jan 31, 2012 at 11:28 AM, Darren Hart <dvhart@linux.intel.com>
> wrote:
>> Did you send this using the send-pull-request script? I assume not as
>> this was to oe-core and not yocto, but if you did, I want to know as it
>> should protect against -ENOCOFFEEYET errors such as these.
>=20
> No, I used git send-email.
>=20
> I'm not familiar with the send-pull-request script.  I wouldn't have
> guessed from the name that it is a mailing list patch submission
> script.  Is it hardwired to the yocto list?
>=20
>> For whatever it's worth, I use this script for all my projects now to
>> help avoid situations like this which I have fallen into more times than
>> I care to admit :-)
>=20
> Indeed, I very often catch myself forgetting to add the subject to the
> cover letter!  I'll have to investigate using the send-pull-request
> script.
>=20
> Steve
>=20
>> On 01/30/2012 09:17 AM, Steve Sakoman wrote:
>>> Sigh, my morning for screw-ups. =A0Time for another cup of coffee . . .
>>>=20
>>> The subject should be: 'zypper: support signed repositories' rather
>>> than '***SUBJECT HERE***' :-)
>>>=20
>>> Steve
>>>=20
>>> On Mon, Jan 30, 2012 at 9:14 AM, Steve Sakoman <steve@sakoman.com>
> wrote:
>>>> The current zypper implementation does not work with signed
>>>> repositories. This patch series adds recipes for the required
>>>> packages as well as the necessary runtime dependencies to zypper.
>>>>=20
>>>> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled
>>>> and a systemd based console image.
>>>>=20
>>>> Version 3 incorporates feedback from Koen Kooi and Saul Wold
>>>> =A0- adds runtime dependencies to existing RDEPENDS_${PN}
>>>> =A0- removes duplicate recipe for libassuan
>>>> =A0- moves recipes for gnupg and libksba to recipes-support
>>>>=20
>>>> Steve Sakoman (3):
>>>> =A0libksba: add recipe for 1.2.0
>>>> =A0gnupg: add recipe for 2.0.18
>>>> =A0zypper: add missing runtime dependences on gzip and gnupg
>>>>=20
>>>> =A0meta/recipes-extended/zypper/zypper_git.bb =A0 =A0| =A0 =A04 ++--
>>>> =A0meta/recipes-support/gnupg/gnupg_2.0.18.bb =A0 =A0| =A0 24
>>>> ++++++++++++++++++++++++
>>>> =A0meta/recipes-support/libksba/libksba_1.2.0.bb | =A0 10 ++++++++++ =
=A03
>>>> files changed, 36 insertions(+), 2 deletions(-) =A0create mode 100644
>>>> meta/recipes-support/gnupg/gnupg_2.0.18.bb =A0create mode 100644
>>>> meta/recipes-support/libksba/libksba_1.2.0.bb
>>>>=20
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>> Yocto Project - Linux Kernel
>=20
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core





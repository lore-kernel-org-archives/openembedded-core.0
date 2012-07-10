Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SocDb-0007LB-Av
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:19:16 +0200
Received: from mail115-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Jul 2012 14:50:37 +0000
Received: from mail115-va3 (localhost [127.0.0.1])	by
	mail115-va3-R.bigfish.com (Postfix) with ESMTP id 8D94EE04AE	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:50:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz98dI9371I1432Izz1202hzz8275eh8275bh8275dha1495iz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail115-va3 (localhost.localdomain [127.0.0.1]) by mail115-va3
	(MessageSwitch) id 1341931831211511_23828;
	Tue, 10 Jul 2012 14:50:31 +0000 (UTC)
Received: from VA3EHSMHS012.bigfish.com (unknown [10.7.14.247])	by
	mail115-va3.bigfish.com (Postfix) with ESMTP id 29BC132003F	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:50:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS012.bigfish.com
	(10.7.99.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 14:50:30 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Tue, 10 Jul 2012 09:52:48 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 2/2] libgomp: add libgomp (openmp)
	library, and build for powerpc targets by default
Thread-Index: AQHNXqurH5uQ7iE5lUGMIRKZkxsy1g==
Date: Tue, 10 Jul 2012 14:52:48 +0000
Message-ID: <CAEsOVNfy8ov=wccr2HuEP+jx6rfju3hnF1eGcXOdMuSCg8ScCg@mail.gmail.com>
References: <1341894563-32675-1-git-send-email-msm@freescale.com>
	<1341894563-32675-2-git-send-email-msm@freescale.com>
	<CAMKF1spJBYKoOYnBzFRDZ3ByfY9ifewx8i46e7ifuP=haLuZrw@mail.gmail.com>
In-Reply-To: <CAMKF1spJBYKoOYnBzFRDZ3ByfY9ifewx8i46e7ifuP=haLuZrw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Tue, 10 Jul 2012 15:19:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <80C5E8527C25EA41A9F6610BBB8A29E5@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 12:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jul 9, 2012 at 9:29 PM, Matthew McClintock <msm@freescale.com> wr=
ote:
>> +
>> +       # clean up extra libgomp files
>> +       if [[ "${RUNTIMETARGET}" =3D~ "libgomp" ]]; then
>
> This seems bashism.
>
> if could just check the valued of $d in the loop instead something like

v3 sent.

-M

>
>
>> +               rm -rf ${D}${datadir}/info/libgomp.info ${D}${datadir}/i=
nfo/dir
>> +               rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${=
TARGET_SYS}/${BINV}/finclude
>> +               rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
>> +       fi
>> +
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




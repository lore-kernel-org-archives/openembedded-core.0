Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RDfaA-000373-6U
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 18:53:34 +0200
Received: from mail115-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Tue, 11 Oct 2011 16:47:51 +0000
Received: from mail115-tx2 (localhost.localdomain [127.0.0.1])	by
	mail115-tx2-R.bigfish.com (Postfix) with ESMTP id B131B5703CC	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 16:47:51 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail115-tx2 (localhost.localdomain [127.0.0.1]) by mail115-tx2
	(MessageSwitch) id 1318351589994729_25866;
	Tue, 11 Oct 2011 16:46:29 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.243])	by
	mail115-tx2.bigfish.com (Postfix) with ESMTP id 7E629AA8373	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 16:44:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 11 Oct 2011 16:44:46 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.154]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Tue, 11 Oct 2011 11:44:45 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/6] Add new IMAGE_CLASSES variable for
	classes for image generation
Thread-Index: AQHMg7FtYqexAWTY0EGfrD7QF392mpVuwFwAgAAIzQCACO1TAA==
Date: Tue, 11 Oct 2011 16:44:45 +0000
Message-ID: <CAEsOVNcXS61xX3wCbG+Vy7KLkxsv=FRDAm1jA5i27GAxu0AuHA@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-3-git-send-email-msm@freescale.com>
	<CAEsOVNeNerChRP+bA8D354J2M+og5TPkWO9e_83rNLLbRZS4Jw@mail.gmail.com>
	<1317858811.6398.36.camel@ted>
	<CAEsOVNdG_O9ssO1HFsBwprmLyN=HjkyqrUg-Bp42aub7_SMhCQ@mail.gmail.com>
In-Reply-To: <CAEsOVNdG_O9ssO1HFsBwprmLyN=HjkyqrUg-Bp42aub7_SMhCQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/6] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Tue, 11 Oct 2011 16:53:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8D588EE8A6FC9E49803772146BC7C180@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 7:24 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
>> Its not expanding the variables? :/ This happened even when
>> IMAGE_CLASSES had a value before the inherit?
>
> If I added a IMAGE_CLASSES to something other than "" it worked fine.
> If I left it as "" it tried to expand the blank var and look in the
> BBPATHS or wherever it looks for classes for an unnamed ".bbclass"
> file.

>> IMAGE_CLASSES =3D "image_types"
>> inherit ${IMAGE_CLASSES}

Should I update this patch to look like the above? Tracking down the
bitbake issue will be a little more involved for me =3D)

-M=




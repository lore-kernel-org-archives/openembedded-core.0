Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TsUqn-0003BJ-UX
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 09:48:04 +0100
Received: from mail99.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 79067FF9642
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2013 09:30:48 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Jan 2013 10:17:11 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Jan 2013 10:17:09 +0200
Date: Tue, 8 Jan 2013 09:17:08 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Saul Wold <sgw@linux.intel.com>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Message-ID: <20130108091708.4f504be9@e6520eb>
In-Reply-To: <50EB8F3A.4090100@linux.intel.com>
References: <1357582015-16423-1-git-send-email-otavio@ossystems.com.br>
	<50EB5E25.2080204@linux.intel.com>
	<CAP9ODKqy4p045c045K6Smi391gK7cKW-jV-nmL66Ra2QUfQKXg@mail.gmail.com>
	<CAP9ODKpf_btTLPgK9SCW_-7Fdu+krj2zrkeds+erahoyLeHUPQ@mail.gmail.com>
	<50EB8F3A.4090100@linux.intel.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 15421732500271312281
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: about the oe-core layer' <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, 'Patches
Subject: Re: [PATCH] libnl: Fix building using flex
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 08:48:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Mon, 07 Jan 2013 19:15:06 -0800,
Saul Wold <sgw@linux.intel.com> a =C3=A9crit :

> On 01/07/2013 04:00 PM, Otavio Salvador wrote:
> > Looking at the error it seems it is using your distribution binary, not
> > the built one (for flex).
> >
> My bad, you patch was not in the first build I did, RP pulled it in=20
> after I started the build.  I am rebuilding MASTER now with your patch in.
>=20
OK forget my previous mail ;-)

Eric



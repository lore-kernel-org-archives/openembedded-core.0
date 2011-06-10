Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QV56O-0000iu-1B
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 19:02:32 +0200
Received: by wwb17 with SMTP id 17so2500339wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 09:59:10 -0700 (PDT)
Received: by 10.227.199.80 with SMTP id er16mr2347897wbb.78.1307725150632;
	Fri, 10 Jun 2011 09:59:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm2173941wbb.41.2011.06.10.09.59.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 09:59:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307723606.15712.213.camel@rex>
Date: Fri, 10 Jun 2011 18:59:07 +0200
Message-Id: <2A58CD3E-8647-4979-A292-77314022CF47@dominion.thruhere.net>
References: <cover.1307686598.git.sgw@linux.intel.com>
	<1307723606.15712.213.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [CONSOLIDATED PULL 0/4] 10-June
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
X-List-Received-Date: Fri, 10 Jun 2011 17:02:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jun 2011, om 18:33 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-06-09 at 23:26 -0700, Saul Wold wrote:
>> Kang Kai (1):
>>  ghostscript: update SRC_URI
>>=20
>> Nitin A Kamble (1):
>>  gcc: rebase the patch to avoid patch rejection
>=20
> This was a disaster. It breaks the build and is huge, thereby clogging
> up the source control system web interface etc.
>=20
> I applied it, then had to revert it. Please test things like this more
> carefully in future.
>=20
> I also think we need to put these kind of patches on the website or in =
a
> repo, we shouldn't be carrying them around in the main repo.

Having patches external to the layer is a recipe for failure, if you =
excude the pun. I've had to deal with patches disappearing/changing/etc =
a lot during the past months in the .dev world and I don't look forward =
to continuing those mistakes in the oe-core world.

regards,

Koen=



Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1T8Qxu-0001y9-I3
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 09:20:58 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q8378b6P019041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 3 Sep 2012 09:08:37 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q8378bTg019023;
	Mon, 3 Sep 2012 09:08:37 +0200
Date: Mon, 3 Sep 2012 09:08:37 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120903070836.GA18564@giant>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
	<1346422229-61628-2-git-send-email-bjst@enea.com>
	<98F0F262-DDBA-44BB-9DC5-8E4CFF354D59@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <98F0F262-DDBA-44BB-9DC5-8E4CFF354D59@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q8378b6P019041
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] Add -ptest package group
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
X-List-Received-Date: Mon, 03 Sep 2012 07:20:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> These have always been called ${PN}-tests, why the change?

When I discussed package testing informally before submitting patches, I =
found that some people tend to lump all types of testing into one big "Te=
st" bucket and get very confused.

By giving this concept a slightly less generic name, we can discuss it sp=
ecifically without confusing it with other types of tests.

The existing -tests recipes are, as far as I can see, standalone packages=
 that have little in common with each other. In contrast, -ptest packages=
 are designed to be more like -dev or -dbg packages in that they don't ha=
ve separate recipes and they share a common interface.

--=20
Bj=F6rn



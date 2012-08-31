Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1T7Umc-0005pc-FO
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 19:13:26 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q7VH16rr032085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 31 Aug 2012 19:01:06 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q7VH1684032083;
	Fri, 31 Aug 2012 19:01:06 +0200
Date: Fri, 31 Aug 2012 19:01:06 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120831170105.GA25179@giant>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
	<1346422229-61628-3-git-send-email-bjst@enea.com>
	<5040D8FE.3050506@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5040D8FE.3050506@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q7VH16rr032085
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Enable bash-ptest
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
X-List-Received-Date: Fri, 31 Aug 2012 17:13:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> You new patches still need patch headers with Upstream-Status and
> Signed-off-by tags.

Ouch, sorry about that. I added Signed-off but forgot upstream. I'll be m=
ore careful next time.

> Should this be a DISTRO or IMAGE FEATURE? I can see potential
> arguments for both sides, what was your thinking on choosing IMAGE
> over DISTRO?

I chose IMAGE since that is how the -dbg and -dev package groups are enab=
led, and -ptest is modeled after them. Also we have the EXTRA_IMAGE_FEATU=
RES setting that can be used to enable this temporarily while I don't kno=
w if we have anything similar for DISTRO_FEATURES?

--=20
Bj=F6rn



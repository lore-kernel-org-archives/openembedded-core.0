Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1QuQ-0002Tl-HF for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:47:54 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87MmneP030559 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:48:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A16dpZCdAHBg
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:48:49 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87MmjBg030555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:48:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110907090750.GE4181@chargestorm.se>
References: <cover.1315371835.git.sgw@linux.intel.com>
	<4E67114D.80507@eukrea.com>  <20110907090750.GE4181@chargestorm.se>
Date: Wed, 07 Sep 2011 23:42:42 +0100
Message-ID: <1315435362.13021.53.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p87MmneP030559
Subject: Re: [PATCH 0/1] Fix MakeMaker's finding of perl.real
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
X-List-Received-Date: Wed, 07 Sep 2011 22:47:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-09-07 at 11:07 +0200, Anders Darander wrote:
> * Eric B=C3=A9nard <eric@eukrea.com> [110907 08:41]:
> > Le 07/09/2011 07:09, Saul Wold a =C3=A9crit :
> > > When configuring cpan packages, the directories passed to MakeMaker=
 are the
> > > target directories. There was a patch that was applied to the nativ=
e perl
> > > to find perl.real and convert that to perl.  This does not apply fo=
r the
> > > target perl modules and therefore MakeMaker find perl.real.
> > >
> > > This patch to cpan configure modifies the Makefile after configure =
and
> > > changes the perl.real to just straight perl so we have the correct =
paths
> > > and shared state info in usable.
> > >
> > when sending 1 patch, is it possible to not use cover letter in order=
 to have
> > the explanation in the patch commit ?
> > That's easier to understand what the patch is doing when browsing log.
>=20
> Cover letter or not, the patch should include a commit message that
> explains the patch. It doesn't really matter if there is only one patch
> or a large patch series.
>=20
> For a single patch, the cover letter can be usefull to provide some
> extra information and discussion. In other cases, it can be pretty
> useless IMHO.

This commit has slipped into the tree this time but I agree in future
more explanation of a commit is needed...

Cheers,

Richard




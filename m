Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2539378430
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 12:12:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6SCCvi4003910
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 28 Jul 2017 05:12:58 -0700
Received: from yow-masselst-lx1.localnet (128.224.25.183) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Fri, 28 Jul 2017 05:12:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 28 Jul 2017 08:12:55 -0400
Message-ID: <4938657.TQb7MeHKJK@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-26-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <1501191547.22282.176.camel@linuxfoundation.org>
References: <1500912616-8012-1-git-send-email-mark.asselstine@windriver.com>
	<1501191547.22282.176.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python: don't include -tests with modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 12:12:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, July 27, 2017 10:39:07 PM EDT Richard Purdie wrote:
> On Mon, 2017-07-24 at 12:10 -0400, Mark Asselstine wrote:
> > Although 'test' is listed in the python module list
> > (https://docs.python.org/3/py-modindex.html) it is meant only to be
> > used 'internally' by folks developing python itself. Per the
> > documentation:
> >=20
> >   Note The test package is meant for internal use by Python only. It
> >   is documented for the benefit of the core developers of Python. Any
> >   use of this package outside of Python=E2=80=99s standard library is
> >   discouraged as code mentioned here can change or be removed without
> >   notice between releases of Python.
> >=20
> > Per the above it is best not to include this module to discourage
> > folks who might not head the above warnings. Additionally this module
> > is one of the largest py modules going, by dropping this unneeded
> > module from the 'modules' package we can reduce overall image size,
> > something which is important for many embedded deployments.
> >=20
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >  meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
> >  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> As per the comments at the top of these files, the generator scripts
> need to be fixed too?

I am just about to head into the wild with no internet access. I will have =
a=20
closer look at this on Monday. I have to admit I did not see the comment.

MarkA

>=20
> Cheers,
>=20
> Richard




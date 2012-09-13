Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1TC8aa-0003pS-EO
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 14:32:12 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q8DCJZfS009772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 13 Sep 2012 14:19:35 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q8DCJZYE009771;
	Thu, 13 Sep 2012 14:19:35 +0200
Date: Thu, 13 Sep 2012 14:19:35 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120913121935.GC18675@giant>
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
	<504FF70B.7060701@mlbassoc.com> <1347458928.11710.21.camel@ted>
	<CAMKF1so6qUDFMw_aOZTdC4W_Dh=rDiiC1O7pvjaUQS2xkG8xWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so6qUDFMw_aOZTdC4W_Dh=rDiiC1O7pvjaUQS2xkG8xWg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q8DCJZfS009772
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Thu, 13 Sep 2012 12:32:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:
> I agree but then 1.7 GB is noticeably huge too and it will only become
> larger in future so I don't think fetching from git will be a good solu=
tion
> for gcc ever.

Can we use shallow clones? A quick test of gcc-4.7 gave me a 308 MB tar.g=
z when cloned with --depth 1.

--=20
Bj=F6rn



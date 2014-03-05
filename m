Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D33B36EE31
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 13:24:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 05:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,593,1389772800"; d="scan'208";a="486446550"
Received: from maurorob-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.80])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2014 05:24:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Date: Wed, 05 Mar 2014 13:24:30 +0000
Message-ID: <3814042.TXeI6vvODN@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <531719E1.2080501@enea.com>
References: <cover.1394018657.git.paul.eggleton@linux.intel.com>
	<531719E1.2080501@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] gnutls fixes for master
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
X-List-Received-Date: Wed, 05 Mar 2014 13:24:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi David,

On Wednesday 05 March 2014 13:34:41 David Nystr=F6m wrote:
> On 2014-03-05 12:25, Paul Eggleton wrote:
> > Turns out we're using the same old version of gnutls in master as i=
n
> > dylan and dora, and we need a fix for a compile failure.
> >=20
> > The following changes since commit=20
82c773e88aaefd9321481ad297554d5b4a3ae0b2:
> >    Revert "ncurses: use ln -r to generate relative symlink" (2014-0=
3-03
> >    15:52:26 +0000)>=20
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib paule/gnutl=
s
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/=
log/?h=3D
> >    paule/gnutls>=20
> > Karl Hiramoto (2):
> >    gnutls: CVE-2014-0092 correct return codes
> >    gnutls: Fixed bug that prevented the rejection of v1 intermediat=
e CA
> >   =20
> >      certificates.
> >=20
> > Paul Eggleton (1):
> >    gnutls: fix failure during do_compile
>=20
> Any specific reasons why we still have the old gnuTLS-2.12.23 ?

I'm not sure - there's no NO_UPGRADE_REASON set in our inc files to sug=
gest=20
why. Googling turned this up:

 https://wiki.debian.org/gnutls3

Valentin, Saul - we probably ought to have NO_UPGRADE_REASON set for gn=
utls if=20
we have a good reason for staying with 2.12.x.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


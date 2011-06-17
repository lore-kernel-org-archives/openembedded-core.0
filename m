Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QXO7J-0000e4-II
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 03:45:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jun 2011 18:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,378,1304319600"; d="scan'208";a="14231899"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 16 Jun 2011 18:40:26 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 17 Jun 2011 09:40:00 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 17 Jun 2011 09:40:00 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 09:39:58 +0800
Thread-Topic: [OE-core] [PATCH 6/6] initscript: Change some order of init
	scripts
Thread-Index: AcwsCS75gqp5rn3zTVO3Mho2khU6VAAhbG1Q
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6721B4D@shsmsx501.ccr.corp.intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<24c31ebbed038d3dda2e9a0a97bcd9fe4fe89a8d.1308215406.git.dongxiao.xu@intel.com>
	<BANLkTikCyjfiANSyxgtwyt5vH6f2LjN7iQ@mail.gmail.com>
In-Reply-To: <BANLkTikCyjfiANSyxgtwyt5vH6f2LjN7iQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] initscript: Change some order of init	scripts
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
X-List-Received-Date: Fri, 17 Jun 2011 01:45:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Andrea Adami
> Sent: Thursday, June 16, 2011 5:38 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 6/6] initscript: Change some order of init =
scripts
>=20
> On Thu, Jun 16, 2011 at 11:20 AM, Dongxiao Xu <dongxiao.xu@intel.com>
> wrote:
> > Move udev script to execute ealier since module autoload needs it to
> > create device nodes.
> >
> > Also move sysfs before udev which has dependency on it.
> >
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> <snip>
>=20
> There was a drawback doing that: kernel modules loaded in unpredictable
> order:
>=20
> http://patches.openembedded.org/patch/1917/
>=20
> Is that still an issue?

Thanks for the reference.

In the above patch, modutils.sh is run before udevd. In such case, if an au=
toload module in modutils.sh needs to create a node under /dev/, this opera=
tion will fail since udevd is still not launched.
Therefore I move udevd before modutils.sh.

Thanks,
Dongxiao

>=20
> Regards
>=20
> Andrea
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



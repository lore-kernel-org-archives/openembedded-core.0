Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SRdE9-0001Zm-LR
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 07:44:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2012 22:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140164926"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2012 22:34:55 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 7 May 2012 22:34:55 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.133]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.6]) with mapi id
	14.01.0355.002; Tue, 8 May 2012 13:34:54 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] qt4: move functions from python to shell
	style
Thread-Index: AQHNIS8HBPyKMLD7l0uqRTDa92SDpZapR8EAgBYuQiA=
Date: Tue, 8 May 2012 05:34:53 +0000
Message-ID: <40776A41FC278F40B59438AD47D147A90FD70356@SHSMSX102.ccr.corp.intel.com>
References: <cover.1335171085.git.dongxiao.xu@intel.com>
	<acc4d645371a65f07543608cf607d0104fb1b854.1335171085.git.dongxiao.xu@intel.com>
	<2956480.HfgXetH5nE@helios>
In-Reply-To: <2956480.HfgXetH5nE@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4: move functions from python to shell style
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
X-List-Received-Date: Tue, 08 May 2012 05:44:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Tuesday, April 24, 2012 6:51 PM
> To: Xu, Dongxiao
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] qt4: move functions from python to she=
ll
> style
>=20
> Hi Dongxiao,
>=20
> On Monday 23 April 2012 16:53:02 Dongxiao Xu wrote:
> > In qt4's do_configure operation, it will refer to some variables that
> > are derived from 'd', however these variable values may be not correct
> > in multilib case since the extraction of these variables happens
> > before the multilib handler.
> >
> > The fix is to move these python style functions back to shell style.
>=20
> This patch removes qt4_arch.inc without explaining why. Can the fix be ma=
de
> without removing it?

Hi Paul,

In my new pull request, I keep the qt4_arch.inc file and put common functio=
ns there.
Thanks for your comments.

Thanks,
Dongxiao

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre



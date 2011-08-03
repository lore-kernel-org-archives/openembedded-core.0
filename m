Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QoVIw-00081H-5M
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 08:51:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2011 23:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,309,1309762800"; d="scan'208";a="34897571"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 23:47:22 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 3 Aug 2011 14:46:52 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Wed, 3 Aug 2011 14:46:51 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 3 Aug 2011
	14:46:50 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2011 14:46:49 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxRksUHPV5HUEo1RdeJBnpYPn+RlgAEfxvA
Message-ID: <1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
In-Reply-To: <4E38C941.30805@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Wed, 03 Aug 2011 06:51:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2011-08-03:
> On 08/02/2011 04:43 AM, Richard Purdie wrote:
>> On Tue, 2011-08-02 at 14:08 +0800, Dexuan Cui wrote:
>>> [YOCTO #671]
>>=20
> For a patch to address a relatively benign bug I thought the standard
> procedure would be for it to await feedback for more than 5 hours. I
I agree. :-)

> was hoping to have an opportunity to review this fix as I was working
> with the team in root causing the bug.
>=20
> + if [ -z "$BDIR" ]; then
> + if expr "$1" : '.*/$' >/dev/null; then echo >&2 "Error: please
> + remove any trailing / in the argument."
>=20
> This portion of the patch is really not necessary. There is no
> meaningful difference between the path with or without the trailing
> slash, a much simpler and less noisy solution would be to simply strip
> the trailing slash from the user input before doing the rest of the input=
 validation.
Hi Darren, thanks for the suggestion!
I considered the idea too, however, if we use the idea, it looks not that s=
imple to gracefully and concisely handle the case if a user (by accident or=
 by prank) passes / as $1 here, i.e., "readlink -f" would fail. So I didn't=
 do that.

Thanks,
-- Dexuan





Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWIiW-00052U-Eh
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 03:19:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2011 18:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="82000912"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 18:12:27 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 10:11:37 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Fri, 2 Dec 2011
	10:11:36 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 10:11:35 +0800
Thread-Topic: [OE-core] [PATCH 1/3] make: expand MAKEFLAGS before we re-exec
	after rebuilding makefiles.
Thread-Index: AcywFmeGUeCyTtbHQgSyRI0KhelaVAAgSqjw
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A785@shsmsx502.ccr.corp.intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
	<f0005eed49592dca75bd49a1cfc043d8dc252b37.1322731182.git.dexuan.cui@intel.com>
	<EE02ECC0-4FA3-4A4E-8AEE-54DBF3B631D4@dominion.thruhere.net>
	<1322736272.17484.100.camel@ted>
In-Reply-To: <1322736272.17484.100.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] make: expand MAKEFLAGS before we re-exec after rebuilding makefiles.
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
X-List-Received-Date: Fri, 02 Dec 2011 02:19:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-12-01:
> On Thu, 2011-12-01 at 10:22 +0100, Koen Kooi wrote:
>> Op 1 dec. 2011, om 10:21 heeft Dexuan Cui het volgende geschreven:
>>=20
>>> This patch was got from the upstream cvs repo of make to fix the
>>> bug of
>>> make-3.82: http://savannah.gnu.org/bugs/?30723
>>>=20
>>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com> ---
>>> .../make/make-3.82/expand_MAKEFLAGS.patch          |   39
>>> ++++++++++++++++++++ meta/recipes-devtools/make/make_3.82.bb         =20
>>>  |    4 ++- 2 files changed, 42 insertions(+), 1 deletions(-) create
>>> mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
>>>=20
>>> diff --git
>>> a/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
>>> b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch new file
>>> mode 100644 index 0000000..4184937 --- /dev/null +++
>>> b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch @@ -0,0
>>> +1,39 @@ +Upstream-Status: Inappropriate [The fix is already in
>>> upstream +cvs repo, but not in the stable release]
>>=20
>> Isn't 'backport' a better description than 'inappropriate'?
>=20
> Agreed, I've taken this patch but changed the patch status to backport.
Thanks a lot, Richard and Koen!

Thanks,
-- Dexuan





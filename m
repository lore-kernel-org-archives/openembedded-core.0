Return-Path: <belen.barros.pena@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A17666612D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 11:38:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2015 03:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; 
   d="scan'208";a="6794477"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by fmsmga004.fm.intel.com with ESMTP; 03 Dec 2015 03:38:09 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.163]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.95]) with mapi id
	14.03.0248.002; Thu, 3 Dec 2015 11:38:08 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] Patchwork & patch handling improvements
Thread-Index: AQHRLb8U1sSqAErXnUuHUaQDB1Le9A==
Date: Thu, 3 Dec 2015 11:38:07 +0000
Message-ID: <D285D8D6.6C150%belen.barros.pena@intel.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
In-Reply-To: <20151202180440.GC2248@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.5.8.151023
x-originating-ip: [10.237.224.81]
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Lespiau,
	Damien" <damien.lespiau@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 03 Dec 2015 11:38:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D38BF4954A079B4486D5500582E67C22@intel.com>
Content-Transfer-Encoding: quoted-printable



On 02/12/2015 18:04, "Martin Jansa" <martin.jansa@gmail.com> wrote:

>>>>My only concern is about migrating current database, do you know if the
>>>>migration will keep the database
>>I don't know, but I can find out.

I've been told that database migration will work from the version of
Patchwork OE is currently using to the version of Patchwork being used by
FDO.=20

>>>>including bundles

Yes, including bundles :)

>>If we remove the bundles, then I guess the migration might not keep the
>>bundles.=20
>
>OK, then can we please postpone this upgrade (or run both patchworks in
>parallel) until these 2 features are implemented and working?
>
>I'm depending on bundles heavily, to "mark" the patches for layers with
>dedicated maintainer and also for extra "status" like merged in
>"master-next" branch for jenkins build, because standard status values
>aren't fine-grained enough.

Fair enough. Maybe we should consider keeping bundles then.

Cheers

Bel=E9n



Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RdFVp-0003BD-IY
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 07:18:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2011 22:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88792013"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2011 22:11:40 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 14:10:45 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 21 Dec 2011 14:10:44 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 21 Dec 2011 14:10:44 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:10:42 +0800
Thread-Topic: [OE-core] [PATCH 0/1] [RESEND]Create a script for SUMMARY
	audit in recipes
Thread-Index: Acy/o89qWfD0xYNWTbqgMrh2dA4oBgAAy2OA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED757FB6@shsmsx501.ccr.corp.intel.com>
References: <cover.1324441819.git.shane.wang@intel.com>
	<4EF17275.6080202@linux.intel.com>
In-Reply-To: <4EF17275.6080202@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] [RESEND]Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Wed, 21 Dec 2011 06:18:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on=A02011-12-21:

> On 12/20/2011 08:32 PM, Shane Wang wrote:
>> Here is the script to check which recipe provides SUMMARY and which
>> doesnot. For those which do not, maintainer should add or update to a
>> meaningful summary for HOB to display in description.
>>=20
> Shane,
>=20
> I guess I am not understanding why this is needed.  Why can't we use
> DESCRIPTION which is a required entry?  Use the first X Characters of
> DESCRIPTION?
>=20
> Sau!

OK, then HOB has a bug. To use DESCRIPTION instead of SUMMARY. I am OK with=
 that.
Josh, Dongxiao, did you see any problem if I change that?

--
Shane



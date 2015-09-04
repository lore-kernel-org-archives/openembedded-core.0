Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA7E77040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:46:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 06:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="555236343"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2015 06:46:44 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
	IRSMSX107.ger.corp.intel.com (163.33.3.99) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 14:46:44 +0100
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.97]) by
	irsmsx111.ger.corp.intel.com ([169.254.2.19]) with mapi id
	14.03.0224.002; Fri, 4 Sep 2015 14:46:44 +0100
From: "Musat, George L" <george.l.musat@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] oeqa/decorators: Fixed a problem with tests
	having the same names.
Thread-Index: AQHQ5xaFbRKPQ7prJ0K38b/MTXTWrp4sT6GAgAASLTA=
Date: Fri, 4 Sep 2015 13:46:44 +0000
Message-ID: <042E875E1B5D414CA9BB78B7D4FA691C28833283@IRSMSX107.ger.corp.intel.com>
References: <1441373587-27103-1-git-send-email-george.l.musat@intel.com>
	<2479070.4L73SyIo8I@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2479070.4L73SyIo8I@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/decorators: Fixed a problem with tests having the same names.
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
X-List-Received-Date: Fri, 04 Sep 2015 13:46:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,=20

Forgot about that, thanks.

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Friday, September 4, 2015 4:41 PM
To: Musat, George L
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/decorators: Fixed a problem with tests =
having the same names.

Hi Lucian,

On Friday 04 September 2015 16:33:07 Lucian Musat wrote:
> When two or more tests had the same name but different classes then=20
> the decorator log whould have the output all wrong. This was because a=20
> comparison which was made only between method names but now it=20
> compares classes too.
>=20
> Bug #8029

The correct way to reference a Yocto Project Bugzilla entry that's fixed by=
 a bug is [YOCTO #xxxx] i.e. here you would use [YOCTO #8029].

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


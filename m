Return-Path: <max.eliaser@intel.com>
X-Greylist: delayed 634 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 17:42:57 UTC
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 135C26A57B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 17:42:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 May 2014 10:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1060,1389772800"; d="scan'208";a="539754096"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by fmsmga002.fm.intel.com with ESMTP; 15 May 2014 10:29:50 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 15 May 2014 10:29:50 -0700
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX154.amr.corp.intel.com ([169.254.11.72]) with mapi id
	14.03.0123.003; Thu, 15 May 2014 10:29:50 -0700
From: "Eliaser, MaX" <max.eliaser@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/3] Add texinfo-dummy-native recipe w/
	scripts to stand in for Texinfo utils.
Thread-Index: AQHPb7zgJU5Yf/71MESjGhjruanHbZtCKg+A//+8dQ0=
Date: Thu, 15 May 2014 17:29:49 +0000
Message-ID: <E88D0531F83F3744B03D1A909A2B070F5BA0C6@ORSMSX110.amr.corp.intel.com>
References: <50a2c132892ea8660f03f8cde3265599f79f2dd8.1400103108.git.max.eliaser@intel.com>
	<4607c274a894441baa289f2eaf8eb5f773d1cc35.1400103108.git.max.eliaser@intel.com>,
	<5374CF4F.80508@linux.intel.com>
In-Reply-To: <5374CF4F.80508@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] Add texinfo-dummy-native recipe w/ scripts to stand in for Texinfo utils.
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
X-List-Received-Date: Thu, 15 May 2014 17:43:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure, I could do that. My understanding of the convention was that there wa=
s one directory per upstream project, and all the different recipes in that=
 directory implemented different targets or versions of that upstream proje=
ct-- is that not correct?

-Max
________________________________________
From: Saul Wold [sgw@linux.intel.com]
Sent: Thursday, May 15, 2014 7:29 AM
To: Eliaser, MaX; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] Add texinfo-dummy-native recipe w/ scrip=
ts to stand in for Texinfo utils.

I think these should live in texinfo instead of adding a new
texinfo-dummp-native directory?

Sau!



Return-Path: <max.eliaser@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 23ABF6FE7D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 18:40:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2014 11:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,472,1400050800"; d="scan'208";a="547683510"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2014 11:40:24 -0700
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.160]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.226]) with mapi id
	14.03.0123.003; Fri, 13 Jun 2014 11:40:24 -0700
From: "Eliaser, MaX" <max.eliaser@intel.com>
To: Gary Thomas <gary@mlbassoc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] textinfo failure
Thread-Index: AQHPhy2ai+tCaB1WYkqOW+vA1jvzUptvyYoA//+VG40=
Date: Fri, 13 Jun 2014 18:40:24 +0000
Message-ID: <E88D0531F83F3744B03D1A909A2B070F5C52D6@ORSMSX110.amr.corp.intel.com>
References: <20140613163159.GO27324@denix.org>, <539B3C18.1090701@mlbassoc.com>
In-Reply-To: <539B3C18.1090701@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Subject: Re: textinfo failure
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
X-List-Received-Date: Fri, 13 Jun 2014 18:40:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is by design. -native and -cross recipes are supposed to run with the
texinfo-dummy-native utils. This results in a tidy little performance boost=
=20
because the actual work of formatting the docs is not done. Meanwhile, the=
=20
target arch and sdk recipes use the host system's texinfo as before.=20

-Max Eliaser
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Gary Thomas [gary@mlbassoc.com]
Sent: Friday, June 13, 2014 10:59 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] textinfo failure

Odd - I just built it in a clean tree with Poky/Yocto master
rev 8e0c54cd0e82ffe120f84f495101cd29e6fd06bf.

What did you do to get that 'texinfo-dummy-native' version installed?
None of my builds end up with makeinfo in sysroots.

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


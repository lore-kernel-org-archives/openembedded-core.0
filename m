Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E44F6AECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:32:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2013 03:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="343875253"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2013 03:32:57 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.127]) with mapi id
	14.03.0123.003; Thu, 11 Jul 2013 11:31:19 +0100
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 4/4] zip: rename recipe
Thread-Index: AQHOfIEz3qmzfSPXQ0K23x5nPNGEuJlfNx2AgAATHcc=
Date: Thu, 11 Jul 2013 10:31:18 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3022C9956@IRSMSX105.ger.corp.intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
	<c100a9e3184984c52b4c8743039537711123b5fb.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>,
	<CAJTo0La0gTguJVoZNY57B4XfDKHY8y4BjBrozA3ChNwkCHmeiA@mail.gmail.com>
In-Reply-To: <CAJTo0La0gTguJVoZNY57B4XfDKHY8y4BjBrozA3ChNwkCHmeiA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] zip: rename recipe
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
X-List-Received-Date: Thu, 11 Jul 2013 10:32:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,=0A=
=0A=
I'm looking at an alternative solution.=0A=
=0A=
Thanks,=0A=
Ema=0A=
________________________________________=0A=
From: Burton, Ross [ross.burton@intel.com]=0A=
Sent: Thursday, July 11, 2013 1:21 PM=0A=
To: Ciobanu, Emilia Maria Silvia=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH 4/4] zip: rename recipe=0A=
=0A=
On 9 July 2013 09:57, Emilia Ciobanu=0A=
<emilia.maria.silvia.ciobanu@intel.com> wrote:=0A=
> Current local version is 30.=0A=
=0A=
Explaining why this has to happen would be useful.  I presume the=0A=
situation is that the package report system is reporting updates=0A=
because upstream is at version "30" but we're at "3.0", when the=0A=
reality is that upstream is sticking to 8+3 filenames so drops the=0A=
dots in the version number.=0A=
=0A=
I'm not sure making our packages have the wrong version just because=0A=
upstream tarballs versions are mangled is wise.  Can we extend the PRS=0A=
so that it can transform the PV before comparing it to upstream?=0A=
=0A=
Ross=0A=


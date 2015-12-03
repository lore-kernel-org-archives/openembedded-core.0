Return-Path: <belen.barros.pena@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 467446FF76;
	Thu,  3 Dec 2015 11:43:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 03 Dec 2015 03:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="853045413"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2015 03:43:32 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.163]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.13]) with mapi id
	14.03.0248.002; Thu, 3 Dec 2015 11:43:29 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [Openembedded-architecture] [OE-core] Patchwork & patch
	handling improvements
Thread-Index: AQHRLb/UyuUaMiBTQUSdAZfj41Dqhg==
Date: Thu, 3 Dec 2015 11:43:29 +0000
Message-ID: <D285DA30.6C15E%belen.barros.pena@intel.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
	<CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
In-Reply-To: <CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.5.8.151023
x-originating-ip: [10.237.224.81]
MIME-Version: 1.0
Cc: "Lespiau, Damien" <damien.lespiau@intel.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 03 Dec 2015 11:43:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CF00C2623EF19840B0B8307D79BFE127@intel.com>
Content-Transfer-Encoding: quoted-printable



On 02/12/2015 18:43, "Burton, Ross" <ross.burton@intel.com> wrote:

>
>On 2 December 2015 at 18:04, Martin Jansa
><martin.jansa@gmail.com> wrote:
>
>I'm depending on bundles heavily, to "mark" the patches for layers with
>dedicated maintainer and also for extra "status" like merged in
>"master-next" branch for jenkins build, because standard status values
>aren't fine-grained enough.
>
>
>
>
>Sounds like instead of bundles the new patchworks needs the ability for a
>single list to represent multiple projects (so there'd be a meta-oe,
>meta-python, etc),

That's already in place

https://github.com/dlespiau/patchwork/issues/15

>and more status values.

You can add status values (to the db directly or via the Django admin
interface), but they will apply to all projects in the Patchwork instance.
Ideally you should be able to set a list of status values per project I
guess.=20

Cheers

Bel=E9n

>
>
>Ross
>



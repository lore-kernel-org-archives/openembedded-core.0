Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1C8C6AF46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 07:16:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2013 00:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1042,1363158000"; d="scan'208";a="343794767"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2013 00:16:42 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 11 Jul 2013 08:15:20 +0100
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.204]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.147]) with mapi id
	14.03.0123.003; Thu, 11 Jul 2013 08:15:19 +0100
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] insane.bbclass: Added QA warning for
	shipping /usr/share/info/dir
Thread-Index: AQHOdkYfPA+iMFQ9M0ONUA7gG/gRkZlP15wAgA3wo4CAAVRdMA==
Date: Thu, 11 Jul 2013 07:15:18 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF15E6687B@IRSMSX101.ger.corp.intel.com>
References: <cover.1372674367.git.mihai.prica@intel.com>
	<2ee8976b4ad482eafb186deba9a14fc52f6dc8cf.1372674367.git.mihai.prica@intel.com>
	<CAJTo0LbWDHqUoaks86RrGMSnKyN+fw-cxShpFpr=DT-sOGbvxQ@mail.gmail.com>
	<20130710114405.GZ3288@jama>
In-Reply-To: <20130710114405.GZ3288@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA warning for shipping /usr/share/info/dir
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
X-List-Received-Date: Thu, 11 Jul 2013 07:16:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

> -----Original Message-----
>=20
> On Mon, Jul 01, 2013 at 03:51:26PM +0100, Burton, Ross wrote:
> > On 1 July 2013 11:31, Mihai Prica <mihai.prica@intel.com> wrote:
> > > /usr/share/info/dir should be generated at install time in a postinst=
.
> > > Added QA warning to check at build time for this file. The warning
> > > is disabled by default.
> >
> > Patch is good but why don't we enable this by default?

Sorry for the responding so late but I've missed this mail. I've looked at
master and Paul already enabled this check.

Thanks,
Mihai

>=20
> FWIW: this is list of QA issues found with this check in my world builds:
>=20
> gcc-4.8.1: The /usr/share/info/dir file is not meant to be shipped in a p=
articular
> package.
> ed-1.7: The /usr/share/info/dir file is not meant to be shipped in a part=
icular
> package.
> emacs-23.4: The /usr/share/info/dir file is not meant to be shipped in a =
particular
> package.
> quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped i=
n a
> particular package.
> lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a p=
articular
> package.
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


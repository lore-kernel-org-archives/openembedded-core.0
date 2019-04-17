Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id D5DC67D01C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:57:59 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3H9vxZb024891
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 17 Apr 2019 11:57:59 +0200
Received: from DEFTHW99ERHMSX.ww902.siemens.net
	(defthw99erhmsx.ww902.siemens.net [139.22.70.133])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x3H9vl9F012184
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 17 Apr 2019 11:57:59 +0200
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.89]) by
	DEFTHW99ERHMSX.ww902.siemens.net ([139.22.70.133]) with mapi id
	14.03.0435.000; Wed, 17 Apr 2019 11:57:51 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Adrian Bunk <bunk@stusta.de>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
Thread-Index: AQHU9QMNTJYhiK91BEOI4Cze8jG6T6ZAHQjA
Date: Wed, 17 Apr 2019 09:57:50 +0000
Message-ID: <355BE46A91031048906B695426A8D8E62EA3AE12@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
	<eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
	<20190417093520.GA895@localhost>
	<fdc87321d0cba27741ae1b9e1dde703e42683fa2.camel@linuxfoundation.org>
	<20190417095029.GB895@localhost>
In-Reply-To: <20190417095029.GB895@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
x-originating-ip: [139.22.70.9]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add git-lfs to	HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 09:58:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > > Your "everyone has to install it" worry misses the much bigger
> > > problem that git-lfs is a relatively new tool and not available in
> > > distributions like Debian 9 or Ubuntu 16.04.
> >
> > Someone could certainly write a native recipe for lfs and add that as
> > a dependency which would also solve this problem. I'd be quite happy
> > to see that and it would neatly solve the problems.
>=20
> This was also my first thought.
>=20
> It stops being neat once you realize that it requires packaging a 3 digit
> number of Go libraries.

I don't think that's how go packaging works. Go usually statically links ev=
erything at compile time and bundles the sources with modules.
So from a yocto point of view you only need to create one recipe with every=
thing inside. Have a look at the dependency of the Debian package of git-lf=
s [1] they are very minimal.

I havent' tried but maybe devtool might produce something useful very quick=
ly.

Pascal

[1] https://packages.debian.org/sid/git-lfs



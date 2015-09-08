Return-Path: <prvs=686ec4387=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 76DD176B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:49 +0000 (UTC)
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 Sep 2015 12:39:49 +0200
Received: from unknown (HELO esabb1.muc) ([160.50.100.31]) by esagw5.muc with
	ESMTP/TLS; 08 Sep 2015 12:39:49 +0200
Received: from smuch58b.muc (HELO SMUCH58B.europe.bmw.corp) ([160.46.137.108])
	by esabb1.muc with ESMTP/TLS; 08 Sep 2015 12:39:47 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH58B.europe.bmw.corp ([160.46.137.108]) with mapi id 14.03.0248.002;
	Tue, 8 Sep 2015 12:39:47 +0200
From: <Mikko.Rapeli@bmw.de>
To: <mike.looijmans@topic.nl>
Thread-Topic: [OE-core] Getting rid of "The license listed internal was not
	in the licenses collected" warnings?
Thread-Index: AQHQtWFE4cV8Sr+dsEyawNT+O9yqyp4xH72AgAAcjwCAAE6QgIABDe4AgAAat4CAAAR6AA==
Date: Tue, 8 Sep 2015 10:39:46 +0000
Message-ID: <20150908103552.GE8427@loska>
References: <55963864.2030604@topic.nl> <55ED6393.6050906@topic.nl>
	<CAHiDW_GfhUoDMBtwbj2G8RbRnA7OWR_3b_M_tDc-hEz8g4NqYw@mail.gmail.com>
	<55EDBD6F.7090900@topic.nl>
	<CAHiDW_GPgMLsLbASU4qHCHY65E9OWK3G3BgTpq=vAd8tsPDNbg@mail.gmail.com>
	<55EEB647.7000101@topic.nl>
In-Reply-To: <55EEB647.7000101@topic.nl>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Getting rid of "The license listed internal was not in the licenses collected" warnings?
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <692950C8924CB2409F119AC5B706EC27@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 12:19:51PM +0200, Mike Looijmans wrote:
> Ah, wait, on closer inspection it actually exists, but it's a symlink to
> some none-existing location. Apparently, to save some diskspace and reduc=
e
> maintenance on text files I linked a few files together. Somehow, the lin=
k
> got copied instead of the file contents.
>
> I un-symlinked the "internal" file, and (together with some forced rebuil=
ds)
> that finally made the warning go away.

Since I had similar stupid-user moments too, there is a generic function in
sanity tests to check for broken symlinks. Would be great if you could add
license files to this check.

-Mikko=


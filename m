Return-Path: <prvs=14209d993=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86A0A7F2FD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1567489848; x=1599025848;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=udEHiHE0n536KfSvcdvVq3C3MTyt35exlHoL2V6NvcI=;
	b=SqnjfxDh2VpxJYYSsuOKtwdmDu5NIVacBu4eGtsBEmd7H8JHy51mpcsW
	JKOfCMUtroGlv5NRzcejnxlBQY+uXGT+5GoTXOO0KC3aGetMl92Rfcv+u
	keiWWDQY2/u/7WKNkjg+lqer4yPpaZa2t2xb1BJpEiW59SGO5nqQ75RiI o=;
IronPort-SDR: 2pFlXi/IUADGvAoAN+P2NR3cQCociG+yRexKukm4fFwcpmfdV0zFo4bhlYLGl0luvFhp19u+JB
	aSmnvzIk7JNZ87BsbI5ZknteDAx2FrfL+xAxLGucjbBXKilmHq+Doxyu3NUY2RPAuwQW36Sj7A
	Itnp0w+1/ijQXljY7K9OtvdgJE+1OSwady9Uy9HeLxD3oOBHDgeKRw7f0N5m+L3Q8j82+XHQun
	G8kwudNzd3KOicoVY5TCvEXnYPOYTl2cHJY+h44wtUgAN+hMNk/nGj3dYOt3o70BYCLmiWo6Xw
	BBQ=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 03 Sep 2019 07:50:21 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw3.muc with ESMTP/TLS;
	03 Sep 2019 07:50:20 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb5.muc with ESMTP/TLS; 03 Sep 2019 07:50:20 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Tue, 3 Sep 2019 07:50:19 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 3 Sep 2019 07:50:19 +0200
From: <Mikko.Rapeli@bmw.de>
To: <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH] gcc-9.2: Security fix for CVE-2019-14250
Thread-Index: AQHVYEFTMP2p0XpqaEien6/lxkeWracWuqQAgAAyt4CAAUewgIAAlOoAgACK8IA=
Date: Tue, 3 Sep 2019 05:50:19 +0000
Message-ID: <20190903055019.GC7889@hiutale>
References: <20190831211549.23729-1-akuster808@gmail.com>
	<20190901140542.GA11574@localhost>
	<9b09243d-86b7-b358-e0be-c41f8acbcd47@gmail.com>
	<20190902124003.GA8291@localhost>
	<438c075e-9284-0eac-5aa0-9599d5c8dffe@gmail.com>
In-Reply-To: <438c075e-9284-0eac-5aa0-9599d5c8dffe@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.38]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, bunk@stusta.de
Subject: Re: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Tue, 03 Sep 2019 05:50:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <145F80EC216DB64C9FC3A304D0389A52@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 02:33:02PM -0700, akuster808 wrote:
>=20
>=20
> On 9/2/19 5:40 AM, Adrian Bunk wrote:
> > On Sun, Sep 01, 2019 at 10:07:13AM -0700, akuster808 wrote:
> >>
> >> On 9/1/19 7:05 AM, Adrian Bunk wrote:
> >>> thud and zeus are providing 2 gcc versions each that need fixing.
> >> That is a true statement. What are you expecting?
> > The other versions also being fixed?
> >
> > gcc-8 being fixed in warrior before it gets fixed in master would be
> > the wrong order, and would introduce a security regression in master.
> sent a patch. hope it is what is meant by the above.
>=20
> >
> > The code should be nearly identical in warrior and master, so fixing
> > this also in gcc-8 in master should be trivial.
> >
> > Fixing gcc-7 in thud would be a bonus.

FWIW, gcc-7-branch of https://github.com/gcc-mirror/gcc.git has this fix al=
ready.

-Mikko

commit 740d8b3baeea47cd5407be1752c5159223f77042
Author:     rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
AuthorDate: Thu Jul 25 10:50:47 2019 +0000
Commit:     rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
CommitDate: Thu Jul 25 10:50:47 2019 +0000

    2019-07-25  Richard Biener  <rguenther@suse.de>
   =20
        PR lto/90924
        Backport from mainline
        2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
   =20
        * simple-object-elf.c (simple_object_elf_match): Check zero value
        shstrndx.
   =20
   =20
    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@273795 =
138bc75d-0d04-0410-961f-82ee72b054a4

diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
index b785e71..0ecdec0 100644
--- a/libiberty/ChangeLog
+++ b/libiberty/ChangeLog
@@ -1,3 +1,12 @@
+2019-07-25  Richard Biener  <rguenther@suse.de>
+
+       PR lto/90924
+       Backport from mainline
+       2019-07-12  Ren Kimura  <rkx1209dev@gmail.com>
+
+       * simple-object-elf.c (simple_object_elf_match): Check zero value
+       shstrndx.
+
 2018-12-06  Release Manager
=20
        * GCC 7.4.0 released.


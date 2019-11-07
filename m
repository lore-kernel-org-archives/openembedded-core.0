Return-Path: <prvs=20756b77e=Mikko.Rapeli@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id EB4F57ECA7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573128834; x=1604664834;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=fmQzRePLsDaIc6eyaLwoYyL2Vif6FKqDPBV4tNuSlZQ=;
	b=kCKd3Z0uSlnDuobzpUCspZUyCug3PYe+B/iABFwAVc1dHX3tjH6nKtXs
	5yxuYoz5Ny8TNGi6wLGt1sKObe9liJcY5BK9HPDTnmFFi4h87FZM4/3Vm
	6gdqI+cVXfovi8ilVNEbzMdCpSSI9YKmsKNP4CsCrSnULDGPF36KOu/59 4=;
IronPort-SDR: sNFn7miaamT6wpWlJk8GxC8bNTXvFQJfYwnL+UwZiwZImLIk6RVdZyo+h8myIyEPYCIz6eeFdL
	ccXfm/0p80SWteX7IhsJVvQ/+19l5jvXg2ECc8TUKYcH/storqsR8VNx4i/KDyWFrJxK009hUk
	TOd1LpUGqo5b2xatBlrwmlfkdejUhhQy/TyG63+rYwtZF74XIhbisl3CVal6J2tjv9DPcej+Ne
	kJV0Ty+Vab+T9nw0CYbpj6tsnjBunmp8T3HdD2SIAkSnTvIrktscF4X28Pc6jHqgp+RKptFQsR
	tUE=
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 07 Nov 2019 13:13:53 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
	07 Nov 2019 13:13:52 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb3.muc with ESMTP/TLS; 07 Nov 2019 13:13:52 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Thu, 7 Nov 2019 13:13:51 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 7 Nov 2019 13:13:51 +0100
From: <Mikko.Rapeli@bmw.de>
To: <bunk@stusta.de>
Thread-Topic: [OE-core] [PATCH RFC CFH][sumo 00/47] CVE check backport
Thread-Index: AQHVlLhK4pyyLXeJaESUhX6AksA91ad/fpMAgAAQ2oA=
Date: Thu, 7 Nov 2019 12:13:51 +0000
Message-ID: <20191107121351.GK2398@hiutale>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<20191107111332.GA23775@localhost>
In-Reply-To: <20191107111332.GA23775@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Thu, 07 Nov 2019 12:13:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01E9EAE6D6480C4AA139850F72573EBE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 07, 2019 at 01:13:32PM +0200, Adrian Bunk wrote:
> On Wed, Nov 06, 2019 at 05:37:15PM +0200, Mikko Rapeli wrote:
> > Hi,
>=20
> Hi Mikko,
>=20
> >...
> > I use sumo and due to various reasons like BSP layers, binary
> > compatibility, contracts etc can't update to newer release
> > or to master branch. I suspect I'm not alone.
>=20
> I might end up with similar reasons, but for warrior.
> And might end up doing similar longer term updates for warrior.
> (not yet 100% certain)

I'm skipping warrior but going to zeus in addition to sumo. After
insipiration from Yocto Project Summit I hope to run master branch
in some projects with regular updates, and eventually aligning to
some stable release again. Hopefully an LTS one :)

> >...
> > The tooling will expose that sumo is severely lacking in security
> > patches, but the tooling is a start for anyone interested, like me,
> > to fill the gaps and publish patches for bitbake recipes we care
> > about.
> >...
>=20
> Thud is officially still community maintained, as long as this is true
> the point could be made that everything that gets fixed in sumo should
> also get fixed in thud.

So to keep sumo alive, we should the also keep zeus, warrior and thud, and
of course master branch first. For some issues this actually works when
the exact same CVE patch applies, but the open question then is testing.

How should a developer test a patch before submitting it, or multiple versi=
ons
of it?

I'm testing in project tree with CI and target tests, then compile testing =
on
master. qemu ptest runs would be nice but not sure how to get a stable or u=
seful
test set for various branches.

To make things more complicated, the project trees sadly contain more backp=
orts, fixes
and workarounds which are not suitable for upstreaming into stable or even =
master
branches.

-Mikko=


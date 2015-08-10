Return-Path: <prvs=657fc4add=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id B7994768AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 17:02:58 +0000 (UTC)
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 Aug 2015 19:02:50 +0200
Received: from unknown (HELO esabb6.muc) ([160.50.100.50]) by esagw1.muc with
	ESMTP/TLS; 10 Aug 2015 19:02:49 +0200
Received: from smuch51a.muc (HELO SMUCH51A.europe.bmw.corp) ([160.46.137.115])
	by esabb6.muc with ESMTP/TLS; 10 Aug 2015 19:02:49 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH51A.europe.bmw.corp ([160.46.137.115]) with mapi id 14.03.0248.002;
	Mon, 10 Aug 2015 19:02:48 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and
	*MIRROR for broken symlinks
Thread-Index: AQHQy2+1X7gCy6EMvEOOz3fdAlfGJJ4E0fWAgACKxICAAAenAA==
Date: Mon, 10 Aug 2015 17:02:47 +0000
Message-ID: <20150810170250.GJ6102@loska>
References: <1438333215-1593-1-git-send-email-mikko.rapeli@bmw.de>
	<20150810081845.GF6102@loska>
	<CAJTo0LaNdbbS++REvbB5Gw-FQ736emDpwCH0G-hzZrxZCs9QFA@mail.gmail.com>
In-Reply-To: <CAJTo0LaNdbbS++REvbB5Gw-FQ736emDpwCH0G-hzZrxZCs9QFA@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken symlinks
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
X-List-Received-Date: Mon, 10 Aug 2015 17:03:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86313336C0C61640AFF8F56E874D2CD4@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 05:35:27PM +0100, Burton, Ross wrote:
> On 10 August 2015 at 09:18, <Mikko.Rapeli@bmw.de> wrote:
>=20
> > So currently patch testing and review queues are full.
> >
> > Should I file bugzilla tickets with links to patches like this or
> > are the mailing list contributions tracked via patchwork or something?
> >
> > If small changes like this are not getting merged, then I don't have
> > confidence
> > in pushing bigger ones back upstream.
> >
>=20
> There's been slow acceptance of patches on master recently, mainly due to=
 a
> focus on making the autobuilder do green runs reliably.  To compound that=
,
> I've just returned from a week off and Richard was travelling last week a=
nd
> is still travelling this week.
>=20
> That said, master-next is almost 50 commits ahead of master and will be
> merged soon, and I've just queued this into my testing branch.  Stuff is
> flowing, just slowly.

Thanks for the update. I was just wondering if there's anything I could/sho=
uld
do as a drive-by-contributor.

-Mikko=


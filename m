Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2A275048
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 16:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 39596184E0;
	Fri, 18 May 2018 18:51:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 5isS8r1bBDhU; Fri, 18 May 2018 18:51:55 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3B6BF184DC;
	Fri, 18 May 2018 18:51:55 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D17D1E080;
	Fri, 18 May 2018 18:51:55 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 107B11E07E;
	Fri, 18 May 2018 18:51:55 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 18 May 2018 18:51:55 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 0410617CA;
	Fri, 18 May 2018 18:51:55 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 18 May 2018 18:51:55 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 18 May 2018 18:51:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>, ChenQi <Qi.Chen@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/2] base-files: profile: Do not assume that
	the 'command' command exists
Thread-Index: AQHTMHGvmZpeJOa5OUO/5CVOyrBVb6K6e+eAgAAElgCAAAjtgIAnBoiAgAADuwCBVQ/iAIAAi0VA
Date: Fri, 18 May 2018 16:51:54 +0000
Message-ID: <1bf23c38ed974d80868c72516d57c23c@XBOX02.axis.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
	<411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
	<d2c9a503-a8ff-34f8-2d0c-ccea52e4ee7d@windriver.com>
	<44b92914-6c05-d08f-1d94-bd041c6b7733@windriver.com>
	<20180518102840.GA1398@jama>
In-Reply-To: <20180518102840.GA1398@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Fri, 18 May 2018 16:51:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: den 18 maj 2018 12:29
> To: ChenQi <Qi.Chen@windriver.com>
> Cc: Mike Looijmans <mike.looijmans@topic.nl>; openembedded-
> core@lists.openembedded.org; Peter Kjellerstedt
> <peter.kjellerstedt@axis.com>; Burton, Ross <ross.burton@intel.com>
> Subject: Re: [OE-core] [PATCH 1/2] base-files: profile: Do not assume
> that the 'command' command exists
>=20
> On Fri, Oct 13, 2017 at 06:07:16PM +0800, ChenQi wrote:
> > On 10/13/2017 05:53 PM, ChenQi wrote:
> > > On 09/18/2017 09:56 PM, Mike Looijmans wrote:
> > >> On 18-09-17 15:24, Mike Looijmans wrote:
> > >>> On 18-09-17 15:08, Burton, Ross wrote:
> > >>>> On 18 September 2017 at 12:31, Mike Looijmans
> > >>>> <mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>>
> wrote:
> > >>>>
> > >>>>         This is basically the same change as I first sent a
> patch
> > >>>> for in
> > >>>>         April, and
> > >>>>         last pinged this Friday... The only real difference is
> that
> > >>>> this one
> > >>>>         misses
> > >>>>         passing error output from resize to /dev/null (which it
> > >>>> should do to
> > >>>>         handle
> > >>>>         the case where tty exists, but resize does not).
> > >>>>
> > >>>>
> > >>>>     Yeah, indeed.
> > >>>>
> > >>>>
> > >>>> Apologies for missing that patch!
> > >>>>
> > >>>>     Other problem is that "resize" outputs shell script on
> stdout
> > >>>> to be
> > >>>>     executed, so the proper "total" invokation would be:
> > >>>>
> > >>>>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
> > >>>>
> > >>>>     The "eval" part is missing in your version...
> > >>>>
> > >>>>
> > >>>> Who is going to submit the One True patch with all the fixes in?
> I
> > >>>> promise to merge it.
> > >>>
> > >>> I'll send the one ring, eh, patch, in a few minutes. I'll merge
> the
> > >>> two into a single as well.
> > >>
> > >> On second thought, just use Peter's patch "as is".
> > >>
> > >> I've been experimenting with the "eval" part and it doesn't behave
> > >> well. Tends to confuse minicom, create garbage, and in particular
> > >> when run from "profile", it seems to result in counterproductive
> > >> COLUMNS=3D0 and LINES=3D0.
> > >>
> > >> I'm actually wondering why the call to "resize" is being done at
> all.
> > >> Just calling "resize" has no effect, since it outputs the results
> on
> > >> stdout as shell script, and that is being discarded. Looking at
> the
> > >> commit that introduced it:
> > >>
> > >
> > > Looking at the codes in busybox (console-tools/resize.c), I can see
> > > that tcsetattr is actually called.
> > > The output is due to:
> > >
> > >     if (ENABLE_FEATURE_RESIZE_PRINT)
> > >         printf("COLUMNS=3D%d;LINES=3D%d;export COLUMNS LINES;\n",
> > >             w.ws_col, w.ws_row);
> > >
> > > I can confirm that calling 'resize' is needed. Otherwise, you might
> > > get input wrapping on the same line when typing long commands.
> > >
> > > I just tried busybox init based system and I also met '-sh:
> command:
> > > not found' error message.
> >
> > Sorry for the noise. Just noticed that oe-core has enabled 'command'
> for
> > busybox by default. It's my own busybox defconfig that hasn't enabled
> it.
>=20
> I was just hit by the same. resize and tty work fine, but command
> applet is missing in my images.
>=20
> Is enabling command applet in busybox now hard requirement for all the
> builds or is anyone still planing to send follow-up on this?
>=20
> At least to show some more meaningful error when it's not available?
>=20
> "you probably need to fix your busybox defconfig, because some old
> thread on oe-core ML says so"
>=20
> Cheers,

Wow, here's an old discussion I had forgotten all about. I actually=20
do have an updated version of the patch that solves the problem by=20
running resize twice, once with stderr piped to /dev/null to=20
determine if the resize command exists, and once without stderr=20
piped to /dev/null to actually do the resize (since resize uses=20
stderr to determine the size of the tty).

I'll send the updated patch in a minute.

> > Best Regards,
> > Chen Qi
> >
> > > I think Peter's patch ([OE-core] [PATCHv2 1/1] base-files: profile:
> > > Avoid using "command" to determine if programs exist) is correct.
> > >
> > > Best Regards,
> > > Chen Qi
> > >
> > >> cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)
> > >>
> > >> that already has no effect whatsoever. See the man page for
> resize:
> > >> https://linux.die.net/man/1/resize
> > >>
> > >> I also would consider running some program's output as shell
> script a
> > >> bit spooky, it looks like a security hole waiting to be exploited.
> > >>
> > >>
> > >>
> > >> Kind regards,
> > >>
> > >> Mike Looijmans
> > >> System Expert
> > >>
> > >> TOPIC Products
> > >> Materiaalweg 4, NL-5681 RJ Best
> > >> Postbus 440, NL-5680 AK Best
> > >> Telefoon: +31 (0) 499 33 69 79
> > >> E-mail: mike.looijmans@topicproducts.com
> > >> Website: www.topicproducts.com
> > >>
> > >> Please consider the environment before printing this e-mail
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

//Peter



Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 633D577553
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 11:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 985A5181EE;
	Tue,  7 Mar 2017 12:29:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id u0c2cIWkwqfG; Tue,  7 Mar 2017 12:29:23 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7FFB318142;
	Tue,  7 Mar 2017 12:29:23 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48FDB1A07E;
	Tue,  7 Mar 2017 12:29:23 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E0641A06F;
	Tue,  7 Mar 2017 12:29:23 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  7 Mar 2017 12:29:23 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 3223027B;
	Tue,  7 Mar 2017 12:29:23 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 7 Mar 2017 12:29:23 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 7 Mar 2017 12:29:22 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 7 Mar 2017 12:29:23 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Patrick Ohly <patrick.ohly@intel.com>, "ed.bartosh@linux.intel.com"
	<ed.bartosh@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] sstate.bbclass: update .siginfo atime
Thread-Index: AQHSlpDIZX17FlnAm0ukT5Yx3V2e66GH9VSAgAAQ+QCAABxugIAAB18AgAAeK4CAAPYx8A==
Date: Tue, 7 Mar 2017 11:29:22 +0000
Message-ID: <943d849dd4dc4b7b9c83752436bc8984@XBOX02.axis.com>
References: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
	<1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LY7pOtUWsbCJQ8_4A=Bxws04Sdfr1M-59fa6K5gdqJk-Q@mail.gmail.com>
	<20170306175010.GA18369@linux.intel.com>
	<1488828715.7785.310.camel@intel.com>
	<20170306195818.GB19275@linux.intel.com>
	<1488836777.7785.313.camel@intel.com>
In-Reply-To: <1488836777.7785.313.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Tue, 07 Mar 2017 11:29:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Patrick Ohly
> Sent: den 6 mars 2017 22:46
> To: ed.bartosh@linux.intel.com
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH v2] sstate.bbclass: update .siginfo atime
>=20
> On Mon, 2017-03-06 at 21:58 +0200, Ed Bartosh wrote:
> > On Mon, Mar 06, 2017 at 08:31:55PM +0100, Patrick Ohly wrote:
> > > On Mon, 2017-03-06 at 19:50 +0200, Ed Bartosh wrote:
> > > > On Mon, Mar 06, 2017 at 04:49:25PM +0000, Burton, Ross wrote:
> > > > > On 6 March 2017 at 15:31, Ed Bartosh
> <ed.bartosh@linux.intel.com> wrote:
> > > > >
> > > > > > +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a
> ${SSTATE_PKG}.siginfo
> > > > > >
> > > > >
> > > > > $ ( [ -h / ] && echo something ); echo $?
> > > > > 1
> > > > >
> > > > > If the -h fails then this is still going to cause
> sstate_unpack_package to
> > > > > trap.
> > > >
> > > > I don't think it will as '&&' and '||' lists are among other
> special cases where
> > > > shell doesn't exits on error.
> > >
> > > True, but if the clause happens to be the last one in a function or
> > > script (for example, after restructuring code), then the return
> code of
> > > that becomes non-zero, which isn't intended.
> >
> > Exactly because of this I moved my changes up in the function in v2.
>=20
> And someone else might accidentally move it down again, without
> understanding the consequences. It's simply safer to be explicit, IMHO.
> Not worth a v3, but perhaps in the future.

This is why our shell expert always recommends that tests like this=20
should be written this way instead:

     [ ! -h /foobar ] || echo 'fstab is a symlink'

I.e., reverse the first test and always use || rather than &&.

//Peter



Return-Path: <corneliux.stoicescu@intel.com>
X-Greylist: delayed 581 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 May 2014 10:39:59 UTC
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB5365DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:39:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2014 03:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,866,1392192000"; d="scan'208";a="513887780"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2014 03:30:18 -0700
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 19 May 2014 11:30:17 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.183]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.70]) with mapi id
	14.03.0123.003; Mon, 19 May 2014 11:30:16 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Stefan Stanacar <sstncr@gmail.com>, "Musat, GeorgeX L"
	<georgex.l.musat@intel.com>
Thread-Topic: [OE-core] [PTACH V2] oeqa/runtime: Update test names with
	testopia tc numbers.
Thread-Index: AQHPc0S2Fl93BEQqNE6gk2b7EJPi1ZtHszeg
Date: Mon, 19 May 2014 10:30:16 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A263F62@IRSMSX103.ger.corp.intel.com>
References: <1400229891-5302-1-git-send-email-georgex.l.musat@intel.com>
	<CANr+NRu16-swsx2B1qCJU=H5dmqWwsbD=iD28LA76uTYg_E39A@mail.gmail.com>
In-Reply-To: <CANr+NRu16-swsx2B1qCJU=H5dmqWwsbD=iD28LA76uTYg_E39A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PTACH V2] oeqa/runtime: Update test names with testopia tc numbers.
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
X-List-Received-Date: Mon, 19 May 2014 10:40:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Stefan Stanacar
> Sent: Monday, May 19, 2014 12:28 PM
> To: Musat, GeorgeX L
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PTACH V2] oeqa/runtime: Update test names with
> testopia tc numbers.
>=20
> Hi Lucian,
>=20
> On Fri, May 16, 2014 at 11:44 AM, Lucian Musat
> <georgex.l.musat@intel.com> wrote:
> >
> >  class SmartRepoTest(SmartTest):
> > @@ -54,11 +54,12 @@ class SmartRepoTest(SmartTest):
> >      @classmethod
> >      def tearDownClass(self):
> >          self.repo_server.stop()
> > +       smartsRepo =3D SmartRepoTest
> >
>=20
> Again, this line doesn't make sense and it probably shouldn't be here.
>=20
> >  class SyslogTest(oeRuntimeTest):
> >
> > -    @skipUnlessPassed("test_ssh")
> > -    def test_syslog_help(self):
> > -        (status,output) =3D self.target.run('/sbin/syslogd --help')
> > -        self.assertEqual(status, 0, msg=3D"status and output: %s and %=
s" %
> (status,output))
> > +    @skipUnlessPassed("test_ssh_tc_224")
> > +    def test_syslog_help_tc_202(self):
> > +               (status,output) =3D self.target.run('/sbin/syslogd --he=
lp')
> > +               self.assertEqual(status, 0, msg=3D"status and output: %=
s
> > + and %s" % (status,output))
> >
>=20
> There are some whitespaces/tabs added here that probably shouldn't be.
>=20
> Please also add a description why this patch is needed. Why do we need to
> add testopia numbers to test names, how is it useful?
> Also, isn't there any other way we could map these tests to testopia
> testcases?
>=20

Hello Stefan,

Indeed we need a better description for this. Unfortunately there is no eas=
y way to map these test cases without adding another maintenance point. Als=
o this will be easy to read in the test output both by human eye and automa=
ted scripts.
What do you think? Do you have another idea we could investigate?

Regards,
Corneliu

> Cheers,
> Stefan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


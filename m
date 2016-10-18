Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BB1DD71A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 15:33:09 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 18 Oct 2016 08:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; d="scan'208";a="20863038"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2016 08:33:10 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 18 Oct 2016 08:33:10 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.16]) by
	ORSMSX153.amr.corp.intel.com ([10.22.226.247]) with mapi id
	14.03.0248.002; Tue, 18 Oct 2016 08:33:10 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] insane.bbclass: Additional "mips" and
	"mipsel" machine definitions
Thread-Index: AQHSI+COJkptfSD32kuJlPEljcMG16CtzI4AgACVLHA=
Date: Tue, 18 Oct 2016 15:33:09 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61189B107@ORSMSX112.amr.corp.intel.com>
References: <1476204984-35157-1-git-send-email-juro.bystricky@intel.com>
	<A514EEE8-721D-425F-8DDF-CDE0624D698E@gmail.com>
In-Reply-To: <A514EEE8-721D-425F-8DDF-CDE0624D698E@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: Additional "mips" and "mipsel" machine definitions
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
X-List-Received-Date: Tue, 18 Oct 2016 15:33:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

yes, good point. I will resend the patch with an updated commit=20
message.


> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Monday, October 17, 2016 4:38 PM
> To: Bystricky, Juro <juro.bystricky@intel.com>
> Cc: openembedded-core@lists.openembedded.org; jurobystricky@hotmail.com
> Subject: Re: [OE-core] [PATCH] insane.bbclass: Additional "mips" and
> "mipsel" machine definitions
>=20
>=20
> > On Oct 11, 2016, at 9:56 AM, Juro Bystricky <juro.bystricky@intel.com>
> wrote:
> >
> > Add "mips" and "mipsel" to "machdata" table.
> > Although there is a way to add entries to the "machdata" table
> > from a BSP without modifying the insane.bbclass directly, MIPS is
> > already supported in poky and as such the relevant entries should be
> > present in insane.bbclass.
>=20
> perhaps say s/poky/openembedded-core/ here since thats where the patch
> is going to go.
>=20
> >
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> > meta/classes/insane.bbclass | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index b347638..21c5cda 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -66,6 +66,8 @@ def package_qa_get_machine_dict(d):
> >                         "i586" :      (3,      0,    0,          True,
> 32),
> >                         "x86_64":     (62,     0,    0,          True,
> 64),
> >                         "epiphany":   (4643,   0,    0,          True,
> 32),
> > +                        "mips":       ( 8,     0,    0,          False=
,
> 32),
> > +                        "mipsel":     ( 8,     0,    0,          True,
> 32),
> >                       },
> >             "linux" : {
> >                         "aarch64" :   (183,    0,    0,          True,
> 64),
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



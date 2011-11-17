Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RQw0c-00020L-22
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 08:03:43 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 17 Nov 2011 14:57:02 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 17 Nov 2011
	14:57:01 +0800
Message-ID: <1321512960.1264.31.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Nov 2011 14:56:00 +0800
In-Reply-To: <CAMKF1sp4BQc1huW2et1hBUHX-sG9hKh=NA=0ZcFWQVDuyWPRJw@mail.gmail.com>
References: <4EAE0428.2020209@windriver.com>
	<CAMKF1spV_BiCTo1YCoKL7XUTqRWtFJFYP4yB16FoyETjYzAuxg@mail.gmail.com>
	<4EC47257.5030302@windriver.com>
	<1321497356.1264.26.camel@localhost.localdomain>
	<CAMKF1sp4BQc1huW2et1hBUHX-sG9hKh=NA=0ZcFWQVDuyWPRJw@mail.gmail.com>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is the strategy to update eglibc?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Nov 2011 07:03:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the explanation:)

On Thu, 2011-11-17 at 14:41 +0800, Khem Raj wrote:
> On Wed, Nov 16, 2011 at 6:35 PM, Ni Qingliang
> <niqingliang@insigma.com.cn> wrote:
> > it looks like there is 2.14 bb file already, why the default eglibc sta=
y
> > on 2.13?
>=20
> 2.14 removed some functionality rpc which is used extensively
> alternative to use libtirpc is not sufficient atm. Therefore we
> readded the functionality into 2.14 recipes and they need testing.
> Some distros e.g. angstrom-bleeding use 2.14 but its not default in
> oe-core yet for same reasons that it needs to be
> tested
>=20
> >
> > On Thu, 2011-11-17 at 10:32 +0800, Kang Kai wrote:
> >> On 2011=E5=B9=B411=E6=9C=8817=E6=97=A5 05:38, Khem Raj wrote:
> >> > On Sun, Oct 30, 2011 at 7:12 PM, Kang Kai<Kai.Kang@windriver.com>  w=
rote:
> >> >> Hi Saul,
> >> >>
> >> >> I just want to update eglibc but eglibc is using its 2.14 branch an=
d use svn
> >> >> commit revision "15225" as current version. Of course it is behind =
the
> >> >> latest svn revision, but I don't quit sure about which is the right=
 revision
> >> >> to update eglibc.
> >>
> >> Hi Khem,
> >> > since release branches of eglibc only get bug fixes in ideal case it
> >> > should be good at any revision. However if we have bug
> >> > fixes that dont affect us immediately we do not tend to update
> >> > the revision. If you find that some bug fix thats applied upstream i=
s
> >> > needed it certainly can be a reason to bump up srcrev given we do so=
me
> >> > level of build and runtime testing
> >> > with new revision.
> >>
> >> Thanks very much for your detailed explanation.
> >> I check the changelog of eglibc 2.13 branch(latest is 15508), and they
> >> are some tiny updates except the revision 15226 that is same with
> >> current patch
> >>
> >> glibc_bug_fix_12454.patch
> >>
> >> And I made the rough tests of image-sato of qemu-x86 and qemu-arm and
> >> results are fine.
> >>
> >> Regards,
> >> Kai
> >> >
> >> >> Could you give me some guide? Thank you!
> >> >>
> >> >> Regards,
> >> >> Kai
> >> >>
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
> >> >>
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > --
> > Yi Qingliang
> > niqingliang@insigma.com.cn
> > https://niqingliang2003.wordpress.com
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >

--=20
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com




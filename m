Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED6A565E28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 14:52:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2014 07:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,879,1389772800"; d="scan'208";a="514815750"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.241])
	by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2014 07:52:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gabriel Barbu <gabriel.barbu@enea.com>
Date: Thu, 17 Apr 2014 15:52:37 +0100
Message-ID: <1766435.4H2Ncp94dv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <534FE9D0.3090500@enea.com>
References: <69319FFFA2D4F748B9BB5083FA28E56F25B9AD1A@sestoex09.enea.se>
	<2112042.009cqD1bE3@peggleto-mobl5.ger.corp.intel.com>
	<534FE9D0.3090500@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to add a distro feature from an image recipe?
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
X-List-Received-Date: Thu, 17 Apr 2014 14:52:39 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 17 April 2014 17:48:48 Gabriel Barbu wrote:
> On 4/17/2014 5:28 PM, Paul Eggleton wrote:
> > On Thursday 17 April 2014 17:24:17 Gabriel Barbu wrote:
> >> On 4/17/2014 4:42 PM, Paul Eggleton wrote:
> >>> On Thursday 17 April 2014 11:27:16 Gabriel Barbu wrote:
> >>>> Or, if not, what would be the best way to achieve this?
> >>>> The need is that I have a number of images and only want to add =
a
> >>>> certain
> >>>> distro feature (ptest) to just one or two of them (some test ima=
ges).
> >>>=20
> >>> You can have ptest enabled in the distro but ptest packages insta=
lled
> >>> only
> >>> in certain images. That is the only way this kind of thing can wo=
rk. If
> >>> enabling the ptest in DISTRO_FEATURES is causing changes in an im=
age
> >>> where ptest is not installed, that should be considered a bug.
> >>=20
> >> Yes, I was afraid it=E2=80=99s this way :)
> >> Alright, I can settle for just not having them installed.
> >>=20
> >> But what I=E2=80=99m witnessing now is that having:
> >> "ptest" in my DISTRO_FEATURES, and
> >> no "ptest-pkgs" in IMAGE_FEATURES
> >> results in the image having ptests installed.
> >=20
> > Is that bug 5702, or something else?
> >=20
> >    https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5702
> >=20
> > Cheers,
> > Paul
>=20
> Possibly more. Right now I only see:
> ./dbus-ptest/ptest
> ./perl/ptest
>=20
> in a custom image I have, but I will also try with a bigger image to
> check if I get more.

So the dbus-ptest one we're aware of (and the fix is on the mailing lis=
t) but=20
it would be interesting to know how the perl-ptest one got there.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


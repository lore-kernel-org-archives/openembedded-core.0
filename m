Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QYgxn-0005xl-TE
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 18:04:36 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2011 09:01:01 -0700
Received: by wwe5 with SMTP id 5so1772400wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 09:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.220.212 with SMTP id o62mr1143092wep.75.1308585659816;
	Mon, 20 Jun 2011 09:00:59 -0700 (PDT)
Received: by 10.216.163.16 with HTTP; Mon, 20 Jun 2011 09:00:59 -0700 (PDT)
In-Reply-To: <BANLkTimYMzEFXedsg=L=-KArkT049gSdXw@mail.gmail.com>
References: <BANLkTi=vPH3A6oO_OuT84nKorWiF2=N2Bg@mail.gmail.com>
	<BANLkTimYMzEFXedsg=L=-KArkT049gSdXw@mail.gmail.com>
Date: Mon, 20 Jun 2011 09:00:59 -0700
Message-ID: <BANLkTimH4uu9gB66zLqvoVee=W45VV=irg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] More LICENSE cleanup and additional common-licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 20 Jun 2011 16:04:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Khem,

Yes, this should correct it from complaining about not having that
license. GPL-3.0-with-GCC-exception is the correct text for
GCCRUNTIMELIBRARYEXCEPTION and this patch changes the license over to
that naming convention. The parser chokes on portions of fields like
"GCC RUNTIME LIBRARY EXCEPTION" (which is what the original was in the
recipe). This change makes it so that it's consistent and tells people
what the license actually is. For example, there is a
GCC-2.0-with-GCC-exception. This limits possible confusion and assists
in license wrangling.

-b


On Wed, Jun 15, 2011 at 4:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jun 15, 2011 at 2:01 PM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>> I've added some more licenses from the SPDX project as well as
>> corrected some text.
>> GCC's LICENSE field was problematic and I've corrected it to the
>> actual GPL exception
>> license text. I've also cleaned up gdb's LICENSE field.
>>
>
> It always wanted GCCRUNTIMELIBRARYEXCEPTION license and did not find it.
> I have local copy in metadata
> meta/files/common-licenses/GCCRUNTIMELIBRARYEXCEPTION
> It that fixed too ?
>
> If not then I have uploaded it here
> http://paste.ubuntu.com/627695/
>
>
>> The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f168=
45c:
>>
>> =A0meta-yocto: use FILESEXTRAPATHS_prepend :=3D in all bbappends
>> (2011-06-15 11:49:42 +0100)
>>
>> are available in the git repository at:
>> =A0git://git.pokylinux.org/poky-contrib eflanagan/license_corrections
>> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Deflanagan/lic=
ense_corrections
>>
>> Beth Flanagan (1):
>> =A0common-licenses: Additions and corrections
>>
>> =A0meta/files/common-licenses/AAL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A06 +-
>> =A0meta/files/common-licenses/AFL-1.2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0123 ++++
>> =A0meta/files/common-licenses/AFL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 48 ++
>> =A0meta/files/common-licenses/AFL-2.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 50 ++
>> =A0meta/files/common-licenses/AFL-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 27 +
>> =A0meta/files/common-licenses/AGPL-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A03 +
>> =A0meta/files/common-licenses/ANTLR-PD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 32 +
>> =A0meta/files/common-licenses/APL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0218 +++++++
>> =A0meta/files/common-licenses/APSL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0372 +++++++++++
>> =A0meta/files/common-licenses/APSL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0374 +++++++++++
>> =A0meta/files/common-licenses/APSL-1.2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0105 ++++
>> =A0meta/files/common-licenses/APSL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0102 +++
>> =A0meta/files/common-licenses/Apache-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 61 ++
>> =A0meta/files/common-licenses/Apache-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 60 ++
>> =A0meta/files/common-licenses/Apache-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A04 +-
>> =A0meta/files/common-licenses/Artistic-1.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
50 ++
>> =A0meta/files/common-licenses/Artistic-2.0 =A0 =A0 =A0 =A0 =A0 =A0| =A02=
03 ++++++
>> =A0meta/files/common-licenses/BSD-2-Clause =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
26 +-
>> =A0meta/files/common-licenses/BSD-3-Clause =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
26 +-
>> =A0meta/files/common-licenses/BSD-4-Clause =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
17 +-
>> =A0meta/files/common-licenses/BSL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 25 +
>> =A0meta/files/common-licenses/CATOSL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0116 ++++
>> =A0meta/files/common-licenses/CC-BY-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 60 ++
>> =A0meta/files/common-licenses/CC-BY-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 63 ++
>> =A0meta/files/common-licenses/CC-BY-2.5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 63 ++
>> =A0meta/files/common-licenses/CC-BY-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 70 ++
>> =A0meta/files/common-licenses/CC-BY-NC-1.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
63 ++
>> =A0meta/files/common-licenses/CC-BY-NC-2.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
66 ++
>> =A0meta/files/common-licenses/CC-BY-NC-2.5 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
66 ++
>> =A0meta/files/common-licenses/CC-BY-NC-3.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
72 +++
>> =A0meta/files/common-licenses/CC-BY-NC-ND-1.0 =A0 =A0 =A0 =A0 | =A0 =A05=
 +
>> =A0meta/files/common-licenses/CC-BY-NC-ND-2.0 =A0 =A0 =A0 =A0 | =A0 63 +=
+
>> =A0meta/files/common-licenses/CC-BY-NC-ND-2.5 =A0 =A0 =A0 =A0 | =A0 63 +=
+
>> =A0meta/files/common-licenses/CC-BY-NC-ND-3.0 =A0 =A0 =A0 =A0 | =A0 69 +=
+
>> =A0meta/files/common-licenses/CC-BY-NC-SA-1.0 =A0 =A0 =A0 =A0 | =A0 64 +=
+
>> =A0meta/files/common-licenses/CC-BY-NC-SA-2.0 =A0 =A0 =A0 =A0 | =A0 68 +=
+
>> =A0meta/files/common-licenses/CC-BY-NC-SA-2.5 =A0 =A0 =A0 =A0 | =A0 68 +=
+
>> =A0meta/files/common-licenses/CC-BY-NC-SA-3.0 =A0 =A0 =A0 =A0 | =A0 74 +=
++
>> =A0meta/files/common-licenses/CC-BY-ND-1.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
59 ++
>> =A0meta/files/common-licenses/CC-BY-ND-2.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
62 ++
>> =A0meta/files/common-licenses/CC-BY-ND-2.5 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
62 ++
>> =A0meta/files/common-licenses/CC-BY-ND-3.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
68 ++
>> =A0meta/files/common-licenses/CC-BY-SA-1.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
63 ++
>> =A0meta/files/common-licenses/CC-BY-SA-2.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
67 ++
>> =A0meta/files/common-licenses/CC-BY-SA-2.5 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
67 ++
>> =A0meta/files/common-licenses/CC-BY-SA-3.0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
74 +++
>> =A0meta/files/common-licenses/CC0-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 32 +
>> =A0meta/files/common-licenses/CDDL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0131 ++++
>> =A0meta/files/common-licenses/CECILL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0242 +++++++
>> =A0meta/files/common-licenses/CECILL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0243 +++++++
>> =A0meta/files/common-licenses/CECILL-B =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0440 ++++----------
>> =A0meta/files/common-licenses/CECILL-C =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0447 ++++----------
>> =A0meta/files/common-licenses/CPAL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0109 ++++
>> =A0meta/files/common-licenses/CPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0215 +++++++
>> =A0meta/files/common-licenses/CUA-OPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 | =A04=
71 ++++++++++++++
>> =A0meta/files/common-licenses/ClArtistic =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0110 ++--
>> =A0meta/files/common-licenses/ECL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 55 ++
>> =A0meta/files/common-licenses/ECL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 99 +++
>> =A0meta/files/common-licenses/EFL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 25 +
>> =A0meta/files/common-licenses/EFL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 12 +
>> =A0meta/files/common-licenses/EPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 72 +++
>> =A0meta/files/common-licenses/EUDatagrid =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 65 +--
>> =A0meta/files/common-licenses/EUPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0184 ++++++
>> =A0meta/files/common-licenses/EUPL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0204 ++++++
>> =A0meta/files/common-licenses/Entessa =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 48 +--
>> =A0meta/files/common-licenses/ErlPL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0288 +++++++++
>> =A0meta/files/common-licenses/Fair =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A09 +-
>> =A0meta/files/common-licenses/Frameworx-1.0 =A0 =A0 =A0 =A0 =A0 | =A0 69=
 ++
>> =A0meta/files/common-licenses/GFDL-1.2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 20 +-
>> =A0meta/files/common-licenses/GFDL-1.3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 18 +-
>> =A0meta/files/common-licenses/GPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0252 ++++++++
>> =A0meta/files/common-licenses/GPL-1.0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0252 ++++++++
>> =A0.../common-licenses/GPL-2-with-bison-exception =A0 =A0 | =A0 17 +-
>> =A0meta/files/common-licenses/GPL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0132 ++++
>> =A0meta/files/common-licenses/GPL-2.0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0132 ++++
>> =A0.../common-licenses/GPL-2.0-with-GCC-exception =A0 =A0 | =A0 =A06 +
>> =A0.../GPL-2.0-with-autoconf-exception =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A06 +
>> =A0.../GPL-2.0-with-classpath-exception =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A07 +
>> =A0.../common-licenses/GPL-2.0-with-font-exception =A0 =A0| =A0 =A06 +
>> =A0meta/files/common-licenses/GPL-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A03 +
>> =A0meta/files/common-licenses/GPL-3.0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A03 +
>> =A0.../common-licenses/GPL-3.0-with-GCC-exception =A0 =A0 | =A0 27 +
>> =A0.../GPL-3.0-with-autoconf-exception =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 28 +
>> =A0meta/files/common-licenses/HPND =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 23 +-
>> =A0meta/files/common-licenses/IPA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0182 ++-----
>> =A0meta/files/common-licenses/IPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0213 +++++++
>> =A0meta/files/common-licenses/ISC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 21 +-
>> =A0meta/files/common-licenses/LGPL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0173 +++++
>> =A0meta/files/common-licenses/LGPL-2.0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0173 +++++
>> =A0meta/files/common-licenses/LGPL-2.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0658 +++++---------------
>> =A0meta/files/common-licenses/LGPL-2.1+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0176 ++++++
>> =A0meta/files/common-licenses/LGPL-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 66 ++
>> =A0meta/files/common-licenses/LGPL-3.0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 66 ++
>> =A0meta/files/common-licenses/LPL-1.02 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 76 +++
>> =A0meta/files/common-licenses/LPPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0213 +++++++
>> =A0meta/files/common-licenses/LPPL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0316 ++++++++++
>> =A0meta/files/common-licenses/LPPL-1.2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0320 ++++++++++
>> =A0meta/files/common-licenses/LPPL-1.3c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0418 +++++++++++++
>> =A0meta/files/common-licenses/Libpng =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 79 +--
>> =A0meta/files/common-licenses/MIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 11 +-
>> =A0meta/files/common-licenses/MPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0109 ++++
>> =A0meta/files/common-licenses/MPL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0185 ++++++
>> =A0meta/files/common-licenses/MS-PL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 58 +--
>> =A0meta/files/common-licenses/MS-RL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 69 +--
>> =A0meta/files/common-licenses/MirOS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 49 +-
>> =A0meta/files/common-licenses/Motosoto =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 34 +-
>> =A0meta/files/common-licenses/Multics =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A08 +-
>> =A0meta/files/common-licenses/NASA-1.3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 79 +++
>> =A0meta/files/common-licenses/NCSA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 16 +-
>> =A0meta/files/common-licenses/NGPL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0117 +---
>> =A0meta/files/common-licenses/NPOSL-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 61 ++
>> =A0meta/files/common-licenses/NTP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 15 +-
>> =A0meta/files/common-licenses/Nauman =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A05 -
>> =A0meta/files/common-licenses/Nokia =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 95 ++--
>> =A0meta/files/common-licenses/OCLC-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 78 +++
>> =A0meta/files/common-licenses/ODbL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0543 ++++++++++++++++
>> =A0meta/files/common-licenses/OFL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 88 +++
>> =A0meta/files/common-licenses/OGTSL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 73 +--
>> =A0meta/files/common-licenses/OLDAP-2.8 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 49 ++
>> =A0meta/files/common-licenses/OSL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0164 +++++
>> =A0meta/files/common-licenses/OSL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 48 ++
>> =A0meta/files/common-licenses/OSL-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 27 +
>> =A0meta/files/common-licenses/OpenSSL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0212 +++----
>> =A0meta/files/common-licenses/PHP-3.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 70 ++
>> =A0meta/files/common-licenses/PostgreSQL =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 22 +-
>> =A0meta/files/common-licenses/Python-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0192 ++++++
>> =A0meta/files/common-licenses/QPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 48 ++
>> =A0meta/files/common-licenses/RHeCos-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0151 +++++
>> =A0meta/files/common-licenses/RPL-1.5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0546 ++++++++++++++++
>> =A0meta/files/common-licenses/RPSL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0182 ++++++
>> =A0meta/files/common-licenses/RSCPL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0363 ++---------
>> =A0meta/files/common-licenses/Ruby =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 82 ++--
>> =A0meta/files/common-licenses/SAX-PD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 33 +
>> =A0meta/files/common-licenses/SPL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0507 +++++++++++++++
>> =A0meta/files/common-licenses/Simple-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 27 +
>> =A0meta/files/common-licenses/Sleepycat =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 11 +-
>> =A0meta/files/common-licenses/SugarCRM-1.1.3 =A0 =A0 =A0 =A0 =A0| =A0160=
 +++++
>> =A0meta/files/common-licenses/VSL-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 49 ++
>> =A0meta/files/common-licenses/W3C =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 55 +--
>> =A0meta/files/common-licenses/WXwindows =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0106 ++--
>> =A0meta/files/common-licenses/Watcom-1.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0140 +++++
>> =A0meta/files/common-licenses/XFree86-1.1 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
18 +
>> =A0meta/files/common-licenses/Xnet =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 11 +-
>> =A0meta/files/common-licenses/YPL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 30 +
>> =A0meta/files/common-licenses/ZPL-1.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 28 +
>> =A0meta/files/common-licenses/ZPL-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 61 ++
>> =A0meta/files/common-licenses/ZPL-2.1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 18 +
>> =A0meta/files/common-licenses/Zimbra-1.3 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 30 +
>> =A0meta/files/common-licenses/Zlib =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 34 +-
>> =A0meta/files/common-licenses/eCos-2.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 18 +
>> =A0meta/files/common-licenses/gSOAP-1.3b =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0157 +++++
>> =A0meta/recipes-devtools/gcc/gcc-4.5.1.inc =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
>> =A0meta/recipes-devtools/gcc/gcc-4.6.0.inc =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
>> =A0meta/recipes-devtools/gdb/gdb_7.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
>> =A0154 files changed, 13946 insertions(+), 2621 deletions(-)
>> =A0create mode 100644 meta/files/common-licenses/AFL-1.2
>> =A0create mode 100644 meta/files/common-licenses/AFL-2.0
>> =A0create mode 100644 meta/files/common-licenses/AFL-2.1
>> =A0create mode 100644 meta/files/common-licenses/AFL-3.0
>> =A0create mode 100644 meta/files/common-licenses/AGPL-3.0
>> =A0create mode 100644 meta/files/common-licenses/ANTLR-PD
>> =A0create mode 100644 meta/files/common-licenses/APL-1.0
>> =A0create mode 100644 meta/files/common-licenses/APSL-1.0
>> =A0create mode 100644 meta/files/common-licenses/APSL-1.1
>> =A0create mode 100644 meta/files/common-licenses/APSL-1.2
>> =A0create mode 100644 meta/files/common-licenses/APSL-2.0
>> =A0create mode 100644 meta/files/common-licenses/Apache-1.0
>> =A0create mode 100644 meta/files/common-licenses/Apache-1.1
>> =A0create mode 100644 meta/files/common-licenses/Artistic-1.0
>> =A0create mode 100644 meta/files/common-licenses/Artistic-2.0
>> =A0create mode 100644 meta/files/common-licenses/BSL-1.0
>> =A0create mode 100644 meta/files/common-licenses/CATOSL-1.1
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-1.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-2.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-2.5
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-3.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-1.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-2.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-2.5
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-3.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-1.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2.5
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-1.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.5
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-ND-1.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-ND-2.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-ND-2.5
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-ND-3.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-SA-1.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-SA-2.0
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-SA-2.5
>> =A0create mode 100644 meta/files/common-licenses/CC-BY-SA-3.0
>> =A0create mode 100644 meta/files/common-licenses/CC0-1.0
>> =A0create mode 100644 meta/files/common-licenses/CDDL-1.0
>> =A0create mode 100644 meta/files/common-licenses/CECILL-1.0
>> =A0create mode 100644 meta/files/common-licenses/CECILL-2.0
>> =A0create mode 100644 meta/files/common-licenses/CPAL-1.0
>> =A0create mode 100644 meta/files/common-licenses/CPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/CUA-OPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/ECL-1.0
>> =A0create mode 100644 meta/files/common-licenses/ECL-2.0
>> =A0create mode 100644 meta/files/common-licenses/EFL-1.0
>> =A0create mode 100644 meta/files/common-licenses/EFL-2.0
>> =A0create mode 100644 meta/files/common-licenses/EPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/EUPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/EUPL-1.1
>> =A0create mode 100644 meta/files/common-licenses/ErlPL-1.1
>> =A0create mode 100644 meta/files/common-licenses/Frameworx-1.0
>> =A0create mode 100644 meta/files/common-licenses/GPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/GPL-1.0+
>> =A0create mode 100644 meta/files/common-licenses/GPL-2.0
>> =A0create mode 100644 meta/files/common-licenses/GPL-2.0+
>> =A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-GCC-except=
ion
>> =A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-autoconf-e=
xception
>> =A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-classpath-=
exception
>> =A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-font-excep=
tion
>> =A0create mode 100644 meta/files/common-licenses/GPL-3.0
>> =A0create mode 100644 meta/files/common-licenses/GPL-3.0+
>> =A0create mode 100644 meta/files/common-licenses/GPL-3.0-with-GCC-except=
ion
>> =A0create mode 100644 meta/files/common-licenses/GPL-3.0-with-autoconf-e=
xception
>> =A0create mode 100644 meta/files/common-licenses/IPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/LGPL-2.0
>> =A0create mode 100644 meta/files/common-licenses/LGPL-2.0+
>> =A0create mode 100644 meta/files/common-licenses/LGPL-2.1+
>> =A0create mode 100644 meta/files/common-licenses/LGPL-3.0
>> =A0create mode 100644 meta/files/common-licenses/LGPL-3.0+
>> =A0create mode 100644 meta/files/common-licenses/LPL-1.02
>> =A0create mode 100644 meta/files/common-licenses/LPPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/LPPL-1.1
>> =A0create mode 100644 meta/files/common-licenses/LPPL-1.2
>> =A0create mode 100644 meta/files/common-licenses/LPPL-1.3c
>> =A0create mode 100644 meta/files/common-licenses/MPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/MPL-1.1
>> =A0create mode 100644 meta/files/common-licenses/NASA-1.3
>> =A0create mode 100644 meta/files/common-licenses/NPOSL-3.0
>> =A0create mode 100644 meta/files/common-licenses/OCLC-2.0
>> =A0create mode 100644 meta/files/common-licenses/ODbL-1.0
>> =A0create mode 100644 meta/files/common-licenses/OFL-1.1
>> =A0create mode 100644 meta/files/common-licenses/OLDAP-2.8
>> =A0create mode 100644 meta/files/common-licenses/OSL-1.0
>> =A0create mode 100644 meta/files/common-licenses/OSL-2.0
>> =A0create mode 100644 meta/files/common-licenses/OSL-3.0
>> =A0create mode 100644 meta/files/common-licenses/PHP-3.0
>> =A0create mode 100644 meta/files/common-licenses/Python-2.0
>> =A0create mode 100644 meta/files/common-licenses/QPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/RHeCos-1.1
>> =A0create mode 100644 meta/files/common-licenses/RPL-1.5
>> =A0create mode 100644 meta/files/common-licenses/RPSL-1.0
>> =A0create mode 100644 meta/files/common-licenses/SAX-PD
>> =A0create mode 100644 meta/files/common-licenses/SPL-1.0
>> =A0create mode 100644 meta/files/common-licenses/Simple-2.0
>> =A0create mode 100644 meta/files/common-licenses/SugarCRM-1.1.3
>> =A0create mode 100644 meta/files/common-licenses/VSL-1.0
>> =A0create mode 100644 meta/files/common-licenses/Watcom-1.0
>> =A0create mode 100644 meta/files/common-licenses/XFree86-1.1
>> =A0create mode 100644 meta/files/common-licenses/YPL-1.1
>> =A0create mode 100644 meta/files/common-licenses/ZPL-1.1
>> =A0create mode 100644 meta/files/common-licenses/ZPL-2.0
>> =A0create mode 100644 meta/files/common-licenses/ZPL-2.1
>> =A0create mode 100644 meta/files/common-licenses/Zimbra-1.3
>> =A0create mode 100644 meta/files/common-licenses/eCos-2.0
>> =A0create mode 100644 meta/files/common-licenses/gSOAP-1.3b
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



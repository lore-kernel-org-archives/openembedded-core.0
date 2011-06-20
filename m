Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QYiSo-0007It-Ic
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 19:40:44 +0200
Received: by pzk36 with SMTP id 36so4215435pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=aD9UZQrUnyitTycgd5c7gkC7Hh/KaaxTGi/neqwGqbE=;
	b=tz1UcZ4s+7LNLOuACLfSud7gxBS3Dg1qJ7jcgv677OH/JXxD+hAR/GJJjl4Mdh38uV
	u7q9pGfqCnoJ/cCNi6UuI2GrUumxjIY4ED3BbYOBJf7C9jUCS6Uf8Qq8OBc0ClElCFCX
	Zcr//qzGVeLbnT0BphaP4WmlKCRYStPY69X8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=kqWKhA8htw6cr0N28rCK1NCxZCIAjOTAqMVz6mbsVAtCXsa17VizrfWa3CTLObxnn6
	ksPGJImePxANWy9Krg+XeuB6kbYE5hf98C9hFEp3lvYUzV6/Q9xShf5V4t3xMbVOQY4D
	YF83X5GR8nLOX5fRa+948h4c0TcbuNytupsXU=
Received: by 10.68.22.2 with SMTP id z2mr2357278pbe.428.1308591429085; Mon, 20
	Jun 2011 10:37:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.195 with HTTP; Mon, 20 Jun 2011 10:36:39 -0700 (PDT)
In-Reply-To: <BANLkTimH4uu9gB66zLqvoVee=W45VV=irg@mail.gmail.com>
References: <BANLkTi=vPH3A6oO_OuT84nKorWiF2=N2Bg@mail.gmail.com>
	<BANLkTimYMzEFXedsg=L=-KArkT049gSdXw@mail.gmail.com>
	<BANLkTimH4uu9gB66zLqvoVee=W45VV=irg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2011 10:36:39 -0700
Message-ID: <BANLkTinFh92ako046i2VdEs1-mVA5MxbZg@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Jun 2011 17:40:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2011 at 9:00 AM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> Khem,
>
> Yes, this should correct it from complaining about not having that
> license. GPL-3.0-with-GCC-exception is the correct text for
> GCCRUNTIMELIBRARYEXCEPTION and this patch changes the license over to
> that naming convention. The parser chokes on portions of fields like
> "GCC RUNTIME LIBRARY EXCEPTION" (which is what the original was in the
> recipe). This change makes it so that it's consistent and tells people
> what the license actually is. For example, there is a
> GCC-2.0-with-GCC-exception. This limits possible confusion and assists
> in license wrangling.

thanks

>
> -b
>
>
> On Wed, Jun 15, 2011 at 4:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Jun 15, 2011 at 2:01 PM, Flanagan, Elizabeth
>> <elizabeth.flanagan@intel.com> wrote:
>>> I've added some more licenses from the SPDX project as well as
>>> corrected some text.
>>> GCC's LICENSE field was problematic and I've corrected it to the
>>> actual GPL exception
>>> license text. I've also cleaned up gdb's LICENSE field.
>>>
>>
>> It always wanted GCCRUNTIMELIBRARYEXCEPTION license and did not find it.
>> I have local copy in metadata
>> meta/files/common-licenses/GCCRUNTIMELIBRARYEXCEPTION
>> It that fixed too ?
>>
>> If not then I have uploaded it here
>> http://paste.ubuntu.com/627695/
>>
>>
>>> The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16=
845c:
>>>
>>> =C2=A0meta-yocto: use FILESEXTRAPATHS_prepend :=3D in all bbappends
>>> (2011-06-15 11:49:42 +0100)
>>>
>>> are available in the git repository at:
>>> =C2=A0git://git.pokylinux.org/poky-contrib eflanagan/license_correction=
s
>>> =C2=A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Deflanagan=
/license_corrections
>>>
>>> Beth Flanagan (1):
>>> =C2=A0common-licenses: Additions and corrections
>>>
>>> =C2=A0meta/files/common-licenses/AAL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +-
>>> =C2=A0meta/files/common-licenses/AFL-1.2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0123 ++++
>>> =C2=A0meta/files/common-licenses/AFL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 48 ++
>>> =C2=A0meta/files/common-licenses/AFL-2.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 50 ++
>>> =C2=A0meta/files/common-licenses/AFL-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 27 +
>>> =C2=A0meta/files/common-licenses/AGPL-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +
>>> =C2=A0meta/files/common-licenses/ANTLR-PD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 32 +
>>> =C2=A0meta/files/common-licenses/APL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0218 +++++++
>>> =C2=A0meta/files/common-licenses/APSL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0372 +++++++++++
>>> =C2=A0meta/files/common-licenses/APSL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0374 +++++++++++
>>> =C2=A0meta/files/common-licenses/APSL-1.2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0105 ++++
>>> =C2=A0meta/files/common-licenses/APSL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0102 +++
>>> =C2=A0meta/files/common-licenses/Apache-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 61 ++
>>> =C2=A0meta/files/common-licenses/Apache-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 60 ++
>>> =C2=A0meta/files/common-licenses/Apache-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
>>> =C2=A0meta/files/common-licenses/Artistic-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 50 ++
>>> =C2=A0meta/files/common-licenses/Artistic-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0203 ++++++
>>> =C2=A0meta/files/common-licenses/BSD-2-Clause =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 26 +-
>>> =C2=A0meta/files/common-licenses/BSD-3-Clause =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 26 +-
>>> =C2=A0meta/files/common-licenses/BSD-4-Clause =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 17 +-
>>> =C2=A0meta/files/common-licenses/BSL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 25 +
>>> =C2=A0meta/files/common-licenses/CATOSL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0116 ++++
>>> =C2=A0meta/files/common-licenses/CC-BY-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 60 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 63 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-2.5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 63 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 70 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 63 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 66 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-2.5 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 66 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 72 +++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-ND-1.0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A05 +
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-ND-2.0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 63 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-ND-2.5 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 63 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-ND-3.0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 69 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-SA-1.0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 64 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-SA-2.0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 68 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-SA-2.5 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 68 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-NC-SA-3.0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 74 +++
>>> =C2=A0meta/files/common-licenses/CC-BY-ND-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 59 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-ND-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 62 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-ND-2.5 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 62 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-ND-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 68 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-SA-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 63 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-SA-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 67 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-SA-2.5 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 67 ++
>>> =C2=A0meta/files/common-licenses/CC-BY-SA-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 74 +++
>>> =C2=A0meta/files/common-licenses/CC0-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 32 +
>>> =C2=A0meta/files/common-licenses/CDDL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0131 ++++
>>> =C2=A0meta/files/common-licenses/CECILL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0242 +++++++
>>> =C2=A0meta/files/common-licenses/CECILL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0243 +++++++
>>> =C2=A0meta/files/common-licenses/CECILL-B =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0440 ++++----------
>>> =C2=A0meta/files/common-licenses/CECILL-C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0447 ++++----------
>>> =C2=A0meta/files/common-licenses/CPAL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0109 ++++
>>> =C2=A0meta/files/common-licenses/CPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0215 +++++++
>>> =C2=A0meta/files/common-licenses/CUA-OPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0471 ++++++++++++++
>>> =C2=A0meta/files/common-licenses/ClArtistic =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0110 ++--
>>> =C2=A0meta/files/common-licenses/ECL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 55 ++
>>> =C2=A0meta/files/common-licenses/ECL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 99 +++
>>> =C2=A0meta/files/common-licenses/EFL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 25 +
>>> =C2=A0meta/files/common-licenses/EFL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 12 +
>>> =C2=A0meta/files/common-licenses/EPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 72 +++
>>> =C2=A0meta/files/common-licenses/EUDatagrid =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 65 +--
>>> =C2=A0meta/files/common-licenses/EUPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0184 ++++++
>>> =C2=A0meta/files/common-licenses/EUPL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0204 ++++++
>>> =C2=A0meta/files/common-licenses/Entessa =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 48 +--
>>> =C2=A0meta/files/common-licenses/ErlPL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0288 +++++++++
>>> =C2=A0meta/files/common-licenses/Fair =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A09 +-
>>> =C2=A0meta/files/common-licenses/Frameworx-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 69 ++
>>> =C2=A0meta/files/common-licenses/GFDL-1.2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 20 +-
>>> =C2=A0meta/files/common-licenses/GFDL-1.3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 18 +-
>>> =C2=A0meta/files/common-licenses/GPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0252 ++++++++
>>> =C2=A0meta/files/common-licenses/GPL-1.0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0252 ++++++++
>>> =C2=A0.../common-licenses/GPL-2-with-bison-exception =C2=A0 =C2=A0 | =
=C2=A0 17 +-
>>> =C2=A0meta/files/common-licenses/GPL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0132 ++++
>>> =C2=A0meta/files/common-licenses/GPL-2.0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0132 ++++
>>> =C2=A0.../common-licenses/GPL-2.0-with-GCC-exception =C2=A0 =C2=A0 | =
=C2=A0 =C2=A06 +
>>> =C2=A0.../GPL-2.0-with-autoconf-exception =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +
>>> =C2=A0.../GPL-2.0-with-classpath-exception =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 +
>>> =C2=A0.../common-licenses/GPL-2.0-with-font-exception =C2=A0 =C2=A0| =
=C2=A0 =C2=A06 +
>>> =C2=A0meta/files/common-licenses/GPL-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +
>>> =C2=A0meta/files/common-licenses/GPL-3.0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +
>>> =C2=A0.../common-licenses/GPL-3.0-with-GCC-exception =C2=A0 =C2=A0 | =
=C2=A0 27 +
>>> =C2=A0.../GPL-3.0-with-autoconf-exception =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 28 +
>>> =C2=A0meta/files/common-licenses/HPND =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 23 +-
>>> =C2=A0meta/files/common-licenses/IPA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0182 ++-----
>>> =C2=A0meta/files/common-licenses/IPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0213 +++++++
>>> =C2=A0meta/files/common-licenses/ISC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 21 +-
>>> =C2=A0meta/files/common-licenses/LGPL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0173 +++++
>>> =C2=A0meta/files/common-licenses/LGPL-2.0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0173 +++++
>>> =C2=A0meta/files/common-licenses/LGPL-2.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0658 +++++---------------
>>> =C2=A0meta/files/common-licenses/LGPL-2.1+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0176 ++++++
>>> =C2=A0meta/files/common-licenses/LGPL-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 66 ++
>>> =C2=A0meta/files/common-licenses/LGPL-3.0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 66 ++
>>> =C2=A0meta/files/common-licenses/LPL-1.02 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 76 +++
>>> =C2=A0meta/files/common-licenses/LPPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0213 +++++++
>>> =C2=A0meta/files/common-licenses/LPPL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0316 ++++++++++
>>> =C2=A0meta/files/common-licenses/LPPL-1.2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0320 ++++++++++
>>> =C2=A0meta/files/common-licenses/LPPL-1.3c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0418 +++++++++++++
>>> =C2=A0meta/files/common-licenses/Libpng =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 79 +--
>>> =C2=A0meta/files/common-licenses/MIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 +-
>>> =C2=A0meta/files/common-licenses/MPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0109 ++++
>>> =C2=A0meta/files/common-licenses/MPL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0185 ++++++
>>> =C2=A0meta/files/common-licenses/MS-PL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 58 +--
>>> =C2=A0meta/files/common-licenses/MS-RL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 69 +--
>>> =C2=A0meta/files/common-licenses/MirOS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 49 +-
>>> =C2=A0meta/files/common-licenses/Motosoto =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 34 +-
>>> =C2=A0meta/files/common-licenses/Multics =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +-
>>> =C2=A0meta/files/common-licenses/NASA-1.3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 79 +++
>>> =C2=A0meta/files/common-licenses/NCSA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 16 +-
>>> =C2=A0meta/files/common-licenses/NGPL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0117 +---
>>> =C2=A0meta/files/common-licenses/NPOSL-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 61 ++
>>> =C2=A0meta/files/common-licenses/NTP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 15 +-
>>> =C2=A0meta/files/common-licenses/Nauman =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 -
>>> =C2=A0meta/files/common-licenses/Nokia =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 95 ++--
>>> =C2=A0meta/files/common-licenses/OCLC-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 78 +++
>>> =C2=A0meta/files/common-licenses/ODbL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0543 ++++++++++++++++
>>> =C2=A0meta/files/common-licenses/OFL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 88 +++
>>> =C2=A0meta/files/common-licenses/OGTSL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 73 +--
>>> =C2=A0meta/files/common-licenses/OLDAP-2.8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 49 ++
>>> =C2=A0meta/files/common-licenses/OSL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0164 +++++
>>> =C2=A0meta/files/common-licenses/OSL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 48 ++
>>> =C2=A0meta/files/common-licenses/OSL-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 27 +
>>> =C2=A0meta/files/common-licenses/OpenSSL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0212 +++----
>>> =C2=A0meta/files/common-licenses/PHP-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 70 ++
>>> =C2=A0meta/files/common-licenses/PostgreSQL =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 22 +-
>>> =C2=A0meta/files/common-licenses/Python-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0192 ++++++
>>> =C2=A0meta/files/common-licenses/QPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 48 ++
>>> =C2=A0meta/files/common-licenses/RHeCos-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0151 +++++
>>> =C2=A0meta/files/common-licenses/RPL-1.5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0546 ++++++++++++++++
>>> =C2=A0meta/files/common-licenses/RPSL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0182 ++++++
>>> =C2=A0meta/files/common-licenses/RSCPL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0363 ++---------
>>> =C2=A0meta/files/common-licenses/Ruby =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 82 ++--
>>> =C2=A0meta/files/common-licenses/SAX-PD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 33 +
>>> =C2=A0meta/files/common-licenses/SPL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0507 +++++++++++++++
>>> =C2=A0meta/files/common-licenses/Simple-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 27 +
>>> =C2=A0meta/files/common-licenses/Sleepycat =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 +-
>>> =C2=A0meta/files/common-licenses/SugarCRM-1.1.3 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0160 +++++
>>> =C2=A0meta/files/common-licenses/VSL-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 49 ++
>>> =C2=A0meta/files/common-licenses/W3C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 55 +--
>>> =C2=A0meta/files/common-licenses/WXwindows =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0106 ++--
>>> =C2=A0meta/files/common-licenses/Watcom-1.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0140 +++++
>>> =C2=A0meta/files/common-licenses/XFree86-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 18 +
>>> =C2=A0meta/files/common-licenses/Xnet =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 11 +-
>>> =C2=A0meta/files/common-licenses/YPL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 30 +
>>> =C2=A0meta/files/common-licenses/ZPL-1.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 28 +
>>> =C2=A0meta/files/common-licenses/ZPL-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 61 ++
>>> =C2=A0meta/files/common-licenses/ZPL-2.1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 18 +
>>> =C2=A0meta/files/common-licenses/Zimbra-1.3 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 30 +
>>> =C2=A0meta/files/common-licenses/Zlib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 34 +-
>>> =C2=A0meta/files/common-licenses/eCos-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 18 +
>>> =C2=A0meta/files/common-licenses/gSOAP-1.3b =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0157 +++++
>>> =C2=A0meta/recipes-devtools/gcc/gcc-4.5.1.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.0.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>> =C2=A0meta/recipes-devtools/gdb/gdb_7.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>>> =C2=A0154 files changed, 13946 insertions(+), 2621 deletions(-)
>>> =C2=A0create mode 100644 meta/files/common-licenses/AFL-1.2
>>> =C2=A0create mode 100644 meta/files/common-licenses/AFL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/AFL-2.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/AFL-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/AGPL-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/ANTLR-PD
>>> =C2=A0create mode 100644 meta/files/common-licenses/APL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/APSL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/APSL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/APSL-1.2
>>> =C2=A0create mode 100644 meta/files/common-licenses/APSL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/Apache-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/Apache-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/Artistic-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/Artistic-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/BSL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CATOSL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-2.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-2.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-ND-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-ND-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-ND-2.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-ND-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-SA-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-SA-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-SA-2.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC-BY-SA-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CC0-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CDDL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CECILL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CECILL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CPAL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/CUA-OPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/ECL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/ECL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/EFL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/EFL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/EPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/EUPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/EUPL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/ErlPL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/Frameworx-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-1.0+
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-2.0+
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-GCC-ex=
ception
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-autoco=
nf-exception
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-classp=
ath-exception
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-2.0-with-font-e=
xception
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-3.0+
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-3.0-with-GCC-ex=
ception
>>> =C2=A0create mode 100644 meta/files/common-licenses/GPL-3.0-with-autoco=
nf-exception
>>> =C2=A0create mode 100644 meta/files/common-licenses/IPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/LGPL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/LGPL-2.0+
>>> =C2=A0create mode 100644 meta/files/common-licenses/LGPL-2.1+
>>> =C2=A0create mode 100644 meta/files/common-licenses/LGPL-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/LGPL-3.0+
>>> =C2=A0create mode 100644 meta/files/common-licenses/LPL-1.02
>>> =C2=A0create mode 100644 meta/files/common-licenses/LPPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/LPPL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/LPPL-1.2
>>> =C2=A0create mode 100644 meta/files/common-licenses/LPPL-1.3c
>>> =C2=A0create mode 100644 meta/files/common-licenses/MPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/MPL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/NASA-1.3
>>> =C2=A0create mode 100644 meta/files/common-licenses/NPOSL-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/OCLC-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/ODbL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/OFL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/OLDAP-2.8
>>> =C2=A0create mode 100644 meta/files/common-licenses/OSL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/OSL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/OSL-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/PHP-3.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/Python-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/QPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/RHeCos-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/RPL-1.5
>>> =C2=A0create mode 100644 meta/files/common-licenses/RPSL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/SAX-PD
>>> =C2=A0create mode 100644 meta/files/common-licenses/SPL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/Simple-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/SugarCRM-1.1.3
>>> =C2=A0create mode 100644 meta/files/common-licenses/VSL-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/Watcom-1.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/XFree86-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/YPL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/ZPL-1.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/ZPL-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/ZPL-2.1
>>> =C2=A0create mode 100644 meta/files/common-licenses/Zimbra-1.3
>>> =C2=A0create mode 100644 meta/files/common-licenses/eCos-2.0
>>> =C2=A0create mode 100644 meta/files/common-licenses/gSOAP-1.3b
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
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



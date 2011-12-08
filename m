Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYhoz-0002Jn-RP
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:31:50 +0100
Received: by lahd3 with SMTP id d3so775441lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=lLU+Z4MN/+uTqbVqrI52o3RHWnkDK510ausKa75//5Y=;
	b=EkCFxy4ck+ion9A3azyduae7rvS/OgKUrG86RI7OsEbHziyxaz2WUYi0hfx9sM7G37
	UTbeD8nGV+sS30N6x8aqH61HJtglE/EFAy1EVQ7jo2QTbk70tZv/7eFrifTSwBWIvq/F
	LHUmnTtorBggOPrg/hgAk+3rqWDavRJ1VLFOg=
Received: by 10.152.145.233 with SMTP id sx9mr2608983lab.6.1323365096717; Thu,
	08 Dec 2011 09:24:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Thu, 8 Dec 2011 09:24:02 -0800 (PST)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E3F3D596@orsmsx504.amr.corp.intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1sre+EU+iSEY24+o9TNhrEpJpxq5iozVi=2oaFUBN+kxaw@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3F3D596@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2011 09:24:02 -0800
Message-ID: <CAMKF1so7d72rORTprREWtNqC+qSrh36bVCW7mXqZQr2gK+FHLQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 01/11] gst-fluendo.inc: remove unneccessary hack
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
X-List-Received-Date: Thu, 08 Dec 2011 17:31:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 8:49 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Wednesday, December 07, 2011 11:37 PM
>> To: Patches and discussions about the oe-core layer
>> Cc: hjl.tools@gmail.com
>> Subject: Re: [OE-core] [PATCH 01/11] gst-fluendo.inc: remove
>> unneccessary hack
>>
>> On Wed, Dec 7, 2011 at 9:48 PM, =C2=A0<nitin.a.kamble@intel.com> wrote:
>> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >
>> > This fixes bug: [YOCTO #1403]
>> >
>> > the custom definition of CC was causing build isuses with x32
>> toolchain.
>> > And also I found out that the hack is not neccessary anymore. the
>> > affected gst-fluendo-mpegdemux recipe builds fine without the CC
>> hack.
>> >
>> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> > ---
>> > =C2=A0meta/recipes-multimedia/gstreamer/gst-fluendo.inc | =C2=A0 =C2=
=A04 ----
>> > =C2=A01 files changed, 0 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
>> b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
>> > index 203bdba..8b24cf7 100644
>> > --- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
>> > +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
>> > @@ -12,7 +12,3 @@ FILES_${PN}-dbg +=3D "${libdir}/gstreamer-
>> 0.10/.debug"
>> > =C2=A0FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la
>> ${libdir}/gstreamer-0.10/*.a"
>> >
>> > =C2=A0EXTRA_OECONF =3D "--disable-debug --disable-valgrind"
>> > -
>> > -# Hack to get STAGING_LIBDIR into the linker path when building
>> > -CC =3D "${CCACHE} ${HOST_PREFIX}gcc -L${STAGING_LIBDIR}"
>> > -
>>
>> this needs a PR bump
>
> I purposely did not bump PR here, because it does not change output of th=
e recipe.
>

hmmm whole CC is changed if that was used before then package will
compile with different flags
wont that change the content?



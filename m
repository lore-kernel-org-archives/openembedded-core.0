Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDQBO-0004BO-6m
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 01:54:42 +0200
Received: by ewy5 with SMTP id 5so275606ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 16:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=PGwBgm0Uon/EQJUqATXlaIzBBf3HNvk71ESxMw4Mr5c=;
	b=GdzHiVuzXYWmoYFkczH9RV8JOhIAnWvCAzjdrhxZz7Cbh1Ieb7cfMRmeIKJB4BjOVN
	K8WLFnP4UgbaId7TOp/olssMEIEg6gVq308ewhf3ksGLDAuezzUiC2k+h5hQvf3kteGR
	u6qK2dbRfss9hWYUcq4RuK4SfcsCmROi0qze0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uau1B3RM8oOnS3pFOmqRLhFGK1oNgoj695xV1LgRIL+LVvQ7m7tW07fNGeP+klFeGd
	2B8YHkyPNF15hSXMXW5rJhNl3fNkqzIQoJiCDWJPB+T9s8p+/dziX2IqaFxJS/+RCTQr
	Sap7ldrC1ArmAqKsCA0c+Mi+c3EUtRzBkPluo=
Received: by 10.14.135.71 with SMTP id t47mr544011eei.220.1303516336078; Fri,
	22 Apr 2011 16:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 16:51:46 -0700 (PDT)
In-Reply-To: <20110422173207.GA20271@xora-desktop.xora.org.uk>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
	<BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
	<6B8E23E1-B345-4127-BC51-A92612BE94FB@dominion.thruhere.net>
	<BANLkTi=wNAZ2GG7PntqPXmQ3BGLgQwVD5w@mail.gmail.com>
	<20110422173207.GA20271@xora-desktop.xora.org.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 16:51:46 -0700
Message-ID: <BANLkTimT=De0uexZR+w6dgYiN3jbYifTcQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 23:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 10:32 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> On Fri, Apr 22, 2011 at 10:27:31AM -0700, Khem Raj wrote:
>> On Fri, Apr 22, 2011 at 10:25 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>> >
>> > Op 22 apr 2011, om 19:16 heeft Khem Raj het volgende geschreven:
>> >
>> >> On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> wro=
te:
>> >>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >>>
>> >>> This fixes Bug [YOCTO #477]
>> >>>
>> >>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >>> ---
>> >>> =C2=A0.../python/python-pycairo_1.8.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A08 +++++++-
>> >>> =C2=A01 files changed, 7 insertions(+), 1 deletions(-)
>> >>>
>> >>> diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b=
/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>> >>> index 7d73dc2..24b3ff2 100644
>> >>> --- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>> >>> +++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>> >>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1 & MPLv1.1"
>> >>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df2e071ab72978431b29=
4a0d696327421"
>> >>> =C2=A0# cairo >=3D 1.8.8
>> >>> =C2=A0DEPENDS =3D "cairo"
>> >>> -PR =3D "ml0"
>> >>> +PR =3D "r1"
>> >>
>> >> any reason not to use mlX
>> >
>> > Because rX is a standard and mlX isn't
>>
>> why did we use ml to start with then ?
>>
> Its mickeys initials.

heh

>
> G
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



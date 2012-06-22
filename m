Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SiDnk-0001e3-Fk
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 02:02:08 +0200
Received: by eekd49 with SMTP id d49so747525eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 16:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=wp3JJ54DBNPZo9p7lv5H6RVa2ol4lk+KbLb3KUrH79Y=;
	b=hLq32VNFD9XKliHJfHonIvS9migDq64X/rUtWFDFfG5CfTqqeXLSEwg0q9Um7ufxoV
	UnCIa4EqZmxsPQzMfLAyfWbStqYSCvgGQ3B3UWHFlqDqyWT49Gb/VtcuwlGNVXwbmOWo
	601F35xeA4fCEw2h3A/F/8/WqKnfQ1oosuoKrotdFPy7wHNlrShBxuMuBo/f8lTbJ80Y
	JftKvFzGgOhshQ9Y/bJcFvznQv8QKGoEYfS8TtPqo7UF0mEgza68vNh0IkdSikqziiAn
	5S68hCllDf/4NmKnzgP8IEj2VrBCQFeG+H1ZlKTbjszwO846N0hZlqRpzsA+hssOjwZk
	TRQg==
Received: by 10.14.37.132 with SMTP id y4mr746710eea.142.1340409080712; Fri,
	22 Jun 2012 16:51:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Fri, 22 Jun 2012 16:50:50 -0700 (PDT)
In-Reply-To: <4FE4EFE9.7090602@linux.intel.com>
References: <cover.1340205163.git.raj.khem@gmail.com>
	<a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
	<20120622063756.GK9352@jama.jama.net>
	<CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
	<4FE4EFE9.7090602@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2012 16:50:50 -0700
Message-ID: <CAMKF1soivnX80uBfC88FHe4_t381VHhxXNrpaDR5BxJfPPqjjA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Sat, 23 Jun 2012 00:02:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 3:21 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/22/2012 12:20 AM, Khem Raj wrote:
>>
>> On Thu, Jun 21, 2012 at 11:37 PM, Martin Jansa<martin.jansa@gmail.com>
>> =C2=A0wrote:
>>>
>>> On Wed, Jun 20, 2012 at 08:18:37AM -0700, Khem Raj wrote:
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0meta/recipes-devtools/gcc/gcc-4.7.inc | =C2=A0 12 ++++++------
>>>> =C2=A01 files changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
>>>> b/meta/recipes-devtools/gcc/gcc-4.7.inc
>>>> index 34a73b1..25a1088 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>>>> @@ -3,12 +3,12 @@ require gcc-common.inc
>>>> =C2=A0PR =3D "r2"
>>>>
>>>> =C2=A0# Third digit in PV should be incremented after a minor release
>>>> -# happens from this branch on gcc e.g. currently its 4.7.0
>>>> -# when 4.7.1 is releases and we bump SRCREV beyond the release
>>>> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
>>>> +# happens from this branch on gcc e.g. currently its 4.7.1
>>>> +# when 4.7.2 is releases and we bump SRCREV beyond the release
>>>> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>>>> =C2=A0# to reflect that change
>>>>
>>>> -PV =3D "4.7.0+svnr${SRCPV}"
>>>> +PV =3D "4.7.1+svnr${SRCPV}"
>>>>
>>>> =C2=A0# BINV should be incremented after updating to a revision
>>>> =C2=A0# after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
>>>> @@ -16,9 +16,9 @@ PV =3D "4.7.0+svnr${SRCPV}"
>>>> =C2=A0# 4.7.1 then the value below will have 2 which will mean 4.7.2
>>>> =C2=A0# which will be next minor release and so on.
>>>>
>>>> -BINV =3D "4.7.1"
>>>> +BINV =3D "4.7.2"
>>>>
>>>> -SRCREV =3D "186651"
>>>> +SRCREV =3D "188658"
>>>> =C2=A0BRANCH =3D "gcc-4_7-branch"
>>>> =C2=A0FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7'=
 ], d)}"
>>>
>>>
>>> I'm not sure if this one is new, but libgcc now reports unpackaged
>>> file:
>>>
>>> NOTE: package libgcc-4.7.1+svnr188658-r2: task do_package: Started
>>> WARNING: For recipe libgcc, the following files/directories were
>>> installed but not shipped in any package:
>>> WARNING: =C2=A0 /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
>>> WARNING: =C2=A0 /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h
>>
>>
>> can you see couple of things 1. if this file is being generated and
>> installed during libgcc build or if its coming from the bits that are
>> stashed away from gcc-cross build
>>
> Khem, this file seems to be set up during do_configure time
>
> config.status: linking
> /srv/ssd/sgw_ab/builds/repack/tmp/work-shared/gcc-4.7.1+svnr188658-r2/gcc=
-4_7-branch/libgcc/unwind-generic.h
> to unwind.h
>
>
>> this file should not be packaged with libgcc so right solution will be
>> to delete this file
>
>
> Will you provide the patch please.
>

eventually yes if no one beats me to it.



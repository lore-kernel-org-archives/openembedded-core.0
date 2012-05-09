Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SS9Fv-0002fU-IJ
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:56:47 +0200
Received: by wgbdr1 with SMTP id dr1so445398wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Srdm305eVPHgOGkW1f8mAcxFPzmuVdHqT7rXFUw27M4=;
	b=TIPxZiF+SlbaGvSr9Pi10jflHuXb/9qzgSVdapx6RGp+tx8ADi5pSHv0GLcwDoUe5h
	Z96RGmgK3IMcduOaNJ5EIt2aYGLi42tFv+UiarY4tdxJltJrluzAiHGSz3hUhupeg8yC
	qeTTo9lzcbbt2XH9SIVExTu6BcitcIV+JhYKQ8Y3FrixvZe0gh93Vp1oZi1MRTJXZmcC
	oJEHRAju1Nes7XXMU9Dd2vVQdIxQwdveYzztfj4u7Iymxnzpgmcq0nWbKdkoxhlUOPdZ
	9c4v6bwGkYLvVDxu5sTHg2Qo61ImZxHiyHYG/O5EWo2NT0XRt3/x5Cxii/YjNMnFu6SP
	eeeg==
MIME-Version: 1.0
Received: by 10.50.158.227 with SMTP id wx3mr1825858igb.31.1336578414184; Wed,
	09 May 2012 08:46:54 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 08:46:54 -0700 (PDT)
In-Reply-To: <4FAA8415.40006@windriver.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
	<CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
	<CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
	<4FAA8415.40006@windriver.com>
Date: Wed, 9 May 2012 18:46:54 +0300
Message-ID: <CAF6bG8fT5RvJxcwwQKzBUpG=XZtJzVJ6Cm8L7w-SRZ-wLWNzfw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 15:56:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 May 2012 17:49, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/8/12 9:09 PM, Khem Raj wrote:
>>
>> On Tue, May 8, 2012 at 6:53 PM, Marko Lindqvist<cazfi74@gmail.com> =C2=
=A0wrote:
>>>
>>> On 9 May 2012 04:36, Khem Raj<raj.khem@gmail.com> =C2=A0wrote:
>>>>
>>>> On Tue, May 8, 2012 at 5:59 PM, Marko Lindqvist<cazfi74@gmail.com>
>>>> =C2=A0wrote:
>>>>>
>>>>>
>>>>>
>>>>> =C2=A0You should know that I'm just figuring out what to do with
>>>>> "rtld(GNU_HASH)" that already exist for eglibc. When building
>>>>> deb-packets based image, that results in:
>>>>> "reference to 'rtld': error in version: version number does not start
>>>>> with digit"
>>>>>
>>>>> =C2=A0I've confirmed that error message is caused by this by simply
>>>>> removing "(GNU_HASH)" -> =C2=A0eglibc build success
>>>>
>>>>
>>>> yeah this is rpm brain damage actually that we are dealing with here.
>>>> I think rpm should be fixed for this. I am not entirely sure why this
>>>> would be needed on current OE-Core lets say if its needed it should th=
en
>>>> be made specific when someone is using rpm for packaging.
>>>
>>>
>>> =C2=A0I've not yet figured out what all this tries to achieve, but are =
you
>>> saying that it might be acceptable solution for eglibc too to simply
>>> remove "(GNU_HASH)" if nobody from rpm world vetoes such patch?
>>
>>
>> yes. We need to find why this PROVIDE is needed at all in current OE
>
> The per-file "advanced" dependencies, which are not yet being used by ipk=
g
> or deb, include a marker for rtld support. =C2=A0The libc on the system n=
eeds to
> have a provide that it supports GNU_HASH, otherwise a missing dependency
> occurs and the system knows the package and libc has a mismatch.
>
> IPKG works with this, but apparently DEB does not. =C2=A0We have two solu=
tions
> that I see.
>
> If the format of the RPROVIDE is legal in OE, then the DEB package soluti=
on
> needs to transform the provide into something that is legal for debian st=
yle
> packages.
>
> If the format of the RPROVIDE is illegal in OE (and just happens to work)=
,
> then the RPM package manager needs to transform the provide...
>
> RPM is already doing a number of transforms to change from OE format to R=
PM
> format, I would expect the same behavior from other package managers --
> assuming that the RPROVIDE is legal.
>
> Who can definitively state what the legal RPROVIDE format is in OE?

 If we are to define it now, and selecting from existing alternatives,
parenthesis could denote either:

deb style) Single version number override. Recipe 1.0.0 can provide
some 1.0.1 package.

rpm style) General marker (does it even handle multiple ones?)


 Any use-case relevant to OE I see for deb style handling can be
handled with smart use of rpm style, but not the other way around.



 - ML



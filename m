Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5037771C65
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 19:16:54 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id he10so41640286wjc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 11:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F5KFzbK7Rpzmn6XnB9PFlVWwJr14m2ehkY5HRP3uLTk=;
	b=Urwb6GYrGprrYMt0dzoag39CeKVvVQ0IKzsf+4DreVreYWsu3mwPpXET4i6DviK2PE
	RlNP0LJP3M7naKJxuy8rdUxLq99QCx89QznpudKomVvsIedg0RRLNgU6WvqZ2InNSbHK
	/x9uEUDx6AHiiOs8thIszacKikFo1rK9+Z7YkItfUZxhDeHQUyeKysmlOfVBK0ujeO16
	GXb1/KBqyja4sm3ocIejPbCHPdVFZRBDNuLaw1qhu6ZQ4CZUTezWRjMmvkuVwxS8DI9B
	FIiPZaVFwu+QKFrzCLGcAgD7GG04y83E+Dn17t5lWOrA5Q8Pyjp69m6VA1jkPLtgEuIS
	SduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F5KFzbK7Rpzmn6XnB9PFlVWwJr14m2ehkY5HRP3uLTk=;
	b=mZOK2Hhna+slJrhm90mTL/cKpsiFvbJFzBrtBKCbqt2S0JOQ6ZHis3FNrBFAG2Ymkr
	15bja/fQYzcnk0Jk/1iQilEzQxzm7AlyHEKmAe+U+KibAD1BzrB8DXC1WgoQdFCq+PqH
	0ZFK8qGA9GfJtRs7BMBZhdvBoyBiTk626zukaESXND6BL9wQ+xF2fl6lGTO+UktL20+z
	Z1VzdHXG/8HIB8sLb8TDWbKgpwxFixuUxM6Cou2ViI1j2OIiNLDap0/8RhZ4h32hu2S+
	77iL4KRHPmVvhJUkXt6OD9B/QWPyDQnvErC0Fe2MARU0Bu/SYJE4wBiODqvL9neL5ZtK
	I8Mw==
X-Gm-Message-State: AKaTC02SIBl88PlgKu28PGQ3gDqyixFD4SRkSaU7eLjKklhpVzcXchjawq1w1tijJNew0WQlmffKk76gIdBNcg==
X-Received: by 10.194.115.226 with SMTP id jr2mr63961881wjb.75.1481224615720; 
	Thu, 08 Dec 2016 11:16:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Thu, 8 Dec 2016 11:16:55 -0800 (PST)
In-Reply-To: <584991B7.9050603@linux.intel.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
	<5840A839.5070704@linux.intel.com>
	<CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
	<584991B7.9050603@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 8 Dec 2016 11:16:55 -0800
Message-ID: <CAJ86T=We5bfDF6EpGs_sPph16O=Niz+ei5vADWbMTXzsTq-C8g@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Thu, 08 Dec 2016 19:16:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>>> On 12/01/2016 04:39 PM, Khem Raj wrote:
>>>> On Thu, Dec 1, 2016 at 8:34 AM, An=C3=ADbal Lim=C3=B3n
>>>> <anibal.limon@linux.intel.com> wrote:
>>>>> Some distributions (like opensuse421) supported by the project
>>>>> comes with older gcc releases, -fstack-protector=3Dstrong is supporte=
d
>>>>> by GCC>=3D4.9.
>>>>>
>>>>> This causes a build failure when install perl-native from a sstate th=
at
>>>>> comes from a machine supporting -fstack-protector=3Dstrong [1].
>>>>>
>>>>> So disable usage of this flag in perl-native builds, this patch could
>>>>> be removed when all supported distros comes with GCC>=3D4.9.
>>>>
>>>> Instead of disabling it. Can it be made detectable during configure.
>>>
>>> The issue here is that comes from SSTATE mirror so the configure step
>>> isn't executed again when a other machine without
>>> -fstack-protector=3Dstrong download the sstate artifact was generate in
>>> other machine with -fstack-protector=3Dstrong support. This is only for
>>> native builds for target builds in enabled.
>>>
>>> We have similar patches for example in rpm,
>>>
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtoo=
ls/rpm/rpm/popt-disable-auto-stack-protector.patch
>>
>> yeah I see, thanks, I guess we need to bring it down to lowest common
>> denominator I guess.
>> maybe we should start thinking about gcc-native
>>

Is it correct that native sstate from a host with gcc < 4.9 should be
reused by a host with gcc >=3D 4.9 ?

Doesn't the change in NATIVELSBSTRING prevent that from happening?


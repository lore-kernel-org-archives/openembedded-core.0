Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQSip-0005AT-5n
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 02:19:39 +0200
Received: by lags15 with SMTP id s15so1957lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 17:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=bshhP5PYmGk/UfmKncZRBC+naP4hc1bWouTjAwOUSN8=;
	b=WqXnYTeZ5EfSknusQhBI+VP7dNbHey0o7VAZE7eM2T6rHD7U36T1cM0JBBvhYmAbRE
	0JHAdQCPsosZ9O5LCnKc1gIsLWLF40MI4bWT+rnj4MYrD4Czl7URAPKldXhTjj7IhH0r
	dziZ4naW31XI/ddGOE71gLg9sqDE9TL6E9LN5+rLuv+CA2pCm5F5arUcRdNwXlnj1qIk
	RIuqibVUzMzYQJHgyaGQhsxDBtn4Lcb8jK9vd2dEjfj5/vQvmOLS10dy704RGEz3o+Kg
	bfmbPOiIRZMr0g79Y+bfDtvAD5TSCdOJHZEAARDSBZc0qeBqCuxdk76ZvsXhD2pWdx20
	XBQw==
Received: by 10.112.86.101 with SMTP id o5mr3816878lbz.1.1336176591730; Fri,
	04 May 2012 17:09:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 17:09:21 -0700 (PDT)
In-Reply-To: <4FA457D8.4020102@linux.intel.com>
References: <CAF6bG8djbQrRN5RoSPTdTha50qqEOp=CTxFk-AzWcprTvzO9+A@mail.gmail.com>
	<CAMKF1sr3__=2kd6UneGYb4-QyO7+J3-ATtkJUbbjA7NsGFsFjg@mail.gmail.com>
	<4FA457D8.4020102@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 17:09:21 -0700
Message-ID: <CAMKF1sr=sZeYDom2xk0-hNeG75kzq2TwtV5r5sMHJhEhX9GQUw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting nonexistent files from debian.org not erroring but saving html-page as destination file, Was: [Patch] Update dpkg to one available
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
X-List-Received-Date: Sat, 05 May 2012 00:19:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2012 at 3:27 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/04/2012 02:59 PM, Khem Raj wrote:
>>
>> On Fri, May 4, 2012 at 12:49 PM, Marko Lindqvist<cazfi74@gmail.com>
>> =C2=A0wrote:
>>>
>>> On 4 May 2012 19:06, Saul Wold<sgw@linux.intel.com> =C2=A0wrote:
>>>>
>>>> On 05/04/2012 04:29 AM, Marko Lindqvist wrote:
>>>>>
>>>>>
>>>>> =C2=A0I'm trying to make my first openembedded-core build. That faile=
d due
>>>>> to dpkg-1.15.8.5 being not available for download any more.
>>>>>
>>>> This should be still available on our MIRROR.
>>>
>>>
>>
>> Saul
>>
>> actually with OE-Core I also hit similar problem and we need this patch
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/m=
isc&id=3D044dd59a6288064d7325a93684660443340c2460
>>
>>
> Khem,
>
> thanks, submit this as a proper patch against 1.2.1 and we will get it fi=
xed
> up.

I submitted it to misc-updates patchset for master for now.

>
> We have seen this before and I thought we had a bug filed, to check mirro=
rs
> when the checksum fails.
>
> I will file a bug.

yes I have seen this and infact yesterday I was looking at the fetcher
code it only does
checksums on first mirror fetch and ignores subsequent mirror hits.

>
> Sau!



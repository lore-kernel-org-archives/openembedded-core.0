Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 89A736E687
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:37:19 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u188so226229848wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Gu9yBeeH/rY14OJmwPb4PdmamF+XEuGvnuXBWkxPLcA=;
	b=Mn9kVGdPLX698eMJmZEdsHfvy8341uVpa+PenbLaM8EwGNvA4eD/O7rnoxfK1ymfEN
	O5aK7bXrMTIkOmMLWvqLelOTwNkkDYGUKVE5/VHVKuDS6sbtP2KFDy7dd+x1E1CdfgWB
	TV7UhTKsYB17B5y5b6Rb1YP8hht5YGxKCrxk8AiQgaLozbP7xQy4tZua5dwS3JY1OF/t
	7KlvMbjKi5OgqsZT/mDtiu5t2Pt92YpJ+/byaCeEoywU1K0RhvGFG7LoqNayWyNbCMmJ
	qW3VclknINE0ffQbTzPPmAzBF+GhVaYFXaIU7QHce/kglqFBpM2iJR9VUc6F8ft2/Q3h
	Z3ng==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr133891292wjf.43.1452537439666;
	Mon, 11 Jan 2016 10:37:19 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 11 Jan 2016 10:37:19 -0800 (PST)
In-Reply-To: <CAMKF1somhhQ9h5Bfzg3fQgv1UwB4PahuWWFUPjPXQ1wy4ecwYQ@mail.gmail.com>
References: <1452277369.7598.136.camel@linuxfoundation.org>
	<CAMKF1somhhQ9h5Bfzg3fQgv1UwB4PahuWWFUPjPXQ1wy4ecwYQ@mail.gmail.com>
Date: Mon, 11 Jan 2016 10:37:19 -0800
Message-ID: <CAJ86T=UpqwYB3otkO_r71HSgnTxOoCWRHPyho4sTGnjThmUjZQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Mon, 11 Jan 2016 18:37:22 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 9, 2016 at 9:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jan 8, 2016 at 10:22 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> xz gives better compression results than bzip/gz but is often slower.
>> Using parallel compression mitigates this somewhat and is particularly
>> useful for the SDK.
>
> I have proposed another tool called pxz back in Sept last year
> http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110971.html
>
> although pixz seems to be well maintained and active, would be nice to
> know what do people mostly use.

The pixz README contains a summary of some of the alternatives - and
does mention high memory usage as a potential issue for pxz.

  https://github.com/vasi/pixz#comparison-to-other-tools

>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb b/meta/recipes-support/pixz/pixz_1.0.6.bb
>> new file mode 100644
>> index 0000000..e6e4ac2
>> --- /dev/null
>> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "Parallel, indexed xz compressor"
>> +
>> +DEPENDS = "xz libarchive"
>> +
>> +SRC_URI = "https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz"
>> +SRC_URI[md5sum] = "f6dc5909c9a31b192f69aa397ae8df48"
>> +SRC_URI[sha256sum] = "02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8"
>> +
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5cf6d164086105f1512ccb81bfff1926"
>> +
>> +inherit autotools
>> +
>> +BBCLASSEXTEND = "native"
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <net147@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1534C612E5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 00:45:07 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id c63so148031804iof.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 17:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=r2Is1sUU7v1V8q1UMvkwtFOFNnbfRAoTDx8NPK2h4UQ=;
	b=TVMtEzpVazwAEiCQ7eS5lPn+b+b6SjXDoRI3TjtmM7AZi/F4kbDPjiF+csGL7Sosr8
	Dnm2QHgDfAHLM4VQ54zbv2j+wZrw+HHPEk+WOe3YC0RDf2QaaHL+Cc/7uqZBXXUCCwSo
	M2lJXi/3ASLWavqssChZ5xXk+TYU/8VZ7JTBAtrU1MbW8ffQbxLDhLe4dMY/u8H/mnqq
	Ed2JEx5AZVXLDY/vs+iGylGhjLJ6kiySQyw5B+CyJTPdp1zyJWPiIva6wkZt4p/BUm+7
	fsXyMGMcVL7j/4qhWGpbEv3joqXyr+Sp7Ix0stFZcDVtGSc92T8lrg1q5WTM7OAxu45v
	FWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=r2Is1sUU7v1V8q1UMvkwtFOFNnbfRAoTDx8NPK2h4UQ=;
	b=OQJS8cJ7BPSowk5/mzZ3ObRP9abtIBy56uvDQN1/1rzzQfzzS9bGXuFfI7RDwz49Hx
	GtlKs9PM3uvOLoxRQC46NVqHqsjHu43G+GhUGiTlMR2obpf2HxAPTbOIk3L7MLGMfHdR
	CcTnAnx+yEedzr2BmlQL5au+skGVLmzJtwJtxCO8qDoCRxjA0bzy9fCeLKru/omO959a
	Njb7L868u2XtmMLAH/0bkYxewUHQtp2iQr4dVuT/3vxyyz6iJjY5VNVBkGsztZw9WLY8
	ukfPnQx5icHbQgQMON4YPYFkLZJusi9CcYe1bELbDlA1qlZfbytzo5dCjq6tlMGcaEHW
	+h6w==
X-Gm-Message-State: AD7BkJJ7iIFPzdxVsIxM+4SfzNHSxC9SWaWC0f89/9DDEZNI4jHS9OCPpeSqKn7quHouJPHepiXMMLzS7vxsag==
MIME-Version: 1.0
X-Received: by 10.107.12.95 with SMTP id w92mr22275880ioi.114.1459039508352;
	Sat, 26 Mar 2016 17:45:08 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Sat, 26 Mar 2016 17:45:08 -0700 (PDT)
In-Reply-To: <1459032411.21672.1.camel@linuxfoundation.org>
References: <1458905600-21185-1-git-send-email-net147@gmail.com>
	<1459032411.21672.1.camel@linuxfoundation.org>
Date: Sun, 27 Mar 2016 11:45:08 +1100
Message-ID: <CANwerB0dfdPVOKu80CEH0dRh8y_FNoVFfQ5ws07t=idP_1BGXQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: use PACKAGECONFIG for python and readline
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
X-List-Received-Date: Sun, 27 Mar 2016 00:45:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 27 March 2016 at 09:46, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-03-25 at 22:33 +1100, Jonathan Liu wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> index ae97759..6e42af1 100644
>> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> @@ -5,15 +5,17 @@ SUMMARY = "GNU debugger (cross-canadian gdb for
>> ${TARGET_ARCH} target)"
>>  PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>>  BPN = "gdb"
>>
>> -DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext
>> nativesdk-readline nativesdk-python \
>> +DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
>>             virtual/${HOST_PREFIX}gcc-crosssdk
>> virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk
>> -${HOST_PREFIX}libc-for-gcc"
>>
>> -RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang
>> nativesdk-python-re \
>> -                   nativesdk-python-codecs nativesdk-python
>> -netclient"
>> -
>>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>>
>> -EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
>> +# Overrides PACKAGECONFIG variables in gdb-common.inc
>> +PACKAGECONFIG ??= "python readline"
>> +PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without
>> -python,nativesdk-python, \
>> +                         nativesdk-python-core nativesdk-python-lang
>> nativesdk-python-re \
>> +                         nativesdk-python-codecs nativesdk-python
>> -netclient"
>> +PACKAGECONFIG[readline] = "--with-system-readline,--without-system
>> -readline,nativesdk-readline"
>>
>>  SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
>
> Sadly this breaks multilib tests on the autobuilder:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
> lds/719/steps/BuildImages/logs/stdio
>
> I'll have to remove this from the queue until we can figure out a
> fix...
>
> Cheers,
>
> Richard

I have posted another patchset which takes a different approach and
disables the conflicting PACKAGECONFIG variables.

Regards,
Jonathan


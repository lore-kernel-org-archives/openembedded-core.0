Return-Path: <wrob311@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id D57B472006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 21:57:48 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id s18so1558021lam.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 13:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=zRe71lLJME5vPSJso8BELH4qBBYWyUiXSleQ8d4t1T8=;
	b=GkPFySbkUbyH2KZHyytiK2rH2r94dq0Az/JE0WXqUwrYJWaScuZsUYJSSRUKDnK3yw
	FxCflu45okWJrO1tfqqxJxv/gM+FrdRKTajrbe3m5KJs0c9F5cgGRTXuvnXjjwYp0WGn
	oIOdmKc5Jmk8gQ5dpJWVGMa5yiE/XykQkylZTnQL1hslwcJ3VEGiRd8cl3g/gBdf9qLp
	HN10A3QakGuPN3yBlSzVjDvPChGiJ6KKt9MHeEu8hot9PLnaYN4q4Pn+kpWTsECVRssI
	4pgH3Uf3YXYl+hIy4guHcxMiivTQ875jY1eF/quoPWxToZudm0vJBPUZiWH5JXczVOeM
	S8Jg==
MIME-Version: 1.0
X-Received: by 10.152.43.197 with SMTP id y5mr167785lal.82.1415224666882; Wed,
	05 Nov 2014 13:57:46 -0800 (PST)
Sender: wrob311@gmail.com
Received: by 10.112.163.197 with HTTP; Wed, 5 Nov 2014 13:57:46 -0800 (PST)
In-Reply-To: <5458F733.2010600@linux.intel.com>
References: <20141103235157.GC19739@greymatter>
	<5458F733.2010600@linux.intel.com>
Date: Wed, 5 Nov 2014 21:57:46 +0000
X-Google-Sender-Auth: iZZT1mIe9zU_JazswCT71h5OFnc
Message-ID: <CA+92fu_H0YfmxtxyD2RPh60kEM6EXSWiOxWrGCy732ZW0PE7xw@mail.gmail.com>
From: Artur Wroblewski <wrobell@pld-linux.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Subject: Re: python 3.4.2 patch
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
X-List-Received-Date: Wed, 05 Nov 2014 21:57:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 4, 2014 at 3:56 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/03/2014 03:51 PM, Artur Wroblewski wrote:
>>
>> Hi,
>>
>> As advised at
>>
>>      https://bugzilla.yoctoproject.org/show_bug.cgi?id=6857
>>
>> I am attaching a patch to replace Python 3.3.x with Python 3.4.2. This
>> also
>> fixes issue with missing basic Python 3.x modules, see
>>
>>      https://bugzilla.yoctoproject.org/show_bug.cgi?id=6831
>>
>> Build tested with git master:
>>
>>      $ tar tvjf
>> tmp/deploy/images/qemux86/core-image-minimal-qemux86.tar.bz2 | grep
>> python3.4 | wc -l
>>      2028
>>
>> Regards,
>>
>> w
>>
>>
>>
> Thanks for working up the patch.
>
> Your patch needs a Signed-off-by: tag and alittle more explaination in the
> commit message as to what you did (removed patches, rebased patches, ...),
> It's also important to note why the LIC_FILES_CHKSUM changed, it might be as
> simple as version or date changes, but we need to flag them in case the
> actual License changed.

Will do.

> Would it make sense to use a PYTHON_MAJMIN in the manifest generator instead
> of hardcoding the python version? This would allow for the manifest.inc
> changeset to be much smaller.

Probably. But I would prefer to minimize the first patch as much as
possible. I understand
that the faster the good quality of Python 3 is achieved the better,
but I would prefer
to do that in several, smaller and hopefully more manageable steps. At
the moment
Python 3.3.3 in Yocto simply does not run (looks like just copy from
Python 2.x just to
make it compile), so I think you can cut me some slack here as my patch makes
Python 3 run in Yocto. On my side I promise more patches in near
future, i.e. more
SRC_URI patches need review, pip integration would be nice and some of
the modules
like decimal need additional work.

Regards,

w


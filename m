Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 153DF77428
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:05:25 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ho8so53124089pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=DT34N2VwcHu2fxYt5jh3CcBtoOxDuEgOZ5PP05c2OCg=;
	b=QzOCM5lOry+I5EJ5qXzoT58VvV4/fxj0aPbY5A31DgOXJuUP3oTP8Ow5oBZPwQRvAa
	0npPSzjOZFbYEf6vkWofLiUyIa/2MYbmRCP1JiOkMHJRgW7za7dfNOJvhaEJdW8gU8eL
	vRll6/rzMTEvas3DvT9v5NAYcXj1RkHQmW/RcBXNzLpiEUdVZUPTltjUPJc890gahC6C
	WJF7qto4hhlIiF3/AnCBzOQS4R435eBFmhVovkFaxjwOkc9XPj+yHJ3eCFTfJSV1gzqO
	GUubSJdDYURfH3z+wANQugEhgrl1hUALOpj6CKbUURs2DUlQTd6PUYDhXFeEPc9Y8Z5f
	tbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=DT34N2VwcHu2fxYt5jh3CcBtoOxDuEgOZ5PP05c2OCg=;
	b=NqvIfLViiaSFNYAcMrf7uwOyI7VCMoymbX9M3gspe/OxTE7al10D+XM9RXJs3a+684
	9Dx+AKbB3KzzCitQDX9UB+JekAPWk5ffbTWhpULugmZXfA1DyRT1F8bJNfENS9NnVGK6
	dQpW/b2LAi5lur7lTgoIByYkIqO6uvFAbwQ5kcU5sZwgImvwwRK6KmQ1GCVQE7I284TK
	mOtURjkWD0qGdu6OYdZOPYLjyoRtakNH7TBRc2egnpKNwlvLfIcjBLLBqr+2qgO9ehTF
	/e+I7hg7mxkxxPzI5x4MuMeeNwpwub7bitwGk+JNmTdUEvU+aJzUqfPUQaIgrrv0TxqI
	EMNw==
X-Gm-Message-State: AD7BkJKxkEqI1xeF8DEVege5RM5ft0SnD7/bR6MnS7JL5XpENKl0TIjny129rOmZFaG0MKKy7uFCnRRdWd8RRg==
MIME-Version: 1.0
X-Received: by 10.66.164.39 with SMTP id yn7mr2249329pab.107.1456495526588;
	Fri, 26 Feb 2016 06:05:26 -0800 (PST)
Received: by 10.66.155.201 with HTTP; Fri, 26 Feb 2016 06:05:26 -0800 (PST)
In-Reply-To: <57788.10.252.8.77.1456497820.squirrel@linux.intel.com>
References: <1456483945-16340-1-git-send-email-net147@gmail.com>
	<20160226110428.GA2557@jama>
	<CANwerB0bs=0b0r_mj+VJ+rgYz56jKUuSiUgs7kdK+tD9f=Ot8A@mail.gmail.com>
	<CAJTo0LYS-u77Lg+Q4OWT9syYvQVP-631RQ+N9GRRoBKg+6r3Tw@mail.gmail.com>
	<CANwerB2gBZKqfkXoaFH_dhkQAfDvN7TLeBceyOxsdVJzaxDgGQ@mail.gmail.com>
	<57788.10.252.8.77.1456497820.squirrel@linux.intel.com>
Date: Sat, 27 Feb 2016 01:05:26 +1100
Message-ID: <CANwerB2cjxfhSL5Gw8JHRweuTTk=anxK0w-kzzBkY6gQ1f3ERQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: alexander.kanavin@linux.intel.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 14:05:29 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2016 at 01:43,  <alexander.kanavin@linux.intel.com> wrote:
>>> I'd call that a bug, and should be simple to resolve (pass expand=True
>>> when
>>> fetching getVarFlags in the PACKAGECONFIG handling code).
>>>
>>> Ross
>>
>> Feel free to submit a patch to handle the PACKAGECONFIG expansion and
>> then I can update the fix.
>
> I think you need to solve this in a different way altogether. Write a
> patch for the upstream code that turns a floating, implicit xv dependency
> into something that can be explicitly turned on and off, and then add a
> PACKAGECONFIG option for it to the recipe.
>
> Alex

Okay. Please disregard this patch.
I will rework into a new patch.

Regards,
Jonathan


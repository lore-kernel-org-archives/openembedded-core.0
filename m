Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id C0CDB793BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:44:02 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id j14-v6so1837921vke.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 18:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oiyHimx35zBT6Hjri0KADIRc2c7+ekoMJmJvqOeimrM=;
	b=VoABOnlHpPus/imQ2DoMYwbIpJqZ3nHovrHbQE8R0wgJVgh5peMYHf+1w3Bc+edRA3
	VBkXoQ7YP4jdc4DmXLzvpaTH2LS0hHH8J6QDS59b96DBKLI4lGCJ6iKESJl6UzGuUVza
	IAoQvzewq3dsfV2B8uUUqQKVngfqEcrLGtKKjRplmAdNh0/Nf+ppSthuidS1nS2r3ec7
	keLJpzJCJ7/Z4jii8bDCUUzPYHuxSNMgDBiTDqtMbWqfTQpLxTfxrIjWWFK2JqkfxcS7
	lbgrMxlv1harTbIgHR3u6Rl08MOnqOpvvHN/Sgn4G8wiRtsThGnWT7MoUnbCUSeXRNV4
	aNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oiyHimx35zBT6Hjri0KADIRc2c7+ekoMJmJvqOeimrM=;
	b=uMeEp4EDd5vYFSQ3RJOpQiLYMuFCtdM4+ypk2MC/YGprdiTHrTKBXlr3gQ/rcyWiAs
	4zC8MRW2y0AafJOfwbTBu0trxPb3Y4+j2w3WJbt/GxHAqWIQ/CyaOKl2SUAchO6lToRu
	uNrJnD606JVT0LrBE+WpYZpK+QJcYTIPKxUlXqpYscmL3sjfxMUscs0hEEHjWwqV7rx+
	jmFkOp/AXC86MpYu4j+PsVeMZQZ3RehirEj05YBYEyKJHFDaB6ZYrIFqi0hmv+3rzI1H
	T7FeIbTK9YNIdscQ8+Yc2iBi2gI8MwKyTfTXDAZgcWrLzCS7ML2a5uR4hvzT7qNNBzJ3
	B0UQ==
X-Gm-Message-State: AOUpUlG47IbtBau8nGxZ/tE1554Jn60J/sx5kJpn4zYJBxfecFrAemjv
	2VJC+3O8atbX9bqdWGsq+kp+KrxArVsfA+LVgW4=
X-Google-Smtp-Source: AA+uWPwvwDdvi8Xb9ufKf3lVTBV7xfox9EBGCqp8ojaoha7wYkZXYOD+hG0NcLSw+W26cJ+jOLKKYLkzTKkTBr4ll9E=
X-Received: by 2002:a1f:c252:: with SMTP id
	s79-v6mr37570407vkf.127.1534988643539; 
	Wed, 22 Aug 2018 18:44:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a:0:0:0:0:0 with HTTP;
	Wed, 22 Aug 2018 18:44:03 -0700 (PDT)
In-Reply-To: <188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
References: <20180816062633.29868-1-anuj.mittal@intel.com>
	<CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
	<188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Aug 2018 18:44:03 -0700
Message-ID: <CAJ86T=W5cVZ+VEdRVi96-QRx5BhmTPpWZ1HU29UuXhmrZbS6Xg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Thu, 23 Aug 2018 01:44:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 9:48 PM, Anuj Mittal <anuj.mittal@intel.com> wrote:
> On 08/17/2018 03:31 AM, Andre McCurdy wrote:
>> On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal <anuj.mittal@intel.com> wrote:
>>> Enable profile guided optimization (pgo) for python3. Enabling pgo in
>>> python is generally as simple as invoking the target profile-opt which:
>>>
>>> - builds python binaries with profile instrumentation enabled,
>>> - runs a specific profile task using that python to get the profile
>>> data and,
>>> - feeds the compiler with this profile data and rebuilds python.
>>>
>>> This change invokes qemu-user for the second step of running a profile
>>> task using target python. Depending on how long profile task takes to
>>> run, this might add a significant time to compilation (which would be
>>> true for native builds too). The default profile task can be changed by
>>> the users depending on what makes sense for their use case (or can be
>>> left empty). In case qemu-user isn't supported, profile task won't be run.
>>
>> Is it important to re-create the profile data during every build or
>> would we get most of the same benefits from using reference data which
>> is generated offline?
>
> We should get the same benefit using the data generated offline as long
> as the source code/configure options/flags are same I believe. I have
> only tried with data generate offline using the same build configuration
> though.

As an additional data point, python do_compile now takes approx 18
minutes on my laptop. A single qemu-i386 thread loading one CPU core
at 100%, with nothing else being scheduled in parallel for most of
that time.

If we can get most of the benefits of pgo with a pre-generated data
file then that might still be something to explore.

> It would however need tweaking of the Makefiles to pass
> -fprofile-dir=<path> while using the profile data among other things.
> Please see this if you'd like an example that works:
>
> https://git.yoctoproject.org/clean/cgit.cgi/poky-contrib/commit/?h=anujm/9338&id=e57654cb51b121e9dfa76e66432c4d37fd339d42
>
>> How big is the data file? Is it binary or text?
>
> gcc -fprofile-generate generates .gcda files which are used only for
> profile use and can be deleted later and aren't installed. For more
> information:
>
> https://gcc.gnu.org/onlinedocs/gcc/Gcov-Data-Files.html
>
>> Is the data expected to be target architecture specific?>
>> If reference data were used, what are the consequences of the data not
>> corresponding exactly to the current build configuration? A build
>> failure? Or just a decrease in the effectiveness of the optimisation?
>
> From gcc man page:
>
> "By default, GCC emits an error message if the feedback profiles do not
> match the source code. This error can be turned into a warning by using
> -Wcoverage-mismatch. Note this may result in poorly optimized code."
>
>>
>> Does the profiling instrumentation measure execution timing? Or only
>> the frequency / order in which functions are called? ie is there any
>> concern that data generated from running under qemu may not be optimal
>> for running on the target?
>
> It tries to identify code hot spots, how many times each branch and call
> is executed and how many times it is taken or returns etc. so I don't
> think it should matter. I did try on target hardware and using qemu as
> well and at least performance wise, I didn't see any difference. I
> didn't perform any exhaustive analysis though.
>


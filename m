Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sykof-0004sS-W5
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:31:26 +0200
Received: by qaat11 with SMTP id t11so2132323qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KWc7pT/oHaWeWnHizsMfhob3YtlBV+VxFGYHsVVZs70=;
	b=UXRy2/gkpwCjgAsUHROuYOprfvD2HuT+KJr9qSf5DTwgRRZzsU9vQxu2Qc2J6MlgBi
	/mvwOT2HiI4b+nHT8KCXCxj8EVnaKIqX84GKRP9pzpnKMLqG4M8fuJjLspiaAPoliU+8
	Yo2+HpAen9G/ASmaYROzbl8tFN6Ce+DoUjxFE8hiK4lzicWTuJVboUNUq6KZEGPIHH7Z
	bnpltTZVGCBFriA0twhsFnJtGVq341X+YIzjwwzthznPGzCqYbvXiLOpKSy4P0GR7eDy
	zOY2GKqx+/FPYzmVXYmvhWdv03XgDFLH9bpj3YydebCbMxu0RbuNKYjtfTuOdGhjQecN
	EfKA==
MIME-Version: 1.0
Received: by 10.229.136.82 with SMTP id q18mr7265591qct.108.1344349179796;
	Tue, 07 Aug 2012 07:19:39 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 7 Aug 2012 07:19:39 -0700 (PDT)
In-Reply-To: <1344348754.9756.256.camel@ted>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<CADkTA4O8uTpJfjNL0bVw1+oJ2JrwWg++M4v5FK5pumN-npsNMw@mail.gmail.com>
	<1344348754.9756.256.camel@ted>
Date: Tue, 7 Aug 2012 10:19:39 -0400
Message-ID: <CADkTA4OZ3zMZE+4e6SS0THgqqoKBa8pnyPqSkMOnb7W3kLe_mg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Darren Hart <darren.hart@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 14:31:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 10:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-08-07 at 08:56 -0400, Bruce Ashfield wrote:
>> Adding Richard.
>>
>> Richard: did this patch not fix the problem for you ? .. it fixes it here, and
>> should replace the patch that you made earlier today .. this may have slipped
>> through the cracks.
>>
>> I've never seen the perf slang failure, so I'm hesitant to take this
>> patch, apply
>> it and drop yours.
>>
>> Is there anyway that someone seeing this problem can test this patch ?
>
> Reproducing the problem is easy "sudo mkdir /usr/include/slang", then
> build perf.

That's fine .. but if I take the existing patch, and drop the kernel
temp one, would
you take the change ? I'd rather not spend my time reproducing and fixing
something to generate a patch that won't be taken :)

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



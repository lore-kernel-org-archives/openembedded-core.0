Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0852061F47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 12:39:41 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id er20so2259045lab.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/g4BjoYuhYlj7czs61Zf7b8buCHeuU+xO9/Djwik7+4=;
	b=g4pEZBB0SOqssoC3OYoQgP9nuB4pwlLFeeo1aGYKaMovRlzwZP3i+RuRNdToFCygPu
	A2LcCMLvxWtMX66bWRx/M+6vub/jcbYUv5yFFR8lQVpVipNjELMAqeDEd02MXOFf64d5
	wfNndgdxoDxcb5vhEIkQJuIle7TOgq39GHSMRn9meF9o7yzr8AaCxv62RLBnt3mIB+SH
	HBbU4ayXE2LzEXOQbeCS6bPDe+MB3VFRLXcPbqlHlpUilSdWdfEQ9ananDLnyWzYw11+
	Ew4onaIflkrhZggq1vU0MLNddS4eZSDaUjT3xc235O53mNo7oqV8PyLIzahyRyi5GLCd
	KwUQ==
MIME-Version: 1.0
X-Received: by 10.152.29.103 with SMTP id j7mr13344872lah.7.1377520781748;
	Mon, 26 Aug 2013 05:39:41 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 26 Aug 2013 05:39:41 -0700 (PDT)
In-Reply-To: <1377514993.26773.42.camel@ted>
References: <1377487515-26654-1-git-send-email-bruce.ashfield@windriver.com>
	<1377487515-26654-2-git-send-email-bruce.ashfield@windriver.com>
	<521AD4CE.2020907@linux.intel.com> <521AD8F8.10807@windriver.com>
	<1377514993.26773.42.camel@ted>
Date: Mon, 26 Aug 2013 08:39:41 -0400
Message-ID: <CADkTA4PbUqA4sLZumw44bcKpzDN=zMhy_9iZ+G5A7aGymdsLPg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: ptrace.h: remove ptrace_peeksiginfo_args
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
X-List-Received-Date: Mon, 26 Aug 2013 12:39:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 26, 2013 at 7:03 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-08-26 at 00:26 -0400, Bruce Ashfield wrote:
>> On 13-08-26 12:08 AM, Saul Wold wrote:
>> Thanks! And honestly, I didn't leave out the upstream status on purpose
>> this time .. like I said, it just isn't in my workflow, since I normally
>> seek and destroy them!
>>
>> I'm pretty sure I can't convince the kernel guys to not export that
>> structure, but I can try. Otherwise, it can have the "dirty hack" upstream
>> status.
>>
>> >
>> > I will put this in MUT so we can move forward tonight.
>>
>> Fingers crossed, my builds are working here.
>
> Things failed badly on the autobuilder since we dropped the command
> length patch and it was still needed. I've updated it against 3.10,
> confirmed it worked on the autobuilder and then merged things.

Argh. I was emailed about that same patch in the mainline kernel, and when
I tested my previously "long" directory name .. it worked.

Thanks for pulling it back in, I had my doubts, which is why I hand't removed
it completely :)

Bruce

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


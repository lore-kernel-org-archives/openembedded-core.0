Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3DF60664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:27:02 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id el20so5812146lab.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AabVRqDnMs8T+EkwG90D1qt3wl1hMerp6lvuxU+ooS0=;
	b=UG4PbT9fPRiVkPXjYAzX4tRA/G2P1T9JT6HVEZq1PQWkoYEtmPzsK+n+2oEpHa76jD
	dvICSxnfmGbvMMW038ired8nHKMRlw3MqdpjGuvqRNJMWB1Qlfzyou5WW8xfynLm66nF
	ZIyTSdr8GfkFIMyu0Zlmr90sXA/L3Hhfr9rejTMS7BGoVPcMlEV53LX8uXAW+zsjXreg
	AZir+fwWtWf6jwgdynAAH18Y3rr7snLH3BNe4bM6mIfwlpQlk52B2C7v8/yQYktClPtg
	01soufGK6bPs1p3LMekLCdDiJph8vqydzU5QdZMuVvp0Kqzq13WszR7j87shl+t6uVc3
	opIw==
MIME-Version: 1.0
X-Received: by 10.112.198.39 with SMTP id iz7mr16221060lbc.24.1379521623962;
	Wed, 18 Sep 2013 09:27:03 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 18 Sep 2013 09:27:03 -0700 (PDT)
In-Reply-To: <1379521400.18603.33.camel@ted>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	<lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
	<lyli2ut9r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4PEPFjA5Adi_NJm8gXof4HNcr6AC5XqvJHhWBY5js5tVw@mail.gmail.com>
	<1379520153.18603.27.camel@ted>
	<CADkTA4PiypPNYUnx6h_MrijUpo_AL5w09KR+m6Ks_cuJMuOuvg@mail.gmail.com>
	<1379521400.18603.33.camel@ted>
Date: Wed, 18 Sep 2013 12:27:03 -0400
Message-ID: <CADkTA4Mou5h59ME-wGoOKRjaJURtx7nM6d2dwG+YVHFY2zNufA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 16:27:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 12:23 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-18 at 12:14 -0400, Bruce Ashfield wrote:
>> On Wed, Sep 18, 2013 at 12:02 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2013-09-18 at 11:54 -0400, Bruce Ashfield wrote:
>> >> On Wed, Sep 18, 2013 at 11:44 AM, Enrico Scholz
>> >> <enrico.scholz@sigma-chemnitz.de> wrote:
>> >> > Otavio Salvador <otavio@ossystems.com.br> writes:
>> >> >
>> >> >> I don't agree on this. perf is tied to kernel and part of its code so
>> >> >> I think same exception rule apply for it as well.
>> >> >
>> >> > perf ships with the kernel but is a pure userspace program.  It does not
>> >> > require any special setup ('make configure'), it links against complex
>> >> > userspace gui frameworks and uses userspace headers.
>> >>
>> >> yes, we realize this .. we have a long a complicated history with perf and the
>> >> related build issues.
>> >>
>> >> We are stating our general policy, interfere with it's build as little
>> >> as possible.
>> >> Use extension variables, not clobber variables, etc.
>> >>
>> >> Otherwise, we end up creating our own issues, and have the bugs to prove it :)
>> >
>> > For the record, I do think Enrico does have a valid point here. We do
>> > put things in CFLAGS and LDFLAGS which we expect *all* userspace to be
>> > built with. Things like the hash style, preferred debugging symbol
>> > options and so on are expected to be used for all userspace binaries.
>> >
>> > So somehow we do need to ensure that when the kernel is building
>> > userspace binaries, it does use the options we expect and match the rest
>> > of the system.
>> >
>> > Equally, I do understand the kernel build system is a complex beast in
>> > its own right.
>> >
>> > We don't have to solve this instantly, but in general its considered a
>> > bug if things like the hash-style in LDFLAGS don't make it to the linker
>> > commandline. We do have QA tests that check for this, however they don't
>> > function as they used to since we hard set the option on when we compile
>> > the linker now :/.
>>
>> Right, don't get me wrong in my comments. I'm just saying that I'd rather
>> add to the flags, versus completely clobber them. Since us imposing the
>> complete set of flags, is what has caused us the pain .. not adding to them.
>
> Isn't that what the patch at the start of this thread is doing though
> (clobbering, not adding)?  :/

It definitely is, and I had put in the bugzilla that it is a compromise for now,
since perf only offers EXTRA_CFLAGS and not EXTRA_LDFLAGS. I'll see
about addressing that upstream once we get out of this fix :)

Bruce

>
> I really need to figure out whether to take this patch or not and it
> looks like there isn't an easy answer...
>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


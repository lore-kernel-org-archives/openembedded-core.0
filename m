Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qjxva-0004Lt-H8
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:24:54 +0200
Received: by pzk1 with SMTP id 1so2386834pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=N5qoMq8NBps9zH5BkJMC/Bvo6XqKtHAk7xZnGy2cMGU=;
	b=xrOKd4+uwizINkyKJkVyGnhSMYP0xPoGUd5XhKxITzGcWsQlh8/xICNkdlz2KeuUYG
	UFB7Hqy1eOpb6JeBqfBhkuyRf3yxfuZZCSAHg24MqcraqarB1roXDZFCHg1Yzt7/ycxc
	mYBXDYzFC0zIlpeqKgdgkm/U9mBDnY+jl8Kxo=
Received: by 10.68.33.200 with SMTP id t8mr708063pbi.144.1311272446089; Thu,
	21 Jul 2011 11:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 11:20:16 -0700 (PDT)
In-Reply-To: <4E285C54.5000308@mentor.com>
References: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
	<CAMKF1srHzFH9PpmKcSMFhSRUstGnt6Pf-z6pirXQFWTpci0vWg@mail.gmail.com>
	<4E285C54.5000308@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 11:20:16 -0700
Message-ID: <CAMKF1spLfWX4ANoyAjzypTHpwBUJjOhRKT4Asg22=qw1qPcHQA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: siteinfo split between powerpc-common & powerpc-linux
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
X-List-Received-Date: Thu, 21 Jul 2011 18:24:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 10:05 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 07/21/2011 09:48 AM, Khem Raj wrote:
>> On Thu, Jul 21, 2011 at 5:17 AM, Kumar Gala <galak@kernel.crashing.org> =
wrote:
>>> Why do we have a split between powerpc-common & powerpc-linux?
>>>
>>> I assume powerpc-linux is used and picked up for powerpc-linux-uclibc i=
n addition to normal powerpc-linux.
>>>
>>> I'm looking at adding powerpc64 support and powerpc-common is all kinda=
 of broken for it. =C2=A0I'd like to just merge powerpc-common & powerpc-li=
nux (as powerpc-linux 32-bit) for now and start a new powerpc-common that r=
efactors 32/64 commonalities.
>>>
>>> Unless someone says otherwise about the meaning of these files.
>>
>> powerpc-common is shared between uclibc and eglibc at present and may
>> be shared with other OSes that may build with OE in future.
>> traditionally powerpc-common implicitly implied 32bit so I am not
>> surprised if its broken for ppc64. You could add powerpc64-common
>> and leave 32bit alone. See how its done for mips64 in oe.dev
>>
>> http://git.openembedded.org/cgit.cgi/openembedded/tree/site
>
> I'd argue that what we do for mips today is also wrong and I'm going to
> try and fix it as soon as I can. =C2=A0In these cases we should have:
> common, common-linux, common-$libc, mips-common, mips-linux,
> mips64-linux and if needed mips64-linux-libc.

yes that structure would be desirable. It would need a bit of overhaul
and lot of testing.
since you have something setup for your import from oe stuff for same.
may be you can take a stab at it

>
> But I suspect some of the above won't exist, and that's OK.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



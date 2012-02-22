Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1S0K2e-0000X2-M6; Wed, 22 Feb 2012 22:48:06 +0100
Received: by lahc1 with SMTP id c1so644992lah.6
	for <multiple recipients>; Wed, 22 Feb 2012 13:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=lLcDnPGMFLq3Oln2zETE+/gTLe/MCcyvWF5KuoE1/M4=;
	b=YHR/V57kUJNOfBzy1dt4FZveEmYzWm72hs4957M87X/xRgQUJnw1ECx023OzoGvlYB
	pOpk+/3eDKQp7Tey6Zy2GgJBoq0DdkKwr2ObyXcU7TZEijaBYT3THdwve5FO5v0R3oIn
	Yw2CsEcjzhvkCtxsh+nJA/YL4eiZfETTpHrWU=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr20389614lab.23.1329946783778;
	Wed, 22 Feb 2012 13:39:43 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 22 Feb 2012 13:39:43 -0800 (PST)
In-Reply-To: <CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
Date: Wed, 22 Feb 2012 22:39:43 +0100
Message-ID: <CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] gcc-cross-initial patching fails
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
X-List-Received-Date: Wed, 22 Feb 2012 21:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>> Applying patch gcc45-no-add-needed.patch
>>> patching file gcc/config/alpha/elf.h
>>> patching file gcc/config/ia64/linux.h
>>> patching file gcc/config/linux.h
>>> Hunk #1 succeeded at 89 (offset -12 lines).
>>> patching file gcc/config/rs6000/sysv4.h
>>> Hunk #1 FAILED at 908.
>>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>>> ERROR: Function failed: patch_do_patch
>>> ERROR: Logfile of failure stored in:
>>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/t=
emp/log.do_patch.5367
>>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Fail=
ed
>>> ERROR: Task 2829
>>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes=
-devtools/gcc/gcc-cross-initial_4.5.bb,
>>> do_patch) failed with exit code '1'
>>>
>>> git log does not help me much - =A0what goes wrong?
>>
>> Which actual patch is it failing on? Is there a conflict between
>> oe-core and meta-oe patch set against gcc?
>
> gcc45-no-add-needed.patch is the patch in question. I dont see
> anything wrong with it.
> Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
> gcc-cross-initial -cpatch ?
>
FYI: I removed the line which came in by the commits I mentioned above

should_apply[vardepsexclude] +=3D "PN"

in openembedded-core/meta/recipes-devtools/gcc/gcc-common.inc

and build from scratch works without issues.

Andreas



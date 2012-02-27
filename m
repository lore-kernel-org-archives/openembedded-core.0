Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S1z1V-00076s-PH
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 12:45:45 +0100
Received: by lagw12 with SMTP id w12so480534lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 03:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.147.1 as permitted sender)
	client-ip=10.152.147.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.147.1 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr11027592lab.22.1330342636775
	(num_hops = 1); Mon, 27 Feb 2012 03:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=RVucEHEsR5J7vH+LiJ+YzBLzK/2q9Yucl5PKZyeHIoc=;
	b=ZbKBaQUJSM4P9qy0zflXNRvo5TgkfkGI2w4VZ6vqz6sU7Wnotyj827dZGKpYtg3km7
	yFEnHVYhPCpdyWsqBz2F6LQTPV6AJ31aIXg0LSUuziVO7Gg3KX1Wpr+i/BIrDNbimnqD
	PrPTS/q+zNzey+gc+qymXXZ3s1scF1fQcN2mU=
MIME-Version: 1.0
Received: by 10.152.147.1 with SMTP id tg1mr9224662lab.22.1330342636647; Mon,
	27 Feb 2012 03:37:16 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Mon, 27 Feb 2012 03:37:16 -0800 (PST)
In-Reply-To: <6DB1E138-F4A8-432A-AB83-793B911CE68A@dominion.thruhere.net>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
	<CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
	<6DB1E138-F4A8-432A-AB83-793B911CE68A@dominion.thruhere.net>
Date: Mon, 27 Feb 2012 12:37:16 +0100
Message-ID: <CALbNGRQU7BDK5WGYgaXbCwmki922wk_EBkBqZadLL5G=5pCPQA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 27 Feb 2012 11:45:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 8:18 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 22 feb. 2012, om 22:39 heeft Andreas M=FCller het volgende geschreven:
>
>> On Wed, Feb 22, 2012 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>>>> Applying patch gcc45-no-add-needed.patch
>>>>> patching file gcc/config/alpha/elf.h
>>>>> patching file gcc/config/ia64/linux.h
>>>>> patching file gcc/config/linux.h
>>>>> Hunk #1 succeeded at 89 (offset -12 lines).
>>>>> patching file gcc/config/rs6000/sysv4.h
>>>>> Hunk #1 FAILED at 908.
>>>>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>>>>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>>>>> ERROR: Function failed: patch_do_patch
>>>>> ERROR: Logfile of failure stored in:
>>>>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733=
/temp/log.do_patch.5367
>>>>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Fa=
iled
>>>>> ERROR: Task 2829
>>>>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recip=
es-devtools/gcc/gcc-cross-initial_4.5.bb,
>>>>> do_patch) failed with exit code '1'
>>>>>
>>>>> git log does not help me much - =A0what goes wrong?
>>>>
>>>> Which actual patch is it failing on? Is there a conflict between
>>>> oe-core and meta-oe patch set against gcc?
>>>
>>> gcc45-no-add-needed.patch is the patch in question. I dont see
>>> anything wrong with it.
>>> Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
>>> gcc-cross-initial -cpatch ?
>>>
>> FYI: I removed the line which came in by the commits I mentioned above
>>
>> should_apply[vardepsexclude] +=3D "PN"
>>
>> in openembedded-core/meta/recipes-devtools/gcc/gcc-common.inc
>>
>> and build from scratch works without issues.
>
> I received reports of the same problem and I handed your fix to them, I'm=
 waiting to hear back.
>
Having some experience to this problem now, I have the feeling that
there is some race condition on patching. I think gcc-cross-initial /
gcc-cross-intermediate / gcc-runtime share same source directory -
correct me if I am wrong. In case all start patching about the same
time, the patches don't match for those being late. This theory is
encouraged by the fact that the following sequence helps when building
from scratch:

1. bitbake gcc-cross-initial
2. bitbake gcc-cross-intermediate
3. bitbake gcc-runtime
4. bitbake <my-image>

Cheers

Andreas



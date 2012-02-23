Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1S0eJq-0003JD-PM; Thu, 23 Feb 2012 20:27:10 +0100
Received: by wibhq7 with SMTP id hq7so1044678wib.6
	for <multiple recipients>; Thu, 23 Feb 2012 11:18:49 -0800 (PST)
Received: by 10.180.80.35 with SMTP id o3mr4633049wix.5.1330024729241;
	Thu, 23 Feb 2012 11:18:49 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ga1sm10739268wib.5.2012.02.23.11.18.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 11:18:48 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
Date: Thu, 23 Feb 2012 20:18:43 +0100
Message-Id: <6DB1E138-F4A8-432A-AB83-793B911CE68A@dominion.thruhere.net>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
	<CALbNGRS49UDHDMCS9=fePkuEXEd_fOJ0WSxcsSf2aeCstdNxKg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQldStFmuNHUNlyDq8F7k1zwlHBGiJ+VYNMhdbj0vKlWGcxuiHQ9HlwwySnFBqSWjCUyMDF8
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 23 Feb 2012 19:27:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 22:39 heeft Andreas M=FCller het volgende =
geschreven:

> On Wed, Feb 22, 2012 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>>> Applying patch gcc45-no-add-needed.patch
>>>> patching file gcc/config/alpha/elf.h
>>>> patching file gcc/config/ia64/linux.h
>>>> patching file gcc/config/linux.h
>>>> Hunk #1 succeeded at 89 (offset -12 lines).
>>>> patching file gcc/config/rs6000/sysv4.h
>>>> Hunk #1 FAILED at 908.
>>>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>>>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>>>> ERROR: Function failed: patch_do_patch
>>>> ERROR: Logfile of failure stored in:
>>>> =
/home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/temp=
/log.do_patch.5367
>>>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: =
Failed
>>>> ERROR: Task 2829
>>>> =
(/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-de=
vtools/gcc/gcc-cross-initial_4.5.bb,
>>>> do_patch) failed with exit code '1'
>>>>=20
>>>> git log does not help me much -  what goes wrong?
>>>=20
>>> Which actual patch is it failing on? Is there a conflict between
>>> oe-core and meta-oe patch set against gcc?
>>=20
>> gcc45-no-add-needed.patch is the patch in question. I dont see
>> anything wrong with it.
>> Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
>> gcc-cross-initial -cpatch ?
>>=20
> FYI: I removed the line which came in by the commits I mentioned above
>=20
> should_apply[vardepsexclude] +=3D "PN"
>=20
> in openembedded-core/meta/recipes-devtools/gcc/gcc-common.inc
>=20
> and build from scratch works without issues.

I received reports of the same problem and I handed your fix to them, =
I'm waiting to hear back.

regards,

Koen=



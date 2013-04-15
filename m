Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1URor9-0005xx-5q
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 21:14:23 +0200
Received: from [192.168.0.12] (83.252.253.85) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 15 Apr 2013 20:55:48 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CADkTA4O8VpiQB8vCDPoB87N+fafYrpjL4grN3HNn_7ys_cty=Q@mail.gmail.com>
References: <20130415180716.GA30774@ad.chargestorm.se>
	<CADkTA4Nz1jGjK+iJEXKQ8zVcR0DBOP-4x97b57_wdoN7kSdP4w@mail.gmail.com>
	<CADkTA4O8VpiQB8vCDPoB87N+fafYrpjL4grN3HNn_7ys_cty=Q@mail.gmail.com>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Mon, 15 Apr 2013 20:55:45 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Message-ID: <902155bf-386e-48bb-bb46-37febded2109@email.android.com>
X-GFI-SMTP-Submission: 1
Subject: Re: linux-yocto-custom. error in patch step
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 19:14:23 -0000
X-List-Received-Date: Mon, 15 Apr 2013 19:14:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=20

Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

>On Mon, Apr 15, 2013 at 2:15 PM, Bruce Ashfield
><bruce.ashfield@gmail.com> wrote:
>> On Mon, Apr 15, 2013 at 2:07 PM, Anders Darander
><anders@chargestorm.se> wrote:

>/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-cu=
stom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do=
_patch.8972
>>> Log data follows:
>>> | DEBUG: Executing shell function do_patch
>>> | WARNING: no meta data branch found ...
>>> | Already on 'master'
>>> | Your branch is behind 'origin/master' by 12742 commits, and can be
>>> fast-forwarded.
>>> | ERROR. input file "meta/cfg/scratch/obj/qemuarm-standard.scc" does
>not
>>> exist
>>> | ERROR. A meta series could not be created for
>>> meta/cfg/scratch/obj/qemuarm-standard.scc
>>> | ERROR. Could not locate meta series for qemuarm
>>> | ERROR. Could not apply patches for qemuarm.
>>> |        Patch failures can be resolved in the devshell (bitbake -c
>>> devshell linux-yocto-custom)
>>> | ERROR: Function failed: do_patch (see
>>>
>/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-cu=
stom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.do=
_patch.8972
>>> for further information)
>>> ERROR: Task 3
>>>
>(/home/anders/poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.b=
b,
>>> do_patch) failed with exit code '1'
>>>
>>>
>>> Using my own machine, I got a similar error, that
>>> ${MACHINE}-standard.scc didn't exist.
>>>
>>> The plan is to use a defconfig as the main configuration, and
>possibly
>>> later on add config fragments for certain featuers.
>>>
>>> However, I'm missing one step, as I'm not able to build without the
>>> meta/cfg/scratch/obj/qemuarm-standard.scc file.
>>>
>>> Any hints on what step I've currently overlooked would be nice...
>>
>> Let me have a look at this, there were some changes to the tools for
>> 1.4, so the
>> examples may need some tweaking.
>>
>> We did run all the yocto-bsp tools against 1.4 and they worked, and
>they are
>> users of the same interface.
>>
>> Anyway, if there's a bug, I'll follow up with a patch shortly.
>
>Indeed, something managed to happen here. I'm investigating and will
>follow
>up once I know what broke.

Thanks!=20
Good that the issue was found prior to the release. Looking forward to see =
what it was all about.=20

I was slightly worried for a while, when I couldn't find the best problem i=
n my recipe, as something similar had been working on the 1.3 release.=20

Cheers,=20
Anders=20
--=20
Anders Darander
ChargeStorm AB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tel: +=
46 702 44 84 36
Laxholmstorget 3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Email: anders@ch=
argestorm.se
602 21 Norrk=C3=B6ping=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Web: www.charges=
torm.se

Sent from my Android phone with K-9 Mail. Please excuse my brevity.



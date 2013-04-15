Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1URpD9-0008Hh-4Y
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 21:37:16 +0200
Received: by mail-lb0-f174.google.com with SMTP id s10so4879923lbi.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=4DdSxB2H3ZeHgyMf9OTnPxE9UpL7bXAPrDsOGnnoJ8k=;
	b=ju7bBonZwZaomJAL/ozwPPw9gyEn2RCTKoNcbWkERxA+WGBSRwreHuGpQuYAlEdImm
	i+sQc+P1D5l0tYGnFYhXxM1LxFNMlUYMImSDfsAo8QubA0VrGeawtMLTE7CZUMqeXIut
	ECUuVxn1iBNIZwRnuy7gZFSaVX8SGx0Q0d6lOT9W28baQnKJB9qcbsaJsJHpBNYC/bSm
	ykoDjtxz6nsfAMig8235dA356A09hQ1tpCM+oBhlAfzV5qDEPBjnL0pxxaTSH/WuYK+6
	u9mmK2hl4pH4YQgyfQxN0f+jFRN3GtJhRPQ0+Na1S0vkUU6748zS9Sj9P9QFkhX4VCD5
	FP4A==
MIME-Version: 1.0
X-Received: by 10.112.61.6 with SMTP id l6mr9395803lbr.57.1366053577898; Mon,
	15 Apr 2013 12:19:37 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Mon, 15 Apr 2013 12:19:37 -0700 (PDT)
In-Reply-To: <902155bf-386e-48bb-bb46-37febded2109@email.android.com>
References: <20130415180716.GA30774@ad.chargestorm.se>
	<CADkTA4Nz1jGjK+iJEXKQ8zVcR0DBOP-4x97b57_wdoN7kSdP4w@mail.gmail.com>
	<CADkTA4O8VpiQB8vCDPoB87N+fafYrpjL4grN3HNn_7ys_cty=Q@mail.gmail.com>
	<902155bf-386e-48bb-bb46-37febded2109@email.android.com>
Date: Mon, 15 Apr 2013 15:19:37 -0400
Message-ID: <CADkTA4NGns0txOGYZTiPpXkypcj0=dMcRAgkGF4NBHKE4tr-qA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anders Darander <anders@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 15 Apr 2013 19:37:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 2:55 PM, Anders Darander <anders@chargestorm.se> wr=
ote:
> I
>
> Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>>On Mon, Apr 15, 2013 at 2:15 PM, Bruce Ashfield
>><bruce.ashfield@gmail.com> wrote:
>>> On Mon, Apr 15, 2013 at 2:07 PM, Anders Darander
>><anders@chargestorm.se> wrote:
>
>>/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-c=
ustom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.d=
o_patch.8972
>>>> Log data follows:
>>>> | DEBUG: Executing shell function do_patch
>>>> | WARNING: no meta data branch found ...
>>>> | Already on 'master'
>>>> | Your branch is behind 'origin/master' by 12742 commits, and can be
>>>> fast-forwarded.
>>>> | ERROR. input file "meta/cfg/scratch/obj/qemuarm-standard.scc" does
>>not
>>>> exist
>>>> | ERROR. A meta series could not be created for
>>>> meta/cfg/scratch/obj/qemuarm-standard.scc
>>>> | ERROR. Could not locate meta series for qemuarm
>>>> | ERROR. Could not apply patches for qemuarm.
>>>> |        Patch failures can be resolved in the devshell (bitbake -c
>>>> devshell linux-yocto-custom)
>>>> | ERROR: Function failed: do_patch (see
>>>>
>>/home/anders/poky/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto-c=
ustom/3.8+gitAUTOINC+19f949f52599ba7c3f67a5897ac6be14bfcb1200-r1/temp/log.d=
o_patch.8972
>>>> for further information)
>>>> ERROR: Task 3
>>>>
>>(/home/anders/poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.=
bb,
>>>> do_patch) failed with exit code '1'
>>>>
>>>>
>>>> Using my own machine, I got a similar error, that
>>>> ${MACHINE}-standard.scc didn't exist.
>>>>
>>>> The plan is to use a defconfig as the main configuration, and
>>possibly
>>>> later on add config fragments for certain featuers.
>>>>
>>>> However, I'm missing one step, as I'm not able to build without the
>>>> meta/cfg/scratch/obj/qemuarm-standard.scc file.
>>>>
>>>> Any hints on what step I've currently overlooked would be nice...
>>>
>>> Let me have a look at this, there were some changes to the tools for
>>> 1.4, so the
>>> examples may need some tweaking.
>>>
>>> We did run all the yocto-bsp tools against 1.4 and they worked, and
>>they are
>>> users of the same interface.
>>>
>>> Anyway, if there's a bug, I'll follow up with a patch shortly.
>>
>>Indeed, something managed to happen here. I'm investigating and will
>>follow
>>up once I know what broke.
>
> Thanks!
> Good that the issue was found prior to the release. Looking forward to se=
e what it was all about.
>
> I was slightly worried for a while, when I couldn't find the best problem=
 in my recipe, as something similar had been working on the 1.3 release.

This is fixed here. One line fix (smaller than that actually) .. isn't
that always the
way.

I'll be sending RP a fix for it shortly. Thanks for the report!

Bruce

>
> Cheers,
> Anders
> --
> Anders Darander
> ChargeStorm AB          Tel: +46 702 44 84 36
> Laxholmstorget 3        Email: anders@chargestorm.se
> 602 21 Norrk=F6ping       Web: www.chargestorm.se
>
> Sent from my Android phone with K-9 Mail. Please excuse my brevity.



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



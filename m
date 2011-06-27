Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QbD19-0005PW-5r
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 16:42:27 +0200
Received: by gyd12 with SMTP id 12so1971399gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=jvkfEKOWcwwpWgaSqZc6Irb2+OTFyEUCBwsUVJQXnYs=;
	b=LDmI2VWu0h3KQNEAUsbdgZyhmNweZtnTIFiuUt1X/CfdPan/Q1yjlhgdV4S460u/9w
	bLilbWd8l6A+aTOQ6ZrxVg+UPybESvY9CzfmB/c+QCXM1U0z7jvsvcc/9sbQYqETVusI
	cz5CVyqJljwFp+rO11VoKFLHp4LO0sZWJ84jo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=YXqo29bX/LWb4zB7xOav6jrurGemebY6XJxXCf2Ay7iibJkwcnT8Wzm5CkDlAS35PN
	zW+YCN7ZepeU89SjgqEIPqbkI3oxwQHAxYykHPAKswM9WXFg24vZGlbh9owmViTCAhM1
	iJM8vtCuxc3Tlw4G5L6uRC3FQuf6lWukSmKkY=
MIME-Version: 1.0
Received: by 10.90.239.17 with SMTP id m17mr6865125agh.138.1309185522112; Mon,
	27 Jun 2011 07:38:42 -0700 (PDT)
Received: by 10.91.161.1 with HTTP; Mon, 27 Jun 2011 07:38:42 -0700 (PDT)
In-Reply-To: <1309185246.2288.11.camel@elnicho>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
	<13b6560cbb0a8a498266eba93e93f71fb34be9c2.1308777703.git.bruce.ashfield@windriver.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0730@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB69F4CEB0731@shsmsx502.ccr.corp.intel.com>
	<BANLkTimxJghenX5KgaN+oP-cyywABbpEtQ@mail.gmail.com>
	<1309185246.2288.11.camel@elnicho>
Date: Mon, 27 Jun 2011 10:38:42 -0400
Message-ID: <BANLkTik7Upf7Vi7Fky9E3fLKLQPvtvzATQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	"koen@dominion.thruhere.net" <koen@dominion.thruhere.net>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/2] linux-yocto: update meta SRCREV for new config groups
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
X-List-Received-Date: Mon, 27 Jun 2011 14:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 10:34 AM, Tom Zanussi <tom.zanussi@intel.com> wrote=
:
> On Mon, 2011-06-27 at 05:56 -0700, Bruce Ashfield wrote:
>> 2011/6/27 Cui, Dexuan <dexuan.cui@intel.com>:
>> > Cui, Dexuan wrote:
>> >> Hi, I got the following ERROR with the patch:
>> >>
>> >> Log data follows:
>> >>> Unstaged changes after reset:
>> >>> M arch/powerpc/boot/dts/mpc8315erdb.dts
>> >>> Deleted branch meta-temp (was cf7d7e5).
>> >>> WARNING: addon feature "features/taskstats" was not found
>> >>> ERROR: required features were not found. aborting
>> >>> ERROR: Function 'do_patch' failed
>> >>
>> >> Maybe we forgot to push the proper commits into the linux-yocto git
>> >> repo?
>> > BTW, I'm building emenlow with today's poky master (commit a1f79a7896b=
) and mete-intel (commit 76d1178ba).
>> >
>
> Just noticed that you were using emenlow so updated the meta-intel
> SRCREVs, maybe that was the problem?

Aha! that would be the problem.

Is now when we try and kick up the conversion on a way to more
efficiently bubble these changes through the BSP layers ? :)

Bruce

>
> Tom
>
>> > After I reverted the line
>> > KERNEL_FEATURES_append=3D" features/taskstats",
>> > at least linux-yocto's do_patch can work.
>>
>> It isn't this. Can you check your local clone in git2/downloads ? Everyt=
hing
>> that is required is already on the servers, I double checked with a clea=
n build
>> on a clean machine, so there's nothing left to push or fix.
>>
>> Bruce
>>
>> >
>> > Thanks,
>> > -- Dexuan
>> >>
>> >>
>> >> -----Original Message-----
>> >> From: openembedded-core-bounces@lists.openembedded.org
>> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> >> Of Bruce Ashfield Sent: 2011=E5=B9=B46=E6=9C=8823=E6=97=A5 5:29
>> >> To: richard.purdie@linuxfoundation.org
>> >> Cc: dvhart@linux.intel.com; openembedded-core@lists.openembedded.org;
>> >> koen@dominion.thruhere.net; Wold, Saul
>> >> Subject: [OE-core] [PATCH 1/2] linux-yocto: update meta SRCREV for
>> >> new config groups
>> >>
>> >> Updating the SRCREV for the kernel repo's meta branch to capture
>> >> the following commits:
>> >>
>> >> =C2=A0 94fa015 meta: add taskstats experimental feature group
>> >> =C2=A0 4fb2ed5 meta: enable freezer support
>> >> =C2=A0 88d619e meta: enable fuse and cuse as modules
>> >> =C2=A0 f465827 meta: add namespaces + experimental configs
>> >> =C2=A0 fbdd376 meta: add devtmpfs config group
>> >> =C2=A0 b04f6d9 meta: re-enable cgroups options in the standard kernel
>> >>
>> >> There's also a change to the recipe itself to trigger the taskstats
>> >> optional config items by default. This is to allow the introduction
>> >> of these changes gradually, since other recipes inheriting the kernel
>> >> can add or ignore these options at their convenience.
>> >>
>> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> ---
>> >> =C2=A0meta/recipes-kernel/linux/linux-yocto_2.6.37.bb | =C2=A0 =C2=A0=
5 +++--
>> >> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
>> >> b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
>> >> index 2ee801e..90943c2 100644
>> >> --- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
>> >> +++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
>> >> @@ -20,9 +20,9 @@ SRCREV_machine_qemuppc =3D
>> >> =C2=A0"9d278962ff228ea9627a85b0d21ed717246ebf1f" SRCREV_machine_qemux=
86 =3D
>> >> =C2=A0"57545699dff0b384bb16be74b0358059da5cce6a" SRCREV_machine_qemux=
86-64
>> >> =C2=A0=3D "5d36c23eecdc9663c9c3a2a511d4872d3b3fd669" SRCREV_machine =
=3D
>> >> "12646d158aced2ba0122787bd56ff554e371091c" -SRCREV_meta =3D
>> >> "8888d948e0ddbc5f37bd3dc23cc1b398ab230e2e" +SRCREV_meta =3D
>> >> "94fa015b130e96a3b6242a8ac4ff4cca9406951f"
>> >>
>> >> -PR =3D "r18"
>> >> +PR =3D "r19"
>> >> =C2=A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
>> >> =C2=A0SRCREV_FORMAT =3D "meta_machine"
>> >>
>> >> @@ -33,6 +33,7 @@ COMPATIBLE_MACHINE =3D
>> >> =C2=A0"(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)" # Functionality=
 flags
>> >> =C2=A0KERNEL_REVISION_CHECKING ?=3D "t"
>> >> =C2=A0KERNEL_FEATURES=3D"features/netfilter"
>> >> +KERNEL_FEATURES_append=3D" features/taskstats"
>> >> =C2=A0KERNEL_FEATURES_append_qemux86=3D" cfg/sound"
>> >> =C2=A0KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound"
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



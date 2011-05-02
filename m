Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QGlli-0004Qt-Hz
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 07:34:03 +0200
Received: by yxn22 with SMTP id 22so1808061yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 May 2011 22:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=TceUlni2ms836vB6BNg1OnoTl4LWpdi1nmhkyCjGJcI=;
	b=sSXXlJ/11EovwJprtGcmZrvZOxxiNzYsnO8iojfyMz7SPGjWPP040NfyFpCc2+PdKC
	+Susl+DkOoo7jSFb0mQdzibPKQ2jezGnZVBHx6oemcFygYKkGzI7h+6paGsDQnFaYY4V
	zYcBw917qD5kCSEvOlI7rwa/kqJKMWGtIHUsk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RdXiQnu8SHaJMfyEnItvLkK37LhcroJmwcZFfHGH/mVLzz3BHtbpQXclicr6CQ4w+o
	5r1fMpvNGxnfbnJn63fIofgQe4b8OuVvtc14PIsP0e+5405OcuGHZ7zzx1eu0wEOW5TT
	scy+uPMMLFN+sugAeo4WtTOxW/EW66NVHixaw=
MIME-Version: 1.0
Received: by 10.91.7.1 with SMTP id k1mr6367549agi.4.1304314283351; Sun, 01
	May 2011 22:31:23 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Sun, 1 May 2011 22:31:23 -0700 (PDT)
In-Reply-To: <BANLkTimvDmHUpEHEVJ4oS4N9RUX0n8ndLA@mail.gmail.com>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
	<BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
	<BANLkTimvDmHUpEHEVJ4oS4N9RUX0n8ndLA@mail.gmail.com>
Date: Mon, 2 May 2011 01:31:23 -0400
Message-ID: <BANLkTinyr-cj4BEWQ553AkSH4uoCmfETpA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to patch yocto kernel
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
X-List-Received-Date: Mon, 02 May 2011 05:34:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 11:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, May 1, 2011 at 7:40 PM, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>> On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi
>>>
>>> I am trying to test this patch
>>>
>>> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
>>>
>>> to fix the build using gcc 4.6.0 but the kernel patching for yocto is
>>> not as usual as other recipes
>>> since it uses entire set of tooling around it.
>>>
>>> I tried to look around for documentation and few references I found
>>>
>>> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
>>>
>>> discourages putting patches in metadata. and in another document it
>>> says it uses git to do patching but does not explain how.
>>>
>>> So if someone can explain in simple terms how to patch a linux-yocto
>>> would be really helpful from a
>>> developer POV or any documentation will be helpful.
>>>
>>> How do people develop/test patches on linux-yocto I understand
>>> eventually they are desired to be part
>>> of linux-yocto git but that comes after they are tried and tested local=
ly
>>>
>>> I would have preferred to have the usual SRC_URI patching atleast for
>>> local testing. As of now
>>> it seems not to use normal OE recipe procedures.
>>
>> Are you actually not =A0seeing this work ? I put in place compatibility
>> with existing patching via the SRC_URI for just this reason. A patch
>> specified in the SRC_URI will be picked up by the tools and applied
>> to the end of the BSP branch during the patching phase.
>>
>
> if it worked. I would not be writing this email :)

:) you never know, I didn't see your error message so I didn't want
to presume.

But I spoke too soon earlier, I had a bbappend in my layers that
meant I was modifying the wrong SRC_URI to have your patch
applied.

When I modified the right SRC_URI like so:

+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3Dgit;=
nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta\
+           file://perf-tool-Fix-gcc-4.6.0-issues.patch"

(i.e. the obvious way)

I see the patch applied to the end of my BSP branch:

> git branch
  master
  meta
  yocto/base
  yocto/eg20t
  yocto/emgd
  yocto/gma500
  yocto/standard/arm-versatile-926ejs
  yocto/standard/base
  yocto/standard/beagleboard
  yocto/standard/common-pc-64/base
  yocto/standard/common-pc-64/jasperforest
  yocto/standard/common-pc-64/sugarbay
  yocto/standard/common-pc/atom-pc
* yocto/standard/common-pc/base

commit 2500f7dc4d6c0d8b2f5ddad6369ee4541456533a
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Mon May 2 01:26:49 2011 -0400

    commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.

    GCC 4.6.0 in Fedora rawhide turned up some compile errors in tools/perf
    due to the -Werror=3Dunused-but-set-variable flag.

    I've gone through and annotated some of the assignments that had side
    effects (ie: return value from a function) with the __used annotation,
    and in some cases, just removed unused code.

    In a few cases, we were assigning something useful, but not using it in
    later parts of the function.

    kyle@dreadnought:~/src% gcc --version
    gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)

    Cc: Ingo Molnar <mingo@redhat.com>
    LKML-Reference: <20110124161304.GK27353@bombadil.infradead.org>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>
    [ committer note: Fixed up the annotation fixes, as that code
moved recently ]
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
    [Backported to 2.6.38.2 by deleting unused but set variables]
    Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
    [Backported to linux-yocto kernel git version]
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

I did modify the patch format slightly, since git am needs to be able to
grok the patch for it to apply.

Did you get any sort of error message when your patch didn't apply ?

Cheers,

Bruce

>
>> It has definitely worked during all the development cycles, so if you
>> are seeing it not work, it's a bug and I'll fix it.
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> Thanks
>>> -Khem
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



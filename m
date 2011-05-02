Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QGk4r-0007Zy-6R
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 05:45:41 +0200
Received: by gyf1 with SMTP id 1so1972677gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 May 2011 20:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=NfNM5YfQgkeDS+nmja02zBDEhKmc4CRzoml4F3oAFZo=;
	b=q0zeBoZSr5Qok3SriuIxz3nvvexSKXmXC+Z3KJc4swbDI8gvgh5yWKOfQOQIcf6mDZ
	od/lPwbj3BENkkipyRquBrj/JFvL4tS4fmusqhrhxONRk06mY22WZkbM5tnAbs/I2AbZ
	zrkqZRLs944oc+YA5aYQSylyKuP22sHPmGY2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nLc77MI4G9dT6M6/crpWV1kAwmVArAnqdP47SBcvweL0xEFBr3gjvTcHi1GcMTHFnP
	OvbDBrPkdea7Emm7XQKwyEvtkCUg3fttDLiFGPV9gwp1I0kw76k7kcaYwp2zlinp4Fop
	x54Em68HQpgNcl5vI4cZzoZYizNHaqt1h29Ww=
MIME-Version: 1.0
Received: by 10.90.249.27 with SMTP id w27mr6251854agh.139.1304307783391; Sun,
	01 May 2011 20:43:03 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Sun, 1 May 2011 20:43:03 -0700 (PDT)
In-Reply-To: <BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
	<BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
Date: Sun, 1 May 2011 23:43:03 -0400
Message-ID: <BANLkTinyaoA+Jo9MY89=qm6eUr-f5F2VJw@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 May 2011 03:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 10:40 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>
>> I am trying to test this patch
>>
>> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
>>
>> to fix the build using gcc 4.6.0 but the kernel patching for yocto is
>> not as usual as other recipes
>> since it uses entire set of tooling around it.
>>
>> I tried to look around for documentation and few references I found
>>
>> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
>>
>> discourages putting patches in metadata. and in another document it
>> says it uses git to do patching but does not explain how.
>>
>> So if someone can explain in simple terms how to patch a linux-yocto
>> would be really helpful from a
>> developer POV or any documentation will be helpful.
>>
>> How do people develop/test patches on linux-yocto I understand
>> eventually they are desired to be part
>> of linux-yocto git but that comes after they are tried and tested locall=
y
>>
>> I would have preferred to have the usual SRC_URI patching atleast for
>> local testing. As of now
>> it seems not to use normal OE recipe procedures.
>
> Are you actually not =A0seeing this work ? I put in place compatibility
> with existing patching via the SRC_URI for just this reason. A patch
> specified in the SRC_URI will be picked up by the tools and applied
> to the end of the BSP branch during the patching phase.
>
> It has definitely worked during all the development cycles, so if you
> are seeing it not work, it's a bug and I'll fix it.

I dug into this a bit more, and something has changed in master with
respect to patch handling,  I'm bisecting now to find the failure. Your
patch when tested in the yocto bernard branch works fine, when I try
it in yocto master, the patch is not propagated to the work dir so the
tools can't pick it up and apply it to the BSP branch.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>>
>> Thanks
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



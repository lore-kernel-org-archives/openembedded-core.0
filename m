Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id A238065CC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:26:29 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id u10so4254029lbd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 07:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MbijtxnMYVj9Z/9/xbycVhbnF5jctOZ4x21k+++XWg8=;
	b=df8rMoxGpkkNU0ZQzMKSVoqr4cFvBysqNOXiGhStCjUcki6gta+zSILL4wXstm4iY/
	qIC+smvSxqMfLfSM7DiFmM3tJ+bCiRN2LNEjb/p+X+MC4aseRKi6qYpPKrVdffzDomjC
	v7O2r3guQWZSL6iDLXzCizULW5L9GkuX7NTBVDTuzkN06EDR2NbRtoGZ/MusBO4e1ULP
	oA3gcJSezBHTZ0BnrHPAaLgTq4b/HqjpfWLbXDXKDcgznA4w8rsfSs/Cxst0ym542Lr+
	uS32/HQX46+THAwRxtDc5XnX61pmJRtUu4v/9hrsftysLVU+qkqYgkSczvGqkViiHKHr
	eONw==
MIME-Version: 1.0
X-Received: by 10.112.172.97 with SMTP id bb1mr10375408lbc.38.1418311589023;
	Thu, 11 Dec 2014 07:26:29 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 11 Dec 2014 07:26:28 -0800 (PST)
In-Reply-To: <1418309772.22903.74.camel@linuxfoundation.org>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
	<CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
	<1418306324.22903.72.camel@linuxfoundation.org>
	<1418309772.22903.74.camel@linuxfoundation.org>
Date: Thu, 11 Dec 2014 10:26:28 -0500
Message-ID: <CADkTA4MHJm2RpHxSLy3cfVQEKfhMp6WBpJMWL28NByt0qnY4NA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Thu, 11 Dec 2014 15:26:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 9:56 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-12-11 at 13:58 +0000, Richard Purdie wrote:
>> On Thu, 2014-12-11 at 03:31 -0500, Bruce Ashfield wrote:
>> > On Wed, Dec 10, 2014 at 10:02 AM, Burton, Ross <ross.burton@intel.com>=
 wrote:
>> > >
>> > > On 10 December 2014 at 14:16, Bruce Ashfield <bruce.ashfield@windriv=
er.com>
>> > > wrote:
>> > >>
>> > >> The following changes since commit
>> > >> 88dfcbf149dda89277e58ae4ec3a87500624cfff:
>> > >>
>> > >>   kernel-yocto: make sure git tags get dereferenced properly in do_=
patch()
>> > >> (2014-12-10 08:12:56 -0500)
>> > >>
>> > >> are available in the git repository at:
>> > >>
>> > >>   git://git.pokylinux.org/poky-contrib HEAD
>> > >
>> > >
>> > > I wonder what happened here!
>> >
>> > @#!$#@$ the script is insane.
>> >
>> > >
>> > >>
>> > >> for you to fetch changes up to 4be985be419f06f18c735d72ac4a4d00fea7=
1dd8:
>> > >>
>> > >>   linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updat=
es
>> > >> (2014-12-10 08:38:49 -0500)
>> > >
>> > >
>> > > That's zedd/kernel-updates, right?
>> > >
>> >
>> > Yah. Sorry about the confusion,
>>
>> I've been experimenting, the upgrades look good but we have a problem
>> with the new kernel class changes.
>>
>> The issue is that if you have an existing TMPDIR, the build will do "bad
>> things".
>>
>> Basically, there is usually an existing sstate manifest file which
>> covers the kernel source in the sysroot. do_configure will trigger
>> cleaning of that manifest, a large chunk of the source disappears and
>> then the build understandably fails.
>>
>> Whilst I can say what is happening, I can't say how we fix it at this
>> point :/.
>>
>> I would like people to test these patches, we'd better hold off merging
>> until we can get this issue figured out. Its part of a wider problem
>> with "stale" data in the sysroot which we really need to figure out but
>> its not been solved yet as its a  very hard problem for which we don't
>> have a solution :(.
>
> After quite some thinking, I've come up with the patch below which
> should at least allow us to get this patch series merged. Obviously I
> need to split this up and send it out properly with a decent commit log
> but I thought I'd share it sooner than later.

Nice. I'll stack it on here and let it sit through my kernel builds and jum=
ping
between versions .. that tends to break what can be broken.

On a related note, I have a one line update to a patch that fixes the qemup=
pc
build (missing directory).

Do we want to leave the series as is, and I can send it as an incremental
patch, or would you rather it squashed and the branches updated ?

Bruce

>
> Cheers,
>
> Richard
>
>
> From 2495650e76bdee971645b3049b6e65307e506e09 Mon Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Thu, 11 Dec 2014 14:36:05 +0000
> Subject: sanity: TMPDIR ABI change for kernel process
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/po=
ky.conf
> index 72db36d..bea8e04 100644
> --- a/meta-yocto/conf/distro/poky.conf
> +++ b/meta-yocto/conf/distro/poky.conf
> @@ -94,7 +94,7 @@ BB_SIGNATURE_HANDLER ?=3D 'OEBasicHash'
>  # that breaks the format and have been previously discussed on the maili=
ng list
>  # with general agreement from the core team.
>  #
> -OELAYOUT_ABI =3D "8"
> +OELAYOUT_ABI =3D "10"
>
>  # add poky sanity bbclass
>  INHERIT +=3D "poky-sanity"
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 5be5efb..71fd2e9 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -519,6 +519,16 @@ def sanity_handle_abichanges(status, d):
>              status.addresult("Your configuration is using stamp files in=
cluding the sstate hash but your build directory was built with stamp files=
 that do not include this.\nTo continue, either rebuild or switch back to t=
he OEBasic signature handler with BB_SIGNATURE_HANDLER =3D 'OEBasic'.\n")
>          elif (abi !=3D current_abi and current_abi =3D=3D "9"):
>              status.addresult("The layout of the TMPDIR STAMPS directory =
has changed. Please clean out TMPDIR and rebuild (sstate will be still be v=
alid and reused)\n")
> +        elif (abi !=3D current_abi and current_abi =3D=3D "10" and (abi =
=3D=3D "8" or abi =3D=3D "9")):
> +            bb.note("Converting staging layout from version 8/9 to layou=
t version 10")
> +            cmd =3D d.expand("grep -l sysroot-providers/virtual_kernel $=
{SSTATE_MANIFESTS}/*")
> +            ret, result =3D oe.utils.getstatusoutput(cmd)
> +            result =3D result.split()
> +            for f in result:
> +                bb.note("Uninstalling manifest file %s" % f)
> +                sstate_clean_manifest(f, d)
> +            with open(abifile, "w") as f:
> +                f.write(current_abi)
>          elif (abi !=3D current_abi):
>              # Code to convert from one ABI to another could go here if p=
ossible.
>              status.addresult("Error, TMPDIR has changed its layout versi=
on number (%s to %s) and you need to either rebuild, revert or adjust it at=
 your own risk.\n" % (abi, current_abi))
> diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> index e8cf9a3..2867850 100644
> --- a/meta/conf/abi_version.conf
> +++ b/meta/conf/abi_version.conf
> @@ -4,4 +4,4 @@
>  # that breaks the format and have been previously discussed on the maili=
ng list
>  # with general agreement from the core team.
>  #
> -OELAYOUT_ABI =3D "9"
> +OELAYOUT_ABI =3D "10"
>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


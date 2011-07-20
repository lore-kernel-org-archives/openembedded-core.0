Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QjYyR-000499-9T
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 17:46:11 +0200
Received: by gyd12 with SMTP id 12so165767gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4i1uAMRQrFnnguw3s64PeUTpihMi9sTf1hKlw0xvCo8=;
	b=vx6Tz5XBhB+u4E7oeyAkdash4l5UVy16j7sPA+ts5UkgqroD8v4TZav+mkMnOQ0ZuQ
	ayiZ6Od/OgSPkNFgIvwIu9NubsfBXUDC26AVGMr0f0v+wwf1K/mxJAGy5UvUpksOGnjK
	gaFDgdkgnPnEbw9hNCfOPZzWxQiW9FyAUcY5A=
MIME-Version: 1.0
Received: by 10.91.199.39 with SMTP id b39mr8781953agq.27.1311176524150; Wed,
	20 Jul 2011 08:42:04 -0700 (PDT)
Received: by 10.91.12.2 with HTTP; Wed, 20 Jul 2011 08:42:04 -0700 (PDT)
In-Reply-To: <CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
	<1310742175.30326.1.camel@phil-desktop>
	<CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
Date: Wed, 20 Jul 2011 11:42:04 -0400
Message-ID: <CADkTA4MetjKoZfS7gcKSm9wm3iQZoxaJPqmrJ6KBOWsXF1QVSQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernels
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
X-List-Received-Date: Wed, 20 Jul 2011 15:46:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2011 at 11:36 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Jul 15, 2011 at 11:02 AM, Phil Blundell <philb@gnu.org> wrote:
>> On Fri, 2011-07-15 at 09:51 -0400, Bruce Ashfield wrote:
>>> On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote:
>>> > The other day I was working on a BSP layer for a fairly generic i586
>>> > system and I was struck by the fact that we don't appear to have any
>>> > vanilla kernel recipes in oe-core. =A0I had sort of expected that, to=
 get
>>> > a standard bzImage out, I would just need to ship an appropriate
>>> > defconfig in my layer and everything else would "just work".
>>>
>>> Hmm. Perhaps it isn't documented clearly enough as such, but the linux-=
yocto
>>> kernel base can work in this mode, since that was a design goal of
>>> 1.0.
>>>
>>> You pick a branch, throw in a config fragment (or defconfig if you real=
ly
>>> want) =A0and build. The base branches in the tree are generic enough to
>>> sort a range of boards out of the box, and should form a base.
>>
>> Okay, cool. =A0I'll give it a go and see how I get on.
>>
>> Is there a description anywhere of what the functional differences are
>> between the code in linux-yocto git and the upstream kernel.org tree?
>
> It varies, and the variables are many, so I can answer this in several wa=
ys.

Following up on my own email. I'm just about to push out the 3.0
kernel support / changes, so I'm seeing the light at the end of the tunnel
and recalled that this is still hanging a bit.

Is there anything tangible you wanted me to do here ?  Create an example ?
Write a short howto  .. or something else ?

Cheers,

Bruce

>
> Here's some bullet points to save anyone from reading an essay:
>
> =A0- The ultimate source is obviously the upstream kernel. The goal is
> no patches, or
> =A0 are the very least, no changes that are carried for a significant
> amount of time.
> =A0 This typically holds for BSPs, drivers, bug fixes, etc. But sometimes=
 not for
> =A0 features or other out of tree projects that haven't made it as
> viable upstream
> =A0 features (yet .. or ever).
>
> =A0 So all that says is that "We aren't trying to vary it wildly, but
> create an infrastructure
> =A0 where interesting projects can be tried out, and to allow others to
> vary it wildly if they
> =A0 want"
>
> =A0- The linux-yocto tree, once a branch is checked out and a build is
> started, is just
> =A0 =A0like any other kernel tree. There are plenty of other examples of
> trees with multiple
> =A0 =A0branches for containing and controlling development. The
> difference here could be
> =A0 =A0that the branch is found and checked out by the build process
> (that's the more
> =A0 =A0'complex' mode, but you can just build 'whatever branch the repo
> is on' as well)
>
> =A0- To see the actual differences from the upstream base, there are tags=
 and the
> =A0 branches themselves, which all facilitate using git to dump logs
> and changes from
> =A0 the merge base of the core branches (i.e. yocto/base).
>
> =A0- The features you'll find in the tree change by kernel version
> (since some projects
> =A0 =A0may lag their updates and hence miss a tree or two), timing of the=
 mainline
> =A0 =A0kernel, the invasiveness of a feature or simply what is being
> worked on by some
> =A0 =A0yocto (or other) developers!
>
> Hope that helps,
>
> Bruce
>
>
>
>>
>> p.
>>
>>
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



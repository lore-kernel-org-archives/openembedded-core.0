Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SCsvH-00071W-Jv
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 15:28:23 +0200
Received: by pbcum15 with SMTP id um15so1628050pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3ydpInebKoDLrSpoAeMIZ01xLA9VHEyz8xAl/RbWWD4=;
	b=rejawVK4qNSydY0vUgWSA7YLCiw4tMXC3IN1Q6aNySy7C72+BipgQ87PHtxR9RWUJ8
	+XGbA6kZfsn58N4zPxxM3gkgO25V/OLiEPQ5F/di8ky8GXa6wWOxQJrGIWADgtUaQalM
	AVHU5Gk/o7NlTMGKxIKfShfOEQyHObpUDWwgVy849HaMeAmhLUlJRzP8dQtNl+HBoHKo
	llw4oGYNcDOzbAl2+cgLb8kmpUh6TlUdc1FxBOnRuGCJYmT84hTO36jdzvhyOR0kYb6e
	ZfKkYI4f2RNI2keBUk6DtBR4E8DvaIqu4DuqrJqykgNPrPhYCZKn+lsL/LKj+NDJ24yK
	TdPw==
MIME-Version: 1.0
Received: by 10.68.217.201 with SMTP id pa9mr52076224pbc.73.1332940760471;
	Wed, 28 Mar 2012 06:19:20 -0700 (PDT)
Received: by 10.143.165.10 with HTTP; Wed, 28 Mar 2012 06:19:20 -0700 (PDT)
In-Reply-To: <12232640.MdqDDZk2lY@helios>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<26662553.TyMenuqT12@helios>
	<alpine.DEB.2.02.1203280713020.2164@oneiric>
	<12232640.MdqDDZk2lY@helios>
Date: Wed, 28 Mar 2012 15:19:20 +0200
Message-ID: <CAAQYJAvw=HXoF0jPCsLwRkmJgdLx41sYzveOrY6qyvdwJ+8MCA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 13:28:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 1:22 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 28 March 2012 07:14:41 Robert P. J. Day wrote:
>> =A0 even though i realize this technique is not encouraged for
>> local.conf, as i mentioned, i just tested using it from scratch in a
>> brand new build and it still didn't add that package to my image. =A0if
>> it should have, then something isn't working.
>
> So, there are two reasons why it might not work:
>
> 1) If you're using core-image-minimal, it will never be included using

Robert, core-image-base is much better for testing (is a bit like
Angstrom console-image)

Paul,
maybe core-image-base (and core-image-core) should be listed in the
output of oe-init-build-env & co.?

Regards

Andrea

> DISTRO_EXTRA_RDEPENDS (nor MACHINE_EXTRA_RDEPENDS, for that matter). This=
 is
> because core-image-minimal does not include task-base - only the minimum
> required to get a working system.
>
> 2) Otherwise, if task-base has already been built and will be included (w=
hich
> it will be for any image that inherits from core-image and does not overr=
ide
> IMAGE_INSTALL, e.g. core-image-sato) but you aren't using OEBasicHash
> (defaults to enabled for latest Poky, but not for OE-Core's default polic=
y)
> then changing DISTRO_EXTRA_RDEPENDS after the fact won't do anything unle=
ss
> you force task-base to rebuild.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



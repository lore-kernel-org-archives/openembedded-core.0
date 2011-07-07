Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QeeJ3-0004Fz-4Q
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 04:27:09 +0200
Received: by yxi19 with SMTP id 19so256807yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2011 19:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dykeYA7sRZvNahZb2IHXcXbBb3Fv0iODAIPJtyt2ioY=;
	b=YdLtfm/ZXT5jVIUw/jRZh3yDPUcXgjLPAsuHLPQIDKYB7lBi0ZQi95A2Ud1N4GbrAU
	qmRiR54b1TUA/tJJ/x7E661wq3kY+JuAMeat0N+7ZLFXaFxXq24pChBmfJjRFfm39YSE
	3SEPgEjjUTn6UnHuhVvJE3X5ARwBom5MYeWJY=
MIME-Version: 1.0
Received: by 10.91.197.10 with SMTP id z10mr434168agp.143.1310005397454; Wed,
	06 Jul 2011 19:23:17 -0700 (PDT)
Received: by 10.90.82.12 with HTTP; Wed, 6 Jul 2011 19:23:17 -0700 (PDT)
In-Reply-To: <1309880759.20015.724.camel@rex>
References: <1309880759.20015.724.camel@rex>
Date: Wed, 6 Jul 2011 23:23:17 -0300
Message-ID: <CADkTA4Nr5WSsLz5r6OojyXm-7=Oepb4YxW3SN-efctp9ERaUFw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel-yocto: Fix case where recipe is always reparsed
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
X-List-Received-Date: Thu, 07 Jul 2011 02:27:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 5, 2011 at 12:45 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If you include a bitbake variable as a comment in a shell function
> then it gets expanded by the bitbake signature handling code.
>
> This could be classed as a bug or a feature depending on your viewpoint
> (e.g. a multiline variable included in a comment could actually contain
> executable code).
>
> Since we don't always want kernel-yocto to reparse this changes the
> syntax of the comment so it doesn't trigger the problem.


Indeed! I had no idea. But this makes sense to me. I haven't checked
to see if this is already in the tree, but I can add my Acked-by to this.

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =A0meta/classes/kernel-yocto.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index 536434f..98272fc 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -136,7 +136,7 @@ do_validate_branches() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
> =A0 =A0 =A0 =A0fi
>
> - =A0 =A0 =A0 # nothing to do if SRCREV=3D${AUTOREV}
> + =A0 =A0 =A0 # nothing to do if SRCREV is AUTOREV
> =A0 =A0 =A0 =A0if [ "${SRCREV_machine}" =3D "AUTOINC" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# restore the branch for builds
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0git checkout -f ${KBRANCH}
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



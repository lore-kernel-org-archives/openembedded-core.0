Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RcNRW-00020R-19
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 21:34:46 +0100
Received: by pbcc11 with SMTP id c11so2234301pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 12:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KtFhRq1ptbozKrbNWIaY53PbdGD/FYV3yITGq7O5rZY=;
	b=YQ3ddA7kDAu24MFOk9wkLDYNTw/iBy++ZjNTDTh4+0MbHugWA01ze4H7lDn5Jrf6Zj
	X0mhQuVdvWNyPZVyl5LVrU7RCloh+f0Hjh1zvBTdIVWgi74XcqwQjfzYwcWh8dt7P2Jl
	jPoA7vUA+cfybyD3jKG5DjdBSwkjf32oCJpx0=
MIME-Version: 1.0
Received: by 10.68.189.199 with SMTP id gk7mr33763523pbc.63.1324240062582;
	Sun, 18 Dec 2011 12:27:42 -0800 (PST)
Received: by 10.143.18.10 with HTTP; Sun, 18 Dec 2011 12:27:42 -0800 (PST)
In-Reply-To: <5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
Date: Sun, 18 Dec 2011 15:27:42 -0500
Message-ID: <CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Sun, 18 Dec 2011 20:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 18, 2011 at 3:13 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>
>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>> separate task from do_deploy. This way the do_install task can also
>> benefit from generated uImage.
>>
>> The only major feature of oe-core's version (not to recreate uImage
>> if it exists) is retained in this patch.
>
> I still don't agree with that behaviour. The in-kernel uImage code is just like the in-kernel defconfigs: useless for people who aren't kernel developers.

In that case, shouldn't people doing u-boot development (or other
non-kernel developers),
be building a uImage via something that isn't in kernel.bbclass ?

Cheers,

Bruce

>
>> On the contra, as this version
>> was merged from meta-oe/org.oe.dev, new function has another feature:
>> it permits overriding the u-boot entrypoint via u-boot symbol.
>
> No it doesn't, since it doesn't recreate uImage.
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7uSX8ACgkQMkyGM64RGpGCLwCgtXQaYv3fu3891FMVs9AK8hK7
> z8QAniVSDXosv3RBKp0GYUnqfCXck2bD
> =UYJG
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



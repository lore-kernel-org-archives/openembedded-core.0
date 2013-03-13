Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UFlfJ-0001Mn-8C
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 14:24:26 +0100
Received: by mail-lb0-f177.google.com with SMTP id go11so926544lbb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XLvhBpeIZYf6fPdDUwarMfM5Z+R82Jer2KyRC3o3Vmc=;
	b=NFSJk4aWurk7RVRcGWSzAyVFwMOyIrT1jP9f9z5uOAbAr4FNxkkOn1Q5JYHEcdz45I
	xgqY69zvBUNyVlrC5KpWO7GZrHDEgk9n+XmGA9a/JnBg8rrC0ZzEqwpgjVtsyfuorwhe
	sm+gE1qJeUKyKLIitb/L5cMvj8rj9kp+NlNUBlh9oHlUk0COZWZAMkXHiKa4USYUe6R2
	2Sj1HWUubP1y5fT4By7IA2kRD7kermdNoc/Cr8n+03pJgT/odG9DPncO5ikyx+3M61bM
	U7J8ehGIGf0Zl9Y7NuybB/zKfRfNVZCmyDeF+EHWOyUY+x544Kunbxpr5ydbbe0+46Fx
	dPmg==
MIME-Version: 1.0
X-Received: by 10.112.40.228 with SMTP id a4mr7652514lbl.26.1363180060334;
	Wed, 13 Mar 2013 06:07:40 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Wed, 13 Mar 2013 06:07:40 -0700 (PDT)
In-Reply-To: <513FACF7.5000907@windriver.com>
References: <513FACF7.5000907@windriver.com>
Date: Wed, 13 Mar 2013 08:07:40 -0500
Message-ID: <CADkTA4O+=ot0kt-aMzHTiVLEsYMNCrWutpDUCfgxTKrBd4zcVQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-alternatives and kernel modules
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
X-List-Received-Date: Wed, 13 Mar 2013 13:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 12, 2013 at 5:32 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I have someone who is trying to use update-alternatives with kernel modules.
>
> They discovered that the rename code changes the name of the module to end
> in .ko.${BPN}.  While the package.bbclass code specifically looks for the
> file name to end in '.ko' in order to avoid stripping the modules... so of
> course the modules get stripped and no longer work properly.
>
> So my question is, is it even reasonable to use update-alternatives with
> kernel modules?  If it is, we probably need to change the trigger in
> packages.bbclass to look for either .ko or .ko.${BPN} (or something
> similar).
>
> Any comments/suggestions?

I'm having a hard time wrapping my head around what they are trying
to achieve. Can you describe it from a non-packaging point of view ?

i.e. do they have two kernel modules that provide the same sort of
services to the kernel and they want to switch between the two of
them based on the alternatives mechanism ?

Cheers,

Bruce

> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



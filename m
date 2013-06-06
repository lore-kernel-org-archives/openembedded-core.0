Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 050B2601AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 22:42:00 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id w20so3654744lbh.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 15:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ePmkAYDUZM2z43RZuZXNVzSEEqxUT5rcTOmUExUj4O0=;
	b=nfIxlE9e9IGQgGLgxNvvFA9lVkayLXTJNl330XFAMxZW5b/0OxZZ3pthfs0U3ZJGzx
	ohd7CTlvx7IQ4tCcoHRbMFEAcUYopRbGgIHcj+EVvhAB9sOLmamAGkT5w6iZ8z3i+sDK
	P+qOUlAQGhMtiuACND0JLYq49cH0Eg2863EeyRwK/NrQlHkbvvqHPQmw3Id0L3KzDYwQ
	9wIM48R5ouXjRjwFdegV/Lq7STJNCEZ0+qsGtubnvnwNLpmzJuTA6eJ4fAfaMdg9sDO2
	kiz32wRo4GSWEu9JlFMByDm7RJSyy4/bezRGW+MPaZS2EsMZ82HfI7P3KzzNA26nUrfu
	7DEw==
MIME-Version: 1.0
X-Received: by 10.112.205.163 with SMTP id lh3mr858085lbc.45.1370558520849;
	Thu, 06 Jun 2013 15:42:00 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Thu, 6 Jun 2013 15:42:00 -0700 (PDT)
In-Reply-To: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
References: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
Date: Thu, 6 Jun 2013 18:42:00 -0400
Message-ID: <CADkTA4NRN5cPFcVLtqwMtwiY3dJb_FJG2n3pYN3dUnGzgpTMuQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linux kernel build dependency of 'bc'
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
X-List-Received-Date: Thu, 06 Jun 2013 22:42:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 11:11 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Bruce,
>
> I got a build failure in my auto builder; it has a very lean system install
> and it spot something it is new for me. It seems the kernel now depends on
> 'bc' util.
>
> I tried to find a 'bc-native'  and couldn't find so I'd like to know if it
> is a known issue and if someone is already working in a 'bc-native' recipe
> to proper fix the issue.

Following up on this thread late (I was on a plane all day), this
hasn't popped up on
my builders, but then again, all of mine have bc, so I wouldn't have noticed
for some time.

If nothing has been entered bugzilla for this, we should do that now, just to
avoid more than one person going ahead and adding bc-native!

Bruce

>
> Regards,
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


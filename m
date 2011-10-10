Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDNEH-0006tQ-1F
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 23:17:45 +0200
Received: by wwf27 with SMTP id 27so7668217wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=4SAX7emZKs5toa8AYosZTqTvxFxnR78tDgSY7d0lF1A=;
	b=k2H6PopRavJoA5ABDOCEbnplnsnE372+Bl0LjJaB/KBWfBAxmphCO0Ez3r1CwmoI07
	p62BUfstPxL/C427vI7fliJSkWjp3VY3qsA3k+rnPXKRVyHZnd5ZzfuIZUPj09h5yPMr
	WHpFb7P1IP97b+IdzgaVa8WrvPNz6ZDGQoj2Q=
Received: by 10.216.72.72 with SMTP id s50mr6072539wed.39.1318281124067; Mon,
	10 Oct 2011 14:12:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Mon, 10 Oct 2011 14:09:27 -0700 (PDT)
In-Reply-To: <CAGiJk9ceiROvLEL-FsT2kLR50rG16xCDo-__cRyqryfSAO0AOQ@mail.gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
	<702d65b93492008812ac8778fc010f30e904383e.1318021323.git.kergoth@gmail.com>
	<CAGiJk9ceiROvLEL-FsT2kLR50rG16xCDo-__cRyqryfSAO0AOQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 10 Oct 2011 14:09:27 -0700
X-Google-Sender-Auth: ql7tZ7R6bQvPMNUUpc6WOWpNF2c
Message-ID: <CABcZANm7giEBXa=ZjvHVr4q2mD6GQeCnsVeZzz-5gXmR-A2Egw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oe.patch: drop bb.msg.domain reference
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
X-List-Received-Date: Mon, 10 Oct 2011 21:17:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 10, 2011 at 12:17 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> Hi,
> there was already a patch for this [1] (Yes I know, I should have
> added more descriptions), according to the patch from Richard [2] the
> message domain can be constructed dynamical now.
> Since your patch seems a little bit different (dropping the message
> domain completely) I can't tell if my resolution was inadequate.
>
> For this patch I think it wouldn't make a big difference for the user,
> feel free to apply the one that best suits in resolving the problem.
>
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009474.html
> [2] http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a6c48298b17e6a5844b3638b422fe226e3b67b89

Indeed, your version is superior.

For what it's worth, consider both of those patches of yours acked by
me. Getting useful error messages rather than python syntax errors is
rather important.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



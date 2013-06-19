Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 666AC608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:02:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JF8Qfk028251; Wed, 19 Jun 2013 16:08:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id voRcGp-Mi8sj; Wed, 19 Jun 2013 16:08:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JF8NjQ028236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 16:08:25 +0100
Message-ID: <1371654124.20823.194.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe MacDonald <joe@deserted.net>
Date: Wed, 19 Jun 2013 16:02:04 +0100
In-Reply-To: <CANBf+V2sThoGM4-U=XfeGgG3kOdZonXx=pgz61LX_83msLbjSg@mail.gmail.com>
References: <1371650216-31735-1-git-send-email-joe@deserted.net>
	<1371651046.20823.189.camel@ted>
	<CANBf+V3L7MBU3U9vZTqVtgv8GYPfoV9aeqyNA6C2QjMpentXOQ@mail.gmail.com>
	<1371652646.20823.192.camel@ted>
	<CANBf+V2sThoGM4-U=XfeGgG3kOdZonXx=pgz61LX_83msLbjSg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bdwgc: support configure on autoconf <2.69
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
X-List-Received-Date: Wed, 19 Jun 2013 15:02:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 10:50 -0400, Joe MacDonald wrote:
> Adding the oe-core list back to the cc list since I accidentally
> dropped the list on my first response.
> 
> On Wed, Jun 19, 2013 at 10:37 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         On Wed, 2013-06-19 at 10:15 -0400, Joe MacDonald wrote:
>         >
>         >
>         
>         > On Wed, Jun 19, 2013 at 10:10 AM, Richard Purdie
>         > <richard.purdie@linuxfoundation.org> wrote:
>         >         On Wed, 2013-06-19 at 09:56 -0400, joe@deserted.net
>         wrote:
>         >         > From: Joe MacDonald <joe@deserted.net>
>         >         >
>         >         > Building bdwgc-native on systems with older
>         versions of
>         >         autoconf (earlier
>         >         > than 2.69) is known to have issues:
>         >         >
>         >         >       https://github.com/ivmai/bdwgc/issues/16
>         >         >
>         >         > An option is to simply mask the errors with
>         >         m4_pattern_allow(...) for each
>         >         > of the macros, but rerunning autoreconf produces a
>         >         functional configure
>         >         > script that builds a functional native version of
>         bdwgc.
>         >         >
>         >         > Signed-off-by: Joe MacDonald <joe@deserted.net>
>         >         > ---
>         >         >  meta/recipes-support/bdwgc/bdwgc_7.2d.bb | 9
>         +++++++++
>         >         >  1 file changed, 9 insertions(+)
>         >         >
>         >         > I tripped over this yesterday on one of my older
>         builders.
>         >          It happens to still
>         >         > be Ubuntu 12.04.2.  I don't know if it's unique to
>         my
>         >         configuration, but after
>         >         > doing some digging around on the web I can't see
>         any obvious
>         >         indications that
>         >         > I'm missing any autotools package and the general
>         consensus
>         >         seems to be that
>         >         > autoreconf is the best option when the failures
>         are
>         >         relatively beign as they
>         >         > are here.
>         >         >
>         >         > -J.
>         >         >
>         >         > diff --git
>         a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
>         >         b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
>         >         > index 46e5257..d8e2de5 100644
>         >         > --- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
>         >         > +++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
>         >         > @@ -36,3 +36,12 @@ ARM_INSTRUCTION_SET = "arm"
>         >         >
>         >         >  inherit autotools
>         >         >  BBCLASSEXTEND = "native nativesdk"
>         >         > +
>         >         > +do_configure_prepend() {
>         >         > +     # Without this, on older installations of
>         autoconf
>         >         errors crop up during configure:
>         >         > +     # | configure.ac:70: error: possibly
>         undefined macro:
>         >         AC_MSG_ERROR
>         >         > +     # |       If this token and others are
>         legitimate,
>         >         please use m4_pattern_allow.
>         >         > +     # |       See the Autoconf documentation.
>         >         > +     # | configure.ac:358: error: possibly
>         undefined macro:
>         >         AS_IF
>         >         > +     ( cd ${S}; autoreconf -i )
>         >         > +}
>         >
>         >
>         >         This is timely since we're seeing this issue on some
>         of the
>         >         autobuilders. We should be autoreconfing by default
>         though,
>         >         any idea why
>         >         it doesn't in this case?
>         >
>         >
>         > No, I didn't actually dig into that, I didn't realize it
>         should be
>         > autoreconfing.  Is it explciit in the do_configure step, or
>         implicit?
>         >  Maybe it's a timestamp issue or something?  The only
>         machine I've got
>         > left that has this problem is pretty fast, so maybe on a
>         slower (or
>         > more heavily loaded) machine an implicit rule will fire
>         where a beefy,
>         > unloaded one won't?  Just a wild guess.
>         
>         
>         Reading the link you supplied further, it could be a missing
>         pkgconfig
>         dependency?
> 
> 
> I thought so at first, but I couldn't find anything absent on my
> builder that looked even remotely pkgconfig-related.  Then I started
> digging into the autotools stuff, since the warning is clearly about
> expanding autoconf macros and that's when I finally started paying
> attention to the version numbers on the failing host versus the
> builders I use that weren't complaining.
> 
> 
> It could still be that there's something missing, but when I noticed
> the comment just below the "closed" bar in the issue I linked:
> 
> 
>  ivmai commented10 months ago
> I have tested the git sources from bdwgc and they only configure
> properly with autoconf >= 2.69. [...]
> It seemed like I'd found at least confirmation that what I was seeing
> was expected.
> 
> 
> I have no idea why the autotools.bbclass' autoreconf wouldn't do it,
> though.  I'll go have a quick look to see if the tree is different
> because I also passed it -i when I did the autoreconf.
> 

I have a reproducer:

bitbake bdwgc-native pkgconfig-native -c clean; bitbake bdwgc-native

Pretty sure its a missing pkgconfig dependency.

Cheers,

Richard




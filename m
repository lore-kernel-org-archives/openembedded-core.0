Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F22287D6B0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 17:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xGVB4QPjz2C;
	Sat,  4 May 2019 19:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556991602;
	bh=bJH/U1lQvU8ay7UJLtUawx58lK8CRlz5kuIleo3gKYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2obGGnuxzG7TJh5SVCeeGXvW6+YqiIkiMD5/QIoYlhzvCgg25i/zOVDMfQ6XfeH3
	NqU1M/sOjkZcApvenpVS3XX5qRhHsw7nmognXa/uUkZnUpyWjq10xUcSfmhZy8f5OC
	e8eZrNYBYv7EedIs23FFf6T52F98HCDHf6TmgsXhv/K9XeKc0fzPH05p5EvcCauQI4
	guTHfH5Zge8bIKB9HnpdL9Jm+MGVtvduFvxamgmp+MYHDK+DHKE+776Wog/m702sBv
	OnfNjKPoOE4PZcNbjBRg9KlnZGdHZEbLWNT7yxsu4OefQyzU4/Joyc9NgEIUTNcicT
	Ie72WihoCwSANWrRuohCZUGhxSY8hiMoedtchGSV1sL1m+za8qs0sfUn/kZQFvtBMc
	Ni6mAbkM8/tfZnhThY8UnV7ACt1EKKxSCPGQldoboySObcGkvB+ViRnJUZfjMZr7pt
	bsTbc3AyFc9rahbwaxdsd6xgqGZ9lun6elZfFA2bSW1QmJdvHNV61Qhqa2vQLRJgmM
	pACaITAWD6HsPrE8AdXzTiSXcnMxXluL85TUBg4zFd5AzzT9jlhSh0fwIAy899Lt4D
	fvEy/f1s+tI+hVytn6oz31GX5h8+pU0HdHK60PrVlBGJliEwMfr3oe2OA3dO6DI9GG
	4V7TWEGGrZ4TKnOVHmdia8xA=
Date: Sat, 4 May 2019 20:40:00 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190504174000.GH11633@localhost>
References: <cover.1556983501.git.akuster808@gmail.com>
	<6b6aa062a72aa2d50a8318dc03f8d91a32c21e94.1556983501.git.akuster808@gmail.com>
	<20190504160956.GE11633@localhost>
	<e26f8733-d1f8-4ea8-03b1-900b12f69f73@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e26f8733-d1f8-4ea8-03b1-900b12f69f73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 40/43] waffle: supprt build waffle without x11
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
X-List-Received-Date: Sat, 04 May 2019 17:40:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 04, 2019 at 10:05:11AM -0700, akuster808 wrote:
> 
> 
> On 5/4/19 9:09 AM, Adrian Bunk wrote:
> > On Sat, May 04, 2019 at 08:27:16AM -0700, Armin Kuster wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> respect DISTRO_FEATURES to make waffle support different platform,
> >> gbm platform is supported by default.
> >>
> >> [YOCTO #6077]
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta/recipes-graphics/waffle/waffle_1.5.2.bb | 7 +++----
> >>  1 file changed, 3 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> >> index 43c3edc..31572f2 100644
> >> --- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> >> +++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
> >> @@ -15,10 +15,9 @@ inherit cmake distro_features_check lib_package
> >>  
> >>  # This should be overridden per-machine to reflect the capabilities of the GL
> >>  # stack.
> >> -PACKAGECONFIG ??= "glx"
> >> -
> >> -# libx11 requires x11 in DISTRO_FEATURES.
> >> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
> >> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
> >> +                   gbm"
> >> ...
> > Changing the default PACKAGECONFIG does not look appropriate for
> > a stable branch.
> 
> Go look at the bug for more details.

It raises the additional question why the new feature of building piglit
without x11 is considered appropriate for a stable branch.

You said before that adding new recipes to stable branches is not 
appropriate. Changing the behaviour of existing recipes is a lot worse 
than that, since it changes what gets built in existing distibutions 
using the stable branch.

And a 5 year old bug asking for an enhancement of an existing recipe
does not sound like an appropriate justification for changing the
default PACKAGECONFIG of a recipe in a stable branch to me.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



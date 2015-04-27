Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A05165CD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 07:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3R7Dt2J022298; Mon, 27 Apr 2015 08:13:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CfA0YpYZKCPh; Mon, 27 Apr 2015 08:13:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3R7DVEn022292
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2015 08:13:53 +0100
Message-ID: <1430118811.13022.91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Mon, 27 Apr 2015 08:13:31 +0100
In-Reply-To: <CABcZAN=Xebt9XPGD_FgpsTp06nbs6OezJhsBNCTnoefCfknxzA@mail.gmail.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
	<1a55976003e57036ced5e47dd031575508dfc87b.1429799661.git.cristian.iorga@intel.com>
	<1430085461.13022.89.camel@linuxfoundation.org>
	<CABcZAN=Xebt9XPGD_FgpsTp06nbs6OezJhsBNCTnoefCfknxzA@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 4/4] bluez5: don't exclude from world builds
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
X-List-Received-Date: Mon, 27 Apr 2015 07:14:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-04-26 at 18:17 -0700, Christopher Larson wrote:
> 
> On Sun, Apr 26, 2015 at 2:57 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         On Thu, 2015-04-23 at 17:38 +0300, Cristian Iorga wrote:
>         > As BlueZ5 will be the default Bluetooth stack,
>         > don't exclude it from world builds.
>         >
>         > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>         > ---
>         >  meta/recipes-connectivity/bluez5/bluez5.inc | 2 --
>         >  1 file changed, 2 deletions(-)
>         >
>         > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
>         b/meta/recipes-connectivity/bluez5/bluez5.inc
>         > index 67aafbb..bf845a8 100644
>         > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>         > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>         > @@ -100,5 +100,3 @@ FILES_${PN}-dbg += "\
>         >  RDEPENDS_${PN}-testtools += "python python-dbus
>         python-pygobject"
>         >
>         >  SYSTEMD_SERVICE_${PN} = "bluetooth.service"
>         > -
>         > -EXCLUDE_FROM_WORLD = "1"
>         
>         The reason this is there is to ensure that a bitbake world
>         doesn't build
>         bluez4 and 5 at the same time. Even though v4 is moving to
>         meta-oe, it
>         doesn't change the fact we really need this so world builds
>         don't end up
>         in a mess.
>         
>         Typically, any recipe providing a vritual/xxxx PROVIDES will
>         also end up
>         with an EXCLUDE_FROM_WORLD as the dependency mechanism will
>         then pull in
>         the correct thing(s).
>         
>         Not ideal but its what we have today.
> 
> Originally, world was designed to only build one of any given multiple
> provider situation, IIRC. Is that not the case, or is it the fact that
> both get pulled in via dependencies in a world build, not directly?

I'm not aware of any code that would remove things with multiple
providers from world? Its possible that got lost when we switched to
multiple threads of execution but that was a long time ago.

Cheers,

Richard




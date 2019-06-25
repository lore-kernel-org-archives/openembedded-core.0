Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5125A7E65B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 18:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YF576Hwgz3H;
	Tue, 25 Jun 2019 20:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561487260;
	bh=kzk46lRLVplTcxZMGq6SGMPHovABothzFHl4xM7vq5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzxC8f7B0WuZzx8wRtIuKDBU8SZ6ZImdBf08lMMcMhyegtRk8/jo8wBa/cOlsEUVe
	SLK9DkguXDBwZ+0/OihGtAETlGE0bwd0GbssKTuA+1oai1oRYZNhG4iCEat2YLfd/p
	xfNy7rJEtaaddV1W3xAu5uuXRjh24FA7PTQpOfaBqNKvzGgeDIofiVblBI7EgMhL92
	/gfgAOSM7IbfxSeEe4leCgOt9UimR2l55UyjGhYi1DPfc+qsVxJrAAxLPZaA5GU0qH
	wUS35dGg3xy3fVg8/uuI9ent7Oedh2Jz6TpRE6o/t/9/Jqndgnll7TNZZNH1mpfxFH
	S36P6tYUxDVMP2tiGp4JkuRCXxTPrj9SGt3pTQ9SkAq+0ZZRaTkqAGeuEP3wCzU9Zl
	Zs1zyb62UEouh/ObCD1fdjdQjyWvl8n1g4PTT28wXSNBfmkV1xO6oXyNnnb0nqY6sd
	XAZoMFC5PLFhZn0lMnt4pJdPGmLAmfb10Wtmn1K0TbueOStRLoU/lGbIQ0LUxLYcTR
	8DEpn07nWMWhakh8j0E4/h4wjFsGv6hxY+sWzdnBeOthGCK2xQO4y2Xqn+GJhgcrXx
	+uzAEG/v7H/mIrSX94Vw4yZ3r6ITahjrwd303zCGZyBllajurSimP75iE5k7rTNunE
	veVDLyecf542z5dcpiRX9GPo=
Date: Tue, 25 Jun 2019 21:27:37 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20190625182737.GA21266@localhost>
References: <20190625172627.24662-4-bunk@stusta.de>
	<8044fe9a-d4f7-9b89-015f-e4008805f831@windriver.com>
MIME-Version: 1.0
In-Reply-To: <8044fe9a-d4f7-9b89-015f-e4008805f831@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnotify: Remove obsolete dependency on dbus-glib
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
X-List-Received-Date: Tue, 25 Jun 2019 18:27:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 25, 2019 at 02:09:02PM -0400, Randy MacLeod wrote:
> On 6/25/19 1:26 PM, Adrian Bunk wrote:
> > Upstream stopped using it in 2010.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >   meta/recipes-gnome/libnotify/libnotify_0.7.8.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> > index 82c137ca33..1c9084d919 100644
> > --- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> > +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> > @@ -4,7 +4,7 @@ SECTION = "libs"
> >   LICENSE = "LGPLv2.1"
> >   LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> > -DEPENDS = "dbus gtk+3 dbus-glib"
> > +DEPENDS = "dbus gtk+3 glib-2.0"
> >   inherit gnomebase gtk-doc distro_features_check gobject-introspection
> >   # depends on gtk+3
> > 
> 
> Nice.
> 
> Are you doing a manual inspection and analysis or
> something more automated that you can share as a script/workflow?

Manual.

I was curious what it would take to remove dbus-glib from oe-core.
This doesn't seem to be easy right now, but these were some trivial 
cases where all that was needed was to remove the dependency.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



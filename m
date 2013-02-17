Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U76TG-0002jZ-4D
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 16:48:34 +0100
Received: by mail-ob0-f179.google.com with SMTP id un3so4956117obb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 07:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=99FPsg4P+DgnlPvKjSV6B1bwpU17G4HfWMDtOGO5jkw=;
	b=OVel8cEBwZU9wE6pet0dn+VaDO746TqQTxg7AM3UCjHfGmavrG9DBMgaH7XbDt3jV7
	1qWoEiqZfe5Slr9d0FIwMIkX8H31OO1zrsbkwL21sp3htP0VevZMYpHkLikAtg1IIHoI
	yEqxJzjWyFMP8hf2uOPjJOvLwB9/cHXuxjFT32jt6SsdYPdoA+mdZNT/ktimMPUDf9dL
	hoscw2v/MSrJFgKsuvCPo+A816APGfvJu+Ki97qVdK7gGTREhw8lJiUL6ltt13heBozk
	ld3ga7ISEEkvunp5akHWFWAEQistgpQ9a4OMJx2o+8/BK8SVuvq7BCOIT4zmmwOawyx/
	+bFQ==
MIME-Version: 1.0
X-Received: by 10.182.3.163 with SMTP id d3mr4896008obd.27.1361115119104; Sun,
	17 Feb 2013 07:31:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sun, 17 Feb 2013 07:31:58 -0800 (PST)
In-Reply-To: <1361113811.32271.7.camel@ted>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
	<1361049644-27904-2-git-send-email-otavio@ossystems.com.br>
	<1361087244.31795.105.camel@ted>
	<CAP9ODKoC6MHFy11Pp6=78+GbfuKnL3xYs6EfNcKPA6HudUk_vQ@mail.gmail.com>
	<1361108669.32271.1.camel@ted>
	<CAP9ODKpcnhdKSQbonxq5kxzcRhj=Yw-Y4gu+3nd4zH2pdv1rvQ@mail.gmail.com>
	<1361112495.32271.5.camel@ted>
	<CAP9ODKpgOptx24WN7q-DqZaYDiZ4NZG3+CLMNbpKzTrzz6GvVQ@mail.gmail.com>
	<1361113811.32271.7.camel@ted>
Date: Sun, 17 Feb 2013 12:31:58 -0300
X-Google-Sender-Auth: gtsbjasy_MwKVIeNbw6MaLhFcl8
Message-ID: <CAP9ODKog79pOtxFAtPUPvn4Jj+35zremNoYMO+BWbDJ3aOuZSA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] dbus: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Sun, 17 Feb 2013 15:48:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 17, 2013 at 12:10 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2013-02-17 at 11:52 -0300, Otavio Salvador wrote:
>> On Sun, Feb 17, 2013 at 11:48 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Sun, 2013-02-17 at 10:55 -0300, Otavio Salvador wrote:
>> >> On Sun, Feb 17, 2013 at 10:44 AM, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> > On Sun, 2013-02-17 at 10:40 -0300, Otavio Salvador wrote:
>> >> >> On Sun, Feb 17, 2013 at 4:47 AM, Richard Purdie
>> >> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> >> > On Sat, 2013-02-16 at 19:20 -0200, Otavio Salvador wrote:
>> >> >> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >> >> >> ---
>> >> >> >>  meta/recipes-core/dbus/dbus.inc | 2 +-
>> >> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >> >>
>> >> >> >> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> >> >> >> index 292ab29..cebab28 100644
>> >> >> >> --- a/meta/recipes-core/dbus/dbus.inc
>> >> >> >> +++ b/meta/recipes-core/dbus/dbus.inc
>> >> >> >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>> >> >> >>  X11DEPENDS = "virtual/libx11 libsm"
>> >> >> >>  DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>> >> >> >>  DEPENDS_class-native = "expat-native virtual/libintl-native"
>> >> >> >> -DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
>> >> >> >> +DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
>> >> >> >>  RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
>> >> >> >>  RDEPENDS_class-native = ""
>> >> >> >
>> >> >> > This tends to be a really bad idea for dbus-nativesdk. If you install an
>> >> >> > SDK compiled with these options into PATH only a system which does have
>> >> >> > x11, it will break functionality in a way unacceptable to users.
>> >> >>
>> >> >> I don't see how it'd break anything being deployed in a toolchain. We
>> >> >> don't initialize the dbus daemon so it is mostly used to fulfill
>> >> >> dependencies.
>> >> >
>> >> > Imagine you source the toolchain setup script. The limited functionality
>> >> > dbus-launch just got into PATH. Now you run some X application. Things
>> >> > break.
>> >>
>> >> You usually to not source the env script and run your X server on top
>> >> of it, I think. Personally I source it in a terminal session inside of
>> >> X and use it to build things only.
>> >
>> > No, but people do open a terminal in X and then source the script there,
>> > then run other X applications from within the terminal window. Those X
>> > applications can use dbus activation. A dbus-launch without x11 support
>> > causes problems in this situation.
>>
>> Yes; got it.
>>
>> So your idea is to avoid x11 dependency altogether and drop
>> dbus-launch to avoid this errors?
>
> Yes, I did the same thing with dbus-native for exactly this reason (e.g.
> X apps from within a devshell). I didn't touch dbus-nativesdk since it
> has the X dependency and I didn't think it was bothering anyone.

Ok; will make v2 with this change.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



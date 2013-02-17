Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U74xZ-0000GC-I4
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 15:11:18 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so5125832oag.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 05:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=w7/Rt9M0WbEKA7xalaFHJuOc5I0VWVgq22E25C1JCcc=;
	b=08x1UrZ81teR/1nJZqQgOmYegLF7KekSYYbxphJWYYuZwdQIK8kJXjeVepLIDx6lO3
	yWbFc1GJ2qr98zVb/70gc7+XCD2im7WS9Ml+8fOzEO1HP2ykqPylVIMSCpRkidFO7c7L
	OVvZq7xBTNorioMFTMYzvL74ileKGOUyqsTb/HhNeIkUMltFy4nMVF972SDxJs6Nii4b
	07lbT1Guy6xBvmQZouYxieSOBxJ04HkTYw4lmVtpI71bGLpRgqDREl/+DVUZCJiF/JYC
	m5Vb83ZG9XoKRQ/iRohYzFjDmmFg6y0fw6RgqofY+wxkXT+RK7lAV44vOu1s02ADtV03
	JxBQ==
MIME-Version: 1.0
X-Received: by 10.60.171.102 with SMTP id at6mr4923327oec.60.1361109308957;
	Sun, 17 Feb 2013 05:55:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sun, 17 Feb 2013 05:55:08 -0800 (PST)
In-Reply-To: <1361108669.32271.1.camel@ted>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
	<1361049644-27904-2-git-send-email-otavio@ossystems.com.br>
	<1361087244.31795.105.camel@ted>
	<CAP9ODKoC6MHFy11Pp6=78+GbfuKnL3xYs6EfNcKPA6HudUk_vQ@mail.gmail.com>
	<1361108669.32271.1.camel@ted>
Date: Sun, 17 Feb 2013 10:55:08 -0300
X-Google-Sender-Auth: k2eC-7174qpbsNQf8gUTh3ScGdk
Message-ID: <CAP9ODKpcnhdKSQbonxq5kxzcRhj=Yw-Y4gu+3nd4zH2pdv1rvQ@mail.gmail.com>
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
X-List-Received-Date: Sun, 17 Feb 2013 14:11:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 17, 2013 at 10:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2013-02-17 at 10:40 -0300, Otavio Salvador wrote:
>> On Sun, Feb 17, 2013 at 4:47 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Sat, 2013-02-16 at 19:20 -0200, Otavio Salvador wrote:
>> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >> ---
>> >>  meta/recipes-core/dbus/dbus.inc | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> >> index 292ab29..cebab28 100644
>> >> --- a/meta/recipes-core/dbus/dbus.inc
>> >> +++ b/meta/recipes-core/dbus/dbus.inc
>> >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>> >>  X11DEPENDS = "virtual/libx11 libsm"
>> >>  DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>> >>  DEPENDS_class-native = "expat-native virtual/libintl-native"
>> >> -DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
>> >> +DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
>> >>  RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
>> >>  RDEPENDS_class-native = ""
>> >
>> > This tends to be a really bad idea for dbus-nativesdk. If you install an
>> > SDK compiled with these options into PATH only a system which does have
>> > x11, it will break functionality in a way unacceptable to users.
>>
>> I don't see how it'd break anything being deployed in a toolchain. We
>> don't initialize the dbus daemon so it is mostly used to fulfill
>> dependencies.
>
> Imagine you source the toolchain setup script. The limited functionality
> dbus-launch just got into PATH. Now you run some X application. Things
> break.

You usually to not source the env script and run your X server on top
of it, I think. Personally I source it in a terminal session inside of
X and use it to build things only.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



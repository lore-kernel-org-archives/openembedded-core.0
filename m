Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOWKG-0007sB-Ql
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 17:46:16 +0200
Received: by lagw12 with SMTP id w12so1407556lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2GGLhJkY9aK8L06RpOMCK++8bmkZtpE6bHECYaNl76w=;
	b=jdIf5KzGEwAvpl9PphIYgEjAyn+AXA1pVxavBqxqzmFFh1zzyulN46UkDi2XUYcTDJ
	S40cd4I3VLbM793+Mwfbo76AnSTe3k/E/aE1YKOzHadbMDoIhR8zBZ24M/SAh37FrELK
	vxszHWJvwqRfqWVrHSCRwmXwPn/ZeSKQISbg/WkIEXwrZM5ifcV2M9U133h9CgDdpYCl
	ukl0+OhxLOOw+Ii2oo5o/gOrS+v5yAXqy0OE4Re8NMDfs8du2qKwHr775tau1LluDQ2G
	NO9mQlWPnh/cIMATQh/1LPcSkyFqD80wKZjPE/gm0KQKeHJLVngym9yzEtf3/ERPniSE
	9L4w==
Received: by 10.112.86.101 with SMTP id o5mr8699298lbz.1.1335713795617; Sun,
	29 Apr 2012 08:36:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 08:36:05 -0700 (PDT)
In-Reply-To: <20120429091230.GB350@jama.jama.net>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<20120429091230.GB350@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 08:36:05 -0700
Message-ID: <CAMKF1soP1RTPBz6agsVvYFvQKdcnd2pyXyHSm3m8313SRjp6jQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Sun, 29 Apr 2012 15:46:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2012 at 2:12 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Apr 25, 2012 at 04:31:53PM -0700, Khem Raj wrote:
>> Hello
>>
>> Now that release is almost out of door. I would like some eyes on the
>> gcc-4.7 work
>> and mips64 architecture support that I have done meanwhile
>>
>> I have made sure that gcc-4.6 still keeps working and I have patches
>> for gcc-4.5 too
>> for meta-oe too. I have repeatedly built core-image-sato and
>> core-image-minimal for uclibc/eglibc
>> but more coverage would be nicer.
>>
>> The patches are posted here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/misc
>>
>> I would appreciate any feedback or testing on this
>
> I got some errors while building gcc* recipes (overwriting header
> files in work-shared or something like that) but that's not new, gcc-4.6
> was failing the same - restarting build few times and it will succeed
> once.

hmm more details on this one would be better. May be its a bug in gcc
build system

>
> My minimal shr-lite-image compiles now fine and works on om-gta02
> (armv4t) sofar without segfaults.. so looks good.

nice

>
> For normal image and feeds I've few more recipes which are failing with g=
cc-4.7:
>
> meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
> =C2=A0| Unknown parameter a interfaceName for tags/attrs
> =C2=A0| make[2]: *** [DerivedSources/WebCore/HTMLNames.cpp] Error 255
> =C2=A0http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-=
shr-image/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/webkit-efl-1.=
7.3+svnr105069-r1/
> =C2=A0I'm upgrading this one instead of fixing it, because we had some
> =C2=A0issues in runtime with current version, but new version needs newer
> =C2=A0libsoup-2.4->glib-2.0->gobject-introspection->etc and fails with
> =C2=A0different compilation issues.. so maybe if you know how to easily f=
ix
> =C2=A0it in current, we can, otherwise I'll continue to work on upgrade

I can surely provide you a fix once I look at sources. But seems  you
have more than one problems that may not be fixed. So upgrading has a
slight chance of fixing both of your issues and introducing many more
:) but lets try upgrade route and if then
we need 4.7 patch ping me.

>
> =C2=A0BTW: similar fix as you did for webkit-gtk is in upstream r109509
>

Nice as long as the things are fixed I am happy.


> meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
> =C2=A0../../../src/frontend/common/TemplateBuilder.hh:54:42: error: redec=
laration of 'SmartPtr<typename ElementBuilder::type> elem'
> =C2=A0../../../src/frontend/common/TemplateBuilder.hh:50:49: error: 'Smar=
tPtr<typename ElementBuilder::type> elem' previously declared here
> =C2=A0http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-=
shr-image/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gtkmathview-0=
.8.0-r1/
>
> meta-smartphone/meta-shr/recipes-shr/3rdparty/numptyphysics_svn.bb
> =C2=A0fixed in shr branch

good


>
> meta-mozilla/recipes-mozilla/firefox/firefox_10.0.2.bb
> =C2=A0| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eg=
libc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r1/mozilla-releas=
e/ipc/chromium/src/base/file_util.cc:228:35: error: 'ftruncate' was not dec=
lared in this scope
> =C2=A0probably easy to fix, adding Otavio to CC (maybe he has upgrade or =
fix
> =C2=A0ready)
>

just #include <unistd.h> in ipc/chromium/src/base/file_util.cc should fix i=
t

> Cheers,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



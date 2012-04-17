Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SK6pU-0000LJ-L7 for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 13:44:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HBYpBl012603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:34:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12105-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:34:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3HBYfrV012597
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:34:42 +0100
Message-ID: <1334662484.616.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 12:34:44 +0100
In-Reply-To: <4F8C2F74.9010903@opendreambox.org>
References: <cover.1334400035.git.dongxiao.xu@intel.com>
	<7a59efe236b3ebd7472ce95bf75b9b5a27ba656c.1334400035.git.dongxiao.xu@intel.com>
	<5007F7A3-3E6D-4DB5-A345-B7FD4322A283@dominion.thruhere.net>
	<1334447226.27917.42.camel@dongxiao-osel>
	<4F8C2F74.9010903@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gst-plugins-bad: add curl as build dependency
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
X-List-Received-Date: Tue, 17 Apr 2012 11:44:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-16 at 16:40 +0200, Andreas Oberritter wrote:
> On 15.04.2012 01:47, Xu, Dongxiao wrote:
> > On Sat, 2012-04-14 at 13:23 +0200, Koen Kooi wrote:
> >> Op 14 apr. 2012, om 12:44 heeft Dongxiao Xu het volgende geschreven:
> >>
> >>> gst-plugins-bad needs curl.h to finish its build, so add curl as its
> >>> dependency.
> >>
> >> I can't be sure without the exact failure log, but: missing PR bump
> > 
> > Add a dependency here doesn't impact the original build. If the original
> > build is successful, it means curl has already been built by chance. Do
> > we still need to bump PR in this case?
> > 
> > Besides, this is the detailed log:
> > 
> > i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586
> > --sysroot=/distro/sdb/build-master/tmp/sysroots/qemux86 -std=gnu99
> > -DHAVE_CONFIG_H -I. -I../.. -pthread
> > -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -pthread -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wwrite-strings -Wformat-security -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wnested-externs -O2 -pipe -g -feliminate-unused-debug-types -c gstcurlsink.c  -fPIC -DPIC -o .libs/libg!
 stc
>  ur
> >  l_la-gstcurlsink.o
> > i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586
> > --sysroot=/distro/sdb/build-master/tmp/sysroots/qemux86 -std=gnu99
> > -DHAVE_CONFIG_H -I. -I../.. -pthread
> > -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -pthread -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wwrite-strings -Wformat-security -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wnested-externs -O2 -pipe -g -feliminate-unused-debug-types -c gstcurl.c  -fPIC -DPIC -o .libs/libgstcu!
 rl_
>  la
> >  -gstcurl.o
> > gstcurlsink.c:45:23: fatal error: curl/curl.h: No such file or directory
> > compilation terminated.
> > make[3]: *** [libgstcurl_la-gstcurlsink.lo] Error 1
> > make[3]: *** Waiting for unfinished jobs....
> 
> That's certainly wrong, because for me curl is a new dependency, i.e. it
> didn't need to be built before this patch went in.
> 
> The error above is probably the symptom of a race condition, where curl
> was rebuilt and thus removed from the sysroot after gst-plugins-bad was
> configured.
> 
> So either a PR bump is required or --disable-curl (or such) should have
> been used instead.

I want the builds to be deterministic so either enabling curl (via
DEPENDS) or disabling it through the configure option would be fine. I
went with adding curl since gst-plugins-bad is one of the last packages
to build on the autobuilder and hence it would usually have had curl
built so that is the most tested configuration I'm aware of.

I've pushed a PR bump.

Cheers,

Richard




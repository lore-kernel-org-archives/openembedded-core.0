Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SJnG7-0007Jr-EH
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 16:50:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B56483146880
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:41:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id r1yU8ZYYLM2G
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:40:54 +0200 (CEST)
Received: from [192.168.2.108] (p5B119AE4.dip.t-dialin.net [91.17.154.228])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B2CE3315B294
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:40:53 +0200 (CEST)
Message-ID: <4F8C2F74.9010903@opendreambox.org>
Date: Mon, 16 Apr 2012 16:40:52 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1334400035.git.dongxiao.xu@intel.com>
	<7a59efe236b3ebd7472ce95bf75b9b5a27ba656c.1334400035.git.dongxiao.xu@intel.com>
	<5007F7A3-3E6D-4DB5-A345-B7FD4322A283@dominion.thruhere.net>
	<1334447226.27917.42.camel@dongxiao-osel>
In-Reply-To: <1334447226.27917.42.camel@dongxiao-osel>
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
X-List-Received-Date: Mon, 16 Apr 2012 14:50:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15.04.2012 01:47, Xu, Dongxiao wrote:
> On Sat, 2012-04-14 at 13:23 +0200, Koen Kooi wrote:
>> Op 14 apr. 2012, om 12:44 heeft Dongxiao Xu het volgende geschreven:
>>
>>> gst-plugins-bad needs curl.h to finish its build, so add curl as its
>>> dependency.
>>
>> I can't be sure without the exact failure log, but: missing PR bump
> 
> Add a dependency here doesn't impact the original build. If the original
> build is successful, it means curl has already been built by chance. Do
> we still need to bump PR in this case?
> 
> Besides, this is the detailed log:
> 
> i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586
> --sysroot=/distro/sdb/build-master/tmp/sysroots/qemux86 -std=gnu99
> -DHAVE_CONFIG_H -I. -I../.. -pthread
> -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -pthread -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wwrite-strings -Wformat-security -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wnested-externs -O2 -pipe -g -feliminate-unused-debug-types -c gstcurlsink.c  -fPIC -DPIC -o .libs/libgstc
 ur
>  l_la-gstcurlsink.o
> i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586
> --sysroot=/distro/sdb/build-master/tmp/sysroots/qemux86 -std=gnu99
> -DHAVE_CONFIG_H -I. -I../.. -pthread
> -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -pthread -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/gstreamer-0.10 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/glib-2.0 -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/lib/glib-2.0/include -I/distro/sdb/build-master/tmp/sysroots/qemux86/usr/include/libxml2 -DG_THREADS_MANDATORY -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -Wall -Wdeclaration-after-statement -Wvla -Wpointer-arith -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wwrite-strings -Wformat-security -Wold-style-definition -Winit-self -Wmissing-include-dirs -Waddress -Wno-multichar -Wnested-externs -O2 -pipe -g -feliminate-unused-debug-types -c gstcurl.c  -fPIC -DPIC -o .libs/libgstcurl_
 la
>  -gstcurl.o
> gstcurlsink.c:45:23: fatal error: curl/curl.h: No such file or directory
> compilation terminated.
> make[3]: *** [libgstcurl_la-gstcurlsink.lo] Error 1
> make[3]: *** Waiting for unfinished jobs....

That's certainly wrong, because for me curl is a new dependency, i.e. it
didn't need to be built before this patch went in.

The error above is probably the symptom of a race condition, where curl
was rebuilt and thus removed from the sysroot after gst-plugins-bad was
configured.

So either a PR bump is required or --disable-curl (or such) should have
been used instead.

Regards,
Andreas



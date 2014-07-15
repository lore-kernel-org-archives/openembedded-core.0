Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EACAC70298
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 10:58:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6FAvmXu007327; Tue, 15 Jul 2014 11:57:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FsZ814wWLTyy; Tue, 15 Jul 2014 11:57:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6FAvgBF007322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 15 Jul 2014 11:57:44 +0100
Message-ID: <1405421856.20402.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 15 Jul 2014 11:57:36 +0100
In-Reply-To: <53BF41A9.4010706@windriver.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
	<9941caf92c8d49ddd3cdea016fa8ec6263875185.1404885647.git.hongxu.jia@windriver.com>
	<CAJTo0LZ7X4UUedddwb3q9XxkqZqTYF8-mHST7GRZ0y7OZUksvg@mail.gmail.com>
	<53BF41A9.4010706@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 4/8] xmlto: add version 0.0.25
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
X-List-Received-Date: Tue, 15 Jul 2014 10:58:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-11 at 09:45 +0800, Hongxu Jia wrote:
> On 07/11/2014 04:57 AM, Burton, Ross wrote:
> 
> > On 9 July 2014 11:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> > > +# To make sure these native packages ready before xmlto-native was invoked.
> > > +DEPENDS_class-native = " \
> > > +    docbook-xml-dtd4-native \
> > > +    docbook-xsl-stylesheets-native \
> > > +    util-linux-native \
> > > +    libxml2-native \
> > > +    libxslt-native \
> > > +"
> > Does this do what you want if xmlto-native is pulled in from sstate in
> > an empty tmp?
> 
> Hi Ross,
> 
> If we don't have it, while runing bitbake world, there was a build
> failure for alsa-utils which xmlto enabled.
> ...
> | xmlto man alsactl_init.xml
> | sed -e 's,@localstatedir\@,/var,g' -e 's,@sbindir\@,/usr/sbin,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' < 90-alsa-restore.rules.in > 90-alsa-restore.rules || rm 90-alsa-restore.rules
> | i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86  -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o alsactl alsactl-alsactl.o alsactl-state.o alsactl-lock.o alsactl-utils.o alsactl-init_parse.o alsactl-daemon.o  -lasound -lm -ldl -lpthread
> | xmlto: /buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml does not validate (status 3)
> | xmlto: Fix document syntax or use --skip-validation option
> | I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd
> | /buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml:3: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> |   "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
> |                                                            ^
> | I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd
> | warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> | validity error : Could not load the external subset "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> ...
> 
> The alsa-utils invoked xmlto to generate document at his do_compile,
> so we have to make sure the above native packages prepared before
> xmlto-native.

Shouldn't alsa-utils have a dependency on the docbook pieces it needs as
well as xmlto-native then?

Certainly, these are not build time dependencies of xmlto so something
is not quite right...

Cheers,

Richard



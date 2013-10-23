Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 67AEE6D2CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 13:43:01 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5B181F81203; Wed, 23 Oct 2013 07:43:03 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9B763F81202;
	Wed, 23 Oct 2013 07:43:02 -0600 (MDT)
Message-ID: <5267D269.2020701@mlbassoc.com>
Date: Wed, 23 Oct 2013 07:43:05 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Mesa mess
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
X-List-Received-Date: Wed, 23 Oct 2013 13:43:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

With the current master (Poky ffb440c37c), I can't build anything
with a virtual/mesa requirement.  This seems to bring in both mesa
and mesa-gl, which fight to the death, killing the build :-(

It starts with this error:
   ERROR: Multiple .bb files are due to be built which each provide virtual/libgl (/local/poky-cutting-edge/meta/recipes-graphics/mesa/mesa_9.1.6.bb 
/local/poky-cutting-edge/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb).
  This usually means one provides something the other doesn't and should.

And ends when mesa tries to reset the PR:
   ERROR: Recipe mesa is trying to change PR from 'r1' to 'r0'. This will cause do_package_write_* failures since the incorrect data will be used and they will be unable to find 
the right workdir.

I'm using my own distro based on Poky, with these features enabled:
   DISTRO_FEATURES="sysvinit alsa ipv4 x11 opengl wifi ext2 largefile ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt 
                               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse                                       libc-getlogin libc-idn 
libc-inet-anl libc-libm libc-locales libc-locale-code                                   libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams 
libc-sunrpc                                     libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc 
  libc-posix-wchar-io  pulseaudio"

How can I get past this error?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


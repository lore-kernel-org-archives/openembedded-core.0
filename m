Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA2F660DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 07:53:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4E7rXvF011081; Wed, 14 May 2014 08:53:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id inv2Q4dDn4fw; Wed, 14 May 2014 08:53:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4E7rUEb011064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 14 May 2014 08:53:31 +0100
Message-ID: <1400054003.31891.216.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 14 May 2014 08:53:23 +0100
In-Reply-To: <2A7DAC5C-A9C7-4EE2-80C1-2E6D0270C8E8@dominion.thruhere.net>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
	<1399896893-486-3-git-send-email-ross.burton@intel.com>
	<5372F106.4060700@linux.intel.com>
	<2A7DAC5C-A9C7-4EE2-80C1-2E6D0270C8E8@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] freetype: upgrade to 2.5.3
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
X-List-Received-Date: Wed, 14 May 2014 07:53:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-05-14 at 09:27 +0200, Koen Kooi wrote:
> Op 14 mei 2014, om 06:28 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
> 
> > On 05/12/2014 05:14 AM, Ross Burton wrote:
> >> Also drop the redundant definition of S.
> >> 
> > 
> > There seems to be a problem with this update, both native and target fail as follows:
> > 
> >> | /bin/grep: /srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la: No such file or directory
> >> | sed: can't read /srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la: No such file or directory
> >> | x86_64-poky-linux-libtool: link: `/srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la' is not a valid libtool archive
> >> | make: *** [/srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/freetype-2.5.3/objs/libfreetype.la] Error 1
> >> | ERROR: oe_runmake failed
> >> | WARNING: /srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/temp/run.do_compile.17097:1 exit 1 from
> >> |   exit 1
> >> | ERROR: Function failed: do_compile (log file is located at /srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/temp/log.do_compile.17097)
> 
> I noticed the same this morning, but a build from scratch (no sstate
> or sysroots) seems to get past this. It's still running, but
> do_package_write_ipk has succeed for freetype.

Its an odd error, why would a build of freetype be looking into the
sysroot for a freetype.la file?

Its as if there is some kind of bad state in the sysroot referring to
the freetype.la file, I'm not sure what would do that though and why
freetype would pull it in...

Cheers,

Richard



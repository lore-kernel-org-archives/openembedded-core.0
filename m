Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qp0fu-00062F-V0
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 18:21:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p74GH8XU029150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Aug 2011 09:17:08 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 4 Aug 2011 09:17:08 -0700
Message-ID: <4E3AC603.7070504@windriver.com>
Date: Thu, 4 Aug 2011 11:17:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1255C164-37B1-4DE1-B95D-7BA7D0E20A39@kernel.crashing.org>
In-Reply-To: <1255C164-37B1-4DE1-B95D-7BA7D0E20A39@kernel.crashing.org>
Subject: Re: do_rootfs failure for core-image-sato on mpc8315e-rdb
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
X-List-Received-Date: Thu, 04 Aug 2011 16:21:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/4/11 10:58 AM, Kumar Gala wrote:
> | error: Failed dependencies:
> |       hicolor-icon-theme is needed by tasks-0.19-r0.ppc603e
> |       hicolor-icon-theme is needed by connman-gnome-0.5-r6.ppc603e

The actual failure is above...  the items below are indicating circular
dependencies within the resolution.  They're tagged as errors for reporting
purposes but are non-fatal....

> | error: LOOP:
> | error: removing busybox-1.18.4-r7.ppc603e "Requires(hint): busybox-udhcpc" from tsort relations.
> | error: removing busybox-udhcpc-1.18.4-r7.ppc603e "Requires(post): /bin/sh" from tsort relations.
> | error: LOOP:
> | error: removing augeas-0.8.1-r0.ppc603e "Requires: libaugeas0 >= 0.8.1" from tsort relations.
> | error: removing libaugeas0-0.8.1-r0.ppc603e "Requires(hint): augeas" from tsort relations.
> | error: LOOP:
> | error: removing busybox-1.18.4-r7.ppc603e "Requires(hint): busybox-syslog" from tsort relations.
> | error: removing busybox-syslog-1.18.4-r7.ppc603e "Requires(post): /bin/sh" from tsort relations.
> | error: LOOP:
> | error: removing libudev0-164-r4.ppc603e "Requires: udev = 164-r4" from tsort relations.
> | error: removing udev-164-r4.ppc603e "Requires: libudev0 >= 164" from tsort relations.
> | error: LOOP:
> | error: removing libdbus-1-3-1.4.12-r0.ppc603eERROR: Function 'do_rootfs' failed (see /local/home/galak/git/poky/build/tmp/work/mpc8315e_rdb-poky-linux/core-image-sato-1.0-r0/temp/log.do_rootfs.9312 for further information)
> |  "Requires(hint): dbus-1" from tsort relations.
> | error: removing dbus-1-1.4.12-r0.ppc603e "Requires: libdbus-1-3 >= 1.4.12" from tsort relations.
> | error: LOOP:
> | error: removing bash-dev-4.1-r2.ppc603e "Requires(hint): ncurses-dev" from tsort relations.
> | error: removing ncurses-dev-5.9-r1.1.ppc603e "Requires(hint): libc6-dev" from tsort relations.
> | error: removing libc6-dev-2.13-r11+svnr14157.ppc603e "Requires(hint): bash-dev" from tsort relations.
> | error: LOOP:
> | error: removing bash-dbg-4.1-r2.ppc603e "Requires(hint): eglibc-dbg" from tsort relations.
> | error: removing eglibc-dbg-2.13-r11+svnr14157.ppc603e "Requires(hint): bash-dbg" from tsort relations.
> | error: LOOP:
> | error: removing libecal-1.2-7-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc603e "Requires(hint): libedata-cal-1.2-7" from tsort relations.
> | error: removing libedata-cal-1.2-7-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc603e "Requires: libecal-1.2-7 >= 2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f" from tsort relations.
> | error: LOOP:
> | error: removing libebook-1.2-9-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc603e "Requires(hint): libedata-book-1.2-2" from tsort relations.
> | error: removing libedata-book-1.2-2-2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f-r1.ppc603e "Requires: libebook-1.2-9 >= 2.30+git1+7337d11aed576e7caaa12b4e881ad8d33668799f" from tsort relations.
> NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8 (/local/home/galak/git/poky/meta/recipes-sato/images/core-image-sato.bb, do_rootfs) failed with exit code '1'
> ERROR: '/local/home/galak/git/poky/meta/recipes-sato/images/core-image-sato.bb' failed
> 
> thoughts?
> 
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




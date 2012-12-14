Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TjXEj-0004CT-KX
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:31:41 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1690051bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 07:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:x-mailer:mime-version:content-transfer-encoding;
	bh=NuMMGBiku3yGLA4OolI+WXFyzDn5q1QBR57YqyUvMNo=;
	b=MCvNk15+CMD7I52UdWHXhpAYCl27/R4TBY3x+V3FR026C242NmuG3QKmzYqZM/3G3R
	Uvzb0hNt0GNrUHecVmU5IFLtsvO06RegJLlF6I0TXk8Pwp55SlwN5ib/xxmdp+68n8MM
	Ra5Ccyq301uR7viKyBW2mtUbKX/Sy8pDHs8dFf9uWDheZetnogtzQ9Xm3aNGaPC8Y8H8
	yFQV5MuyqKcWv6f0AfMM0IRjDJX4BIfIMMy1VkfRLWxXL9UnWW+XGubsp9pRrFD4IM4m
	JHewJmrPNFlSpNJTU9hylgYIBobpl2KmDKkcHNsHQuuVxFC5li5ZmQE144NEyB8yp+6A
	F1wQ==
Received: by 10.204.3.206 with SMTP id 14mr2904030bko.120.1355498225061;
	Fri, 14 Dec 2012 07:17:05 -0800 (PST)
Received: from [192.168.1.25] (93-139-163-243.adsl.net.t-com.hr.
	[93.139.163.243])
	by mx.google.com with ESMTPS id d16sm4845891bkw.2.2012.12.14.07.17.01
	(version=SSLv3 cipher=OTHER); Fri, 14 Dec 2012 07:17:04 -0800 (PST)
Message-ID: <1355498223.9104.2.camel@dromedary>
From: Marko =?UTF-8?Q?Kati=C4=87?= <dromede@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 14 Dec 2012 16:17:03 +0100
In-Reply-To: <CAP9ODKrEXv=h0f8vSqdb5H3T0c4N9UuhYu4GHJhi3Vufiz7rKg@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
	<CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
	<CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
	<CAP9ODKrQ1XQNwGz2D7HVcDeP1n7ndxCHTkiXD6tZotYLTMfKNA@mail.gmail.com>
	<1355428397.4799.7.camel@dromedary>
	<CAP9ODKrEXv=h0f8vSqdb5H3T0c4N9UuhYu4GHJhi3Vufiz7rKg@mail.gmail.com>
X-Mailer: Evolution 3.6.0-0ubuntu3 
Mime-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>, Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Fri, 14 Dec 2012 15:31:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2012-12-13 at 21:30 -0200, Otavio Salvador wrote:
> On Thu, Dec 13, 2012 at 5:53 PM, Marko Katić <dromede@gmail.com> wrote:
> > Oh dear, i completely forgot about this patch. It's been sitting in my
> > local repo for weeks!
> >
> > So here's my (hopefully) final solution:
> 
> The patch seems broken for my e-mail reader (dunno if you pasted it here).
> 
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

Sorry about that. This one should work.

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 4705b9b..9b1ebcf 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -74,7 +74,7 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
+FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm ${bindir}/udevadm"
 
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
@@ -97,4 +97,16 @@ do_install_append () {
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+	
+	if [ "${PV}" -gt "175" ]
+	then
+		install -d ${D}${base_sbindir}
+		ln -s ${bindir}/udevadm ${D}${base_sbindir}/udevadm
+
+	elif [ "${PV}" -lt "175" ]
+	then
+		install -d ${D}${bindir}
+		ln -s ${base_sbindir}/udevadm ${D}${bindir}/udevadm
+
+	fi
 }





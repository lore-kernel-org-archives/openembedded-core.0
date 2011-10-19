Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGass-00083m-Q9
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 20:28:58 +0200
Received: by ggnj1 with SMTP id j1so474501ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=iTY/1F/8nflwx4SGWnyNP/GKbOteBmC4mcn6mcEEoEM=;
	b=OurkVnWpABD7a/cegvyEEPr4W5jbJkW6t291pgfjMoLyZuXPtAC0dOxU+gn9RFh76Y
	uZ9mZr8qC+QyqBKcLtc9psTAT0Yzwx6YIwfwHhmptA0ulh2U3IazUXYnM+yuZ3yceQmV
	J9cica4WpD0l/lhptdrVnl4V/24J6NXhIDwsA=
Received: by 10.68.73.103 with SMTP id k7mr4612544pbv.30.1319048577151; Wed,
	19 Oct 2011 11:22:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Wed, 19 Oct 2011 11:22:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2011 11:22:27 -0700
Message-ID: <CAMKF1spgu+h2_LD3Qp6129QCxb5XHKSru0ggOHt3vCqG=8s7Jw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: xerver-xorg build problem
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
X-List-Received-Date: Wed, 19 Oct 2011 18:28:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am seeing this error today


| checking for GL... yes
| checking for DRIPROTO... yes
| checking for DRI... no
| configure: error: Package requirements (glproto >= 1.4.14 dri >=
7.8.0) were not met:
|
| No package 'dri' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables DRI_CFLAGS
| and DRI_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed
| + exit 1
| ERROR: Function 'do_configure' failed (see
/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/work/ppc603e-angstrom-linux/xserver-xorg-2_1.11.1-r1/temp/log.do_configure.21621
for further information)
NOTE: package xserver-xorg-2_1.11.1-r1: task do_configure: Failed
ERROR: Task 1518
(/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb,
do_configure) failed with exit code '1'
Waiting for 2 active tasks to finish:


any hints ?

-Khem



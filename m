Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id EF47771A70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:44:58 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170207134458018_0685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 05:44:58 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=31166 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cb64i-0007FF-F8 for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2017 08:44:52 -0500
Date: Tue, 7 Feb 2017 08:44:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702070755300.12494@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: does a recipe's "recipe-sysroot" automatically get build deps crossscripts?
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
X-List-Received-Date: Tue, 07 Feb 2017 13:45:00 -0000
Content-Type: text/plain; charset=US-ASCII


  ok, last question on this topic, should be an easy one. :-)

i've added the "mod-wsgi" recipe to my build (from meta-openstack
layer), and the mod-wsgi recipe file contains the following:

  DEPENDS += "apache2-native apache2 python"
  RDEPENDS_${PN} = "python"

  EXTRA_OECONF = "\
        --with-apxs=${STAGING_BINDIR_CROSS}/apxs \

it builds fine since, in that recipe's WORKDIR, there is:

  $ ls recipe-sysroot/usr/bin/crossscripts/
  apr-1-config  libtoolize       ncursesw5-config  powerpc-poky-linux-libtool
  apu-1-config  ncurses5-config  ncursesw6-config
  apxs          ncurses6-config  pcre-config

which means it can clearly find the crossscript "apxs" referred to by:

  --with-apxs=${STAGING_BINDIR_CROSS}/apxs

as for everything else in that recipe's $(STAGING_BINDIR_CROSS}
directory, can i assume that any recipe will get installed in its
STAGING_BINDIR_CROSS directory the collection of everything under
usr/bin/crossscripts in all the build-time dependencies of that
recipe?

  it *seems* like that's a fairly simple assumption, just want to know
if it's correct.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



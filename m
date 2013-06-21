Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED82605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 09:53:21 +0000 (UTC)
Received: from sangmingze-mail.local (91-65-247-193-dynip.superkabel.de
	[91.65.247.193])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 1A4581DC2E;
	Fri, 21 Jun 2013 09:53:09 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1Upy1u-0000uI-NN; Fri, 21 Jun 2013 11:53:18 +0200
Date: Fri, 21 Jun 2013 11:53:18 +0200
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130621095318.GG15853@xiaoyu.lan>
References: <20130621063103.GE15853@xiaoyu.lan>
	<1371801843.20823.281.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1371801843.20823.281.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: AUTOINC ending in filenames in tmp/deploy/images
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
X-List-Received-Date: Fri, 21 Jun 2013 09:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 21, 2013 at 09:04:03AM +0100, Richard Purdie wrote:
> 
> Use PKGV and PKGR instead of PV and PR and this should work better.

This didn't change anything. I have reduced my u-boot bbappend to the
one below and I have updated the poky u-boot recipe to use PKGV and
PKGR in the filename. Any other idea?

kind regards
  holger





bbappend:
SRCREV = "40d74c99ac9d741857d1298617b186b1d4e148de"

PRINC = "11"

LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"

UBOOT_MACHINE_sysmobts-v1 = "davinci_sysmobts_v2_config"
COMPATIBLE_MACHINE = "(sysmobts-v1)"





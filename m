Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id CA0C8605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 06:31:06 +0000 (UTC)
Received: from sangmingze-mail.local (91-65-247-193-dynip.superkabel.de
	[91.65.247.193])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 920271DB3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 06:30:55 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>) id 1UpusB-0005TH-TB
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Jun 2013 08:31:03 +0200
Date: Fri, 21 Jun 2013 08:31:03 +0200
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130621063103.GE15853@xiaoyu.lan>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: AUTOINC ending in filenames in tmp/deploy/images
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
X-List-Received-Date: Fri, 21 Jun 2013 06:31:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am building an U-Boot from git and the file in tmp/deploy/images contains
AUTOINC instead of the replaced git version.

$ ls images/u-boot-sysmobts-v2-v2011.12+gitAUTOINC+40d74c99ac-r17.bin

This is with Poky from yesterday, is this a known issue of the AUTOINC? The
filename is set with 'u-boot-${MACHINE}-${PV}-${PR}' and the PV is like
this 'v2011.12+git${SRCPV}'.


kind regards
	holger





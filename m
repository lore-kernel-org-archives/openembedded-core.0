Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id AD31375CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:02:06 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160817140139403_0685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:01:39 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=45346 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ba1RN-0000yI-Tr for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2016 10:03:34 -0400
Date: Wed, 17 Aug 2016 10:01:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what means IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"?
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
X-List-Received-Date: Wed, 17 Aug 2016 14:02:09 -0000
Content-Type: text/plain; charset=US-ASCII


  as in, what's with the "+" in that "+ 3000000" value? i've never
seen that before, and i took a quick look under classes/ to try to
figure out what's happening, but i'm still confused.

  this is all in aid of the aforementioned "+=" cleanup, and i can see
some inconsistency as to whether there should be a leading space or
not in the assigned value:

classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smartpm", " + 102400", "" ,d)}"
recipes-core/images/core-image-minimal.bb:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
recipes-extended/images/core-image-kernel-dev.bb:IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"

and the YP reference manual says nothing about a possible "+":

http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-IMAGE_ROOTFS_EXTRA_SPACE

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBAA71AC0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:06:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161101100626242_0685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 03:06:26 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=15375 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c1Vwv-00012T-Ug for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2016 06:05:46 -0400
Date: Tue, 1 Nov 2016 06:04:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611010545380.25706@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: some pedantic questions about layer.conf "best practices"
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
X-List-Received-Date: Tue, 01 Nov 2016 10:06:28 -0000
Content-Type: text/plain; charset=US-ASCII


  updating a tutorial about writing a proper layer.conf file, so some
nitpicky questions about recommended style.

  first, when appending to BBFILES, is it recommended to explicitly
use separate wildcard patterns of "*.bb" and "*.bbappend", or just get
lazy and use "*.bb*"? i realize that, in the end, it makes no
effective difference; i just happen to prefer the more explicit
pattern; just wondering if anyone has any preferences on this either
way. (i did say "nitpicky.")

  next, what is best practice for naming a layer, since standards seem
to differ. if i create a layer named "meta-rday", i've seen standards
where the layer is "named" with one of:

  BBFILE_COLLECTIONS += "rday"
  BBFILE_COLLECTIONS += "meta-rday"
  BBFILE_COLLECTIONS += "rday-layer"

amusingly, some freescale layers bounce around:

  BBFILE_COLLECTIONS += "freescale-layer"
  BBFILE_COLLECTIONS += "fsl-arm"
  BBFILE_COLLECTIONS += "fsl-ppc"

even the meta-openembedded (sub)layers don't have a consistent style;
some examples, which show all three styles:

  meta-filesystems/conf/layer.conf:BBFILE_COLLECTIONS += "filesystems-layer"
  meta-initramfs/conf/layer.conf:BBFILE_COLLECTIONS += "meta-initramfs"
  meta-webserver/conf/layer.conf:BBFILE_COLLECTIONS += "webserver"

is there an encouraged style?

  finally, is it necessary to have LAYERDEPENDS include "core"? isn't
that automatic? how could you possibly have a viable build system
without the oe-core layer (unless this gives you the freedom to
replace it with a custom one, which i don't see the value of).

  i think that's it for now ... thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



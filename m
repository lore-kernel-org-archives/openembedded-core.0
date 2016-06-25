Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id D617460088
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 10:07:37 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160625100736956_0685
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 03:07:36 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=46638 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bGkWc-0004f6-VW for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2016 06:09:19 -0400
Date: Sat, 25 Jun 2016 06:06:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1606250600140.10173@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: want to clarify relationship between UBOOT_MACHINE and UBOOT_CONFIG
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
X-List-Received-Date: Sat, 25 Jun 2016 10:07:42 -0000
Content-Type: text/plain; charset=US-ASCII


  this *looks* straightforward, i just want to make sure i'm
understanding it properly before diving into the code. for machines
that require u-boot, there are two ways to identify the u-boot config
file to use for the configuration.

  the simple way is to just set UBOOT_MACHINE to refer to one of the
numerous config files that come with u-boot, and that's it, you're
done.

  the more flexible way is to use UBOOT_CONFIG, which gives you the
ability to identify a *number* of possible u-boot config files, based
on the image fstypes you want to generate. in the end, all the
UBOOT_CONFIG possibilities still have to map directly to u-boot config
files.

  that's it, right? is there anything more subtle happening under the
hood than that? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 84DCC6012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:07:43 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160311120742554_0684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:07:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [127.0.0.1] (port=37732 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1aeLsJ-0003ap-D3
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2016 07:08:59 -0500
Received: from 216.191.234.70 ([216.191.234.70]) by crashcourse.ca (Horde
	Framework) with HTTP; Fri, 11 Mar 2016 07:08:59 -0500
Message-ID: <20160311070859.163019mr4vs6d940@crashcourse.ca>
Date: Fri, 11 Mar 2016 07:08:59 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what is the precise search path for resolving "include" or "require" .inc files?
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
X-List-Received-Date: Fri, 11 Mar 2016 12:07:45 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

   not sure why i never noticed this before, but what is the search order
or precedence or priority for resolving recipe file directives "include"
or "require"? i was just perusing the bitbake user manual, and noticed
the explanation that those directives use BBPATH to track down the first
include file by a given name.

   but AIUI, BBPATH is supposed to represent an ordered set of *layers*
(i just examined BBPATH for a current [wind river linux] build, and that
is exactly what it seems to contain). so when a recipe file like
busybox.whatever.bb contains the line:

   require busybox.inc

i always just assumed the search would look in the current busybox
directory, but that directory is not technically a layer directory --
it's not a directory specified on the alleged BBPATH search path.

   i never thought about this until i noticed some .bbappend files
specifically using directives like:

   require recipes-bsp/u-boot/u-boot.inc

where that file reference *does* refer to a file relative to some
actual layer directory somewhere.

   what am i missing here?

rday




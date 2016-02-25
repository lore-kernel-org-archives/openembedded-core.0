Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEC777042
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 11:07:14 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160225110713958_0684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 11:07:13 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [127.0.0.1] (port=46964 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1aYtmU-0005fs-Nh
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Feb 2016 06:08:26 -0500
Received: from 216.191.234.70 ([216.191.234.70]) by
	astoria.ccjclearline.com (Horde Framework) with HTTP; Thu, 25 Feb 2016
	06:08:26 -0500
Message-ID: <20160225060826.14454nlzq30i530g@astoria.ccjclearline.com>
Date: Thu, 25 Feb 2016 06:08:26 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
References: <20160224165105.15082xiuxuncffsw@astoria.ccjclearline.com>
	<CABcZANntxYc_G9ctctpgUMeB1SDZtA6wOWgZbOCzd4UH4tgG_A@mail.gmail.com>
	<20160225054355.31601h2jb9pdojr4@astoria.ccjclearline.com>
In-Reply-To: <20160225054355.31601h2jb9pdojr4@astoria.ccjclearline.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: trying to summarize the flexibility in bbappend'ing to kernel recipes
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
X-List-Received-Date: Thu, 25 Feb 2016 11:07:18 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting "Robert P. J. Day" <rpjday@crashcourse.ca>:

>   (i'm going to reply to this post just to keep everything in the  
> same thread.)

... big snip ...

   in addition to all of that possible bbappend customization in my earlier
note, i just noticed i forgot to mention this possibility of conditional
prepending to FILESEXTRAPATHS, which is (was?) actually used for the
poky override for the psplash recipe:

   FILESEXTRAPATHS_prepend_poky := "${THISDIR}/files:"

of course, in this case, the same effect would come from having a
"files/poky/" subdirectory. just trying to be complete.

   ok, back to work ...

rday




Return-Path: <mylene.josserand@free-electrons.com>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jun 2017 13:29:27 UTC
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id E2CFE780BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:29:27 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id A81772092F; Fri, 23 Jun 2017 15:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from [192.168.0.12] (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr
	[90.63.216.87])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 7780B2091F;
	Fri, 23 Jun 2017 15:23:44 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Mylene Josserand <mylene.josserand@free-electrons.com>
Message-ID: <a63a60dd-1000-0bf3-8fc1-5517b88e222d@free-electrons.com>
Date: Fri, 23 Jun 2017 15:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	=?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: ARC arch support: uClibc status ?
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
X-List-Received-Date: Fri, 23 Jun 2017 13:29:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,


We are currently adding to Yocto project the Synopsys ARC CPU
architecture, which is only available with uClibc library.

We currently have a layer which adds the support of this architecture 
and uClibc support as it is, now, removed from OE-core.

Many configurations/fixes are needed in OpenEmbedded-core's recipes to 
build successfully with this C library (library's dependencies, 
autotools configuration, etc).

We wanted to send patches to fix them but it seems that all uClibc's 
references are now removed from OE-core, even in recipes:

https://patchwork.openembedded.org/patch/140943/
https://patches.openembedded.org/patch/140906/

What is the status of it? Remove entirely uClibc from OE-core?
Could you give us advice on how to handle uClibc?  Should we create a 
"meta-uclibc" layer which adds support of it + bbappend for all the 
OE-core's recipes that currently fail because of uClibc's misconfiguration?

I guess that there is no plan to add uClibc's configuration in OE-core's 
recipes (even without uClibc itself), right?


Thank you in advance,

Best regards,

-- 
Mylène Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com


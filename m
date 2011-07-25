Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlOl0-000257-SQ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 19:15:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PHBegV005320
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 10:11:40 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 25 Jul 2011 10:11:40 -0700
Message-ID: <4E2DA3CB.7070902@windriver.com>
Date: Mon, 25 Jul 2011 12:11:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
	<bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602099.30326.217.camel@phil-desktop>
In-Reply-To: <1311602099.30326.217.camel@phil-desktop>
Subject: Re: [PATCH 1/5] multilib_header.bbclass: Add oe_multilib_header wrapper
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
X-List-Received-Date: Mon, 25 Jul 2011 17:15:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/25/11 8:54 AM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
>> +/*  Copyright (c) 2005-2011 Wind River Systems, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU Lesser General Public License version 2.1 as
>> + * published by the Free Software Foundation.

I believe we're flexibly with the license statement in the file.. (Just
verifying it to make sure I am allowed to change it.)

I personally don't believe it's a big deal, but I understand the concern.  Is
there a different wording/license statement that would make more sense?  My
concern is that if we make the license dynamic it's a lot of pain for no real
technical reason.

I'd like to see if we (WR) can just put a statement on it that it can be used
for any purpose -- whatever the legalize is for that -- and if that would
satisfy your concerns.  (BTW: Our goal of course is NOT to change the license of
the produced binary in any way...)

> This is going to cause LGPL 2.1 content to appear in the output
> packages.  For things like binutils this is probably not a big deal,
> since they are GPL already, but for ncurses (previously MIT-licensed)
> this is a potentially significant change.  In any case I think there
> needs to be some way of making sure that the LICENSE is updated
> appropriately when this file is included.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




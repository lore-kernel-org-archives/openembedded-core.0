Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 187396C8C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 20:52:02 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id EA2797FA; Tue,  7 Jan 2014 21:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from [192.168.1.65] (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 915AE7BD;
	Tue,  7 Jan 2014 21:52:07 +0100 (CET)
Message-ID: <52CC68F0.1030605@free-electrons.com>
Date: Tue, 07 Jan 2014 21:52:00 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Organization: Free Electrons
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
	<52CC65E5.6010003@windriver.com>
In-Reply-To: <52CC65E5.6010003@windriver.com>
X-Enigmail-Version: 1.5.2
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 20:52:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2014 21:39, Bruce Ashfield wrote:

>>
>> As shown in my commit log, using yes '' | make oldconfig is still
>> getting it wrong.
> 
> But that was also my point. Since the target suggested in this
> patch hasn't always existed (and hence has a kernel version binding),
> why not use olddefconfig with this patch, and leave the functionality
> closer to its existing behaviour ? We'd still have a kernel capability
> binding, but we'd not have the =y converted to =m, and the default of
> 'y' for new functionality would be maintained.
> 

Hum, I'm not sure I follow you. oldnoconfig and olddefconfig are exactly
the same. oldnoconfig has been renamed olddefconfig in 3.7 and
oldnoconfig is an alias to olddefconfig since then. I'm using
oldnoconfig only to be able to use that on a wider range of kernel versions.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com


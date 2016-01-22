Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21F4460017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 05:29:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0M5Thj1012235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 21:29:43 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 21:29:42 -0800
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1453255296-6863-1-git-send-email-rongqing.li@windriver.com>
	<56A162A5.1000802@windriver.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <56A1BE45.3040900@windriver.com>
Date: Fri, 22 Jan 2016 13:29:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56A162A5.1000802@windriver.com>
Subject: Re: [PATCH] watchdog: enable systemd support
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
X-List-Received-Date: Fri, 22 Jan 2016 05:29:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月22日 06:58, Randy MacLeod wrote:
> On 2016-01-19 09:01 PM, rongqing.li@windriver.com wrote:
>> 1. inherit systemd, and add two unit files which are from Fedora 23
>
> Fine.
>> 2. auto load soft dog kernel module
>
> I haven't used a hardware watchdog for a while. Does softdog
> abstract that away so that it's hidden by the BSP? If not,
> can a user ditch the softdog for a hardware watchdog? Does that
> over-ride process need to be documented?
>
>

Usually, watchdog timers are implemented as add-on cards, or as on-chip
peripherals within microcontrollers. But if there is no hardware watchdog,
the Linux kernel can provide a software watchdog implemented using kernel
timers.

https://en.wikibooks.org/wiki/The_Linux_Kernel/Softdog_Driver


if the machine has the hardware watchdog, and drivers are compiled in,
the /dev/watchdog will be generated; softdog is /dev/watchdog1 or
/dev/watchdog2, and the watchdog daemon will use the hardware watchdog


if drivers are compiled as module, udev will auto load it, but udev
will be run after systemd-modules-load.service, and softdog will be
used


-- 
Best Reagrds,
Roy | RongQing Li


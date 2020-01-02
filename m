Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id D5A677FC02
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 19:47:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47pdqc5Nvbz1rTp9;
	Thu,  2 Jan 2020 20:47:56 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47pdqc54hxz1s77S;
	Thu,  2 Jan 2020 20:47:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 2eVTcnMnuFXA; Thu,  2 Jan 2020 20:47:55 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Thu,  2 Jan 2020 20:47:55 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id D90A245404DC;
	Thu,  2 Jan 2020 20:47:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id di3hBIvF229R; Thu,  2 Jan 2020 20:47:53 +0100 (CET)
Received: from [192.168.178.89] (stefano-MacBookPro.fritz.box [192.168.178.89])
	by babic.homelinux.org (Postfix) with ESMTPS id 299A64540379;
	Thu,  2 Jan 2020 20:47:53 +0100 (CET)
To: Adrian Bunk <bunk@stusta.de>, Stefano Babic <sbabic@denx.de>
References: <20200102175206.657-1-sbabic@denx.de>
	<20200102183034.GC11760@localhost>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <c5956b59-d2cc-6516-5178-f02f98fcadff@denx.de>
Date: Thu, 2 Jan 2020 20:47:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102183034.GC11760@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 19:47:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Adrian,

On 02/01/20 19:30, Adrian Bunk wrote:
> On Thu, Jan 02, 2020 at 06:52:06PM +0100, Stefano Babic wrote:
>> libubootenv is a replacement for u-boot-fw-utils. It is
>> hardware-independent and provides fw_printenv and fw_setenv tools that
>> are full compatible with the ones provided by U-Boot. A library is
>> provided to access the environment from an own application.
>> License is LGPL-2.1 and this allow to link the library to proprietary
>> code. The user of the tools should install the configuration file
>> "fw_env.config", as he is already used to with u-boot-fw-utils. The
>> configuration file is compatible with u-boot-fw-utils.
>> ...
> 
> Why do we need two implementations of the same in OE-core?
> meta-oe sounds more appropriate to me.

Well, it looks to me more consistent that tools for U-Boot's environment
are grouped together. It seems to me more easy and transparent. I agree
with you if u-boot-fw-utils was in meta-oe/recipes-bsp.

Best regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================


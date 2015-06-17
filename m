Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5019875843
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:37:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3mBYWH3JBJz3hj77;
	Wed, 17 Jun 2015 19:37:31 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	by mail.mnet-online.de (Postfix) with ESMTP id 3mBYWH1mdgzvh20;
	Wed, 17 Jun 2015 19:37:30 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 9CD51454091E;
	Wed, 17 Jun 2015 19:37:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id k3-Ce3H8nYDG; Wed, 17 Jun 2015 19:37:28 +0200 (CEST)
Received: from [192.168.178.20] (papero.fritz.box [192.168.178.20])
	by babic.homelinux.org (Postfix) with ESMTP id 6F81945408DA;
	Wed, 17 Jun 2015 19:37:27 +0200 (CEST)
Message-ID: <5581B057.9050602@denx.de>
Date: Wed, 17 Jun 2015 19:37:27 +0200
From: Stefano Babic <sbabic@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Stefano Babic <sbabic@denx.de>
References: <1434546940-21914-1-git-send-email-sbabic@denx.de>
	<4769027.txEDJ0YG4l@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <4769027.txEDJ0YG4l@peggleto-mobl.ger.corp.intel.com>
Cc: marex@denx.de, koen@dominion.thruhere.net,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ICU: libicudata corrupt on big endian systems
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
X-List-Received-Date: Wed, 17 Jun 2015 17:37:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Paul,

On 17/06/2015 19:28, Paul Eggleton wrote:

>> @@ -0,0 +1,35 @@
>> +From 1878e1bfcd116dd3ed9519dd891bf18f860072b7 Mon Sep 17 00:00:00 2001
>> +From: Stefano Babic <sbabic@denx.de>
>> +Date: Thu, 4 Jun 2015 17:53:30 +0200
>> +Subject: [PATCH] target
> 
> 
> This needs a proper patch comment explaining what it's supposed to do and 
> Upstream-Status (probably "Inappropriate" here I guess).

Sure, I'll do

>> +SRC_URI_append_class-native = "${@base_conditional('TUNE_ARCH', 'powerpc',
>> 'file://native_big_endian.patch', '', d)}" 
> 
> It doesn't change the behaviour here, but it's good practice to ensure that 
> there is at least a space between any previous item and the item you are 
> appending - so I would recommend including a leading space either before 
> file:// or before the ${@ (or you could follow the SRC_URI_append_class-target 
> example on the next line).

Thanks, I'll fix it in V2.

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================


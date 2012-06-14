Received: from smtpi4.ngi.it ([88.149.128.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sbabic@denx.de>) id 1Sf5AT-0006zV-8H
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 10:12:37 +0200
Received: from paperina.lan (unknown [88.149.182.160])
	by smtpi4.ngi.it (Postfix) with ESMTP id 0D2966063D7;
	Thu, 14 Jun 2012 10:00:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by paperina.lan (Postfix) with ESMTP id 8EFFB140A0F1;
	Thu, 14 Jun 2012 10:00:49 +0200 (CEST)
Received: from paperina.lan ([127.0.0.1])
	by localhost (paperina.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8ZJXeiAlLH2; Thu, 14 Jun 2012 10:00:43 +0200 (CEST)
Received: from [192.168.2.247] (papero.lan [192.168.2.247])
	by paperina.lan (Postfix) with ESMTP id 3BB1A140A0D4;
	Thu, 14 Jun 2012 10:00:43 +0200 (CEST)
Message-ID: <4FD99A2B.2060006@denx.de>
Date: Thu, 14 Jun 2012 10:00:43 +0200
From: Stefano Babic <sbabic@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1339593545-14046-1-git-send-email-sbabic@denx.de>
	<CAJTo0LYQQXZKoK8N9g0msxQAcg_c2sc0n4-hAgKCJJYzj4vuag@mail.gmail.com>
	<4FD8A219.9000100@denx.de>
	<CAJTo0LbKGqM=pCovegAmZgTz-Q2cKZmZU7qUbYm21KRquydzog@mail.gmail.com>
In-Reply-To: <CAJTo0LbKGqM=pCovegAmZgTz-Q2cKZmZU7qUbYm21KRquydzog@mail.gmail.com>
X-Enigmail-Version: 1.5pre
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Added recipe for libconfig
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
X-List-Received-Date: Thu, 14 Jun 2012 08:12:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2012 16:24, Burton, Ross wrote:
> On 13 June 2012 15:22, Stefano Babic <sbabic@denx.de> wrote:
>> no, there is not yet. I add the libconfig to my image and my apllication
>> make use of it. However, I see it as a general purpose library, that one
>> can decide to add or not to the own rootfs.
>>
>> Is there some constraints in OE requiring that a lib can be merged only
>> if a provided package make use of it ?
> 
> Surely meta-oe would be a better place for this then?

Understood. Or maybe under meta-yocto/recipes-core ? I will prefer this
one because meta-oe is not part of the yocto distribution. Am I right to
post patches here or am I completely off-topic ?

Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================



Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com [193.143.230.17])
 by mx.groups.io with SMTP id smtpd.web12.8119.1591353413752482595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 03:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: vaisala.com, ip: 193.143.230.17, mailfrom: nandor.han@vaisala.com)
IronPort-SDR: SHxtLGu4FgmOAkDtHJSZNiMPxHpXmT99z1PDmJXr/9E/h60LTKvinx6qGukcEYLzhrGPm5gfVw
 DH3XhZ6C40qilwylHCPiKBPvZisTBWjt44VMpIqnv33DTdYR3iu/JWpt7saN1QOerYPQtS40Fa
 p5T+xTd5UmqGy7equ/gs9DWVtL7QCqTCdCGJ0RMDXcN1m5ttkcn6YSYkQbpfE848nAfTTAKi7i
 K7WUNULdDHjJ1x+56cy0IvKhGsrnGYtI0iBP11WErRrsEfRSJqkT1bz+icmk/hu52h2xVmZK4J
 fEY=
X-IronPort-AV: E=Sophos;i="5.73,476,1583186400"; 
   d="scan'208";a="281387230"
Subject: Re: [OE-core][PATCH v7 0/3] Add a new bbclass that abstracts the generation of FIT blobs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1590559408.git.nandor.han@vaisala.com>
 <fbca27d924e7f0f89da34872fbcda680b5dc0042.camel@linuxfoundation.org>
From: "Nandor Han" <nandor.han@vaisala.com>
Message-ID: <fe432be6-8905-de36-2050-c41053f50114@vaisala.com>
Date: Fri, 5 Jun 2020 13:36:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fbca27d924e7f0f89da34872fbcda680b5dc0042.camel@linuxfoundation.org>
Return-Path: nandor.han@vaisala.com
X-OriginalArrivalTime: 05 Jun 2020 10:36:47.0835 (UTC) FILETIME=[371AF2B0:01D63B25]
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Richard and thanks for answering.

<snip>


> 
> This did show up two issues in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1022
> 
> (step2d)
> 
> Basically there is no maintainer listed for python3-fdt which is an
> easy fix and secondly the tests need python3-fdt-native which isn't
> present in the test environment.
> 

Not sure who can be maintainer. I could add myself of course, but I just 
don't want to delay something if I have to react fast and I cannot do it 
at that point. If this is not an issue, I can add myself as maintainer, 
if that's ok with you.


I don't know exactly how to solve the missing `python3-fdt-native` 
issue. I've tried to add it as dependency for my test recipe and locally 
seemed to work fine. I've tried to find documentation and also ask on 
IRC about this issue, but wasn't able to find a clear answer. I'll 
really appreciate some guidance here.

Nandor




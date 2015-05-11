Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFD26013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:51:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4BDpNbr010009
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 May 2015 06:51:24 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 06:51:23 -0700
Message-ID: <5550B3DB.3030109@windriver.com>
Date: Mon, 11 May 2015 09:51:23 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1431350446.30971.56.camel@linuxfoundation.org>
In-Reply-To: <1431350446.30971.56.camel@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and gcc 5.x
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
X-List-Received-Date: Mon, 11 May 2015 13:51:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-11 09:20 AM, Richard Purdie wrote:
> Hi Bruce,
>
> One of the things we're looking at in 1.9 is gcc 5.x support by default.
> One of the areas this has significant impact is on the kernels,
> linux-yocto in particular. I'm starting to see a potential problem here
> since the kernels don't appear to work well with gcc 5.x:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE
>
> (this is a test build I ran just to see how bad things were).
>
> Are we going to be in a position to get 5.x support backported into 3.14
> (and maybe 3.10)? Or was we going to have to wait for later versions?

I should be able to bring gcc5 support back to the previous LTSI
kernel (3.14), but need to poke at the breakage myself to know
for sure.

What's the incantation to configure gcc5 into a test build ?

Bruce

>
> Cheers,
>
> Richard
>
>
>



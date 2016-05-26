Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F41226B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:17:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4QEHqWt019615
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 May 2016 07:17:52 -0700 (PDT)
Received: from server.local (128.224.20.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 May 2016 07:17:52 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
	<1464158362.9570.87.camel@linuxfoundation.org>
	<9a16a18f-9178-231d-6c78-ccdc4cdf51a2@windriver.com>
	<7091d7d0-b03c-2dfd-eee9-d160f3a944a2@windriver.com>
	<1464185744.9570.101.camel@linuxfoundation.org>
	<1464272152.19134.33.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <2a11a6a0-f782-8065-9669-8136a5788202@windriver.com>
Date: Thu, 26 May 2016 10:17:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464272152.19134.33.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Thu, 26 May 2016 14:17:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-26 10:15 AM, Richard Purdie wrote:
> On Wed, 2016-05-25 at 15:15 +0100, Richard Purdie wrote:
>> Just realised the failure is in mpc8315e_rdb so its meta-yocto-bsp
>> bumps we're missing?
>
> To update on this, python-pyqt broke once qt4 was building. This was
> due to webkit in qt4 being silently disabled. I've merged a patch to
> meta-qt4 to handle that and the python-pyqt issue is then fixed.
>
> We were also still having linux-yocto-4.1 issues on meta-yocto-bsp,
> which looked like the same problem as we were having with 4.4, a lack
> of a SRCREV bump.
>
> Bruce: I took the liberty of testing:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=c87f
> 66e1b8f4eced3da1b7aaeceb2341674fa61c
>
> which bumps the SRCREVs for 4.1 in meta-yocto-bsp. This is looking
> greener on the autobuilder, I'm hoping if this works we could finally
> merge gcc6. Can I merge that SRCREV bump?

Yep. That's what my update script shows as the next bump as well.
Fire away.

I should have just bumped this at the same time .. sorry about overlooking
it.

Bruce

>
> Sadly all this debugging/testing is holding up the rest of the patch
> queue :(.
>
> Cheers,
>
> Richard
>
>



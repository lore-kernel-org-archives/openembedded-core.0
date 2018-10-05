Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8854079A55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 20:50:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w95KnM5p008187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Oct 2018 13:49:33 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 5 Oct 2018 13:49:08 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>, <Alex.Gonzalez@digi.com>
References: <20181005120055.GC7228@agonzal-linux>
From: Randy MacLeod <randy.macleod@windriver.com>
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <982a032d-362e-cc1a-c84d-2496a0a21171@windriver.com>
Date: Fri, 5 Oct 2018 16:49:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181005120055.GC7228@agonzal-linux>
X-Originating-IP: [172.25.44.4]
Cc: poky@yoctoproject.org
Subject: Re: [poky] [rocko] Backport request for meta/recipes-kernel/cryptodev
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
X-List-Received-Date: Fri, 05 Oct 2018 20:50:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Alex,

Armin maintains the rocko branch so best to CC him.

Also, I've moved this to the oe-core list where
we handle oe-core commits. Poky is composed of
several layers to make things easier to build
but we use the other email lists for development.

Armin,

This is a simple patch and I was able
to cherry-pick the corresponding oe-core commit:

   270a1e9bcf26a43f5cbdc5b901c4c6f79495311d

back to rocko-next, and then run:
   bitbake -c patch linux-yocto.
The change is a no-op for the standard rocko kernel so that's
all I did to test (actually, I'm starting a linux-yocto build
but I'd be shocked if it failed).

Will you add this to your rocko-next queue or
would you like Alex to re-submit following the guidelines:
    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


../Randy


On 10/05/2018 08:00 AM, Gonzalez, Alex wrote:
> Hi,
> 
> Could you please backport commit c568e89c3d316e5c10369c6ff48e871828bad783 to
> rocko?
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=c568e89c3d316e5c10369c6ff48e871828bad783
> 
> This will allow to build cryptodev with kernels >= 4.17.
> 
> Thanks,
> Alex
> 


-- 
# Randy MacLeod
# Wind River Linux


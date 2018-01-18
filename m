Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 623B078761
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 02:59:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0I2xU3L002110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jan 2018 18:59:30 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 18:59:31 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180116132559.27794-1-ross.burton@intel.com>
	<CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
	<59b242ee-84fa-72b7-6335-5238c6d8b3cd@windriver.com>
	<CAJTo0LaJqU9Q4AZ_GELbaZtHWBsZ6+M-nhNM-BVhLYd6M3oBcw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1da2353a-a0c3-2192-648c-8372acf4db8b@windriver.com>
Date: Wed, 17 Jan 2018 21:59:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaJqU9Q4AZ_GELbaZtHWBsZ6+M-nhNM-BVhLYd6M3oBcw@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] cmake: use Ninja backend instead of Make
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
X-List-Received-Date: Thu, 18 Jan 2018 02:59:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-01-17 04:43 PM, Burton, Ross wrote:
> There appears to be a small number of upstreams that break with ninja, 
> so I'll rework this patch so that the backend is an option but default 
> to Ninja.

The only failure that involved a cmake based package was piglit
for my qemux86-64 world build.

It didn't install:
   make: Entering directory 
'/.../tmp-glibc/work/core2-64-wrs-linux/piglit/1.0+gitrAUTOINC+c8f4fd9eeb-r0/build'
make: *** No rule to make target 'install/strip'.  Stop.

so that might not be related to this change. I haven't manually done
a world build on master recently.

As expected using ninja for the back-end of cmake just makes the
builds faster.

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company


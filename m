Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D05560043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 01:22:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7J1MoSr008739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Aug 2015 18:22:50 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 18 Aug 2015 18:22:49 -0700
Message-ID: <55D3DA68.5030700@windriver.com>
Date: Wed, 19 Aug 2015 09:22:48 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1439453357-27173-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LaE6h3_uXobYVy0BtydyNWQQ_m2d5j6H-vGnnN0+meyNg@mail.gmail.com>
In-Reply-To: <CAJTo0LaE6h3_uXobYVy0BtydyNWQQ_m2d5j6H-vGnnN0+meyNg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: package nscd related files
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
X-List-Received-Date: Wed, 19 Aug 2015 01:22:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月18日 19:48, Burton, Ross wrote:
>
> On 13 August 2015 at 09:09, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     install nscd related configuration file, startup files, and package
>     them,
>     make nscd easy to startup
>
>
> systemd.bbclass is inherited but SYSTEMD_PACKAGES isn't set, so the
> systemd postinst/prerm fragments won't get added.
>
> Ross

Thanks, I will fix it

-- 
Best Reagrds,
Roy | RongQing Li


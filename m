Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF08757E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 00:51:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t530pami016804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jun 2015 17:51:36 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 17:51:36 -0700
Message-ID: <556E4F97.7000004@windriver.com>
Date: Wed, 3 Jun 2015 08:51:35 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1431476040-29583-1-git-send-email-rongqing.li@windriver.com>
	<556BB753.10808@windriver.com>
	<CAJTo0La2TaPM2TiAucZXJ4jmZbxY82m4OpcE94E+8SGXVunM0Q@mail.gmail.com>
In-Reply-To: <CAJTo0La2TaPM2TiAucZXJ4jmZbxY82m4OpcE94E+8SGXVunM0Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V3] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Wed, 03 Jun 2015 00:51:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月02日 18:38, Burton, Ross wrote:
>
> On 1 June 2015 at 02:37, Rongqing Li <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>         +EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64"'
>
>
> This seems fragile as you're relying on future maintainers checking that
> upstream don't change the value of AM_CFLAGS.  Would passing
> -U_FORTIFY_SOURCE via CPPFLAGS solve the problem in a neater way?
>
> Ross


what should I do?  make a patch which remove _FORTIFY_SOURCE from 
AM_CFLAGS in
Makefile?


-Roy



-- 
Best Reagrds,
Roy | RongQing Li


Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3476012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2NEFjOA006639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Mar 2016 07:15:45 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 23 Mar 2016 07:15:44 -0700
To: Mark Hatle <mark.hatle@windriver.com>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>, <bruce.ashfield@gmail.com>
References: <cover.1458713426.git.hongxu.jia@windriver.com>
	<33e2a988b2639c965d4b733148a9eb20619b8a66.1458713426.git.hongxu.jia@windriver.com>
	<56F29CC4.9010204@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56F2A50E.9090102@windriver.com>
Date: Wed, 23 Mar 2016 22:15:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56F29CC4.9010204@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 01/15] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Wed, 23 Mar 2016 14:15:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2016 09:40 PM, Mark Hatle wrote:
> The following looks right to me.  I'd recommend this version be used.
>
> However, I'm guessing the work is not done.  Anything that has an ${S} outside
> of the WORKDIR will not be remapped.  I'm guessing this includes the toolchain
> and kernel bits.... but other things might also have a shared work dir?

Yes, we should consider this situation, I will do the investigation to 
find the fix

>
> We probably should make it a requirement that those things have their own unique
> mapping defined as well.  I'm not sure if the existing tests will capture those
> issues and alert the user.

OK, with some investigation done, I will try to collect the requirements 
for discussing.

>
> (This is also a place in the developer guide we should probably explain what
> this debug-prelix-map does and how it should be used to make on-target
> debuggable items.)

Maybe we should introduce -debug-pprefix-map in reference/development
manual, I will file a doc requirement in bugzilla.

So it's just a start, we should continue to work on:

1) Support to remap ${S} outside of the WORKDIR (shared work dir)

2) Add -fdebug-prefix-map usage in manual

//Hongxu

>
> --Mark



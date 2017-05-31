Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 702AE6E672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 19:12:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4VJCrFq003249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 May 2017 12:12:54 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 May 2017 12:12:53 -0700
To: Cody P Schafer <dev@codyps.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
	<CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
	<7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
	<CAPoQQ-3k3HBh97T855_qY4PtBy8Z2qTVuU_BawnBJsvcBCoe8A@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d5baf3fb-75f5-d50c-e59b-07f3688a88d4@windriver.com>
Date: Wed, 31 May 2017 14:12:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAPoQQ-3k3HBh97T855_qY4PtBy8Z2qTVuU_BawnBJsvcBCoe8A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Wed, 31 May 2017 19:12:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/31/17 12:20 PM, Cody P Schafer wrote:
>> Non-root user can't create privileged ports.
> 
> I presume you're speaking about tcp/udp ports here? (having the
> program numbers referred to as "RPC ports" in some contexts confuses
> things). Or does unfsd tell the kernel about it's rpc program numbers
> (called "RPC ports" in the script) somehow & restrict them too?
> 
> If it is the first, it isn't clear why that is relevant: I'm not
> trying to have unfsd use privileged tcp/udp ports (it's already using
> non-privlidged tcp/udp ports). I'm trying to drop the custom rpc
> program numbers (which are referred to as "RPC Ports" in the script).
> 

RPC Ports are just the bindings into rpcbind.   The tcp/udp ports are the ones
that typically conflict and why this was all done to begin with.

--Mark


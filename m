Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C657C6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:19:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 28 Jan 2016 05:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,358,1449561600"; d="scan'208";a="870727247"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2016 05:19:11 -0800
To: openembedded-core@lists.openembedded.org
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
	<CAJTo0La7EzDZ5ocG+++=7gp0PqNNquVv6a4H66p3orL3+c+GLA@mail.gmail.com>
	<20160128131355.GB1902@mbabyjoh-mobl.fi.intel.com>
	<CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56AA148C.2050104@linux.intel.com>
Date: Thu, 28 Jan 2016 15:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 13:19:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2016 03:13 PM, Burton, Ross wrote:

> Presumably although the ABI changed, the API is the same so bluez5 and
> so on still builds against libical 2?

Generally, when there is a scary-looking major version update like this, 
it's a good idea to 'bitbake world'.


Alex



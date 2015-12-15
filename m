Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A31C160291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:31:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 15 Dec 2015 07:31:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,432,1444719600"; d="scan'208";a="861215610"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2015 07:31:18 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20151215152541.GA2556@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <567031BB.7040903@linux.intel.com>
Date: Tue, 15 Dec 2015 17:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151215152541.GA2556@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 15 Dec 2015 15:31:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2015 05:25 PM, Martin Jansa wrote:

>> +COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> +COMPATIBLE_HOST_armv7a = 'arm.*-linux'
>
> Can you add armv7ve as well?

Armv7ve support is not yet in master, so you'll have to add it later I'm 
afraid.

Alex



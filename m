Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 46E9F65C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:20:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Oct 2016 02:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,518,1473145200"; d="scan'208";a="1073088874"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2016 02:18:44 -0700
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<432da226-7470-bc72-8089-78e738f60657@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4e71b2b1-e293-81a8-b1cc-215789c0f7de@linux.intel.com>
Date: Thu, 20 Oct 2016 12:16:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <432da226-7470-bc72-8089-78e738f60657@gmail.com>
Subject: Re: [PATCH 00/19] Recipe updates and version check fixes
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
X-List-Received-Date: Thu, 20 Oct 2016 09:20:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2016 10:42 PM, akuster808 wrote:
> Are these updates just bug fixes or do they also contain new features /
> enhancements. Having a little more description in the commit will help
> the morty maintainer determine if any of the updates are suitable to
> backporting.

They're both. The updates in master happen not because of specific 
features or bugfixes, but simply because we want to stay as close to 
upstream as possible at all times, because there is less pain in many 
incremental updates as opposed to single massive updates that jump over 
a lot of code changes.

If stable releases want to do recipe version updates, the correct way to 
do that is to have automatic regression testing on every level, from 
oe-core all the way to the product image. Manually analyzing git log 
output and summarizing release announcements or whatnot for all of 
oe-core packages is labour-intensive and error/omission prone for 
everyone involved.

Alex



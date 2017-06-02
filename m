Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF8177E82
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 12:46:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 05:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,285,1493708400"; d="scan'208";a="1137299558"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2017 05:46:44 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<626ecb5d88f08650f626d7d798cb9c3e71a2a5ee.1496329361.git.alexander.kanavin@linux.intel.com>
	<def6d55c-9236-f900-ac0f-4cc8c0a1e741@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4e7e06cf-e9fc-dc05-04f8-b1664755aa03@linux.intel.com>
Date: Fri, 2 Jun 2017 15:44:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <def6d55c-9236-f900-ac0f-4cc8c0a1e741@linux.intel.com>
Subject: Re: [PATCH 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Fri, 02 Jun 2017 12:46:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2017 07:02 PM, Alexander Kanavin wrote:
> On 06/01/2017 06:15 PM, Alexander Kanavin wrote:
>> This greatly reduces build times when there is a large amount of small
>> rpm packages to produce. The patches are rather invasive,
>> and so will be submitted upstream.
>
> And now the pull request is open:
>
> https://github.com/rpm-software-management/rpm/pull/226
> https://github.com/rpm-software-management/rpm/issues/211

So the upstream's reaction to the pull request is that they're not 
against this, but they want the multiprocessing to be done with openmp 
(and not nss/nspr), given that they now actually support openssl as an 
alternative to nss, and don't want any hard dependencies on netscape 
stuff. I'll spend some time studying that.

Alex


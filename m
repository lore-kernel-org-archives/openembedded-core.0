Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 03FAE60557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 12:40:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 19 May 2016 05:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="984513494"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2016 05:40:30 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1463557068.git.liezhi.yang@windriver.com>
	<573DAF56.50601@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <573DB475.3040008@linux.intel.com>
Date: Thu, 19 May 2016 15:41:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <573DAF56.50601@linux.intel.com>
Subject: Re: [PATCH 0/7][python3] buildtools-tarball: replace python with python3
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
X-List-Received-Date: Thu, 19 May 2016 12:40:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2016 03:19 PM, Alexander Kanavin wrote:
> On 05/18/2016 10:43 AM, Robert Yang wrote:
>
>> Robert Yang (7):
>>    python3-smmap: add it for python3-gitdb
>>    python3-async: add it for python3-gitdb
>>    python3-gitdb: add it for python3-git
>>    python3-git: add it for buildtools-tarball
>
> You can remove the Python 2 versions at the same time. Nothing is
> requiring them in oe-core or meta-oe.

Nevermind; I just noticed that packagegroup-self-hosted refers to 
python-git, so it can be removed only after bitbake's python3 support is 
merged.

Alex



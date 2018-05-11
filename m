Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5061B75454
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 05:51:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2018 22:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,387,1520924400"; d="scan'208";a="54254982"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2018 22:51:04 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1525990692.git.pkj@axis.com>
	<fc21a364b6714e86743cc14e43e278328f9b39ea.1525990692.git.pkj@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e41c1a9f-60e1-a8b7-76d9-9af324866a33@linux.intel.com>
Date: Fri, 11 May 2018 08:43:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <fc21a364b6714e86743cc14e43e278328f9b39ea.1525990692.git.pkj@axis.com>
Subject: Re: [PATCH 2/2] rpm: Assume a max limit of 1024 open files
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
X-List-Received-Date: Fri, 11 May 2018 05:51:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/11/2018 01:20 AM, Peter Kjellerstedt wrote:
> If sysconf(_SC_OPEN_MAX) is much greater than the usual 1024 (for
> example inside a Docker container), the performance drops sharply.

Please do not drop the link to the upstream bug when replacing one patch 
with another. You can also simply amend my patch and add your SOB.

Also, why assume specifically 1024? We either need to close all the open 
files, or none, and your patch creates a situation where only some of 
the files may be closed. I'd say we should drop those two code snippets 
altogether instead of hardcoding 1024 into them.

Oh, and: please do comment in the upstream bug (e.g. with your 
benchmarks from the cover letter), otherwise upstream may do nothing 
because they're not using Docker.

Alex


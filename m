Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFFD77EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:56:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2017 05:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,377,1500966000"; d="scan'208";a="1193767478"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2017 05:56:55 -0700
To: openembedded-core@lists.openembedded.org, hongxu.jia@windriver.com,
	yahia farghaly <yahiafarghaly@gmail.com>
References: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cebfbffb-08e3-95b1-fbd9-d16f53541126@linux.intel.com>
Date: Mon, 11 Sep 2017 15:52:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
Subject: Re: [meta-oe][PATCH] gnupg: added a coreutils runtime dependancy to gnupg recipe
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
X-List-Received-Date: Mon, 11 Sep 2017 12:56:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/09/2017 01:17 AM, Yahia Farghaly wrote:
> From: yahiafarghaly <yahiafarghaly@gmail.com>
> 
> When using 'apt-key add' on the target image, the gnupg is required
> but for gnupg to be fully functional, the coreutils is required to be exist with the gnupg.
> Otherwise, it may throw an error in runtime as one of components of coreutils is missing.
> For 'apt-key add', i faced the error of 'comm: command not found' so as proper solution, i submit this change.
> 

Have you established that it's something in gnupg that needs the 'comm' 
command, and not something in apt-key? Can you point to the specific 
place in gnupg source tree where comm is used?

Thanks,
Alex


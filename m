Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1918877E32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 14:10:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 07:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="857460076"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 16 May 2017 07:10:07 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
	<8519c496-eafb-fac3-190c-5eb0e4dbe6e2@linux.intel.com>
	<CB3B2E08-268C-4D53-BE2C-BD83B7020E91@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <444f6479-f168-e05f-8f55-2d899fc65bf4@linux.intel.com>
Date: Tue, 16 May 2017 17:08:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CB3B2E08-268C-4D53-BE2C-BD83B7020E91@linux.intel.com>
Subject: Re: [PATCH v2 00/20] support profile-optimized build for Python
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
X-List-Received-Date: Tue, 16 May 2017 14:10:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2017 05:07 PM, Markus Lehtonen wrote:

> You're probably right. There's not much use in churning
> soon-to-be-deprecated Python 2.x. I will submit a new patchset for
> Python 3.x only. Python 2.x could be added later if deprecation
> wouldn't happen for some reason.

The deprecation is not a single point in time, it's an ongoing process. 
A lot of work was done last spring, and some more work has been done 
this spring. The situation with what still needs py 2.x will be 
revisited again in a year's time. I just want to avoid regressions on 
this front :)


Alex


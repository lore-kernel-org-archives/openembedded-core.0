Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 99F62774DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 08:00:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 26 Sep 2017 01:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="156036674"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 01:00:19 -0700
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1506411760.git.Qi.Chen@windriver.com>
	<c3ea84ced42e2cec87720d21edeb96c007e9984f.1506411760.git.Qi.Chen@windriver.com>
	<18117d38-34b5-e0de-8ab9-676352142fba@linux.intel.com>
	<972d9b8d-9647-68eb-3793-e6af563af2b8@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7a335457-3f37-d110-12f5-d034f5443d21@linux.intel.com>
Date: Tue, 26 Sep 2017 10:56:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <972d9b8d-9647-68eb-3793-e6af563af2b8@windriver.com>
Subject: Re: [PATCH 1/1] ffmpeg: backport patches to fix 12 CVEs
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
X-List-Received-Date: Tue, 26 Sep 2017 08:00:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/26/2017 10:57 AM, ChenQi wrote:

> I agree with you. I have tried to do the upgrade, and it's easy.
> However, at the current stage, it's unlikely for an upgrade patch to be 
> accepted. That's why I did the backport.

If the upgrade patch brings a new feature release, then yes. But in this 
case it's clearly:

a) bugfix only (nearly all commits since 3.3.3 start with 'fix' or 
'check') and
b) contains security fixes

I think it's only a matter of explaining these two things clearly in the 
commit message: if you do it, the patch will be accepted.

Alex


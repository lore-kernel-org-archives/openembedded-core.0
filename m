Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 33D3C78296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 07:47:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 00:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="156032633"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 00:47:08 -0700
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1506411760.git.Qi.Chen@windriver.com>
	<c3ea84ced42e2cec87720d21edeb96c007e9984f.1506411760.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <18117d38-34b5-e0de-8ab9-676352142fba@linux.intel.com>
Date: Tue, 26 Sep 2017 10:43:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <c3ea84ced42e2cec87720d21edeb96c007e9984f.1506411760.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Tue, 26 Sep 2017 07:47:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/26/2017 10:43 AM, Chen Qi wrote:
> Backport patches to fix the following CVEs.
> 
> CVE-2017-14054
> CVE-2017-14055
> CVE-2017-14056
> CVE-2017-14057
> CVE-2017-14058
> CVE-2017-14059
> CVE-2017-14169
> CVE-2017-14170
> CVE-2017-14171
> CVE-2017-14222
> CVE-2017-14223
> CVE-2017-14225

I'd rather just update to 3.3.4. A lot less patch clutter, a lot less 
chance of an important fix (CVE or not) having been missed, and it's 
rather unlikely there's something that breaks compared to 3.3.3, as 
feature development happens in a separate master branch.

Alex


Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4FF6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 19:52:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Dec 2015 11:52:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,409,1444719600"; d="scan'208";a="616022509"
Received: from wcluu-mobl3.amr.corp.intel.com (HELO [10.254.29.243])
	([10.254.29.243])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2015 11:52:19 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1449523356.git.anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5669D82F.3090606@linux.intel.com>
Date: Thu, 10 Dec 2015 13:53:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1449523356.git.anibal.limon@linux.intel.com>
Cc: bjst@enea.com, paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	georgex.l.musat@intel.com
Subject: Re: [PATCH 0/2] ptest-runner
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
X-List-Received-Date: Thu, 10 Dec 2015 19:52:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

ping

On 12/07/2015 03:26 PM, Aníbal Limón wrote:
> These two commits adds a new ptest-runner written in python the sh one is conserved
> to use in tiny systems.
> 
> What's new in ptest runner:
> 
> 	- Monitor/timeout stdout, stderr of the test suite to avoid block indefinetly.
> 	- Add option for change ptest root directory.
> 	- Add option for list available tests.
> 	- Add option for only run certain tests.
> 
> The following changes since commit d9bc1f4b9a8aff859c59dbf9bbdd6b16e99381b2:
> 
>   classes/sstate.bbclass: checkhashes modify to take into account siginfo. (2015-12-02 10:55:25 -0600)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib alimon/ptest-runner
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner
> 
> Aníbal Limón (2):
>   ptest-runner: Add version 2.0 re-implementation in python.
>   ptest-runner: Add a recipe for install ptest-runner 2.0.
> 
>  .../ptest-runner/files/ptest-runner_2.0.py         | 144 +++++++++++++++++++++
>  .../ptest-runner/ptest-runner_2.0.bb               |  28 ++++
>  2 files changed, 172 insertions(+)
>  create mode 100755 meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
>  create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> 


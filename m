Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 63210731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 17:33:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Dec 2015 09:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,447,1444719600"; d="scan'208";a="876612099"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.48]) ([10.219.5.48])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2015 09:33:07 -0800
To: openembedded-core@lists.openembedded.org
References: <1450133829-17751-1-git-send-email-anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56744395.6050800@linux.intel.com>
Date: Fri, 18 Dec 2015 11:34:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1450133829-17751-1-git-send-email-anibal.limon@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, Nathan_Lynch@mentor.com
Subject: Re: [PATCHv2 0/2] ptest-runner 2.0
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
X-List-Received-Date: Fri, 18 Dec 2015 17:33:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

ping


On 12/14/2015 04:57 PM, Aníbal Limón wrote:
> This v2 fixes default timeout to 5minutes also add support for wait indefinitely
> when specify -1 in timeout option.
> 
> The changes can be reviewed at,
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner
> 
> Aníbal Limón (2):
>   ptest-runner: Add version 2.0 re-implementation in python.
>   ptest-runner: Add a recipe for install ptest-runner 2.0.
> 
>  .../ptest-runner/files/ptest-runner_2.0.py         | 162 +++++++++++++++++++++
>  .../ptest-runner/ptest-runner_2.0.bb               |  28 ++++
>  2 files changed, 190 insertions(+)
>  create mode 100755 meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
>  create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> 


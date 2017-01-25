Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9EDC471E4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:08:57 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2017 04:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="52278820"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 25 Jan 2017 04:08:57 -0800
To: openembedded-core@lists.openembedded.org
References: <1485321541-255124-1-git-send-email-li.zhou@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9c069b35-66b6-cf53-d9b7-72687d6a92d5@linux.intel.com>
Date: Wed, 25 Jan 2017 14:09:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485321541-255124-1-git-send-email-li.zhou@windriver.com>
Subject: Re: [PATCH] openssh: Security Advisory - openssh - CVE-2016-10010
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
X-List-Received-Date: Wed, 25 Jan 2017 12:08:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2017 07:19 AM, Li Zhou wrote:
> sshd in OpenSSH before 7.4, when privilege separation is not used,
> creates forwarded Unix-domain sockets as root, which might allow
> local users to gain privileges via unspecified vectors, related to
> serverloop.c.
>
> Porting patch from <https://github.com/openbsd/src/commit/
> c76fac666ea038753294f2ac94d310f8adece9ce> to solve CVE-2016-10010.
> Adapted the patch to solve context issues.

Please update openssh to 7.4 instead, there is no need to backport fixes 
to master branch, if the issue can be solved by updating the recipe version.

Alex



Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50110708B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 21:02:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s93L2WaQ019443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 14:02:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 3 Oct 2014 14:02:32 -0700
Message-ID: <542F0EE7.5080801@windriver.com>
Date: Fri, 3 Oct 2014 16:02:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1412347885-57716-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1412347885-57716-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH] Bash bug fixes and CVE updates
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
X-List-Received-Date: Fri, 03 Oct 2014 21:02:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/14, 9:51 AM, Mark Hatle wrote:
> Use the official community fixes by patching to the latest patch level.
>
> The key patches for the active CVEs are listed below:
>
> bash32-052      CVE-2014-6271                           9/24/2014
> bash32-053      CVE-2014-7169                           9/26/2014
> bash32-054      exported function namespace change      9/27/2014
> bash32-055      CVE-2014-7186/CVE-2014-7187             10/1/2014
> bash32-056      CVE-2014-6277                           10/2/2014
>
> bash43-025      CVE-2014-6271                           9/24/2014
> bash43-026      CVE-2014-7169                           9/26/2014
> bash43-027      exported function namespace change      9/27/2014
> bash43-028      CVE-2014-7186/CVE-2014-7187             10/1/2014
> bash43-029      CVE-2014-6277                           10/2/2014
>
>
> I am still in the process of validating the before and after behavior of
> bash using the ptests, I'll let the list know once the tests have been
> completed.

ptests have been run for all of the QEMU machines.

Differences from before and after the patches:

-version: 4.3.0(1)-release
-versinfo: 4 3 0 1 release arm-oe-linux-gnueabi
+version: 4.3.29(2)-release
+versinfo: 4 3 29 2 release arm-oe-linux-gnueabi

(on arm only)

-FAIL: run-heredoc
+PASS: run-heredoc

(on mips64 and x86-64 only)

-PASS: run-jobs
+FAIL: run-jobs

Looking at the surrounding information, I believe both of the above are errors 
in the the test suite themselves.

--Mark

> Mark Hatle (1):
>    bash: Upgrade bash to latest patch level to fix CVEs
>
>   .../bash/bash-3.2.48/cve-2014-6271.patch           |  77 --------------
>   .../bash/bash-3.2.48/cve-2014-7169.patch           |  16 ---
>   .../recipes-extended/bash/bash/cve-2014-6271.patch | 114 ---------------------
>   .../recipes-extended/bash/bash/cve-2014-7169.patch |  16 ---
>   meta/recipes-extended/bash/bash_3.2.48.bb          |  38 ++++---
>   meta/recipes-extended/bash/bash_4.3.bb             |  90 +++++++++++++++-
>   6 files changed, 112 insertions(+), 239 deletions(-)
>   delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
>   delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
>   delete mode 100644 meta/recipes-extended/bash/bash/cve-2014-6271.patch
>   delete mode 100644 meta/recipes-extended/bash/bash/cve-2014-7169.patch
>



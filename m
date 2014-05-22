Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 984C16ABDB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:47:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2014 11:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,888,1392192000"; d="scan'208";a="435681921"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2014 11:47:43 -0700
Message-ID: <537E464F.10700@linux.intel.com>
Date: Thu, 22 May 2014 11:47:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [daisy-backport][PATCH 0/6] Daisy backports
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
X-List-Received-Date: Thu, 22 May 2014 18:47:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2014 11:27 AM, Otavio Salvador wrote:
> Hello,
>
> Those are the changes I have in my local backport branch which I run
> on top of 'sgw/daisy' branch.
>
> Chen Qi (2):
>    tcf-agent: add systemd support
>    gdb: add PACKAGECONFIG for babeltrace
>
These are already in my branch

> Denys Dmytriyenko (3):
>    cryptodev-linux: move to recipes-kernel to be shared with module and
>      tests
>    cryptodev-linux: create common .inc file to be shared by module and
>      tests
>    cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
>
I have pulled these for testing, but we don't normally enable new 
functionality in point releases.  I would like to get a clear 
justification as to why these are needed to be back-ported.

Please provide more details on the cryptodev functionality and why it 
should be backported.

Thanks
    Sau!

> Tudor Florea (1):
>    curl: remove inapporpriate file from curl release
>
>   .../openssl/cryptodev-linux_1.6.bb                 |   22 -
>   meta/recipes-devtools/gdb/gdb_7.6.2.bb             |    1 +
>   .../tcf-agent/tcf-agent/tcf-agent.service          |   10 +
>   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    8 +-
>   .../cryptodev/cryptodev-linux_1.6.bb               |   15 +
>   .../cryptodev/cryptodev-tests_1.6.bb               |   23 +
>   meta/recipes-kernel/cryptodev/cryptodev_1.6.inc    |   11 +
>   ...pile-and-install-rules-for-cryptodev-test.patch |   69 +
>   ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch |   29 +
>   .../curl/remove_inappropriate_file_from_rel.patch  | 8203 ++++++++++++++++++++
>   meta/recipes-support/curl/curl_7.35.0.bb           |    1 +
>   11 files changed, 8369 insertions(+), 23 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
>   create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
>   create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
>   create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
>   create mode 100644 meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
>   create mode 100644 meta/recipes-support/curl/curl/remove_inappropriate_file_from_rel.patch
>


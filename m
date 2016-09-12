Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36825731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 12:22:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 12 Sep 2016 05:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,322,1470726000"; 
   d="scan'208";a="7316331"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2016 05:22:33 -0700
To: openembedded-core@lists.openembedded.org
References: <1473603090-1486-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3e483970-9380-d055-b023-a4eac99e5d53@linux.intel.com>
Date: Mon, 12 Sep 2016 15:21:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473603090-1486-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] ltp: 20160126 -> 20160510
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
X-List-Received-Date: Mon, 12 Sep 2016 12:22:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2016 05:11 PM, Wang Xin wrote:
> 1) Upgrade ltp from 20160126 to 20160510.
> 2) Modify some patches, since the data has been changed.
>     0011-Rename-sigset-variable-to-sigset1.patch
>     0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> 3) Delete some patches, since they are no use.
>     0001-ltp-Don-t-link-against-libfl.patch
>     0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
>     0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
>     0013-include-fcntl.h-for-getting-O_-definitions.patch
>     0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
>     0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
>     0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
>     0017-replace-sigval_t-with-union-sigval.patch
>     0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
>     0032-regen.sh-Include-asm-unistd.h-explicitly.patch
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../0011-Rename-sigset-variable-to-sigset1.patch   | 60 +++++++++++-----------
>  ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  6 +--
>  .../ltp/{ltp_20160126.bb => ltp_20160510.bb}       | 12 +----
>  3 files changed, 34 insertions(+), 44 deletions(-)

The patches' deletions are absent from the patch.

Alex



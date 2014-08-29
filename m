Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5FADB705FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 00:14:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2014 17:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,421,1406617200"; d="scan'208";a="565079702"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.242])
	([10.255.12.242])
	by orsmga001.jf.intel.com with ESMTP; 28 Aug 2014 17:14:26 -0700
Message-ID: <53FFC5E2.3010207@linux.intel.com>
Date: Thu, 28 Aug 2014 17:14:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1409221406-25014-1-git-send-email-muzaffar_mahmood@mentor.com>
In-Reply-To: <1409221406-25014-1-git-send-email-muzaffar_mahmood@mentor.com>
Subject: Re: [PATCH] systemtap: Patches for version 2.1
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
X-List-Received-Date: Fri, 29 Aug 2014 00:14:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2014 03:23 AM, Muzaffar Mahmood wrote:
> From: Mikhail Durnev <Mikhail_Durnev@mentor.com>
>
Please tell us why?  If you up-revving, does it make more sense to 
change where we are pointing the git hash?

> Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
> Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
> ---
>   .../systemtap/systemtap/system_map_location.patch  |   13 +++++++++++++
>   meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
>   2 files changed, 14 insertions(+)
>   create mode 100644 meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
> new file mode 100644
> index 0000000..cd4f19e
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch

As with the other patch, this patch file is missing Upstream-Status and 
Signed-off-by.

See the http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

> @@ -0,0 +1,13 @@
> +Index: git/session.cxx
> +===================================================================
> +--- git.orig/session.cxx
> ++++ git/session.cxx
> +@@ -1634,7 +1634,7 @@ systemtap_session::parse_kernel_function
> + 	clog << _F("Kernel symbol table %s unavailable, (%s)",
> + 		   system_map_path.c_str(), strerror(errno)) << endl;
> +
> +-      system_map_path = "/boot/System.map-" + kernel_release;
> ++      system_map_path = kernel_build_tree + "/System.map-" + kernel_release;
> +       system_map.clear();
> +       system_map.open(system_map_path.c_str(), ifstream::in);
> +       if (! system_map.is_open())
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 3e1e80a..33aa136 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -6,6 +6,7 @@ PV = "2.5+git${SRCPV}"
>   SRC_URI = "git://sourceware.org/git/systemtap.git \
>              file://docproc-build-fix.patch \
>              file://obsolete_automake_macros.patch \
> +           file://system_map_location.patch \
>              file://tapset-linux-sendfile-syscall.patch \
>             "
>
>


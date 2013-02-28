Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAvbW-0003UH-TU
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 06:00:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Feb 2013 20:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,753,1355126400"; d="scan'208";a="207165972"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Feb 2013 20:44:00 -0800
Message-ID: <512EE090.3070304@linux.intel.com>
Date: Wed, 27 Feb 2013 20:44:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Donnelly <martin.donnelly@ge.com>
References: <434694260eb81cd89b2911f4169d2f23f1cf7cab.1361890071.git.martin.donnelly@ge.com>
	<63c4fc136f2bd29337c20a277af9f8996d237bfe.1361890071.git.martin.donnelly@ge.com>
In-Reply-To: <63c4fc136f2bd29337c20a277af9f8996d237bfe.1361890071.git.martin.donnelly@ge.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] shadow: remove grpconv argc check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 05:00:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2013 04:58 AM, Martin Donnelly wrote:
> The patched version of grpconv takes arguments but the check on
> argc was not removed. This patch removes this check which
> otherwise results in a spurious warning during rootfs creation.
>
> Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
> ---
>   .../shadow/files/add_root_cmd_options.patch        |   12 +++++++++++-
>   1 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
> index 5edd3b8..ab87e35 100644
> --- a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
> +++ b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch

This patch needs a header also with Upstream-Status: Signed-off-by: and 
a brief explaination (if needed).

Please review:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

> @@ -528,7 +528,17 @@ diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
>    int main (int argc, char **argv)
>    {
>    	const struct group *gr;
> -@@ -100,6 +183,8 @@
> +@@ -89,9 +172,6 @@
> + 	const struct sgrp *sg;
> + 	struct sgrp sgent;
> +
> +-	if (1 != argc) {
> +-		(void) fputs (_("Usage: grpconv\n"), stderr);
> +-	}
> + 	Prog = Basename (argv[0]);
> +
> + 	(void) setlocale (LC_ALL, "");
> +@@ -100,6 +180,8 @@
>
>    	OPENLOG ("grpconv");
>
>



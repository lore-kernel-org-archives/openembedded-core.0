Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6009D6FEA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:30:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="565508393"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.242])
	([10.255.12.242])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2014 11:29:58 -0700
Message-ID: <5400C6A5.6040001@linux.intel.com>
Date: Fri, 29 Aug 2014 11:29:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>, 
 openembedded-core@lists.openembedded.org
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
In-Reply-To: <1408720803-11737-1-git-send-email-lpapp@kde.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Fri, 29 Aug 2014 18:30:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Might be a nit, but can you please follow the Commit Guildlines at
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

The summary should include the filename or area of the fix

toolchain-script: Add ...

Also can you expand on the why this is needed?

Thanks
	Sau!

On 08/22/2014 08:20 AM, Laszlo Papp wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>   meta/classes/toolchain-scripts.bbclass | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 6cc8eba..60278d6 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -19,6 +19,7 @@ toolchain_create_sdk_env_script () {
>   		EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>   	done
>   	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
> +	echo 'export CCACHE_PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
>   	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>   	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
>   	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> @@ -37,6 +38,7 @@ toolchain_create_tree_env_script () {
>   	rm -f $script
>   	touch $script
>   	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
> +	echo 'export CCACHE_PATH=${STAGING_DIR_NATIVE}/usr/bin:${CCACHE_PATH}' >> $script
>   	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
>   	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>   	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
>


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 19D57770BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:35:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Oct 2015 13:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,682,1437462000"; d="scan'208";a="792878651"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.25.92])
	by orsmga001.jf.intel.com with ESMTP; 14 Oct 2015 13:35:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:35:48 +0100
Message-ID: <15707551.cAIuaySr4R@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <0ac22442d4b0be5e3d2a3725fca10279c73eabd4.1444706062.git.Qi.Chen@windriver.com>
References: <cover.1444706062.git.Qi.Chen@windriver.com>
	<0ac22442d4b0be5e3d2a3725fca10279c73eabd4.1444706062.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] toolchain-shar-extract.sh: fix path in example
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
X-List-Received-Date: Wed, 14 Oct 2015 20:35:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 October 2015 11:15:04 Chen Qi wrote:
> $env_setup_script already contains $target_sdk_dir.
> Fix the path in the example.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/files/toolchain-shar-extract.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/files/toolchain-shar-extract.sh
> b/meta/files/toolchain-shar-extract.sh index 2ffc2d1..2eeb290 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -183,7 +183,7 @@ fi
>  echo "SDK has been successfully set up and is ready to be used."
>  echo "Each time you wish to use the SDK in a new shell session, you need to
> source the environment setup script e.g." for env_setup_script in `ls
> $target_sdk_dir/environment-setup-*`; do 
> -	echo " \$ . $target_sdk_dir/$env_setup_script"
> +	echo " \$ . $env_setup_script"
>  done
> 
>  exit 0

Oops, this was my fault - thanks for fixing. This was also recently reported as 
[YOCTO #8431].

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


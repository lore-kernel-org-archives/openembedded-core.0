Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DDC3C78295
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:38:41 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 07:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,409,1498546800"; d="scan'208";a="142819341"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2017 07:38:42 -0700
Message-ID: <1503326861.7168.6.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: liu.ming50@gmail.com
Date: Mon, 21 Aug 2017 09:47:41 -0500
In-Reply-To: <1503315952-28377-1-git-send-email-liu.ming50@gmail.com>
References: <1503315952-28377-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: move some text from oe-setup-builddir to conf-notes.txt
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
X-List-Received-Date: Mon, 21 Aug 2017 14:38:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-21 at 13:45 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> This allows the end users to be able to override the entire notes
> showing on the shell console. For instance, Our company uses a
> external conf-notes.txt, and we run bitbake with some extra variables,
> looks like: F=xxx D=xxx M=xxx bitbake <target>, so we want to show
> exactly these texts on the shell console, that's why we need this
> change.
> 

I do not clearly spot the real gain. oe-setup-buildir just plots the
header and you can include what you specific stuff into conf-notes. The
header string does not strictly belongs to conf-notes, at least not
semantically.


> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/conf/conf-notes.txt  | 5 +++++
>  scripts/oe-setup-builddir | 7 -------
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
> index 2f2932b..f1a4f4d 100644
> --- a/meta/conf/conf-notes.txt
> +++ b/meta/conf/conf-notes.txt
> @@ -1,3 +1,8 @@
> +
> +### Shell environment set up for builds. ###
> +
> +You can now run 'bitbake <target>'
> +
>  Common targets are:
>      core-image-minimal
>      core-image-sato
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index ef49551..55d73ca 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -133,13 +133,6 @@ EOM
>  #    unset SHOWYPDOC
>  fi
>  
> -cat <<EOM
> -
> -### Shell environment set up for builds. ###
> -
> -You can now run 'bitbake <target>'
> -
> -EOM
>  if [ -z "$OECORENOTESCONF" ]; then
>      OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
>  fi
> -- 
> 2.7.4
> 




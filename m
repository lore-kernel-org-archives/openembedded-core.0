Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id AB99260132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 14:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5DDB25188035
Message-ID: <1435329007.3376.4.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2015 15:30:07 +0100
In-Reply-To: <1434468553-26749-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1434468553-26749-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] python3-ctypes: Fix cross compilation for arm targets
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
X-List-Received-Date: Fri, 26 Jun 2015 14:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-06-16 at 15:29 +0000, Alejandro Hernandez wrote:
> When cross compiling for arm targets ctypes compilation fails because
> it uses _sysconfigdata from the HOST, this patches makes it use the
> one from TARGET fixing compilation of this module
> 
> [YOCTO #7873]

Thanks Alejandro,

This is queued in my fido-next branch[1].

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core
-contrib/log/?h=joshuagl/fido-next

> 
> Signed-off-by: Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com>
> Signed-off-by: Jonas Göransson <jonas.goransson@qmatic.com>
> ---
>  meta/recipes-devtools/python/python3_3.3.3.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb 
> b/meta/recipes-devtools/python/python3_3.3.3.bb
> index 6147408..22ea651 100644
> --- a/meta/recipes-devtools/python/python3_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.3.3.bb
> @@ -72,6 +72,10 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>  export _PYTHON_PROJECT_BASE = "${B}"
>  export _PYTHON_PROJECT_SRC = "${S}"
>  
> +# Fix ctypes cross compilation
> +export CROSSPYTHONPATH = "${B}/build/lib.linux-${TARGET_ARCH}
> -${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
> +
> +
>  # No ctypes option for python 3
>  PYTHONLSBOPTS = ""
>  
> -- 
> 1.8.4.5
> 


Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8486CBA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 03:45:15 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 2A92DF811FD; Tue, 15 Oct 2013 21:45:17 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 64DDCF811E0;
	Tue, 15 Oct 2013 21:45:16 -0600 (MDT)
Message-ID: <525E0BD6.3070402@mlbassoc.com>
Date: Tue, 15 Oct 2013 21:45:26 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1381891890-23822-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1381891890-23822-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] busybox: Add depmod (adds 2240 bytes)
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
X-List-Received-Date: Wed, 16 Oct 2013 03:45:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-15 20:51, Saul Wold wrote:
> This will allow packages that update kernel modules to run correctly
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Gary Thomas <gary@mlbassoc.com>

> ---
>   meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> index 4526121..f0e63c2 100644
> --- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> @@ -504,7 +504,7 @@ CONFIG_LSMOD=y
>   # CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
>   CONFIG_MODPROBE=y
>   # CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
> -# CONFIG_DEPMOD is not set
> +CONFIG_DEPMOD=y
>
>   #
>   # Options common to multiple modutils
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


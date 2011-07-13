Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QgnV8-00017f-Vf
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 02:40:31 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BFD3E1660342; Tue, 12 Jul 2011 18:36:32 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E820B1660183;
	Tue, 12 Jul 2011 18:36:31 -0600 (MDT)
Message-ID: <4E1CE88F.1070808@mlbassoc.com>
Date: Tue, 12 Jul 2011 18:36:31 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310508931-1640-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1310508931-1640-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: fix malformed patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 00:40:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 04:15 PM, Andrea Adami wrote:
> * commit 19bda7f2c2dac6363468a49295c38f2095c67c98
> * was unfortunately based on a truncated patch.
> * Fix the broken line and repair kernel.bbclass.
> * Sorry for the noise...
>
> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
> ---
>   meta/classes/kernel.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e441748..9be55d0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -189,7 +189,7 @@ kernel_do_configure() {
>   	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>   		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
>   		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
> -			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
> +			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
>   		fi
>   		done
>   	fi

I don't think this is sufficient; the line above is broken as well.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



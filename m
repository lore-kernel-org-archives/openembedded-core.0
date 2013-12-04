Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 12B426D99E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 12:28:50 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CE55DF811DF; Wed,  4 Dec 2013 05:28:49 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 278A8F811DE;
	Wed,  4 Dec 2013 05:28:49 -0700 (MST)
Message-ID: <529F2028.3080702@mlbassoc.com>
Date: Wed, 04 Dec 2013 05:29:28 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1383149365-30556-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1383149365-30556-1-git-send-email-gary@mlbassoc.com>
Subject: Re: [PATCH v2] core-image-basic.bb: Allow user extensions
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
X-List-Received-Date: Wed, 04 Dec 2013 12:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-30 10:09, Gary Thomas wrote:
> Allow the user to provide additional packages to this image.
> This lets core-image-basic behave like all other core-image*
> recipes (which do support CORE_IMAGE_EXTRA_INSTALL), as well
> as match the documentation which suggests this as the mode to
> extend any core-image* image.
>
> v2 - drop redundant setting of CORE_IMAGE_EXTRA_INSTALL
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>   meta/recipes-extended/images/core-image-basic.bb |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
> index 091f57d..d599e72 100644
> --- a/meta/recipes-extended/images/core-image-basic.bb
> +++ b/meta/recipes-extended/images/core-image-basic.bb
> @@ -6,6 +6,7 @@ IMAGE_FEATURES += "splash ssh-server-openssh"
>   IMAGE_INSTALL = "\
>       packagegroup-core-boot \
>       packagegroup-core-basic \
> +    ${CORE_IMAGE_EXTRA_INSTALL} \
>       "
>
>   inherit core-image
>

Ping?  I know this message made it to the list, just no action.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


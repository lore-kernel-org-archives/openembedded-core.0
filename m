Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UMyWV-0006co-Bk
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 12:33:03 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 21994F811F5; Tue,  2 Apr 2013 04:15:55 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 52059F811F3;
	Tue,  2 Apr 2013 04:15:54 -0600 (MDT)
Message-ID: <515AAFDE.4020409@mlbassoc.com>
Date: Tue, 02 Apr 2013 04:15:58 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1364793033.git.Qi.Chen@windriver.com>
	<be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
In-Reply-To: <be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Tue, 02 Apr 2013 10:33:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-01 20:30, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Sato images, by default, have about 100M free space. This is not enough
> and it blocks automatic testing.
>
> This patch fixes this problem by overriding the IMAGE_OVERHEAD_FACTOR
> in the sato image recipe.
>
> [YOCTO #4109]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-sato/images/core-image-sato.bb |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index e3246d2..8df1d08 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -9,3 +9,6 @@ LICENSE = "MIT"
>   inherit core-image
>
>   IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
> +
> +# Override IMAGE_OVERHEAD_FACTOR to increase the free space size on sato images.
> +IMAGE_OVERHEAD_FACTOR = "2.0"
>

You should make this overridable by the user:
   IMAGE_OVERHEAD_FACTOR ?= "2.0"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2DC77EFE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 12:35:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03CZouF013409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 12:35:51 GMT
Message-ID: <1514982950.5525.131.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 12:35:50 +0000
In-Reply-To: <1514373588-2880-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1514373588-2880-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] atk: 2.26.0 -> 2.27.1
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
X-List-Received-Date: Wed, 03 Jan 2018 12:35:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-12-27 at 19:19 +0800, Huang Qiyu wrote:
> Upgrade atk from 2.26.0 to 2.27.1.
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.27.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/atk/{atk_2.26.0.bb => atk_2.27.1.bb}
> (78%)
> 
> diff --git a/meta/recipes-support/atk/atk_2.26.0.bb b/meta/recipes-
> support/atk/atk_2.27.1.bb
> similarity index 78%
> rename from meta/recipes-support/atk/atk_2.26.0.bb
> rename to meta/recipes-support/atk/atk_2.27.1.bb
> index e014ba0..3ac40cc 100644
> --- a/meta/recipes-support/atk/atk_2.26.0.bb
> +++ b/meta/recipes-support/atk/atk_2.27.1.bb
> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
>  
>  inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-
> introspection

Isn't 2.27 a development version and not a stable one? The upstream-
version-is-even suggests that too...

Cheers,

Richard


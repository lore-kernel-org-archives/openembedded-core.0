Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 548677E727
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:43:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Nwkz4ysqz24;
	Wed, 12 Jun 2019 07:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560318187;
	bh=q3NaUd8fYDKY6cy30i0RN+gR+FHekQJXLz+y9EIN78s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvaksTg3p2dzmZMx2ekStJ8oDBs6qlS+nIyjFRaILBoib5ybX4EwIpsL1tKH5zlv7
	v6HRlg9WJ0e3fwK37KkQFUDFa8W+wv1qOMyHvuJlhzdBldd12vAzPPvzitv+/42GAb
	IAdGNr0WI86aomlMDwWDpkxhoib6jbNbBSWQmGbzCeSaxym97Q0+Fo0yv5SqB+g0/q
	+uGbItqsM0HUtyi0nC4HatrL0kegEgMhmRcRNIKUN+1tC2dNi7RqSV4Ztej29fM98i
	/gzehdKa+pgJwonazA25gVt/ikYZD5rPv2ZgJM87lm2kXZexGimplOgcn8f7WlDyJ8
	n5AS5F1l+YSX7deyD3dWHJqGdqJ77rG2Zu7FcJIHMbpuPIAmziQGdEkqURsuYITS87
	5WKeJzKZPWV7xf7HH/16YcoUZG27n6gPc/8IhWXgojv2jCSRXenokXUu53zP7DvyWw
	Hf7QmpDj7+5uiEA3DWvGKPMkjtGxn90bgl/NWUMrF0BXtyr72WsIB0KzE5sAi58uqt
	6UczjsgfvaL1pUTKYupNtj/uBCVS7j84aYAe+1MDXkvtA25I1plkV16ChSj0U7S90O
	JNNdDfUaURBxAmWt0vrQkh4VaPcgwtpvGKkovFH6n/COTFhR0TALXZAkNRW65x7cqV
	3ecXDLwBuVtURgq/I5z2l6+4=
Date: Wed, 12 Jun 2019 08:43:05 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20190612054305.GB12642@localhost>
References: <cover.1560305170.git.Qi.Chen@windriver.com>
	<6c141cf1421c58dd5fed46481b94c82143628bab.1560305170.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6c141cf1421c58dd5fed46481b94c82143628bab.1560305170.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] util-linux: upgrade to 2.33.2
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
X-List-Received-Date: Wed, 12 Jun 2019 05:43:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 12, 2019 at 10:06:33AM +0800, Chen Qi wrote:
> The license files' names are changed, but the contents remain the
> same.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc              | 16 ++++++++--------
>  .../{util-linux_2.32.1.bb => util-linux_2.33.2.bb}       |  4 ++--
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  rename meta/recipes-core/util-linux/{util-linux_2.32.1.bb => util-linux_2.33.2.bb} (72%)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 7b9b4d2..eaaf408 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -8,15 +8,15 @@ SECTION = "base"
>  
>  LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
>...
> -                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
>...
> +                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
>...

Doesn't this mean that LICENSE is (and already was before) wrong?

meta/files/common-licenses/BSD is the 3 clause BSD licence,
but this is the 4 clause licence (with the advertising clause).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



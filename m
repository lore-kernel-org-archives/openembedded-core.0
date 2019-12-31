Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AA8B67FA20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:32:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47n5bV1lHQzRj
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 08:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577777526;
	bh=R2pe45EcJmynR1so6vwpO7RL5IPhhDNJYiNto5NdqRU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=StVvPxKa3OFLCgRgKhEMAZEiufZqeJQoMg511UK5tiE2cXFqtVsX383I9oqey5pkg
	rn89j8tDX8aTig2XZXw2qGolAEyxu3HwNOi8K7Bb6oxhzOV7JtmX3p8jIrgDbZ1k19
	y4JYWVyXCSG4baJZ5EktbKO4Ql5XNU/V8IiZa8R2+Ujc4iK2vtIpA8DPn6ODKxtAf0
	7Hr3vNpwx0FWNUfcC0LpqKcqTOEY44Q2LzyirBnEja2PpYj1lIkpUQW61gH9Ei+Vjr
	SpACzKUWg9z5XuprDE+MsLFaPD1upBzMEWTKs7CsNqqO9zHp6YaZfoK1g399+xI9Zm
	9szVBRHqRhCEkUcSFU8L6EHWbLPx650rYuicJ3W/Ee95DVOOaaznrneXpINzt+0+BV
	/WD6rN5IMyrR+H2tqiwJAenaF/B1xicaogk29NWVhGObQlStQ1VOq1on/LU7WNTDF9
	kOnx6W4n0PERBWD3UrhVQqZCin254XeQhSGNLwSJeh/VScby+o9huAz0xcN/Z+bt7q
	SNcnOX47cCb6T1gg3k0y7wYqPiifmyfbyHtUFp4qiSTGJ7oR7sR6ZKPfq08lbEnoJL
	VKAS4pX3no2TSiqcRWm0hUepLD9x0p52YWNK0wNxzpAD8M5GEuyyCi3rw6qycO002h
	mGFVvyaP8hO1HnW9FUNaVHJ4=
Date: Tue, 31 Dec 2019 09:32:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191231073204.GA934@localhost>
References: <20191220045111.12387-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20191220045111.12387-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Tue, 31 Dec 2019 07:32:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ping

This should not conflict with a later upgrade to 3.8,
and exposure in master would in any case give further
testing before backporting to zeus+warrior.

Thanks
Adrian


On Fri, Dec 20, 2019 at 06:51:11AM +0200, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../python/{python3_3.7.5.bb => python3_3.7.6.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (99%)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.7.5.bb
> rename to meta/recipes-devtools/python/python3_3.7.6.bb
> index 57eaaea5e7..bd23da87d6 100644
> --- a/meta/recipes-devtools/python/python3_3.7.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.6.bb
> @@ -39,8 +39,8 @@ SRC_URI_append_class-nativesdk = " \
>             file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
>             "
>  
> -SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
> -SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
> +SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
> +SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
>  
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



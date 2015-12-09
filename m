Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id CF85F60589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 19:52:12 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so34452953pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 11:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WRK9j+KpoAJP/Iacdc/LNQ8Ku5a9xBZG3q9Vw3XYj2A=;
	b=UJ3je7QK8KMGZ88imqOQMe1Z5iF3Nw8p15q3ljxVtFBOxG+dQZjoDk/KWOia5GnQZa
	plaR8A140XagLheuvi7Nv5hvEo7c//ZIJcr271FbUObDnzjSu0k6vjQKJGlqeR6nAYq8
	hkso/AvMFaOA2FFENioTTJw45BP2mLdTPufikwcP550o+CCbr+iOwnIuTq7mh72YSfNN
	2QjaHfytwVy61bmEPBRbeqOV8km2siqI8v4MzQDgWCPmlkvJt1qdnb6B2iTjflTqhTMk
	O6b5MUfypuhUE5HfMaF4Zig1xHj4ZnpnoNCouwlDWKcxwl1gZisP+TMYX4MrK/zjKMe+
	GFgA==
X-Received: by 10.67.5.164 with SMTP id cn4mr10255954pad.141.1449690732582;
	Wed, 09 Dec 2015 11:52:12 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:7588:9f7b:1ab6:88af?
	([2601:202:4000:1239:7588:9f7b:1ab6:88af])
	by smtp.googlemail.com with ESMTPSA id
	sy5sm13671684pac.5.2015.12.09.11.52.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Dec 2015 11:52:11 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5668866A.7030900@gmail.com>
Date: Wed, 9 Dec 2015 11:52:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 01/10] openssl: update to 1.0.2e
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
X-List-Received-Date: Wed, 09 Dec 2015 19:52:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Can we get the CVE's fix by this update included in the commit?

- armin

On 12/09/2015 06:40 AM, Alexander Kanavin wrote:
> [YOCTO #8765]
> [YOCTO #8758]
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb}                  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb} (94%)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> similarity index 94%
> rename from meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> index 249f8c4..e41f46b 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
> @@ -39,8 +39,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>              file://ptest_makefile_deps.patch  \
>             "
>  
> -SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
> -SRC_URI[sha256sum] = "671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8"
> +SRC_URI[md5sum] = "5262bfa25b60ed9de9f28d5d52d77fc5"
> +SRC_URI[sha256sum] = "e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff"
>  
>  PACKAGES =+ " \
>  	${PN}-engines \
> 


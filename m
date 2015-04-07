Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2852B73C89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37Ldb4T007499; Tue, 7 Apr 2015 22:39:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PVX0EcxCe-XA; Tue,  7 Apr 2015 22:39:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37LdP2v007483
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Apr 2015 22:39:37 +0100
Message-ID: <1428442765.14020.482.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 07 Apr 2015 22:39:25 +0100
In-Reply-To: <7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
	<7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] glib-2.0: 2.42.1 -> 2.44.0
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
X-List-Received-Date: Tue, 07 Apr 2015 21:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 04:24 -0700, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb}     |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb} (83%)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
> similarity index 83%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
> index 69b3ef8..100799e 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.42.1.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.44.0.bb
> @@ -18,5 +18,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>  
>  SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>  
> -SRC_URI[md5sum] = "89c4119e50e767d3532158605ee9121a"
> -SRC_URI[sha256sum] = "8f3f0865280e45b8ce840e176ef83bcfd511148918cc8d39df2ee89b67dcf89a"
> +SRC_URI[md5sum] = "74cf7b4ea200b76e42a4c22c8daf0f93"
> +SRC_URI[sha256sum] = "f2d362b106a08fa801770d41829a06fcfe287a00421018869eebf5efc796f5b9"

This blew up badly on the autobuilder:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=c8da6d7390ad626c03d5b9b431a97adeaeb60a89

Cheers,

Richard



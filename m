Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 441D76E38E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 17:57:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBCHvSpC001163; Thu, 12 Dec 2013 17:57:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ydnc7mVKB9i8; Thu, 12 Dec 2013 17:57:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBCHvNTe001155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 12 Dec 2013 17:57:24 GMT
Message-ID: <1386871038.504.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fahad Arslan <fahad_arslan@mentor.com>
Date: Thu, 12 Dec 2013 17:57:18 +0000
In-Reply-To: <1386870464-41010-1-git-send-email-fahad_arslan@mentor.com>
References: <1386870464-41010-1-git-send-email-fahad_arslan@mentor.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libffi: Copy headers to more common include path.
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
X-List-Received-Date: Thu, 12 Dec 2013 17:57:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-12-12 at 22:47 +0500, Fahad Arslan wrote:
> Signed-off-by: Fahad Arslan <fahad_arslan@mentor.com>
> ---
>  meta/recipes-gnome/libffi/libffi_3.0.13.bb |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-gnome/libffi/libffi_3.0.13.bb b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
> index db0841e..07dd7d1 100644
> --- a/meta/recipes-gnome/libffi/libffi_3.0.13.bb
> +++ b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
> @@ -22,3 +22,8 @@ inherit autotools
>  FILES_${PN}-dev += "${libdir}/libffi-${PV}"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_install_append() {
> +    install -d ${D}${includedir}
> +    cp -r ${D}${libdir}/libffi-${PV}/include/* ${D}${includedir}/ || true
> +}

Why? Shouldn't whatever is using them look for them in the correct
location?

Cheers,

Richard



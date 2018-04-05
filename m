Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00AD174E53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 13:55:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w35Dtrtn006767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 5 Apr 2018 14:55:54 +0100
Message-ID: <1522936553.11431.425.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Hochstein <tom.hochstein@nxp.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Apr 2018 14:55:53 +0100
In-Reply-To: <1522869935-31522-1-git-send-email-tom.hochstein@nxp.com>
References: <1522869935-31522-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] python3: Add recommended modules to nativesdk install
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
X-List-Received-Date: Thu, 05 Apr 2018 13:55:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-04-04 at 14:25 -0500, Tom Hochstein wrote:
> The python3 installation in the SDK did not include the minimum set
> of modules.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.5.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb
> b/meta/recipes-devtools/python/python3_3.5.5.bb
> index d458d32..f893b84 100644
> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
> @@ -211,6 +211,7 @@ py_package_preprocess () {
>  
>  # manual dependency additions
>  RPROVIDES_${PN}-modules = "${PN}"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-
> modules"
>  RRECOMMENDS_${PN}-crypt = "openssl"
>  RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"

This doesn't look correct, if you want the SDK to contain all python
modules, surely you'd just add nativesdk-python3-modules rather than
forcing this everywhere?

Cheers,

Richard


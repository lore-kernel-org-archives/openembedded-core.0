Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 650B065CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:08:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6VA8gO0021075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 31 Jul 2018 11:08:44 +0100
Message-ID: <b9a00beb06723da9bdd5f32923057d31ccbc0941.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 11:08:42 +0100
In-Reply-To: <1533000487-12738-1-git-send-email-armccurdy@gmail.com>
References: <1533000487-12738-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] openssl_1.0: drop unnecessary dependency on makedepend-native
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
X-List-Received-Date: Tue, 31 Jul 2018 10:08:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-30 at 18:28 -0700, Andre McCurdy wrote:
> The openssl Configure script will only select standalone makedepend
> (vs running "$CC -M") when building with gcc < 3.x or with an Apple
> Xcode version which predates the switch to clang (in approx 2010?).
> Neither of these cases are possible when building under OE, therefore
> the dependency on makedepend-native can be dropped (ie align the
> openssl 1.0 recipe with the 1.1 recipe, which has dropped the
> makedepend-native dependency already).
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> index f5d3274..78c8552 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> @@ -8,7 +8,7 @@ SECTION = "libs/network"
>  LICENSE = "openssl"
>  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
>  
> -DEPENDS = "makedepend-native hostperl-runtime-native"
> +DEPENDS = "hostperl-runtime-native"
>  DEPENDS_append_class-target = " openssl-native"
>  
>  PROVIDES += "openssl10"

This was added quite 'recently' in:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=50c23e6c26a64b0c04e99abacb61ec00d1abace9

I've cc'd Andrej in case he can tell us why that was needed?

Cheers,

Richard



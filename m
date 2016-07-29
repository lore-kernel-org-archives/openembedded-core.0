Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3F260746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 06:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T6nDxO007318; Fri, 29 Jul 2016 07:49:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KV_xJJ2aS7gn; Fri, 29 Jul 2016 07:49:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T6nB4i007311
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 07:49:12 +0100
Message-ID: <1469774951.9142.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 07:49:11 +0100
In-Reply-To: <4da54d831c7002a28d51e3edf23fbee28d98d948.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
	<4da54d831c7002a28d51e3edf23fbee28d98d948.1469656341.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] cronie: upgrade to 1.5.1
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
X-List-Received-Date: Fri, 29 Jul 2016 06:49:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-27 at 21:52 +0000, Alejandro Hernandez wrote:
> Signed-off-by: Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-extended/cronie/{cronie_1.5.0.bb => cronie_1.5.1.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/cronie/{cronie_1.5.0.bb =>
> cronie_1.5.1.bb} (95%)
> 
> diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb
> b/meta/recipes-extended/cronie/cronie_1.5.1.bb
> similarity index 95%
> rename from meta/recipes-extended/cronie/cronie_1.5.0.bb
> rename to meta/recipes-extended/cronie/cronie_1.5.1.bb
> index 697501a..99b2bb5 100644
> --- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.5.1.bb
> @@ -23,8 +23,8 @@ SRC_URI = "
> https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
>  PAM_SRC_URI = "file://crond_pam_config.patch"
>  PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin
> -loginuid"
>  
> -SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
> -SRC_URI[sha256sum] =
> "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
> +SRC_URI[md5sum] = "910e6effcc032998b0a49fbd46322e18"
> +SRC_URI[sha256sum] =
> "6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338"
>  
>  inherit autotools update-rc.d useradd systemd

https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
ds/841/steps/BuildImages/logs/stdio

and it killed multiple other builds:

http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=7cb0ca
b0765669856e359f21a19c47383dcfe84c&type=commit

Cheers,

Richard


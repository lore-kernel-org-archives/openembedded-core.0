Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6998674FF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 07:12:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5P7CN17023930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Jun 2018 08:12:24 +0100
Message-ID: <9b71710d2b8bf22ae451fcbc8543d4a1b0c10909.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 08:12:23 +0100
In-Reply-To: <1529783581-46179-8-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-8-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 7/8] [PATCH v2] rpm: Add DEPENDS for nativesdk.
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
X-List-Received-Date: Mon, 25 Jun 2018 07:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-06-24 at 03:53 +0800, Zheng Ruoqin wrote:
> Add DEPENDS for nativesdk.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.14.1.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-
> devtools/rpm/rpm_4.14.1.bb
> index e5e87d3..6ca5c94 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> @@ -52,6 +52,7 @@ S = "${WORKDIR}/git"
>  
>  DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils
> python3"
>  DEPENDS_append_class-native = " file-replacement-native bzip2-
> replacement-native"
> +DEPENDS_append_class-nativesdk = " file-replacement-nativesdk"


file-nativesdk from the normal DEPENDS should be fine here? I don't
think you need file-replacement-nativesdk?

Cheers,

Richard


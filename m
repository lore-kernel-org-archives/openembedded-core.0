Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B12AF74FC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 07:10:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5P7AMo5023770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Jun 2018 08:10:23 +0100
Message-ID: <ec2d00133973b1c0a464aef2ac4f38035510a508.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 08:10:21 +0100
In-Reply-To: <1529783581-46179-5-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-5-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 4/8][PATCH v2] libnewt-python: Add PROVIDES for nativesdk.
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
X-List-Received-Date: Mon, 25 Jun 2018 07:10:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-06-24 at 03:52 +0800, Zheng Ruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/file/file_5.32.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/file/file_5.32.bb b/meta/recipes-
> devtools/file/file_5.32.bb
> index 5e15925..9b13261 100644
> --- a/meta/recipes-devtools/file/file_5.32.bb
> +++ b/meta/recipes-devtools/file/file_5.32.bb
> @@ -43,6 +43,8 @@ do_install_append_class-nativesdk() {
>  
>  BBCLASSEXTEND = "native nativesdk"
>  PROVIDES_append_class-native = " file-replacement-native"
> +PROVIDES_append_class-nativesdk = " file-replacement-nativesdk"
> +
>  # Don't use NATIVE_PACKAGE_PATH_SUFFIX as that hides libmagic from
> anyone who
>  # depends on file-replacement-native.
>  bindir_append_class-native = "/file-native"

The description is wrong, this isn't libnewt-python.

Also, the use case for file-replacement-native is very specific to file
from the host system verses file from file-native. Why would you ever
need this for nativesdk? I'm not sure you'd ever need this?

Cheers,

Richard


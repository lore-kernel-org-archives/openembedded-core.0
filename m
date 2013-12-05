Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 492896D88C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 13:33:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5DX5OW007992; Thu, 5 Dec 2013 13:33:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bKuBGqBy7OZC; Thu,  5 Dec 2013 13:33:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5DWxxI007977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Dec 2013 13:33:00 GMT
Message-ID: <1386250374.25847.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 05 Dec 2013 13:32:54 +0000
In-Reply-To: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
References: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] documentation.conf: remove unused IMAGETEST variable
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
X-List-Received-Date: Thu, 05 Dec 2013 13:33:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-12-05 at 12:55 +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/documentation.conf |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 6666648..db3701b 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -118,7 +118,6 @@ IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image du
>  IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system applies to the initial image size for cases when the multiplier times the returned disk usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
>  IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
>  IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
> -IMAGETEST[doc] = "Enable test booting of virtual machine images under the qemu emulator after any root filesystems are created and run tests against those images."
>  INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
>  INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
>  INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."

Isn't it actually IMAGE_TEST ?

Cheers,

Richard



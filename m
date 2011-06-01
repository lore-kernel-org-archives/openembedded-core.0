Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QReyA-0004lW-Gu
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:31:54 +0200
Received: by pvc30 with SMTP id 30so2523493pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:subject:references:in-reply-to:x-enigmail-version
	:content-type:content-transfer-encoding;
	bh=iI3soUMcDW6TsjM6g7UDNVil6tSSrm9QQKEsTFGc2E8=;
	b=g95x6wIpUCznS5hqsVpw/QoocuzmRd0mm6ypKDpZ82zoFAywnRnxUYOFHb9B3hMnzZ
	G7B9fofqs6WAUIXPziU0r5JTF8latNHUBrROdsC8gdvuS9kGH0OeB1AKUAgqVsb+OzN2
	xr7+ErRFXAmZKWhh/K0hQpHwvme2m3ccbGGqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=co961ETpH/CA+2HHj6/skaGt+sH/picjN7TsO7cTHZQhEz4L8ji50znhtEx147rJIy
	zugUmsPRgtxr83D1FEmZUAyPe8jPUjVHbUSwKjVD6B4DIF3ki/+kp/j2lVYJtB2KVS76
	DnHI7x/7w+0ACBB9d6cWZNo7pRMUVqC/zddr0=
Received: by 10.142.210.4 with SMTP id i4mr805176wfg.250.1306909723557;
	Tue, 31 May 2011 23:28:43 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d15sm475916wfl.6.2011.05.31.23.28.41
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 23:28:42 -0700 (PDT)
Message-ID: <4DE5DC18.3060405@gmail.com>
Date: Tue, 31 May 2011 23:28:40 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1306909184.git.sgw@linux.intel.com>
	<937ab8072370293ac6caba070bb2be1e3d5f1039.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <937ab8072370293ac6caba070bb2be1e3d5f1039.1306909184.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.1.1
Subject: Re: [CONSOLIDATED PULL 12/32] libiconv: update to 1.13.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 06:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/31/2011 11:21 PM, Saul Wold wrote:
> Add Upstream-Status tags to patches
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../autoconf.patch                                 |    2 ++
>  .../shared_preloadable_libiconv_linux.patch        |    2 ++
>  .../{libiconv_1.11.1.bb => libiconv_1.13.1.bb}     |    0
>  3 files changed, 4 insertions(+), 0 deletions(-)
>  rename meta/recipes-support/libiconv/{libiconv-1.11.1 => libiconv-1.13.1}/autoconf.patch (98%)
>  rename meta/recipes-support/libiconv/{libiconv-1.11.1 => libiconv-1.13.1}/shared_preloadable_libiconv_linux.patch (98%)
>  rename meta/recipes-support/libiconv/{libiconv_1.11.1.bb => libiconv_1.13.1.bb} (100%)
> 
> diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
> similarity index 98%
> rename from meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
> rename to meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
> index 2b24894..3cbf549 100644
> --- a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
> +++ b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
> @@ -2,6 +2,8 @@ It adds the variables that are needed
>  for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
>  directory. Its imported from OE.
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  
>  Index: libiconv-1.11.1/configure.ac
> diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
> similarity index 98%
> rename from meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
> rename to meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
> index a913dad..fb07f73 100644
> --- a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
> +++ b/meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
> @@ -4,6 +4,8 @@ Its more enforced by libtool 2.4. I have not checked it with older libtool
>  libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
>  was released these kind of problem are more likely
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  
>  Index: libiconv-1.11.1/lib/Makefile.in
> diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
> similarity index 100%
> rename from meta/recipes-support/libiconv/libiconv_1.11.1.bb
> rename to meta/recipes-support/libiconv/libiconv_1.13.1.bb

FWIW 1.11.1 was last GPLv2 release. So I think you can add 1.13.1 but do
not replace 1.11.1 with it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3l3BcACgkQuwUzVZGdMxS/0QCaAkbu4wuI/ZJ72mK7zlD3lP8F
vlMAniBrJK4jCDvDlqgQtXzUwFVQju/R
=ZlZ3
-----END PGP SIGNATURE-----



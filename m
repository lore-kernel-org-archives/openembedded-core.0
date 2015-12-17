Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id DEF8C6FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:34:02 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id q3so24775328pav.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 08:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=yd/zsmxuHyw+rUjQ3ROr69015tBCvyvbIaGp0OYE034=;
	b=z5ZESDhyRjUJVsgtfcJSoO70ZrMKxWbpOC/hylPt2J334Cz/3tVbv8cvN1ZAI2g9Zf
	fhYhldYBi2IsIcaGOzC4YESwywD7nYvBidKIYZVEwj/OfVZ7gZjZHtLmAfRKcs+Wt6pT
	oJSnUY8aI5b1t1qSfUanXlsY3w6LZq8ogEJbS4rkWGSHCVsw2krQWfbEoKi2cyQU58eg
	RVS4j/mLscEmxcI6icAIKsjN+puFS3cRTtr/GwPpxg84+MnzgRc+DKnAF+G11Jn9HoEH
	RMv6XKpHajF404HKGPB7ePOcgDP7eppBXwCfMINcOIvF/boi00svzIyV8EKTd1BCdt4d
	K/qg==
X-Received: by 10.66.118.135 with SMTP id km7mr36564016pab.159.1450370043360; 
	Thu, 17 Dec 2015 08:34:03 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:8467:8a02:be30:5a28?
	([2601:202:4000:1239:8467:8a02:be30:5a28])
	by smtp.googlemail.com with ESMTPSA id
	tm4sm16941587pab.3.2015.12.17.08.34.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 08:34:01 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1448590536-58100-1-git-send-email-tudor.florea@enea.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5672E3ED.9080201@gmail.com>
Date: Thu, 17 Dec 2015 08:33:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448590536-58100-1-git-send-email-tudor.florea@enea.com>
Subject: Re: [dizzy] [PATCH 1/1] glibc: use patch for CVE-2015-1781
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
X-List-Received-Date: Thu, 17 Dec 2015 16:34:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


merged to staging
git@git.yoctoproject.org/poky-contrib.git akuster/dizzy-next

thanks
Armin

On 11/26/2015 06:15 PM, Tudor Florea wrote:
> Patch added to the repo wasn't actually considered due to a
> erronously way of specifying the sources.
> 
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  meta/recipes-core/glibc/glibc_2.20.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
> index a0736cd..2ab4083 100644
> --- a/meta/recipes-core/glibc/glibc_2.20.bb
> +++ b/meta/recipes-core/glibc/glibc_2.20.bb
> @@ -40,14 +40,12 @@ EGLIBCPATCHES = "\
>  #           file://eglibc-install-pic-archives.patch \
>  #	    file://initgroups_keys.patch \
>  #
> -CVEPATCHES = "\
> -        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
> -"
>  
>  CVEPATCHES = "\
>          file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
>          file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
>          file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
> +        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
>      "
>  LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>        file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> 


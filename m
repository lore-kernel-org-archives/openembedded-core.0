Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2A78277055
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 23:47:42 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so35335033pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1kzySCplf+oHsu73L9yDJcVXXUPb6lFh4WJCV2K8M0s=;
	b=ou25kL/kfCYsvUF8lOSttP5jA20c8jKT6kV0Vnb3CQq+zmPGE/n/GbI8wWq1ZjVneO
	OTxg/uqm7D8qh2v/B+oeRQs7MJ5G4kMHoKSzSYl/4MPPYAN5oOdaQsod2Eetc+F088qD
	ja7EAywynuwKWOgAcxkCa6Rya90zs8tJT46j/TwqOLgq9gFBq5033fcHBX0W0+OO2vaT
	iSxpdfwJmmT49povP9k65B6fXVRWw+9XnL3QY/kMGWbONHvSICSLVmEC5ipM8FvuJqR7
	A+xUdEA+L1hbYfZmQLwpj8PbVii1HnDBVSfA1cnH/amVfXF3Ko13iXnIxq2FbC6d/MVj
	pf8w==
X-Received: by 10.68.166.196 with SMTP id zi4mr13680718pbb.83.1441410462816;
	Fri, 04 Sep 2015 16:47:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:ccfc:abc4:daa5:b1aa?
	([2601:202:4000:1239:ccfc:abc4:daa5:b1aa])
	by smtp.googlemail.com with ESMTPSA id
	cb6sm3778075pac.10.2015.09.04.16.47.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 16:47:41 -0700 (PDT)
Message-ID: <55EA2D9B.3090208@gmail.com>
Date: Fri, 04 Sep 2015 16:47:39 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1441311635-6303-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1441311635-6303-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH][master/fido/dizzy] oprofileui: Use inherit gettext
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
X-List-Received-Date: Fri, 04 Sep 2015 23:47:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Queuing up,

Thanks,
Armin

On 09/03/2015 01:20 PM, Saul Wold wrote:
> oprofileui uses gettext during the configuration task so should be inherit
> gettext. This issue appears when an older version of gettext is used do to
> pinning to the older non-gplv3 version.
> 
> [YOCTO #7795]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-kernel/oprofile/oprofileui.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
> index 1dfd0c6..8fcf014 100644
> --- a/meta/recipes-kernel/oprofile/oprofileui.inc
> +++ b/meta/recipes-kernel/oprofile/oprofileui.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  
>  DEPENDS = "glib-2.0 avahi intltool-native"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig gettext
>  
>  EXTRA_OECONF = "--with-avahi"
>  
> 


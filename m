Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S2y0m-0000CL-3e
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 05:53:04 +0100
Received: by pbbrp12 with SMTP id rp12so369202pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 20:44:33 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.220.67 as permitted sender) client-ip=10.68.220.67; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.220.67 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.220.67])
	by 10.68.220.67 with SMTP id pu3mr1246094pbc.61.1330577073876 (num_hops
	= 1); Wed, 29 Feb 2012 20:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=KdsmZ9oZgHCkRrMoyvembtkL+Tt3Tj1vi53j4zsIREo=;
	b=euyZehhgzZMmLFvjCLc2IwwLfRqjYPBKpxfFNEvAgh0CwdCbMP4TU7pY18gtuH19v3
	romw744cnp3PFmYWZWtTmXq5iqHw31XACngQOWss/y6/w7holFclR7deL6aJNNrO1Re7
	F1EY3sJNy6A1dNWsWted7jZBEstRx9jySkQY4=
Received: by 10.68.220.67 with SMTP id pu3mr1041164pbc.61.1330577073670;
	Wed, 29 Feb 2012 20:44:33 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id m3sm1003991pbg.44.2012.02.29.20.44.31
	(version=SSLv3 cipher=OTHER); Wed, 29 Feb 2012 20:44:32 -0800 (PST)
Message-ID: <4F4EFEAD.9010508@gmail.com>
Date: Wed, 29 Feb 2012 20:44:29 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
	<008428eeaf897d9d18e070097cfc82e706913539.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <008428eeaf897d9d18e070097cfc82e706913539.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 03/16] libusb1: Address unpackaged files warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 01 Mar 2012 04:53:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/23/2012 05:38 AM, Richard Purdie wrote:
> WARNING: For recipe libusb1, the following files/directories were installed but not shipped in any package:
> WARNING:   /lib/libusb-1.0.la
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/libusb/libusb1_1.0.8.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
> index e45a9d9..b8fa790 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
> @@ -6,7 +6,7 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
>  
> @@ -27,4 +27,4 @@ do_install_append() {
>  
>  FILES_${PN} += "${base_libdir}/*.so.*"
>  
> -FILES_${PN}-dev += "${base_libdir}/*.so"
> +FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"

why not just delete it. We have been living without it anyway



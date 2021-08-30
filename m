Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web09.858.1630343777399987176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 10:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=gAorcYv2;
 spf=pass (domain: cold-front.org, ip: 66.111.4.27, mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B30B15C0187
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:16:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 30 Aug 2021 13:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=date:from:to:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=Q5apmR4xo4Bq11f6eQ27QZMX
	je89FjUqJilYtfbMkCs=; b=gAorcYv29ji3q2Y0JsMMe1ENT02XEzY/FTAET9oV
	NWEG9kQUF88ckAFgQ/9OaUFY8tLv2GWrj1YzdSwxEP6SPQRKDiXpJjHTfN/94CWI
	8G9XiYq63wo4vZNKqn1GV6R9+O61ccdqdgWbjd8Ut5UmNdVGWY05Xmfvb1NpEqyX
	g80=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q5apmR
	4xo4Bq11f6eQ27QZMXje89FjUqJilYtfbMkCs=; b=hUMp0liQQY9u1o6xIxJLvh
	8fjbqKP5zoUmk9h/ONseTZIu+8OqTTSAwwICQHB946mtecGgJw+j0bpU3PftDH6N
	MCk4w31os9v3MEfuqXqLiW57ZwG0mRnjrRmvW8/mswphwS1WZJqOmjdLw1uz7TGI
	cV6Vc3K3NlIG3+MIsVqUVjjzMEFTTX/re6zlP386hrTPMFOpzJmGazbcjiSMp2cH
	hC6pcpGl1TWPEpzYzhn3mYte32JkjNlK0N1cNy/atng8zGLSUvXNVOfTXtdcSwNt
	GDQlf0FMeiNVKkyJAQs1/cilpUzX+kuibX51jG/f8I2yUtAezvxN2I9RN/gNiNCQ
	==
X-ME-Sender: <xms:YBItYQlWX2NTNKZlL99kyiXKBDbm-uQMLfc1zcCcxXzQp-5gWsT4zw>
    <xme:YBItYf3TJV2qyf5eGo2vubzEVrbn3P2E8lE2EIYGDbQtgWwkmj5p5BQ4U2UkzqmoP
    RzyxxfnV9GZwq4e9Q>
X-ME-Received: <xmr:YBItYeroLHB6UeGuSRTwvdYlHXAyiZhNQkyaB_mg3mV41FvMmX16wrbpV8KobLfGOCU8UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhgu
    vghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepledtkeejje
    ekgeekfeevgfejuddvhfejfeffudegtdefiefhtdeggefhveeuffehnecuffhomhgrihhn
    pehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdr
    ohhrgh
X-ME-Proxy: <xmx:YBItYcnT_AQFC9SlE6uUvBuf3VkAQUeqrtCtvLJAH699mampCHUAPw>
    <xmx:YBItYe2GfA2fS9EjrUj1WPlY5gSdlG8FA0WqwwRvI_Q-pq3ecaJQsA>
    <xmx:YBItYTv9oAgx3BCSddT25hsMrKqlDmWUTgE24k10RpevFV1nAM-y1g>
    <xmx:YBItYXip37a9KOIpXgSB7_ZkXr9aRRwXMP-3RScZyvFJfDv3yzupQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 30 Aug 2021 13:16:16 -0400 (EDT)
Date: Mon, 30 Aug 2021 13:16:15 -0400
From: "Justin Bronder" <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: hidapi: add rdep on glibc-gconv-utf-16
Message-ID: <20210830171615.GA6316@lasswell>
References: <16A01D9944DEB25B.22970@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <16A01D9944DEB25B.22970@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

My apologies, this should have been sent to
openembedded-devel@lists.openembedded.org.

On 30/08/21 10:59 -0400, Justin Bronder wrote:
> libhidapi-libusb needs to convert from UTF-16LE to WCHAR_T in order to
> read various libusb string descriptors.
> 
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta-oe/recipes-support/hidapi/hidapi_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> index 76f5dc762..e45445073 100644
> --- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
> +++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> @@ -7,6 +7,7 @@ LICENSE = "BSD-3-Clause | GPLv3"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
>  
>  DEPENDS = "libusb udev"
> +RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
>  
>  inherit autotools pkgconfig
>  
> -- 
> 2.33.0
> 

> 
> 
> 


-- 
Justin Bronder

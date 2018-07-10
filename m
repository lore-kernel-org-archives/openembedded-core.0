Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 546777454B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:45:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6A8jjgn019400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 10 Jul 2018 09:45:46 +0100
Message-ID: <05aaa19a3bf9bcf837150745d1ee17deaa41304f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 09:45:45 +0100
In-Reply-To: <20180710080702.20527-2-Martin.Jansa@gmail.com>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
	<20180710080702.20527-2-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] libdrm: allow to build native and nativesdk
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
X-List-Received-Date: Tue, 10 Jul 2018 08:45:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Normally I don't mind native/nativesdk variants but libdrm starts to
worry me as its a short step away from mesa and when we've tried native
or nativesdk versions in the past its been a nightmare, particularly
around GL.

Could you explain a little more about why we need libdrm-native?

Cheers,

Richard

On Tue, 2018-07-10 at 08:07 +0000, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/drm/libdrm_2.4.92.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> index 1526553254..b4d06d19a6 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
> @@ -56,3 +56,5 @@ FILES_${PN}-kms = "${libdir}/libkms*.so.*"
>  FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
>  FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
>  FILES_${PN}-etnaviv = "${libdir}/libdrm_etnaviv.so.*"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.17.1
> 


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABCDC7948E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 06:47:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7N6l1xk002619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 23 Aug 2018 07:47:02 +0100
Message-ID: <6a033e614294a00b39049b54f4dc35a138a26c8d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 07:47:01 +0100
In-Reply-To: <1534839945-264601-1-git-send-email-changqing.li@windriver.com>
References: <1534839945-264601-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] flac: patch for CVE-2017-6888
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
X-List-Received-Date: Thu, 23 Aug 2018 06:47:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-21 at 16:25 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../flac/flac/CVE-2017-6888.patch                  | 36
> ++++++++++++++++++++++
>  meta/recipes-multimedia/flac/flac_1.3.2.bb         |  4 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/flac/flac/CVE-2017-
> 6888.patch
> 
> diff --git a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
> b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
> new file mode 100644
> index 0000000..0977f30
> --- /dev/null
> +++ b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
> @@ -0,0 +1,36 @@
> +From 43ecb6431077ff54e9df27f71737e6e96d6c039f Mon Sep 17 00:00:00
> 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 21 Aug 2018 14:46:43 +0800
> +Subject: [PATCH] From 5f47b63e9c971e6391590caf00a0f2a5ed612e67 Mon
> Sep 17
> + 00:00:00 2001 From: Erik de Castro Lopo <erikd@mega-nerd.com> Date:
> Sat, 8
> + Apr 2017 18:34:49 +1000 Subject: [PATCH] stream_decoder.c: Fix a
> memory leak
> +
> +Leak reported by Secunia Research.
> +
> +Upstream-Status: Backport[https://git.xiph.org/?p=flac.git;a=commit;
> +                 h=4f47b63e9c971e6391590caf00a0f2a5ed612e67]
> +
> +Update patch to version 1.3.2
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>

This patch is missing a CVE: header. 

Please don't resend as I've just tweaked the patch in -next to add it
as I don't want to have to go through another round of testing for it.

Cheers,

Richard


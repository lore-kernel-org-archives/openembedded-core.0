Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E5E7E78C10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 09:02:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w7A92LlE015923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 10 Aug 2018 10:02:22 +0100
Message-ID: <e698254a753d8fe5c835bfd986a60bec2aa7acff.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 10:02:21 +0100
In-Reply-To: <20180810073139.89868-5-zhixiong.chi@windriver.com>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
	<20180810073139.89868-5-zhixiong.chi@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 5/6] mobile-broadband-provider-info: fix the script multilib conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 09:02:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-10 at 00:31 -0700, Zhixiong Chi wrote:
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../mobile-broadband-provider-info_git.bb                     | 4
> +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-
> info/mobile-broadband-provider-info_git.bb b/meta/recipes-
> connectivity/mobile-broadband-provider-info/mobile-broadband-
> provider-info_git.bb
> index dbc578e2d8..1a39932ffc 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-
> info/mobile-broadband-provider-info_git.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-
> info/mobile-broadband-provider-info_git.bb
> @@ -10,4 +10,6 @@ PE = "1"
>  SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info"
>  S = "${WORKDIR}/git"
>  
> -inherit autotools
> +inherit autotools multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/pkgconfig/mobile-broadband-
> provider-info.pc"

This is not correct, pkgconfig files installed into datadir are meant
to be architecture independent. The ones in libdir can be target
specific. What is the difference causing problems here?

Cheers,

Richard





Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D06126C0ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:38:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAMNcmip002045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 22 Nov 2018 23:38:50 GMT
Message-ID: <fe7da64a1ff59e90c653b6d1811e5fe0234f966a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 23:38:48 +0000
In-Reply-To: <20181122154136.121480-16-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<20181122154136.121480-16-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 16/16] dnf: update to 4.0.9
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
X-List-Received-Date: Thu, 22 Nov 2018 23:38:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-22 at 16:41 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/dnf/{dnf_4.0.4.bb => dnf_4.0.9.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/dnf/{dnf_4.0.4.bb => dnf_4.0.9.bb}
> (98%)
> 
> diff --git a/meta/recipes-devtools/dnf/dnf_4.0.4.bb b/meta/recipes-
> devtools/dnf/dnf_4.0.9.bb
> similarity index 98%
> rename from meta/recipes-devtools/dnf/dnf_4.0.4.bb
> rename to meta/recipes-devtools/dnf/dnf_4.0.9.bb
> index 931e9eff07f..24412fd4860 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.0.4.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.0.9.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-
> management/dnf.git \
>             file://0030-Run-python-scripts-using-env.patch \
>             "
>  
> -SRCREV = "6fdf0e8cc714c92ee08bd4db9412d4c587ffafe9"
> +SRCREV = "689a4c515738226f3dc85edb2035d23233ff41d8"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>  
>  S = "${WORKDIR}/git"

Something still isn't quite right somewhere:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/5/steps/7/logs/step7b
https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/5/steps/7/logs/step2b
(the above wic build has many similar errors)

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2DB65EAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:44:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DGhqAr022461; Fri, 13 Jun 2014 17:43:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xnduQaMYo5K9; Fri, 13 Jun 2014 17:43:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DGhlBQ022455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 13 Jun 2014 17:43:49 +0100
Message-ID: <1402677822.562.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Henning Heinold <henning@itconsulting-heinold.de>
Date: Fri, 13 Jun 2014 17:43:42 +0100
In-Reply-To: <1402348889-26065-2-git-send-email-henning@itconsulting-heinold.de>
References: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
	<1402348889-26065-2-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] perf: add slang to the dependencies
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
X-List-Received-Date: Fri, 13 Jun 2014 16:44:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-09 at 23:21 +0200, Henning Heinold wrote:
> * some kernels depends on newt, some on slang and some on boths
> * changing TUI_DEFINES is not necessary, because NO_NEWT is
>   compatible with all kernels
> 
> The patch was sponsored by sysmocom
> 
> Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index ef21b6c..adbecfd 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -15,7 +15,7 @@ require perf-features.inc
>  
>  BUILDPERF_libc-uclibc = "no"
>  
> -TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt', '',d)}"
> +TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
>  SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"

Can we put a comment in the recipe about the problem here so that we
remember why we have the dependencies when looking back in the future
please?

Cheers,

Richard



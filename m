Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDF26E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 05:53:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8F5rXNK024759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 22:53:33 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 14 Sep 2015 22:53:33 -0700
Message-ID: <55F7B25B.6030801@windriver.com>
Date: Tue, 15 Sep 2015 13:53:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20150910160557.GD2387@jama>
	<1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][master][fido][dizzy] Revert "perf: fix for rebuilding"
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
X-List-Received-Date: Tue, 15 Sep 2015 05:53:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Martin,

Sorry, I'm blocked by mutitlib SDK issues recently, I will fix it sooner.
Revert the patch is fine to me if it is urgent.

// Robert

On 09/15/2015 01:29 PM, Martin Jansa wrote:
> * This reverts commit 9dafa571ed0a40d21a886dec7704c31150b21942.
>
> * The "fix" is causing more issues then it's fixing and there was no
>    feedback in many months.
> * More info:
>    http://lists.openembedded.org/pipermail/openembedded-core/2015-June/105684.html
>    http://lists.openembedded.org/pipermail/openembedded-core/2015-September/109870.html
>    http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110338.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index adb3a2c..f1d7894 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -118,10 +118,6 @@ do_install() {
>   }
>
>   do_configure_prepend () {
> -    # Fix for rebuilding
> -    rm -rf ${B}/
> -    mkdir ${B}/
> -
>       # If building a multlib based perf, the incorrect library path will be
>       # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
>       # build, with a 64 bit multilib, the arch won't match and the detection of a
>


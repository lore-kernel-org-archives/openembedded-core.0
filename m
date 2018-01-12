Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id A9ED47887E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 16:21:42 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id i143so6405533ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 08:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JCZobQQ/TzFAZmjN/yj3JRwd4qlOt7jPdGpBzBgxonk=;
	b=p+4lMnGqbvvIkBIuNTq/SPw390XfRbxi4QFLOo2eYTrFTAtuvNar58f7lkXbS+8Tzs
	XWT4yBnsqy/XVr2X+NnD7hGNB3mBilxOwILGywQUu7mmo9afLVwDSJexGkMw95VInJ/a
	oJXRm74ZXAD6GWyB0FfZo8P/CmCIiwZ3++Zgc/Nqz7fAab4dB/bUmj4dPyT7iF+FFE+k
	3pu7Zs2FGa2QL+yfA9P000FGkvJMvUfI61K6YWRaG7TkCMR4kBbi/bQSvzsqn7l7Ecah
	/rUhJS7GGaTqC0VAFbTZkTOEbQfKfGxE9j7qJM4jdxUMmlu9eGyQXt4llmE3ktH29RSP
	TRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JCZobQQ/TzFAZmjN/yj3JRwd4qlOt7jPdGpBzBgxonk=;
	b=SXJ2D73yv066XF4HwlRZVhxx7JoWThfCFHIysSiQXByv9S/9J2BJ4lOs2l7EYxa6P/
	XizcRVc9zNMIkKpJ7BxB1LoLIZhgmA2Ub+YDzrXaIHib8Ai333Ptbjt6VqCqPKNQK6gl
	TqRucP78KYVwhRdDxzSxZj8kwEFQFEYCoY9SuO8EKQZwVilK/3ZlFAaofuTSy1JnYSqS
	2llEsddcabw9rsRhSGdpKi02PwtKgUVuW/ZqK5mu68Bl+5Gopuu878SYg383bc52LO2y
	NHuPSIBlRdjH44He8ih+fU+laKtrtj+GN2blHeoejkuxC8TPzv2FY9P/s8iOa1qYkYTV
	o5NA==
X-Gm-Message-State: AKwxytdNICS3s/pnB1B4+WH4GIATUPKKsjiAKav8wgpx9Q5PrYzD7PBf
	+lTjP3NESjmb3sK5xwNh/vM=
X-Google-Smtp-Source: ACJfBosE+HLAWDDaKzsgF5fot9PTx5SFduhsGEmjfh2Yc4G8ZnRkLVlWyZc4rzCXiK87rA0Jgjoj/Q==
X-Received: by 10.107.212.19 with SMTP id l19mr27802090iog.40.1515774103414;
	Fri, 12 Jan 2018 08:21:43 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	f5sm13083866iob.71.2018.01.12.08.21.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Jan 2018 08:21:42 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1515774102.30068.56.camel@gmail.com>
To: Stefan Stanacar <sstncr@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 10:21:42 -0600
In-Reply-To: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
References: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Subject: Re: [morty][PATCH] kernelsrc/perf: fix dependency on non existant task when using externalsrc
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
X-List-Received-Date: Fri, 12 Jan 2018 16:21:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-01-11 at 16:07 +0000, Stefan Stanacar wrote:
> When externalsrc is enabled for kernel, do_patch doesn't exist since
> is in
> SRCTREECOVEREDTASKS, so make these depend on a real task.
> 
> Fixes:
>     ERROR: Task do_unpack in /data/yocto/poky/meta/recipes-
> kernel/perf/perf.bb
>     depends upon non-existent task do_patch in
> /data/yocto/poky/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> 
> Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
> ---
>  meta/classes/kernelsrc.bbclass   | 2 +-
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernelsrc.bbclass
> b/meta/classes/kernelsrc.bbclass
> index 9efd46a..ce6c999 100644
> --- a/meta/classes/kernelsrc.bbclass
> +++ b/meta/classes/kernelsrc.bbclass
> @@ -1,6 +1,6 @@
>  S = "${STAGING_KERNEL_DIR}"
>  do_fetch[noexec] = "1"
> -do_unpack[depends] += "virtual/kernel:do_patch"
> +do_unpack[depends] += "virtual/kernel:do_configure"

I was looking at fixing this as well, but I had another approach.
Instead of perpetually changing these to handle externalsrc corner
cases, perhaps externalsrc.bbclass should not delete the tasks, but
instead mark them as noexec as follows (I'll push this up for real if
in a moment...). Then recipes should be able to work transparently
regardless of externalsrc being used or not.

diff --git a/meta/classes/externalsrc.bbclass
b/meta/classes/externalsrc.bbclass
index 65dd13ddc1f..12046d74e17 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -102,7 +102,7 @@ python () {
         for task in d.getVar("SRCTREECOVEREDTASKS").split():
             if local_srcuri and task in fetch_tasks:
                 continue
-            bb.build.deltask(task, d)
+            d.setVarFlag(task, 'noexec', '1')
 
         d.prependVarFlag('do_compile', 'prefunc
s', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs',
"externalsrc_configure_prefunc ")


>  do_unpack[noexec] = "1"
>  do_patch[noexec] = "1"
>  do_package[depends] += "virtual/kernel:do_populate_sysroot"
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> kernel/perf/perf.bb
> index 03ae446..145774b 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -47,7 +47,7 @@ export PYTHON_SITEPACKAGES_DIR
>  #kernel 3.1+ supports WERROR to disable warnings as errors
>  export WERROR = "0"
>  
> -do_populate_lic[depends] += "virtual/kernel:do_patch"
> +do_populate_lic[depends] += "virtual/kernel:do_configure"
>  
>  # needed for building the tools/perf Perl binding
>  inherit perlnative cpan-base
> -- 
> 2.7.4
> 


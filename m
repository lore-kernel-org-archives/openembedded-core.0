Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF2CD7F357
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:41:36 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id s145so5357993qke.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jh4qL08OjO5rrSzhqrD+31mG1wVoRYoA4cwS5IqOhPo=;
	b=LMqnDSw75cruhxXXijxVLNRFhrBv0d87YGNvTbVaW5e3HUi1ita4lf6OkVnnOk/TLD
	7H0/sPlmaYH9ZrOxRvUdvrgC54lg9Us/4U+MEod32UK4SRVJIW9Jq5tuknHy2uk+eOjh
	gBtuO+WztQY5gSChrUm68clfWf1an7Q5twlE0VdgQRvv//IeZvx4Lrux90DPHVdnR107
	kI8p0oxYhk7BS4Q4yoG42Kmv7JM7zdlMGhZcBFlo1LqHwWIs4ia0mAV2uonRNJ0Ozk8L
	VCgissT4jrhbALQ2+w/fKKcQV39IvdY8O8WMS+vxl4rHl8HSDoV1btmuDx2T9Ryr5vcU
	g3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jh4qL08OjO5rrSzhqrD+31mG1wVoRYoA4cwS5IqOhPo=;
	b=AA30nXBrieG1byVXnZL5Sa/jS2Tdk18dzi8bwnX9vvQo7YammtfJsFC5riUUY89kZ2
	mkkGcKo2BjfLZzOphIyH9mMC4xyJBdIEy91HksVdb/uqy/Tu9iqkhuqOTEATrGy/vEsU
	fqvugOKndsOOYd3Ax6IusGHq7yiM5ulzw9BViaNCqUSyS8bZ3tdzoFa1Yq6dwuLVDiCo
	N9wFAC06UQCUqRAGXHI6icyDnKH255ACxDjAnmvVVngPZZb2/8KjgWfz6Kxz1cttftvT
	dVCCRZrAFtEfSwyyhRTWqGDnqRVa9TAJn+cUheqM8JWuAiM0Z2dRYgXsWUMDeQPgQxta
	be0g==
X-Gm-Message-State: APjAAAUPagsO86asfZp+FQ/R6JLJ04xY7WIk8Au3t/nKxSDnoOytTV1/
	Nh1QOg4bqNKZxDD0ryUg+rYx6rZF4Xnt4PLEhgM=
X-Google-Smtp-Source: APXvYqx62VAUdmyxxCVijDapdnGXMcUR/rnvC8ZPJppDGWrkZ1ruqM3OiC3hXAMZ84Meem0ZG2lzC3+PmnBC0tt6llM=
X-Received: by 2002:a37:7083:: with SMTP id l125mr9532891qkc.71.1565977297614; 
	Fri, 16 Aug 2019 10:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190813182414.2952-1-alex.kanavin@gmail.com>
	<20190813182414.2952-2-alex.kanavin@gmail.com>
In-Reply-To: <20190813182414.2952-2-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 10:41:21 -0700
Message-ID: <CAMKF1spfsMpQLB2hpRwwiyR9MKUhmymTosW3BPk3MQPX1ryxFA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Fri, 16 Aug 2019 17:41:37 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Martin to fix a bunch of QA issues in meta-openembedded
surfaced after this change in core, there still are some left if
someone wants to take a look at it

https://errors.yoctoproject.org/Errors/Build/87032/

On Tue, Aug 13, 2019 at 11:24 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Recursive RDEPENDS resolution requires that all of the dependent
> recipes' packaging has completed. There is no mechanism to ensure that
> and therefore races were observed.
>
> This change effectively requires recipes to list their runtime file
> dependencies explicitly rather than have them pulled indirectly.
> This may require a bit of fixing in layers, but should result
> in a better definition of runtime file dependencies.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/insane.bbclass | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 35c4fdb4913..9b886d13805 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -722,25 +722,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
>                              filerdepends[subkey] = key[13:]
>
>              if filerdepends:
> -                next = rdepends
>                  done = rdepends[:]
> -                # Find all the rdepends on the dependency chain
> -                while next:
> -                    new = []
> -                    for rdep in next:
> -                        rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
> -                        sub_rdeps = rdep_data.get("RDEPENDS_" + rdep)
> -                        if not sub_rdeps:
> -                            continue
> -                        for sub_rdep in bb.utils.explode_deps(sub_rdeps):
> -                            if sub_rdep in done:
> -                                continue
> -                            if oe.packagedata.has_subpkgdata(sub_rdep, d):
> -                                # It's a new rdep
> -                                done.append(sub_rdep)
> -                                new.append(sub_rdep)
> -                    next = new
> -
>                  # Add the rprovides of itself
>                  if pkg not in done:
>                      done.insert(0, pkg)
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


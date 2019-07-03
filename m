Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id 27A806B436
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 12:04:14 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id s7so4081001iob.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z5BQo5rzetrjrOq8BAFojakRtRYj6RNC6V4SotMJ7kY=;
	b=RdIpQFC/xcNQzjtnJsBuAygBAnFo27A/MQnr0dfcvJIQGv4TbSJ/gbAD6qhVg4Vdwo
	kFoZT0wkTOHrsJYIPBSTpP/kGj3/G79q5DcEJCHUkG6i3YJsrojnzN2ZYmd0eJJ/Q4E/
	aUAP0gYrpzBGkvgi06KV2nvWtxnMBCQsW/BwUsko6LmVej9sI0fYY+1JOK6tzr8qPb1f
	b8ekzyMohoG6Tvigu1e/YNZSzRnZLxMAl6ZAj1K+ch/a5J21XW9vuuakS8ThadBx8wD5
	oIag8oNG3tVQ9r+rjVHAMeYflmr8kGjBVWuXtQ2R1xo14ebcwHtvpyqVTlrPHz+c8ZK5
	ydJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z5BQo5rzetrjrOq8BAFojakRtRYj6RNC6V4SotMJ7kY=;
	b=EMLaJ/wTDogUBVoxOc7c92crxLTMqjA4iQfY0EkW0WfJZVPvMzs6zSI4s706VxKYrq
	nNe465d4eB7k/6+Xw5jTWVQKfpPjQvkSe/U2GzizaTvDu8RcPOjHRdg5ju21CRcUfZIJ
	UYekiUh7/Vg6uIUvGmo/A7VrwfJtlVAiP+ZImr7tLMkOYeCVV9FspLaPI7UY1Y9dXiVi
	/MivSiYPMeOVTmvwvMdlSUjvRl9MtE6uM6pAk6J5Q8CTdvsFzu4bIdDySPIKHB5+NAL2
	dhqUyM3+XMug7Y4SsJk+x0r8tZUJfyXGx1Z5i3N3voTTgK2+/NiYd7ULufN6t6KI3/xO
	oeeQ==
X-Gm-Message-State: APjAAAUlb9Klfc2MG/Lz9ihtfunmu5fN6W4TOgo5RniPiP3K7Hy2pip6
	6LFeiYxNks+u6D7NYtoUCrP+aym9ZnBdl8B1BZVAJQ==
X-Google-Smtp-Source: APXvYqyQGR8eWH4Opj431bWKxVnxv2w6EyQveik0lpW+u7Gbwuveg5PcFoHsmVCsmzf6spCTLYPYeAsLo2ldcx2R+nk=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr10400487iod.25.1562155456066; 
	Wed, 03 Jul 2019 05:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
In-Reply-To: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jul 2019 13:04:04 +0100
Message-ID: <CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Wed, 03 Jul 2019 12:04:15 -0000
Content-Type: text/plain; charset="UTF-8"

Check the log for the a particular setscene task and it will show what
requests it made, and if they failed.

Ross

On Wed, 3 Jul 2019 at 11:09, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> Hi,
>
> I am trying to setup sstate-cache in Artifactory so that multiple
> Linux host systems can share it.
>
> Once build finished in one Linux machine, I uploaded all of
> sstate-cache directory to Artifactory
>
> Then I configured sstate mirrors in local.conf
> SSTATE_MIRRORS ?= "\
> file://.* https://artifactory.com/yocto/sstate-cache/PATH;downloadfilename=PATH
> \
> "
> But when the build started, it didn't used anything from the sstate
> mirror and ended up building everything
>
> Am I missing something?
>
> Thanks
> Ankur
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


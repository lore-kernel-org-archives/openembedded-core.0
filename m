Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B05061883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:58:20 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz10so791824veb.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 06:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=fnJ4XzLJ7qxPnkJZ9La5+EYPfGz6keIiecpJrub3tSM=;
	b=mbCNKLABttt3oj3+pV/56gGeXFJyLXJMDrcWGbuWicH+SuoUZhoQgMN6ezu9LFHNSn
	7xhv0HiOM7pm/rDiADRE8goTYqFnygn/HTdEtReVm+b+tqlzEdjUScOAsWXzN2zm6lkb
	Jz8Xt7TiiU4GuwWU9ALWqkTh9zE1yjwtvZ2OYXU9+k8A3/+CZDIauQXyYB2lZKuCJ88k
	HNCh29BtRMmClgi7VV46mXDWTb2BUQ8+ed/b9aurU5RoajOFYcfDLzIOeHEQrfv65kO8
	YjlNf5YEyWG62a/HHchzmu5Znix/uwrKPIziK0MmQgKOSF99KCj5UHLy473pwRnwRXf8
	oihw==
X-Received: by 10.58.219.232 with SMTP id pr8mr28826995vec.80.1375279101209;
	Wed, 31 Jul 2013 06:58:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 31 Jul 2013 06:58:01 -0700 (PDT)
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jul 2013 14:58:01 +0100
Message-ID: <CAJTo0LYoN6=JpLsFgp-O-_owoGLve2FZxZVZfqvnD1aooAbKkQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQnmsjsLhSiAe5uF0eAksgjj12Kj98itpt+vS+bgQFCoHuKe0GlwLaJIB6aQafILoBvg8omB
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/13] Package upgrades
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
X-List-Received-Date: Wed, 31 Jul 2013 13:58:21 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2013 14:09, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Tests done:
>  * build tested on AB running following nightlies: x86, x86_64, ppc, mips, arm;
>  * basic functionality for X, powertop, nasm, xhost and xranr was tested on an
>    ideapad s10-3t with a core-image-sato image. No issues spotted;
>  * makedepend, flex, git, subversion are needed during the build process for
>    various packages and were not tested directly. AB caught a grub compilation
>    issue caused by the new flex version and this patchset contains a fix for
>    that too;

Apart from the PR that needs to be removed, all looks good to me.

Cheers,
Ross


Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id B4D9E6077D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 14:48:56 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jz10so6141522veb.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 07:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9FCm1D0OgdHFaZyLXSwucttrkL82AHE8G2SkJzyRzPU=;
	b=o5HDBy7LRHfTKdVn71LqtGhVj6za10BTfOT2tfTgZ8jy9FgSe8RlbzicYnHInrLEH1
	nuBa/3CmDZ+XkFb4ABzZ54EbwJUFcLLUzjMcWSxb6iVvHSfvY9GW0uJyIhYfst92b2TI
	f4IRNOaqR1lAz/TCHr2tCGHac5SELEq4CeSO0nGEooTAiKnpuhYbOXvPAp0XiHPuXn9Q
	XGPr6DeOLLPPLlwXrla7x/NAibu6VdGu8VcC9XaYbs2csmmc7Z/6Yqbaubiur/j59eRp
	coobOqRWyeMFstYVFAKbFExMrjNabCDTvICOP+RkFWPTwDuSFSgs9+ulq4ufoQIaPluJ
	60Cw==
X-Received: by 10.58.154.34 with SMTP id vl2mr11744000veb.35.1374590937072;
	Tue, 23 Jul 2013 07:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 07:48:30 -0700 (PDT)
In-Reply-To: <ddc5bcdf8e55f13d76e2b0b256a4599912074496.1374470729.git.hongxu.jia@windriver.com>
References: <cover.1374470729.git.hongxu.jia@windriver.com>
	<ddc5bcdf8e55f13d76e2b0b256a4599912074496.1374470729.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 15:48:30 +0100
Message-ID: <CAJTo0LaLCLNXT5hEjTW6HNq+S++VvC+JjRoLtszYfMJ+HNJkQQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQnR358quX+ioCHzHWgoAM+sVfLVdaWhYGBQxJmJIqpFhQueLYY+gEksUTfuLUYo+ZxqQxoP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] nss:fix postinst failed at rootfs time
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
X-List-Received-Date: Tue, 23 Jul 2013 14:48:57 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2013 06:45, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Create checksum file at rootfs time to support read-only rootfs.

Have you verified that the checksum files don't change depending on
the host architecture (big/little endian, 32/64 bit)?

Ross


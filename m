Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 825597CD1B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 09:43:12 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x4so19103381ion.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 01:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2bruOz7uujhZ1zEofe5XbeneFqiEW0sB2m/awRkGdos=;
	b=AtvvsIJZL3oQoqJ7Nqda2ljor2NF6pdQxGSTopOGFfdRcYmGmuCHsgaTkbcfEJHGzm
	hyM8a/0fggB9qqWVziZY4UVQqRNNBxnraBLi53nw3z16bWLOBu+ANkkfAwVfjQ+drxZI
	IljSnD/SFYB0y6l5WDp+Jx3OM8txX38HJoA9u6tox9Q2PrvEdIuzQkda5HFZ+T4LLjRz
	K1rGNCnlhlxnDdtEI67Dx/Es/LspsEfYZDVn4Ou/ZDA/kYS97DFH5ns4oiMI2fnRjNCB
	4zz0ADwZQs7yxNl55Td3ya/czzhVbYlrADJ+TTvTd1zoidC/hChI6bymGn+q5tmTm/Av
	9H9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2bruOz7uujhZ1zEofe5XbeneFqiEW0sB2m/awRkGdos=;
	b=apieYikvMdFU2F5KpNknF2IJvMPBRdij3H+tfJdTp6lXa3XwQuQ+TokppKy5ep9in+
	A49G1v/0tNBXFIe0KfvqGovJnTp+XQ9SFZRVLEevyR4bciPnLd9C2Niei2zqkGjwhVWu
	gHYXaKahcv8aHrHiWCOLRQYTanPKCyb0tu8DLHzcvoj1I+u9iOlal8Cxcj1wrN67gzlC
	jAeD/gJiVo1Xa2NJKzw6emBEFH2xV6B4ylJWTuE/qkxKjIxAwhvnHnAOalEqReaMEEt6
	XhTqRwYpQ0XGBHV/jbCdekMFiI0uhBASRpFvYu674MDz8GlQvzlbyM0jgH2g6rN0P0x8
	q3EA==
X-Gm-Message-State: APjAAAX3LXR/RUDhFvYpSTMnAHnOAoLPX6Fiz5UFZjYfNViCzjEgB59b
	OvURTEFGo+9z0ik0NvxkhXfGTQaup1F/yOPG4jZWdA==
X-Google-Smtp-Source: APXvYqyIzOVX8LszEJj8GZBe54sB7uNw/36EQZ+8JIWM9rHYmIasai0a/Hix6rmLXy0P1yRskgn9Gjk6zQPv18zQ7V8=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr2108636ion.20.1551433393473; 
	Fri, 01 Mar 2019 01:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20190301091032.2745-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190301091032.2745-1-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2019 09:43:02 +0000
Message-ID: <CAJTo0LbZnzDqX5y-B8y9q_4Ymeox3FR3n2bFqAXu4zzo72F2KA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] at-spi2-atk related upgrade
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
X-List-Received-Date: Fri, 01 Mar 2019 09:43:12 -0000
Content-Type: text/plain; charset="UTF-8"

Those are development releases, as can be seen by the inherit
upstream-version-is-even in the recipe.

Ross

On Fri, 1 Mar 2019 at 09:11, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Upgrade at-spi2-atk and it's dependence.
>
> The dependencies are as follows:
>         at-spi2-atk[2.31.2] depends on atk[>= 2.31.1]
>         at-spi2-atk[2.31.2] depends on at-spi2-core[>= 2.31.2]
>
> Zang Ruochen (3):
>   atk: upgrade 2.30.0 -> 2.31.92
>   at-spi2-core: upgrade 2.30.0 -> 2.31.2
>   at-spi2-atk: upgrade 2.30.0 -> 2.31.2
>
>  ...i2-atk_2.30.0.bb => at-spi2-atk_2.31.2.bb} |  4 +-
>  ...-core_2.30.0.bb => at-spi2-core_2.31.2.bb} |  4 +-
>  ...001-Switch-from-filename-to-basename.patch | 38 -------------------
>  .../atk/{atk_2.30.0.bb => atk_2.31.92.bb}     |  5 +--
>  4 files changed, 6 insertions(+), 45 deletions(-)
>  rename meta/recipes-support/atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.31.2.bb} (80%)
>  rename meta/recipes-support/atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.31.2.bb} (92%)
>  delete mode 100644 meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
>  rename meta/recipes-support/atk/{atk_2.30.0.bb => atk_2.31.92.bb} (86%)
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


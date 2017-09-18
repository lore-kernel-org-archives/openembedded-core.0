Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 20F16781C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:51:38 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f84so405274pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3s+IpyWZGP+Avk7rbtCYYJm+xUyAL6E+YumN9kO4tJ4=;
	b=b/Zc7OPkaQVClKUZgy5IowRwKMrbN0EHWd2W6W4RyVCmvHhXtfhS0PYIX4Cm3sISLl
	8jzMrhJ5eVnyyJhPkfGiLkSIBgaFuKVNnuVywkokj95nWs5hzEYV0flwE+gzdtDq56Q1
	Lnq1dG7gIfqZ8gxrHj8KsgOXkxVpW/1dK0x957rdlr5gIgHAt52oAzl3UK1n+KNx3EzK
	jTpPuq2mgJkqkbxH3zRveXcmodPPkHzBzlKLf1xJC7qWGEja8z+dKZBsHE66miHLpR6s
	NT+LMAmUrj5Ewa+S7bRhpUEiJRWVZUbaI3DNGxUo4RhYSd5C7gs6Ss1U1L3GtGMwiJhb
	129Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3s+IpyWZGP+Avk7rbtCYYJm+xUyAL6E+YumN9kO4tJ4=;
	b=ZG4dYaumqXKJQfpwyhzIyvMWtQNJ4u6gj2FO01c5on0SwTgzg1Q/va8pv5UGM8sva5
	z+npoLCQVxOZo5b7SZuNN70YLAl1KfKe7ZC/jCAY3QUEUvtHwUagrTJBewp85pt99GRt
	aMg1cX/hl+boByRmntpv1eG0ZepR80BqK5H3i9pM+K+Sx5XmqRhrzeTFzxDKi9sqEFEc
	RufMeOJnaoYjKkyAnzHIQMjhPYZJmrytweHVkOp1LRYdRLtHZfB27fckHqbZQShxr+W5
	P4pmvIwzBijoeqUVkeIfgPXF3pNbO1tTHL1dsh2yN1kk+l0pjQnfRnmsVmJk1CLTQjup
	DLEQ==
X-Gm-Message-State: AHPjjUhP0rOtMxsGiJUtAMSHFGw5HMSvHGPj6c6ZmXdHnDfiFaaQKi/H
	7U8ZH6SwplhTQA==
X-Google-Smtp-Source: AOwi7QADDt5i1BJsMeKbvIfqkyuVNvxskcXmcqeAdnilzY+qTcKJihOaefGjGb5yXT/TXdDo9ijUYQ==
X-Received: by 10.84.160.200 with SMTP id v8mr20557987plg.9.1505753500143;
	Mon, 18 Sep 2017 09:51:40 -0700 (PDT)
Received: from apollo ([2601:646:8882:b8c::a20b])
	by smtp.gmail.com with ESMTPSA id
	k73sm16480540pfg.81.2017.09.18.09.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 09:51:39 -0700 (PDT)
Date: Mon, 18 Sep 2017 09:51:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: liu.ming50@gmail.com
Message-ID: <20170918165138.dv6vgaradorduiuq@apollo>
References: <1505738586-28217-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1505738586-28217-1-git-send-email-liu.ming50@gmail.com>
User-Agent: NeoMutt/20170912 (1.9.0)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] init-ifupdown: RDEPENDS on procps
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
X-List-Received-Date: Mon, 18 Sep 2017 16:51:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 18, 2017 at 12:43:06PM +0000, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS
> on procps.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> index 733ae41..8774386 100644
> --- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -35,7 +35,7 @@ do_install_append_qemuall () {
>  }
>  
>  PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
> -RDEPENDS_${PN} = "netbase"
> +RDEPENDS_${PN} = "netbase procps"

busybox can provide the sysctl applet too. Do we take care of that somewhere ?

>  RCONFLICTS_${PN} = "netbase (< 1:5.0)"
>  
>  CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


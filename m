Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6BEB7E620
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 06:31:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so7829635wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qIPo3oIwoIUobwBFh6ezF+xvMYmHJYtQd24gugyTdIk=;
	b=KSJFEdkxFe9UIs91wwxqvcPvkZTFG87cOwN0cRdhwPjx8mc7DtHvFX6Vm+bB+qOQsh
	upnpnRisPUE1i8NpBXsAKe3MyyPub+tHe6WeZPfL4uC55cWkP/Vroh9U0X24UopkGmA6
	6fanZwa3maOtoD9sLzjyEQGUB/sSkX6z7lnZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qIPo3oIwoIUobwBFh6ezF+xvMYmHJYtQd24gugyTdIk=;
	b=LoHExe5u+JQlLzkrl1azEp7uLr68zi1D0XAhzTDz6JU+kV+I/1YbDfLc09MkZ247sF
	rBbViaDdxUkzXSbm4Brha3onEmlveg5y4X8bK2cG3mpsxHHdga/alJCqaBAvkmNuG94K
	cjRM3JgPD61zB7FUqVSXuyILGy8FEjN5xm8FaDFEOHo1a8TvGfhL36lqpEcqWFGCxrD3
	xO6+t+ivhfqlDqL5beP2/iICMdfvcq0QkfRYhaI5wjMT58Iragqs9HXoRtlQTDUBqwXg
	+Hdk9uqoCZ8uM0iBQmJQZ2oyP2LhV0yUA/B+4gniR01Uy2eToO88ELRZOSQDTNW+VUwP
	oAKg==
X-Gm-Message-State: APjAAAXcmnyjM8vjcm7uU3vhM08qPADr9BpQU/jI0YiSrvZMMmwh5Alm
	upqmLGGJDDsrBkIeQAlY46vb4Q==
X-Google-Smtp-Source: APXvYqzEbKJptdYIb+NYZSjelvFhkjsZztaiwcCh5zOM3hj5+Hk2V2vLoms8uZuvoKo9OlMccgjOTQ==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr9360484wrv.61.1559370685452; 
	Fri, 31 May 2019 23:31:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u204sm11219977wme.28.2019.05.31.23.31.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 23:31:24 -0700 (PDT)
Message-ID: <fff0fc5c6076dac037928042f3518549c9a89415.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 01 Jun 2019 07:31:22 +0100
In-Reply-To: <20190531155612.75663-4-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
	<20190531155612.75663-4-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 4/8] gtk-doc: upgrade 1.29 -> 1.30
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
X-List-Received-Date: Sat, 01 Jun 2019 06:31:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wrote:
> Source-highlight support has been replaced upstream with python3-
> pygments.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch    | 6 +++-
> --
>  .../gtk-doc/{gtk-doc_1.29.bb => gtk-doc_1.30.bb}            | 6 +++-
> --
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.29.bb => gtk-
> doc_1.30.bb} (87%)

I this this update caused a doc failure in libpsl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/655

Cheers,

Richard



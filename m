Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D868860B85
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 16:10:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f7so10910522wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 09:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=K1WWZG9264kFwiJrGw3Wq8IqUlnWPGUqI6YtHefEW2I=;
	b=OBYx3mrYpU/zvA+63eM0dd/2eKwbKL0znQ8TLmRRhhB3/ncbh4Nc/pR6RhcetujJBx
	2gVwSr56qX1ENW+VGAHL+NFRlSZyLeO7pzzfyawltUzUfOvtUHSQYmp7MzaPSnVMAzx8
	wydyieGlMdxUz4CLAzbc/C8e0/iRxN8ks78p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=K1WWZG9264kFwiJrGw3Wq8IqUlnWPGUqI6YtHefEW2I=;
	b=W/Ag2jVsGWdh24cDA/JsnrIWIoHcm8ZrnxyOFxgZAFBHD4+SJSw9rb6Ijefnn9BasQ
	t/Uy3pzoGNwMJgkuV4A/sJfmsIrIX9NL58UVZ6IsCdty1P7UWGDAoS63GkibCtd4/dD1
	1YAkLiMzumn6vG0NYFtkHGwy7BBz0wZUHXjiGVjfxqBebH5oXX1qxn428x14r1UNm6NA
	XIoSKYXZ7dn0PWx9qXxU7xeDuqNysJh6UjZ8XPCQb5jGTHzkxsuuQlFTkI3d66d7AdiW
	C+jUuIADkOvQxnNbBE7c/Z/deBQx5V210J5M7XxPoTjHja/xq9jCImkRLE4/vCoIkUgs
	dzkA==
X-Gm-Message-State: ANhLgQ3gmv1RZnZ+Nfi6pn5/z3H8UJP8eTutcKUPJPPcx7LaUGBiRSpF
	yXm6n2JzKwL8Q3lDwXFKVb/huw==
X-Google-Smtp-Source: ADFU+vvH8F3zP7u7e70bNVauRu2BZcs4JzR63WK8pzwCuAIiN/EaoYVcxo4lj9+ZjDq+9jaSSiBFXg==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr11522005wmg.146.1584115824444;
	Fri, 13 Mar 2020 09:10:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p16sm7989917wmg.22.2020.03.13.09.10.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 09:10:23 -0700 (PDT)
Message-ID: <0aaac991c5634577b000a3e62f0ec5e59ddf0e1b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 16:10:22 +0000
In-Reply-To: <20200312230238.413509-1-raj.khem@gmail.com>
References: <20200312230238.413509-1-raj.khem@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] musl: removes aliases for glibc provided libraries
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
X-List-Received-Date: Fri, 13 Mar 2020 16:10:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-12 at 16:02 -0700, Khem Raj wrote:
> From: Jan Kaisrlik <ja.kaisrlik@gmail.com>
> 
> Based on the recommendation in musl mailing list[1] All symlinks have
> been removed from musl recipe.
> 
> [1]: https://www.openwall.com/lists/musl/2020/03/10/11
> 
> Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)

Breaks SDK tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1697

Cheers,

Richard



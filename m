Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id D86A061BD8
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 19:12:58 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id l36so1428316pjb.3
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 12:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=45sdCmcBxTxkKS37bOQGDOA30ysBGOIcKnHNYTl+OzU=;
	b=EyK6y2iXTSPyZcg31nk04T6YKKLmWFGXiBHfOQUwRdx0vFFbKi7DSTuDgwFhK33LnO
	SB5G2xc2STeI/7cWADaESM7g6edWgwqkn1QMpv1HZaeycnWcC/Dwae0JuzWQBaGU0A0z
	01R2KbHg2S+s5c2bqA0FZhnfmuO2ZmE1IZu3Wl6bSjKtsyfyvNjO4eFF05Gtd9u7DCVy
	IYe82DoYclc/OIwhho60+6B1/evWSoyaYML7aQa/GECoI6aX14XzgSd6RUR61O4YqH4I
	bhba6AZOjKrA35eQtU5W++tahWHGOzdtQEh1G/F5SE81IpPNYfpQVDnvFCzes0rOpsWX
	1kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=45sdCmcBxTxkKS37bOQGDOA30ysBGOIcKnHNYTl+OzU=;
	b=JwhkpNrR2QZ3NAgMH0342MaMMD/nbcbhrXvvTTnLY6s1vwDi/S53ofQN4FtHkk1hZA
	9AAociNhM2c0H9q93f+leVwhwPYMHdOGvM6VFSeOSjC874vSm7J/K7tRROTnQD7YBOq6
	12u3SiHnaJgYRFRhxHvkugLUQYDCTRAdseUuzfAdmfoLPfK9VNQcbKnlIJVkmwhhZxmo
	MpwBdRoaCddwPHO7vG4WN41yGkkiNp8IRFbSxX6kNmF2Z4jHWE/jOdt/lPlN9T4hZiVy
	B+KQMWT6EyMczBXthWHdso+qTI4oSfvNauxx3zUKj9RpYPW/gccAT6kWxhRSTIu1HAuP
	j2VA==
X-Gm-Message-State: ANhLgQ141L9GXViN7Yo2ITAZYbQL2D6FPv2bkReJMrrJkbYY6HCVwYBW
	YDcc9L4/flNFcaBOf9BlClgtewCgNRo=
X-Google-Smtp-Source: ADFU+vsdALrqyQYFsgKV4Ih9HSQ2Um5T16mZQHRutY8CHypSxXEpnQK7+hBaA9zI5vVKoy/WAF2TjA==
X-Received: by 2002:a17:902:5a44:: with SMTP id
	f4mr4350606plm.306.1583953979487; 
	Wed, 11 Mar 2020 12:12:59 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:e8b9:f87c:18f3:1405?
	([2601:646:9200:4e0:e8b9:f87c:18f3:1405])
	by smtp.gmail.com with ESMTPSA id
	c17sm10615554pfn.187.2020.03.11.12.12.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 12:12:58 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Armin Kuster <akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
	<350496c3c0b80835cb5311aa6dbc91e4ee7b5935.1583893499.git.akuster808@gmail.com>
	<20200311075133.GA30580@localhost>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <762da0f1-58a0-ae85-936d-43bf2ceb27c2@gmail.com>
Date: Wed, 11 Mar 2020 12:12:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311075133.GA30580@localhost>
Cc: openembedded-core@openembedded.org
Subject: Re: [zeus 06/16] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Wed, 11 Mar 2020 19:12:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/11/20 12:51 AM, Adrian Bunk wrote:
> This patch is required for switching to gcc 10 (which changes the
> default to -fno-common) in Yocto 3.2.
> 
> AFAIK there is no benefit in backporting it to older releases.
> 

I tend to agree.

> cu
> Adrian
> 


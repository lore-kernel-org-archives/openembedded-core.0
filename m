Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB173783C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 20:44:01 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y27so8210531pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=MJbBrV6zgm9cutU/L42uoIXUw0szP12nEgMnTh6MAhU=;
	b=X7Oa8Iso8LLmW8R5sVVi348/8OzHI0Fw5nENvGLsUQ5WqkC8R5knCN4cgWX8CaD4Dy
	TJpDRcJmfY1wGcP9n1l+CzHx8nlE3ivoa/ujiNu7AfCUb2aHTqgQufVzV9ug/AaYFwnf
	/tGWa1TrJOxwpTWZU6gwuixxyPQ0GKmLB3rycta+E1wQhZxsb9lNPjSXtN2FfDNO4qWX
	Cpgb621n8OvfXUIpP5VBAveIbZaZ+0WqtEp7aMSH4VLQmwLrKxi3JRP64CRxS0qzp7bw
	UWflkBDl6LcQ5/2jgseDIoAbpexpaCweY6Vt/3h6haTo62gWfpXmGIW4QepCLeuMHw4h
	2BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MJbBrV6zgm9cutU/L42uoIXUw0szP12nEgMnTh6MAhU=;
	b=Fxwt4Mli6HfWyAsVOwEXdgqEuDM/zadxTAp2AyvVmonn9Tg9hLEg0CeJOVPrYke7T4
	tBsLJAx1pmunodkGrxWBXVH+JeKx2NiO8Bc/KAD9MZvnSn5KJnlkUoSvQKSq8QbvgyIE
	Lk3dk5rR8JmJULSfNVGq2z5dg3QU2HGJkiUy1S98HNo/eIX2lY2ea9QAAb0Wt3jQMOFR
	NJv6NWdIfcmYw8ziXqbUlUHmTty2z/RG6djeOK6iizliqHt3t3ZAm6iKA42blnw1XS/c
	1ddnHh0vGnsksV5yPhOs72MElZHdHBxHVoN5lDJPSbO/U9p+8Di+Vl5gXGP22kNep29q
	5nuA==
X-Gm-Message-State: AKwxytfoICf3rzsrQHWjTWRBkZSW/zODtGU0sfrsWYasF1KFljF1pEa+
	O6zCnM7CSJOy/Kwnh2LAPZMRib5L
X-Google-Smtp-Source: AH8x224FiGLq2fuM0zWyemspjSdK08ivkZ1bJR/pw68rJrr/tU72oAwwZ3mjQwzLezGFNzjy8wWfoA==
X-Received: by 10.98.137.75 with SMTP id v72mr31779600pfd.189.1517345042470;
	Tue, 30 Jan 2018 12:44:02 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:4c3e:ac59:6e73:b998?
	([2601:646:8880:466c:4c3e:ac59:6e73:b998])
	by smtp.gmail.com with ESMTPSA id
	g77sm35925209pfk.49.2018.01.30.12.44.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 12:44:01 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1517302719-838-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <ecada64a-7ea8-1082-d118-d5ad719eb1d4@gmail.com>
Date: Tue, 30 Jan 2018 12:44:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1517302719-838-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] ruby: 2.4.2 -> 2.5.0
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
X-List-Received-Date: Tue, 30 Jan 2018 20:44:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/30/18 12:58 AM, Huang Qiyu wrote:
> 1.Upgrade ruby form 2.4.2 to 2.5.0.
> 2.Update the checksum of LIC_FILES_CHKSUM.
> 3.Delete ruby-CVE-2017-9224.patch, ruby-CVE-2017-9227.patch, ruby-CVE-2017-9229.patch, since it is integrated upstream.
> 4.Modify ruby-CVE-2017-9226.patch, since the data has been changed.
> 

it looks ok besides see below

> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc                |  4 +-
>  meta/recipes-devtools/ruby/ruby/extmk.patch        | 16 +++---
>  .../ruby/ruby/ruby-CVE-2017-9224.patch             | 41 ---------------
>  .../ruby/ruby/ruby-CVE-2017-9226.patch             | 15 ++----
>  .../ruby/ruby/ruby-CVE-2017-9227.patch             | 32 ------------
>  .../ruby/ruby/ruby-CVE-2017-9229.patch             | 59 ----------------------
>  .../ruby/{ruby_2.4.2.bb => ruby_2.5.0.bb}          |  7 +--
>  7 files changed, 16 insertions(+), 158 deletions(-)
>  delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
>  delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
>  delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
>  rename meta/recipes-devtools/ruby/{ruby_2.4.2.bb => ruby_2.5.0.bb} (83%)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
> index 9a52a69..fd3911b 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -8,10 +8,10 @@ HOMEPAGE = "http://www.ruby-lang.org/"
>  SECTION = "devel/ruby"
>  LICENSE = "Ruby | BSD | GPLv2"
>  LIC_FILES_CHKSUM = "\
> -    file://COPYING;md5=8a960b08d972f43f91ae84a6f00dcbfb \
> +    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \

what changed here. Please add a note in commit message.

>      file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
>      file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
> -    file://LEGAL;md5=daf349ad59dd19bd8c919171bff3c5d6 \
> +    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \

same as above

>  "


Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.1407.1615997162697414916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 09:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=gih/tsa1;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id F0BEE5C00F0;
	Wed, 17 Mar 2021 12:06:01 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Wed, 17 Mar 2021 12:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=Yp7j5/pFF3Iq+QW5xE+WpgZaL65eBrH
	QsSPjTfyxZKY=; b=gih/tsa1+qQd0kQAS7o6op/W76ifloY6ShzSn+LentHerek
	FgkgABYpHAlyYurHakUL9a12z3qNwjTivKNaza4KjmBuuQuKzZ1+LIbgERxKOHuY
	iodHQR1NxO9DsK58tDAKTa38o6G5+VwedpPxXNygBgxHxFq1K9PK62MyVCC/WGQd
	3vEEzF+7uzm9+rup9MP52QLKA9F0Yu5BwLIYtlcxnJ4S85zueagdmo7f1/yccGU6
	g0piosjWQSZNJAEM4i8Nr81ZvOB8omor0ju84crYC9RtV8Y5FhBGD4dCoQ5lFp3n
	wQbHKqUcDyD7A6f6zz1L67n1wKwMd6BQ4xgpBFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Yp7j5/
	pFF3Iq+QW5xE+WpgZaL65eBrHQsSPjTfyxZKY=; b=tCzMsRSBI8NaoPT18ykQT7
	ZZnubxgwZ/9w8uME0q56vUPvynuDlYB35vk/VTYD6ygz+1bqATK9S9KyP6HMung3
	+KPTvF5ClLVYGrlcp4/uoG/R+ppk7v4ZFZJShsNrOTnm0Az8OHkkgrjOySEmZOVD
	oeca1AFen5z/HEoJ6pGRfNlVEpFPHyG4gTmOhPIln7q7veYs1NcJTitjfq7ZyZAT
	raVICzBIEySBxdyqzrDEvkwjh71PAp+SflWo6ptiWkFq+2y66nVO88Nwo4alT25y
	houif+oZ0PsEwxFv+9QiwWqjbwCploDApazSPsj4EjgUjxcVrlVNVRt951dce/8w
	==
X-ME-Sender: <xms:6ShSYIvIexvLZD1s4Ir9JqeIp8sJasgBmbjnPXYwONP6GRkPG7NAPg>
    <xme:6ShSYFdh-5tvWYGfp4P75WgRFFc0uoSOi2I1tSn4zNM_gd4pINvYuf4Dv8SjAUgje
    UfKWrnFLe4wbB6Z8rc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeffkedtleeffffhkefffeeuveejudetveejtdelhfevleeuueej
    geelueekgfffveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhii
    rghnrdgtohhm
X-ME-Proxy: <xmx:6ShSYDz0EGn1vCCaB9S3SlJ-G8ixdXdFTK3BdGW1kcTAOwJb7CC4-w>
    <xmx:6ShSYLNR2WvSjb9WPGbcNnmtNzXB8I5Rkepz-d8jZPtPR6v8UNCQTw>
    <xmx:6ShSYI9fNvJbeP12UTzTT-XgfPh6dyzKbca0sSx6amvdHB4Tb7FnxQ>
    <xmx:6ShSYBLIM8cWGiDcHSkYZSOk4S1rn1jgN8UHfRJB1IllGF5Y3fgSGA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9E1891600A4; Wed, 17 Mar 2021 12:06:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <7f78d5f7-86ec-420a-9f07-753437c41010@www.fastmail.com>
In-Reply-To: <20210317003155.1368207-1-raj.khem@gmail.com>
References: <20210317003155.1368207-1-raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 16:05:37 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>,
 openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Reduce stack and heap sizes for jsc on musl
Content-Type: text/plain

Hi,

On Wed, 17 Mar 2021, at 00:31, Khem Raj wrote:
> Fixes
> 
> [YOCTO #14281]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrei Gherzan <andrei@gherzan.com>
> ---
>  .../webkitgtk/musl-lower-stack-usage.patch    | 51 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 
> meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> 
> diff --git 
> a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch 
> b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> new file mode 100644
> index 0000000000..3d66766d9a
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> @@ -0,0 +1,51 @@
> +reduce thread stack and heap usage for javascriptcore on musl
> +
> +default sizes for musl are smaller compared to glibc, this matches
> +to musl defaults, avoid stack overflow crashes in jscore

Tested and it works as expected. I was fixing it a bit hacky doing something similar to https://github.com/yaegashi/muslstack but this is cleaner.

I've backported your patch for dunfell too (rebased the patch).

Andrei

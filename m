Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB25F7C752
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:12:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d17so5940109wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yv1dgWi8dQlq+QRDuNag2WoFMBcAprwYQihX4uVPko4=;
	b=bgFscf0JedcYUw90MHclTH/UuoickULjhJa9uCLt1WWUfw+pmtdNp21fKgv8UJ0gWX
	qeCMQzY6RvWZQKBeCbRKiUiRBRT2CimuHznOweywGe4OxMYXDN6v1U5rg1FO8QwN3azJ
	aofxfSu7TosmAmV8Z3V3QeQ7SdZ8P7ZUrwIV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yv1dgWi8dQlq+QRDuNag2WoFMBcAprwYQihX4uVPko4=;
	b=F4rCxecqi0a1RrJEWxtheJML2gZYtpU38q2phKtKOCpjYXmyEIRgMs4i1BXfuJZSR7
	W5Y3fqWRfjTON/WADhunu+9cTa8SM2wNY0d1f3gbHoex533L0mmUMSfc3EIDev5szq8C
	eUwIeYhfMp/57DPYBp/7udRkAVsmeAMsLQ/PVaukFvQHYrGPIyefgOaKL3bINhrqRgX7
	3OF4N6A7I0afLQ1/fIy5KQj7cWyS7AUpNQIHS2lqfUB7qhOH1Ga+AzMX+Wq44AluIysH
	sQ80G1xMAZTHr4sdN7UfI9byInDEiiMt7FgU/eF81EnT8D+6L6EhXfgkP92ALCpZgQGI
	0Fiw==
X-Gm-Message-State: APjAAAVCzkDQWe7dyRaxfN6RrlfK4GWyoPUzs/iSJiqrUIdmuPrvDVZV
	jxqZSQVP6z3fjTVF+Z8WuZapNw==
X-Google-Smtp-Source: APXvYqxZu6PqnLd6I989bVVrsBEydrai/DxAbtRJpbcsRVZmCbquWYgB//fv/svDKBokEng5zbxcVQ==
X-Received: by 2002:adf:9103:: with SMTP id j3mr12888714wrj.236.1551712351210; 
	Mon, 04 Mar 2019 07:12:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z8sm5576004wmi.28.2019.03.04.07.12.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Mar 2019 07:12:30 -0800 (PST)
Message-ID: <7c24c5585f8aa25ad636da1723f20610df542ce3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Mar 2019 15:12:29 +0000
In-Reply-To: <20190304115835.28288-1-ross.burton@intel.com>
References: <20190304115835.28288-1-ross.burton@intel.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Mon, 04 Mar 2019 15:12:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-04 at 11:58 +0000, Ross Burton wrote:
> This isn't a git snapshot recipe but a release that is fetched over
> it.  For
> clarity, put the PV in the filename.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/libcomps/{libcomps_git.bb =>
> libcomps_0.10.0.bb} | 1 -
>  1 file changed, 1 deletion(-)
>  rename meta/recipes-devtools/libcomps/{libcomps_git.bb =>
> libcomps_0.10.0.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb
> b/meta/recipes-devtools/libcomps/libcomps_0.10.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/libcomps/libcomps_git.bb
> rename to meta/recipes-devtools/libcomps/libcomps_0.10.0.bb
> index ff6820851fe..1c4f3bde65e 100644
> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
> +++ b/meta/recipes-devtools/libcomps/libcomps_0.10.0.bb
> @@ -9,7 +9,6 @@ SRC_URI = "git://github.com/rpm-software-
> management/libcomps.git \
>             file://0001-Add-crc32.c-to-sources-list.patch \
>             "
>  
> -PV = "0.1.10"
>  SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"

I suspect we have this issue in a few cases and having PV next to the
SRCREV may prompt people to keep things more in sync?

Cheers,

Richard




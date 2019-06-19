Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 934BB7E785
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 21:39:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so826287wru.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=71tvzzZFFCDBYyLEsxGHm4grYAvZzB/Fq/HrAQD4bOs=;
	b=VbYIginrKQzMWHRqqhzn75ojps2pl+TCLRi+octHtCDi7gSZZx2+8I0SXT9AZ2aDLf
	fDQvBx6s+JNpGEEHU10NV5HWprw2QeAq59sMJkv82KZQXI/nqMfr1t0xG3TKjEOg55WD
	6WYYy6a0wLjO2oVJ/cyPBoXTV476ybWy6jHiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=71tvzzZFFCDBYyLEsxGHm4grYAvZzB/Fq/HrAQD4bOs=;
	b=j9T3zXOawdi1zpX7IpnRZdB4UYMOmvHtmSTjfiJNObubi1aUcNZkE6Jx3arGcqY69C
	jL5/gkFjOGMMNORqgi88IFU21GRvxqFT4yia2dMAiJWTspypg2ns40i1Dx1JM0EvnGie
	Adzvy+8L3GxSgG2/uA3ezjUd2lcCsZYklAY/obA2AGmWYhnxpPJ3N8uB1xkupLdCg/Wv
	Ox91ckFCh5ijRdOLss7pE8Zn0Os2P4phpgAjwN6wS+gA6fH7CLA/05EtIR1WT7NUh5T9
	vbJUDlNXtBGW7XGTuUoYtR0qoktmwPI9TbLVu1Qc8vDYDR9qKpfuMcw9djwoqQv4mORd
	amUA==
X-Gm-Message-State: APjAAAUrHEuu0nAmB5Na4uUqkhefQVCeYcak/vyOlcxuRoNnF/Uuvkdq
	jBE5welMd/q4vG/tD373eQhHKA==
X-Google-Smtp-Source: APXvYqyZbiIDDup+rsxUsxK5yL9JhLUWwnW61aOfncwF+E7WxMb4M5B5ygd+oB6F4NzabYIQzPZgmw==
X-Received: by 2002:adf:afd0:: with SMTP id y16mr89754795wrd.22.1560980361332; 
	Wed, 19 Jun 2019 14:39:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g19sm2915223wmg.10.2019.06.19.14.39.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 14:39:20 -0700 (PDT)
Message-ID: <4613a7cbefe6f6a342f33e129834e5cc10f30fc1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 22:39:19 +0100
In-Reply-To: <20190619212647.23685-1-joe.slater@windriver.com>
References: <20190619212647.23685-1-joe.slater@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] parted: change device manager check in ptest
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
X-List-Received-Date: Wed, 19 Jun 2019 21:39:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 14:26 -0700, Joe Slater wrote:
> t6001-psep should check for device manager the same way as
> other ptests for parted -- look for an environment variable.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-extended/parted/files/dm_check.patch | 22
> ++++++++++++++++++++++
>  meta/recipes-extended/parted/parted_3.2.bb        |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-extended/parted/files/dm_check.patch
> 
> diff --git a/meta/recipes-extended/parted/files/dm_check.patch
> b/meta/recipes-extended/parted/files/dm_check.patch
> new file mode 100644
> index 0000000..bc0e95f
> --- /dev/null
> +++ b/meta/recipes-extended/parted/files/dm_check.patch
> @@ -0,0 +1,22 @@
> +parted: change check for device-manager
> +
> +Other ptests use this method.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>

This sounds like something which should be an obvious/easy fix for
upstream, any chance we can submit it?

I'm hoping we can get our patch load down a bit so pushing obvious
things to upstream is good...

Cheers,

Richard



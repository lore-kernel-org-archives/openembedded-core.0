Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EFEFE7CFAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 23:32:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s15so366784wra.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 16:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=R1MYFdIgR+KQkUR7l22rjo9F2Uw5iNPwePHdf9jsypg=;
	b=bzRM37MvWkmJzTrqoxq4lwmMc8UrsBjNzvy6rrD7KVwrAqhRt8yiNWY7SoitiqnOyh
	zaeW28lIIl3uaCpEnwlW4gIAodKvY0VjmcXhpT7US8qewoUBvg+sjZfO6sOVSMEpIaRm
	hyJgd2Z68XEFrdWcz1XjivqqrPNERMcPRT3hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=R1MYFdIgR+KQkUR7l22rjo9F2Uw5iNPwePHdf9jsypg=;
	b=o2P+DzBsVfPujjmVF3fRwJCeZChGwitV0DEMhCEq9Lc9anXNW69opZUCCGVN3KdYKj
	yRtcSuQ1hKkLfOjUbQzopT8HaHQO8cvf1F1ZCYyvGxEG9c8327SAky/DUgjyMdHYPiAj
	k/sxCpJitXeqlCnn0jcjEy05RHXR/QSS9xMMDG8LUikYzj82qQElRDXnoDMvxstSiEsQ
	+eLKoHLimvVV+6bG8NQJQ5Qs8mZe1c0PWjxU7Bk+KbKBcloi5QwycQgIuHFePRTxQ739
	8chp52zOwFVkHQnoUXI/AFcin1/C13jSeGishuv7pj39w4IZw/YbU4MgjtKj9aVicTt9
	UHCQ==
X-Gm-Message-State: APjAAAXx3/IzQV68RQuhwSu1CaRfREUjtoWuXNWpnQrKTWT8oCe7BKX+
	B0sVQHzAqq3Fn6LzsDJXhw8+PtN1QcAGdg==
X-Google-Smtp-Source: APXvYqwm7Zm0LOEpHh8ZbEICA9T5tTxA6Zy2IQClzMaug21+pu11eKD6PAXeDIOED+VL5akze2ZigQ==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr4099128wru.33.1553211150681;
	Thu, 21 Mar 2019 16:32:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y2sm7639062wmy.38.2019.03.21.16.32.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 16:32:29 -0700 (PDT)
Message-ID: <5b0bba9dde47bff3dec243a7a3d39e12c6efc2a8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Liwei Song <liwei.song@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Mar 2019 23:32:28 +0000
In-Reply-To: <1553138356-85237-9-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
	<1553138356-85237-9-git-send-email-liwei.song@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] oe-core: add ledmon to support Intel VROC
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
X-List-Received-Date: Thu, 21 Mar 2019 23:32:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 23:19 -0400, Liwei Song wrote:
> This add ledmon demon to control Intel VROC's SSD disk led.
> 
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>  meta/recipes-extended/ledmon/ledmon_git.bb | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta/recipes-extended/ledmon/ledmon_git.bb
> 
> diff --git a/meta/recipes-extended/ledmon/ledmon_git.bb b/meta/recipes-extended/ledmon/ledmon_git.bb
> new file mode 100644
> index 000000000000..77a620860cab
> --- /dev/null
> +++ b/meta/recipes-extended/ledmon/ledmon_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Intel(R) Enclosure LED Utilities"
> +
> +DESCRIPTION = "The utilities are designed primarily to be used on storage servers \
> + utilizing MD devices (aka Linux Software RAID) for RAID arrays.\
> +"
> +HOMEPAGE = "https://github.com/intel/ledmon"
> 

I'm not sure many of our systems have this. Would this not be more
appropriate in meta-intel or in some other layer? it does seem a bit of
a specialist use case?

Cheers,

Richard



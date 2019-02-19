Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE7C47C8F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:35:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n19so3501136wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ffDSTLdEutuMQXhIR5UMNudNjk+n8KuSCWUM3G+5wb4=;
	b=FHTlPrFaRZ3eFrzp2PurYUzuqsAV9eGyAO5UTGtG7GV35SSs9uMoJdj1uEqGB1cwcM
	cUra1vcnHC0IMCKyvxrUmaOYVHGeaV+w0CBy5H8Ru/ljtqsilkuvrUxuNESU5vE3eKpj
	WPt3/RIIo8KMXrUaQwFrCmpU+BL40jrlAxj0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ffDSTLdEutuMQXhIR5UMNudNjk+n8KuSCWUM3G+5wb4=;
	b=U7FBqpdwrnKY/r11RbHj0Su+MdsU2H4AMRvMBwJ3lYwNd7oCMiULU+msl6Q70+Ko09
	tjmMGYUVzl6d6cw/8FarFj/7hEAXeHuLA1hUM8tw0DbUbtKS1GJJ5Wi/OP9Vc9etO8OC
	P1vDlX47ad7yT0Bt7qdP0jNk3vAKzVFxAngvIIf/OtLFy1l1vjXVBuzzZ8H8zyCRhV+K
	aHFdTml/1n0FRY9b7mpj6ZhriwARj0azFmv/4kBhhDUQULWmYpJDEFok9f6KGYQzZzsE
	xVmZTcbER380qbd1mKdjpb9WBiYo2BH9mCdruyo8qUYZV6O2WplCm/F2ubGqMto2mV9A
	fMuQ==
X-Gm-Message-State: AHQUAua0AH98ZtDpKvROU+ox1HVZUQrPZZIRzGeYVE571tcIQScTkufB
	W/kUurjZ1pOGiGHcw85jEumbNg==
X-Google-Smtp-Source: AHgI3IaVDq3qbGnIhb2WoJ2y7NopxA0zd+ydYlURDdmsAgODqUAr6l7YvgzyRAV5IHwpWYeuBAtwpQ==
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr3377910wme.137.1550594126073;
	Tue, 19 Feb 2019 08:35:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s127sm3191933wmf.39.2019.02.19.08.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 08:35:25 -0800 (PST)
Message-ID: <6ddad18f22efe93d86c8ead0bbb0114e861fe9e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "C.r. Guo" <chunrong.guo@nxp.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 16:35:22 +0000
In-Reply-To: <1550555410-24852-1-git-send-email-chunrong.guo@nxp.com>
References: <1550555410-24852-1-git-send-email-chunrong.guo@nxp.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] glibc: support powerpc e5500 and e6500
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
X-List-Received-Date: Tue, 19 Feb 2019 16:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-02-19 at 05:50 +0000, C.r. Guo wrote:
> From: Chunrong Guo <chunrong.guo@nxp.com>
> 
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  .../glibc/0031-glibc-support-e5500-and-e6500.patch | 564
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.29.bb              |   1 +
>  2 files changed, 565 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0031-glibc-support-
> e5500-and-e6500.patch

I'd like to understand whether this is likely to make it upstream and
who is using the powerpc support in the Yocto Project. Do you have any
information on that?

Cheers,

Richard



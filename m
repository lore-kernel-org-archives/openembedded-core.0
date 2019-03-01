Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EEE2F7CD3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 07:59:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i12so24823856wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0D5Qss2Lg+ZyiwPToSVLrUe86LlO1M9N0+kjgTJdhZ4=;
	b=eoiel9hMg3pwuxaSVV5CQwpnoo4c63Q0aVtReK2QsdlSJ19WIUW/+7Z0iIGX7pI93n
	BObPRPzvOvTCdFvpOt61lGiYDfwAM0b2LmW+i3rJfTtVjymgiuy0hF11rVxEZD4BemYl
	YYjG5+hMVRTrqZXLFJImYvnt5FmwzHu4ubdDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0D5Qss2Lg+ZyiwPToSVLrUe86LlO1M9N0+kjgTJdhZ4=;
	b=Ifs5LwqyCIWpl9BwxGENPrRkr0aT6cs02ZUwAbv0BSOAJ2xI7CACfN6n7uMNUL6MbV
	1EXTozJHUIBZgfRVhFqfhmq6AtfnlUsPitgUyKDoDyqjWW6tuE0VyZUIgZ5kqsbjHMKR
	OD1k9Cx1GLx45xClknpmZIKna7+ut/DT0aqhaIQh3UsG6uHdhEfeA93KgiSmB6EY8ulf
	c4lh8u09U0LYv97c8sM3fHSbbqsbG88ETs5NSazMPpxwCUgoH09gA49m0I5Y6LmgLC/k
	FWJEM5d9ZUTABNP4lrE8EDut6J7PcCvy1sG9M2e8kB+S+dYII6048U1D8WMORikq1hGP
	GzDg==
X-Gm-Message-State: APjAAAWl5FvG5kiSDf5q13kWNks1bekj5pEWxV1qwWPEctb7Bj4yXP0S
	0TdTHTv3Cq/Cbp9ELG1AKnaJ+g==
X-Google-Smtp-Source: APXvYqzaiRnSPDkLo6N+P+8Q3gJYv2CPc0D1fJhtVc04t9idbqi7FmvreD7j0aJR6EyVISPRW7Jdtg==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr2239959wrs.212.1551427196612; 
	Thu, 28 Feb 2019 23:59:56 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x74sm11840891wmf.22.2019.02.28.23.59.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 28 Feb 2019 23:59:55 -0800 (PST)
Message-ID: <daf2e50bbe180729f8d64bb8dfd1147bc46af6b7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Date: Fri, 01 Mar 2019 07:59:54 +0000
In-Reply-To: <356c0ac2d21b8e45341bf703ad8d43bef5fd0e44.1551418113.git.bruce.ashfield@gmail.com>
References: <cover.1551418113.git.bruce.ashfield@gmail.com>
	<356c0ac2d21b8e45341bf703ad8d43bef5fd0e44.1551418113.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Jon Mason <Jon.Mason@arm.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] linux-yocto: qemuarm|qemuarm64: graphics support
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
X-List-Received-Date: Fri, 01 Mar 2019 07:59:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-01 at 00:34 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Integrating the configuration changes from Jon Mason <
> jdmason@kudzu.us>
> to enable graphics for qemuarm/qemuarm64.
> 
> Note: we are also remapping qemuarm to qemuarma15 in the 4.19 kernel
>       as part of this graphics enablement.
> 
> Note2: This requires the machine/configuration changes also sent by
>        John to have working graphics.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 5 ++++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

I'm testing this minus the KMACHINE piece (commit message suitably
adjusted). I'd suggest Jon add in the KMACHINE piece in his qemuarm
patch so it becomes a bisectable change.

Thanks!

Ruchard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4415160B2A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:03:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g1so12272536wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+5VPWQmvUSx/eeRWRWMMM2PEQoYSJv5HqtUiSP7S42w=;
	b=Chf78c4XKjgJM+iMp31R5htJ5aFnyCZe3/IXnd7yALCx2AUqihibTCYB25J8bRZ2/P
	yTW9NaPJ6tzeHgUD9iCU4KRa2r81DcU0wvT5mWeN5IGZkNwMy5CYa5uEKhNokzZM45yk
	UccguYo415bnbuGE41VuWOIQNTqZg4nEqUwZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+5VPWQmvUSx/eeRWRWMMM2PEQoYSJv5HqtUiSP7S42w=;
	b=TqpRjoxNjo+5t6DWNS27cN6ije6Few3bzfElXzMyRkVOVyleeqNO2DdLCkI6aXJeLa
	5YE0I2fSPjsJjdFPThADwnf5eFgNRzTiAQw44bTsWfoQQ5DEj2sriZVDpAZgCCQ/3cVH
	3O54kQ0YBqa8zPQv/dDwUJWlfLoH5CgFkgpssA8kM6aFls/DanuaLOGWT1HWyzi4DS2t
	FQz9fqTzy4I6IUWMJ8JhyKVEAyA3bCOL45qM+Gq5b9fTPoMnDiWD+m553+rHjw2y1k8M
	R73OsJmUWcbgFx48RiQSyXQNSHb7GLmiGDal0dh+af5lVRW3ryz55KuchB//awXmhXBr
	NELw==
X-Gm-Message-State: APjAAAWiuUq33Gcpo8tTJy/F7lLda/AdiUn76eCiqEAC1VVA16R3fIpl
	vZ3lMZsvSNXUTr4V+Z6q/lQ4ag==
X-Google-Smtp-Source: APXvYqxBWOsgvU0IJSA9JWkptX/sBZ/9O0bA2KembXBcPGgJmCLFdemENrsu1So6WynQc3VN+1QzEQ==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr9177030wme.141.1581753822529; 
	Sat, 15 Feb 2020 00:03:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t131sm10431597wmb.13.2020.02.15.00.03.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 00:03:41 -0800 (PST)
Message-ID: <155c3162bea87286fa7197de2de0ba66dfc8c1e6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 08:03:39 +0000
In-Reply-To: <1581723869-21232-3-git-send-email-wangmy@cn.fujitsu.com>
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723869-21232-3-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Sat, 15 Feb 2020 08:03:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-14 at 15:44 -0800, Wang Mingyu wrote:
> libgpg-error-1.36-gawk5-support.patch
> Removed since it is included in 1.37.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>

Fails on x32:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/1547

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03C537E055
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 10:26:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so6945694wms.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 03:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IVot61mF2pHGaQxAOnXy8+hDUjIWQ2Rrqhk0X8+XtYs=;
	b=Hq+4ptm/HQwr5FOKy3g+Ka3mTr5/m2D+R6BDNl8au3jxPc1qoj5cxnxzz/YeflOSwP
	1Ip+SLHXc6KCN6Fa2tt3mqE58xvb2+R8H9PEFVCc/+mHnadBnqVE4OQ08oPav/2Nn56P
	uRo3SsEJ7f/HubHKBGCeBzLA+N+zGikcAQDBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IVot61mF2pHGaQxAOnXy8+hDUjIWQ2Rrqhk0X8+XtYs=;
	b=gtfBG6hF6m/8YRxgEq/q7sGLPx1edjf4Sj4jBtgLotFedO7VbrluvRFPMuMaJDGyBs
	tPs874UZTkGMvmdT2iQ5hIEmtu4jmdVibmjlz+RV6YfV0EX4m+ZSXeyJ0iiU2Bke6YEd
	XiFXCFZbOG4wNGrcNSUmoG3jNr9matVwI96nqYcWp54JDIo1R3jprEhfkS2Pja1+YpmS
	3ZjDig5Ii0I7TZmNtxp7A67Hk9KBbUmWX+KwwCrSUGhoyn5H5MYarU8QeWDwql0bRoK/
	O+XePbLB3LHab/RivdVapF7tzjdPgKBZGqWgzv97rbGCFTjiJkAtFYdmIPICxeAAEDzE
	iboQ==
X-Gm-Message-State: APjAAAU4se9J0iFoaR2juQxqQ8GwWUMybl/DFVRsl3YSdW66jubspOm+
	UgBgyaYRzkzYuGKW/ofVE2OXdLQgKHM=
X-Google-Smtp-Source: APXvYqzUHlsyWC0RtLbf8PWwPd0kWAEx9prV2dNEBpLLiGvImpQbhGWr6QY09KO3jS2QsuEcrZn0Ig==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr18126695wma.27.1559643992704;
	Tue, 04 Jun 2019 03:26:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y5sm1351043wrs.63.2019.06.04.03.26.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 04 Jun 2019 03:26:31 -0700 (PDT)
Message-ID: <cedd7e708edfab28ec9db8046476313ea44a6022.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Date: Tue, 04 Jun 2019 11:26:29 +0100
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF128DDD@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF123A0E@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF128DDD@G08CNEXMBPEKD01.g08.fujitsu.local>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Tue, 04 Jun 2019 10:26:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-04 at 08:29 +0000, Lei, Maohui wrote:
> Hi Richard
> 
> This patch is necessary for dnf-nativesdk which has been merged. But
> this patch is still ignored.
> Do you have any comment about this patch?

Basically I really don't like exporting "random" variables in the SDK,
particularly when the meaning/use of them isn't clear.

Whilst I can guess why, its not obvious at all the dnf needs
MACHINE_ARCH. I'd probably be happier with a better variable name.
Which code exactly is using it?

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC0B7CF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 13:35:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so80224wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bBxCUxeSAuYdidoi5X8xKuN0CL8+2x3GhNexYE0Ybbo=;
	b=RpTf8tmx+DwVP9MWSgOOb1QNKZ2trbb3wQdWJ47tmA1giZdn/pFoV1Is0seThEFPaQ
	NHOODYRcogYtO/LQwbfUEM5afuc/JAIAl8kO2plGi95fC5Sp1J0eCWvpueWO4tVy8rsw
	lZO9n3oZrd4apJvHipIMlgWkIhMmm8umIHxog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bBxCUxeSAuYdidoi5X8xKuN0CL8+2x3GhNexYE0Ybbo=;
	b=dyTO2vv41ODS1bajgVD74aGybr4FLn2m7QjUDxLDVcQu3gHiAw8Yuu48rWUJbJtWyt
	I0P/xIsJrwITSkWqVDzLVWTAIHxx8eYbL3PThrqo8ssbAlJqiaObKv0HdMzNAM+4BDRJ
	OZkc/hrbVPDxYvumA8Zb0oHLtwDdPMzMJeZqpdbOvQTJdwKJJviCHt9K7d54sExrz2Z5
	8M27VUdaM259qXgnKrTtbFbuA2HeelAop7QUubX/9SYAO5x72bNZRIEiX1KO9CnJQ9QN
	jPdy991dAfpB2vOYgeU8/w6jtN/APeR3rudeeS2J+YPZBBTmuBn7pkx3yPkJ4esp/8ao
	F0sQ==
X-Gm-Message-State: APjAAAVqXBK3xJCkxyLBcydDBv5YwNDWoHe7/JroPs51w3Lt9Gc24sZf
	+P/u+AAY+lpOXd/r+xdA88IcFQ==
X-Google-Smtp-Source: APXvYqwDtc/lnYENl7BJIvPKN5mLjHosxz5KOWKFb4o3YxyJmaeE5wq+SJN3J505Zj4jg4Ad20LX1Q==
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr2570487wme.48.1556026519388; 
	Tue, 23 Apr 2019 06:35:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e7sm6316253wrp.19.2019.04.23.06.35.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 06:35:18 -0700 (PDT)
Message-ID: <582e5ae68be63214ad48c3320185aa117563d81a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 14:35:17 +0100
In-Reply-To: <1555166150-57588-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1555166150-57588-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] dnf: Enable nativesdk
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
X-List-Received-Date: Tue, 23 Apr 2019 13:35:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-04-13 at 22:35 +0800, Zheng Ruoqin wrote:
> Make dnf work on nativesdk environment.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/dnf/dnf_4.1.0.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Patch doesn't apply against master?

Cheers,

Richard



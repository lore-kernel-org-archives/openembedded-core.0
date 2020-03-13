Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4070861C9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 12:27:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b2so5615988wrj.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=cFoDFJxe46qHm9T3gSRbJPlih9p3LEVYs9La2W9DG40=;
	b=ZrEmIlItJ+7RdCe5CJR9QzzvyG2qTX7I39kt9e7AgCU506ac1Lo5oFiBgqC4fhAuG4
	D7Twea1z2bLHeo5Z5nFCotKJICAnUVLvZSWAaeUpZNsVCR6HEiTuI7/lC+zXPQ+VtsDz
	AUdBpdrz+bAcwXeZoQ7bSafp0+o9kCVz7Itpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cFoDFJxe46qHm9T3gSRbJPlih9p3LEVYs9La2W9DG40=;
	b=HNr6DH1xV0b290uCBjCr4fkRQxzPoZpQv5/qD+QYtnzxswKLMI9EaQSksifjM1ooQb
	2Sv2eac+Wpcy0EIwkfFJp2mLfV3Ncefc4clTzXbWedsrNdTi15kVvQHoV0FbGV6i51rk
	COcmJGmM1fgQnhy/J5wvEqwCyWJ3SPYy/2RYYs45w6sv/1Bh1qdAL3fE9TYbauLSb7K+
	TwLLxnS6xJhaQUwZNyUoq1VmTlPBdva50WxYgfZh31F7IzA0Qo+NuPEW56LrIwY8mYm9
	cmZ2u4TT4xcjUAPnMdhLLN3inBu1KPg4QIfuQu/51TkOalcz55r4NRnMQt5csjqpnnlM
	lBgQ==
X-Gm-Message-State: ANhLgQ2yd3Ric6oepBGqFFdox/8v1Wh10OC66jAsshlDZtBYiqI9bUVB
	8HNak+AoVt/eIhaHYNckreDWkQ==
X-Google-Smtp-Source: ADFU+vtdVqch5FkzMSaToknpFcanbyGKXqMsW2pLgn5iqMYLCIcr7FX1XSq+r/uqtozPB5cFfCBBhQ==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr17342800wrl.184.1584102476661;
	Fri, 13 Mar 2020 05:27:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o7sm27441383wrx.60.2020.03.13.05.27.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 05:27:56 -0700 (PDT)
Message-ID: <8f52d0044ca78ef655eec2113fca67eeed7f6963.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Mar 2020 12:27:54 +0000
In-Reply-To: <20200313081516.GA24555@localhost>
References: <20200312230840.751166-1-raj.khem@gmail.com>
	<20200313081516.GA24555@localhost>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Upgrade to 9.3 bugfix release
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
X-List-Received-Date: Fri, 13 Mar 2020 12:27:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-13 at 10:15 +0200, Adrian Bunk wrote:
> On Thu, Mar 12, 2020 at 04:08:40PM -0700, Khem Raj wrote:
> > ...
> >  ...le-sysroot-support-for-nativesdk-gcc.patch | 187 +------
> > ...
> 
> Why was part of this patch removed?

It looked like this commit was dropped:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=5507707f0d36a612992758dabd58d68a72ab0cfc

unintentionally. I've added it back into the patch in master-next.

Cheers,

Richard





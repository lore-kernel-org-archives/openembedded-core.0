Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 201717E719
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 13:53:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c66so3204054wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=73ByEi/ZTLm9wPTj9W7t8khaq5bw3G2GXeFEQRjp0ys=;
	b=XiNMRYA2PabaYjlQI4jVQf6BDnBI/NmrLIILndCWOU6U1vObVOFmo6J5tCw8BRX0Q2
	l6bPZj5l+xMxu/FSaqfDt0txC16mim8yU8/VaMcpTDuFPByqhK9zjHzR0LYFaCYvSjR5
	SDbioQwiwYjC5Mcda33bpqJejqVdqp8u2ONVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=73ByEi/ZTLm9wPTj9W7t8khaq5bw3G2GXeFEQRjp0ys=;
	b=ecM30bDHuo1JOnWx7zzhXdDZu/zbOK5pgwubT6IKwp0n0ArbZJM+zvxu9bPo+PTcv9
	zCj58MJiZ4WELKB8DWj/0BG642gsgDUp136v8NZmTmdW4BvIkVAm9p/gEdH9cmCg/mqW
	jJlAqt51Qfp1LRpxzFUMK67rVFVnBBZ91E1kysJSm2uNldHnHZQHijWzvlohWbM8fmXB
	G7ME9oyklb+KvLL1Qc3Sr3eh2JFUEJtq0G1UWpy0tI7sHH0W0NYtEq7XKn1kyiCocfXY
	9DUrII0RQKO0Faq2DOHJu5u12nOZymQ54o6xm1cu8NYs9sPFCi+QrFU/mVzm+yz3Jkz4
	kNoQ==
X-Gm-Message-State: APjAAAWfhTixduf2drrpRAFRMJssrDvS2JQBiroS8hggTdm3CxY0FWcO
	Jo/WTwlfzP6qL6MKfMAwr9d6Pw==
X-Google-Smtp-Source: APXvYqzweheRwU5iqUSkU7laHF+7/QqaJsbt9Rv7SOunpXQkqs3JIQOjzBFbUkA+unQxMGivvCem2Q==
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr2978409wml.126.1561038838736; 
	Thu, 20 Jun 2019 06:53:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g19sm5430727wmg.10.2019.06.20.06.53.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 06:53:58 -0700 (PDT)
Message-ID: <3b30ab5eae1506d44fc9c95543d7ae833018c087.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Adrian Bunk <bunk@stusta.de>
Date: Thu, 20 Jun 2019 14:53:56 +0100
In-Reply-To: <fd9aef39-bbbc-f6ed-e9b2-37009952e3ab@windriver.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
	<07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
	<20190620091913.GD27107@localhost>
	<fd9aef39-bbbc-f6ed-e9b2-37009952e3ab@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 13:53:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-20 at 17:58 +0800, Robert Yang wrote:
> 
> On 6/20/19 5:19 PM, Adrian Bunk wrote:
> > On Thu, Jun 20, 2019 at 04:46:16PM +0800, Robert Yang wrote:
> > > ...
> > > Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think
> > > that we
> > > need something like virtual/gtk to fix these problems totally?
> > 
> > GTK+2 is mostly obsolete.
> > 
> > I just checked the GTK4 sources, and there it is renamed to
> > gtk4-update-icon-cache. Based on that I would say that your
> > patch is actually fine at least for now.
> 
> Thanks, I updated the commit message in the PULL:

Please resend patches rather than updating the branch as they get lost
really easily and also don't get reviewed properly this way.

Cheers,

Richard



Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFC671AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 04:36:16 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id b81so177109016lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 21:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=ElnIheqOhaQIEn6RArsfpON+Z63bKhPCWN8oL47KgTU=;
	b=KrtIc81Qua9kE4hmDWLnJUt7HGDO6KBe24g46vz/yg9b2/4u2YIqGVZgc6RMndcN9R
	hlWRcw7B+ohRbG9k04/j0KQjEXQs4Vlfz7Q/+cgnCmAJlx1l45xr9Wk91GY1rXOFLw2l
	Ne641Uq518+Zk8i80hgrdhSOewTl+V8czReUO7mZP22wwIRqosRboVxfGYw6Eon+Vy1V
	jYSMMPCCQKXobB8/y7xY3mQXx+shOAUCqDESCkVLq5I7jfNxY4QGX5Uw9Ay2Zi0WPm8G
	E4LyPhzIh0ULrh5vvouBEnfV0ybxWAaduo/ofp1VO7Wf7eLVRjYKFHn19RWxeXa0XlmL
	4pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=ElnIheqOhaQIEn6RArsfpON+Z63bKhPCWN8oL47KgTU=;
	b=htjlBfdISkbfeGg2GYbPQXxJbLLz2+W6GdMQcPSlrIZebjh/TQYdaOwYxrI0Uv2uLz
	FdYdZzJkkZg/ptoT5tWIqUYL6aat2aj34y0MdPnmv61g6ABIhfrqQ8vaEYMgOUdipbO0
	SxNRzViRxwH+290zKUfXUj/M/XuZv7ku/eWNcoeAPRUJeWi2zWxjDvAuHbXut51TjhyP
	Z/yQuMhy/r7UNOxBSNEPlOT60uEnXoxY5fuQqJKaqvVD5AgnJu42nz/cRKOS/drcEgNB
	5FvCSKhY8wFszyv42OwFrHMMJCcETMdCzFvqiWY+Mi2JiJVvLGO5S6+QHpmN2IRAht4O
	kY/Q==
X-Gm-Message-State: ABUngveZ3vOTgfqwE+oxnmxmow76E5sStEq9tlvH1KR0BvO880Y516KfJIyYweNL4YG7cg==
X-Received: by 10.25.153.149 with SMTP id b143mr6228165lfe.150.1477283776902; 
	Sun, 23 Oct 2016 21:36:16 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	h138sm2648747lfe.24.2016.10.23.21.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 23 Oct 2016 21:36:16 -0700 (PDT)
Date: Mon, 24 Oct 2016 06:36:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Message-ID: <20161024043614.3gqmsqpu2h52tnpr@ad.chargestorm.se>
Mail-Followup-To: "thilo.cestonaro@ts.fujitsu.com"
	<thilo.cestonaro@ts.fujitsu.com>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
	<432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
	<1476944666.6754.1.camel@ts.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1476944666.6754.1.camel@ts.fujitsu.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161014 (1.7.1)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain and meta-toolchain-qt for specific image
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
X-List-Received-Date: Mon, 24 Oct 2016 04:36:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [161020 08:36]:

> > what is the advantage of such a recipe?

> The only "advantage" what made me using such a recipe was, that I want
> to have the normal toolchain AND the qt5 toolchain in one installation
> package together.  When you know another way to get both together, I
> would be thankful if you tell me how to do this.

Well, have your image `inherit populate_sdk_qt5`, and then call

`bitbake <your-image> -c populate_sdk`. That'll give you the standard,
image-based SDK, with Qt5 in it.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id B068A7D5A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 10:48:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v11so1509487wru.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=OS0m8icEZIlVtysX/BwXw2dP+j8/U6HMsUwMvDDBpb4=;
	b=DL/y4yxaZeYrZkR8gcVrUoGWUcrquRqsxA6/9Tweg7vsapDwhShpscaQ3cQ1C1P6wj
	iAjMfgGiwNi6YknMvjtZurY2TE+MxXRxLCNhGFks4HUnZqESlAzSHTjGsTb3HA+vL4Mx
	aa/BB3F336stnmdc0/IVgqU3ED94amph947oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OS0m8icEZIlVtysX/BwXw2dP+j8/U6HMsUwMvDDBpb4=;
	b=QziuRTevSSG0bj1C5VEhJOaKaTP95YFiR78g7302ilOU5ztJMlxtmNk//1so5pcdu6
	LSyeX4hG9+BnnLGokZyNkBMDmTQRis205E12x9HEMvoSKQ8Czbd1kEXKjWV9KiAGIB+3
	6BmsALXB6WBPhbpMmhHkH/bPCYZ22bv4iUbcHQp9rnU2dBix0uavoUvMS2pU9vsh3Sfm
	wJ1BbIGBSCQXOUgNY5v2b0RDbdQ7f7S/JUPie182r3k9qB3tkFrNu/c3Bm7KvnLdKkLD
	pWHKKDUglSwDiZWtbmgxGsmi+tORj9IqO8RiXaHJpaVZ2f+zVhqZI9z3896n28lRh/XF
	oxKg==
X-Gm-Message-State: APjAAAWrgq7J/CpumIgpe64ial25G5sVXtRFocyQ4Z7RTWm12Y4wP08E
	s/sBJhE9O+A2NLGFusd0BF8oqA==
X-Google-Smtp-Source: APXvYqwbeMpZ8G/HuGKfMHeVib/WeFwFabzxA3IBfLe/CNNe+SyeGiOqqrKV+J37ILwpGL2UxIQvYQ==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr1354944wru.125.1557226103460; 
	Tue, 07 May 2019 03:48:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	91sm22048616wrs.43.2019.05.07.03.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 03:48:22 -0700 (PDT)
Message-ID: <92e3b103977d63c437fa5ab667e1d1ad99900e58.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Tue, 07 May 2019 11:48:21 +0100
In-Reply-To: <CAJTo0LbJghj1jokkpoKz1xwg+FTUckUMSxZQsWsj0wvgMFc2eg@mail.gmail.com>
References: <20190424051620.10065-1-open.source@oleksandr-kravchuk.com>
	<bdd177a6-9d65-ed60-cb2f-20fea4effbea@oleksandr-kravchuk.com>
	<CANNYZj9gNDaNgzx=240=thj_QA6h0Wrs_qvwfSabun72-r-Pog@mail.gmail.com>
	<CAJTo0LbJghj1jokkpoKz1xwg+FTUckUMSxZQsWsj0wvgMFc2eg@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ell: add recipe
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
X-List-Received-Date: Tue, 07 May 2019 10:48:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-07 at 11:44 +0100, Burton, Ross wrote:
> It's sitting in mut, I'll prod RP today :)

You can prod me but it tested in -next over the weekend and merged 1.5
hours ago...

Cheers,

Richard



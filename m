Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id EBD237F815
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 17:45:04 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j42so178718wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 09:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=8jqcsecBcIwY+cL4SuoU3xAQANVICuWpwvjLD142o9s=;
	b=WZkkAp6oBzGmROgotO+XOqVOZvR+DpypmH/MKXD6gJ5kAQND1E+4Tj7UpPygk14TUg
	Shgt0bYguLoPUcZ4+hncv4ESw/Y9UoGqbaXuNce0GlFfXTl9k1f80L3k8zq1GDLS1iu+
	/0AmG8nlFpWLMb7vllMgn94qWJg6CV9YGPgNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=8jqcsecBcIwY+cL4SuoU3xAQANVICuWpwvjLD142o9s=;
	b=rFyiu5ZlFtpGdoi3vYtTrH/NzVjJ3NV9XBcmdlpIhtoMZgenKAihdkNGKJBnNbd+7X
	7NS6O4G9nPFRuFzT+RWE63wGfJ4KQmx46yhbGbktymOY0HeqjHxZg1UpKzgcf3YZLFE7
	QsEZOHcXC2MxYNbnOJieS2P3821Ijn3vIX1jjDciv78QS1j0RKixnnyuBIY4T1u9qXoz
	06JE8ZlaTyZCNPkRy2a7FYjz+6STCZRt3BvJ3fzqTc+XKlyNF0Pj4Wmzs04a4/5vwhOh
	gbJBhV3B6g6s+3T7Cvf6hk1Zk33rTY6j3r5WLqVtdC1uflQ37cBVj5tgtXK4gCdLTxOT
	uC6A==
X-Gm-Message-State: APjAAAVwRYPF4EEmJtKeLLx5+yZmI+XBDK+OPuFRXhj20lkXQB/Puv+E
	Nb7DUFZ3OKkZa/MsTqq5LxGR7t0In2k=
X-Google-Smtp-Source: APXvYqwfA3UAiea0Vd49w71omkkpX0EklJc00GtebXmYITWpPnYMWlKMdoU+UQqM9ux8jNtYNoYU/Q==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr5738585wrr.265.1575481505216; 
	Wed, 04 Dec 2019 09:45:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w8sm8091239wmm.0.2019.12.04.09.45.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 09:45:04 -0800 (PST)
Message-ID: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Wed, 04 Dec 2019 17:45:03 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: OE-Core python minimum version requirement
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
X-List-Received-Date: Wed, 04 Dec 2019 17:45:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just enabled hashequiv's server in local mode by default in poky.

This causes an unintended side effect of requiring python 3.5 as the
minimum version.

We had thought that the servers would be 'rare' and a 3.5 version
requirement for that was fine. It turns out a local server is also
extremely useful.

The code needed the python 3.5 async support and trying to write it any
other way is a nightmare, we need that performance for the server.

At this point I think we just give in and require python 3.5 as a
minimum. Any objections?

Cheers,

Richard



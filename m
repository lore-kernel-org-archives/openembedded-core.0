Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9607A600BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 17:19:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z6so5038171wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Uo4z+OnLwGogMyibB9CgNBiYU32xdjdLpcqN0ERTgVc=;
	b=flGE+udH35Ckz26q7LQselGGyIxr30UpHCWgaiTWfwOsnQCxgfUZFUFr/Q5te4VZ1i
	IeilTHIYcgvm0W7/kzF+4LFV4kE9xnM24sNFjiqUUSksIFEeYxamnpwlYwRItIfqshiY
	CZt6elJ+T3BRoRfr5i+unlQmlA/wqHO2UTvLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Uo4z+OnLwGogMyibB9CgNBiYU32xdjdLpcqN0ERTgVc=;
	b=Agtw/1Kh4iYUGDco3YVArU6+UdFIiXj6V84aW9hu3X3EXLQPOBDmJ1ykuIYpr4gTQI
	5sPWLwvtjWsPmF6+xlc/YC1/OREVdgSBrr0K8uOUFROsLOHrwSaUdf88q7TvPBZgeMMA
	tVDSUq7J8KZ4EwFJcyg7j5WEuEz1aHJV2C/x1r+X4yWFhowpp/JkCOCnjFpF/fl9/bAD
	OgJe1bVBbFerJReCApNPUKpSGZ05BGNyVE31x+lGs9UJ3E+sgf4FzeomHMYMdkROYWr1
	Ohl+PrZ/iIucBYG0Rmm3RLQhGllaJL7t18/bdxliB9HOLWXDm8igR6anYRANR6xjk474
	UI2A==
X-Gm-Message-State: APjAAAW5WiCORILqKHnW2THSB/YGDkz+WFe8nlOUdAppco0HdlaUaV+c
	rBvAJ2biRrdhe5/lveSGaYXSXQ==
X-Google-Smtp-Source: APXvYqxQsE5RA95NuoyBf+sWcgYL2pQ+hJWDjP9k9ocJqM4xaYIAdThWtuTvS38x5WJx1ELjQF1gug==
X-Received: by 2002:a1c:6502:: with SMTP id z2mr81583wmb.119.1556126350331;
	Wed, 24 Apr 2019 10:19:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y17sm13163968wma.8.2019.04.24.10.19.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 10:19:09 -0700 (PDT)
Message-ID: <ae421cdcbc8c0b4a5ac66da108134f0d8a18c90d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 18:19:08 +0100
In-Reply-To: <20190424163415.126844-1-alex.kanavin@gmail.com>
References: <20190424163415.126844-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory: call a dependency parser only on actual dependency lists
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
X-List-Received-Date: Wed, 24 Apr 2019 17:19:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-24 at 18:34 +0200, Alexander Kanavin wrote:
> Previously it was also called on filelists and possibly other items
> which broke the parser.

Thanks, that fix makes sense, I couldn't see the wood for the trees! :)

Cheers,

Richard




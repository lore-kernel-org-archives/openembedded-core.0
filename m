Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 11BA571A86
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 19:32:24 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id j92so8935056ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 11:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZJjjOQUFyYJXki+jnKZ6gz8ReQ2z23rB3qANkOJA4Xs=;
	b=SzJSEChc7VWfhsFfhC/Lzmp1tL9UGvtinTzN4vsVc2M7Q6mf8EVIP85HzwPxgRCQBo
	s3q9rOENn11Az0tSr9zbJA/f/103C9Vje9KbHAc2MbsORGflm43TQj1ReN1Bn5JTgpsN
	QFgg8Oj86KTWgou5g6d1KtDZtK2H5W5Xwh0jl6b5cGx5yJ/Ni6D7BSYKt3OviEew4GL7
	+Tgxla5TOX4W5m0zhlGgLrt2A1U9zCyNpjXehJx0t/xxXpIqGNsZ0YEuFA15fccHuWfF
	YAgjUiX5lBeZR1CXAg2J5M33bIplg7TE+AXGt9fyiVE+tVSb+7WEczKzalXYPgc9GR4U
	rpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZJjjOQUFyYJXki+jnKZ6gz8ReQ2z23rB3qANkOJA4Xs=;
	b=RLY7bHWiPapbzl7L30VgO3OOiXxGoNGeF/Go/Q+8vORlMZn2mM6PwojL1VoRbj0XxR
	yHdl+TXmTSG8Nz3IAJLfq/1FYBrQY80dFsHxzy3IT/oAX//vX66n/GswBuWGkNzrO1L2
	IHBD2dRs/jdBQlAS60ibZ0cd3bG7DKngdN+cVuL4nRB8274uPjwsv6TcyjDZv0GUMNrP
	peewDLo3jUCs+3FnoWe4iSiI+WYiqfqkGfR3zBixUFzBeZJQRxxpMzxB+SWNXRWZxuPb
	9ODdhGPwLkoxPL66Ev4aglbJw0Qd88hXQoi4xAFEy6PCiuci1AzaREy7Q1oZss/GlTcn
	Flgw==
X-Gm-Message-State: AKaTC03DD2lO3ygRkTJnxN0qFNVCqC+3rVxZexGLZ1Ei/YsgJTXeyx6mzdNQPTMD5YgZfw==
X-Received: by 10.107.201.209 with SMTP id z200mr51643723iof.220.1481052746108;
	Tue, 06 Dec 2016 11:32:26 -0800 (PST)
Received: from openSUSE-i7.site ([45.72.150.99])
	by smtp.gmail.com with ESMTPSA id 2sm9553851ioz.30.2016.12.06.11.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 11:32:25 -0800 (PST)
Date: Tue, 6 Dec 2016 14:32:16 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20161206193216.GA12058@openSUSE-i7.site>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 06 Dec 2016 19:32:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2016-12-02 @ 04:09:21 PM, Bruce Ashfield wrote:
> This pull request is mainly to fix a couple of bugs that were reported
> on the mailing list recently, but it also includes some kernel version
> updates that I *think* I sent previously.

Thanks Bruce, I've tested these and they look good.


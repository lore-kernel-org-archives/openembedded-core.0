Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0667F989
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 19:56:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b3so4432842wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 11:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=NDP2CWbuu1Kj1AzdY2YNPs0qLWzL5E30po2IErL1o0A=;
	b=P8s7mNnGq3d3xXNNwPTulDEpmyxbdyrJ8vs3TptEV2eAkKYjNCLdo34VUeQq1tLSnk
	G6SaGIgkU2kQMQ75IgIZf6hvX4Qt9FFdGwpQDq7yQgf9qsbifx38/L37yFLgfe2H0PtC
	5IJot23128Exgf8zml7TgnPzrXE73xa3GITA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NDP2CWbuu1Kj1AzdY2YNPs0qLWzL5E30po2IErL1o0A=;
	b=rpx2keyvDwTIijlXOcUNCuYVcrHvLpN2rJKIhTsKq+jOubkSNFTWJULQ48ko4wP4iC
	Zsu1TzWVeSOJ3vxtjwel6NTqJ5fHGJc72DkFMAjrTQgLa2d4jzEXxzCg44mo8IJON+H6
	GctCjqcmuYm3/Q0H2DuI38GCdioQcLDHr4AnvTkz6s5vtaUEJXLujpZ745BRwsjlGTcu
	/BKAEBYA3rxLGUPA3f0Sb8DEbzdPgb8aZYI75wh7QOet/J7aIIjRAEY+dTaAJtf1dRzr
	3lSJyVH7E0NkB+SRKcv0aRXF3ju1h37P3cvszZxWLMSUJOZQW3pRKe1s6YnEO7VCojF+
	SB2A==
X-Gm-Message-State: APjAAAUntbTHCTReiihj4+Ge8wH3nk46yxM8tMjp84dS57w7Ie/s34Ku
	muzdWm/4A00YsGzAvp+ro5G7UA==
X-Google-Smtp-Source: APXvYqzkCTROCiC2JkmGyCXB0D6nQ3fjtK8cZbyAKIZ+ZIt2ASf6DSI7AZmpf8tSM+58AhOJevtixw==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr4602313wrn.116.1573156589679; 
	Thu, 07 Nov 2019 11:56:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 4sm3435077wmd.33.2019.11.07.11.56.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 11:56:29 -0800 (PST)
Message-ID: <aca1a1055045400868ae856a310a712d67a310e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Nov 2019 19:56:27 +0000
In-Reply-To: <1573089163-24874-1-git-send-email-denis@denix.org>
References: <1573089163-24874-1-git-send-email-denis@denix.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] buildhistory: fix "version went backwards" QA error message
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
X-List-Received-Date: Thu, 07 Nov 2019 19:56:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-06 at 20:12 -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Fix parentheses placement in the message from:
> Package version for package X went backwards which would break package feeds from (Y to Z)
> to this one:
> Package version for package X went backwards which would break package feeds (from Y to Z)
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

I did really appreciate that you fixed the test in the commit, however
the autobuilder disagrees:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/470

:/.

Cheers,

Richard


